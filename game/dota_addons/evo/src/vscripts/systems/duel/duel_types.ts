import { EVO_CONSTANTS, EVO_MAP_ENTITIES } from "../../data/game_constants";

export interface PreDuelSnapshot {
    position: Vector;
    health: number;
    mana: number;
    wasAlive: boolean;
    abilityCooldowns: Map<string, number>;
    itemCooldowns: Map<number, number>;
    peaceTimeRemaining: number;
}

export interface DuelPair {
    playerA: PlayerID;
    playerB: PlayerID;
    teamA: DotaTeam;
    teamB: DotaTeam;
}

export interface ActiveBossDuel {
    bossId: string;
    bossEntIndex: EntityIndex;
    bossReturnPos: Vector;
    challengingTeam: DotaTeam;
    challengerIds: PlayerID[];
    lootEndTime?: number;
}

export interface DuelBet {
    bettorId: PlayerID;
    backedTarget: number;
    goldAmount: number;
}

export interface DuelApplyPayload {
    PlayerID: PlayerID;
}

export interface DuelBetPayload {
    PlayerID: PlayerID;
    backed_player_id?: number;
    gold_amount?: number;
}

export const PLAYABLE_TEAMS: readonly DotaTeam[] = [
    DotaTeam.GOODGUYS,
    DotaTeam.BADGUYS,
    DotaTeam.CUSTOM_1,
    DotaTeam.CUSTOM_2,
    DotaTeam.CUSTOM_3,
    DotaTeam.CUSTOM_4,
];

export const DUEL_BET_WINDOW_SECONDS = 8;
export const BOSS_DUEL_BET_TEAM = 1;
export const BOSS_DUEL_BET_BOSS = -2;

export function debugDuelChat(message: string): void {
    if (IsInToolsMode()) {
        GameRules.SendCustomMessage(message, 0, 0);
    }
}

export function discoverArenaLocations(): {
    arenaCenter: Vector;
    spawnA: Vector;
    spawnB: Vector;
} {
    let arenaCenter = Vector(0, 0, 128);
    const spawnAEnt =
        Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_SPAWN_A) ??
        Entities.FindByName(undefined, "duel_1_teleport_2");
    const spawnBEnt =
        Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_SPAWN_B) ??
        Entities.FindByName(undefined, "duel_1_teleport_3");
    const centerEnt =
        Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) ??
        Entities.FindByName(undefined, "duel_1");

    if (centerEnt && !centerEnt.IsNull() && IsValidEntity(centerEnt)) {
        arenaCenter = centerEnt.GetAbsOrigin();
    }
    const spawnA =
        spawnAEnt && !spawnAEnt.IsNull() && IsValidEntity(spawnAEnt)
            ? spawnAEnt.GetAbsOrigin()
            : Vector(arenaCenter.x - 450, arenaCenter.y, arenaCenter.z);
    const spawnB =
        spawnBEnt && !spawnBEnt.IsNull() && IsValidEntity(spawnBEnt)
            ? spawnBEnt.GetAbsOrigin()
            : Vector(arenaCenter.x + 450, arenaCenter.y, arenaCenter.z);

    return { arenaCenter, spawnA, spawnB };
}

export function getTeamPlayerIds(team: DotaTeam): PlayerID[] {
    const result: PlayerID[] = [];
    for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
        const pid = i as PlayerID;
        if (!PlayerResource.IsValidPlayerID(pid)) continue;
        if (PlayerResource.GetTeam(pid) !== team) continue;
        const hero = PlayerResource.GetSelectedHeroEntity(pid);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) continue;
        result.push(pid);
    }
    return result;
}

export function pickWeightedChampion(team: DotaTeam, applicants: ReadonlySet<PlayerID>): PlayerID | undefined {
    const candidates = getTeamPlayerIds(team);
    if (candidates.length === 0) return undefined;

    let totalWeight = 0;
    const weights: number[] = [];
    for (const pid of candidates) {
        const w = applicants.has(pid) ? EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER : 1.0;
        weights.push(w);
        totalWeight += w;
    }

    let roll = RandomFloat(0, totalWeight);
    for (let i = 0; i < candidates.length; i++) {
        roll -= weights[i];
        if (roll <= 0) {
            return candidates[i];
        }
    }
    return candidates[candidates.length - 1];
}

export function pickWeightedBossDuelTeam(applicants: ReadonlySet<PlayerID>): DotaTeam | undefined {
    const activeTeams: DotaTeam[] = [];
    for (const team of PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team).length > 0) {
            activeTeams.push(team);
        }
    }
    if (activeTeams.length === 0) return undefined;

    let totalWeight = 0;
    const weights: number[] = [];
    for (const team of activeTeams) {
        let teamWeight = 1.0;
        for (const pid of getTeamPlayerIds(team)) {
            if (applicants.has(pid)) {
                teamWeight += EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER;
            }
        }
        weights.push(teamWeight);
        totalWeight += teamWeight;
    }

    let roll = RandomFloat(0, totalWeight);
    for (let i = 0; i < activeTeams.length; i++) {
        roll -= weights[i];
        if (roll <= 0) {
            return activeTeams[i];
        }
    }
    return activeTeams[activeTeams.length - 1];
}

export function generateDuelPairs(applicants: ReadonlySet<PlayerID>): DuelPair[] {
    const activeTeams: DotaTeam[] = [];
    for (const team of PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team).length > 0) {
            activeTeams.push(team);
        }
    }

    if (activeTeams.length < 2) return [];

    const shuffled = [...activeTeams];
    for (let i = shuffled.length - 1; i > 0; i--) {
        const j = RandomInt(0, i);
        const tmp = shuffled[i];
        shuffled[i] = shuffled[j];
        shuffled[j] = tmp;
    }

    const teamPairs: Array<[DotaTeam, DotaTeam]> = [];
    if (shuffled.length === 2) {
        teamPairs.push([shuffled[0], shuffled[1]]);
    } else if (shuffled.length === 3) {
        teamPairs.push([shuffled[0], shuffled[1]]);
        teamPairs.push([shuffled[1], shuffled[2]]);
        teamPairs.push([shuffled[2], shuffled[0]]);
    } else {
        teamPairs.push([shuffled[0], shuffled[1]]);
        teamPairs.push([shuffled[2], shuffled[3]]);
    }

    const result: DuelPair[] = [];
    for (const [teamA, teamB] of teamPairs) {
        const playerA = pickWeightedChampion(teamA, applicants);
        const playerB = pickWeightedChampion(teamB, applicants);
        if (playerA !== undefined && playerB !== undefined) {
            result.push({ playerA, playerB, teamA, teamB });
        }
    }
    return result;
}

export function settleBets(activeBets: Map<PlayerID, DuelBet>, winnerId: PlayerID | undefined): void {
    for (const bet of activeBets.values()) {
        if (!PlayerResource.IsValidPlayerID(bet.bettorId)) continue;
        if (winnerId === undefined) {
            PlayerResource.ModifyGold(bet.bettorId, bet.goldAmount, false, ModifyGoldReason.UNSPECIFIED);
        } else if (bet.backedTarget === winnerId) {
            const payout = Math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER);
            PlayerResource.ModifyGold(bet.bettorId, payout, false, ModifyGoldReason.UNSPECIFIED);
        }
    }
    activeBets.clear();
}

export function settleBossDuelBets(activeBets: Map<PlayerID, DuelBet>, teamWon: boolean): void {
    const winningSide = teamWon ? BOSS_DUEL_BET_TEAM : BOSS_DUEL_BET_BOSS;
    for (const bet of activeBets.values()) {
        if (!PlayerResource.IsValidPlayerID(bet.bettorId)) continue;
        if (bet.backedTarget === winningSide) {
            const payout = Math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER);
            PlayerResource.ModifyGold(bet.bettorId, payout, false, ModifyGoldReason.UNSPECIFIED);
        }
    }
    activeBets.clear();
}
