import { EVO_CONSTANTS } from "../data/game_constants";

interface RuneSpotState {
    origin: Vector;
    kind: "bounty" | "powerup";
    activeRuneEntIndex?: EntityIndex;
    lastRuneType?: RuneType;
}

const POWERUP_RUNE_POOL: readonly RuneType[] = [
    RuneType.DOUBLEDAMAGE,
    RuneType.HASTE,
    RuneType.ILLUSION,
    RuneType.INVISIBILITY,
    RuneType.REGENERATION,
    RuneType.ARCANE,
    RuneType.SHIELD,
];

export class RuneManager {
    private readonly spots: RuneSpotState[] = [];
    private started = false;

    public init(): void {
        this.discoverRuneSpots();
        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
    }

    private discoverRuneSpots(): void {
        let bountyCount = 0;
        let powerCount = 0;

        for (const ent of Entities.FindAllByName("dota_rune_spawner_bounty")) {
            if (!ent || ent.IsNull() || !IsValidEntity(ent)) continue;
            const pos = ent.GetAbsOrigin();
            if (this.hasSpotNear(pos)) continue;
            this.spots.push({ origin: pos, kind: "bounty" });
            bountyCount += 1;
        }

        for (const ent of Entities.FindAllByName("dota_rune_spawner_powerup")) {
            if (!ent || ent.IsNull() || !IsValidEntity(ent)) continue;
            const pos = ent.GetAbsOrigin();
            if (this.hasSpotNear(pos)) continue;
            this.spots.push({ origin: pos, kind: "powerup" });
            powerCount += 1;
        }

        let ent: CBaseEntity | undefined = Entities.First();
        while (ent !== undefined) {
            if (!ent.IsNull() && IsValidEntity(ent)) {
                const cls = ent.GetClassname().toLowerCase();
                const name = ent.GetName().toLowerCase();
                if (cls.includes("rune_spawner") || name.includes("rune_spawner")) {
                    const pos = ent.GetAbsOrigin();
                    if (!this.hasSpotNear(pos)) {
                        const isBounty = cls.includes("bounty") || name.includes("bounty");
                        this.spots.push({ origin: pos, kind: isBounty ? "bounty" : "powerup" });
                        if (isBounty) {
                            bountyCount += 1;
                        } else {
                            powerCount += 1;
                        }
                    }
                }
            }
            ent = Entities.Next(ent);
        }

        print(`[Evo] RuneManager discovered ${bountyCount} bounty and ${powerCount} powerup rune spawner(s).`);
    }

    private hasSpotNear(pos: Vector): boolean {
        for (const spot of this.spots) {
            const dx = spot.origin.x - pos.x;
            const dy = spot.origin.y - pos.y;
            if (dx * dx + dy * dy < 64 * 64) {
                return true;
            }
        }
        return false;
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            if (this.spots.length === 0) {
                this.discoverRuneSpots();
            }
            this.spawnRunesByKind("bounty");
            if (IsInToolsMode()) {
                this.spawnRunesByKind("powerup");
            }

            const mode = GameRules.GetGameModeEntity();
            mode.SetContextThink(
                "EvoBountyRuneThink",
                () => {
                    this.spawnRunesByKind("bounty");
                    return EVO_CONSTANTS.BOUNTY_RUNE_INTERVAL_SECONDS;
                },
                EVO_CONSTANTS.BOUNTY_RUNE_INTERVAL_SECONDS
            );

            mode.SetContextThink(
                "EvoPowerRuneThink",
                () => {
                    this.spawnRunesByKind("powerup");
                    return EVO_CONSTANTS.POWER_RUNE_INTERVAL_SECONDS;
                },
                EVO_CONSTANTS.POWER_RUNE_FIRST_SPAWN_SECONDS
            );
        }
    }

    private spawnRunesByKind(kind: "bounty" | "powerup"): void {
        for (const spot of this.spots) {
            if (spot.kind !== kind) continue;

            if (spot.activeRuneEntIndex !== undefined) {
                const existing = EntIndexToHScript(spot.activeRuneEntIndex);
                if (existing && !existing.IsNull() && IsValidEntity(existing)) {
                    UTIL_Remove(existing);
                }
                spot.activeRuneEntIndex = undefined;
            }

            const runeType = kind === "bounty" ? RuneType.BOUNTY : this.pickNextPowerupRune(spot.lastRuneType);
            spot.lastRuneType = runeType;

            const rune = CreateRune(spot.origin, runeType);
            if (rune && !rune.IsNull() && IsValidEntity(rune)) {
                spot.activeRuneEntIndex = rune.entindex();
            }
        }
    }

    private pickNextPowerupRune(previous?: RuneType): RuneType {
        if (POWERUP_RUNE_POOL.length <= 1) {
            return POWERUP_RUNE_POOL[0] ?? RuneType.HASTE;
        }
        for (let attempt = 0; attempt < 6; attempt++) {
            const candidate = POWERUP_RUNE_POOL[RandomInt(0, POWERUP_RUNE_POOL.length - 1)];
            if (candidate !== previous) {
                return candidate;
            }
        }
        return POWERUP_RUNE_POOL[RandomInt(0, POWERUP_RUNE_POOL.length - 1)];
    }
}
