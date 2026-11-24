import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_PATH = os.path.join(ROOT, "data", "neutral_creeps.json")
UNITS_DIR = os.path.join(ROOT, "scripts", "npc", "units", "neutrals")
NPC_UNITS_CUSTOM = os.path.join(ROOT, "scripts", "npc", "npc_units_custom.txt")
NEUTRAL_CAMPS_TXT = os.path.join(ROOT, "scripts", "npc", "neutral_camps.txt")
OUT_TS_PATH = os.path.join(ROOT, "src", "vscripts", "data", "neutral_creeps_catalog.ts")
RU_LOC_PATH = os.path.join(ROOT, "resource", "addon_russian.txt")
EN_LOC_PATH = os.path.join(ROOT, "resource", "addon_english.txt")

AURA_AND_ABILITY_LOC = {
    "ru": {
        "DOTA_Tooltip_modifier_evo_creep_aura_frenzy": "Аура ярости",
        "DOTA_Tooltip_modifier_evo_creep_aura_frenzy_Description": "Увеличивает скорость атаки ближайших крипов.",
        "DOTA_Tooltip_modifier_evo_creep_aura_carapace": "Аура панциря",
        "DOTA_Tooltip_modifier_evo_creep_aura_carapace_Description": "Увеличивает броню ближайших крипов.",
        "DOTA_Tooltip_modifier_evo_creep_aura_vitality": "Аура живучести",
        "DOTA_Tooltip_modifier_evo_creep_aura_vitality_Description": "Восстанавливает здоровье ближайших крипов.",
        "DOTA_Tooltip_modifier_evo_creep_aura_vampiric": "Аура вампиризма",
        "DOTA_Tooltip_modifier_evo_creep_aura_vampiric_Description": "Дарует вампиризм ближайшим крипам.",
        "DOTA_Tooltip_modifier_evo_creep_aura_haste": "Аура стремительности",
        "DOTA_Tooltip_modifier_evo_creep_aura_haste_Description": "Увеличивает скорость передвижения ближайших крипов.",
        "DOTA_Tooltip_modifier_evo_creep_aura_thorns": "Аура шипов",
        "DOTA_Tooltip_modifier_evo_creep_aura_thorns_Description": "Возвращает часть физического урона атакующему.",
        "DOTA_Tooltip_modifier_evo_creep_aura_ward": "Аура завесы",
        "DOTA_Tooltip_modifier_evo_creep_aura_ward_Description": "Увеличивает сопротивление магии ближайших крипов.",
        "DOTA_Tooltip_modifier_evo_creep_ability_frost": "Ледяной удар",
        "DOTA_Tooltip_modifier_evo_creep_ability_frost_Description": "Атаки замедляют передвижение и скорость атаки цели.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_frost": "Обморожение",
        "DOTA_Tooltip_modifier_evo_creep_debuff_frost_Description": "Скорость передвижения и атаки снижены.",
        "DOTA_Tooltip_modifier_evo_creep_ability_venom": "Ядовитые когти",
        "DOTA_Tooltip_modifier_evo_creep_ability_venom_Description": "Атаки отравляют цель и ослабляют лечение.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_venom": "Яд когтей",
        "DOTA_Tooltip_modifier_evo_creep_debuff_venom_Description": "Периодический магический урон и снижение лечения.",
        "DOTA_Tooltip_modifier_evo_creep_ability_sunder": "Разлом брони",
        "DOTA_Tooltip_modifier_evo_creep_ability_sunder_Description": "Атаки снижают броню цели.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_sunder": "Расколотая броня",
        "DOTA_Tooltip_modifier_evo_creep_debuff_sunder_Description": "Броня снижена.",
        "DOTA_Tooltip_modifier_evo_creep_ability_manaburn": "Манабёрн",
        "DOTA_Tooltip_modifier_evo_creep_ability_manaburn_Description": "Атаки сжигают ману и наносят доп. урон.",
        "DOTA_Tooltip_modifier_evo_creep_ability_crit": "Кровавый разрыв",
        "DOTA_Tooltip_modifier_evo_creep_ability_crit_Description": "Шанс нанести критический удар.",
        "DOTA_Tooltip_modifier_evo_creep_ability_explode": "Посмертный взрыв",
        "DOTA_Tooltip_modifier_evo_creep_ability_explode_Description": "Взрывается при гибели, нанося урон вокруг.",
        "DOTA_Tooltip_modifier_evo_creep_ability_stomp": "Громовой топот",
        "DOTA_Tooltip_modifier_evo_creep_ability_stomp_Description": "Периодически бьёт по области рядом с героями.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_stomp": "Оглушён топотом",
        "DOTA_Tooltip_modifier_evo_creep_debuff_stomp_Description": "Скорость передвижения снижена."
    },
    "en": {
        "DOTA_Tooltip_modifier_evo_creep_aura_frenzy": "Frenzy Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_frenzy_Description": "Increases attack speed of nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_aura_carapace": "Carapace Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_carapace_Description": "Increases armor of nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_aura_vitality": "Vitality Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_vitality_Description": "Restores health of nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_aura_vampiric": "Vampiric Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_vampiric_Description": "Grants lifesteal to nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_aura_haste": "Haste Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_haste_Description": "Increases movement speed of nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_aura_thorns": "Thorns Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_thorns_Description": "Returns a portion of physical attack damage.",
        "DOTA_Tooltip_modifier_evo_creep_aura_ward": "Ward Aura",
        "DOTA_Tooltip_modifier_evo_creep_aura_ward_Description": "Increases magic resistance of nearby creeps.",
        "DOTA_Tooltip_modifier_evo_creep_ability_frost": "Frost Strike",
        "DOTA_Tooltip_modifier_evo_creep_ability_frost_Description": "Attacks slow movement and attack speed.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_frost": "Frostbitten",
        "DOTA_Tooltip_modifier_evo_creep_debuff_frost_Description": "Movement and attack speed reduced.",
        "DOTA_Tooltip_modifier_evo_creep_ability_venom": "Venom Claws",
        "DOTA_Tooltip_modifier_evo_creep_ability_venom_Description": "Attacks poison the target and reduce healing.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_venom": "Venom",
        "DOTA_Tooltip_modifier_evo_creep_debuff_venom_Description": "Taking magic damage over time with reduced healing.",
        "DOTA_Tooltip_modifier_evo_creep_ability_sunder": "Armor Sunder",
        "DOTA_Tooltip_modifier_evo_creep_ability_sunder_Description": "Attacks reduce target armor.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_sunder": "Sundered Armor",
        "DOTA_Tooltip_modifier_evo_creep_debuff_sunder_Description": "Armor is reduced.",
        "DOTA_Tooltip_modifier_evo_creep_ability_manaburn": "Mana Burn",
        "DOTA_Tooltip_modifier_evo_creep_ability_manaburn_Description": "Attacks burn mana and deal bonus damage.",
        "DOTA_Tooltip_modifier_evo_creep_ability_crit": "Rending Strike",
        "DOTA_Tooltip_modifier_evo_creep_ability_crit_Description": "Chance to deal critical damage.",
        "DOTA_Tooltip_modifier_evo_creep_ability_explode": "Volatile Death",
        "DOTA_Tooltip_modifier_evo_creep_ability_explode_Description": "Explodes on death, damaging nearby enemies.",
        "DOTA_Tooltip_modifier_evo_creep_ability_stomp": "Thunder Stomp",
        "DOTA_Tooltip_modifier_evo_creep_ability_stomp_Description": "Periodically slams the ground near heroes.",
        "DOTA_Tooltip_modifier_evo_creep_debuff_stomp": "Stomped",
        "DOTA_Tooltip_modifier_evo_creep_debuff_stomp_Description": "Movement speed reduced."
    }
}


def render_unit_kv(c):
    is_ranged = bool(c.get("is_ranged", False))
    attack_cap = "DOTA_UNIT_CAP_RANGED_ATTACK" if is_ranged else "DOTA_UNIT_CAP_MELEE_ATTACK"
    acq_range = max(500, int(c["attack_range"]) + 100) if is_ranged else 500
    health_bar_offset = int(round(170 * float(c.get("scale", 1.0))))
    ring_radius = 65 if c["tier"] in ("hard", "strong") else 50

    lines = [
        '"DOTAUnits"',
        "{",
        f'\t"{c["id"]}"',
        "\t{",
        f'\t\t"Model"\t\t\t\t\t\t"{c["model"]}"',
        '\t\t"BaseClass"\t\t\t\t\t"npc_dota_creature"',
        f'\t\t"SoundSet"\t\t\t\t\t"{c.get("sound_set", "n_creep_Melee")}"',
        '\t\t"Level"\t\t\t\t\t\t"1"',
        '\t\t"IsAncient"\t\t\t\t\t"0"',
        '\t\t"ImmuneToInfest"\t\t\t"1"',
        f'\t\t"ModelScale"\t\t\t\t"{c.get("scale", 1.0)}"',
        '\t\t"CanBeDominated"\t\t\t"0"',
        '\t\t"IsNeutralUnitType"\t\t\t"1"',
        '\t\t"UseNeutralCreepBehavior"\t"1"',
        '\t\t"Ability1"\t\t\t\t\t""',
        '\t\t"Ability2"\t\t\t\t\t""',
        '\t\t"Ability3"\t\t\t\t\t""',
        '\t\t"Ability4"\t\t\t\t\t""',
        f'\t\t"ArmorPhysical"\t\t\t\t"{c["armor"]}"',
        f'\t\t"MagicalResistance"\t\t\t"{c["magic_resist"]}"',
        f'\t\t"AttackCapabilities"\t\t"{attack_cap}"',
        f'\t\t"AttackDamageMin"\t\t\t"{c["dmg_min"]}"',
        f'\t\t"AttackDamageMax"\t\t\t"{c["dmg_max"]}"',
        f'\t\t"AttackRate"\t\t\t\t"{c["attack_rate"]}"',
        f'\t\t"AttackAnimationPoint"\t\t"{c["attack_point"]}"',
        f'\t\t"AttackAcquisitionRange"\t"{acq_range}"',
        f'\t\t"AttackRange"\t\t\t\t"{c["attack_range"]}"',
    ]
    if is_ranged:
        lines.append(f'\t\t"ProjectileModel"\t\t\t"{c.get("projectile_model", "particles/neutral_fx/gnoll_base_attack.vpcf")}"')
        lines.append(f'\t\t"ProjectileSpeed"\t\t\t"{c.get("projectile_speed", 1000)}"')
    lines.extend([
        f'\t\t"RingRadius"\t\t\t\t"{ring_radius}"',
        f'\t\t"HealthBarOffset"\t\t\t"{health_bar_offset}"',
        f'\t\t"BountyXP"\t\t\t\t\t"{c["bounty_xp"]}"',
        f'\t\t"BountyGoldMin"\t\t\t\t"{c["bounty_gold_min"]}"',
        f'\t\t"BountyGoldMax"\t\t\t\t"{c["bounty_gold_max"]}"',
        '\t\t"MovementCapabilities"\t\t"DOTA_UNIT_CAP_MOVE_GROUND"',
        f'\t\t"MovementSpeed"\t\t\t\t"{c["move_speed"]}"',
        f'\t\t"StatusHealth"\t\t\t\t"{c["hp"]}"',
        f'\t\t"StatusHealthRegen"\t\t\t"{c["hp_regen"]}"',
        '\t\t"StatusMana"\t\t\t\t"300"',
        '\t\t"StatusManaRegen"\t\t\t"2.0"',
        '\t\t"VisionDaytimeRange"\t\t"800"',
        '\t\t"VisionNighttimeRange"\t\t"800"',
        '\t\t"TeamName"\t\t\t\t\t"DOTA_TEAM_NEUTRALS"',
        '\t\t"CombatClassAttack"\t\t\t"DOTA_COMBAT_CLASS_ATTACK_BASIC"',
        '\t\t"CombatClassDefend"\t\t\t"DOTA_COMBAT_CLASS_DEFEND_BASIC"',
        '\t\t"UnitRelationshipClass"\t\t"DOTA_NPC_UNIT_RELATIONSHIP_TYPE_DEFAULT"',
        '\t\t"precache"',
        "\t\t{",
        f'\t\t\t"model"\t\t\t\t\t"{c["model"]}"',
    ])
    if is_ranged and c.get("projectile_model"):
        lines.append(f'\t\t\t"particle"\t\t\t\t"{c["projectile_model"]}"')
    lines.extend([
        "\t\t}",
        '\t\t"Creature"',
        "\t\t{",
        f'\t\t\t"HPGain"\t\t\t\t\t"{c["hp_gain"]}"',
        f'\t\t\t"DamageGain"\t\t\t\t"{c["dmg_gain"]}"',
        f'\t\t\t"ArmorGain"\t\t\t\t\t"{c["armor_gain"]}"',
        '\t\t\t"MagicResistGain"\t\t\t"0.25"',
        '\t\t\t"MoveSpeedGain"\t\t\t\t"1"',
        f'\t\t\t"BountyGain"\t\t\t\t"{c["gold_gain"]}"',
        f'\t\t\t"XPGain"\t\t\t\t\t"{c["xp_gain"]}"',
        "\t\t}",
        "\t}",
        "}",
        "",
    ])
    return "\n".join(lines)


def render_camps_kv(camps):
    lines = ['"NeutralCamps"', "{"]
    for size, biomes in camps.items():
        lines.append(f'\t"{size}"')
        lines.append("\t{")
        for biome, packs in biomes.items():
            lines.append(f'\t\t"{biome}"')
            lines.append("\t\t{")
            for idx, pack in enumerate(packs, start=1):
                lines.append(f'\t\t\t"{idx}"')
                lines.append("\t\t\t{")
                for unit_id, count in pack.items():
                    lines.append(f'\t\t\t\t"{unit_id}" "{count}"')
                lines.append("\t\t\t}")
            lines.append("\t\t}")
        lines.append("\t}")
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def update_npc_units_custom(creep_ids):
    with open(NPC_UNITS_CUSTOM, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    existing_non_evo = []
    tail = []
    in_tail = False
    for line in lines:
        if not in_tail and line.strip().startswith("#base"):
            if "units/neutrals/evo_creep_" in line:
                continue
            existing_non_evo.append(line)
        else:
            in_tail = True
            tail.append(line)

    new_bases = [f"#base units/neutrals/{cid}/unit.txt" for cid in creep_ids]
    out_lines = existing_non_evo + new_bases + tail
    with open(NPC_UNITS_CUSTOM, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(out_lines) + "\n")


def upsert_localization(path, tokens):
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    for key, val in tokens.items():
        escaped = val.replace("\\", "\\\\").replace('"', '\\"')
        pattern = re.compile(rf'("{re.escape(key)}"\s+")([^"]*)(")')
        if pattern.search(text):
            text = pattern.sub(rf'\g<1>{escaped}\g<3>', text, count=1)
        else:
            insert_idx = text.rfind("}")
            if insert_idx != -1:
                inner_idx = text.rfind("}", 0, insert_idx)
                if inner_idx != -1:
                    entry = f'\t\t"{key}"\t\t"{escaped}"\n'
                    text = text[:inner_idx] + entry + text[inner_idx:]

    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def main():
    with open(DATA_PATH, "r", encoding="utf-8") as f:
        data = json.load(f)

    creeps = data["creeps"]
    camps = data["camps"]
    creep_ids = []
    models = []
    ru_tokens = dict(AURA_AND_ABILITY_LOC["ru"])
    en_tokens = dict(AURA_AND_ABILITY_LOC["en"])

    for c in creeps:
        cid = c["id"]
        creep_ids.append(cid)
        if c["model"] not in models:
            models.append(c["model"])
        unit_dir = os.path.join(UNITS_DIR, cid)
        os.makedirs(unit_dir, exist_ok=True)
        with open(os.path.join(unit_dir, "unit.txt"), "w", encoding="utf-8", newline="\n") as f:
            f.write(render_unit_kv(c))
        ru_tokens[cid] = c["name_ru"]
        en_tokens[cid] = c["name_en"]

    update_npc_units_custom(creep_ids)

    with open(NEUTRAL_CAMPS_TXT, "w", encoding="utf-8", newline="\n") as f:
        f.write(render_camps_kv(camps))

    ts_lines = [
        "export const EVO_NEUTRAL_CREEP_UNITS: readonly string[] = [",
        *[f'    "{cid}",' for cid in creep_ids],
        "];",
        "",
        "export const EVO_NEUTRAL_CREEP_MODELS: readonly string[] = [",
        *[f'    "{m}",' for m in models],
        "];",
        "",
    ]
    with open(OUT_TS_PATH, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(ts_lines))

    upsert_localization(RU_LOC_PATH, ru_tokens)
    upsert_localization(EN_LOC_PATH, en_tokens)

    print(f"[Evo] Generated {len(creeps)} custom neutral creep(s) and updated camps/localization.")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"[Evo] Neutral generation failed: {exc}", file=sys.stderr)
        sys.exit(1)
