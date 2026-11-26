import { EventBus } from "../../core/EventBus";
import { EVO_CONSTANTS, EVO_PLAYABLE_TEAMS } from "../../data/game_constants";
import { BossManager } from "../BossManager";
import { broadcastDuelEvent, prepareDuelistSnapshot, restoreDuelistAfterDuel } from "./duel_arena";
import {
    ActiveBossDuel,
    BOSS_DUEL_BET_BOSS,
    BOSS_DUEL_BET_TEAM,
    DuelBet,
    DuelBetPayload,
    DuelPair,
    PreDuelSnapshot,
    debugDuelChat,
    getTeamPlayerIds,
    settleBossDuelBets,
} from "./duel_types";

export function prepareBossChallengers(
    challengers: readonly PlayerID[],
    spawnA: Vector,
    spawnB: Vector,
    snapshots: Map<PlayerID, PreDuelSnapshot>,
    activeDuelistEntIndexes: Set<EntityIndex>
): void {
    const perpDir = Vector(-(spawnB.y - spawnA.y), spawnB.x - spawnA.x, 0).Normalized();
    for (let i = 0; i < challengers.length; i++) {
        const offset = (i - (challengers.length - 1) / 2) * 140;
        const spawnPos = Vector(
            spawnA.x + perpDir.x * offset,
            spawnA.y + perpDir.y * offset,
            spawnA.z
        );
        prepareDuelistSnapshot(
            challengers[i],
            spawnPos,
            spawnB,
            snapshots,
            activeDuelistEntIndexes
        );
    }
}

export function spawnDevSparringDummy(
    hero: CDOTA_BaseNPC_Hero,
    spawnPos: Vector,
    activeDuelistEntIndexes: Set<EntityIndex>
): CDOTA_BaseNPC | undefined {
    const dummy = CreateUnitByName(
        "npc_dota_hero_tidehunter",
        spawnPos,
        true,
        undefined,
        undefined,
        DotaTeam.CUSTOM_5
    );
    if (dummy && !dummy.IsNull()) {
        activeDuelistEntIndexes.add(dummy.entindex());
        if (dummy.IsHero()) {
            while (dummy.GetLevel() < hero.GetLevel()) {
                dummy.HeroLevelUp(false);
            }
        }
        ExecuteOrderFromTable({
            UnitIndex: dummy.entindex(),
            OrderType: UnitOrder.ATTACK_TARGET,
            TargetIndex: hero.entindex(),
            Queue: false,
        });
        return dummy;
    }
    return undefined;
}

export function processDuelBetPlacement(params: {
    event: DuelBetPayload;
    active: boolean;
    betsOpen: boolean;
    activeBossDuel?: ActiveBossDuel;
    currentPair?: DuelPair;
    activeBets: Map<PlayerID, DuelBet>;
}): void {
    const bettorId = params.event.PlayerID;
    if (!params.active || !params.betsOpen) return;
    if (!PlayerResource.IsValidPlayerID(bettorId)) return;
    if (params.activeBets.has(bettorId)) return;

    const backedTarget = tonumber(params.event.backed_player_id);
    if (backedTarget === undefined) return;

    if (params.activeBossDuel) {
        if (PlayerResource.GetTeam(bettorId) === params.activeBossDuel.challengingTeam) return;
        if (backedTarget !== BOSS_DUEL_BET_TEAM && backedTarget !== BOSS_DUEL_BET_BOSS) return;
    } else if (params.currentPair) {
        if (bettorId === params.currentPair.playerA || bettorId === params.currentPair.playerB) return;
        if (backedTarget !== params.currentPair.playerA && backedTarget !== params.currentPair.playerB) return;
    } else {
        return;
    }

    const amount = Math.floor(tonumber(params.event.gold_amount) ?? 0);
    if (amount < 10) return;

    const currentGold = PlayerResource.GetGold(bettorId);
    if (currentGold < amount) return;

    PlayerResource.SpendGold(bettorId, amount, ModifyGoldReason.UNSPECIFIED);
    params.activeBets.set(bettorId, {
        bettorId,
        backedTarget,
        goldAmount: amount,
    });
}

export type DuelKillOutcome =
    | { kind: "none" }
    | { kind: "boss_duel_end"; teamWon: boolean }
    | { kind: "pvp_duel_end"; winnerId: PlayerID; loserId?: PlayerID };

export function evaluateActiveDuelKill(params: {
    killedIndex: EntityIndex;
    activeBossDuel?: ActiveBossDuel;
    currentPair?: DuelPair;
    sparringDummy?: CDOTA_BaseNPC;
}): DuelKillOutcome {
    const victim = EntIndexToHScript(params.killedIndex);
    if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) {
        return { kind: "none" };
    }
    if (victim.IsReincarnating()) return { kind: "none" };

    if (params.activeBossDuel) {
        if (params.killedIndex === params.activeBossDuel.bossEntIndex) {
            const now = GameRules.GetDOTATime(false, false);
            params.activeBossDuel.lootEndTime = now + EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS;
            debugDuelChat(
                `[Evo] Boss slain! Grab the Boss Core (${EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS}s)...`
            );
            return { kind: "none" };
        }
        const anyAlive = params.activeBossDuel.challengerIds.some((pid) => {
            const h = PlayerResource.GetSelectedHeroEntity(pid);
            return h !== undefined && !h.IsNull() && IsValidEntity(h) && (h.IsAlive() || h.IsReincarnating());
        });
        return anyAlive ? { kind: "none" } : { kind: "boss_duel_end", teamWon: false };
    }

    if (!params.currentPair) return { kind: "none" };

    if (
        params.sparringDummy &&
        !params.sparringDummy.IsNull() &&
        params.killedIndex === params.sparringDummy.entindex()
    ) {
        return { kind: "pvp_duel_end", winnerId: params.currentPair.playerA };
    }

    const victimPlayerId = victim.GetPlayerOwnerID();
    if (victimPlayerId === params.currentPair.playerA) {
        return {
            kind: "pvp_duel_end",
            winnerId: params.currentPair.playerB,
            loserId: params.currentPair.playerA,
        };
    }
    if (victimPlayerId === params.currentPair.playerB) {
        return {
            kind: "pvp_duel_end",
            winnerId: params.currentPair.playerA,
            loserId: params.currentPair.playerB,
        };
    }

    return { kind: "none" };
}

function getUnitHpPercentExact(unit: CDOTA_BaseNPC | undefined): number {
    if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) {
        return 0;
    }
    return (unit.GetHealth() / Math.max(1, unit.GetMaxHealth())) * 100;
}

export function evaluateDuelTimeoutOutcome(params: {
    currentPair?: DuelPair;
    sparringDummy?: CDOTA_BaseNPC;
}): { winnerId: PlayerID | undefined; loserId: PlayerID | undefined } {
    const pair = params.currentPair;
    if (!pair) {
        return { winnerId: undefined, loserId: undefined };
    }

    const heroA = PlayerResource.IsValidPlayerID(pair.playerA)
        ? PlayerResource.GetSelectedHeroEntity(pair.playerA)
        : undefined;
    const heroB =
        pair.playerB >= 0 && PlayerResource.IsValidPlayerID(pair.playerB)
            ? PlayerResource.GetSelectedHeroEntity(pair.playerB)
            : params.sparringDummy;

    const pctA = getUnitHpPercentExact(heroA);
    const pctB = getUnitHpPercentExact(heroB);

    if (Math.abs(pctA - pctB) < 0.01) {
        return { winnerId: undefined, loserId: undefined };
    }

    if (pctA > pctB) {
        return {
            winnerId: PlayerResource.IsValidPlayerID(pair.playerA) ? pair.playerA : undefined,
            loserId: pair.playerB >= 0 && PlayerResource.IsValidPlayerID(pair.playerB) ? pair.playerB : undefined,
        };
    }

    return {
        winnerId: pair.playerB >= 0 && PlayerResource.IsValidPlayerID(pair.playerB) ? pair.playerB : undefined,
        loserId: PlayerResource.IsValidPlayerID(pair.playerA) ? pair.playerA : undefined,
    };
}

export function ensureDevTestBot(callerId: PlayerID): boolean {
    const myTeam = PlayerResource.GetTeam(callerId);
    for (const team of EVO_PLAYABLE_TEAMS) {
        if (team === myTeam) continue;
        if (getTeamPlayerIds(team).length > 0) {
            return true;
        }
    }

    const botTeam = EVO_PLAYABLE_TEAMS.find((team) => team !== myTeam) ?? DotaTeam.BADGUYS;
    const botHero = GameRules.AddBotPlayerWithEntityScript(
        EVO_CONSTANTS.BASE_HERO_NAME,
        "NoobBot",
        botTeam,
        "",
        false
    );
    return botHero !== undefined && !botHero.IsNull();
}

export function createDevSparringPair(playerId: PlayerID): DuelPair {
    return {
        playerA: playerId,
        playerB: -1 as PlayerID,
        teamA: PlayerResource.GetTeam(playerId),
        teamB: DotaTeam.CUSTOM_5,
    };
}

export function launchDevSparringFallback(params: {
    playerId: PlayerID;
    spawnA: Vector;
    spawnB: Vector;
    snapshots: Map<PlayerID, PreDuelSnapshot>;
    activeDuelistEntIndexes: Set<EntityIndex>;
}): CDOTA_BaseNPC | undefined {
    const hero = PlayerResource.GetSelectedHeroEntity(params.playerId);
    if (!hero || hero.IsNull() || !IsValidEntity(hero)) return undefined;
    prepareDuelistSnapshot(
        params.playerId,
        params.spawnA,
        params.spawnB,
        params.snapshots,
        params.activeDuelistEntIndexes
    );
    return spawnDevSparringDummy(hero, params.spawnB, params.activeDuelistEntIndexes);
}

export function prepareDevTestCountdown(
    callerId: PlayerID,
    rawDelay: string | undefined
): { delay: number; nextDuelTime: number; hasBot: boolean } {
    const delay = Math.max(6, Math.min(30, tonumber(rawDelay) ?? 8));
    const hasBot = ensureDevTestBot(callerId);
    debugDuelChat(
        hasBot
            ? `[Evo] Test duel countdown set to ${delay}s vs NoobBot!`
            : "[Evo] Failed to spawn test bot!"
    );
    return {
        delay,
        nextDuelTime: GameRules.GetDOTATime(false, false) + delay,
        hasBot,
    };
}

export function launchBossArenaDuelState(params: {
    challengingTeam: DotaTeam;
    bossManager: BossManager;
    spawnA: Vector;
    spawnB: Vector;
    roundIndex: number;
    snapshots: Map<PlayerID, PreDuelSnapshot>;
    activeDuelistEntIndexes: Set<EntityIndex>;
    eventBus: EventBus;
    onBeginStage: () => void;
    onRecordDuelists: (ids: readonly PlayerID[]) => void;
}): ActiveBossDuel | undefined {
    const bossInfo = params.bossManager.getStrongestAliveBoss();
    if (!bossInfo) return undefined;
    const challengers = getTeamPlayerIds(params.challengingTeam);
    if (challengers.length === 0) return undefined;
    const bossReturnPos = params.bossManager.prepareBossForArena(bossInfo.bossId, params.spawnB, params.spawnA);
    if (!bossReturnPos) return undefined;

    params.onRecordDuelists(challengers);
    params.onBeginStage();
    prepareBossChallengers(
        challengers,
        params.spawnA,
        params.spawnB,
        params.snapshots,
        params.activeDuelistEntIndexes
    );
    params.activeDuelistEntIndexes.add(bossInfo.unit.entindex());
    params.eventBus.emit("duel_started", { roundIndex: params.roundIndex, isTiebreaker: false });
    broadcastDuelEvent("started");
    debugDuelChat(`[Evo] BOSS ARENA! Team ${params.challengingTeam} vs ${bossInfo.bossId} (Lv.${bossInfo.level})`);
    return {
        bossId: bossInfo.bossId,
        bossEntIndex: bossInfo.unit.entindex(),
        bossReturnPos,
        challengingTeam: params.challengingTeam,
        challengerIds: challengers,
    };
}

export function completeBossArenaDuelState(params: {
    bossDuel: ActiveBossDuel;
    teamWon: boolean;
    roundIndex: number;
    activeBets: Map<PlayerID, DuelBet>;
    snapshots: Map<PlayerID, PreDuelSnapshot>;
    bossManager: BossManager;
    eventBus: EventBus;
}): void {
    settleBossDuelBets(params.activeBets, params.teamWon);
    for (const pid of params.bossDuel.challengerIds) {
        restoreDuelistAfterDuel(pid, params.teamWon, params.snapshots);
    }
    params.snapshots.clear();
    params.bossManager.returnBossFromArena(
        params.bossDuel.bossId,
        params.bossDuel.bossReturnPos,
        !params.teamWon
    );
    const leadWinner = params.teamWon ? params.bossDuel.challengerIds[0] : undefined;
    params.eventBus.emit("duel_finished", {
        roundIndex: params.roundIndex,
        winnerId: leadWinner,
        loserId: undefined,
        isTiebreaker: false,
    });
    broadcastDuelEvent("finished", leadWinner);
    debugDuelChat(
        params.teamWon
            ? `[Evo] Team ${params.bossDuel.challengingTeam} defeated ${params.bossDuel.bossId} in the Boss Arena!`
            : `[Evo] ${params.bossDuel.bossId} crushed the challengers and entered COURAGE mode!`
    );
}

