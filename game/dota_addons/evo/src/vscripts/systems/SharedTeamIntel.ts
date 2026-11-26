import { EVO_PLAYABLE_TEAMS } from "../data/game_constants";
import { EvolutionManager } from "./EvolutionManager";

interface EnemyDossierEntry {
    player_id: number;
    team_id: number;
    body_id: string;
    tier_index: number;
    level: number;
    items: string[];
    mutations: string[];
    last_seen_time: number;
}

const INTEL_TICK_SECONDS = 1.0;
const LAST_SEEN_REFRESH_SECONDS = 5;

export class SharedTeamIntel {
    private readonly dossiersByTeam: Map<DotaTeam, Map<PlayerID, EnemyDossierEntry>> = new Map();
    private readonly lastSignatureByTeam: Map<DotaTeam, string> = new Map();
    private started = false;

    constructor(private readonly evolutionManager: EvolutionManager) {}

    public init(): void {
        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoSharedTeamIntelThink",
                () => this.onThink(),
                INTEL_TICK_SECONDS
            );
        }
    }

    private onThink(): number {
        const now = Math.floor(GameRules.GetDOTATime(false, false));
        const teamObservers = new Map<DotaTeam, CDOTA_BaseNPC_Hero>();
        const allHeroes: Array<{ playerId: PlayerID; team: DotaTeam; hero: CDOTA_BaseNPC_Hero }> = [];

        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const playerId = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(playerId)) continue;

            const hero = PlayerResource.GetSelectedHeroEntity(playerId);
            if (!hero || hero.IsNull() || !IsValidEntity(hero)) continue;

            const team = PlayerResource.GetTeam(playerId);
            if (!EVO_PLAYABLE_TEAMS.includes(team)) continue;

            allHeroes.push({ playerId, team, hero });
            if (!teamObservers.has(team)) {
                teamObservers.set(team, hero);
            }
        }

        for (const [observerTeam, observerHero] of teamObservers.entries()) {
            let teamDossier = this.dossiersByTeam.get(observerTeam);
            if (!teamDossier) {
                teamDossier = new Map();
                this.dossiersByTeam.set(observerTeam, teamDossier);
            }

            let changed = false;

            for (const target of allHeroes) {
                if (target.team === observerTeam) continue;
                if (!target.hero.IsAlive()) continue;

                const canSee =
                    observerHero.CanEntityBeSeenByMyTeam(target.hero) ||
                    (IsLocationVisible(observerTeam, target.hero.GetAbsOrigin()) && !target.hero.IsInvisible());
                if (!canSee) continue;

                const body = this.evolutionManager.getPlayerBody(target.playerId);
                const bodyId = body ? body.id : "evo_body_t1_amoeba";
                const tierIndex = this.evolutionManager.getPlayerTierIndex(target.playerId);
                const level = target.hero.GetLevel();
                const items = this.collectHeroItems(target.hero);
                const mutations = this.evolutionManager.getPlayerMutations(target.playerId);

                const previous = teamDossier.get(target.playerId);
                const coreChanged =
                    !previous ||
                    previous.body_id !== bodyId ||
                    previous.tier_index !== tierIndex ||
                    previous.level !== level ||
                    previous.items.join(",") !== items.join(",") ||
                    previous.mutations.join(",") !== mutations.join(",");

                const timeRefreshed =
                    !previous || now - previous.last_seen_time >= LAST_SEEN_REFRESH_SECONDS;

                if (coreChanged || timeRefreshed) {
                    teamDossier.set(target.playerId, {
                        player_id: target.playerId,
                        team_id: target.team,
                        body_id: bodyId,
                        tier_index: tierIndex,
                        level,
                        items,
                        mutations,
                        last_seen_time: now,
                    });
                    changed = true;
                }
            }

            if (changed) {
                this.syncTeamDossier(observerTeam, teamDossier);
            }
        }

        return INTEL_TICK_SECONDS;
    }

    private collectHeroItems(hero: CDOTA_BaseNPC_Hero): string[] {
        const items: string[] = [];
        for (let slot = 0; slot < 6; slot++) {
            const item = hero.GetItemInSlot(slot);
            if (item && !item.IsNull()) {
                items.push(item.GetAbilityName());
            }
        }
        return items;
    }

    private syncTeamDossier(team: DotaTeam, dossier: Map<PlayerID, EnemyDossierEntry>): void {
        const payload: Record<string, EnemyDossierEntry> = {};
        const signatureParts: string[] = [];

        for (const [enemyId, entry] of dossier.entries()) {
            payload[tostring(enemyId)] = entry;
            signatureParts.push(
                `${enemyId}:${entry.body_id}:${entry.level}:${entry.items.join("|")}:${entry.mutations.join("|")}:${entry.last_seen_time}`
            );
        }

        const signature = signatureParts.join(";");
        if (this.lastSignatureByTeam.get(team) === signature) {
            return;
        }

        this.lastSignatureByTeam.set(team, signature);
        CustomNetTables.SetTableValue("enemy_dossier" as never, tostring(team), payload as never);
    }
}
