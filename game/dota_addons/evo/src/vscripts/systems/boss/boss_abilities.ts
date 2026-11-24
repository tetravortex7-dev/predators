import { BossAbilityRule, BossDefinition } from "../../data/bosses_catalog";
import {
    DEFAULT_FARM_MANA_RESERVE,
    IGNORED_BOSS_ABILITIES,
    distance2D,
} from "./boss_types";

function isCastableCombatAbility(ability: CDOTABaseAbility | undefined): ability is CDOTABaseAbility {
    if (!ability || ability.IsNull() || ability.GetLevel() <= 0) return false;
    const name = ability.GetAbilityName();
    if (IGNORED_BOSS_ABILITIES.has(name) || name.startsWith("special_bonus_")) return false;
    if (ability.IsHidden() || ability.IsPassive() || ability.IsToggle() || ability.IsAttributeBonus()) {
        return false;
    }
    return ability.IsFullyCastable();
}

function findAbilityRule(definition: BossDefinition, abilityName: string): BossAbilityRule | undefined {
    for (const rule of definition.abilityRules) {
        if (rule.abilityName === abilityName) {
            return rule;
        }
    }
    return undefined;
}

function castAbilityAtTarget(
    unit: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    target: CDOTA_BaseNPC,
    dist: number,
    customMaxDistance?: number
): boolean {
    const origin = unit.GetAbsOrigin();
    const behavior = ability.GetBehaviorInt();

    if ((behavior & AbilityBehavior.NO_TARGET) !== 0) {
        const isUltimate = ability.GetAbilityType() === AbilityTypes.ULTIMATE;
        const maxRange = customMaxDistance ?? (isUltimate ? 800 : 380);
        if (dist > maxRange) return false;
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_NO_TARGET,
            AbilityIndex: ability.entindex(),
            Queue: false,
        });
        return true;
    }

    if ((behavior & AbilityBehavior.UNIT_TARGET) !== 0) {
        const castRange = customMaxDistance ?? Math.max(300, ability.GetCastRange(origin, target));
        if (dist > castRange) return false;
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_TARGET,
            TargetIndex: target.entindex(),
            AbilityIndex: ability.entindex(),
            Queue: false,
        });
        return true;
    }

    if ((behavior & AbilityBehavior.POINT) !== 0) {
        const castRange = customMaxDistance ?? Math.max(300, ability.GetCastRange(origin, target));
        if (dist > castRange) return false;
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_POSITION,
            Position: target.GetAbsOrigin(),
            AbilityIndex: ability.entindex(),
            Queue: false,
        });
        return true;
    }

    return false;
}

export function tryUseMobilityItem(unit: CDOTA_BaseNPC): void {
    const phase = unit.FindItemInInventory("item_phase_boots");
    if (phase && phase.IsFullyCastable()) {
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_NO_TARGET,
            AbilityIndex: phase.entindex(),
            Queue: false,
        });
    }
}

export function tryCastDefensiveItem(unit: CDOTA_BaseNPC, enemyHeroCount: number, dist: number): boolean {
    const hpRatio = unit.GetHealthPercent() / 100;

    if (hpRatio <= 0.85 || enemyHeroCount >= 2) {
        const bkb = unit.FindItemInInventory("item_black_king_bar");
        if (bkb && bkb.IsFullyCastable() && dist <= 700) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_NO_TARGET,
                AbilityIndex: bkb.entindex(),
                Queue: false,
            });
            return true;
        }
    }

    if (hpRatio <= 0.9 && dist <= 550) {
        const bladeMail = unit.FindItemInInventory("item_blade_mail");
        if (bladeMail && bladeMail.IsFullyCastable()) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_NO_TARGET,
                AbilityIndex: bladeMail.entindex(),
                Queue: false,
            });
            return true;
        }
    }

    if (dist <= 750) {
        const shiva = unit.FindItemInInventory("item_shivas_guard");
        if (shiva && shiva.IsFullyCastable()) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_NO_TARGET,
                AbilityIndex: shiva.entindex(),
                Queue: false,
            });
            return true;
        }
    }

    return false;
}

function tryCastBossHeroAbilities(
    unit: CDOTA_BaseNPC,
    definition: BossDefinition,
    target: CDOTA_BaseNPC,
    nearbyHeroCount: number,
    inCourage: boolean
): boolean {
    const origin = unit.GetAbsOrigin();
    const dist = distance2D(origin, target.GetAbsOrigin());
    const hpRatio = unit.GetHealthPercent() / 100;

    for (let i = 0; i < unit.GetAbilityCount(); i++) {
        const ability = unit.GetAbilityByIndex(i);
        if (!isCastableCombatAbility(ability)) continue;

        const name = ability.GetAbilityName();
        const rule = findAbilityRule(definition, name);
        const isUltimate =
            ability.GetAbilityType() === AbilityTypes.ULTIMATE || rule?.usage === "ULTIMATE_COMBAT";

        if (isUltimate) {
            const worthUltimate =
                inCourage ||
                nearbyHeroCount >= 2 ||
                hpRatio <= 0.75 ||
                target.GetHealthPercent() <= 70;
            if (!worthUltimate) continue;
        }

        if (castAbilityAtTarget(unit, ability, target, dist, rule?.maxCastDistance)) {
            return true;
        }
    }

    return false;
}

export function tryCastHeroCombatKit(
    unit: CDOTA_BaseNPC,
    definition: BossDefinition,
    target: CDOTA_BaseNPC,
    nearbyHeroCount: number,
    inCourage: boolean
): boolean {
    const dist = distance2D(unit.GetAbsOrigin(), target.GetAbsOrigin());

    const abyssal = unit.FindItemInInventory("item_abyssal_blade");
    if (abyssal && abyssal.IsFullyCastable() && dist <= 300) {
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_TARGET,
            TargetIndex: target.entindex(),
            AbilityIndex: abyssal.entindex(),
            Queue: false,
        });
        return true;
    }

    if (tryCastDefensiveItem(unit, nearbyHeroCount, dist)) {
        return true;
    }

    return tryCastBossHeroAbilities(unit, definition, target, nearbyHeroCount, inCourage);
}

function getReadyUltimateManaCost(unit: CDOTA_BaseNPC): number {
    for (let i = 0; i < unit.GetAbilityCount(); i++) {
        const ability = unit.GetAbilityByIndex(i);
        if (!ability || ability.IsNull() || ability.GetLevel() <= 0) continue;
        if (ability.GetAbilityType() !== AbilityTypes.ULTIMATE) continue;
        if (ability.GetCooldownTimeRemaining() <= 10) {
            return ability.GetManaCost(ability.GetLevel() - 1);
        }
    }
    return 0;
}

export function tryCastFarmAbilities(
    unit: CDOTA_BaseNPC,
    definition: BossDefinition,
    targetCreep: CDOTA_BaseNPC,
    nearbyCreeps: CDOTA_BaseNPC[]
): boolean {
    const origin = unit.GetAbsOrigin();
    const dist = distance2D(origin, targetCreep.GetAbsOrigin());
    const maxMana = Math.max(1, unit.GetMaxMana());
    const currentMana = unit.GetMana();
    const reservedUltMana = getReadyUltimateManaCost(unit);

    for (const rule of definition.abilityRules) {
        if (rule.usage !== "FARM_AND_HERO") continue;

        const ability = unit.FindAbilityByName(rule.abilityName);
        if (!isCastableCombatAbility(ability)) continue;

        const manaCost = ability.GetManaCost(ability.GetLevel() - 1);
        const manaAfterCast = currentMana - manaCost;
        const minReserveRatio = rule.minManaRatioForFarm ?? DEFAULT_FARM_MANA_RESERVE;

        if (manaAfterCast / maxMana < minReserveRatio) continue;
        if (reservedUltMana > 0 && manaAfterCast < reservedUltMana) continue;

        const closeCreeps = nearbyCreeps.filter(
            (c) => distance2D(origin, c.GetAbsOrigin()) <= (rule.maxCastDistance ?? 380)
        );
        const minTargets = rule.minFarmTargets ?? 2;
        if (closeCreeps.length < minTargets) continue;

        let fullHpCount = 0;
        let totalHpPct = 0;
        for (const c of closeCreeps) {
            const hpPct = c.GetHealthPercent();
            totalHpPct += hpPct;
            if (hpPct >= 85) {
                fullHpCount += 1;
            }
        }
        const avgHpPct = totalHpPct / closeCreeps.length;
        if (fullHpCount < minTargets || avgHpPct < 80) continue;

        if (castAbilityAtTarget(unit, ability, targetCreep, dist, rule.maxCastDistance)) {
            return true;
        }
    }

    return false;
}
