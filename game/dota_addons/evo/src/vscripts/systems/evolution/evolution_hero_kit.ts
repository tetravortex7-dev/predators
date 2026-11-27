import { BodyDefinition } from "../../data/data_schemas";
import { getTierConfig } from "../../data/game_constants";
import { PlayerEvolutionState } from "./evolution_types";

export function stripDefaultHeroAbilities(hero: CDOTA_BaseNPC_Hero): void {
    const keep = new Set<string>([
        "abyssal_underlord_portal_warp",
        "twin_gate_portal_warp",
        "ability_pluck_famango",
        "ability_capture",
        "ability_lamp_use",
    ]);

    for (let i = 0; i < hero.GetAbilityCount(); i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!ability || ability.IsNull()) continue;
        const name = ability.GetAbilityName();
        if (name.startsWith("special_bonus_") || name.startsWith("evo_empty_slot_") || keep.has(name)) continue;
        if (ability.IsHidden()) continue;
        hero.RemoveAbilityByHandle(ability);
    }
}

export function collectPurchasedAbilities(
    hero: CDOTA_BaseNPC_Hero,
    state: PlayerEvolutionState
): string[] {
    const result: string[] = [];
    for (let i = 0; i < hero.GetAbilityCount(); i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!ability || ability.IsNull() || ability.IsHidden()) continue;
        const name = ability.GetAbilityName();
        if (name.startsWith("special_bonus_")) continue;
        if (name === state.innateAbilityName || name === state.signatureAbilityName) continue;
        if (state.kitAbilityNames.includes(name)) continue;
        result.push(name);
    }
    return result;
}

function removeAbilityPreservingSlot(hero: CDOTA_BaseNPC_Hero, ability: CDOTABaseAbility): void {
    const idx = ability.GetAbilityIndex();
    if (idx >= 0 && idx < 6) {
        for (let s = 1; s <= 6; s++) {
            const placeholder = hero.FindAbilityByName(`evo_empty_slot_${s}`);
            if (placeholder && !placeholder.IsNull() && placeholder.GetAbilityIndex() >= 6) {
                hero.SwapAbilities(ability.GetAbilityName(), placeholder.GetAbilityName(), false, false);
                break;
            }
        }
    }
    hero.RemoveAbilityByHandle(ability);
}

function placeAbilityInSlot(
    hero: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    targetSlot: number
): void {
    if (ability.GetAbilityIndex() === targetSlot) return;
    const occupant = hero.GetAbilityByIndex(targetSlot);
    if (occupant && !occupant.IsNull()) {
        const occupantName = occupant.GetAbilityName();
        const abilityName = ability.GetAbilityName();
        if (occupantName !== abilityName) {
            hero.SwapAbilities(occupantName, abilityName, false, true);
        }
    }
}

export function applyBodyToHero(
    hero: CDOTA_BaseNPC_Hero,
    state: PlayerEvolutionState,
    body: BodyDefinition
): void {
    const tierConfig = getTierConfig(body.tierIndex);
    const mult = tierConfig.statMultiplier;

    if (!body.heroClass || body.heroClass.length === 0) {
        hero.SetOriginalModel(body.model);
        hero.SetModel(body.model);
    }
    hero.SetModelScale(body.modelScale);

    const attrMap: Record<BodyDefinition["primaryAttribute"], Attributes> = {
        STR: Attributes.STRENGTH,
        AGI: Attributes.AGILITY,
        INT: Attributes.INTELLECT,
        ALL: Attributes.ALL,
    };
    hero.SetPrimaryAttribute(attrMap[body.primaryAttribute]);

    const levelOffset = Math.max(0, hero.GetLevel() - 1);
    hero.SetBaseStrength(Math.floor((body.baseStr + body.strGain * levelOffset) * mult));
    hero.SetBaseAgility(Math.floor((body.baseAgi + body.agiGain * levelOffset) * mult));
    hero.SetBaseIntellect(Math.floor((body.baseInt + body.intGain * levelOffset) * mult));

    hero.SetBaseMoveSpeed(body.baseMoveSpeed);
    hero.SetBaseDamageMin(Math.floor(body.baseAttackDamageMin * mult));
    hero.SetBaseDamageMax(Math.floor(body.baseAttackDamageMax * mult));
    hero.SetPhysicalArmorBaseValue(body.baseArmor);

    const tierMod = hero.AddNewModifier(hero, undefined, "modifier_evo_hero_tier", {});
    if (tierMod !== undefined) {
        tierMod.SetStackCount(body.tierIndex);
    }

    if (body.keepDefaultHeroAbilities !== true) {
        if (body.kitAbilities && body.kitAbilities.length > 0) {
            for (const oldName of state.kitAbilityNames) {
                if (!body.kitAbilities.includes(oldName)) {
                    const oldAb = hero.FindAbilityByName(oldName);
                    if (oldAb) {
                        removeAbilityPreservingSlot(hero, oldAb);
                    }
                }
            }
            if (state.innateAbilityName && !body.kitAbilities.includes(state.innateAbilityName)) {
                const oldInnate = hero.FindAbilityByName(state.innateAbilityName);
                if (oldInnate) removeAbilityPreservingSlot(hero, oldInnate);
            }
            if (state.signatureAbilityName && !body.kitAbilities.includes(state.signatureAbilityName)) {
                const oldSig = hero.FindAbilityByName(state.signatureAbilityName);
                if (oldSig) removeAbilityPreservingSlot(hero, oldSig);
            }

            const granted: string[] = [];
            const targetKitLevel = body.kitAbilityLevel ?? 1;
            let activeSlot = 0;
            for (const abName of body.kitAbilities) {
                const ab = hero.FindAbilityByName(abName) ?? hero.AddAbility(abName);
                if (ab && !ab.IsNull()) {
                    const isInnate = abName === body.innateAbility;
                    if (!isInnate) {
                        const isUltimate = ab.GetAbilityType() === AbilityTypes.ULTIMATE;
                        const targetSlot = isUltimate ? 5 : activeSlot;
                        placeAbilityInSlot(hero, ab, targetSlot);
                        if (!isUltimate) {
                            activeSlot += 1;
                        }
                    }
                    ab.SetHidden(false);
                    const desiredLevel = isInnate ? 1 : 0;
                    if (ab.GetLevel() !== desiredLevel) {
                        ab.SetLevel(desiredLevel);
                    }
                }
                granted.push(abName);
            }
            state.kitAbilityNames = granted;
            state.innateAbilityName = undefined;
            state.signatureAbilityName = undefined;
        } else {
            for (const oldName of state.kitAbilityNames) {
                if (oldName !== body.innateAbility && oldName !== body.signatureAbility) {
                    const oldAb = hero.FindAbilityByName(oldName);
                    if (oldAb) removeAbilityPreservingSlot(hero, oldAb);
                }
            }
            state.kitAbilityNames = [];

            if (state.innateAbilityName && state.innateAbilityName !== body.innateAbility) {
                const oldInnate = hero.FindAbilityByName(state.innateAbilityName);
                if (oldInnate) {
                    removeAbilityPreservingSlot(hero, oldInnate);
                }
            }
            if (state.signatureAbilityName && state.signatureAbilityName !== body.signatureAbility) {
                const oldSig = hero.FindAbilityByName(state.signatureAbilityName);
                if (oldSig) {
                    removeAbilityPreservingSlot(hero, oldSig);
                }
            }

            const signature =
                hero.FindAbilityByName(body.signatureAbility) ?? hero.AddAbility(body.signatureAbility);
            if (signature && !signature.IsNull()) {
                placeAbilityInSlot(hero, signature, 0);
                signature.SetHidden(false);
                if (signature.GetLevel() === 0) {
                    signature.SetLevel(1);
                }
            }

            const innate = hero.FindAbilityByName(body.innateAbility) ?? hero.AddAbility(body.innateAbility);
            if (innate && !innate.IsNull()) {
                placeAbilityInSlot(hero, innate, 1);
                innate.SetHidden(false);
                if (innate.GetLevel() === 0) {
                    innate.SetLevel(1);
                }
            }

            state.innateAbilityName = body.innateAbility;
            state.signatureAbilityName = body.signatureAbility;
        }
    } else {
        state.innateAbilityName = undefined;
        state.signatureAbilityName = undefined;
        state.kitAbilityNames = [];
    }

    hero.CalculateStatBonus(true);
}
