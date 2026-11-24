import os
import subprocess
import sys

GAME_ROOT = os.path.dirname(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
)
CONTENT_ROOT = os.path.normpath(os.path.join(GAME_ROOT, "..", "..", "..", "content", "dota_addons", "evo"))
SKIP_DIRS = {"node_modules", ".git", "reference", ".agents"}


def clean_project_outputs() -> int:
    cleaned = 0
    for root_dir in (GAME_ROOT, CONTENT_ROOT):
        if not os.path.isdir(root_dir):
            continue
        for current, dirs, files in os.walk(root_dir):
            dirs[:] = [d for d in dirs if d not in SKIP_DIRS]
            for fname in files:
                lower = fname.lower()
                if lower.endswith(".log") or (
                    lower.endswith(".txt") and ("output" in lower or "build_log" in lower)
                ):
                    fpath = os.path.join(current, fname)
                    with open(fpath, "w", encoding="utf-8", newline="\n") as f:
                        f.write("")
                    cleaned += 1
    return cleaned


def run_quiet_build() -> int:
    proc = subprocess.run(
        ["npm.cmd", "run", "build", "--silent"],
        cwd=GAME_ROOT,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
    )
    if proc.returncode != 0:
        if proc.stdout:
            sys.stdout.write(proc.stdout)
        if proc.stderr:
            sys.stderr.write(proc.stderr)
        return proc.returncode
    return 0


def main() -> int:
    args = set(sys.argv[1:])
    if "--build" in args:
        rc = run_quiet_build()
        if rc != 0:
            clean_project_outputs()
            return rc
    clean_project_outputs()
    return 0


if __name__ == "__main__":
    sys.exit(main())
