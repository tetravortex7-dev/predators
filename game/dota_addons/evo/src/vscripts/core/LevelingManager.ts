import { EventBus } from "./EventBus";
import { EVO_CONSTANTS, EVO_XP_PER_LEVEL_TABLE } from "../data/game_constants";

interface PlayerLevelState {
    highestRewardedLevel: number;
    fortificationCharges: number;
}

export class LevelingManager {
    private readonly playerStates: Map<PlayerID, PlayerLevelState> = new Map();

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        const gameMode = GameRules.GetGameModeEntity();
        gameMode.SetUseCustomHeroLevels(true);
        gameMode.SetCustomHeroMaxLevel(EVO_CONSTANTS.MAX_HERO_LEVEL);
        gameMode.SetCustomXPRequiredToReachNextLevel(EVO_XP_PER_LEVEL_TABLE);

        ListenToGameEvent("dota_player_gained_level", (event) => this.onPlayerGainedLevel(event), undefined);
    }

    public getFortificationCharges(playerId: PlayerID): number {
        return this.getOrCreateState(playerId).fortificationCharges;
    }

    public grantFortificationCharge(playerId: PlayerID, amount: number = 1, sourceLevel: number = 0): void {
        if (amount <= 0) return;
        const state = this.getOrCreateState(playerId);
        state.fortificationCharges += amount;

        this.syncPlayerCharges(playerId, state.fortificationCharges);
        this.eventBus.emit("fortification_charge_granted", {
            playerId,
            level: sourceLevel,
            totalCharges: state.fortificationCharges,
        });
    }

    public consumeFortificationCharge(playerId: PlayerID): boolean {
        const state = this.getOrCreateState(playerId);
        if (state.fortificationCharges <= 0) {
            return false;
        }
        state.fortificationCharges -= 1;
        this.syncPlayerCharges(playerId, state.fortificationCharges);
        return true;
    }

    private onPlayerGainedLevel(event: GameEventProvidedProperties & DotaPlayerGainedLevelEvent): void {
        const playerId = event.player_id as PlayerID | undefined;
        if (playerId === undefined || !PlayerResource.IsValidPlayerID(playerId)) return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        const newLevel = hero.GetLevel();
        const state = this.getOrCreateState(playerId);

        this.eventBus.emit("hero_leveled_up", {
            playerId,
            hero,
            newLevel,
        });

        for (const milestone of EVO_CONSTANTS.FORTIFICATION_LEVELS) {
            if (newLevel >= milestone && state.highestRewardedLevel < milestone) {
                state.highestRewardedLevel = milestone;
                this.grantFortificationCharge(playerId, 1, milestone);
            }
        }
    }

    private getOrCreateState(playerId: PlayerID): PlayerLevelState {
        let state = this.playerStates.get(playerId);
        if (!state) {
            state = {
                highestRewardedLevel: 1,
                fortificationCharges: 0,
            };
            this.playerStates.set(playerId, state);
        }
        return state;
    }

    private syncPlayerCharges(playerId: PlayerID, charges: number): void {
        const key = tostring(playerId);
        const existing = (CustomNetTables.GetTableValue("player_evo" as never, key) ?? {}) as Record<string, unknown>;
        existing.fortification_charges = charges;
        CustomNetTables.SetTableValue("player_evo" as never, key, existing as never);
    }
}
