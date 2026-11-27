import argparse
import glob
import json
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from ref.vpk_io import parse_kv_blocks  # noqa: E402

SKIP_DEFAULT_FILES = {"items.json", "ui.json", "talents.json"}
TIER_SPOILER_RE = re.compile(r"\bT[1-4]\b|\bТ[1-4]\b|\[[QWEDFR]\]")
TAG_SPLIT_RE = re.compile(
    r"(<h1\b[^>]*>.*?</h1>|<font\b[^>]*>.*?</font>|<b>.*?</b>|<span\b[^>]*>.*?</span>|<br\s*/?>)",
    re.IGNORECASE | re.DOTALL,
)
SECTION_RE = re.compile(
    r"(?:^|\n\n|<br><br>)\s*((?:Активно|Пассивно|Переключаемое|Использование|Active|Passive|Toggle|Use)\s*:\s*[^<\n.!?]+?(?=\s{2,}|\n|[A-ZА-ЯЁ%]))",
    re.MULTILINE,
)
SECTION_LINE_RE = re.compile(
    r"(?:^|<br><br>|\n\n)\s*((?:Активно|Пассивно|Переключаемое|Использование|Active|Passive|Toggle|Use)\s*:[^\n<]{1,60})(?:\n|<br>|\s{2,})",
)
DISPEL_RE = re.compile(
    r"(Тип развеивания|Dispel Type)\s*:(?!\s*<span)\s*([^<\n.]+)",
    re.IGNORECASE,
)

WB = r"(?<![А-Яа-яЁёA-Za-z0-9_])"
WE = r"(?![А-Яа-яЁёA-Za-z0-9_])"

COLOR_RULES: list[tuple[re.Pattern[str], str]] = [
    (
        re.compile(
            rf"{WB}(?:Pure\s+damage|pure\s+damage|pure\s+cleave|ALL\s+attributes|All\s+Attributes|Universal|"
            rf"чист(?:ого|ому|ым|ый)\s+(?:прорубающ\w+\s+)?урон[ауе]?|всех?\s+атрибут\w*|универсал\w*){WE}",
            re.IGNORECASE,
        ),
        "#d8ae53",
    ),
    (
        re.compile(
            rf"{WB}(?:Agility|AGI|evasion|lifesteal|vs\s+creeps|heal(?:ing)?|"
            rf"ловкост[иью]|уклонени[яюе]|вампиризм\w*|яд(?:а|у|ом|е)?|по\s+крипам|лечени[яюе]|×[\d.]+\s+(?:по\s+крипам|vs\s+creeps)){WE}",
            re.IGNORECASE,
        ),
        "#9acd32",
    ),
    (
        re.compile(
            rf"{WB}(?:Strength|STR|physical\s+damage|max\s+HP|Max\s+Health|"
            rf"сил[аыуео]|физическ(?:ого|ому|им|ий)\s+урон[ауе]?|физ\.\s+урон[ауе]?|макс(?:имального)?\s+(?:здоровь[яю]|HP)){WE}",
            re.IGNORECASE,
        ),
        "#e03e2e",
    ),
    (
        re.compile(
            rf"{WB}(?:Intelligence|INT|magical?\s+damage|Mana(?:\s+Regen)?|Magic\s+Resistance|Spell\s+Amp\w*|"
            rf"интеллект[ауе]?|магическ(?:ого|ому|им|ий)\s+урон[ауе]?|маг\.\s+урон[ауе]?|ман[аыуе]|сопротивлени[яюе]\s+магии){WE}",
            re.IGNORECASE,
        ),
        "#87ceeb",
    ),
    (
        re.compile(
            rf"{WB}(?:stuns?|stunned|roots?|rooted|silences?|silenced|slows?|slowed|leashes?|tethers?|disarms?|"
            rf"оглуша\w+|оглушени\w+|обездвижива\w+|обездвижен\w+|безмолви\w+|замедля\w+|замедлени\w+|обезоружива\w+){WE}",
            re.IGNORECASE,
        ),
        "#7998b5",
    ),
]

BOLD_RE = re.compile(
    rf"{WB}(?:True\s+Strike|Strong\s+Dispel|Basic\s+Dispel|phased\s+movement|unobstructed\s+(?:movement|pathing)|"
    rf"прохождени[еяю]\s+сквозь\s+(?:существ|юнитов|препятствия)|свободн(?:ое|ого)\s+передвижени[еяю]|сильн\w+\s+развеивани\w+){WE}",
    re.IGNORECASE,
)
PAREN_RE = re.compile(r"(\([^()<%]{3,65}\))")


def load_kv_ability_values() -> dict[str, set[str]]:
    kv_paths = glob.glob(os.path.join(ROOT, "scripts", "npc", "abilities", "*.txt")) + [
        os.path.join(ROOT, "scripts", "npc", "npc_abilities_override.txt"),
        os.path.join(ROOT, "scripts", "npc", "units", "bosses", "evo_boss_elasmyr_abilities.txt"),
    ]
    result: dict[str, set[str]] = {}
    for p in kv_paths:
        if not os.path.isfile(p):
            continue
        with open(p, "r", encoding="utf-8") as f:
            parsed = parse_kv_blocks(f.read())
        abilities = parsed.get("DOTAAbilities", {})
        if not isinstance(abilities, dict):
            continue
        for ab_name, block in abilities.items():
            if not isinstance(block, dict):
                continue
            av = block.get("AbilityValues", {})
            keys = set(av.keys()) if isinstance(av, dict) else set()
            keys.update({"cooldown", "manacost", "cast_range"})
            result[ab_name] = keys
    return result


def is_stat_row_key(key: str) -> bool:
    if not key.startswith("DOTA_Tooltip_ability_"):
        return False
    if re.search(r"(_Description|_Lore|_Note\d+|_Facet_\w+|_Shard_\w+|_Scepter_\w+)$", key):
        return False
    return True


def format_plain_segment(seg: str) -> str:
    if not seg:
        return seg
    out = seg
    out = PAREN_RE.sub(lambda m: f"<font color='#7d7d7d'>{m.group(1)}</font>", out)

    parts = TAG_SPLIT_RE.split(out)
    rebuilt: list[str] = []
    for part in parts:
        if not part or part.startswith("<"):
            rebuilt.append(part)
            continue
        cur = BOLD_RE.sub(lambda m: f"<b>{m.group(0)}</b>", part)
        subparts = TAG_SPLIT_RE.split(cur)
        colored: list[str] = []
        for sp in subparts:
            if not sp or sp.startswith("<"):
                colored.append(sp)
                continue
            txt = sp
            for pattern, hex_color in COLOR_RULES:
                chunks = TAG_SPLIT_RE.split(txt)
                next_chunks: list[str] = []
                for ch in chunks:
                    if not ch or ch.startswith("<"):
                        next_chunks.append(ch)
                    else:
                        next_chunks.append(
                            pattern.sub(lambda m, c=hex_color: f"<font color='{c}'>{m.group(0)}</font>", ch)
                        )
                txt = "".join(next_chunks)
            colored.append(txt)
        rebuilt.append("".join(colored))
    return "".join(rebuilt)


def format_description(text: str) -> str:
    if not text or not text.strip():
        return text
    out = text.replace("\r\n", "\n").strip()
    out = re.sub(r"\n{2,}", "<br><br>", out)
    out = out.replace("\n", "<br><br>")

    def wrap_section(m: re.Match[str]) -> str:
        prefix = "<br><br>" if m.start() > 0 else ""
        return f"{prefix}<h1>{m.group(1).strip()}</h1>"

    out = SECTION_LINE_RE.sub(wrap_section, out)
    out = DISPEL_RE.sub(
        lambda m: f'{m.group(1)}: <span class="GameplayValues GameplayVariable">{m.group(2).strip()}</span>',
        out,
    )
    out = re.sub(r"(?<!<br><br>)\s+(Тип развеивания:|Dispel Type:)", r"<br><br>\1", out)
    out = re.sub(r"^(<br>)+", "", out)
    out = re.sub(r"(<br>){3,}", "<br><br>", out)

    segments = TAG_SPLIT_RE.split(out)
    return "".join(seg if (not seg or seg.startswith("<")) else format_plain_segment(seg) for seg in segments)


def format_stat_label(label: str) -> str:
    clean = label.strip()
    if not clean:
        return clean
    if not clean.endswith(":"):
        clean += ":"
    return clean.upper()


def apply_file(path: str, key_prefixes: list[str] | None, dry_run: bool) -> int:
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, dict):
        raise ValueError(f"{path} must be a JSON object")

    changed = 0
    for key, entry in data.items():
        if not isinstance(entry, dict):
            continue
        if key_prefixes and not any(
            key.startswith(f"DOTA_Tooltip_ability_{p}") or key.startswith(f"DOTA_Tooltip_modifier_{p}")
            for p in key_prefixes
        ):
            continue

        is_desc = key.endswith("_Description") and (
            key.startswith("DOTA_Tooltip_ability_") or key.startswith("DOTA_Tooltip_modifier_")
        )
        is_note = bool(re.search(r"_Note\d+$", key)) and key.startswith("DOTA_Tooltip_ability_")
        is_stat = is_stat_row_key(key) and ("_Description" not in key)

        for lang in ("ru", "en"):
            val = entry.get(lang)
            if not isinstance(val, str):
                continue
            new_val = val
            if is_desc or is_note:
                new_val = format_description(val)
            elif is_stat and any(ch in val for ch in (":", " ")):
                ab_prefix = key[len("DOTA_Tooltip_ability_") :]
                if f"DOTA_Tooltip_ability_{ab_prefix}_Description" not in data:
                    new_val = format_stat_label(val)
            if new_val != val:
                entry[lang] = new_val
                changed += 1

    if changed > 0 and not dry_run:
        with open(path, "w", encoding="utf-8", newline="\n") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")

    mode = "DRY-RUN" if dry_run else "APPLIED"
    print(f"[valve-tooltip-format] {mode} {os.path.basename(path)}: {changed} field(s) updated.")
    return changed


def check_files(files: list[str], ab_vals: dict[str, set[str]]) -> list[str]:
    errors: list[str] = []
    for path in files:
        fname = os.path.basename(path)
        try:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
        except Exception as exc:
            errors.append(f"{fname}: invalid JSON ({exc})")
            continue

        if not isinstance(data, dict):
            errors.append(f"{fname}: top-level JSON is not an object")
            continue

        for key, entry in data.items():
            if not isinstance(entry, dict):
                continue
            is_ability_key = key.startswith("DOTA_Tooltip_ability_")
            is_mod_key = key.startswith("DOTA_Tooltip_modifier_")
            is_desc = key.endswith("_Description") and (is_ability_key or is_mod_key)
            is_note = bool(re.search(r"_Note\d+$", key)) and is_ability_key

            for lang in ("ru", "en"):
                txt = entry.get(lang)
                if not isinstance(txt, str):
                    continue
                if (is_ability_key or is_mod_key) and TIER_SPOILER_RE.search(txt):
                    errors.append(f"{fname} {key}[{lang}]: tier/hotkey spoiler found")
                for tag in ("h1", "b", "font", "span"):
                    opens = len(re.findall(rf"<{tag}(?:\s[^>]*)?>", txt))
                    closes = len(re.findall(rf"</{tag}>", txt))
                    if opens != closes:
                        errors.append(f"{fname} {key}[{lang}]: unbalanced <{tag}> ({opens} vs {closes})")
                if is_desc and not any(m in txt for m in ("<font", "<b>", "<h1>", "<br><br>", "%dMODIFIER_PROPERTY_")):
                    if len(txt) > 65:
                        errors.append(f"{fname} {key}[{lang}]: missing Valve-style HTML formatting")
                if is_desc or is_note:
                    base = re.sub(r"(_Description|_Note\d+)$", "", key)
                    if is_ability_key:
                        ab_name = base[len("DOTA_Tooltip_ability_") :]
                        if ab_name in ab_vals:
                            for var in re.findall(r"%([a-zA-Z0-9_]+)%", txt.replace("%%", "")):
                                if var not in ab_vals[ab_name]:
                                    errors.append(f"{fname} {key}[{lang}]: unknown %{var}% (not in {ab_name} KV)")
            if is_stat_row_key(key):
                ru_val = entry.get("ru", "")
                en_val = entry.get("en", "")
                for ab_name in ab_vals:
                    prefix = f"DOTA_Tooltip_ability_{ab_name}_"
                    if key.startswith(prefix):
                        suffix = key[len(prefix) :]
                        if suffix in ab_vals[ab_name]:
                            for lang, val in (("ru", ru_val), ("en", en_val)):
                                if isinstance(val, str) and (val != val.upper() or not val.endswith(":")):
                                    errors.append(f"{fname} {key}[{lang}]: stat row must be UPPERCASE: -> '{val}'")
                        break
    return errors


def main() -> None:
    parser = argparse.ArgumentParser(description="Valve-style Dota 2 tooltip formatter and checker.")
    parser.add_argument("--check", action="store_true", help="Audit localization JSONs.")
    parser.add_argument("--apply", action="store_true", help="Apply Valve-style formatting to target file.")
    parser.add_argument("--file", type=str, help="Target localization JSON file (relative to evo root or abs).")
    parser.add_argument("--keys", type=str, help="Comma-separated ability/modifier name prefixes for --apply.")
    parser.add_argument("--include-items", action="store_true", help="Include items.json in --check.")
    parser.add_argument("--dry-run", action="store_true", help="Preview --apply changes without writing.")
    args = parser.parse_args()

    if not args.check and not args.apply:
        args.check = True

    if args.apply:
        if not args.file:
            raise SystemExit("--apply requires --file <path>")
        target = args.file if os.path.isabs(args.file) else os.path.join(ROOT, args.file)
        prefixes = [s.strip() for s in args.keys.split(",") if s.strip()] if args.keys else None
        apply_file(target, prefixes, args.dry_run)

    if args.check:
        loc_dir = os.path.join(ROOT, "data", "localization")
        if args.file:
            target = args.file if os.path.isabs(args.file) else os.path.join(ROOT, args.file)
            files = [target]
        else:
            files = sorted(
                p
                for p in glob.glob(os.path.join(loc_dir, "*.json"))
                if os.path.basename(p) not in SKIP_DEFAULT_FILES or (args.include_items and os.path.basename(p) == "items.json")
            )
        ab_vals = load_kv_ability_values()
        errors = check_files(files, ab_vals)
        if errors:
            print(f"[valve-tooltip-format] FAIL: {len(errors)} issue(s) across {len(files)} file(s):")
            for err in errors:
                print(f"  - {err}")
            sys.exit(1)
        print(f"OK: {len(files)} localization file(s) passed Valve-style tooltip check.")


if __name__ == "__main__":
    main()
