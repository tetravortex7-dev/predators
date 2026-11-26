const pvpCombatUntilByPlayer: Map<PlayerID, number> = new Map();

export function markFountainCombatLock(
    attacker: CDOTA_BaseNPC,
    victim: CDOTA_BaseNPC,
    durationSeconds: number
): void {
    if (attacker === victim) return;
    if (attacker.GetTeamNumber() === victim.GetTeamNumber()) return;
    if (!attacker.IsRealHero() || !victim.IsRealHero()) return;

    const attackerPid = attacker.GetPlayerOwnerID();
    const victimPid = victim.GetPlayerOwnerID();
    if (!PlayerResource.IsValidPlayerID(attackerPid) || !PlayerResource.IsValidPlayerID(victimPid)) {
        return;
    }

    const lockUntil = GameRules.GetDOTATime(false, false) + durationSeconds;
    pvpCombatUntilByPlayer.set(attackerPid, lockUntil);
    pvpCombatUntilByPlayer.set(victimPid, lockUntil);
}

export function isFountainCombatLocked(unit: CDOTA_BaseNPC): boolean {
    if (!unit.IsRealHero()) return false;
    const pid = unit.GetPlayerOwnerID();
    if (!PlayerResource.IsValidPlayerID(pid)) return false;
    return (pvpCombatUntilByPlayer.get(pid) ?? -999) > GameRules.GetDOTATime(false, false);
}

export function clearFountainCombatLock(playerId: PlayerID): void {
    pvpCombatUntilByPlayer.delete(playerId);
}
