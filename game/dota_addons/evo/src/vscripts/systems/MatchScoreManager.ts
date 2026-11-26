import { EventBus } from "../core/EventBus";
import {
    EVO_CONSTANTS,
    EVO_PLAYABLE_TEAMS,
    calculateComebackScoreMultiplier,
    calculateEscalationMultiplier,
    calculateTargetTeamScore,
} from "../data/game_constants";

interface TeamScoreSnapshot {
    team_id: number;
    score: number;
    comeback_mult: number;
    players: Record<string, number>;
}

export class MatchScoreManager {
    private readonly teamScores: Map<DotaTeam, number> = new Map();
    private readonly playerScores: Map<PlayerID, number> = new Map();
    private matchEnded = false;

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        this.eventBus.on("biomass_collected", ({ playerId, amount }) => {
            if (!PlayerResource.IsValidPlayerID(playerId)) return;
            const team = PlayerResource.GetTeam(playerId);
            const basePoints =
                amount >= 3 ? EVO_CONSTANTS.SCORE_GOLIATH_CREEP : EVO_CONSTANTS.SCORE_FARM_CREEP;
            this.addScore(team, basePoints, "farm", playerId);
        });

        this.eventBus.on("boss_event", ({ event, level, killerTeam, killerPlayerId }) => {
            if (event !== "killed" || killerTeam === undefined) return;
            const progress = Math.min(1, Math.max(0, (level - 1) / (EVO_CONSTANTS.MAX_HERO_LEVEL - 1)));
            const basePoints = Math.round(
                EVO_CONSTANTS.SCORE_BOSS_MIN +
                    progress * (EVO_CONSTANTS.SCORE_BOSS_MAX - EVO_CONSTANTS.SCORE_BOSS_MIN)
            );
            this.addScore(killerTeam, basePoints, "boss_kill", killerPlayerId);
        });

        this.eventBus.on("boss_core_destroyed", ({ playerId, team, bonusScore }) => {
            this.addScore(team, bonusScore, "boss_core_destroy", playerId);
        });

        this.eventBus.on("duel_finished", ({ winnerId, isTiebreaker }) => {
            if (isTiebreaker || winnerId === undefined || !PlayerResource.IsValidPlayerID(winnerId)) return;
            const team = PlayerResource.GetTeam(winnerId);
            const awarded = this.addScore(team, EVO_CONSTANTS.SCORE_DUEL_WIN, "duel_win", winnerId);
            const existing = CustomNetTables.GetTableValue("duel_state" as never, "last_result") as
                | Record<string, unknown>
                | undefined;
            if (existing) {
                existing.score_reward = awarded;
                CustomNetTables.SetTableValue("duel_state" as never, "last_result", existing as never);
            }
        });

        this.eventBus.on("phase_changed", () => {
            this.syncScoresNetTable();
        });

        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
        });

        this.eventBus.on("dev_command", ({ playerId, command, args }) => {
            if (command !== "-evo_score") return;
            const team = PlayerResource.GetTeam(playerId);
            const amount = tonumber(args[0]) ?? 100;
            this.addScore(team, amount, "dev_command", playerId);
        });
    }

    public getTeamScore(team: DotaTeam): number {
        return this.teamScores.get(team) ?? 0;
    }

    public getPlayerScore(playerId: PlayerID): number {
        return this.playerScores.get(playerId) ?? 0;
    }

    public addScore(team: DotaTeam, baseDelta: number, reason: string, playerId?: PlayerID): number {
        if (this.matchEnded || baseDelta === 0) return 0;
        if (!this.isPlayableTeam(team)) return 0;

        let effectiveDelta = baseDelta;
        if (baseDelta > 0) {
            const elapsed = GameRules.GetDOTATime(false, false);
            const escalation = calculateEscalationMultiplier(elapsed);
            const leaderScore = this.getLeaderScore();
            const comeback = calculateComebackScoreMultiplier(this.getTeamScore(team), leaderScore);
            effectiveDelta = Math.max(1, Math.round(baseDelta * escalation * comeback));
        }

        const prevTeamScore = this.getTeamScore(team);
        const newTeamScore = Math.max(0, prevTeamScore + effectiveDelta);
        this.teamScores.set(team, newTeamScore);

        if (playerId !== undefined && PlayerResource.IsValidPlayerID(playerId)) {
            const prevPlayerScore = this.getPlayerScore(playerId);
            this.playerScores.set(playerId, Math.max(0, prevPlayerScore + effectiveDelta));
        }

        this.eventBus.emit("team_score_changed", {
            team,
            delta: effectiveDelta,
            newScore: newTeamScore,
            reason,
        });

        this.syncScoresNetTable();

        const targetScore = calculateTargetTeamScore();
        if (newTeamScore >= targetScore) {
            this.declareWinner(team, "score_limit");
        }
        return effectiveDelta;
    }

    private onGameStateChange(): void {
        const state = GameRules.State_Get();
        if (state === GameState.PRE_GAME || state === GameState.GAME_IN_PROGRESS) {
            this.ensureActiveTeamsRegistered();
            this.syncScoresNetTable();
        }
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        if (this.matchEnded) return;
        const victim = EntIndexToHScript(event.entindex_killed);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (!victim.IsRealHero()) return;

        const victimPlayerId = victim.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(victimPlayerId)) return;

        const victimTeam = victim.GetTeamNumber();
        this.addScore(victimTeam, EVO_CONSTANTS.SCORE_HERO_DEATH, "hero_death", victimPlayerId);

        if (event.entindex_attacker === undefined) return;
        const attacker = EntIndexToHScript(event.entindex_attacker);
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsBaseNPC()) return;

        const killerPlayerId = attacker.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(killerPlayerId)) return;

        const killerTeam = PlayerResource.GetTeam(killerPlayerId);
        if (killerTeam !== victimTeam) {
            this.addScore(killerTeam, EVO_CONSTANTS.SCORE_HERO_KILL, "hero_kill", killerPlayerId);
        }
    }

    private declareWinner(team: DotaTeam, reason: "score_limit"): void {
        if (this.matchEnded) return;
        this.matchEnded = true;

        this.eventBus.emit("match_ended", {
            winnerTeam: team,
            reason,
        });
        GameRules.SetGameWinner(team);
    }

    private ensureActiveTeamsRegistered(): void {
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const playerId = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(playerId)) continue;
            const team = PlayerResource.GetTeam(playerId);
            if (this.isPlayableTeam(team) && !this.teamScores.has(team)) {
                this.teamScores.set(team, 0);
            }
            if (!this.playerScores.has(playerId)) {
                this.playerScores.set(playerId, 0);
            }
        }
    }

    private getActiveTeams(): DotaTeam[] {
        const result: DotaTeam[] = [];
        for (const team of EVO_PLAYABLE_TEAMS) {
            if (PlayerResource.GetPlayerCountForTeam(team) > 0 || this.teamScores.has(team)) {
                result.push(team);
            }
        }
        return result;
    }

    private getLeaderScore(): number {
        let leader = 0;
        for (const score of this.teamScores.values()) {
            if (score > leader) {
                leader = score;
            }
        }
        return leader;
    }

    private isPlayableTeam(team: DotaTeam): boolean {
        return EVO_PLAYABLE_TEAMS.includes(team);
    }

    private syncScoresNetTable(): void {
        this.ensureActiveTeamsRegistered();
        const elapsed = GameRules.GetDOTATime(false, false);
        const escalation = Math.round(calculateEscalationMultiplier(elapsed) * 100) / 100;
        const leaderScore = this.getLeaderScore();

        const teamsPayload: Record<string, TeamScoreSnapshot> = {};
        const playerScoresPayload: Record<string, number> = {};

        for (const team of this.getActiveTeams()) {
            const teamScore = this.getTeamScore(team);
            const comeback =
                Math.round(calculateComebackScoreMultiplier(teamScore, leaderScore) * 100) / 100;
            const teamPlayers: Record<string, number> = {};

            for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
                const pid = i as PlayerID;
                if (!PlayerResource.IsValidPlayerID(pid)) continue;
                if (PlayerResource.GetTeam(pid) !== team) continue;
                const pScore = this.getPlayerScore(pid);
                teamPlayers[tostring(pid)] = pScore;
                playerScoresPayload[tostring(pid)] = pScore;
            }

            teamsPayload[tostring(team)] = {
                team_id: team,
                score: teamScore,
                comeback_mult: comeback,
                players: teamPlayers,
            };
        }

        CustomNetTables.SetTableValue(
            "match_state" as never,
            "scores",
            {
                target_score: calculateTargetTeamScore(),
                escalation_mult: escalation,
                teams: teamsPayload,
                player_scores: playerScoresPayload,
            } as never
        );
    }
}
