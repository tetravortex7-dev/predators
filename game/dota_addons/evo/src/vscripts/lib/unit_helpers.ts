export function isEvoCreepUnit(unit: CDOTA_BaseNPC | undefined): boolean {
    if (!unit || unit.IsNull() || !IsValidEntity(unit)) return false;
    if (unit.IsHero() || unit.IsConsideredHero() || unit.IsBuilding() || unit.IsOther() || unit.IsBoss()) {
        return false;
    }
    return (
        unit.IsCreep() ||
        unit.IsNeutralUnitType() ||
        unit.IsCreature() ||
        unit.GetTeamNumber() === DotaTeam.NEUTRALS
    );
}

export function focusPlayerCamera(
    playerId: PlayerID,
    hero: CDOTA_BaseNPC_Hero,
    position: Vector
): void {
    if (!PlayerResource.IsValidPlayerID(playerId)) return;
    const player = PlayerResource.GetPlayer(playerId);
    if (!player || player.IsNull()) return;

    PlayerResource.SetCameraTarget(playerId, hero);
    CenterCameraOnUnit(playerId, hero);
    CustomGameEventManager.Send_ServerToPlayer(
        player,
        "evo_focus_camera" as never,
        {
            x: position.x,
            y: position.y,
            z: position.z,
            entindex: hero.entindex(),
        } as never
    );

    GameRules.GetGameModeEntity().SetContextThink(
        DoUniqueString("EvoUnlockCam"),
        () => {
            PlayerResource.SetCameraTarget(playerId, undefined);
            CenterCameraOnUnit(playerId, undefined);
            return undefined;
        },
        0.25
    );
}
