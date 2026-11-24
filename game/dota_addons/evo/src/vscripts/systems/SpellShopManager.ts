import { EventBus } from "../core/EventBus";
import { getBodyDefinition } from "../data/bodies_catalog";
import { BodyDefinition, SpellPoolEntry } from "../data/data_schemas";
import { EVO_CONSTANTS, getTierConfig } from "../data/game_constants";
import {
    EVO_BANNED_SPELL_COMBINATIONS,
    EVO_SPELL_BUNDLES,
    EVO_SPELL_POOL,
    findSpellPoolEntry,
} from "../data/spell_pools";

interface PlayerSpellShopState {
    offeredSpells: string[];
    ownedSpells: string[];
    maxSlots: number;
}

interface SpellBuyPayload {
    PlayerID: PlayerID;
    ability_name?: string;
}

interface SpellSwapPayload {
    PlayerID: PlayerID;
    slot1?: number;
    slot2?: number;
}

export class SpellShopManager {
    private readonly playerStates: Map<PlayerID, PlayerSpellShopState> = new Map();

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        CustomGameEventManager.RegisterListener("evo_spell_buy", (_, event) => {
            this.onSpellBuy(event as unknown as SpellBuyPayload);
        });
        CustomGameEventManager.RegisterListener("evo_spell_swap", (_, event) => {
            this.onSpellSwap(event as unknown as SpellSwapPayload);
        });

        this.eventBus.on("body_morphed", ({ playerId, newBodyId }) => {
            const body = getBodyDefinition(newBodyId);
            if (!body) return;
            this.rollShowcaseForBody(playerId, body);
        });
    }

    public rollShowcaseForBody(playerId: PlayerID, body: BodyDefinition): void {
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const state = this.getOrCreateState(playerId);
        const tierConfig = getTierConfig(body.tierIndex);
        state.maxSlots = body.spellShopSlots ?? tierConfig.spellShopSlots ?? EVO_CONSTANTS.SPELL_SHOP_DEFAULT_SLOTS;

        const excluded = new Set<string>([
            body.innateAbility,
            body.signatureAbility,
            ...state.ownedSpells,
        ]);

        const eligibleBasics = this.filterEligibleSpells(body, false, excluded);
        const eligibleUltimates = this.filterEligibleSpells(body, true, excluded);

        const pickedBasics = this.weightedSampleWithoutReplacement(
            eligibleBasics,
            tierConfig.offerBasicCount,
            body
        );
        const pickedUltimates = this.weightedSampleWithoutReplacement(
            eligibleUltimates,
            tierConfig.offerUltimateCount,
            body
        );

        state.offeredSpells = [
            ...pickedBasics.map((entry) => entry.abilityName),
            ...pickedUltimates.map((entry) => entry.abilityName),
        ];

        this.syncSpellShop(playerId);
    }

    public getOwnedSpells(playerId: PlayerID): readonly string[] {
        return this.getOrCreateState(playerId).ownedSpells;
    }

    public rollAbilityDraftChoices(
        playerId: PlayerID,
        body: BodyDefinition,
        count: number
    ): string[] {
        if (!PlayerResource.IsValidPlayerID(playerId)) return [];
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        const state = this.getOrCreateState(playerId);
        const tierConfig = getTierConfig(body.tierIndex);

        const excluded = new Set<string>([
            body.innateAbility,
            body.signatureAbility,
            ...state.ownedSpells,
        ]);

        const eligibleBasics = this.filterEligibleSpells(body, false, excluded).filter(
            (e) => !hero || (!hero.HasAbility(e.abilityName) && !this.violatesBannedCombinations(hero, state.ownedSpells, e.abilityName))
        );
        const eligibleUltimates =
            tierConfig.offerUltimateCount > 0
                ? this.filterEligibleSpells(body, true, excluded).filter(
                      (e) =>
                          !hero ||
                          (!hero.HasAbility(e.abilityName) &&
                              !this.violatesBannedCombinations(hero, state.ownedSpells, e.abilityName))
                  )
                : [];

        const picks: string[] = [];
        if (eligibleUltimates.length > 0 && count >= 3) {
            const ultPick = this.weightedSampleWithoutReplacement(eligibleUltimates, 1, body);
            for (const u of ultPick) picks.push(u.abilityName);
        }

        const remainingNeed = Math.max(0, count - picks.length);
        const basicPicks = this.weightedSampleWithoutReplacement(eligibleBasics, remainingNeed, body);
        for (const b of basicPicks) picks.push(b.abilityName);

        return picks;
    }

    public grantDraftedAbility(playerId: PlayerID, abilityName: string): boolean {
        if (!PlayerResource.IsValidPlayerID(playerId)) return false;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return false;

        const state = this.getOrCreateState(playerId);
        if (state.ownedSpells.includes(abilityName) || hero.HasAbility(abilityName)) return false;

        const entry = findSpellPoolEntry(abilityName);
        if (!entry) return false;
        if (this.violatesBannedCombinations(hero, state.ownedSpells, abilityName)) return false;

        const added = hero.AddAbility(abilityName);
        if (!added) return false;

        added.SetLevel(1);
        this.grantLinkedAbilities(hero, added, abilityName);

        state.ownedSpells.push(abilityName);
        state.offeredSpells = state.offeredSpells.filter((name) => name !== abilityName);

        if (entry.ownerHeroName) {
            PrecacheUnitByNameAsync(entry.ownerHeroName, () => {}, playerId);
        }

        this.refreshScepterAndShard(hero);

        this.eventBus.emit("spell_purchased", {
            playerId,
            abilityName,
        });

        this.syncSpellShop(playerId);
        return true;
    }

    private onSpellBuy(event: SpellBuyPayload): void {
        if (GameRules.IsGamePaused()) return;

        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const abilityName = event.ability_name;
        if (!abilityName || abilityName.length === 0) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

        const state = this.getOrCreateState(playerId);
        if (!state.offeredSpells.includes(abilityName)) return;
        if (state.ownedSpells.includes(abilityName) || hero.HasAbility(abilityName)) return;
        if (state.ownedSpells.length >= state.maxSlots) return;

        const entry = findSpellPoolEntry(abilityName);
        if (!entry) return;

        if (hero.GetAbilityPoints() < entry.pointCost) return;
        if (this.violatesBannedCombinations(hero, state.ownedSpells, abilityName)) return;

        const added = hero.AddAbility(abilityName);
        if (!added) return;

        added.SetLevel(1);
        hero.SetAbilityPoints(Math.max(0, hero.GetAbilityPoints() - entry.pointCost));

        this.grantLinkedAbilities(hero, added, abilityName);

        state.ownedSpells.push(abilityName);
        state.offeredSpells = state.offeredSpells.filter((name) => name !== abilityName);

        if (entry.ownerHeroName) {
            PrecacheUnitByNameAsync(
                entry.ownerHeroName,
                () => {},
                playerId
            );
        }

        this.refreshScepterAndShard(hero);

        this.eventBus.emit("spell_purchased", {
            playerId,
            abilityName,
        });

        this.syncSpellShop(playerId);
    }

    private onSpellSwap(event: SpellSwapPayload): void {
        if (GameRules.IsGamePaused()) return;

        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const slot1 = event.slot1;
        const slot2 = event.slot2;
        if (slot1 === undefined || slot2 === undefined || slot1 === slot2) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        const ability1 = hero.GetAbilityByIndex(slot1);
        const ability2 = hero.GetAbilityByIndex(slot2);
        if (!ability1 || !ability2) return;

        const name1 = ability1.GetAbilityName();
        const name2 = ability2.GetAbilityName();
        if (name1.startsWith("special_bonus_") || name2.startsWith("special_bonus_")) return;

        hero.SwapAbilities(name1, name2, !ability1.IsHidden(), !ability2.IsHidden());
    }

    private grantLinkedAbilities(
        hero: CDOTA_BaseNPC_Hero,
        ability: CDOTABaseAbility,
        abilityName: string
    ): void {
        const linkedNames = new Set<string>();

        const bundle = EVO_SPELL_BUNDLES[abilityName];
        if (bundle !== undefined) {
            for (const sub of bundle) {
                linkedNames.add(sub);
            }
        }

        const secondary = ability.GetAssociatedSecondaryAbilities();
        if (secondary !== undefined && secondary.length > 0) {
            for (const sub of secondary.split(";")) {
                if (sub.length > 0) {
                    linkedNames.add(sub);
                }
            }
        }

        for (const subName of linkedNames) {
            if (!hero.HasAbility(subName)) {
                const subAbility = hero.AddAbility(subName);
                if (subAbility && subAbility.GetLevel() === 0) {
                    subAbility.SetLevel(1);
                }
            }
        }
    }

    private refreshScepterAndShard(hero: CDOTA_BaseNPC_Hero): void {
        const scepterBuff = hero.FindModifierByName("modifier_item_ultimate_scepter");
        if (scepterBuff) {
            const scepterAbility = scepterBuff.GetAbility();
            scepterBuff.Destroy();
            hero.AddNewModifier(hero, scepterAbility, "modifier_item_ultimate_scepter", {});
        }
        if (hero.HasModifier("modifier_item_ultimate_scepter_consumed")) {
            hero.RemoveModifierByName("modifier_item_ultimate_scepter_consumed");
            hero.AddNewModifier(hero, undefined, "modifier_item_ultimate_scepter_consumed", {});
        }
        if (hero.HasModifier("modifier_item_aghanims_shard")) {
            hero.RemoveModifierByName("modifier_item_aghanims_shard");
            hero.AddNewModifier(hero, undefined, "modifier_item_aghanims_shard", {});
        }
    }

    private violatesBannedCombinations(
        hero: CDOTA_BaseNPC_Hero,
        ownedSpells: readonly string[],
        candidate: string
    ): boolean {
        for (const combo of EVO_BANNED_SPELL_COMBINATIONS) {
            if (!combo.includes(candidate)) continue;
            for (const other of combo) {
                if (other === candidate) continue;
                if (ownedSpells.includes(other) || hero.HasAbility(other)) {
                    return true;
                }
            }
        }
        return false;
    }

    private filterEligibleSpells(
        body: BodyDefinition,
        isUltimate: boolean,
        excluded: Set<string>
    ): SpellPoolEntry[] {
        const matched: SpellPoolEntry[] = [];
        const fallback: SpellPoolEntry[] = [];

        for (const entry of EVO_SPELL_POOL) {
            if (entry.isUltimate !== isUltimate) continue;
            if (excluded.has(entry.abilityName)) continue;
            if (body.tierIndex < entry.minTierIndex) continue;
            if (entry.maxTierIndex !== undefined && body.tierIndex > entry.maxTierIndex) continue;

            const hasTagOverlap = entry.tags.some((tag) => body.spellPoolTags.includes(tag));
            if (hasTagOverlap) {
                matched.push(entry);
            } else {
                fallback.push(entry);
            }
        }

        return matched.length > 0 ? matched : fallback;
    }

    private weightedSampleWithoutReplacement(
        pool: readonly SpellPoolEntry[],
        count: number,
        body: BodyDefinition
    ): SpellPoolEntry[] {
        const remaining = [...pool];
        const result: SpellPoolEntry[] = [];

        while (result.length < count && remaining.length > 0) {
            let totalWeight = 0;
            const weights: number[] = [];

            for (const entry of remaining) {
                let w = entry.weight;
                if (entry.diet === body.diet) {
                    w *= 1.5;
                }
                weights.push(w);
                totalWeight += w;
            }

            let roll = RandomFloat(0, totalWeight);
            let chosenIndex = remaining.length - 1;
            for (let i = 0; i < weights.length; i++) {
                roll -= weights[i];
                if (roll <= 0) {
                    chosenIndex = i;
                    break;
                }
            }

            result.push(remaining[chosenIndex]);
            remaining.splice(chosenIndex, 1);
        }

        return result;
    }

    private getOrCreateState(playerId: PlayerID): PlayerSpellShopState {
        let state = this.playerStates.get(playerId);
        if (!state) {
            state = {
                offeredSpells: [],
                ownedSpells: [],
                maxSlots: EVO_CONSTANTS.SPELL_SHOP_DEFAULT_SLOTS,
            };
            this.playerStates.set(playerId, state);
        }
        return state;
    }

    private syncSpellShop(playerId: PlayerID): void {
        const state = this.getOrCreateState(playerId);
        const key = tostring(playerId);
        CustomNetTables.SetTableValue("spell_shop" as never, key, {
            offered_spells: state.offeredSpells,
            owned_spells: state.ownedSpells,
            max_slots: state.maxSlots,
        } as never);
    }
}
