import { EVO_CONSTANTS } from "../../data/game_constants";
import { focusPlayerCamera } from "../../lib/unit_helpers";
import { ActiveBossDuel, DuelPair, PreDuelSnapshot } from "./duel_types";

export function prepareDuelistSnapshot(
    playerId: PlayerID,
    spawnPos: Vector,
    lookTarget: Vector,
    snapshots: Map<PlayerID, PreDuelSnapshot>,
    activeDuelistEntIndexes: Set<EntityIndex>
): void {
    if (!PlayerResource.IsValidPlayerID(playerId)) return;
    const hero = PlayerResource.GetSelectedHeroEntity(playerId);
    if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

    const peaceMod = hero.FindModifierByName("modifier_evo_peace_time");
    const peaceRemaining = peaceMod ? Math.max(0, peaceMod.GetRemainingTime()) : 0;

    const abilityCooldowns = new Map<string, number>();
    for (let i = 0; i < hero.GetAbilityCount(); i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (!ability || ability.IsNull()) continue;
        const cd = ability.GetCooldownTimeRemaining();
        if (cd > 0) {
            abilityCooldowns.set(ability.GetAbilityName(), cd);
        }
    }

    const itemCooldowns = new Map<number, number>();
    for (let slot = 0; slot < 9; slot++) {
        const item = hero.GetItemInSlot(slot);
        if (!item || item.IsNull()) continue;
        const cd = item.GetCooldownTimeRemaining();
        if (cd > 0) {
            itemCooldowns.set(slot, cd);
        }
    }

    snapshots.set(playerId, {
        position: hero.GetAbsOrigin(),
        health: hero.GetHealth(),
        mana: hero.GetMana(),
        wasAlive: hero.IsAlive(),
        abilityCooldowns,
        itemCooldowns,
        peaceTimeRemaining: peaceRemaining,
    });

    if (!hero.IsAlive()) {
        hero.RespawnHero(false, false);
    }

    hero.RemoveModifierByName("modifier_evo_peace_time");
    hero.RemoveModifierByName("modifier_fountain_buff_lua");
    hero.Purge(false, true, false, true, true);
    hero.SetHealth(hero.GetMaxHealth());
    hero.SetMana(hero.GetMaxMana());

    for (let i = 0; i < hero.GetAbilityCount(); i++) {
        const ability = hero.GetAbilityByIndex(i);
        if (ability && !ability.IsNull()) {
            ability.EndCooldown();
        }
    }
    for (let slot = 0; slot < 9; slot++) {
        const item = hero.GetItemInSlot(slot);
        if (item && !item.IsNull()) {
            item.EndCooldown();
        }
    }

    FindClearSpaceForUnit(hero, spawnPos, true);
    hero.RemoveModifierByName("modifier_fountain_buff_lua");
    hero.Stop();
    const dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0).Normalized();
    hero.SetForwardVector(dir);
    focusPlayerCamera(playerId, hero, spawnPos);

    activeDuelistEntIndexes.add(hero.entindex());
    hero.RemoveModifierByName("modifier_fountain_buff_lua");
}

export function restoreDuelistAfterDuel(
    playerId: PlayerID,
    isWinner: boolean,
    snapshots: ReadonlyMap<PlayerID, PreDuelSnapshot>
): void {
    if (!PlayerResource.IsValidPlayerID(playerId)) return;
    const hero = PlayerResource.GetSelectedHeroEntity(playerId);
    const snapshot = snapshots.get(playerId);
    if (!hero || hero.IsNull() || !IsValidEntity(hero) || !snapshot) return;

    const survivedDuel = hero.IsAlive();
    if (!survivedDuel) {
        hero.RespawnHero(false, false);
    }

    FindClearSpaceForUnit(hero, snapshot.position, true);
    hero.Stop();
    focusPlayerCamera(playerId, hero, snapshot.position);

    if (isWinner || survivedDuel) {
        hero.Purge(false, true, false, true, true);
        hero.SetHealth(Math.max(1, Math.min(hero.GetMaxHealth(), snapshot.health)));
        hero.SetMana(Math.max(0, Math.min(hero.GetMaxMana(), snapshot.mana)));

        for (let i = 0; i < hero.GetAbilityCount(); i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (!ability || ability.IsNull()) continue;
            ability.EndCooldown();
            const savedCd = snapshot.abilityCooldowns.get(ability.GetAbilityName());
            if (savedCd !== undefined && savedCd > 0) {
                ability.StartCooldown(savedCd);
            }
        }

        for (let slot = 0; slot < 9; slot++) {
            const item = hero.GetItemInSlot(slot);
            if (!item || item.IsNull()) continue;
            item.EndCooldown();
            const savedCd = snapshot.itemCooldowns.get(slot);
            if (savedCd !== undefined && savedCd > 0) {
                item.StartCooldown(savedCd);
            }
        }
    }

    if (snapshot.peaceTimeRemaining > 0) {
        hero.AddNewModifier(hero, undefined, "modifier_evo_peace_time", {
            duration: snapshot.peaceTimeRemaining,
        });
    }
}

export function broadcastDuelEvent(eventName: "announced" | "started" | "finished", winnerId?: PlayerID): void {
    CustomGameEventManager.Send_ServerToAllClients(
        "evo_duel_event" as never,
        {
            event: eventName,
            winner_id: winnerId,
        } as never
    );
}

export function notifyPreDuelCountdown(pair: DuelPair, secondsLeft: number): void {
    for (const pid of [pair.playerA, pair.playerB]) {
        if (!PlayerResource.IsValidPlayerID(pid)) continue;
        const player = PlayerResource.GetPlayer(pid);
        if (!player || player.IsNull()) continue;
        EmitSoundOnClient("General.Ping", player);
        CustomGameEventManager.Send_ServerToPlayer(
            player,
            "evo_duel_countdown_tick" as never,
            { seconds_left: secondsLeft } as never
        );
    }
}

export function syncDuelNetState(params: {
    active: boolean;
    roundIndex: number;
    nextDuelTime: number;
    duelEndTime: number;
    betsOpen: boolean;
    isTiebreaker: boolean;
    activeBossDuel?: ActiveBossDuel;
    currentPair?: DuelPair;
    tiebreakerWins: ReadonlyMap<DotaTeam, number>;
    duelWins: ReadonlyMap<PlayerID, number>;
    duelLosses: ReadonlyMap<PlayerID, number>;
}): void {
    const now = GameRules.GetDOTATime(false, false);
    const remaining = params.active
        ? Math.max(
              0,
              Math.ceil((params.activeBossDuel?.lootEndTime ?? params.duelEndTime) - now)
          )
        : 0;
    const nextIn = !params.active ? Math.max(0, Math.ceil(params.nextDuelTime - now)) : 0;

    const tiebreakerPayload: Record<string, number> = {};
    for (const [team, wins] of params.tiebreakerWins.entries()) {
        tiebreakerPayload[tostring(team)] = wins;
    }

    const playerRecords: Record<string, { wins: number; losses: number }> = {};
    for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
        const pid = i as PlayerID;
        if (!PlayerResource.IsValidPlayerID(pid)) continue;
        playerRecords[tostring(pid)] = {
            wins: params.duelWins.get(pid) ?? 0,
            losses: params.duelLosses.get(pid) ?? 0,
        };
    }

    CustomNetTables.SetTableValue(
        "duel_state" as never,
        "state",
        {
            active: params.active,
            round_index: params.roundIndex,
            time_remaining: remaining,
            next_duel_in: nextIn,
            bets_open: params.betsOpen,
            is_tiebreaker: params.isTiebreaker,
            is_boss_duel: params.activeBossDuel !== undefined,
            boss_id: params.activeBossDuel?.bossId ?? "",
            challenging_team: params.activeBossDuel?.challengingTeam ?? -1,
            player_a: params.currentPair ? params.currentPair.playerA : -1,
            player_b: params.currentPair ? params.currentPair.playerB : -1,
            tiebreaker_scores: tiebreakerPayload,
            player_records: playerRecords,
        } as never
    );
}

export function syncDuelResultNetState(params: {
    roundIndex: number;
    winnerId: PlayerID | undefined;
    isDraw: boolean;
    reason: "kill" | "hp" | "draw" | "boss";
    scoreReward: number;
    goldReward: number;
    betPayout: number;
    expiresAt: number;
}): void {
    CustomNetTables.SetTableValue(
        "duel_state" as never,
        "last_result",
        {
            round_index: params.roundIndex,
            winner_id: params.winnerId ?? -1,
            is_draw: params.isDraw,
            reason: params.reason,
            score_reward: params.scoreReward,
            gold_reward: params.goldReward,
            bet_payout: params.betPayout,
            expires_at: params.expiresAt,
        } as never
    );
}

export function resolveAndRecordPvpOutcome(params: {
    winnerId: PlayerID | undefined;
    loserId: PlayerID | undefined;
    pair?: DuelPair;
    isTiebreaker: boolean;
    roundIndex: number;
    reason: "kill" | "hp" | "draw";
    totalBetPayout: number;
    duelWins: Map<PlayerID, number>;
    duelLosses: Map<PlayerID, number>;
}): { validWinner: PlayerID | undefined; validLoser: PlayerID | undefined } {
    const validWinner =
        params.winnerId !== undefined && PlayerResource.IsValidPlayerID(params.winnerId)
            ? params.winnerId
            : undefined;
    let validLoser =
        params.loserId !== undefined && PlayerResource.IsValidPlayerID(params.loserId)
            ? params.loserId
            : undefined;
    if (validLoser === undefined && validWinner !== undefined && params.pair) {
        const candidate = params.pair.playerA === validWinner ? params.pair.playerB : params.pair.playerA;
        if (candidate >= 0 && PlayerResource.IsValidPlayerID(candidate)) {
            validLoser = candidate;
        }
    }

    if (!params.isTiebreaker) {
        const now = GameRules.GetDOTATime(false, false);
        let goldReward = 0;
        if (validWinner !== undefined) {
            params.duelWins.set(validWinner, (params.duelWins.get(validWinner) ?? 0) + 1);
            if (validLoser !== undefined && validLoser !== validWinner) {
                params.duelLosses.set(validLoser, (params.duelLosses.get(validLoser) ?? 0) + 1);
            }
            const elapsedMinutes = Math.floor(now / 60);
            goldReward = EVO_CONSTANTS.DUEL_WIN_BASE_GOLD + elapsedMinutes * 15;
            const xpReward = EVO_CONSTANTS.DUEL_WIN_BASE_XP + elapsedMinutes * 20;
            PlayerResource.ModifyGold(validWinner, goldReward, true, ModifyGoldReason.HERO_KILL);
            const winnerHero = PlayerResource.GetSelectedHeroEntity(validWinner);
            if (winnerHero && !winnerHero.IsNull() && IsValidEntity(winnerHero)) {
                winnerHero.AddExperience(xpReward, ModifyXpReason.HERO_KILL, false, true, 0);
            }
        }
        syncDuelResultNetState({
            roundIndex: params.roundIndex,
            winnerId: validWinner,
            isDraw: validWinner === undefined,
            reason: validWinner === undefined ? "draw" : params.reason,
            scoreReward: validWinner !== undefined ? EVO_CONSTANTS.SCORE_DUEL_WIN : 0,
            goldReward,
            betPayout: params.totalBetPayout,
            expiresAt: now + EVO_CONSTANTS.DUEL_RESULT_BANNER_SECONDS,
        });
    }

    return { validWinner, validLoser };
}
