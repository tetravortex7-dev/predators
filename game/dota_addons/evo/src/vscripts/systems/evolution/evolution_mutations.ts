import { EventBus } from "../../core/EventBus";
import { EVO_CONSTANTS } from "../../data/game_constants";
import { getMutationDefinition } from "../../data/mutations_catalog";
import {
    PlayerEvolutionState,
    SelectMutationPayload,
    rollMutationChoices,
    syncPlayerEvoNetTable,
} from "./evolution_types";

export function handleSelectMutationDraft(params: {
    event: SelectMutationPayload;
    eventBus: EventBus;
    getState: (playerId: PlayerID) => PlayerEvolutionState;
    checkProgress: (playerId: PlayerID) => void;
}): void {
    if (!EVO_CONSTANTS.ENABLE_MUTATION_DRAFT) return;
    const playerId = params.event.PlayerID;
    if (!PlayerResource.IsValidPlayerID(playerId)) return;

    const hero = PlayerResource.GetSelectedHeroEntity(playerId);
    if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

    const state = params.getState(playerId);
    if (state.pendingDraftType !== "MUTATION") return;

    const slotIndex = params.event.slot ?? state.pendingMutationSlot;
    if (slotIndex !== state.pendingMutationSlot) return;

    const optionIndex = params.event.option_index;
    if (optionIndex === undefined || optionIndex < 0 || optionIndex >= state.draftOptions.length) {
        return;
    }

    const mutationId = state.draftOptions[optionIndex];
    const mutationDef = getMutationDefinition(mutationId);
    if (!mutationDef) return;

    state.mutations[slotIndex] = mutationDef.id;
    state.pendingDraftType = "NONE";
    state.draftOptions = [];

    hero.AddNewModifier(hero, undefined, mutationDef.modifierName, {
        mutation_id: mutationDef.id,
    });

    params.eventBus.emit("mutation_applied", {
        playerId,
        slotIndex,
        mutationId: mutationDef.id,
    });

    params.checkProgress(playerId);
    syncPlayerEvoNetTable(playerId, state);
}

export function handleRerollMutationDraft(params: {
    playerId: PlayerID;
    getState: (playerId: PlayerID) => PlayerEvolutionState;
}): void {
    if (!EVO_CONSTANTS.ENABLE_MUTATION_DRAFT) return;
    if (!PlayerResource.IsValidPlayerID(params.playerId)) return;

    const hero = PlayerResource.GetSelectedHeroEntity(params.playerId);
    if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

    const state = params.getState(params.playerId);
    if (state.pendingDraftType !== "MUTATION") return;
    if (state.mutationRerollsRemaining <= 0) return;

    const rerolled = rollMutationChoices(
        state,
        state.draftOptions,
        EVO_CONSTANTS.MUTATION_DRAFT_CHOICES
    );
    if (rerolled.length === 0) return;

    state.mutationRerollsRemaining -= 1;
    state.draftOptions = rerolled;
    syncPlayerEvoNetTable(params.playerId, state);
}

export function openDevMutationDraft(
    playerId: PlayerID,
    getState: (playerId: PlayerID) => PlayerEvolutionState
): void {
    const state = getState(playerId);
    const openSlot = state.mutations.findIndex((m) => m === undefined);
    const slotIndex = openSlot !== -1 ? openSlot : 0;
    const choices = rollMutationChoices(
        state,
        state.draftOptions,
        EVO_CONSTANTS.MUTATION_DRAFT_CHOICES
    );
    if (choices.length > 0) {
        state.unlockedMutationSlots[slotIndex] = true;
        state.pendingDraftType = "MUTATION";
        state.pendingMutationSlot = slotIndex;
        state.draftOptions = choices;
        syncPlayerEvoNetTable(playerId, state);
    }
}
