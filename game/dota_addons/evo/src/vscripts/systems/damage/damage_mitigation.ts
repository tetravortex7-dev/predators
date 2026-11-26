import { DamageContext, DamageScaleRule, DamageStatKey } from "../../data/damage_rules";
import { isEvoCreepUnit } from "../../lib/unit_helpers";

export function resolveLevelValue(
    value: number | readonly number[] | undefined,
    level: number,
    fallback: number
): number {
    if (value === undefined) return fallback;
    if (typeof value === "number") return value;
    if (value.length === 0) return fallback;
    const idx = Math.max(0, Math.min(value.length - 1, level - 1));
    return value[idx] ?? fallback;
}

export function readUnitStat(unit: CDOTA_BaseNPC, stat: DamageStatKey): number {
    if (stat === "MAX_HP") {
        return unit.GetMaxHealth();
    }
    if (stat === "MISSING_HP") {
        return Math.max(0, unit.GetMaxHealth() - unit.GetHealth());
    }
    if (!unit.IsHero()) {
        return 0;
    }
    const hero = unit as CDOTA_BaseNPC_Hero;
    if (stat === "STR") return hero.GetStrength();
    if (stat === "AGI") return hero.GetAgility();
    if (stat === "INT") return hero.GetIntellect(false);
    return hero.GetStrength() + hero.GetAgility() + hero.GetIntellect(false);
}

export function computePhysicalArmorFactor(armor: number): number {
    const denom = 1 + 0.06 * Math.abs(armor);
    const reduction = (0.06 * armor) / denom;
    return Math.max(0, 1 - reduction);
}

export function computeMagicalResistFactor(
    victim: CDOTA_BaseNPC,
    inflictor: CDOTABaseAbility | undefined
): number {
    const magArmor = victim.Script_GetMagicalArmorValue((inflictor ?? victim) as unknown as object);
    const clamped = Math.min(1, Math.max(-2, magArmor));
    return Math.max(0, 1 - clamped);
}

export function computeResistanceMultiplier(
    victim: CDOTA_BaseNPC,
    damageType: DamageTypes,
    inflictor: CDOTABaseAbility | undefined
): number {
    if (damageType === DamageTypes.PHYSICAL) {
        return computePhysicalArmorFactor(victim.GetPhysicalArmorValue(false));
    }
    if (damageType === DamageTypes.MAGICAL) {
        return computeMagicalResistFactor(victim, inflictor);
    }
    return 1;
}

export function computeSpellAmpMultiplier(
    attacker: CDOTA_BaseNPC,
    inflictor: CDOTABaseAbility | undefined,
    applySpellAmp: boolean
): number {
    if (!inflictor || !applySpellAmp) return 1;
    return Math.max(0, 1 + attacker.GetSpellAmplification(false));
}

export function computeModifiedDamage(
    ctx: DamageContext,
    rule: DamageScaleRule
): number {
    if ((rule.ignoreIfBaseDamageZero ?? true) && ctx.damage <= 0) {
        return ctx.damage;
    }
    if ((rule.ignoreIllusions ?? true) && ctx.attacker.IsIllusion()) {
        return ctx.damage;
    }
    if (rule.allowedDamageTypes && !rule.allowedDamageTypes.includes(ctx.damageType)) {
        return ctx.damage;
    }

    let nextDamage = ctx.damage;
    const statVal = rule.stat ? readUnitStat(ctx.attacker, rule.stat) : 0;

    if (rule.mode === "STAT_PCT_MULT") {
        const pct = resolveLevelValue(rule.pctPerPoint, ctx.level, 0);
        const factor = Math.max(0, 1 + (statVal * pct) / 100);
        nextDamage *= factor;
    } else if (rule.mode === "MULTIPLIER") {
        const mult = resolveLevelValue(rule.multiplier, ctx.level, 1);
        nextDamage *= Math.max(0, mult);
    } else {
        const flat =
            rule.mode === "FLAT_BONUS" || rule.mode === "HYBRID_STAT"
                ? resolveLevelValue(rule.flatBonus, ctx.level, 0)
                : 0;
        const ratio =
            rule.mode === "FLAT_STAT" || rule.mode === "HYBRID_STAT"
                ? resolveLevelValue(rule.statRatio, ctx.level, 0)
                : 0;
        const rawBonus = flat + statVal * ratio;
        if (rawBonus !== 0) {
            const spellAmp = computeSpellAmpMultiplier(
                ctx.attacker,
                ctx.inflictor,
                rule.applySpellAmp !== false
            );
            const resistFactor = computeResistanceMultiplier(
                ctx.victim,
                ctx.damageType,
                ctx.inflictor
            );
            nextDamage += rawBonus * spellAmp * resistFactor;
        }
    }

    if (rule.customModify) {
        const custom = rule.customModify({ ...ctx, damage: nextDamage });
        if (custom) {
            if (custom.multiplier !== undefined) {
                nextDamage *= Math.max(0, custom.multiplier);
            }
            if (custom.rawBonus !== undefined && custom.rawBonus !== 0) {
                const spellAmp = computeSpellAmpMultiplier(
                    ctx.attacker,
                    ctx.inflictor,
                    rule.applySpellAmp !== false
                );
                const resistFactor = computeResistanceMultiplier(
                    ctx.victim,
                    ctx.damageType,
                    ctx.inflictor
                );
                nextDamage += custom.rawBonus * spellAmp * resistFactor;
            }
        }
    }

    if (rule.creepMultiplier !== undefined && isEvoCreepUnit(ctx.victim)) {
        nextDamage *= Math.max(0, rule.creepMultiplier);
    }

    return Math.max(0, nextDamage);
}
