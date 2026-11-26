import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS } from "../data/game_constants";

export class PassiveGoldManager {
    private started = false;
    private matchEnded = false;
    private readonly startingGoldEnsured: Set<PlayerID> = new Set();

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
        });

        const state = GameRules.State_Get();
        if (state === GameState.PRE_GAME || state === GameState.GAME_IN_PROGRESS) {
            this.ensureStartingGold();
        }
        if (state === GameState.GAME_IN_PROGRESS) {
            this.startTicker();
        }
    }

    private onGameStateChange(): void {
        const state = GameRules.State_Get();
        if (state === GameState.PRE_GAME || state === GameState.GAME_IN_PROGRESS) {
            this.ensureStartingGold();
        }
        if (state === GameState.GAME_IN_PROGRESS) {
            this.startTicker();
        }
    }

    private ensureStartingGold(): void {
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const playerId = i as PlayerID;
            if (this.startingGoldEnsured.has(playerId)) continue;
            if (!PlayerResource.IsValidPlayerID(playerId)) continue;

            const team = PlayerResource.GetTeam(playerId);
            if (team === DotaTeam.NOTEAM || team === DotaTeam.CUSTOM_5 || team === DotaTeam.CUSTOM_8) {
                continue;
            }

            this.startingGoldEnsured.add(playerId);
            if (PlayerResource.GetGold(playerId) === 0) {
                PlayerResource.ModifyGold(
                    playerId,
                    EVO_CONSTANTS.STARTING_GOLD,
                    true,
                    ModifyGoldReason.UNSPECIFIED
                );
            }
        }
    }

    private startTicker(): void {
        if (this.started || this.matchEnded) return;
        this.started = true;
        GameRules.GetGameModeEntity().SetContextThink(
            "EvoPassiveGoldThink",
            () => this.onThink(),
            EVO_CONSTANTS.GOLD_TICK_TIME
        );
    }

    private onThink(): number | undefined {
        if (this.matchEnded || GameRules.State_Get() >= GameState.POST_GAME) {
            return undefined;
        }
        if (GameRules.IsGamePaused()) {
            return 0.1;
        }

        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const playerId = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(playerId)) continue;
            if (!PlayerResource.HasSelectedHero(playerId)) continue;

            const team = PlayerResource.GetTeam(playerId);
            if (team === DotaTeam.NOTEAM || team === DotaTeam.CUSTOM_5) continue;

            PlayerResource.ModifyGold(
                playerId,
                EVO_CONSTANTS.GOLD_PER_TICK,
                true,
                ModifyGoldReason.GAME_TICK
            );
        }

        return EVO_CONSTANTS.GOLD_TICK_TIME;
    }
}
