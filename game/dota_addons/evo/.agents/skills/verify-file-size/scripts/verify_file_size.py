import argparse
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
CONTENT_ROOT = ROOT.parents[2] / "content" / "dota_addons" / "evo"
TARGETS = [
    (ROOT, ROOT / "src", {".ts", ".css"}),
    (ROOT, ROOT / "tools", {".py"}),
    (CONTENT_ROOT, CONTENT_ROOT / "panorama" / "layout", {".xml"}),
    (CONTENT_ROOT, CONTENT_ROOT / "panorama" / "styles", {".css"}),
]


def count_lines(path: pathlib.Path) -> int:
    return len(path.read_text(encoding="utf-8", errors="ignore").splitlines())


def main() -> int:
    parser = argparse.ArgumentParser(description="Verify source files stay within line limit.")
    parser.add_argument("--max-lines", type=int, default=500)
    args = parser.parse_args()

    violations: list[tuple[int, str]] = []
    checked = 0
    for display_root, base_dir, exts in TARGETS:
        if not base_dir.exists():
            continue
        for path in sorted(base_dir.rglob("*")):
            if not path.is_file() or path.suffix.lower() not in exts:
                continue
            checked += 1
            lines = count_lines(path)
            if lines > args.max_lines:
                rel = path.relative_to(display_root).as_posix()
                prefix = "content/" if display_root == CONTENT_ROOT else ""
                violations.append((lines, f"{prefix}{rel}"))

    if violations:
        violations.sort(key=lambda item: (-item[0], item[1]))
        print(f"FAIL: {len(violations)} file(s) exceed {args.max_lines} lines across {checked} file(s):")
        for lines, rel in violations:
            print(f"  {rel}: {lines} lines")
        return 1

    print(f"OK: 0 files exceed {args.max_lines} lines across {checked} file(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
