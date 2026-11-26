import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS } from "../data/game_constants";
import { BossManager } from "./BossManager";
import {
    broadcastDuelEvent,
    notifyPreDuelCountdown,
    prepareDuelistSnapshot,
    resolveAndRecordPvpOutcome,
    restoreDuelistAfterDuel,
    syncDuelNetState,
} from "./duel/duel_arena";
import {
    ensureDevTestBot,
    evaluateActiveDuelKill,
    evaluateDuelTimeoutOutcome,
    launchDevSparringFallback,
    prepareBossChallengers,
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
    getTeamPlayerIds,
    hasMultiPlayerTeams,
    pickWeightedBossDuelTeam,
    settleBets,
    settleBossDuelBets,
} from "./duel/duel_types";

export class DuelManager {
    private spawnA: Vector = Vector(-500, 0, 128);
    private spawnB: Vector = Vector(500, 0, 128);
    private arenaCenter: Vector = Vector(0, 0, 128);

    private started = false;
    private matchEnded = false;
    private roundIndex = 0;
    private nextDuelTime: number = EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;

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
    private readonly activeDuelistEntIndexes: Set<EntityIndex> = new Set();
    private readonly snapshots: Map<PlayerID, PreDuelSnapshot> = new Map();
    private readonly applicants: Set<PlayerID> = new Set();
    private readonly activeBets: Map<PlayerID, DuelBet> = new Map();
    private readonly duelWinsByPlayer: Map<PlayerID, number> = new Map();
    private readonly duelLossesByPlayer: Map<PlayerID, number> = new Map();

    private sparringDummy?: CDOTA_BaseNPC;
    private readonly tiebreakerWins: Map<DotaTeam, number> = new Map();

    constructor(
        private readonly eventBus: EventBus,
        private readonly bossManager: BossManager
    ) {}

    public init(): void {
        const locs = discoverArenaLocations();
        this.arenaCenter = locs.arenaCenter;
        this.spawnA = locs.spawnA;
        this.spawnB = locs.spawnB;

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        CustomGameEventManager.RegisterListener("evo_duel_apply", (_, event) => {
            this.onDuelApply(event as unknown as DuelApplyPayload);
        });
        CustomGameEventManager.RegisterListener("evo_duel_bet", (_, event) => {
            processDuelBetPlacement({
                event: event as unknown as DuelBetPayload,
                active: this.active,
                betsOpen: this.betsOpen,
                activeBossDuel: this.activeBossDuel,
                currentPair: this.currentPair,
                activeBets: this.activeBets,
            });
        });

        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
        });
        this.eventBus.on("dev_command", ({ playerId, command, args }) => {
            if (command === "-evo_duel") {
                this.triggerDevDuel(playerId, args);
            }
        });

        this.syncDuelState();
    }

    public isActiveDuelist(entity: CBaseEntity): boolean {
        return this.active && this.activeDuelistEntIndexes.has(entity.entindex());
    }

    public getArenaCenter(): Vector {
        return this.arenaCenter;
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            this.nextDuelTime = GameRules.GetDOTATime(false, false) + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
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
            const secondsLeft = Math.ceil(this.nextDuelTime - now);
            if (now >= this.nextDuelTime) {
                this.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
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
            this.preselectedPairs = generateDuelPairs(this.applicants);
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
            const team = pickWeightedBossDuelTeam(this.applicants);
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
                PlayerResource.IsValidPlayerID(pair.playerA) &&
                PlayerResource.IsValidPlayerID(pair.playerB)
        );
        const pairs = preselected.length > 0 ? preselected : generateDuelPairs(this.applicants);
        this.preselectedPairs = [];
        this.preselectedForRound = 0;
        this.lastCountdownTickSec = -1;

        if (pairs.length === 0) {
            debugDuelChat("[Evo] Duel skipped: not enough teams.");
            this.syncDuelState();
            return;
        }

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.pendingPairs = pairs;
        this.applicants.clear();
        this.beginNextPair();
    }

    private startBossArenaDuel(challengingTeam: DotaTeam): boolean {
        const bossInfo = this.bossManager.getStrongestAliveBoss();
        if (!bossInfo) return false;
        const challengers = getTeamPlayerIds(challengingTeam);
        if (challengers.length === 0) return false;
        const bossReturnPos = this.bossManager.prepareBossForArena(bossInfo.bossId, this.spawnB, this.spawnA);
        if (!bossReturnPos) return false;

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.beginActiveStage(true, EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS);
        prepareBossChallengers(challengers, this.spawnA, this.spawnB, this.snapshots, this.activeDuelistEntIndexes);
        this.activeDuelistEntIndexes.add(bossInfo.unit.entindex());
        this.activeBossDuel = {
            bossId: bossInfo.bossId,
            bossEntIndex: bossInfo.unit.entindex(),
            bossReturnPos,
            challengingTeam,
            challengerIds: challengers,
        };
        this.eventBus.emit("duel_started", { roundIndex: this.roundIndex, isTiebreaker: false });
        broadcastDuelEvent("started");
        this.syncDuelState();
        debugDuelChat(`[Evo] BOSS ARENA! Team ${challengingTeam} vs ${bossInfo.bossId} (Lv.${bossInfo.level})`);
        return true;
    }

    private finalizeBossDuel(teamWon: boolean): void {
        if (!this.active || !this.activeBossDuel) return;

        const bossDuel = this.activeBossDuel;
        this.active = false;
        this.betsOpen = false;
        this.activeBossDuel = undefined;
        this.activeDuelistEntIndexes.clear();

        settleBossDuelBets(this.activeBets, teamWon);
        for (const pid of bossDuel.challengerIds) {
            restoreDuelistAfterDuel(pid, teamWon, this.snapshots);
        }
        this.snapshots.clear();

        this.bossManager.returnBossFromArena(bossDuel.bossId, bossDuel.bossReturnPos, !teamWon);

        const leadWinner = teamWon ? bossDuel.challengerIds[0] : undefined;
        this.eventBus.emit("duel_finished", {
            roundIndex: this.roundIndex,
            winnerId: leadWinner,
            loserId: undefined,
            isTiebreaker: false,
        });
        broadcastDuelEvent("finished", leadWinner);
        this.syncDuelState();

        debugDuelChat(
            teamWon
                ? `[Evo] Team ${bossDuel.challengingTeam} defeated ${bossDuel.bossId} in the Boss Arena!`
                : `[Evo] ${bossDuel.bossId} crushed the challengers and entered COURAGE mode!`
        );
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
            const delay = Math.max(6, Math.min(30, tonumber(args[1]) ?? 8));
            const hasBot = ensureDevTestBot(playerId);
            this.preselectedPairs = [];
            this.preselectedForRound = 0;
            this.lastCountdownTickSec = -1;
            this.nextDuelTime = GameRules.GetDOTATime(false, false) + delay;
            this.syncDuelState();
            debugDuelChat(
                hasBot
                    ? `[Evo] Test duel countdown set to ${delay}s vs NoobBot!`
                    : "[Evo] Failed to spawn test bot!"
            );
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
        this.beginActiveStage(false, EVO_CONSTANTS.DUEL_DURATION_SECONDS, {
            playerA: playerId,
            playerB: -1 as PlayerID,
            teamA: PlayerResource.GetTeam(playerId),
            teamB: DotaTeam.CUSTOM_5,
        });
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
        this.active = false;
        this.betsOpen = false;
        this.currentPair = undefined;
        this.activeDuelistEntIndexes.clear();

        if (this.sparringDummy && !this.sparringDummy.IsNull() && IsValidEntity(this.sparringDummy)) {
            UTIL_Remove(this.sparringDummy);
        }
        this.sparringDummy = undefined;

        const totalBetPayout = settleBets(this.activeBets, winnerId);
        if (pair) {
            restoreDuelistAfterDuel(pair.playerA, winnerId === pair.playerA, this.snapshots);
            restoreDuelistAfterDuel(pair.playerB, winnerId === pair.playerB, this.snapshots);
        }
        this.snapshots.clear();

        const { validWinner, validLoser } = resolveAndRecordPvpOutcome({
            winnerId,
            loserId,
            pair,
            isTiebreaker: this.isTiebreaker,
            roundIndex: this.roundIndex,
            reason,
            totalBetPayout,
            duelWins: this.duelWinsByPlayer,
            duelLosses: this.duelLossesByPlayer,
        });

        this.eventBus.emit("duel_finished", {
            roundIndex: this.roundIndex,
            winnerId: validWinner,
            loserId: validLoser,
            isTiebreaker: this.isTiebreaker,
        });
        broadcastDuelEvent("finished", validWinner);

        if (validWinner !== undefined) {
            const winnerName = PlayerResource.GetPlayerName(validWinner);
            debugDuelChat(`[Evo] Duel winner: ${winnerName || `Player ${validWinner + 1}`}!`);
        } else {
            debugDuelChat("[Evo] Duel ended in a draw!");
        }

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
