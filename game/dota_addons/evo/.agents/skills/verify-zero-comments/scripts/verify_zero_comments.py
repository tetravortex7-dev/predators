import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
TARGETS = [
    (ROOT / "src", {".ts", ".css"}),
    (ROOT / "scripts" / "npc", {".txt"}),
]


def find_comment_lines(text: str, ext: str) -> list[int]:
    hits: list[int] = []
    in_block = False
    for line_no, line in enumerate(text.splitlines(), start=1):
        i = 0
        n = len(line)
        in_str: str | None = None
        found = False
        while i < n:
            ch = line[i]
            nxt = line[i + 1] if i + 1 < n else ""
            if in_block:
                found = True
                if ch == "*" and nxt == "/":
                    in_block = False
                    i += 2
                    continue
                i += 1
                continue
            if in_str is not None:
                if ch == "\\" and i + 1 < n:
                    i += 2
                    continue
                if ch == in_str:
                    in_str = None
                i += 1
                continue
            if ch in ('"', "'", "`"):
                in_str = ch
                i += 1
                continue
            if ch == "/" and nxt == "/":
                found = True
                break
            if ch == "/" and nxt == "*":
                found = True
                in_block = True
                i += 2
                continue
            i += 1
        if found:
            hits.append(line_no)
    return hits


def main() -> int:
    violations: list[str] = []
    checked = 0
    for base_dir, exts in TARGETS:
        if not base_dir.exists():
            continue
        for path in sorted(base_dir.rglob("*")):
            if not path.is_file() or path.suffix.lower() not in exts:
                continue
            checked += 1
            text = path.read_text(encoding="utf-8", errors="ignore")
            for line_no in find_comment_lines(text, path.suffix.lower()):
                rel = path.relative_to(ROOT).as_posix()
                violations.append(f"{rel}:{line_no}")

    if violations:
        print(f"FAIL: {len(violations)} comment(s) found across {checked} file(s):")
        for item in violations:
            print(f"  {item}")
        return 1

    print(f"OK: 0 comments across {checked} file(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
