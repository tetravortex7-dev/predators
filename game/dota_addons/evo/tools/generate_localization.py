import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LOC_DIR = os.path.join(ROOT, "data", "localization")
RU_OUT = os.path.join(ROOT, "resource", "addon_russian.txt")
EN_OUT = os.path.join(ROOT, "resource", "addon_english.txt")


def escape_kv(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"').replace("\r\n", "\\n").replace("\n", "\\n")


def write_lang_file(path: str, language: str, tokens: dict) -> None:
    lines = [
        '"lang"',
        "{",
        f'\t"Language"\t\t"{language}"',
        '\t"Tokens"',
        "\t{",
    ]
    for key, val in tokens.items():
        escaped = escape_kv(str(val))
        lines.append(f'\t\t"{key}"\t\t"{escaped}"')
    lines.append("\t}")
    lines.append("}")
    lines.append("")
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines))


def main() -> None:
    if not os.path.isdir(LOC_DIR):
        raise RuntimeError(f"Missing localization directory: {LOC_DIR}")

    files = sorted(f for f in os.listdir(LOC_DIR) if f.endswith(".json") and not f.startswith("_"))
    ru_tokens = {}
    en_tokens = {}

    for fname in files:
        fpath = os.path.join(LOC_DIR, fname)
        with open(fpath, "r", encoding="utf-8") as f:
            data = json.load(f)
        if not isinstance(data, dict):
            raise ValueError(f"{fname} must be a JSON object of token -> {{ru, en}}")
        for key, entry in data.items():
            if not isinstance(entry, dict):
                raise ValueError(f"Token '{key}' in {fname} must be an object with 'ru'/'en'")
            if "ru" in entry and entry["ru"] is not None:
                ru_tokens[key] = entry["ru"]
            if "en" in entry and entry["en"] is not None:
                en_tokens[key] = entry["en"]

    write_lang_file(RU_OUT, "Russian", ru_tokens)
    write_lang_file(EN_OUT, "English", en_tokens)
    print(f"[Evo] Generated localization from {len(files)} file(s): {len(ru_tokens)} RU, {len(en_tokens)} EN tokens.")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"[Evo] Localization generation failed: {exc}", file=sys.stderr)
        sys.exit(1)
