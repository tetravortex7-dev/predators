import { EventBus } from "../core/EventBus";
import { LazyPrecacheManager } from "../core/LazyPrecacheManager";
import {
    EVO_DEFAULT_START_BODY_ID,
    getBodiesForTier,
    getBodyDefinition,
} from "../data/bodies_catalog";
import { BodyDefinition } from "../data/data_schemas";
import {
    EVO_CONSTANTS,
    EVO_TIERS,
    getNextTierConfig,
} from "../data/game_constants";
import { getMutationDefinition, getMutationsForSlot } from "../data/mutations_catalog";
import { HeroAppearance } from "../lib/HeroAppearance";
import { SpellShopManager } from "./SpellShopManager";
import {
    applyBodyToHero,
    collectPurchasedAbilities,
    stripDefaultHeroAbilities,
} from "./evolution/evolution_hero_kit";
import {
    MUTATION_SLOT_ORDER,
    PlayerEvolutionState,
    SelectAbilityDraftPayload,
    SelectBodyDraftPayload,
    SelectMutationPayload,
    findFloorEvoThreshold,
    reapplyMutationsToHero,
    syncPlayerEvoNetTable,
} from "./evolution/evolution_types";

export class EvolutionManager {
    private readonly playerStates: Map<PlayerID, PlayerEvolutionState> = new Map();

    constructor(
        private readonly eventBus: EventBus,
        private readonly spellShopManager: SpellShopManager,
        private readonly lazyPrecacheManager: LazyPrecacheManager
    ) {}

    public init(): void {
        ListenToGameEvent("npc_spawned", (event) => this.onNpcSpawned(event), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        CustomGameEventManager.RegisterListener("evo_select_body_draft", (_, event) => {
            this.onSelectBodyDraft(event as unknown as SelectBodyDraftPayload);
        });
        CustomGameEventManager.RegisterListener("evo_select_ability_draft", (_, event) => {
            this.onSelectAbilityDraft(event as unknown as SelectAbilityDraftPayload);
        });
        CustomGameEventManager.RegisterListener("evo_select_mutation", (_, event) => {
            this.onSelectMutation(event as unknown as SelectMutationPayload);
        });

        this.eventBus.on("hero_leveled_up", ({ playerId, newLevel }) => {
            this.onHeroLeveledUp(playerId, newLevel);
        });
        this.eventBus.on("biomass_collected", ({ playerId, amount }) => {
            this.addBiomass(playerId, amount);
        });
        this.eventBus.on("dev_command", ({ playerId, command, args }) => {
            this.onDevCommand(playerId, command, args);
        });
    }

    public getPlayerBody(playerId: PlayerID): BodyDefinition | undefined {
        const state = this.playerStates.get(playerId);
        if (!state) return getBodyDefinition(EVO_DEFAULT_START_BODY_ID);
        return getBodyDefinition(state.bodyId);
    }

    public getPlayerTierIndex(playerId: PlayerID): number {
        return this.getOrCreateState(playerId).tierIndex;
    }

    public getPlayerMutations(playerId: PlayerID): string[] {
        const state = this.playerStates.get(playerId);
        if (!state) return [];
        const result: string[] = [];
        for (const mutationId of state.mutations) {
            if (mutationId !== undefined) {
                result.push(mutationId);
            }
        }
        return result;
    }

    public addBiomass(playerId: PlayerID, amount: number): void {
        if (!PlayerResource.IsValidPlayerID(playerId) || amount <= 0) return;
        const state = this.getOrCreateState(playerId);
        state.biomass += amount;
        this.addEvoPoints(playerId, amount);
    }

    public addEvoPoints(playerId: PlayerID, delta: number): void {
        if (!PlayerResource.IsValidPlayerID(playerId) || delta === 0) return;
        const state = this.getOrCreateState(playerId);
        const previousPoints = state.evoPoints;
        state.evoPoints = Math.max(0, state.evoPoints + delta);

        this.eventBus.emit("evo_points_changed", {
            playerId,
            previousPoints,
            newPoints: state.evoPoints,
            delta: state.evoPoints - previousPoints,
        });

        this.checkEvolutionProgress(playerId);
        syncPlayerEvoNetTable(playerId, state);
    }

    public morphHero(playerId: PlayerID, bodyId: string): boolean {
        if (!PlayerResource.IsValidPlayerID(playerId)) return false;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return false;

        const body = getBodyDefinition(bodyId);
        if (!body) return false;

        const state = this.getOrCreateState(playerId);
        if (
            body.heroClass &&
            body.heroClass.length > 0 &&
            hero.GetUnitName() !== body.heroClass &&
            !this.lazyPrecacheManager.isHeroReady(playerId, body.heroClass)
        ) {
            state.pendingDraftType = "NONE";
            state.draftOptions = [];
            syncPlayerEvoNetTable(playerId, state);
            this.lazyPrecacheManager.ensureHeroReady(playerId, body.heroClass, () => {
                this.completeMorphHero(playerId, bodyId);
            });
            return true;
        }

        return this.completeMorphHero(playerId, bodyId);
    }

    private completeMorphHero(playerId: PlayerID, bodyId: string): boolean {
        if (!PlayerResource.IsValidPlayerID(playerId)) return false;
        let hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return false;

        const body = getBodyDefinition(bodyId);
        if (!body) return false;

        const state = this.getOrCreateState(playerId);
        const previousBodyId = state.bodyId;

        if (body.heroClass && body.heroClass.length > 0 && hero.GetUnitName() !== body.heroClass) {
            const preservedAbilities = collectPurchasedAbilities(hero, state);
            const replaced = HeroAppearance.replaceHeroPreservingState(playerId, body.heroClass, {
                stripDefaultAbilities: body.keepDefaultHeroAbilities !== true,
                preserveAbilities: preservedAbilities,
            });
            if (!replaced) return false;
            hero = replaced;
            reapplyMutationsToHero(hero, state);
        }

        applyBodyToHero(hero, state, body);

        if (body.appearance) {
            HeroAppearance.applyPreset(hero, body.appearance);
        }

        state.bodyId = body.id;
        state.tierIndex = body.tierIndex;
        if (body.tierIndex > state.highestTierUnlocked) {
            state.highestTierUnlocked = body.tierIndex;
        }
        state.pendingDraftType = "NONE";
        state.draftOptions = [];

        this.eventBus.emit("body_morphed", {
            playerId,
            previousBodyId,
            newBodyId: body.id,
            tierIndex: body.tierIndex,
        });

        this.checkEvolutionProgress(playerId);
        syncPlayerEvoNetTable(playerId, state);
        return true;
    }

    private onNpcSpawned(event: GameEventProvidedProperties & NpcSpawnedEvent): void {
        const unit = EntIndexToHScript(event.entindex);
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsBaseNPC()) return;
        if (!unit.IsRealHero()) return;

        const playerId = unit.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        if (!this.playerStates.has(playerId)) {
            this.lazyPrecacheManager.precacheForPlayer(playerId);
            const hero = unit as CDOTA_BaseNPC_Hero;
            stripDefaultHeroAbilities(hero);
            const state = this.getOrCreateState(playerId);
            const starter = getBodyDefinition(EVO_DEFAULT_START_BODY_ID);
            if (starter) {
                applyBodyToHero(hero, state, starter);
                if (starter.appearance) {
                    HeroAppearance.applyPreset(hero, starter.appearance);
                }
                this.eventBus.emit("body_morphed", {
                    playerId,
                    previousBodyId: "",
                    newBodyId: starter.id,
                    tierIndex: starter.tierIndex,
                });
            }
            syncPlayerEvoNetTable(playerId, state);
        }
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const victim = EntIndexToHScript(event.entindex_killed);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (!victim.IsRealHero()) return;

        const playerId = victim.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const state = this.getOrCreateState(playerId);
        const floorThreshold = findFloorEvoThreshold(state.evoPoints);
        if (floorThreshold < state.evoPoints) {
            const previousPoints = state.evoPoints;
            state.evoPoints = floorThreshold;
            this.eventBus.emit("evo_points_changed", {
                playerId,
                previousPoints,
                newPoints: state.evoPoints,
                delta: state.evoPoints - previousPoints,
            });
            syncPlayerEvoNetTable(playerId, state);
        }
    }

    private onHeroLeveledUp(playerId: PlayerID, newLevel: number): void {
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        const state = this.getOrCreateState(playerId);
        for (const tier of EVO_TIERS) {
            if (newLevel >= tier.requiredHeroLevel && tier.tierIndex > state.highestTierUnlocked) {
                state.highestTierUnlocked = tier.tierIndex;
            }
        }
        this.checkEvolutionProgress(playerId);
        syncPlayerEvoNetTable(playerId, state);
    }

    private checkEvolutionProgress(playerId: PlayerID): void {
        const state = this.getOrCreateState(playerId);
        if (state.pendingDraftType !== "NONE") return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        const heroLevel = hero && !hero.IsNull() && IsValidEntity(hero) ? hero.GetLevel() : 1;

        const currentBody = getBodyDefinition(state.bodyId);

        for (const tier of EVO_TIERS) {
            if (tier.tierIndex <= state.tierIndex) continue;
            if (heroLevel >= tier.requiredHeroLevel) {
                let candidates: BodyDefinition[] = [];
                if (currentBody?.nextBodyIds && currentBody.nextBodyIds.length > 0) {
                    candidates = currentBody.nextBodyIds
                        .map((id) => getBodyDefinition(id))
                        .filter((b): b is BodyDefinition => b !== undefined && b.tierIndex === tier.tierIndex);
                } else if (state.tierIndex === 0) {
                    candidates = getBodiesForTier(tier.tierIndex);
                }
                if (candidates.length > 0) {
                    state.pendingDraftType = "BODY";
                    state.draftOptions = candidates.map((b) => b.id);
                    return;
                }
            }
        }

        if (EVO_CONSTANTS.ENABLE_ABILITY_DRAFT) {
            for (let slotIndex = 0; slotIndex < EVO_CONSTANTS.ABILITY_DRAFT_LEVELS.length; slotIndex++) {
                const reqLevel = EVO_CONSTANTS.ABILITY_DRAFT_LEVELS[slotIndex];
                if (heroLevel >= reqLevel && !state.unlockedAbilitySlots[slotIndex]) {
                    state.unlockedAbilitySlots[slotIndex] = true;
                    const draftBody = getBodyDefinition(state.bodyId);
                    if (draftBody) {
                        const choices = this.spellShopManager.rollAbilityDraftChoices(
                            playerId,
                            draftBody,
                            EVO_CONSTANTS.ABILITY_DRAFT_CHOICES
                        );
                        if (choices.length > 0) {
                            state.pendingDraftType = "ABILITY";
                            state.draftOptions = choices;
                            return;
                        }
                    }
                }
            }
        }

        if (EVO_CONSTANTS.ENABLE_MUTATION_DRAFT) {
            for (let slotIndex = 0; slotIndex < EVO_CONSTANTS.MUTATION_DRAFT_LEVELS.length; slotIndex++) {
                const reqLevel = EVO_CONSTANTS.MUTATION_DRAFT_LEVELS[slotIndex];
                if (heroLevel >= reqLevel && !state.unlockedMutationSlots[slotIndex]) {
                    state.unlockedMutationSlots[slotIndex] = true;
                    const slotType = MUTATION_SLOT_ORDER[slotIndex];
                    const mutations = getMutationsForSlot(slotType);
                    if (mutations.length > 0) {
                        state.pendingDraftType = "MUTATION";
                        state.pendingMutationSlot = slotIndex;
                        state.draftOptions = mutations.map((m) => m.id);
                        return;
                    }
                }
            }
        }
    }

    private onSelectAbilityDraft(event: SelectAbilityDraftPayload): void {
        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

        const state = this.getOrCreateState(playerId);
        if (state.pendingDraftType !== "ABILITY") return;

        const optionIndex = event.option_index;
        if (optionIndex === undefined || optionIndex < 0 || optionIndex >= state.draftOptions.length) {
            return;
        }

        const chosenAbility = state.draftOptions[optionIndex];
        if (!this.spellShopManager.grantDraftedAbility(playerId, chosenAbility)) {
            return;
        }

        state.pendingDraftType = "NONE";
        state.draftOptions = [];

        this.checkEvolutionProgress(playerId);
        syncPlayerEvoNetTable(playerId, state);
    }

    private onSelectBodyDraft(event: SelectBodyDraftPayload): void {
        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

        const state = this.getOrCreateState(playerId);
        if (state.pendingDraftType !== "BODY") return;

        const optionIndex = event.option_index;
        if (optionIndex === undefined || optionIndex < 0 || optionIndex >= state.draftOptions.length) {
            return;
        }

        const chosenBodyId = state.draftOptions[optionIndex];
        this.morphHero(playerId, chosenBodyId);
    }

    private onSelectMutation(event: SelectMutationPayload): void {
        if (!EVO_CONSTANTS.ENABLE_MUTATION_DRAFT) return;
        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

        const state = this.getOrCreateState(playerId);
        if (state.pendingDraftType !== "MUTATION") return;

        const slotIndex = event.slot ?? state.pendingMutationSlot;
        if (slotIndex !== state.pendingMutationSlot) return;

        const optionIndex = event.option_index;
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

        this.eventBus.emit("mutation_applied", {
            playerId,
            slotIndex,
            mutationId: mutationDef.id,
        });

        this.checkEvolutionProgress(playerId);
        syncPlayerEvoNetTable(playerId, state);
    }

    private onDevCommand(playerId: PlayerID, command: string, args: string[]): void {
        if (command === "-evo_evo") {
            const amount = tonumber(args[0]) ?? 10;
            this.addEvoPoints(playerId, amount);
            return;
        }
        if (command === "-evo_morph") {
            const target = args[0];
            if (target !== undefined && target.length > 0) {
                this.morphHero(playerId, target);
                return;
            }
            const state = this.getOrCreateState(playerId);
            const nextTier = getNextTierConfig(state.tierIndex);
            if (!nextTier) return;
            const bodies = getBodiesForTier(nextTier.tierIndex);
            if (bodies.length > 0) {
                this.morphHero(playerId, bodies[0].id);
            }
        }
    }

    private getOrCreateState(playerId: PlayerID): PlayerEvolutionState {
        let state = this.playerStates.get(playerId);
        if (!state) {
            state = {
                bodyId: EVO_DEFAULT_START_BODY_ID,
                tierIndex: 0,
                biomass: 0,
                evoPoints: 0,
                highestTierUnlocked: 0,
                mutations: [undefined, undefined, undefined],
                unlockedAbilitySlots: [false, false, false],
                unlockedMutationSlots: [false, false, false],
                pendingDraftType: "NONE",
                pendingMutationSlot: -1,
                draftOptions: [],
                kitAbilityNames: [],
            };
            this.playerStates.set(playerId, state);
        }
        return state;
    }
}
