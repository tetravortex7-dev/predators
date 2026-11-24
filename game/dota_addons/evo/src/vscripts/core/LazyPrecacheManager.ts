import { EVO_BODIES_CATALOG } from "../data/bodies_catalog";
import { EVO_BOSSES_CATALOG } from "../data/bosses_catalog";

const INITIAL_DELAY_SECONDS = 0.4;
const STEP_INTERVAL_SECONDS = 0.9;

export class LazyPrecacheManager {
    private heroUnits: string[] = [];
    private bossUnits: string[] = [];
    private readonly readyByPlayer: Map<PlayerID, Set<string>> = new Map();
    private readonly inFlightByPlayer: Map<PlayerID, Map<string, Array<() => void>>> = new Map();
    private readonly startedPlayers: Set<PlayerID> = new Set();

    public init(): void {
        this.collectUnits();
        this.startBossPrecache();
    }

    public precacheForPlayer(playerId: PlayerID): void {
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        if (this.startedPlayers.has(playerId)) return;
        this.startedPlayers.add(playerId);

        let cursor = 0;
        GameRules.GetGameModeEntity().SetContextThink(
            `EvoLazyPrecacheP${playerId}`,
            () => {
                if (cursor >= this.heroUnits.length) {
                    return undefined;
                }
                const unitName = this.heroUnits[cursor];
                cursor += 1;
                this.ensureHeroReady(playerId, unitName, () => {});
                if (cursor >= this.heroUnits.length) {
                    return undefined;
                }
                return STEP_INTERVAL_SECONDS;
            },
            INITIAL_DELAY_SECONDS
        );
    }

    public isHeroReady(playerId: PlayerID, heroClass: string): boolean {
        return this.readyByPlayer.get(playerId)?.has(heroClass) ?? false;
    }

    public ensureHeroReady(playerId: PlayerID, heroClass: string, onReady: () => void): void {
        if (this.isHeroReady(playerId, heroClass)) {
            onReady();
            return;
        }

        let inFlightMap = this.inFlightByPlayer.get(playerId);
        if (!inFlightMap) {
            inFlightMap = new Map();
            this.inFlightByPlayer.set(playerId, inFlightMap);
        }

        const existingCallbacks = inFlightMap.get(heroClass);
        if (existingCallbacks) {
            existingCallbacks.push(onReady);
            return;
        }

        inFlightMap.set(heroClass, [onReady]);
        PrecacheUnitByNameAsync(
            heroClass,
            () => {
                let readySet = this.readyByPlayer.get(playerId);
                if (!readySet) {
                    readySet = new Set();
                    this.readyByPlayer.set(playerId, readySet);
                }
                readySet.add(heroClass);

                const callbacks = this.inFlightByPlayer.get(playerId)?.get(heroClass) ?? [];
                this.inFlightByPlayer.get(playerId)?.delete(heroClass);
                for (const cb of callbacks) {
                    cb();
                }
            },
            playerId
        );
    }

    private collectUnits(): void {
        const seenHeroes = new Set<string>();
        const heroes: string[] = [];
        const seenBoss = new Set<string>();
        const bosses: string[] = [];

        for (const body of EVO_BODIES_CATALOG) {
            if (body.tierIndex === 0) continue;
            if (body.heroClass && body.heroClass.length > 0 && !seenHeroes.has(body.heroClass)) {
                seenHeroes.add(body.heroClass);
                heroes.push(body.heroClass);
            }
        }

        for (const boss of EVO_BOSSES_CATALOG) {
            if (
                boss.ownerHeroName &&
                boss.ownerHeroName.length > 0 &&
                boss.ownerHeroName !== boss.unitName &&
                !seenBoss.has(boss.ownerHeroName)
            ) {
                seenBoss.add(boss.ownerHeroName);
                bosses.push(boss.ownerHeroName);
            }
        }

        this.heroUnits = heroes;
        this.bossUnits = bosses;
    }

    private startBossPrecache(): void {
        if (this.bossUnits.length === 0) return;
        let idx = 0;
        GameRules.GetGameModeEntity().SetContextThink(
            "EvoLazyBossPrecache",
            () => {
                if (idx >= this.bossUnits.length) return undefined;
                const unitName = this.bossUnits[idx];
                idx += 1;
                PrecacheUnitByNameAsync(unitName, () => {});
                return idx < this.bossUnits.length ? STEP_INTERVAL_SECONDS : undefined;
            },
            2.5
        );
    }
}
