import { getBodyDefinition } from "../../data/bodies_catalog";
import { MutationSlotType } from "../../data/data_schemas";
import { EVO_CONSTANTS, getTierConfig } from "../../data/game_constants";
import { getMutationDefinition } from "../../data/mutations_catalog";

export type PendingDraftType = "NONE" | "BODY" | "ABILITY" | "MUTATION";

export interface PlayerEvolutionState {
    bodyId: string;
    tierIndex: number;
    biomass: number;
    evoPoints: number;
    highestTierUnlocked: number;
    mutations: [string | undefined, string | undefined, string | undefined];
    unlockedAbilitySlots: boolean[];
    unlockedMutationSlots: boolean[];
    pendingDraftType: PendingDraftType;
    pendingMutationSlot: number;
    draftOptions: string[];
    innateAbilityName?: string;
    signatureAbilityName?: string;
    kitAbilityNames: string[];
}

export interface SelectBodyDraftPayload {
    PlayerID: PlayerID;
    option_index?: number;
}

export interface SelectAbilityDraftPayload {
    PlayerID: PlayerID;
    option_index?: number;
}

export interface SelectMutationPayload {
    PlayerID: PlayerID;
    slot?: number;
    option_index?: number;
}

export const MUTATION_SLOT_ORDER: readonly MutationSlotType[] = [
    "ACTIVE_UPGRADE",
    "PASSIVE_SLOT_1",
    "PASSIVE_SLOT_2",
];

export function findFloorEvoThreshold(points: number): number {
    let floorValue = 0;
    for (const threshold of EVO_CONSTANTS.EVO_THRESHOLDS) {
        if (points >= threshold) {
            floorValue = threshold;
        }
    }
    return floorValue;
}

export function reapplyMutationsToHero(hero: CDOTA_BaseNPC_Hero, state: PlayerEvolutionState): void {
    for (const mutationId of state.mutations) {
        if (!mutationId) continue;
        const mutationDef = getMutationDefinition(mutationId);
        if (!mutationDef) continue;
        hero.AddNewModifier(hero, undefined, mutationDef.modifierName, {
            mutation_id: mutationDef.id,
        });
    }
}

export function syncPlayerEvoNetTable(playerId: PlayerID, state: PlayerEvolutionState): void {
    const tierConfig = getTierConfig(state.tierIndex);
    const key = tostring(playerId);
    const existing = (CustomNetTables.GetTableValue("player_evo" as never, key) ?? {}) as Record<
        string,
        unknown
    >;

    existing.body_id = state.bodyId;
    existing.tier_index = state.tierIndex;
    existing.tier_label = tierConfig.label;
    existing.evo_points = state.evoPoints;
    existing.biomass = state.biomass;
    existing.mutations = state.mutations;
    existing.pending_draft_type = state.pendingDraftType;
    existing.pending_mutation_slot = state.pendingMutationSlot;
    existing.draft_options = state.draftOptions;

    const draftMeta: Record<string, Record<string, unknown>> = {};
    if (state.pendingDraftType === "BODY") {
        for (const optId of state.draftOptions) {
            const b = getBodyDefinition(optId);
            if (!b) continue;
            const abList =
                b.kitAbilities && b.kitAbilities.length > 0
                    ? b.kitAbilities
                    : [b.signatureAbility, b.innateAbility];
            draftMeta[optId] = {
                hero_class: b.heroClass ?? "",
                attr: b.primaryAttribute,
                abilities: abList,
                ms: b.baseMoveSpeed,
                str: b.baseStr,
                agi: b.baseAgi,
                int: b.baseInt,
                tier_index: b.tierIndex,
            };
        }
    }
    existing.draft_meta = draftMeta;

    CustomNetTables.SetTableValue("player_evo" as never, key, existing as never);
}
