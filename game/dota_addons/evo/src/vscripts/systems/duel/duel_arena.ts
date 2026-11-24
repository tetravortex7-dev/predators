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
    hero.RemoveModifierByName("modifier_evo_world_pause");
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
    hero.Stop();
    const dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0).Normalized();
    hero.SetForwardVector(dir);

    activeDuelistEntIndexes.add(hero.entindex());
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

    if (!hero.IsAlive()) {
        hero.RespawnHero(false, false);
    }

    FindClearSpaceForUnit(hero, snapshot.position, true);
    hero.Stop();

    if (isWinner) {
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

export function releaseWorldPause(pausedEntIndexes: Set<EntityIndex>): void {
    for (const entIndex of pausedEntIndexes) {
        const ent = EntIndexToHScript(entIndex);
        if (ent && !ent.IsNull() && IsValidEntity(ent) && ent.IsBaseNPC()) {
            ent.RemoveModifierByName("modifier_evo_world_pause");
        }
    }
    pausedEntIndexes.clear();
}

export function applyWorldPause(
    activeDuelistEntIndexes: ReadonlySet<EntityIndex>,
    pausedEntIndexes: Set<EntityIndex>
): void {
    releaseWorldPause(pausedEntIndexes);

    const allUnits = FindUnitsInRadius(
        DotaTeam.GOODGUYS,
        Vector(0, 0, 0),
        undefined,
        FIND_UNITS_EVERYWHERE,
        UnitTargetTeam.BOTH,
        UnitTargetType.HERO | UnitTargetType.BASIC,
        UnitTargetFlags.INVULNERABLE | UnitTargetFlags.MAGIC_IMMUNE_ENEMIES,
        FindOrder.ANY,
        false
    );

    for (const unit of allUnits) {
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) continue;
        if (activeDuelistEntIndexes.has(unit.entindex())) continue;
        unit.AddNewModifier(unit, undefined, "modifier_evo_world_pause", {});
        pausedEntIndexes.add(unit.entindex());
    }

    for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
        const pid = i as PlayerID;
        if (!PlayerResource.IsValidPlayerID(pid)) continue;
        const hero = PlayerResource.GetSelectedHeroEntity(pid);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) continue;
        if (activeDuelistEntIndexes.has(hero.entindex())) continue;
        hero.AddNewModifier(hero, undefined, "modifier_evo_world_pause", {});
        pausedEntIndexes.add(hero.entindex());
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
        } as never
    );
}
