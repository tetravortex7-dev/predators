import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS } from "../data/game_constants";
import { EVO_CREEP_AURA_MODIFIERS } from "../modifiers/neutrals/modifier_evo_creep_auras";
import { EVO_CREEP_ABILITY_MODIFIERS } from "../modifiers/neutrals/modifier_evo_creep_abilities";

interface CampTriggerState {
    trigger: CBaseEntity;
    size: string;
    biome: string;
    aliveCreepEntIndexes: EntityIndex[];
}

type CampTable = Record<string, Record<string, Record<string, Record<string, number | string>>>>;

const CAMP_BIOMASS_BY_SIZE: Record<string, number> = {
    small: 1,
    medium: 2,
    hard: 3,
    strong: 4,
};

const CAMP_TIER_BY_SIZE: Record<string, number> = {
    small: 0,
    medium: 1,
    hard: 2,
    strong: 3,
};

const AURA_CHANCE_BY_TIER: Record<number, number> = {
    1: 40,
    2: 65,
    3: 100,
};

const ABILITY_CHANCE_BY_TIER: Record<number, number> = {
    1: 30,
    2: 45,
    3: 70,
};

export class NeutralCampsManager {
    private readonly camps: CampTriggerState[] = [];
    private readonly creepSizeByEntIndex: Map<EntityIndex, string> = new Map();
    private campConfig: CampTable = {};
    private sizeKeys: string[] = [];
    private started = false;

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        this.initNeutralAiGlobals();
        this.loadCampConfig();
        this.discoverCampTriggers();

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);
        ListenToGameEvent("entity_hurt", (event) => this.onEntityHurt(event), undefined);
    }

    private initNeutralAiGlobals(): void {
        const g = _G as unknown as Record<string, unknown>;
        if (g.AI_SPELLS === undefined) {
            g.AI_SPELLS = {
                never_use: {},
                heal: {},
                only_enemy: {},
                buffs: {},
            };
        }
        if (g.AI_UPDATE === undefined) {
            g.AI_UPDATE = 0.5;
        }
    }

    private loadCampConfig(): void {
        const raw = LoadKeyValues("scripts/npc/neutral_camps.txt") as CampTable | undefined;
        if (!raw) return;
        this.campConfig = raw;
        this.sizeKeys = Object.keys(raw);
    }

    private discoverCampTriggers(): void {
        const triggers = Entities.FindAllByClassname("trigger_multiple");
        for (const trigger of triggers) {
            if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) continue;
            const name = trigger.GetName();
            if (!name.startsWith("neutralcamp_")) continue;

            const parts = name.split("_");
            const size = parts[1] ?? "small";
            const biome = parts[2] ?? "middle";

            this.camps.push({
                trigger,
                size,
                biome,
                aliveCreepEntIndexes: [],
            });
        }
        print(`[Evo] NeutralCampsManager discovered ${this.camps.length} neutral camp trigger(s).`);
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            this.spawnAllCamps();
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoNeutralCampsThink",
                () => this.onRespawnThink(),
                EVO_CONSTANTS.NEUTRAL_CAMP_RESPAWN_SECONDS
            );
        }
    }

    private onRespawnThink(): number {
        this.spawnAllCamps();
        return EVO_CONSTANTS.NEUTRAL_CAMP_RESPAWN_SECONDS;
    }

    private spawnAllCamps(): void {
        const targetLevel = this.getNeutralLevel();

        for (const camp of this.camps) {
            if (!camp.trigger || camp.trigger.IsNull() || !IsValidEntity(camp.trigger)) continue;

            camp.aliveCreepEntIndexes = camp.aliveCreepEntIndexes.filter((entIndex) => {
                const ent = EntIndexToHScript(entIndex);
                return (
                    ent !== undefined &&
                    !ent.IsNull() &&
                    IsValidEntity(ent) &&
                    ent.IsBaseNPC() &&
                    ent.IsAlive() &&
                    ent.GetTeamNumber() === DotaTeam.NEUTRALS
                );
            });

            const maxUnits = IsInToolsMode()
                ? EVO_CONSTANTS.NEUTRAL_CAMP_MAX_UNITS_DEV
                : EVO_CONSTANTS.NEUTRAL_CAMP_MAX_UNITS;
            const remainingSlots = maxUnits - camp.aliveCreepEntIndexes.length;
            if (remainingSlots <= 0) continue;

            let size = camp.size;
            if (size.includes("random") && this.sizeKeys.length > 0) {
                size = this.sizeKeys[RandomInt(0, this.sizeKeys.length - 1)];
            }

            const sizeData = this.campConfig[size];
            if (!sizeData) continue;

            const biomeData = sizeData[camp.biome];
            if (!biomeData) continue;

            const packKeys = Object.keys(biomeData);
            if (packKeys.length === 0) continue;

            const chosenKey = packKeys[RandomInt(0, packKeys.length - 1)];
            const pack = biomeData[chosenKey];
            if (!pack) continue;

            const origin = camp.trigger.GetAbsOrigin();
            const tier = CAMP_TIER_BY_SIZE[size] ?? 0;
            const spawnQueue: string[] = [];

            for (const [creepName, rawCount] of Object.entries(pack)) {
                const count = tonumber(rawCount) ?? 1;
                for (let i = 0; i < count; i++) {
                    if (spawnQueue.length >= remainingSlots) break;
                    spawnQueue.push(creepName);
                }
                if (spawnQueue.length >= remainingSlots) break;
            }

            let auraLeaderIdx = -1;
            if (tier >= 1 && spawnQueue.length > 0) {
                const auraChance = AURA_CHANCE_BY_TIER[tier] ?? 0;
                if (RandomInt(1, 100) <= auraChance) {
                    auraLeaderIdx = RandomInt(0, spawnQueue.length - 1);
                }
            }

            for (let idx = 0; idx < spawnQueue.length; idx++) {
                const creepName = spawnQueue[idx];
                const isAuraLeader = idx === auraLeaderIdx;
                const offset = Vector(RandomFloat(-80, 80), RandomFloat(-80, 80), 0);
                const spawnPos = Vector(origin.x + offset.x, origin.y + offset.y, origin.z);

                CreateUnitByNameAsync(
                    creepName,
                    spawnPos,
                    true,
                    undefined,
                    undefined,
                    DotaTeam.NEUTRALS,
                    (unit) => {
                        if (!unit || unit.IsNull() || !IsValidEntity(unit)) return;
                        const entIndex = unit.entindex();
                        camp.aliveCreepEntIndexes.push(entIndex);
                        this.creepSizeByEntIndex.set(entIndex, size);
                        if (unit.IsCreature()) {
                            const levelDelta = targetLevel - unit.GetLevel();
                            if (levelDelta > 0) {
                                unit.CreatureLevelUp(levelDelta);
                            }
                        }
                        if (tier >= 1) {
                            this.applyTierEnhancements(unit, tier, isAuraLeader);
                        }
                    }
                );
            }
        }
    }

    private applyTierEnhancements(unit: CDOTA_BaseNPC, tier: number, isAuraLeader: boolean): void {
        if (isAuraLeader && EVO_CREEP_AURA_MODIFIERS.length > 0) {
            const auraName = EVO_CREEP_AURA_MODIFIERS[RandomInt(0, EVO_CREEP_AURA_MODIFIERS.length - 1)];
            const auraMod = unit.AddNewModifier(unit, undefined, auraName, {});
            if (auraMod !== undefined) {
                auraMod.SetStackCount(tier);
            }
            unit.SetModelScale(unit.GetModelScale() * 1.15);
        }

        const abilityChance = ABILITY_CHANCE_BY_TIER[tier] ?? 0;
        if (EVO_CREEP_ABILITY_MODIFIERS.length > 0 && RandomInt(1, 100) <= abilityChance) {
            const abilityName = EVO_CREEP_ABILITY_MODIFIERS[RandomInt(0, EVO_CREEP_ABILITY_MODIFIERS.length - 1)];
            const abilityMod = unit.AddNewModifier(unit, undefined, abilityName, {});
            if (abilityMod !== undefined) {
                abilityMod.SetStackCount(tier);
            }
        }
    }

    private onEntityHurt(event: GameEventProvidedProperties & EntityHurtEvent): void {
        if (event.entindex_killed === undefined) return;
        const victim = EntIndexToHScript(event.entindex_killed);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (victim.GetTeamNumber() !== DotaTeam.NEUTRALS) return;

        const aiHolder = victim as unknown as {
            hAI?: { OnTakeDamage?: (attacker?: CBaseEntity, damage?: number, ability?: CBaseEntity) => void };
        };
        if (aiHolder.hAI !== undefined && aiHolder.hAI.OnTakeDamage !== undefined) {
            const attacker =
                event.entindex_attacker !== undefined
                    ? EntIndexToHScript(event.entindex_attacker)
                    : undefined;
            const ability =
                event.entindex_inflictor !== undefined
                    ? EntIndexToHScript(event.entindex_inflictor)
                    : undefined;
            aiHolder.hAI.OnTakeDamage(attacker, event.damage, ability);
        }
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const victimIndex = event.entindex_killed;
        const size = this.creepSizeByEntIndex.get(victimIndex);
        if (size === undefined) return;
        this.creepSizeByEntIndex.delete(victimIndex);

        if (event.entindex_attacker === undefined) return;
        const attacker = EntIndexToHScript(event.entindex_attacker);
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsBaseNPC()) return;

        const playerId = attacker.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const reward = CAMP_BIOMASS_BY_SIZE[size] ?? 1;
        this.eventBus.emit("biomass_collected", {
            playerId,
            amount: reward,
        });
    }

    private getNeutralLevel(): number {
        const minutes = GameRules.GetDOTATime(false, false) / 60;
        const stepped = Math.floor(minutes - (minutes % 3));
        return Math.min(EVO_CONSTANTS.MAX_HERO_LEVEL, Math.max(1, stepped));
    }
}
