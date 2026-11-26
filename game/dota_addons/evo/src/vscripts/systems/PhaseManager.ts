import { EventBus, EvoMatchPhase } from "../core/EventBus";
import { EVO_BOSSES_CATALOG } from "../data/bosses_catalog";
import {
    EVO_CONSTANTS,
    EVO_TIERS,
    calculateEscalationMultiplier,
    calculateTargetTeamScore,
} from "../data/game_constants";
import { markFountainCombatLock } from "../lib/fountain_combat_guard";

export class PhaseManager {
    private currentPhase: EvoMatchPhase = "INCUBATOR";
    private started = false;
    private announcedBosses: string[] = [];
    private unlockedTimedTiers: Set<number> = new Set([0]);
    private lastSyncedEscalation = 1.0;

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("npc_spawned", (event) => this.onNpcSpawned(event), undefined);

        this.syncMatchState(0);
    }

    public getCurrentPhase(): EvoMatchPhase {
        return this.currentPhase;
    }

    public getAnnouncedBosses(): readonly string[] {
        return this.announcedBosses;
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            this.announceMatchBosses();
            this.syncMatchState(0);
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoPhaseManagerThink",
                () => this.onThink(),
                1.0
            );
        }
    }

    private onThink(): number | undefined {
        if (this.currentPhase === "ENDED") {
            return undefined;
        }

        const elapsed = GameRules.GetDOTATime(false, false);

        for (const tier of EVO_TIERS) {
            if (
                tier.unlockTimeSeconds !== undefined &&
                !this.unlockedTimedTiers.has(tier.tierIndex) &&
                elapsed >= tier.unlockTimeSeconds
            ) {
                this.unlockedTimedTiers.add(tier.tierIndex);
                this.eventBus.emit("phase_tier_unlocked", {
                    tierIndex: tier.tierIndex,
                    elapsedTime: elapsed,
                });
            }
        }

        if (this.currentPhase === "INCUBATOR") {
            if (elapsed >= EVO_CONSTANTS.PHASE1_END_TIME) {
                this.transitionToSurface(elapsed);
            }
        } else if (this.currentPhase === "SURFACE") {
            const escalation = calculateEscalationMultiplier(elapsed);
            if (Math.abs(escalation - this.lastSyncedEscalation) >= 0.05) {
                this.lastSyncedEscalation = escalation;
                this.syncMatchState(elapsed);
            }
        }

        return 1.0;
    }

    private transitionToSurface(elapsed: number): void {
        this.clearPeaceTimeModifiers();
        this.transitionToPhase("SURFACE", elapsed);
    }

    private transitionToPhase(newPhase: EvoMatchPhase, elapsed: number): void {
        if (this.currentPhase === newPhase) return;
        const previousPhase = this.currentPhase;
        this.currentPhase = newPhase;

        this.eventBus.emit("phase_changed", {
            previousPhase,
            newPhase,
            elapsedTime: elapsed,
        });

        this.syncMatchState(elapsed);
    }

    private announceMatchBosses(): void {
        const pool = EVO_BOSSES_CATALOG.map((boss) => boss.id);
        this.announcedBosses = [];

        while (
            this.announcedBosses.length < EVO_CONSTANTS.BOSS_COUNT_PER_MATCH &&
            pool.length > 0
        ) {
            const idx = RandomInt(0, pool.length - 1);
            const bossId = pool[idx];
            pool.splice(idx, 1);
            this.announcedBosses.push(bossId);

            this.eventBus.emit("boss_event", {
                bossId,
                level: 1,
                event: "announced",
            });
            CustomGameEventManager.Send_ServerToAllClients(
                "evo_boss_announcement" as never,
                {
                    boss_id: bossId,
                    level: 1,
                    event: "announced",
                } as never
            );
        }
    }

    private onNpcSpawned(event: GameEventProvidedProperties & NpcSpawnedEvent): void {
        if (this.currentPhase !== "INCUBATOR") return;
        const unit = EntIndexToHScript(event.entindex);
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsBaseNPC()) return;
        if (!unit.IsRealHero()) return;
        if (!PlayerResource.IsValidPlayerID(unit.GetPlayerOwnerID())) return;

        const remaining = Math.max(1, EVO_CONSTANTS.PHASE1_END_TIME - GameRules.GetDOTATime(false, false));
        unit.AddNewModifier(unit, undefined, "modifier_evo_peace_time", { duration: remaining });
    }

    public filterDamage(event: DamageFilterEvent): boolean {
        if (event.entindex_attacker_const === undefined || event.entindex_victim_const === undefined) {
            return true;
        }

        const attacker = EntIndexToHScript(event.entindex_attacker_const);
        const victim = EntIndexToHScript(event.entindex_victim_const);
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsBaseNPC()) {
            return true;
        }
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) {
            return true;
        }

        const attackerTeam = attacker.GetTeamNumber();
        const victimTeam = victim.GetTeamNumber();

        if (
            attacker.GetClassname() === "ent_dota_fountain" &&
            (victimTeam === DotaTeam.NEUTRALS || victimTeam === DotaTeam.CUSTOM_5)
        ) {
            event.damage = 0;
            return true;
        }

        if (
            attackerTeam !== DotaTeam.NEUTRALS &&
            attackerTeam !== victimTeam &&
            (attacker.HasModifier("modifier_fountain_buff_lua") || victim.HasModifier("modifier_fountain_buff_lua"))
        ) {
            event.damage = 0;
            return true;
        }

        if (this.currentPhase === "INCUBATOR") {
            if (
                attacker !== victim &&
                (attacker.HasModifier("modifier_evo_peace_time") ||
                    victim.HasModifier("modifier_evo_peace_time")) &&
                PlayerResource.IsValidPlayerID(attacker.GetPlayerOwnerID()) &&
                PlayerResource.IsValidPlayerID(victim.GetPlayerOwnerID())
            ) {
                event.damage = 0;
                return false;
            }
            return true;
        }

        const duelMgr = GameRules.EvoAddon?.duelManager;
        const onArena = duelMgr !== undefined && (duelMgr.isActiveDuelist(attacker) || duelMgr.isActiveDuelist(victim));
        if (!onArena && event.damage > 0) {
            markFountainCombatLock(attacker, victim, EVO_CONSTANTS.FOUNTAIN_COMBAT_LOCK_SECONDS);
        }

        return true;
    }

    private clearPeaceTimeModifiers(): void {
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const playerId = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(playerId)) continue;
            const hero = PlayerResource.GetSelectedHeroEntity(playerId);
            if (!hero || hero.IsNull() || !IsValidEntity(hero)) continue;
            hero.RemoveModifierByName("modifier_evo_peace_time");
        }
    }

    private syncMatchState(elapsed: number): void {
        const existing = (CustomNetTables.GetTableValue("match_state" as never, "state") ?? {}) as Record<
            string,
            unknown
        >;
        existing.phase = this.currentPhase;
        existing.elapsed_time = Math.floor(elapsed);
        existing.phase_end_time = this.currentPhase === "INCUBATOR" ? EVO_CONSTANTS.PHASE1_END_TIME : 0;
        existing.target_score = calculateTargetTeamScore();
        existing.escalation_mult = calculateEscalationMultiplier(elapsed);
        existing.announced_bosses = this.announcedBosses;
        CustomNetTables.SetTableValue("match_state" as never, "state", existing as never);
    }
}
