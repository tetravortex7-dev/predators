import json
import os
import pathlib
import struct
import subprocess
import tempfile
from collections import defaultdict
from concurrent.futures import ThreadPoolExecutor

VPK_DIR = r"C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota\pak01_dir.vpk"
GAME_DIR = os.path.dirname(VPK_DIR)
RESOURCEINFO = r"C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\resourceinfo.exe"


def parse_kv_blocks(text: str) -> dict[str, object]:
    """Parse Valve KV1 text (ignoring comments and #base directives) into nested dicts."""
    n = len(text)
    i = 0

    def skip_ws_comments() -> None:
        nonlocal i
        while i < n:
            ch = text[i]
            if ch in " \t\r\n":
                i += 1
            elif ch == "/" and i + 1 < n and text[i + 1] == "/":
                nl = text.find("\n", i)
                i = n if nl == -1 else nl + 1
            else:
                break

    def read_token() -> tuple[str | None, bool]:
        nonlocal i
        skip_ws_comments()
        if i >= n:
            return None, False
        ch = text[i]
        if ch in "{}":
            i += 1
            return ch, False
        if ch == '"':
            i += 1
            out: list[str] = []
            while i < n:
                c = text[i]
                if c == "\\" and i + 1 < n:
                    nxt = text[i + 1]
                    if nxt in ('"', "\\"):
                        out.append(nxt)
                        i += 2
                        continue
                if c == '"':
                    i += 1
                    return "".join(out), True
                out.append(c)
                i += 1
            return "".join(out), True
        start = i
        while i < n and text[i] not in ' \t\r\n{}"':
            if text[i] == "/" and i + 1 < n and text[i + 1] == "/":
                break
            i += 1
        return text[start:i], False

    def merge_kv(dst: dict, k: str, v: object) -> None:
        if k in dst and isinstance(dst[k], dict) and isinstance(v, dict):
            for sk, sv in v.items():
                merge_kv(dst[k], sk, sv)
        else:
            dst[k] = v

    def parse_map() -> dict[str, object]:
        result: dict[str, object] = {}
        while True:
            tok, quoted = read_token()
            if tok is None or tok == "}":
                return result
            if not quoted and tok.startswith("#"):
                read_token()
                continue
            nxt, _ = read_token()
            if nxt is None:
                return result
            if nxt == "{":
                merge_kv(result, tok, parse_map())
            else:
                merge_kv(result, tok, nxt)

    root: dict[str, object] = {}
    while True:
        tok, quoted = read_token()
        if tok is None:
            break
        if not quoted and tok.startswith("#"):
            read_token()
            continue
        nxt, _ = read_token()
        if nxt == "{":
            merge_kv(root, tok, parse_map())
    return root


def scan_vpk() -> tuple[dict[str, tuple[int, int, int, bytes]], dict[str, list[str]]]:
    """Scan pak01_dir.vpk and return byte offsets for selected files plus asset lists."""
    entries: dict[str, tuple[int, int, int, bytes]] = {}
    lists: dict[str, list[str]] = defaultdict(list)

    with open(VPK_DIR, "rb") as f:
        sig, ver, _tree = struct.unpack("<III", f.read(12))
        if sig != 0x55AA1234:
            raise RuntimeError(f"Bad VPK signature: {sig:#x}")
        f.seek(28 if ver == 2 else 12)

        def rs() -> str:
            b = bytearray()
            while True:
                c = f.read(1)
                if not c or c == b"\x00":
                    return b.decode("utf-8", "ignore")
                b += c

        while True:
            ext = rs()
            if not ext:
                break
            while True:
                path = rs()
                if not path:
                    break
                while True:
                    name = rs()
                    if not name:
                        break
                    _crc, pre_sz, arch, off, sz, _term = struct.unpack("<IHHIIH", f.read(18))
                    pre = f.read(pre_sz) if pre_sz else b""
                    full = f"{path}/{name}.{ext}"
                    meta = (arch, off, sz, pre)
                    if ext == "vsndevts_c" and not path.startswith(("soundevents/teamfandom", "soundevents/team_fandom", "soundevents/stickers")):
                        if not path.startswith("soundevents/music/") or "stingers" in name:
                            entries[full] = meta
                            lists["soundevents"].append(full)
                    elif ext == "txt" and (
                        full in ("scripts/npc/npc_abilities.txt", "scripts/npc/items.txt", "scripts/npc/neutral_items.txt", "scripts/items/items_game.txt")
                        or path == "scripts/npc/heroes"
                    ):
                        entries[full] = meta
                        lists["scripts"].append(full)
                    elif ext == "vpcf_c":
                        lists["particles"].append(full[:-2])
                    elif ext == "vtex_c" and path.startswith("materials/particle"):
                        lists["particle_textures"].append(full[:-2])
                    elif path.startswith("panorama/images/spellicons"):
                        lists["spellicons"].append(full)
                    elif path.startswith("panorama/images/items"):
                        lists["itemicons"].append(full)
                    elif path.startswith("panorama/images/hud/reborn"):
                        lists["reborn_hud"].append(full)
    return entries, lists


def read_entry(entry: tuple[int, int, int, bytes]) -> bytes:
    """Read raw file bytes from a VPK data archive."""
    arch, off, sz, pre = entry
    with open(os.path.join(GAME_DIR, f"pak01_{arch:03d}.vpk"), "rb") as af:
        af.seek(off)
        return pre + af.read(sz)


def decode_soundevents(entries: dict[str, tuple[int, int, int, bytes]], sv_paths: list[str]) -> dict[str, str]:
    """Decode compiled .vsndevts_c files to KV3 text using parallel resourceinfo calls."""
    decoded: dict[str, str] = {}
    with tempfile.TemporaryDirectory() as tmp:
        tasks = []
        for idx, full in enumerate(sv_paths):
            fp = os.path.join(tmp, f"{idx}.vsndevts_c")
            pathlib.Path(fp).write_bytes(read_entry(entries[full]))
            tasks.append((full, fp))

        def worker(item: tuple[str, str]) -> tuple[str, str]:
            full, fp = item
            res = subprocess.run(
                [RESOURCEINFO, "-game", GAME_DIR, "-i", fp, "-b", "DATA", "-baremode"],
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="ignore",
            )
            return full, res.stdout

        with ThreadPoolExecutor(max_workers=12) as ex:
            for full, out in ex.map(worker, tasks):
                decoded[full] = out
    return decoded


def write_json(path: pathlib.Path, data: object) -> None:
    """Write formatted UTF-8 JSON file, creating parent directories if needed."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
