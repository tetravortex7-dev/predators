import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS } from "../data/game_constants";
import { BossManager } from "./BossManager";
import {
    applyWorldPause,
    broadcastDuelEvent,
    prepareDuelistSnapshot,
    releaseWorldPause,
    restoreDuelistAfterDuel,
    syncDuelNetState,
} from "./duel/duel_arena";
import {
    evaluateActiveDuelKill,
    prepareBossChallengers,
    processDuelBetPlacement,
    spawnDevSparringDummy,
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
    pickWeightedBossDuelTeam,
    pickWeightedChampion,
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
    private currentPair?: DuelPair;
    private activeBossDuel?: ActiveBossDuel;
    private readonly activeDuelistEntIndexes: Set<EntityIndex> = new Set();
    private readonly snapshots: Map<PlayerID, PreDuelSnapshot> = new Map();
    private readonly applicants: Set<PlayerID> = new Set();
    private readonly activeBets: Map<PlayerID, DuelBet> = new Map();
    private readonly pausedEntIndexes: Set<EntityIndex> = new Set();

    private sparringDummy?: CDOTA_BaseNPC;
    private tiebreakerTeams: [DotaTeam, DotaTeam] | undefined;
    private tiebreakerWins: Map<DotaTeam, number> = new Map();

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

        this.eventBus.on("tiebreaker_requested", ({ tiedTeams }) => {
            this.startTiebreaker(tiedTeams);
        });
        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
            releaseWorldPause(this.pausedEntIndexes);
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
                this.finishCurrentDuel(undefined, undefined);
            } else {
                this.syncDuelState();
            }
            return 1.0;
        }

        if (!this.isTiebreaker && this.roundIndex < EVO_CONSTANTS.DUEL_MAX_ROUNDS && now >= this.nextDuelTime) {
            this.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
            this.startRegularDuelSeries();
        }

        return 1.0;
    }

    private startRegularDuelSeries(): void {
        const nextRound = this.roundIndex + 1;
        if (
            nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS === 0 &&
            this.bossManager.getStrongestAliveBoss() !== undefined
        ) {
            const team = pickWeightedBossDuelTeam(this.applicants);
            if (team !== undefined && this.startBossArenaDuel(team)) {
                this.applicants.clear();
                return;
            }
        }

        const pairs = generateDuelPairs(this.applicants);
        if (pairs.length === 0) {
            debugDuelChat("[Evo] Duel skipped: not enough teams.");
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

        prepareBossChallengers(
            challengers,
            this.spawnA,
            this.spawnB,
            this.snapshots,
            this.activeDuelistEntIndexes
        );
        this.activeDuelistEntIndexes.add(bossInfo.unit.entindex());
        this.activeBossDuel = {
            bossId: bossInfo.bossId,
            bossEntIndex: bossInfo.unit.entindex(),
            bossReturnPos,
            challengingTeam,
            challengerIds: challengers,
        };

        applyWorldPause(this.activeDuelistEntIndexes, this.pausedEntIndexes);
        this.eventBus.emit("duel_started", { roundIndex: this.roundIndex, isTiebreaker: false });
        broadcastDuelEvent("started");
        this.syncDuelState();

        debugDuelChat(
            `[Evo] BOSS ARENA! Team ${challengingTeam} vs ${bossInfo.bossId} (Lv.${bossInfo.level}) — ${EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS}s!`
        );
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
        releaseWorldPause(this.pausedEntIndexes);

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

    private startTiebreaker(tiedTeams: DotaTeam[]): void {
        if (this.matchEnded || tiedTeams.length < 2) return;

        this.isTiebreaker = true;
        this.tiebreakerTeams = [tiedTeams[0], tiedTeams[1]];
        this.tiebreakerWins.clear();
        this.tiebreakerWins.set(tiedTeams[0], 0);
        this.tiebreakerWins.set(tiedTeams[1], 0);
        this.pendingPairs = [];

        debugDuelChat("[Evo] TIEBREAKER Bo3 started!");
        this.queueNextTiebreakerPair();
    }

    private queueNextTiebreakerPair(): void {
        if (!this.tiebreakerTeams) return;
        const [teamA, teamB] = this.tiebreakerTeams;
        const playerA = pickWeightedChampion(teamA, this.applicants);
        const playerB = pickWeightedChampion(teamB, this.applicants);
        if (playerA === undefined || playerB === undefined) {
            this.finishTiebreaker(playerA !== undefined ? teamA : teamB);
            return;
        }

        this.roundIndex += 1;
        this.pendingPairs = [{ playerA, playerB, teamA, teamB }];
        this.beginNextPair();
    }

    private triggerDevDuel(playerId: PlayerID, args: string[]): void {
        const sub = (args[0] ?? "").toLowerCase();
        if (this.active) {
            if (this.activeBossDuel) {
                this.finalizeBossDuel(false);
            } else {
                this.finishCurrentDuel(playerId, undefined);
            }
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

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.beginActiveStage(false, EVO_CONSTANTS.DUEL_DURATION_SECONDS, {
            playerA: playerId,
            playerB: -1 as PlayerID,
            teamA: PlayerResource.GetTeam(playerId),
            teamB: DotaTeam.CUSTOM_5,
        });
        prepareDuelistSnapshot(playerId, this.spawnA, this.spawnB, this.snapshots, this.activeDuelistEntIndexes);
        this.sparringDummy = spawnDevSparringDummy(hero, this.spawnB, this.activeDuelistEntIndexes);

        applyWorldPause(this.activeDuelistEntIndexes, this.pausedEntIndexes);
        broadcastDuelEvent("started");
        this.syncDuelState();
        debugDuelChat("[Evo] Dev solo duel started on arena!");
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
            releaseWorldPause(this.pausedEntIndexes);
            this.syncDuelState();
            return;
        }

        this.beginActiveStage(true, EVO_CONSTANTS.DUEL_DURATION_SECONDS, nextPair);

        prepareDuelistSnapshot(nextPair.playerA, this.spawnA, this.spawnB, this.snapshots, this.activeDuelistEntIndexes);
        prepareDuelistSnapshot(nextPair.playerB, this.spawnB, this.spawnA, this.snapshots, this.activeDuelistEntIndexes);
        applyWorldPause(this.activeDuelistEntIndexes, this.pausedEntIndexes);

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
            this.finishCurrentDuel(outcome.winnerId, outcome.loserId);
        }
    }

    private finishCurrentDuel(winnerId: PlayerID | undefined, loserId: PlayerID | undefined): void {
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

        settleBets(this.activeBets, winnerId);
        if (pair) {
            restoreDuelistAfterDuel(pair.playerA, winnerId === pair.playerA, this.snapshots);
            restoreDuelistAfterDuel(pair.playerB, winnerId === pair.playerB, this.snapshots);
        }
        this.snapshots.clear();

        const validWinner =
            winnerId !== undefined && PlayerResource.IsValidPlayerID(winnerId) ? winnerId : undefined;
        const validLoser =
            loserId !== undefined && PlayerResource.IsValidPlayerID(loserId) ? loserId : undefined;

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

        if (this.isTiebreaker && this.tiebreakerTeams) {
            if (validWinner !== undefined) {
                const winTeam = PlayerResource.GetTeam(validWinner);
                const newWins = (this.tiebreakerWins.get(winTeam) ?? 0) + 1;
                this.tiebreakerWins.set(winTeam, newWins);
                if (newWins >= 2) {
                    this.finishTiebreaker(winTeam);
                    return;
                }
            }
            this.queueNextTiebreakerPair();
            return;
        }

        if (this.pendingPairs.length > 0) {
            this.beginNextPair();
        } else {
            releaseWorldPause(this.pausedEntIndexes);
            this.syncDuelState();
        }
    }

    private finishTiebreaker(winnerTeam: DotaTeam): void {
        this.isTiebreaker = false;
        this.tiebreakerTeams = undefined;
        releaseWorldPause(this.pausedEntIndexes);
        this.syncDuelState();

        this.eventBus.emit("match_ended", { winnerTeam, reason: "tiebreaker" });
        GameRules.SetGameWinner(winnerTeam);
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
        });
    }
}
