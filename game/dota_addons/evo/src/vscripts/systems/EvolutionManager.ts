import { EventBus } from "../core/EventBus";
import {
    EVO_DEFAULT_START_BODY_ID,
    getBodiesForTier,
    getBodyDefinition,
} from "../data/bodies_catalog";
import { BodyDefinition, MutationSlotType } from "../data/data_schemas";
import {
    EVO_CONSTANTS,
    EVO_TIERS,
    getNextTierConfig,
    getTierConfig,
} from "../data/game_constants";
import { getMutationDefinition, getMutationsForSlot } from "../data/mutations_catalog";
import { HeroAppearance } from "../lib/HeroAppearance";
import { SpellShopManager } from "./SpellShopManager";

type PendingDraftType = "NONE" | "BODY" | "ABILITY" | "MUTATION";

interface PlayerEvolutionState {
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

interface SelectBodyDraftPayload {
    PlayerID: PlayerID;
    option_index?: number;
}

interface SelectAbilityDraftPayload {
    PlayerID: PlayerID;
    option_index?: number;
}

interface SelectMutationPayload {
    PlayerID: PlayerID;
    slot?: number;
    option_index?: number;
}

const MUTATION_SLOT_ORDER: readonly MutationSlotType[] = [
    "ACTIVE_UPGRADE",
    "PASSIVE_SLOT_1",
    "PASSIVE_SLOT_2",
];

export class EvolutionManager {
    private readonly playerStates: Map<PlayerID, PlayerEvolutionState> = new Map();

    constructor(
        private readonly eventBus: EventBus,
        private readonly spellShopManager: SpellShopManager
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
        this.syncPlayerEvo(playerId);
    }

    public morphHero(playerId: PlayerID, bodyId: string): boolean {
        if (!PlayerResource.IsValidPlayerID(playerId)) return false;
        let hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return false;

        const body = getBodyDefinition(bodyId);
        if (!body) return false;

        const state = this.getOrCreateState(playerId);
        const previousBodyId = state.bodyId;

        if (body.heroClass && body.heroClass.length > 0 && hero.GetUnitName() !== body.heroClass) {
            const preservedAbilities = this.collectPurchasedAbilities(hero, state);
            const replaced = HeroAppearance.replaceHeroPreservingState(playerId, body.heroClass, {
                stripDefaultAbilities: body.keepDefaultHeroAbilities !== true,
                preserveAbilities: preservedAbilities,
            });
            if (!replaced) return false;
            hero = replaced;
            this.reapplyMutationsToHero(hero, state);
        }

        this.applyBodyToHero(hero, state, body);

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
        this.syncPlayerEvo(playerId);
        return true;
    }

    private collectPurchasedAbilities(
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

    private reapplyMutationsToHero(hero: CDOTA_BaseNPC_Hero, state: PlayerEvolutionState): void {
        for (const mutationId of state.mutations) {
            if (!mutationId) continue;
            const mutationDef = getMutationDefinition(mutationId);
            if (!mutationDef) continue;
            hero.AddNewModifier(hero, undefined, mutationDef.modifierName, {
                mutation_id: mutationDef.id,
            });
        }
    }

    private onNpcSpawned(event: GameEventProvidedProperties & NpcSpawnedEvent): void {
        const unit = EntIndexToHScript(event.entindex);
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsBaseNPC()) return;
        if (!unit.IsRealHero()) return;

        const playerId = unit.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        if (!this.playerStates.has(playerId)) {
            const hero = unit as CDOTA_BaseNPC_Hero;
            this.stripDefaultHeroAbilities(hero);
            const state = this.getOrCreateState(playerId);
            const starter = getBodyDefinition(EVO_DEFAULT_START_BODY_ID);
            if (starter) {
                this.applyBodyToHero(hero, state, starter);
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
            this.syncPlayerEvo(playerId);
        }
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const victim = EntIndexToHScript(event.entindex_killed);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (!victim.IsRealHero()) return;

        const playerId = victim.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const state = this.getOrCreateState(playerId);
        const floorThreshold = this.findFloorEvoThreshold(state.evoPoints);
        if (floorThreshold < state.evoPoints) {
            const previousPoints = state.evoPoints;
            state.evoPoints = floorThreshold;
            this.eventBus.emit("evo_points_changed", {
                playerId,
                previousPoints,
                newPoints: state.evoPoints,
                delta: state.evoPoints - previousPoints,
            });
            this.syncPlayerEvo(playerId);
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
        this.syncPlayerEvo(playerId);
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
                    const currentBody = getBodyDefinition(state.bodyId);
                    if (currentBody) {
                        const choices = this.spellShopManager.rollAbilityDraftChoices(
                            playerId,
                            currentBody,
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
        this.syncPlayerEvo(playerId);
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
        this.syncPlayerEvo(playerId);
    }

    private stripDefaultHeroAbilities(hero: CDOTA_BaseNPC_Hero): void {
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

    private applyBodyToHero(
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

        if (body.keepDefaultHeroAbilities !== true) {
            if (body.kitAbilities && body.kitAbilities.length > 0) {
                for (const oldName of state.kitAbilityNames) {
                    if (!body.kitAbilities.includes(oldName)) {
                        const oldAb = hero.FindAbilityByName(oldName);
                        if (oldAb) {
                            this.removeAbilityPreservingSlot(hero, oldAb);
                        }
                    }
                }
                if (state.innateAbilityName && !body.kitAbilities.includes(state.innateAbilityName)) {
                    const oldInnate = hero.FindAbilityByName(state.innateAbilityName);
                    if (oldInnate) this.removeAbilityPreservingSlot(hero, oldInnate);
                }
                if (state.signatureAbilityName && !body.kitAbilities.includes(state.signatureAbilityName)) {
                    const oldSig = hero.FindAbilityByName(state.signatureAbilityName);
                    if (oldSig) this.removeAbilityPreservingSlot(hero, oldSig);
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
                            this.placeAbilityInSlot(hero, ab, targetSlot);
                            if (!isUltimate) {
                                activeSlot += 1;
                            }
                        }
                        ab.SetHidden(false);
                        const desiredLevel = isInnate
                            ? 1
                            : Math.min(ab.GetMaxLevel(), Math.max(1, targetKitLevel));
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
                        if (oldAb) this.removeAbilityPreservingSlot(hero, oldAb);
                    }
                }
                state.kitAbilityNames = [];

                if (state.innateAbilityName && state.innateAbilityName !== body.innateAbility) {
                    const oldInnate = hero.FindAbilityByName(state.innateAbilityName);
                    if (oldInnate) {
                        this.removeAbilityPreservingSlot(hero, oldInnate);
                    }
                }
                if (state.signatureAbilityName && state.signatureAbilityName !== body.signatureAbility) {
                    const oldSig = hero.FindAbilityByName(state.signatureAbilityName);
                    if (oldSig) {
                        this.removeAbilityPreservingSlot(hero, oldSig);
                    }
                }

                const signature =
                    hero.FindAbilityByName(body.signatureAbility) ?? hero.AddAbility(body.signatureAbility);
                if (signature && !signature.IsNull()) {
                    this.placeAbilityInSlot(hero, signature, 0);
                    signature.SetHidden(false);
                    if (signature.GetLevel() === 0) {
                        signature.SetLevel(1);
                    }
                }

                const innate = hero.FindAbilityByName(body.innateAbility) ?? hero.AddAbility(body.innateAbility);
                if (innate && !innate.IsNull()) {
                    this.placeAbilityInSlot(hero, innate, 1);
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

    private removeAbilityPreservingSlot(hero: CDOTA_BaseNPC_Hero, ability: CDOTABaseAbility): void {
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

    private placeAbilityInSlot(
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

    private findFloorEvoThreshold(points: number): number {
        let floorValue = 0;
        for (const threshold of EVO_CONSTANTS.EVO_THRESHOLDS) {
            if (points >= threshold) {
                floorValue = threshold;
            }
        }
        return floorValue;
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

    private syncPlayerEvo(playerId: PlayerID): void {
        const state = this.getOrCreateState(playerId);
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
}
