const PROTECTED_ITEM_ORDERS: ReadonlySet<dotaunitorder_t> = new Set([
    UnitOrder.SELL_ITEM,
    UnitOrder.SET_ITEM_MARK_FOR_SELL,
    UnitOrder.DROP_ITEM,
    UnitOrder.GIVE_ITEM,
    UnitOrder.DISASSEMBLE_ITEM,
    UnitOrder.EJECT_ITEM_FROM_STASH,
    UnitOrder.DROP_ITEM_AT_FOUNTAIN,
]);

export type OrderGuard = (event: ExecuteOrderFilterEvent) => boolean;

export class OrderFilterManager {
    private readonly guards: OrderGuard[] = [];

    public init(): void {
        GameRules.GetGameModeEntity().SetExecuteOrderFilter(
            (event) => this.filterOrder(event),
            this
        );
    }

    public registerGuard(guard: OrderGuard): void {
        this.guards.push(guard);
    }

    private filterOrder(event: ExecuteOrderFilterEvent): boolean {
        if (this.isProtectedItemOrderBlocked(event)) {
            this.notifyBlockedOrder(event.issuer_player_id_const);
            return false;
        }

        for (const guard of this.guards) {
            if (!guard(event)) {
                return false;
            }
        }

        return true;
    }

    private isProtectedItemOrderBlocked(event: ExecuteOrderFilterEvent): boolean {
        if (!PROTECTED_ITEM_ORDERS.has(event.order_type)) {
            return false;
        }

        const issuerId = event.issuer_player_id_const;
        const hasValidIssuer = PlayerResource.IsValidPlayerID(issuerId);

        if (event.entindex_ability > 0) {
            const abilityOrItem = EntIndexToHScript(event.entindex_ability) as
                | Partial<CDOTABaseAbility>
                | undefined;
            if (
                abilityOrItem &&
                !abilityOrItem.IsNull?.() &&
                IsValidEntity(abilityOrItem as CBaseEntity) &&
                abilityOrItem.IsItem?.()
            ) {
                const item = abilityOrItem as CDOTA_Item;
                const purchaser = item.GetPurchaser();
                if (this.isOwnerProtectedOrForeign(purchaser, issuerId, hasValidIssuer)) {
                    return true;
                }
            }
        }

        for (const unitEntIndex of Object.values(event.units)) {
            const unit = EntIndexToHScript(unitEntIndex);
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsBaseNPC()) {
                continue;
            }
            if (this.isOwnerProtectedOrForeign(unit, issuerId, hasValidIssuer)) {
                return true;
            }
        }

        return false;
    }

    private isOwnerProtectedOrForeign(
        ownerUnit: CDOTA_BaseNPC | undefined,
        issuerId: PlayerID,
        hasValidIssuer: boolean
    ): boolean {
        if (!ownerUnit || ownerUnit.IsNull() || !IsValidEntity(ownerUnit)) {
            return false;
        }
        if (ownerUnit.IsHero() && ownerUnit.HasOwnerAbandoned()) {
            return true;
        }

        const ownerPlayerId = ownerUnit.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(ownerPlayerId)) {
            return false;
        }

        const state = PlayerResource.GetConnectionState(ownerPlayerId);
        if (state === ConnectionState.ABANDONED || state === ConnectionState.DISCONNECTED) {
            return true;
        }

        return hasValidIssuer && issuerId !== ownerPlayerId;
    }

    private notifyBlockedOrder(issuerId: PlayerID): void {
        if (!PlayerResource.IsValidPlayerID(issuerId)) return;
        const player = PlayerResource.GetPlayer(issuerId);
        if (!player || player.IsNull()) return;
        EmitSoundOnClient("General.CastFail_InvalidTarget_Hero", player);
    }
}
