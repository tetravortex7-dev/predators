import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS, getDuelIntervalSeconds } from "../data/game_constants";
import { BossManager } from "./BossManager";
import {
    broadcastDuelEvent,
    finalizePvpDuelOutcome,
    notifyPreDuelCountdown,
    prepareDuelistSnapshot,
    syncDuelNetState,
} from "./duel/duel_arena";
import {
    completeBossArenaDuelState,
    createDevSparringPair,
    evaluateActiveDuelKill,
    evaluateDuelTimeoutOutcome,
    launchBossArenaDuelState,
    launchDevSparringFallback,
    prepareDevTestCountdown,
    processDuelBetPlacement,
} from "./duel/duel_boss";
import {
    ActiveBossDuel,
    DUEL_BET_WINDOW_SECONDS,
    DuelApplyPayload,
    DuelBet,
    DuelBetPayload,
    DuelPair,
    PreDuelSnapshot,
    debugDuelChat,
    discoverArenaLocations,
    generateDuelPairs,
    getActiveDuelPlayerCount,
    hasMultiPlayerTeams,
    isActiveConnectedPlayer,
    pickWeightedBossDuelTeam,
    resolveAdaptiveWaitDeadline,
    resolveSkippedDuelCooldown,
} from "./duel/duel_types";

export class DuelManager {
    private spawnA: Vector = Vector(-500, 0, 128);
    private spawnB: Vector = Vector(500, 0, 128);
    private arenaCenter: Vector = Vector(0, 0, 128);

    private started = false;
    private matchEnded = false;
    private roundIndex = 0;
    private nextDuelTime: number = EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
    private waitCycleStartTime?: number;

    private active = false;
    private isTiebreaker = false;
    private betsOpen = false;
    private duelEndTime = 0;
    private betCloseTime = 0;

    private pendingPairs: DuelPair[] = [];
    private preselectedPairs: DuelPair[] = [];
    private preselectedForRound = 0;
    private lastCountdownTickSec = -1;
    private currentPair?: DuelPair;
    private activeBossDuel?: ActiveBossDuel;
    private readonly lastDuelistIds: Set<PlayerID> = new Set();
    private readonly skippedPriorityIds: Set<PlayerID> = new Set();
    private readonly activeDuelistEntIndexes: Set<EntityIndex> = new Set();
    private readonly snapshots: Map<PlayerID, PreDuelSnapshot> = new Map();
    private readonly applicants: Set<PlayerID> = new Set();
    private readonly activeBets: Map<PlayerID, DuelBet> = new Map();
    private readonly duelWinsByPlayer: Map<PlayerID, number> = new Map();
    private readonly duelLossesByPlayer: Map<PlayerID, number> = new Map();

    private sparringDummy?: CDOTA_BaseNPC;
    private readonly tiebreakerWins: Map<DotaTeam, number> = new Map();

    constructor(private readonly eventBus: EventBus, private readonly bossManager: BossManager) {}

    public init(): void {
        const locs = discoverArenaLocations();
        this.arenaCenter = locs.arenaCenter;
        this.spawnA = locs.spawnA;
        this.spawnB = locs.spawnB;

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        CustomGameEventManager.RegisterListener("evo_duel_apply", (_, event) =>
            this.onDuelApply(event as unknown as DuelApplyPayload)
        );
        CustomGameEventManager.RegisterListener("evo_duel_bet", (_, event) =>
            processDuelBetPlacement({
                event: event as unknown as DuelBetPayload,
                active: this.active,
                betsOpen: this.betsOpen,
                activeBossDuel: this.activeBossDuel,
                currentPair: this.currentPair,
                activeBets: this.activeBets,
            })
        );

        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
        });
        this.eventBus.on("dev_command", ({ playerId, command, args }) => {
            if (command === "-evo_duel") this.triggerDevDuel(playerId, args);
        });

        this.syncDuelState();
    }

    public isActiveDuelist(entity: CBaseEntity): boolean {
        return this.active && this.activeDuelistEntIndexes.has(entity.entindex());
    }

    public getArenaCenter(): Vector {
        return this.arenaCenter;
    }

    private scheduleNextDuelCycle(now: number): void {
        this.waitCycleStartTime = now;
        this.nextDuelTime = now + getDuelIntervalSeconds(getActiveDuelPlayerCount());
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            this.scheduleNextDuelCycle(GameRules.GetDOTATime(false, false));
            this.syncDuelState();

            GameRules.GetGameModeEntity().SetContextThink(
                "EvoDuelManagerThink",
                () => this.onThink(),
                1.0
            );
        }
    }

    private onThink(): number | undefined {
        if (this.matchEnded) return undefined;
        const now = GameRules.GetDOTATime(false, false);

        if (this.active) {
            if (this.betsOpen && now >= this.betCloseTime) {
                this.betsOpen = false;
            }
            if (this.activeBossDuel) {
                const deadline = this.activeBossDuel.lootEndTime ?? this.duelEndTime;
                if (now >= deadline) {
                    this.finalizeBossDuel(this.activeBossDuel.lootEndTime !== undefined);
                } else {
                    this.syncDuelState();
                }
                return 1.0;
            }
            if (now >= this.duelEndTime) {
                const outcome = evaluateDuelTimeoutOutcome({
                    currentPair: this.currentPair,
                    sparringDummy: this.sparringDummy,
                });
                const endReason = outcome.winnerId !== undefined ? "hp" : "draw";
                this.finishCurrentDuel(outcome.winnerId, outcome.loserId, endReason);
            } else {
                this.syncDuelState();
            }
            return 1.0;
        }

        if (!this.isTiebreaker) {
            if (this.waitCycleStartTime !== undefined) {
                const sync = resolveAdaptiveWaitDeadline(
                    this.waitCycleStartTime,
                    this.nextDuelTime,
                    now,
                    getDuelIntervalSeconds(getActiveDuelPlayerCount())
                );
                if (sync.changed) {
                    this.nextDuelTime = sync.nextDeadline;
                    this.resetPreselection();
                }
            }
            const secondsLeft = Math.ceil(this.nextDuelTime - now);
            if (now >= this.nextDuelTime) {
                this.scheduleNextDuelCycle(now);
                this.startRegularDuelSeries();
            } else {
                if (secondsLeft <= EVO_CONSTANTS.DUEL_COUNTDOWN_SECONDS && secondsLeft >= 1) {
                    this.tickPreDuelCountdown(secondsLeft);
                }
                this.syncDuelState();
            }
        }

        return 1.0;
    }

    private tickPreDuelCountdown(secondsLeft: number): void {
        const upcomingRound = this.roundIndex + 1;
        const willBeBossDuel =
            hasMultiPlayerTeams() &&
            upcomingRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS === 0 &&
            this.bossManager.getStrongestAliveBoss() !== undefined;
        if (willBeBossDuel) return;

        if (this.preselectedForRound !== upcomingRound) {
            this.preselectedForRound = upcomingRound;
            this.preselectedPairs = generateDuelPairs(
                this.applicants,
                this.lastDuelistIds,
                this.skippedPriorityIds
            );
        }

        if (this.preselectedPairs.length === 0 || secondsLeft === this.lastCountdownTickSec) {
            return;
        }
        this.lastCountdownTickSec = secondsLeft;
        notifyPreDuelCountdown(this.preselectedPairs[0], secondsLeft);
    }

    private startRegularDuelSeries(): void {
        const nextRound = this.roundIndex + 1;
        if (
            hasMultiPlayerTeams() &&
            nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS === 0 &&
            this.bossManager.getStrongestAliveBoss() !== undefined
        ) {
            const team = pickWeightedBossDuelTeam(this.applicants, this.lastDuelistIds);
            if (team !== undefined && this.startBossArenaDuel(team)) {
                this.preselectedPairs = [];
                this.preselectedForRound = 0;
                this.lastCountdownTickSec = -1;
                this.applicants.clear();
                return;
            }
        }

        const preselected = this.preselectedPairs.filter(
            (pair) =>
                isActiveConnectedPlayer(pair.playerA) &&
                isActiveConnectedPlayer(pair.playerB) &&
                !this.lastDuelistIds.has(pair.playerA) &&
                !this.lastDuelistIds.has(pair.playerB)
        );
        const pairs =
            preselected.length > 0
                ? preselected
                : generateDuelPairs(this.applicants, this.lastDuelistIds, this.skippedPriorityIds);
        this.preselectedPairs = [];
        this.preselectedForRound = 0;
        this.lastCountdownTickSec = -1;

        if (pairs.length === 0) {
            resolveSkippedDuelCooldown(this.lastDuelistIds, this.skippedPriorityIds);
            this.syncDuelState();
            return;
        }

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.pendingPairs = pairs;
        this.applicants.clear();
        this.beginNextPair();
    }

    private recordDuelists(ids: readonly PlayerID[]): void {
        this.lastDuelistIds.clear();
        for (const pid of ids) {
            this.lastDuelistIds.add(pid);
            this.skippedPriorityIds.delete(pid);
        }
    }

    private startBossArenaDuel(challengingTeam: DotaTeam): boolean {
        const nextRound = this.roundIndex + 1;
        const bossDuel = launchBossArenaDuelState({
            challengingTeam,
            bossManager: this.bossManager,
            spawnA: this.spawnA,
            spawnB: this.spawnB,
            roundIndex: nextRound,
            snapshots: this.snapshots,
            activeDuelistEntIndexes: this.activeDuelistEntIndexes,
            eventBus: this.eventBus,
            onBeginStage: () => {
                this.roundIndex = nextRound;
                this.isTiebreaker = false;
                this.beginActiveStage(true, EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS);
            },
            onRecordDuelists: (ids) => this.recordDuelists(ids),
        });
        if (!bossDuel) return false;
        this.activeBossDuel = bossDuel;
        this.syncDuelState();
        return true;
    }

    private finalizeBossDuel(teamWon: boolean): void {
        if (!this.active || !this.activeBossDuel) return;
        const bossDuel = this.activeBossDuel;
        this.active = false;
        this.betsOpen = false;
        this.activeBossDuel = undefined;
        this.activeDuelistEntIndexes.clear();
        completeBossArenaDuelState({
            bossDuel,
            teamWon,
            roundIndex: this.roundIndex,
            activeBets: this.activeBets,
            snapshots: this.snapshots,
            bossManager: this.bossManager,
            eventBus: this.eventBus,
        });
        this.syncDuelState();
    }

    private resetPreselection(): void {
        this.preselectedPairs = [];
        this.preselectedForRound = 0;
        this.lastCountdownTickSec = -1;
    }

    private triggerDevDuel(playerId: PlayerID, args: string[]): void {
        const sub = (args[0] ?? "").toLowerCase();
        if (this.active) {
            if (this.activeBossDuel) {
                this.finalizeBossDuel(false);
            } else {
                this.finishCurrentDuel(playerId, undefined, "kill");
            }
            return;
        }

        if (sub === "test") {
            const res = prepareDevTestCountdown(playerId, args[1]);
            this.resetPreselection();
            this.waitCycleStartTime = undefined;
            this.nextDuelTime = res.nextDuelTime;
            this.syncDuelState();
            return;
        }

        if (sub === "boss") {
            if (this.bossManager.getStrongestAliveBoss() === undefined) {
                this.bossManager.spawnMatchBosses();
            }
            const team = PlayerResource.GetTeam(playerId);
            if (!this.startBossArenaDuel(team)) {
                debugDuelChat("[Evo] Waiting for boss spawn — run -evo_duel boss again in 1s.");
            }
            return;
        }

        const pairs = generateDuelPairs(this.applicants);
        if (pairs.length > 0) {
            this.roundIndex += 1;
            this.isTiebreaker = false;
            this.pendingPairs = pairs;
            this.beginNextPair();
            return;
        }

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.beginActiveStage(false, EVO_CONSTANTS.DUEL_DURATION_SECONDS, createDevSparringPair(playerId));
        this.sparringDummy = launchDevSparringFallback({
            playerId,
            spawnA: this.spawnA,
            spawnB: this.spawnB,
            snapshots: this.snapshots,
            activeDuelistEntIndexes: this.activeDuelistEntIndexes,
        });
        broadcastDuelEvent("started");
        this.syncDuelState();
    }

    private beginActiveStage(betsOpen: boolean, durationSeconds: number, pair?: DuelPair): void {
        this.currentPair = pair;
        this.active = true;
        this.betsOpen = betsOpen;
        this.activeBets.clear();
        this.activeDuelistEntIndexes.clear();
        this.snapshots.clear();
        const now = GameRules.GetDOTATime(false, false);
        this.betCloseTime = now + DUEL_BET_WINDOW_SECONDS;
        this.duelEndTime = now + durationSeconds;
    }

    private beginNextPair(): void {
        const nextPair = this.pendingPairs.shift();
        if (!nextPair) {
            this.active = false;
            this.currentPair = undefined;
            this.syncDuelState();
            return;
        }

        this.recordDuelists([nextPair.playerA, nextPair.playerB]);

        this.beginActiveStage(true, EVO_CONSTANTS.DUEL_DURATION_SECONDS, nextPair);

        prepareDuelistSnapshot(nextPair.playerA, this.spawnA, this.spawnB, this.snapshots, this.activeDuelistEntIndexes);
        prepareDuelistSnapshot(nextPair.playerB, this.spawnB, this.spawnA, this.snapshots, this.activeDuelistEntIndexes);

        this.eventBus.emit("duel_started", { roundIndex: this.roundIndex, isTiebreaker: this.isTiebreaker });
        broadcastDuelEvent("started");
        this.syncDuelState();
        debugDuelChat(`[Evo] Duel Round #${this.roundIndex} started! (${EVO_CONSTANTS.DUEL_DURATION_SECONDS}s)`);
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        if (!this.active) return;

        const killedIndex = event.entindex_killed;
        if (!this.activeDuelistEntIndexes.has(killedIndex)) return;

        const outcome = evaluateActiveDuelKill({
            killedIndex,
            activeBossDuel: this.activeBossDuel,
            currentPair: this.currentPair,
            sparringDummy: this.sparringDummy,
        });
        if (outcome.kind === "boss_duel_end") {
            this.finalizeBossDuel(outcome.teamWon);
        } else if (outcome.kind === "pvp_duel_end") {
            this.finishCurrentDuel(outcome.winnerId, outcome.loserId, "kill");
        }
    }

    private finishCurrentDuel(
        winnerId: PlayerID | undefined,
        loserId: PlayerID | undefined,
        reason: "kill" | "hp" | "draw" = "kill"
    ): void {
        if (!this.active) return;

        const pair = this.currentPair;
        const dummy = this.sparringDummy;
        this.active = false;
        this.betsOpen = false;
        this.currentPair = undefined;
        this.sparringDummy = undefined;
        this.activeDuelistEntIndexes.clear();

        const { validWinner, validLoser } = finalizePvpDuelOutcome({
            winnerId,
            loserId,
            pair,
            sparringDummy: dummy,
            activeBets: this.activeBets,
            snapshots: this.snapshots,
            isTiebreaker: this.isTiebreaker,
            roundIndex: this.roundIndex,
            reason,
            duelWins: this.duelWinsByPlayer,
            duelLosses: this.duelLossesByPlayer,
        });

        this.eventBus.emit("duel_finished", {
            roundIndex: this.roundIndex,
            winnerId: validWinner,
            loserId: validLoser,
            isTiebreaker: this.isTiebreaker,
        });

        if (this.pendingPairs.length > 0) {
            this.beginNextPair();
        } else {
            this.syncDuelState();
        }
    }

    private onDuelApply(event: DuelApplyPayload): void {
        const playerId = event.PlayerID;
        if (this.matchEnded || !PlayerResource.IsValidPlayerID(playerId)) return;
        this.applicants.add(playerId);
    }

    private syncDuelState(): void {
        syncDuelNetState({
            active: this.active,
            roundIndex: this.roundIndex,
            nextDuelTime: this.nextDuelTime,
            duelEndTime: this.duelEndTime,
            betsOpen: this.betsOpen,
            isTiebreaker: this.isTiebreaker,
            activeBossDuel: this.activeBossDuel,
            currentPair: this.currentPair,
            tiebreakerWins: this.tiebreakerWins,
            duelWins: this.duelWinsByPlayer,
            duelLosses: this.duelLossesByPlayer,
        });
    }
}
