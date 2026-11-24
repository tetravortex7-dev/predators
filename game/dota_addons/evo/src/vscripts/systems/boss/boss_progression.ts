import { BossDefinition } from "../../data/bosses_catalog";
import { EVO_CONSTANTS } from "../../data/game_constants";
import {
    ActiveBossRuntime,
    COMBINED_POTION_COST,
    HEAL_POTION_BUY_COOLDOWN,
    HEAL_POTION_COST,
    HEAL_POTION_HP_THRESHOLD,
    IGNORED_BOSS_ABILITIES,
    computeBossScale,
    getBossRequiredXp,
} from "./boss_types";

function canUpgradeBossAbility(
    hero: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility | undefined,
    skipped: ReadonlySet<string>
): ability is CDOTABaseAbility {
    if (!ability || ability.IsNull()) return false;
    const name = ability.GetAbilityName();
    if (skipped.has(name) || IGNORED_BOSS_ABILITIES.has(name)) return false;
    if (ability.IsHidden()) return false;
    if (ability.GetLevel() >= ability.GetMaxLevel()) return false;
    if (hero.GetLevel() < ability.GetHeroLevelRequiredToUpgrade()) return false;
    const learnResult = ability.CanAbilityBeUpgraded() as unknown;
    if (learnResult === false || (typeof learnResult === "number" && learnResult !== 0)) {
        return false;
    }
    return true;
}

function pickNextAbilityToUpgrade(
    hero: CDOTA_BaseNPC_Hero,
    definition: BossDefinition,
    skipped: ReadonlySet<string>
): CDOTABaseAbility | undefined {
    const abilityCount = hero.GetAbilityCount();

    for (let i = 0; i < abilityCount; i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!canUpgradeBossAbility(hero, ability, skipped)) continue;
        if (ability.GetAbilityType() === AbilityTypes.ULTIMATE) {
            return ability;
        }
    }

    for (const preferredName of definition.abilityUpgradeOrder) {
        const ability = hero.FindAbilityByName(preferredName);
        if (canUpgradeBossAbility(hero, ability, skipped) && ability.GetLevel() === 0) {
            return ability;
        }
    }

    for (const preferredName of definition.abilityUpgradeOrder) {
        const ability = hero.FindAbilityByName(preferredName);
        if (canUpgradeBossAbility(hero, ability, skipped)) {
            return ability;
        }
    }

    for (let i = 0; i < abilityCount; i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!canUpgradeBossAbility(hero, ability, skipped)) continue;
        const name = ability.GetAbilityName();
        if (name.startsWith("special_bonus_") || ability.IsAttributeBonus()) continue;
        return ability;
    }

    for (let i = 0; i < abilityCount; i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!canUpgradeBossAbility(hero, ability, skipped)) continue;
        if (ability.GetAbilityName().startsWith("special_bonus_")) {
            return ability;
        }
    }

    return undefined;
}

export function upgradeBossHeroAbilities(hero: CDOTA_BaseNPC_Hero, definition: BossDefinition): void {
    const skipped = new Set<string>();
    let safety = 40;
    while (hero.GetAbilityPoints() > 0 && safety > 0) {
        safety -= 1;
        const pointsBefore = hero.GetAbilityPoints();
        const chosen = pickNextAbilityToUpgrade(hero, definition, skipped);
        if (!chosen) break;

        hero.UpgradeAbility(chosen);
        if (hero.GetAbilityPoints() >= pointsBefore) {
            skipped.add(chosen.GetAbilityName());
        }
    }
}

export function syncBossAbilitiesLevel(unit: CDOTA_BaseNPC, bossLevel: number): void {
    const targetAbilityLevel = Math.min(15, Math.max(1, Math.floor((bossLevel - 1) / 10) + 1));
    for (let i = 0; i < unit.GetAbilityCount(); i++) {
        const ability = unit.GetAbilityByIndex(i);
        if (!ability || ability.IsNull()) continue;
        const capped = Math.min(ability.GetMaxLevel(), targetAbilityLevel);
        if (ability.GetLevel() < capped) {
            ability.SetLevel(capped);
        }
    }
}

export function equipPurchasedItems(unit: CDOTA_BaseNPC, runtime: ActiveBossRuntime): void {
    for (let i = 0; i < runtime.nextItemIndex; i++) {
        const step = runtime.itemBuild[i];
        if (step !== undefined) {
            unit.AddItemByName(step.itemName);
        }
    }
}

export function grantBossProgress(runtime: ActiveBossRuntime, xpDelta: number, goldDelta: number): void {
    const unit = runtime.unit;
    if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return;

    runtime.xp += xpDelta;
    runtime.gold += goldDelta;

    if (unit.IsHero()) {
        const nativeLevel = unit.GetLevel();
        if (nativeLevel > runtime.level) {
            runtime.level = nativeLevel;
        }
    }

    let leveledUp = false;
    while (runtime.level < EVO_CONSTANTS.BOSS_MAX_LEVEL) {
        const nextLevel = runtime.level + 1;
        const requiredXp = getBossRequiredXp(nextLevel);
        if (runtime.xp < requiredXp) break;

        runtime.level = nextLevel;
        leveledUp = true;
        if (unit.IsHero()) {
            while (unit.GetLevel() < runtime.level) {
                unit.HeroLevelUp(false);
            }
        } else if (unit.IsCreature()) {
            unit.CreatureLevelUp(1);
        }
    }

    if (leveledUp) {
        unit.SetModelScale(computeBossScale(runtime.definition, runtime.level));
    }

    if (unit.IsHero()) {
        if (unit.GetAbilityPoints() > 0) {
            upgradeBossHeroAbilities(unit, runtime.definition);
        }
    } else {
        syncBossAbilitiesLevel(unit, runtime.level);
    }

    while (runtime.nextItemIndex < runtime.itemBuild.length) {
        const nextStep = runtime.itemBuild[runtime.nextItemIndex];
        if (runtime.gold < nextStep.goldCost) break;

        runtime.gold -= nextStep.goldCost;
        runtime.nextItemIndex += 1;
        unit.AddItemByName(nextStep.itemName);
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] ${runtime.definition.id} (Lv.${runtime.level}) bought ${nextStep.itemName}`,
                0,
                0
            );
        }
    }
}

export function dropBossCore(_definition: BossDefinition, origin: Vector): void {
    const item = CreateItem("item_aghanims_shard_roshan", undefined, undefined);
    if (!item) return;

    item.SetPurchaseTime(0);
    CreateItemOnPositionSync(origin, item);
    const destination = Vector(
        origin.x + RandomFloat(-140, 140),
        origin.y + RandomFloat(-140, 140),
        origin.z
    );
    item.LaunchLoot(false, 280, 0.7, destination, undefined);
}

function hasFreeInventorySlot(unit: CDOTA_BaseNPC): boolean {
    for (let slot = 0; slot < 6; slot++) {
        const item = unit.GetItemInSlot(slot);
        if (!item || item.IsNull()) return true;
    }
    return false;
}

export function tryMaintainBossHealth(
    runtime: ActiveBossRuntime,
    unit: CDOTA_BaseNPC,
    hpRatio: number,
    now: number
): void {
    if (hpRatio > HEAL_POTION_HP_THRESHOLD) return;
    if (
        unit.HasModifier("modifier_heal_potion_active") ||
        unit.HasModifier("modifier_combined_potion_active") ||
        unit.HasModifier("modifier_flask_healing")
    ) {
        return;
    }

    const existing =
        unit.FindItemInInventory("item_combined_potion") ??
        unit.FindItemInInventory("item_heal_potion") ??
        unit.FindItemInInventory("item_flask");

    if (existing && !existing.IsNull() && existing.IsFullyCastable()) {
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_TARGET,
            TargetIndex: unit.entindex(),
            AbilityIndex: existing.entindex(),
            Queue: false,
        });
        return;
    }

    if (now - runtime.lastHealBuyTime < HEAL_POTION_BUY_COOLDOWN) return;
    if (!hasFreeInventorySlot(unit)) return;

    const maxMana = unit.GetMaxMana();
    const lowMana = maxMana > 0 && unit.GetMana() / maxMana < 0.55;
    let potionName: string | undefined;
    let potionCost = 0;

    if (lowMana && runtime.gold >= COMBINED_POTION_COST) {
        potionName = "item_combined_potion";
        potionCost = COMBINED_POTION_COST;
    } else if (runtime.gold >= HEAL_POTION_COST) {
        potionName = "item_heal_potion";
        potionCost = HEAL_POTION_COST;
    }

    if (!potionName) return;

    runtime.gold -= potionCost;
    runtime.lastHealBuyTime = now;
    const bought = unit.AddItemByName(potionName);
    if (bought && !bought.IsNull()) {
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.CAST_TARGET,
            TargetIndex: unit.entindex(),
            AbilityIndex: bought.entindex(),
            Queue: false,
        });
    }
}

export function consumeRuneForBoss(
    runtime: ActiveBossRuntime,
    unit: CDOTA_BaseNPC,
    rune: CBaseEntity
): void {
    if (!rune || rune.IsNull() || !IsValidEntity(rune)) return;
    const runeApi = rune as unknown as { GetRuneType?: () => RuneType };
    const runeType = runeApi.GetRuneType !== undefined ? runeApi.GetRuneType() : RuneType.BOUNTY;

    if (runeType === RuneType.BOUNTY) {
        grantBossProgress(runtime, 200, 220);
    } else if (runeType === RuneType.DOUBLEDAMAGE) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_doubledamage", { duration: 45 });
    } else if (runeType === RuneType.HASTE) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_haste", { duration: 22 });
    } else if (runeType === RuneType.REGENERATION) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_regen", { duration: 30 });
    } else if (runeType === RuneType.ARCANE) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_arcane", { duration: 50 });
    } else if (runeType === RuneType.INVISIBILITY) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_invis", { duration: 45 });
    } else if (runeType === RuneType.SHIELD) {
        unit.AddNewModifier(unit, undefined, "modifier_rune_shield", { duration: 75 });
    } else {
        grantBossProgress(runtime, 150, 150);
    }

    unit.EmitSound("General.RunePickUp");
    UTIL_Remove(rune);
}
