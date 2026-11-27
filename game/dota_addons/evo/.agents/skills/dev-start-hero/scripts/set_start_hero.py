import argparse
import json
import pathlib
import re
import subprocess
import sys

GAME_ROOT = pathlib.Path(__file__).resolve().parents[4]
BRANCHES_DIR = GAME_ROOT / "data" / "branches"
CONSTANTS_TS = GAME_ROOT / "src" / "vscripts" / "data" / "game_constants.ts"

RESET_ALIASES = {
    "wisp", "висп", "виспа", "виспу", "amoeba", "амёба", "амеба",
    "reset", "default", "none", "сброс", "сбрось", "обычный", "обычныйстарт",
}

HERO_ALIASES: dict[str, str] = {
    "spectre": "spectre",
    "спектр": "spectre",
    "спектра": "spectre",
    "спектру": "spectre",
    "спектре": "spectre",
    "nyx": "nyx",
    "никс": "nyx",
    "никса": "nyx",
    "никсу": "nyx",
    "slark": "slark",
    "сларк": "slark",
    "сларка": "slark",
    "сларку": "slark",
    "morph": "morphling",
    "morphling": "morphling",
    "морф": "morphling",
    "морфа": "morphling",
    "морфлинг": "morphling",
    "морфлинга": "morphling",
    "bristle": "bristleback",
    "bristleback": "bristleback",
    "бристл": "bristleback",
    "бристла": "bristleback",
    "бристлбек": "bristleback",
    "бристлбека": "bristleback",
    "veno": "venomancer",
    "venom": "venomancer",
    "venomancer": "venomancer",
    "веник": "venomancer",
    "веника": "venomancer",
    "веномансер": "venomancer",
    "веномансера": "venomancer",
}

BRANCH_ALIASES: dict[str, str] = {
    "str": "STR",
    "сила": "STR",
    "agi": "AGI",
    "ловкость": "AGI",
    "ловк": "AGI",
    "int": "INT",
    "инт": "INT",
    "инта": "INT",
    "интеллект": "INT",
    "all": "ALL",
    "уни": "ALL",
    "универсал": "ALL",
}


def load_catalog() -> dict[str, dict]:
    catalog: dict[str, dict] = {}
    for p in sorted(BRANCHES_DIR.glob("*.json")):
        if p.name.startswith("_") or p.name == "starter.json":
            continue
        data = json.loads(p.read_text(encoding="utf-8"))
        key = str(data.get("key", p.stem)).lower()
        stages = [s for s in data.get("stages", []) if s.get("id")]
        if stages:
            catalog[key] = {"hero": data.get("hero", ""), "stages": stages}
    return catalog


def resolve_body_id(catalog: dict[str, dict], query: str, branch: str | None, tier: int | None) -> tuple[str, str]:
    norm = query.strip().lower()
    if norm in RESET_ALIASES:
        return "", "T0 Wisp (default)"

    for data in catalog.values():
        for stage in data["stages"]:
            if stage["id"].lower() == norm:
                return stage["id"], f"{stage['id']} ({stage.get('name_ru', stage['id'])}, T{stage.get('tier_index', 1)})"

    hero_key = HERO_ALIASES.get(norm)
    if not hero_key:
        for k in catalog:
            if norm in k:
                hero_key = k
                break
    if not hero_key or hero_key not in catalog:
        raise ValueError(f"Unknown hero/body '{query}'. Run with --list to see valid options.")

    stages = catalog[hero_key]["stages"]
    if not branch and tier is None:
        t1 = [s for s in stages if s.get("tier_index") == 1]
        picked = t1[0] if t1 else stages[0]
        return picked["id"], f"{picked['id']} ({picked.get('name_ru', picked['id'])}, T{picked.get('tier_index', 1)})"

    candidates = stages
    if branch:
        b_norm = branch.strip().lower()
        attr_match = BRANCH_ALIASES.get(b_norm)
        filtered = [
            s for s in candidates
            if (attr_match and s.get("attr", "").upper() == attr_match)
            or b_norm in s["id"].lower()
            or b_norm in s.get("name_ru", "").lower()
            or b_norm in s.get("name_en", "").lower()
        ]
        if not filtered:
            raise ValueError(f"No branch matching '{branch}' found for '{hero_key}'.")
        candidates = filtered

    target_tier = tier if tier is not None else (2 if branch else 1)
    by_tier = [s for s in candidates if s.get("tier_index") == target_tier]
    picked = by_tier[0] if by_tier else candidates[0]
    return picked["id"], f"{picked['id']} ({picked.get('name_ru', picked['id'])}, T{picked.get('tier_index', 1)})"


def write_override(body_id: str) -> None:
    text = CONSTANTS_TS.read_text(encoding="utf-8")
    pattern = re.compile(r'(DEV_START_BODY_ID:\s*)"[^"]*"')
    if not pattern.search(text):
        raise RuntimeError(f"DEV_START_BODY_ID not found in {CONSTANTS_TS}")
    updated = pattern.sub(rf'\1"{body_id}"', text, count=1)
    CONSTANTS_TS.write_text(updated, encoding="utf-8")


def run_build() -> int:
    clean_script = GAME_ROOT / ".agents" / "skills" / "clean-build-output" / "scripts" / "clean_build_output.py"
    rc = subprocess.run(["npm.cmd", "run", "build:vscripts", "--silent"], cwd=str(GAME_ROOT)).returncode
    if rc != 0:
        return rc
    if clean_script.exists():
        subprocess.run([sys.executable, str(clean_script), "--clean-only"], cwd=str(GAME_ROOT))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Set or reset DEV_START_BODY_ID for instant hero testing.")
    parser.add_argument("target", nargs="?", default="", help="Hero alias, 'reset'/'wisp', or evo_body_* ID.")
    parser.add_argument("--branch", "-b", default=None, help="Branch attr (STR/AGI/INT/ALL) or substring (mirror, bastion, etc.).")
    parser.add_argument("--tier", "-t", type=int, choices=[1, 2, 3, 4], default=None, help="Tier index (1..4).")
    parser.add_argument("--reset", action="store_true", help="Reset start hero back to default T0 Wisp.")
    parser.add_argument("--list", action="store_true", help="List available heroes and branch body IDs.")
    parser.add_argument("--build", action="store_true", help="Compile vscripts after updating.")
    args = parser.parse_args()

    catalog = load_catalog()
    if args.list:
        for key, data in catalog.items():
            print(f"{key} ({data['hero']}):")
            for st in data["stages"]:
                attr = f" [{st['attr']}]" if st.get("attr") else ""
                print(f"  T{st.get('tier_index', 1)}{attr} {st['id']} — {st.get('name_ru', '')}")
        return 0

    query = "reset" if args.reset else args.target
    if not query:
        text = CONSTANTS_TS.read_text(encoding="utf-8")
        m = re.search(r'DEV_START_BODY_ID:\s*"([^"]*)"', text)
        cur = m.group(1) if m else ""
        print(f"Current DEV_START_BODY_ID: {cur or '<default Wisp>'}")
        return 0

    try:
        body_id, label = resolve_body_id(catalog, query, args.branch, args.tier)
    except ValueError as err:
        print(f"ERR: {err}", file=sys.stderr)
        return 2

    write_override(body_id)
    print(f"OK: DEV_START_BODY_ID -> '{body_id}' ({label})")

    if args.build:
        return run_build()
    return 0


if __name__ == "__main__":
    sys.exit(main())
