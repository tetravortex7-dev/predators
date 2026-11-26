import { getBodyDefinition } from "../../data/bodies_catalog";
import { MutationSlotType } from "../../data/data_schemas";
import { EVO_CONSTANTS, getTierConfig } from "../../data/game_constants";
import { EVO_MUTATIONS_CATALOG, getMutationDefinition } from "../../data/mutations_catalog";

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
    mutationRerollsRemaining: number;
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

export function pickRandomSubset<T>(items: readonly T[], maxCount: number): T[] {
    const pool = [...items];
    for (let i = pool.length - 1; i > 0; i--) {
        const j = RandomInt(0, i);
        const tmp = pool[i];
        pool[i] = pool[j];
        pool[j] = tmp;
    }
    return pool.slice(0, Math.min(maxCount, pool.length));
}

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

export function rollMutationChoices(
    state: PlayerEvolutionState,
    excludeIds: readonly string[],
    count: number
): string[] {
    const owned = new Set<string>();
    for (const mutId of state.mutations) {
        if (mutId) owned.add(mutId);
    }
    const excluded = new Set<string>(excludeIds);

    const available = EVO_MUTATIONS_CATALOG.filter((m) => !owned.has(m.id));
    const fresh = available.filter((m) => !excluded.has(m.id));

    const picked = pickRandomSubset(
        fresh.map((m) => m.id),
        count
    );

    if (picked.length < count) {
        const pickedSet = new Set<string>(picked);
        const fallback = available.filter((m) => !pickedSet.has(m.id)).map((m) => m.id);
        for (const id of pickRandomSubset(fallback, count - picked.length)) {
            picked.push(id);
        }
    }

    return picked;
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
    existing.mutation_rerolls = state.mutationRerollsRemaining;
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
    } else if (state.pendingDraftType === "MUTATION") {
        for (const optId of state.draftOptions) {
            const m = getMutationDefinition(optId);
            if (!m) continue;
            draftMeta[optId] = {
                icon: m.iconAbility ?? "alchemist_chemical_rage",
            };
        }
    }
    existing.draft_meta = draftMeta;

    CustomNetTables.SetTableValue("player_evo" as never, key, existing as never);
}
