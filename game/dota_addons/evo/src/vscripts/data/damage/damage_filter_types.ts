export type DamageStatKey = "STR" | "AGI" | "INT" | "ALL" | "MAX_HP" | "MISSING_HP";

export type DamageScaleMode =
    | "STAT_PCT_MULT"
    | "FLAT_STAT"
    | "FLAT_BONUS"
    | "MULTIPLIER"
    | "HYBRID_STAT";

export interface DamageContext {
    attacker: CDOTA_BaseNPC;
    victim: CDOTA_BaseNPC;
    inflictor?: CDOTABaseAbility;
    abilityName?: string;
    isItem: boolean;
    damageType: DamageTypes;
    damage: number;
    level: number;
}

export interface CustomDamageResult {
    rawBonus?: number;
    multiplier?: number;
}

export interface DamageScaleRule {
    mode: DamageScaleMode;
    stat?: DamageStatKey;
    pctPerPoint?: number | readonly number[];
    statRatio?: number | readonly number[];
    flatBonus?: number | readonly number[];
    multiplier?: number | readonly number[];
    allowedDamageTypes?: readonly DamageTypes[];
    applySpellAmp?: boolean;
    ignoreIfBaseDamageZero?: boolean;
    ignoreIllusions?: boolean;
    creepMultiplier?: number;
    customModify?: (ctx: DamageContext) => CustomDamageResult | undefined;
}

export type DamagePostModifier = (ctx: DamageContext, currentDamage: number) => number;

export interface DamageFilterModule {
    rules: Record<string, DamageScaleRule>;
    postModifiers?: readonly DamagePostModifier[];
}
