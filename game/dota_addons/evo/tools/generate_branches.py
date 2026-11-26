import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BRANCHES_DIR = os.path.join(ROOT, "data", "branches")
WEARABLES_PATH = os.path.join(ROOT, "reference", "wearables_catalog.json")
OUT_TS_PATH = os.path.join(ROOT, "src", "vscripts", "data", "bodies_catalog.ts")
OUT_BRANCHES_DIR = os.path.join(ROOT, "src", "vscripts", "data", "branches")
RU_LOC_PATH = os.path.join(ROOT, "resource", "addon_russian.txt")
EN_LOC_PATH = os.path.join(ROOT, "resource", "addon_english.txt")

DEFAULT_STAGE_STATS = {
    1: {
        "str": 20, "agi": 20, "int": 18,
        "str_gain": 2.3, "agi_gain": 2.3, "int_gain": 1.9,
        "move_speed": 305, "dmg_min": 28, "dmg_max": 34, "attack_range": 150, "armor": 2,
    },
    2: {
        "str": 26, "agi": 26, "int": 21,
        "str_gain": 2.9, "agi_gain": 2.9, "int_gain": 2.2,
        "move_speed": 315, "dmg_min": 36, "dmg_max": 44, "attack_range": 150, "armor": 3,
    },
    3: {
        "str": 34, "agi": 34, "int": 25,
        "str_gain": 3.6, "agi_gain": 3.6, "int_gain": 2.6,
        "move_speed": 325, "dmg_min": 46, "dmg_max": 56, "attack_range": 150, "armor": 5,
    },
}


def load_wearables_index():
    with open(WEARABLES_PATH, "r", encoding="utf-8") as f:
        catalog = json.load(f)
    by_hero = catalog.get("by_hero", {})
    index = {}
    for hero_name, slots in by_hero.items():
        by_id = {}
        by_name = {}
        for slot_items in slots.values():
            for entry in slot_items:
                by_id[str(entry["id"])] = entry
                by_name[entry["name"].strip().lower()] = entry
        index[hero_name] = (by_id, by_name)
    return index


def resolve_wearable(wearables_index, hero_name, ref):
    if isinstance(ref, dict):
        if "model" in ref:
            spec = {"model": ref["model"]}
            if ref.get("particles"):
                spec["particles"] = ref["particles"]
            if ref.get("color"):
                spec["color"] = ref["color"]
            return spec
        raise ValueError(f"Wearable object for {hero_name} must contain 'model': {ref}")

    ref_str = str(ref).strip()
    if ref_str.endswith(".vmdl"):
        return {"model": ref_str}

    hero_lookup = wearables_index.get(hero_name)
    if not hero_lookup:
        raise ValueError(f"Hero '{hero_name}' not found in wearables_catalog.json")

    by_id, by_name = hero_lookup
    entry = by_id.get(ref_str) or by_name.get(ref_str.lower())
    if not entry:
        raise ValueError(
            f"Wearable '{ref_str}' not found for hero '{hero_name}' in wearables_catalog.json"
        )

    spec = {"model": entry["model"]}
    if entry.get("particles"):
        spec["particles"] = entry["particles"]
    return spec


def compute_stats(tier_index, attr, base_stats, stage_stats):
    defaults = dict(DEFAULT_STAGE_STATS.get(tier_index, DEFAULT_STAGE_STATS[3]))
    if attr == "STR":
        defaults["str"] += 4
        defaults["str_gain"] = round(defaults["str_gain"] + 0.5, 2)
    elif attr == "AGI":
        defaults["agi"] += 4
        defaults["agi_gain"] = round(defaults["agi_gain"] + 0.5, 2)
    elif attr == "INT":
        defaults["int"] += 4
        defaults["int_gain"] = round(defaults["int_gain"] + 0.5, 2)
    elif attr == "ALL":
        defaults["str"] += 2
        defaults["agi"] += 2
        defaults["int"] += 2
        defaults["str_gain"] = round(defaults["str_gain"] + 0.3, 2)
        defaults["agi_gain"] = round(defaults["agi_gain"] + 0.3, 2)
        defaults["int_gain"] = round(defaults["int_gain"] + 0.3, 2)

    merged = dict(defaults)
    if isinstance(base_stats, dict):
        merged.update(base_stats)
    if isinstance(stage_stats, dict):
        merged.update(stage_stats)
    return merged


def upsert_localization(path, tokens):
    with open(path, "r", encoding="utf-8") as f:
        text = f.read().replace("\r\n", "\n").replace("\r", "\n")

    to_append = []
    for key, value in tokens.items():
        escaped = value.replace("\\", "\\\\").replace('"', '\\"').replace("\r\n", "\\n").replace("\n", "\\n")
        pattern = re.compile(rf'^(\s*"{re.escape(key)}"\s+)"[^"]*"', re.MULTILINE)
        replacement = rf'\1"{escaped}"'
        if pattern.search(text):
            text = pattern.sub(replacement, text, count=1)
        else:
            to_append.append(f'\t\t"{key}"\t\t"{escaped}"')

    if to_append:
        block = "\n".join(to_append) + "\n"
        updated = re.sub(r"\n\t\}\n\}\s*$", "\n" + block + "\t}\n}\n", text)
        if updated == text:
            raise RuntimeError(f"Could not find closing Tokens block in {path}")
        text = updated

    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def format_ts_value(val, indent=0):
    sp = " " * indent
    sp_in = " " * (indent + 4)
    if isinstance(val, bool):
        return "true" if val else "false"
    if isinstance(val, (int, float)):
        return str(val)
    if isinstance(val, str):
        return json.dumps(val, ensure_ascii=False)
    if isinstance(val, list):
        if not val:
            return "[]"
        if all(isinstance(x, (int, float, str, bool)) for x in val) and len(val) <= 6:
            return "[" + ", ".join(format_ts_value(x, 0) for x in val) + "]"
        items = ",\n".join(f"{sp_in}{format_ts_value(x, indent + 4)}" for x in val)
        return "[\n" + items + f",\n{sp}]"
    if isinstance(val, dict):
        if not val:
            return "{}"
        if len(val) <= 2 and all(isinstance(v, (int, float, str, bool)) for v in val.values()):
            inline = ", ".join(f"{k}: {format_ts_value(v, 0)}" for k, v in val.items())
            if len(inline) <= 110:
                return "{ " + inline + " }"
        lines = []
        for k, v in val.items():
            lines.append(f"{sp_in}{k}: {format_ts_value(v, indent + 4)},")
        return "{\n" + "\n".join(lines) + f"\n{sp}}}"
    raise TypeError(f"Unsupported type: {type(val)}")


def main():
    wearables_index = load_wearables_index()
    files = sorted(
        f for f in os.listdir(BRANCHES_DIR) if f.endswith(".json") and not f.startswith("_")
    )

    starter_raw = None
    branches_raw = []
    for fname in files:
        fpath = os.path.join(BRANCHES_DIR, fname)
        with open(fpath, "r", encoding="utf-8") as f:
            data = json.load(f)
        if data.get("is_starter"):
            starter_raw = data
        else:
            branches_raw.append((fname, data))

    if not starter_raw:
        raise RuntimeError("Missing starter.json with 'is_starter': true in data/branches/")

    bodies = []
    ru_tokens = {}
    en_tokens = {}
    starter_next_ids = []

    starter_id = starter_raw["id"]
    starter_hero = starter_raw.get("hero", "npc_dota_hero_wisp")
    starter_scale = starter_raw.get("scale", 0.9)
    starter_stats = starter_raw["stats"]
    starter_wearables = [
        resolve_wearable(wearables_index, starter_hero, w)
        for w in starter_raw.get("wearables", [])
    ]
    starter_body = {
        "id": starter_id,
        "tierIndex": 0,
        "diet": starter_raw.get("diet", "HYBRID"),
        "tags": starter_raw.get("tags", ["starter"]),
        "spellPoolTags": starter_raw.get("spell_pool_tags", ["utility"]),
        "model": starter_raw["model"],
        "modelScale": starter_scale,
        "heroClass": starter_hero,
        "nextBodyIds": starter_next_ids,
        "appearance": {
            "scale": starter_scale,
            "hideBaseWearables": starter_raw.get("hide_base_wearables", True),
            "wearables": starter_wearables,
            "displayName": starter_raw.get("display_name") or starter_raw.get("name_ru") or starter_raw.get("name_en") or starter_id,
        },
        "primaryAttribute": starter_raw.get("attr", "STR"),
        "baseStr": starter_stats["str"],
        "baseAgi": starter_stats["agi"],
        "baseInt": starter_stats["int"],
        "strGain": starter_stats["str_gain"],
        "agiGain": starter_stats["agi_gain"],
        "intGain": starter_stats["int_gain"],
        "baseMoveSpeed": starter_stats["move_speed"],
        "baseAttackDamageMin": starter_stats["dmg_min"],
        "baseAttackDamageMax": starter_stats["dmg_max"],
        "baseAttackRange": starter_stats["attack_range"],
        "baseArmor": starter_stats["armor"],
        "innateAbility": starter_raw["innate"],
        "signatureAbility": starter_raw["signature"],
    }
    bodies.append(starter_body)
    branch_modules = [("starter", "EVO_STARTER_BODIES", [starter_body])]

    if starter_raw.get("name_ru"):
        ru_tokens[starter_id] = starter_raw["name_ru"]
    if starter_raw.get("desc_ru"):
        ru_tokens[f"{starter_id}_desc"] = starter_raw["desc_ru"]
    if starter_raw.get("name_en"):
        en_tokens[starter_id] = starter_raw["name_en"]
    if starter_raw.get("desc_en"):
        en_tokens[f"{starter_id}_desc"] = starter_raw["desc_en"]

    for fname, branch in branches_raw:
        key = branch["key"]
        stages = branch.get("stages", [])
        if not stages:
            continue

        branch_bodies = []
        stage_ids = []
        for idx, stage in enumerate(stages):
            tier_index = stage.get("tier_index", idx + 1)
            stage_id = stage.get("id") or f"evo_body_t{tier_index}_{key}_{idx + 1}"
            stage_ids.append(stage_id)

        starter_next_ids.append(stage_ids[0])

        for idx, stage in enumerate(stages):
            tier_index = stage.get("tier_index", idx + 1)
            stage_id = stage_ids[idx]
            hero_class = stage.get("hero") or branch["hero"]
            model = stage.get("model") or branch["model"]
            diet = stage.get("diet") or branch.get("diet", "HYBRID")
            attr = stage.get("attr") or branch.get("attr", "AGI")
            scale = stage.get("scale", 1.0)
            keep_default = stage.get("keep_default_abilities", branch.get("keep_default_abilities", True))
            stats = compute_stats(tier_index, attr, branch.get("stats"), stage.get("stats"))

            resolved_wearables = [
                resolve_wearable(wearables_index, hero_class, w)
                for w in stage.get("wearables", [])
            ]

            appearance = {
                "scale": scale,
                "hideBaseWearables": stage.get("hide_base_wearables", True),
                "wearables": resolved_wearables,
                "displayName": stage.get("display_name") or stage.get("name_ru") or stage.get("name_en") or stage_id,
            }
            if stage.get("color"):
                appearance["color"] = stage["color"]
            if stage.get("alpha") is not None:
                appearance["alpha"] = stage["alpha"]
            if stage.get("label_color"):
                appearance["labelColor"] = stage["label_color"]

            body_obj = {
                "id": stage_id,
                "tierIndex": tier_index,
                "diet": diet,
                "tags": stage.get("tags") or branch.get("tags", []),
                "spellPoolTags": stage.get("spell_pool_tags") or branch.get("spell_pool_tags", []),
                "model": model,
                "modelScale": scale,
                "heroClass": hero_class,
                "keepDefaultHeroAbilities": keep_default,
            }

            if "next_body_ids" in stage:
                if stage["next_body_ids"]:
                    body_obj["nextBodyIds"] = stage["next_body_ids"]
            elif idx + 1 < len(stage_ids):
                body_obj["nextBodyIds"] = [stage_ids[idx + 1]]

            body_obj["appearance"] = appearance
            body_obj["primaryAttribute"] = attr
            body_obj["baseStr"] = stats["str"]
            body_obj["baseAgi"] = stats["agi"]
            body_obj["baseInt"] = stats["int"]
            body_obj["strGain"] = stats["str_gain"]
            body_obj["agiGain"] = stats["agi_gain"]
            body_obj["intGain"] = stats["int_gain"]
            body_obj["baseMoveSpeed"] = stats["move_speed"]
            body_obj["baseAttackDamageMin"] = stats["dmg_min"]
            body_obj["baseAttackDamageMax"] = stats["dmg_max"]
            body_obj["baseAttackRange"] = stats["attack_range"]
            body_obj["baseArmor"] = stats["armor"]
            body_obj["innateAbility"] = stage.get("innate") or branch["innate"]
            body_obj["signatureAbility"] = stage.get("signature") or branch["signature"]
            kit_abilities = stage.get("abilities") or branch.get("abilities")
            if kit_abilities:
                body_obj["kitAbilities"] = kit_abilities
            if stage.get("ability_level") is not None:
                body_obj["kitAbilityLevel"] = stage["ability_level"]

            bodies.append(body_obj)
            branch_bodies.append(body_obj)

            if stage.get("name_ru"):
                ru_tokens[stage_id] = stage["name_ru"]
            if stage.get("desc_ru"):
                ru_tokens[f"{stage_id}_desc"] = stage["desc_ru"]
            if stage.get("name_en"):
                en_tokens[stage_id] = stage["name_en"]
            if stage.get("desc_en"):
                en_tokens[f"{stage_id}_desc"] = stage["desc_en"]

        safe_key = re.sub(r"[^a-zA-Z0-9_]", "_", key).lower()
        const_base = f"EVO_BRANCH_{safe_key.upper()}_BODIES"
        chunk_idx = 1
        start = 0
        while start < len(branch_bodies):
            end = len(branch_bodies)
            while end > start + 1:
                probe_text = format_ts_value(branch_bodies[start:end], 0)
                if len(probe_text.splitlines()) <= 450:
                    break
                end -= 1
            mod_name = safe_key if chunk_idx == 1 else f"{safe_key}_{chunk_idx}"
            const_name = const_base if chunk_idx == 1 else f"{const_base}_{chunk_idx}"
            branch_modules.append((mod_name, const_name, branch_bodies[start:end]))
            start = end
            chunk_idx += 1

    os.makedirs(OUT_BRANCHES_DIR, exist_ok=True)
    expected_files = {f"{mod_name}.ts" for mod_name, _, _ in branch_modules}
    for existing_name in os.listdir(OUT_BRANCHES_DIR):
        if existing_name.endswith(".ts") and existing_name not in expected_files:
            os.remove(os.path.join(OUT_BRANCHES_DIR, existing_name))

    for mod_name, const_name, mod_bodies in branch_modules:
        mod_path = os.path.join(OUT_BRANCHES_DIR, f"{mod_name}.ts")
        mod_lines = [
            'import { BodyDefinition } from "../data_schemas";',
            "",
            f"export const {const_name}: readonly BodyDefinition[] = " + format_ts_value(mod_bodies, 0) + ";",
            "",
        ]
        with open(mod_path, "w", encoding="utf-8", newline="\n") as f:
            f.write("\n".join(mod_lines))

    import_lines = ['import { BodyDefinition } from "./data_schemas";']
    spread_lines = []
    for mod_name, const_name, _ in branch_modules:
        import_lines.append(f'import {{ {const_name} }} from "./branches/{mod_name}";')
        spread_lines.append(f"    ...{const_name},")

    ts_lines = [
        *import_lines,
        "",
        f'export const EVO_DEFAULT_START_BODY_ID = "{starter_id}";',
        "",
        "export const EVO_BODIES_CATALOG: readonly BodyDefinition[] = [",
        *spread_lines,
        "];",
        "",
        "export function getBodyDefinition(bodyId: string): BodyDefinition | undefined {",
        "    for (const body of EVO_BODIES_CATALOG) {",
        "        if (body.id === bodyId) {",
        "            return body;",
        "        }",
        "    }",
        "    return undefined;",
        "}",
        "",
        "export function getBodiesForTier(tierIndex: number): BodyDefinition[] {",
        "    return EVO_BODIES_CATALOG.filter((body) => body.tierIndex === tierIndex);",
        "}",
        "",
    ]

    with open(OUT_TS_PATH, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(ts_lines))

    upsert_localization(RU_LOC_PATH, ru_tokens)
    upsert_localization(EN_LOC_PATH, en_tokens)

    print(
        f"[Evo] Generated {len(bodies)} body definition(s) from {len(branches_raw)} branch file(s)."
    )


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"[Evo] Branch generation failed: {exc}", file=sys.stderr)
        sys.exit(1)
