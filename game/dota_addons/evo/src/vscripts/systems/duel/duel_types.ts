import { EVO_CONSTANTS, EVO_MAP_ENTITIES, EVO_PLAYABLE_TEAMS } from "../../data/game_constants";

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

export function isActiveConnectedPlayer(playerId: PlayerID): boolean {
    if (!PlayerResource.IsValidPlayerID(playerId)) return false;
    const state = PlayerResource.GetConnectionState(playerId);
    if (PlayerResource.IsFakeClient(playerId)) {
        return state !== ConnectionState.ABANDONED;
    }
    return state === ConnectionState.CONNECTED;
}

export function getActiveDuelPlayerCount(): number {
    let count = 0;
    for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
        const pid = i as PlayerID;
        if (!isActiveConnectedPlayer(pid)) continue;
        if (EVO_PLAYABLE_TEAMS.includes(PlayerResource.GetTeam(pid))) {
            count += 1;
        }
    }
    return count;
}

export function getTeamPlayerIds(
    team: DotaTeam,
    excludedIds?: ReadonlySet<PlayerID>
): PlayerID[] {
    const result: PlayerID[] = [];
    for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
        const pid = i as PlayerID;
        if (!isActiveConnectedPlayer(pid)) continue;
        if (PlayerResource.GetTeam(pid) !== team) continue;
        if (excludedIds && excludedIds.has(pid)) continue;
        const hero = PlayerResource.GetSelectedHeroEntity(pid);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) continue;
        result.push(pid);
    }
    return result;
}

export function getActiveTeamCount(): number {
    let count = 0;
    for (const team of EVO_PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team).length > 0) {
            count += 1;
        }
    }
    return count;
}

export function pickWeightedChampion(
    team: DotaTeam,
    applicants: ReadonlySet<PlayerID>,
    excludedIds?: ReadonlySet<PlayerID>,
    preferredIds?: ReadonlySet<PlayerID>
): PlayerID | undefined {
    const allCandidates = getTeamPlayerIds(team, excludedIds);
    if (allCandidates.length === 0) return undefined;

    const preferred =
        preferredIds && preferredIds.size > 0
            ? allCandidates.filter((pid) => preferredIds.has(pid))
            : [];
    const candidates = preferred.length > 0 ? preferred : allCandidates;

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

export function pickWeightedBossDuelTeam(
    applicants: ReadonlySet<PlayerID>,
    excludedIds?: ReadonlySet<PlayerID>
): DotaTeam | undefined {
    const activeTeams: DotaTeam[] = [];
    for (const team of EVO_PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team, excludedIds).length > 0) {
            activeTeams.push(team);
        }
    }
    if (activeTeams.length === 0) return undefined;

    let totalWeight = 0;
    const weights: number[] = [];
    for (const team of activeTeams) {
        let teamWeight = 1.0;
        for (const pid of getTeamPlayerIds(team, excludedIds)) {
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

export function hasMultiPlayerTeams(): boolean {
    for (const team of EVO_PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team).length >= 2) {
            return true;
        }
    }
    return false;
}

function pickWeightedTeam(
    teams: readonly DotaTeam[],
    applicants: ReadonlySet<PlayerID>,
    excludedIds?: ReadonlySet<PlayerID>
): DotaTeam | undefined {
    if (teams.length === 0) return undefined;

    let totalWeight = 0;
    const weights: number[] = [];
    for (const team of teams) {
        let teamWeight = 1.0;
        for (const pid of getTeamPlayerIds(team, excludedIds)) {
            if (applicants.has(pid)) {
                teamWeight += EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER;
            }
        }
        weights.push(teamWeight);
        totalWeight += teamWeight;
    }

    let roll = RandomFloat(0, totalWeight);
    for (let i = 0; i < teams.length; i++) {
        roll -= weights[i];
        if (roll <= 0) {
            return teams[i];
        }
    }
    return teams[teams.length - 1];
}

export function generateDuelPairs(
    applicants: ReadonlySet<PlayerID>,
    excludedIds?: ReadonlySet<PlayerID>,
    priorityIds?: ReadonlySet<PlayerID>
): DuelPair[] {
    const activeTeams: DotaTeam[] = [];
    for (const team of EVO_PLAYABLE_TEAMS) {
        if (getTeamPlayerIds(team, excludedIds).length > 0) {
            activeTeams.push(team);
        }
    }

    if (activeTeams.length < 2) return [];

    const priorityTeams =
        priorityIds && priorityIds.size > 0
            ? activeTeams.filter((team) =>
                  getTeamPlayerIds(team, excludedIds).some((pid) => priorityIds.has(pid))
              )
            : [];
    const teamA =
        priorityTeams.length > 0
            ? pickWeightedTeam(priorityTeams, applicants, excludedIds)
            : pickWeightedTeam(activeTeams, applicants, excludedIds);
    if (teamA === undefined) return [];

    const remainingTeams = activeTeams.filter((team) => team !== teamA);
    const teamB = pickWeightedTeam(remainingTeams, applicants, excludedIds);
    if (teamB === undefined) return [];

    const playerA = pickWeightedChampion(teamA, applicants, excludedIds, priorityIds);
    const playerB = pickWeightedChampion(teamB, applicants, excludedIds);
    if (playerA === undefined || playerB === undefined) return [];

    return [{ playerA, playerB, teamA, teamB }];
}

export function resolveSkippedDuelCooldown(
    lastDuelistIds: Set<PlayerID>,
    skippedPriorityIds: Set<PlayerID>
): boolean {
    if (getActiveTeamCount() < 2) {
        debugDuelChat("[Evo] Duel skipped: not enough active teams.");
        return false;
    }

    for (const team of EVO_PLAYABLE_TEAMS) {
        for (const pid of getTeamPlayerIds(team, lastDuelistIds)) {
            skippedPriorityIds.add(pid);
        }
    }
    lastDuelistIds.clear();
    GameRules.SendCustomMessage("#evo_duel_skipped_rest", 0, 0);
    debugDuelChat("[Evo] Duel skipped: rest cycle so no player fights twice in a row.");
    return true;
}

export function resolveAdaptiveWaitDeadline(
    waitCycleStartTime: number,
    currentDeadline: number,
    now: number,
    intervalSeconds: number
): { changed: boolean; nextDeadline: number } {
    const targetTime = waitCycleStartTime + intervalSeconds;
    if (Math.abs(targetTime - currentDeadline) <= 1) {
        return { changed: false, nextDeadline: currentDeadline };
    }
    return {
        changed: true,
        nextDeadline: Math.max(now + EVO_CONSTANTS.DUEL_COUNTDOWN_SECONDS + 2, targetTime),
    };
}

export function settleBets(activeBets: Map<PlayerID, DuelBet>, winnerId: PlayerID | undefined): number {
    let totalPayout = 0;
    for (const bet of activeBets.values()) {
        if (!PlayerResource.IsValidPlayerID(bet.bettorId)) continue;
        if (winnerId === undefined) {
            PlayerResource.ModifyGold(bet.bettorId, bet.goldAmount, false, ModifyGoldReason.UNSPECIFIED);
        } else if (bet.backedTarget === winnerId) {
            const payout = Math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER);
            PlayerResource.ModifyGold(bet.bettorId, payout, false, ModifyGoldReason.UNSPECIFIED);
            totalPayout += payout;
        }
    }
    activeBets.clear();
    return totalPayout;
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
