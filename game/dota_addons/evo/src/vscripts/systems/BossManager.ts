import { EventBus } from "../core/EventBus";
import { EVO_BOSSES_CATALOG, getBossDefinition } from "../data/bosses_catalog";
import { EVO_CONSTANTS } from "../data/game_constants";
import { HeroAppearance, HeroAppearancePreset } from "../lib/HeroAppearance";
import { pickRandomBossSpawnOrigin, pickSmartWaypoint, tickBossRoamingAI } from "./boss/boss_combat";
import {
    dropBossCore,
    equipPurchasedItems,
    grantBossProgress,
    syncBossAbilitiesLevel,
    upgradeBossHeroAbilities,
} from "./boss/boss_progression";
import {
    ActiveBossRuntime,
    BOSS_AI_TICK_SECONDS,
    BOSS_CREEP_XP_MULTIPLIER,
    BOSS_HERO_KILL_GOLD,
    BOSS_HERO_KILL_XP,
    BOSS_PASSIVE_GOLD_PER_SEC,
    BOSS_PASSIVE_XP_PER_SEC,
    BOSS_TEAM,
    BossSpawnPoint,
    PatrolWaypoint,
    computeBossScale,
    discoverBossMapPositions,
    getBossRequiredXp,
    revealBossOnMinimap,
} from "./boss/boss_types";

export class BossManager {
    private readonly bosses: Map<string, ActiveBossRuntime> = new Map();
    private readonly entIndexToBossId: Map<EntityIndex, string> = new Map();
    private patrolWaypoints: PatrolWaypoint[] = [];
    private bossSpawnPoints: BossSpawnPoint[] = [];
    private fountainPositions: Vector[] = [];
    private activeBossIds: string[] = [];
    private thinkerStarted = false;
    private devSpawned = false;

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        const discovered = discoverBossMapPositions();
        this.fountainPositions = discovered.fountainPositions;
        this.bossSpawnPoints = discovered.bossSpawnPoints;
        this.patrolWaypoints = discovered.patrolWaypoints;

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        this.eventBus.on("boss_event", ({ bossId, event }) => {
            if (event === "announced" && !this.activeBossIds.includes(bossId)) {
                this.activeBossIds.push(bossId);
            }
        });

        this.eventBus.on("phase_changed", ({ newPhase }) => {
            if (newPhase === "SURFACE") {
                this.spawnMatchBosses();
            }
        });

        this.eventBus.on("dev_command", ({ command, args }) => {
            if (command === "-evo_boss") {
                this.onDevBossCommand(args);
            }
        });
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && IsInToolsMode() && !this.devSpawned) {
            this.devSpawned = true;
            this.spawnMatchBosses();
        }
    }

    public getStrongestAliveBoss(): { bossId: string; unit: CDOTA_BaseNPC; level: number } | undefined {
        let best: { bossId: string; unit: CDOTA_BaseNPC; level: number } | undefined;
        for (const runtime of this.bosses.values()) {
            const unit = runtime.unit;
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) continue;
            if (!best || runtime.level > best.level) {
                best = { bossId: runtime.definition.id, unit, level: runtime.level };
            }
        }
        return best;
    }

    public prepareBossForArena(bossId: string, spawnPos: Vector, lookTarget: Vector): Vector | undefined {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return undefined;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return undefined;

        const returnPos = unit.GetAbsOrigin();
        runtime.retreating = false;
        runtime.retreatPosition = undefined;

        unit.Purge(false, true, false, true, true);
        unit.SetHealth(unit.GetMaxHealth());
        unit.SetMana(unit.GetMaxMana());

        for (let i = 0; i < unit.GetAbilityCount(); i++) {
            const ability = unit.GetAbilityByIndex(i);
            if (ability && !ability.IsNull()) {
                ability.EndCooldown();
            }
        }
        for (let slot = 0; slot < 9; slot++) {
            const item = unit.GetItemInSlot(slot);
            if (item && !item.IsNull()) {
                item.EndCooldown();
            }
        }

        FindClearSpaceForUnit(unit, spawnPos, true);
        unit.Stop();
        const dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0).Normalized();
        unit.SetForwardVector(dir);
        return returnPos;
    }

    public returnBossFromArena(bossId: string, returnPos: Vector, bossWon: boolean): void {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return;

        FindClearSpaceForUnit(unit, returnPos, true);
        unit.Stop();

        if (bossWon) {
            grantBossProgress(
                runtime,
                EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_XP,
                EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_GOLD
            );
            this.triggerCourage(runtime);
        }
    }

    public spawnMatchBosses(): void {
        const idsToSpawn =
            this.activeBossIds.length > 0
                ? this.activeBossIds
                : EVO_BOSSES_CATALOG.slice(0, EVO_CONSTANTS.BOSS_COUNT_PER_MATCH).map((b) => b.id);

        for (let i = 0; i < idsToSpawn.length; i++) {
            const bossId = idsToSpawn[i];
            const def = getBossDefinition(bossId);
            if (!def) continue;

            let runtime = this.bosses.get(bossId);
            if (!runtime) {
                const builds = def.itemBuilds;
                const chosenBuild =
                    builds.length > 0 ? builds[RandomInt(0, builds.length - 1)] : [];
                runtime = {
                    definition: def,
                    level: 1,
                    xp: 0,
                    gold: 0,
                    itemBuild: chosenBuild,
                    nextItemIndex: 0,
                    lastHealBuyTime: -999,
                    spawnTime: GameRules.GetDOTATime(false, false),
                    inCourage: false,
                    retreating: false,
                    lastMoveOrderTime: -999,
                    lastAttackOrderTime: -999,
                };
                this.bosses.set(bossId, runtime);
            }

            if (!runtime.unit || runtime.unit.IsNull() || !IsValidEntity(runtime.unit) || !runtime.unit.IsAlive()) {
                this.spawnBossUnit(runtime);
            }
        }

        if (!this.thinkerStarted) {
            this.thinkerStarted = true;
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoBossManagerThink",
                () => this.onThink(),
                BOSS_AI_TICK_SECONDS
            );
        }
    }

    public setBossWearables(bossId: string, preset: HeroAppearancePreset): boolean {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return false;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit)) return false;
        const scale = computeBossScale(runtime.definition, runtime.level);
        HeroAppearance.applyPreset(unit, { ...preset, scale });
        return true;
    }

    private spawnBossUnit(runtime: ActiveBossRuntime): void {
        const spawnOrigin = pickRandomBossSpawnOrigin(runtime, this.bossSpawnPoints, this.fountainPositions);
        const now = GameRules.GetDOTATime(false, false);

        if (
            runtime.unit &&
            !runtime.unit.IsNull() &&
            IsValidEntity(runtime.unit) &&
            runtime.unit.IsHero()
        ) {
            const existingHero = runtime.unit;
            existingHero.RespawnHero(false, false);
            FindClearSpaceForUnit(existingHero, spawnOrigin, true);
            this.finalizeSpawnedBoss(runtime, existingHero, now, false);
            return;
        }

        CreateUnitByNameAsync(
            runtime.definition.unitName,
            spawnOrigin,
            true,
            undefined,
            undefined,
            BOSS_TEAM,
            (unit) => {
                if (!unit || unit.IsNull() || !IsValidEntity(unit)) return;
                this.finalizeSpawnedBoss(runtime, unit, now, true);
            }
        );
    }

    private finalizeSpawnedBoss(
        runtime: ActiveBossRuntime,
        unit: CDOTA_BaseNPC,
        now: number,
        isFreshSpawn: boolean
    ): void {
        runtime.unit = unit;
        runtime.entIndex = unit.entindex();
        runtime.spawnTime = now;
        runtime.respawnAtTime = undefined;
        runtime.retreating = false;
        runtime.retreatPosition = undefined;
        runtime.lastMoveOrderTime = -999;
        runtime.lastAttackTargetIndex = undefined;
        runtime.lastAttackOrderTime = -999;
        runtime.targetWaypoint = pickSmartWaypoint(unit.GetAbsOrigin(), now, this.patrolWaypoints);
        this.entIndexToBossId.set(unit.entindex(), runtime.definition.id);

        const targetScale = computeBossScale(runtime.definition, runtime.level);
        if (runtime.definition.appearance) {
            HeroAppearance.applyPreset(unit, {
                ...runtime.definition.appearance,
                scale: targetScale,
            });
        } else {
            unit.SetModelScale(targetScale);
        }

        if (unit.IsHero()) {
            while (unit.GetLevel() < runtime.level) {
                unit.HeroLevelUp(false);
            }
            upgradeBossHeroAbilities(unit, runtime.definition);
        } else if (unit.IsCreature()) {
            const delta = runtime.level - unit.GetLevel();
            if (delta > 0) {
                unit.CreatureLevelUp(delta);
            }
            syncBossAbilitiesLevel(unit, runtime.level);
        }

        if (isFreshSpawn) {
            equipPurchasedItems(unit, runtime);
        }

        if (runtime.inCourage) {
            unit.AddNewModifier(unit, undefined, "modifier_evo_boss_courage", {});
        }

        this.emitBossAnnouncement(runtime, "spawned");
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] Third-Party Boss spawned: ${runtime.definition.id} (Lv.${runtime.level})`,
                0,
                0
            );
        }
    }

    private emitBossAnnouncement(
        runtime: ActiveBossRuntime,
        event: "spawned" | "killed" | "courage",
        killerTeam?: DotaTeam,
        killerPlayerId?: PlayerID
    ): void {
        this.eventBus.emit("boss_event", {
            bossId: runtime.definition.id,
            level: runtime.level,
            event,
            killerTeam,
            killerPlayerId,
        });
        CustomGameEventManager.Send_ServerToAllClients(
            "evo_boss_announcement" as never,
            {
                boss_id: runtime.definition.id,
                level: runtime.level,
                event,
            } as never
        );
    }

    private onThink(): number {
        const now = GameRules.GetDOTATime(false, false);

        for (const runtime of this.bosses.values()) {
            const unit = runtime.unit;
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) {
                if (runtime.respawnAtTime !== undefined && now >= runtime.respawnAtTime) {
                    this.spawnBossUnit(runtime);
                }
                continue;
            }

            grantBossProgress(
                runtime,
                BOSS_PASSIVE_XP_PER_SEC * BOSS_AI_TICK_SECONDS,
                BOSS_PASSIVE_GOLD_PER_SEC * BOSS_AI_TICK_SECONDS
            );

            if (!runtime.inCourage && now - runtime.spawnTime >= EVO_CONSTANTS.BOSS_COURAGE_TIME_SECONDS) {
                this.triggerCourage(runtime);
            }

            revealBossOnMinimap(unit.GetAbsOrigin());
            tickBossRoamingAI(
                runtime,
                unit,
                now,
                this.fountainPositions,
                this.bossSpawnPoints,
                this.patrolWaypoints
            );
        }

        return BOSS_AI_TICK_SECONDS;
    }

    private triggerCourage(runtime: ActiveBossRuntime): void {
        if (runtime.inCourage) return;
        runtime.inCourage = true;
        runtime.retreating = false;

        const unit = runtime.unit;
        if (unit && !unit.IsNull() && IsValidEntity(unit) && unit.IsAlive()) {
            unit.AddNewModifier(unit, undefined, "modifier_evo_boss_courage", {});
        }

        this.emitBossAnnouncement(runtime, "courage");
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(`[Evo] ${runtime.definition.id} entered COURAGE mode!`, 0, 0);
        }
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const killedIndex = event.entindex_killed;
        const killerIndex = event.entindex_attacker;

        if (killerIndex !== undefined) {
            const killerBossId = this.entIndexToBossId.get(killerIndex);
            if (killerBossId !== undefined) {
                const killerBoss = this.bosses.get(killerBossId);
                const victim = EntIndexToHScript(killedIndex);
                if (killerBoss && victim && !victim.IsNull() && IsValidEntity(victim) && victim.IsBaseNPC()) {
                    if (victim.IsRealHero()) {
                        grantBossProgress(killerBoss, BOSS_HERO_KILL_XP, BOSS_HERO_KILL_GOLD);
                        const victimPid = victim.GetPlayerOwnerID();
                        if (PlayerResource.IsValidPlayerID(victimPid)) {
                            CustomGameEventManager.Send_ServerToAllClients(
                                "evo_boss_killed_hero" as never,
                                {
                                    boss_id: killerBossId,
                                    boss_unit: killerBoss.definition.unitName,
                                    victim_player_id: victimPid,
                                    victim_hero: victim.GetUnitName(),
                                    gold: BOSS_HERO_KILL_GOLD,
                                } as never
                            );
                        }
                    } else {
                        const creepXp = Math.max(15, Math.floor(victim.GetDeathXP() * BOSS_CREEP_XP_MULTIPLIER));
                        const creepGold = Math.max(15, victim.GetGoldBounty());
                        grantBossProgress(killerBoss, creepXp, creepGold);
                    }
                }
            }
        }

        const deadBossId = this.entIndexToBossId.get(killedIndex);
        if (deadBossId === undefined) return;
        this.entIndexToBossId.delete(killedIndex);

        const runtime = this.bosses.get(deadBossId);
        if (!runtime) return;

        const deadUnit = EntIndexToHScript(killedIndex);
        const dropOrigin =
            deadUnit && !deadUnit.IsNull() && IsValidEntity(deadUnit)
                ? deadUnit.GetAbsOrigin()
                : Vector(0, 0, 128);

        dropBossCore(runtime.definition, dropOrigin);

        let killerTeam: DotaTeam | undefined;
        let killerPlayerId: PlayerID | undefined;
        if (killerIndex !== undefined) {
            const attacker = EntIndexToHScript(killerIndex);
            if (attacker && !attacker.IsNull() && IsValidEntity(attacker) && attacker.IsBaseNPC()) {
                killerTeam = attacker.GetTeamNumber();
                const ownerId = attacker.GetPlayerOwnerID();
                if (PlayerResource.IsValidPlayerID(ownerId)) {
                    killerPlayerId = ownerId;
                }
            }
        }

        if (!deadUnit || deadUnit.IsNull() || !IsValidEntity(deadUnit) || !deadUnit.IsBaseNPC() || !deadUnit.IsHero()) {
            runtime.unit = undefined;
        }
        runtime.entIndex = undefined;
        runtime.retreating = false;
        runtime.retreatPosition = undefined;
        runtime.respawnAtTime = GameRules.GetDOTATime(false, false) + EVO_CONSTANTS.BOSS_RESPAWN_SECONDS;

        this.emitBossAnnouncement(runtime, "killed", killerTeam, killerPlayerId);
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] Boss ${runtime.definition.id} slain! Aghanim's Shard dropped!`,
                0,
                0
            );
        }
    }

    private onDevBossCommand(args: string[]): void {
        const sub = (args[0] ?? "").toLowerCase();
        if (sub === "courage") {
            for (const runtime of this.bosses.values()) {
                this.triggerCourage(runtime);
            }
            return;
        }
        if (sub === "lvl") {
            const targetLvl = Math.min(EVO_CONSTANTS.BOSS_MAX_LEVEL, Math.max(1, tonumber(args[1]) ?? 50));
            const targetXp = getBossRequiredXp(targetLvl);
            for (const runtime of this.bosses.values()) {
                const neededXp = Math.max(0, targetXp - runtime.xp);
                grantBossProgress(runtime, neededXp, 5000);
            }
            return;
        }
        this.spawnMatchBosses();
    }
}
