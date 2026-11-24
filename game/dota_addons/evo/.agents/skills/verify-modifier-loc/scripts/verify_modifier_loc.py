import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))
SRC = os.path.join(ROOT, "src", "vscripts")
RU_PATH = os.path.join(ROOT, "resource", "addon_russian.txt")
EN_PATH = os.path.join(ROOT, "resource", "addon_english.txt")


def main() -> int:
    with open(RU_PATH, encoding="utf-8") as f:
        ru_text = f.read()
    with open(EN_PATH, encoding="utf-8") as f:
        en_text = f.read()

    visible_mods = []
    for dirpath, _, filenames in os.walk(SRC):
        for fn in filenames:
            if not fn.endswith(".ts"):
                continue
            path = os.path.join(dirpath, fn)
            with open(path, encoding="utf-8") as f:
                txt = f.read()
            for m in re.finditer(r'@registerModifier\("([^"]+)"\)\s*export class \w+ extends [^{]+\{', txt):
                name = m.group(1)
                header = m.group(0)
                if "extends BaseTalentModifier" in header or "extends BaseCreepAuraEmitter" in header:
                    continue
                body = txt[m.end():m.end() + 700]
                if re.search(r'(?:public\s+)?IsHidden\(\)\s*:\s*boolean\s*\{\s*return\s+true\s*;', body):
                    continue
                visible_mods.append((name, os.path.relpath(path, ROOT)))

    unique_mods = sorted(set(visible_mods))
    missing = []
    for name, rel in unique_mods:
        t_key = f'"DOTA_Tooltip_{name}"'
        d_key = f'"DOTA_Tooltip_{name}_Description"'
        miss = []
        if t_key not in ru_text:
            miss.append("RU_title")
        if d_key not in ru_text:
            miss.append("RU_desc")
        if t_key not in en_text:
            miss.append("EN_title")
        if d_key not in en_text:
            miss.append("EN_desc")
        if miss:
            missing.append((name, rel, miss))

    if missing:
        print(f"FAIL: {len(missing)} visible modifier(s) missing localization:")
        for name, rel, miss in missing:
            print(f"  {name} ({rel}): {', '.join(miss)}")
        return 1

    print(f"OK: {len(unique_mods)} visible modifier(s) verified in RU & EN.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
