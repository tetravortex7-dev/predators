interface TriggerTouchEvent {
    activator?: CBaseEntity;
    caller?: CBaseEntity;
}

function OnStartTouch(this: void, event: TriggerTouchEvent): void {
    const unit = event.activator;
    const trigger = event.caller;
    if (!unit || unit.IsNull() || !IsValidEntity(unit)) return;
    if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) return;
}

function OnEndTouch(this: void, event: TriggerTouchEvent): void {
    const unit = event.activator;
    const trigger = event.caller;
    if (!unit || unit.IsNull() || !IsValidEntity(unit)) return;
    if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) return;

    const duelManager = GameRules.EvoAddon?.duelManager;
    if (!duelManager || !duelManager.isActiveDuelist(unit)) return;

    if (unit.IsBaseNPC() && unit.IsAlive()) {
        FindClearSpaceForUnit(unit, duelManager.getArenaCenter(), true);
    }
}

Object.assign(getfenv(), {
    OnStartTouch,
    OnEndTouch,
});
