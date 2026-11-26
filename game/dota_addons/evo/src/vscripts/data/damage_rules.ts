import {
    DamageFilterModule,
    DamagePostModifier,
    DamageScaleRule,
} from "./damage/damage_filter_types";
import { DMG_FILTER_NYX } from "./damage/dmgFilterNyx";
import { DMG_FILTER_SPECTRE } from "./damage/dmgFilterSpectre";

export type {
    CustomDamageResult,
    DamageContext,
    DamageFilterModule,
    DamagePostModifier,
    DamageScaleMode,
    DamageScaleRule,
    DamageStatKey,
} from "./damage/damage_filter_types";

const HERO_DAMAGE_MODULES: readonly DamageFilterModule[] = [
    DMG_FILTER_NYX,
    DMG_FILTER_SPECTRE,
];

function collectDamageRules(): Record<string, DamageScaleRule> {
    const merged: Record<string, DamageScaleRule> = {};
    for (const mod of HERO_DAMAGE_MODULES) {
        for (const [abilityName, rule] of Object.entries(mod.rules)) {
            merged[abilityName] = rule;
        }
    }
    return merged;
}

function collectPostModifiers(): readonly DamagePostModifier[] {
    const collected: DamagePostModifier[] = [];
    for (const mod of HERO_DAMAGE_MODULES) {
        if (!mod.postModifiers) continue;
        for (const hook of mod.postModifiers) {
            collected.push(hook);
        }
    }
    return collected;
}

export const EVO_DAMAGE_RULES: Record<string, DamageScaleRule> = collectDamageRules();
export const EVO_DAMAGE_POST_MODIFIERS: readonly DamagePostModifier[] = collectPostModifiers();

export function getDamageRule(abilityName: string): DamageScaleRule | undefined {
    return EVO_DAMAGE_RULES[abilityName];
}

export function getGlobalDamagePostModifiers(): readonly DamagePostModifier[] {
    return EVO_DAMAGE_POST_MODIFIERS;
}
