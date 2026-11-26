import argparse
import os
import pathlib
import re
import struct
import subprocess
import sys
import tempfile

VPK_DIR = r"C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota\pak01_dir.vpk"
RESOURCEINFO = r"C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\resourceinfo.exe"


def build_vpk_index(vpk_path: str) -> dict[str, tuple[int, int, int, bytes]]:
    index: dict[str, tuple[int, int, int, bytes]] = {}
    with open(vpk_path, "rb") as f:
        sig, ver, _tree_sz = struct.unpack("<III", f.read(12))
        if sig != 0x55AA1234:
            raise RuntimeError(f"Invalid VPK signature: {sig:#x}")
        f.seek(28 if ver == 2 else 12)

        def rstr() -> str:
            buf = bytearray()
            while True:
                c = f.read(1)
                if not c or c == b"\x00":
                    return buf.decode("utf-8", "ignore")
                buf += c

        while True:
            ext = rstr()
            if not ext:
                break
            while True:
                path = rstr()
                if not path:
                    break
                while True:
                    name = rstr()
                    if not name:
                        break
                    _crc, pre_sz, arch, off, sz, _term = struct.unpack("<IHHIIH", f.read(18))
                    pre = f.read(pre_sz) if pre_sz else b""
                    if ext == "vpcf_c":
                        index[f"{path}/{name}.{ext}"] = (arch, off, sz, pre)
    return index


def read_vpk_entry(game_dir: str, entry: tuple[int, int, int, bytes]) -> bytes:
    arch, off, sz, pre = entry
    with open(os.path.join(game_dir, f"pak01_{arch:03d}.vpk"), "rb") as af:
        af.seek(off)
        return pre + af.read(sz)


def decode_vpcf(game_dir: str, raw: bytes, tmp_dir: str, label: str) -> str:
    tmp_file = os.path.join(tmp_dir, label)
    pathlib.Path(tmp_file).write_bytes(raw)
    res = subprocess.run(
        [RESOURCEINFO, "-game", game_dir, "-i", tmp_file, "-b", "DATA", "-baremode"],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="ignore",
    )
    return res.stdout


def summarize_kv3(kv_text: str) -> dict[str, object]:
    cps = sorted(set(re.findall(r"(?:m_nControlPoint\w*|m_iControlPoint|m_nStartCP|m_nEndCP|m_nOverrideCP)\s*=\s*(\d+)", kv_text)))
    children = re.findall(r'm_ChildRef\s*=\s*resource:"([^"]+)"', kv_text)
    textures = sorted(set(re.findall(r'resource:"(materials/[^"]+\.vtex)"', kv_text)))
    return {"cps": cps, "children": children, "textures": textures}


def main() -> int:
    parser = argparse.ArgumentParser(description="Extract and decompile .vpcf_c (+ optional children) from Dota 2 VPK.")
    parser.add_argument("target", help="Exact particles/... path (.vpcf or .vpcf_c) or substring to search")
    parser.add_argument("--children", action="store_true", help="Also extract referenced m_ChildRef .vpcf files")
    parser.add_argument("--out", help="Directory to write decoded .vpcf files instead of printing full KV3")
    parser.add_argument("--list-only", action="store_true", help="Only list matching paths in VPK")
    args = parser.parse_args()

    game_dir = os.path.dirname(VPK_DIR)
    index = build_vpk_index(VPK_DIR)

    query = args.target.replace("\\", "/").strip()
    exact_key = query if query.endswith(".vpcf_c") else (query + "_c" if query.endswith(".vpcf") else "")
    matches = [exact_key] if exact_key in index else sorted(k for k in index if query.lower() in k.lower())

    if not matches:
        print(f"No .vpcf_c matches for: {query}", file=sys.stderr)
        return 1

    if args.list_only or len(matches) > 1 and not exact_key:
        print(f"Matched {len(matches)} particle(s):")
        for m in matches[:40]:
            print(" ", m[:-2])
        if len(matches) > 40:
            print(f"  ... (+{len(matches) - 40} more)")
        if not args.out:
            return 0

    root_key = matches[0]
    queue = [root_key]
    seen: set[str] = set()
    out_dir = pathlib.Path(args.out) if args.out else None
    if out_dir:
        out_dir.mkdir(parents=True, exist_ok=True)

    with tempfile.TemporaryDirectory() as tmp_dir:
        idx = 0
        while queue:
            cur = queue.pop(0)
            if cur in seen or cur not in index:
                continue
            seen.add(cur)
            raw = read_vpk_entry(game_dir, index[cur])
            kv_text = decode_vpcf(game_dir, raw, tmp_dir, f"{idx}_{os.path.basename(cur)}")
            idx += 1
            info = summarize_kv3(kv_text)
            print(f"=== {cur[:-2]} ===")
            print(f"  CPs: {info['cps']} | Textures: {info['textures']} | Children: {len(info['children'])}")
            if args.children:
                for ch in info["children"]:
                    ch_key = ch + "_c" if ch.endswith(".vpcf") else ch
                    if ch_key not in seen:
                        queue.append(ch_key)
            if out_dir:
                header = "<!-- kv3 encoding:text:version{e21c7f3c-8a33-41c5-9977-a76d3a32aa0d} format:generic:version{7412167c-06e9-4698-aff2-e63eb59037e7} -->\n"
                dest = out_dir / os.path.basename(cur[:-2])
                dest.write_text(header + kv_text, encoding="utf-8")
                print(f"  Wrote: {dest}")
            elif cur == root_key or args.children:
                print(kv_text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
