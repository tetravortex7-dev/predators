import os

from ref.vpk_io import parse_kv_blocks, read_entry


def extract_ability_summary(ab_data: dict[str, object], owner: str) -> dict[str, object]:
    """Extract compact schema summary for a vanilla ability or item block."""
    summary: dict[str, object] = {"owner": owner}
    for src_k, dst_k in (
        ("AbilityTextureName", "icon"),
        ("AbilitySound", "sound"),
        ("AbilityType", "type"),
        ("AbilityBehavior", "behavior"),
        ("AbilityUnitDamageType", "dmg"),
        ("SpellImmunityType", "immunity"),
        ("SpellDispellableType", "dispellable"),
        ("AbilityCooldown", "cd"),
        ("AbilityManaCost", "mana"),
        ("AbilityCastRange", "range"),
        ("AbilityCastAnimation", "anim"),
        ("Innate", "innate"),
        ("IsBreakable", "breakable"),
        ("MaxLevel", "maxLevel"),
        ("ItemCost", "cost"),
        ("ItemQuality", "quality"),
        ("ID", "id"),
    ):
        val = ab_data.get(src_k)
        if val is not None and val != "":
            summary[dst_k] = val
    ab_vals = ab_data.get("AbilityValues")
    if isinstance(ab_vals, dict):
        summary["values"] = list(ab_vals.keys())
        if "cd" not in summary and "AbilityCooldown" in ab_vals:
            summary["cd_in_values"] = ab_vals["AbilityCooldown"]
    return summary


def build_gameplay_catalogs(
    entries: dict[str, tuple[int, int, int, bytes]],
    script_paths: list[str],
    spellicons: list[str],
    itemicons: list[str],
    reborn_hud: list[str],
) -> dict[str, dict[str, object]]:
    """Build vanilla abilities, items, hero baselines, and UI/icon catalogs."""
    abilities: dict[str, object] = {}
    items: dict[str, object] = {}
    heroes: dict[str, object] = {}

    npc_ab = parse_kv_blocks(read_entry(entries["scripts/npc/npc_abilities.txt"]).decode("utf-8", "ignore")).get("DOTAAbilities", {})
    if isinstance(npc_ab, dict):
        for k, v in npc_ab.items():
            if k in ("Version", "ability_base") or not isinstance(v, dict) or k.startswith("special_bonus_"):
                continue
            abilities[k] = extract_ability_summary(v, "shared_npc_abilities")

    npc_items = parse_kv_blocks(read_entry(entries["scripts/npc/items.txt"]).decode("utf-8", "ignore")).get("DOTAAbilities", {})
    if isinstance(npc_items, dict):
        for k, v in npc_items.items():
            if k in ("Version", "item_base_datadriven") or not isinstance(v, dict):
                continue
            items[k] = extract_ability_summary(v, "items")

    for hf in sorted(p for p in script_paths if p.startswith("scripts/npc/heroes/npc_dota_hero_")):
        parsed = parse_kv_blocks(read_entry(entries[hf]).decode("utf-8", "ignore"))
        dota_heroes = parsed.get("DOTAHeroes", {})
        hero_owner = os.path.basename(hf).replace(".txt", "")
        if not isinstance(dota_heroes, dict):
            continue
        for hname, hdata in dota_heroes.items():
            if not hname.startswith("npc_dota_hero_") or hname == "npc_dota_hero_base" or not isinstance(hdata, dict):
                continue
            ab_list = []
            for slot in range(1, 30):
                ak = hdata.get(f"Ability{slot}")
                if isinstance(ak, str) and ak and not ak.startswith("special_bonus_") and ak != "generic_hidden":
                    ab_list.append(ak)
            heroes[hname] = {
                "attr": hdata.get("AttributePrimary", ""),
                "attack": hdata.get("AttackCapabilities", ""),
                "range": hdata.get("AttackRange", ""),
                "ms": hdata.get("MovementSpeed", ""),
                "armor": hdata.get("ArmorPhysical", ""),
                "str": f"{hdata.get('AttributeBaseStrength', '')}+{hdata.get('AttributeStrengthGain', '')}",
                "agi": f"{hdata.get('AttributeBaseAgility', '')}+{hdata.get('AttributeAgilityGain', '')}",
                "int": f"{hdata.get('AttributeBaseIntelligence', '')}+{hdata.get('AttributeIntelligenceGain', '')}",
                "vision": f"{hdata.get('VisionDaytimeRange', '1800')}/{hdata.get('VisionNighttimeRange', '800')}",
                "scale": hdata.get("ModelScale", ""),
                "model": hdata.get("Model", ""),
                "soundset": hdata.get("SoundSet", ""),
                "sounds_file": hdata.get("GameSoundsFile", ""),
                "voice_file": hdata.get("VoiceFile", ""),
                "particle_folder": hdata.get("particle_folder", ""),
                "abilities": ab_list,
            }
            ab_defs = hdata.get("AbilityDefinitions")
            if isinstance(ab_defs, dict):
                for ak, av in ab_defs.items():
                    if isinstance(av, dict) and not ak.startswith("special_bonus_"):
                        abilities[ak] = extract_ability_summary(av, hname)
        top_ab = parsed.get("DOTAAbilities", {})
        if isinstance(top_ab, dict):
            for ak, av in top_ab.items():
                if ak != "Version" and isinstance(av, dict) and not ak.startswith("special_bonus_"):
                    abilities[ak] = extract_ability_summary(av, hero_owner)

    clean_spellicons = sorted(
        p.replace("panorama/images/spellicons/", "").replace("_png.vtex_c", "").replace(".png", "")
        for p in spellicons if p.endswith("_png.vtex_c") or p.endswith(".png")
    )
    clean_itemicons = sorted(
        p.replace("panorama/images/items/", "").replace("_png.vtex_c", "").replace(".png", "")
        for p in itemicons if p.endswith("_png.vtex_c") or p.endswith(".png")
    )
    clean_reborn = sorted("s2r://" + p.replace("_psd.vtex_c", ".vtex").replace("_png.vtex_c", ".vtex") for p in reborn_hud)

    return {
        "vanilla_abilities": {"meta": {"source": "pak01_dir.vpk scripts/npc/heroes (AbilityDefinitions) + npc_abilities.txt", "count": len(abilities)}, "abilities": dict(sorted(abilities.items()))},
        "vanilla_items": {"meta": {"source": "pak01_dir.vpk scripts/npc/items.txt", "count": len(items)}, "items": dict(sorted(items.items()))},
        "hero_baselines": {"meta": {"source": "pak01_dir.vpk scripts/npc/heroes", "count": len(heroes)}, "heroes": dict(sorted(heroes.items()))},
        "ui_and_icons": {"meta": {"source": "pak01_dir.vpk panorama/images"}, "spellicons_cosmetic_count": sum(1 for s in clean_spellicons if "/" in s), "spellicons_cosmetic": [s for s in clean_spellicons if "/" in s], "spellicons_total": len(clean_spellicons), "spellicons_all": clean_spellicons, "item_icons": clean_itemicons, "reborn_hud_vtex": clean_reborn},
    }
