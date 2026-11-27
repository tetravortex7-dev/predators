import argparse
import pathlib
import shutil
import subprocess
import sys

GAME_ROOT = pathlib.Path(__file__).resolve().parents[4]
SRC_DIR = GAME_ROOT / "src" / "vscripts"
LUA_DIR = GAME_ROOT / "scripts" / "vscripts"
GAMEMODE_TS = SRC_DIR / "GameMode.ts"
DEV_SRC_DIR = SRC_DIR / "dev"
DEV_CHEATS_TS = DEV_SRC_DIR / "DevCheats.ts"
DEV_LUA_DIR = LUA_DIR / "dev"
BACKUP_DIR = GAME_ROOT / ".prod_cheat_backup"

GAMEMODE_DEV_LINES = (
    'import { DevCheats } from "./dev/DevCheats";',
    "    public readonly devCheats: DevCheats;",
    "        this.devCheats = new DevCheats(this.eventBus, this.levelingManager);",
    "        this.devCheats.init();",
)


def run_cmd(cmd: list[str]) -> int:
    res = subprocess.run(cmd, cwd=str(GAME_ROOT))
    return res.returncode


def run_build_and_verify() -> int:
    if run_cmd(["npm.cmd", "run", "build:vscripts"]) != 0:
        return 1
    for verifier in (
        ".agents/skills/verify-zero-comments/scripts/verify_zero_comments.py",
        ".agents/skills/verify-modifier-loc/scripts/verify_modifier_loc.py",
        ".agents/skills/verify-file-size/scripts/verify_file_size.py",
    ):
        if run_cmd([sys.executable, verifier]) != 0:
            return 1
    return 0


def scan_devcheats_refs() -> list[str]:
    hits: list[str] = []
    for base, pat in ((SRC_DIR, "*.ts"), (LUA_DIR, "*.lua")):
        if not base.exists():
            continue
        for f in base.rglob(pat):
            txt = f.read_text(encoding="utf-8", errors="ignore")
            if "DevCheats" in txt or "dev/DevCheats" in txt:
                hits.append(str(f.relative_to(GAME_ROOT)))
    return hits


def strip_for_prod(dry_run: bool) -> int:
    if not GAMEMODE_TS.exists():
        print(f"Missing {GAMEMODE_TS}", file=sys.stderr)
        return 1

    gm_text = GAMEMODE_TS.read_text(encoding="utf-8")
    gm_lines = gm_text.splitlines()
    filtered = [ln for ln in gm_lines if ln.rstrip("\r") not in GAMEMODE_DEV_LINES]
    removed_count = len(gm_lines) - len(filtered)

    if dry_run:
        print(f"DRY-RUN: would remove {removed_count} line(s) from GameMode.ts; DevCheats.ts exists={DEV_CHEATS_TS.exists()}; refs={scan_devcheats_refs()}")
        return 0

    BACKUP_DIR.mkdir(parents=True, exist_ok=True)
    if DEV_CHEATS_TS.exists():
        shutil.copy2(DEV_CHEATS_TS, BACKUP_DIR / "DevCheats.ts")
        if removed_count > 0:
            (BACKUP_DIR / "GameMode.ts").write_text(gm_text, encoding="utf-8")

    if removed_count > 0:
        GAMEMODE_TS.write_text("\n".join(filtered) + ("\n" if gm_text.endswith("\n") else ""), encoding="utf-8")

    if DEV_SRC_DIR.exists():
        shutil.rmtree(DEV_SRC_DIR)
    if DEV_LUA_DIR.exists():
        shutil.rmtree(DEV_LUA_DIR)

    if run_build_and_verify() != 0:
        return 1

    if DEV_LUA_DIR.exists():
        shutil.rmtree(DEV_LUA_DIR)

    leftover = scan_devcheats_refs()
    if leftover:
        print(f"ERROR: leftover DevCheats references: {leftover}", file=sys.stderr)
        return 1

    print(f"OK (prod-ready): removed {removed_count} GameMode line(s), stripped DevCheats TS+Lua, verified 0 cheat references.")
    return 0


def restore_dev() -> int:
    src_bak = BACKUP_DIR / "DevCheats.ts"
    gm_bak = BACKUP_DIR / "GameMode.ts"
    if not src_bak.exists() or not gm_bak.exists():
        print("Backup not found in .prod_cheat_backup/. Use git restore if needed.", file=sys.stderr)
        return 1
    DEV_SRC_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src_bak, DEV_CHEATS_TS)
    shutil.copy2(gm_bak, GAMEMODE_TS)
    if run_build_and_verify() != 0:
        return 1
    print("OK (dev-restored): DevCheats.ts + GameMode.ts restored and rebuilt.")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Strip or restore DevCheats for prod releases.")
    parser.add_argument("--restore", action="store_true", help="Restore DevCheats from .prod_cheat_backup/")
    parser.add_argument("--dry-run", action="store_true", help="Preview changes without modifying files")
    args = parser.parse_args()
    return restore_dev() if args.restore else strip_for_prod(args.dry_run)


if __name__ == "__main__":
    sys.exit(main())
