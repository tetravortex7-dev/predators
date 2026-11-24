import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/common/evo_generic_talents";

LinkLuaModifier("modifier_special_bonus_evo_agi_int_1", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_int_str_1", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_hp_100", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_mana_125", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_ms_25", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_armor_6", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_all_stats_5", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_magic_resist_15", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_hp_regen_15", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_mana_regen_75", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_damage_75", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_special_bonus_evo_spell_amp_28", SCRIPT_PATH, LuaModifierMotionType.NONE);

class BaseTalentModifier extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
}

@registerAbility("special_bonus_evo_agi_int_1")
export class special_bonus_evo_agi_int_1 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_agi_int_1";
    }
}

@registerModifier("modifier_special_bonus_evo_agi_int_1")
export class modifier_special_bonus_evo_agi_int_1 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Agility(): number {
        return 1;
    }
    GetModifierBonusStats_Intellect(): number {
        return 1;
    }
}

@registerAbility("special_bonus_evo_int_str_1")
export class special_bonus_evo_int_str_1 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_int_str_1";
    }
}

@registerModifier("modifier_special_bonus_evo_int_str_1")
export class modifier_special_bonus_evo_int_str_1 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        ];
    }
    GetModifierBonusStats_Intellect(): number {
        return 1;
    }
    GetModifierBonusStats_Strength(): number {
        return 1;
    }
}

@registerAbility("special_bonus_evo_hp_100")
export class special_bonus_evo_hp_100 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_hp_100";
    }
}

@registerModifier("modifier_special_bonus_evo_hp_100")
export class modifier_special_bonus_evo_hp_100 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_BONUS")];
    }
    GetModifierHealthBonus(): number {
        return 100;
    }
}

@registerAbility("special_bonus_evo_mana_125")
export class special_bonus_evo_mana_125 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_mana_125";
    }
}

@registerModifier("modifier_special_bonus_evo_mana_125")
export class modifier_special_bonus_evo_mana_125 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MANA_BONUS")];
    }
    GetModifierManaBonus(): number {
        return 125;
    }
}

@registerAbility("special_bonus_evo_ms_25")
export class special_bonus_evo_ms_25 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_ms_25";
    }
}

@registerModifier("modifier_special_bonus_evo_ms_25")
export class modifier_special_bonus_evo_ms_25 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT")];
    }
    GetModifierMoveSpeedBonus_Constant(): number {
        return 25;
    }
}

@registerAbility("special_bonus_evo_armor_6")
export class special_bonus_evo_armor_6 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_armor_6";
    }
}

@registerModifier("modifier_special_bonus_evo_armor_6")
export class modifier_special_bonus_evo_armor_6 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return 6;
    }
}

@registerAbility("special_bonus_evo_all_stats_5")
export class special_bonus_evo_all_stats_5 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_all_stats_5";
    }
}

@registerModifier("modifier_special_bonus_evo_all_stats_5")
export class modifier_special_bonus_evo_all_stats_5 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return 5;
    }
    GetModifierBonusStats_Agility(): number {
        return 5;
    }
    GetModifierBonusStats_Intellect(): number {
        return 5;
    }
}

@registerAbility("special_bonus_evo_magic_resist_15")
export class special_bonus_evo_magic_resist_15 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_magic_resist_15";
    }
}

@registerModifier("modifier_special_bonus_evo_magic_resist_15")
export class modifier_special_bonus_evo_magic_resist_15 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        return 15;
    }
}

@registerAbility("special_bonus_evo_hp_regen_15")
export class special_bonus_evo_hp_regen_15 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_hp_regen_15";
    }
}

@registerModifier("modifier_special_bonus_evo_hp_regen_15")
export class modifier_special_bonus_evo_hp_regen_15 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")];
    }
    GetModifierConstantHealthRegen(): number {
        return 15;
    }
}

@registerAbility("special_bonus_evo_mana_regen_75")
export class special_bonus_evo_mana_regen_75 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_mana_regen_75";
    }
}

@registerModifier("modifier_special_bonus_evo_mana_regen_75")
export class modifier_special_bonus_evo_mana_regen_75 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT")];
    }
    GetModifierConstantManaRegen(): number {
        return 7.5;
    }
}

@registerAbility("special_bonus_evo_damage_75")
export class special_bonus_evo_damage_75 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_damage_75";
    }
}

@registerModifier("modifier_special_bonus_evo_damage_75")
export class modifier_special_bonus_evo_damage_75 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE")];
    }
    GetModifierPreAttack_BonusDamage(): number {
        return 75;
    }
}

@registerAbility("special_bonus_evo_spell_amp_28")
export class special_bonus_evo_spell_amp_28 extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_special_bonus_evo_spell_amp_28";
    }
}

@registerModifier("modifier_special_bonus_evo_spell_amp_28")
export class modifier_special_bonus_evo_spell_amp_28 extends BaseTalentModifier {
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE")];
    }
    GetModifierSpellAmplify_Percentage(): number {
        return 28;
    }
}
