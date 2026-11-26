import {
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerModifier,
} from "../lib/dota_ts_adapter";

@registerModifier("modifier_fountain_buff_lua")
export class modifier_fountain_buff_lua extends BaseModifier {
    public GetTexture(): string {
        return "fountain_heal";
    }

    public CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVULNERABLE")]: true,
            [dotaModifierState("MODIFIER_STATE_ATTACK_IMMUNE")]: true,
            [dotaModifierState("MODIFIER_STATE_UNTARGETABLE_ENEMY")]: true,
            [dotaModifierState("MODIFIER_STATE_LOW_ATTACK_PRIORITY")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_HEALTH_BAR_FOR_ENEMIES")]: true,
        };
    }

    public DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
        ];
    }

    public OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(0.2);
    }

    public OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;

        const duelMgr = GameRules.EvoAddon?.duelManager;
        if (duelMgr && duelMgr.isActiveDuelist(parent)) {
            this.Destroy();
            return;
        }

        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) {
            this.Destroy();
            return;
        }
        const pPos = parent.GetAbsOrigin();
        const cPos = caster.GetAbsOrigin();
        const dx = pPos.x - cPos.x;
        const dy = pPos.y - cPos.y;
        if (dx * dx + dy * dy > 800 * 800) {
            this.Destroy();
            return;
        }

        parent.Purge(false, true, false, true, true);

        for (let slot = 0; slot < 9; slot++) {
            const item = parent.GetItemInSlot(slot);
            if (item && !item.IsNull() && item.GetAbilityName() === "item_bottle") {
                item.SetCurrentCharges(3);
            }
        }
    }

    public GetModifierHealthRegenPercentage(): number {
        return 20;
    }

    public GetModifierTotalPercentageManaRegen(): number {
        return 20;
    }

    public GetModifierConstantManaRegen(): number {
        return 30;
    }
}
