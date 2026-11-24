import { BaseModifier, dotaModifierFunction, registerModifier } from "../lib/dota_ts_adapter";
import { getMutationDefinition } from "../data/mutations_catalog";
import { MutationDefinition } from "../data/data_schemas";

@registerModifier("modifier_evo_mutation_runtime")
export class modifier_evo_mutation_runtime extends BaseModifier {
    private mutationDef?: MutationDefinition;
    private lastTriggerTime = -999;
    private triggerBuffUntil = 0;

    public IsHidden(): boolean {
        return false;
    }

    public IsPurgable(): boolean {
        return false;
    }

    public RemoveOnDeath(): boolean {
        return false;
    }

    public GetAttributes(): ModifierAttribute {
        return ModifierAttribute.MULTIPLE + ModifierAttribute.PERMANENT;
    }

    public OnCreated(params: { mutation_id?: string }): void {
        if (!IsServer()) return;
        if (params && params.mutation_id) {
            this.mutationDef = getMutationDefinition(params.mutation_id);
        }
        if (this.mutationDef && this.mutationDef.triggerType === "INTERVAL") {
            const interval = this.mutationDef.intervalSeconds ?? 10;
            this.StartIntervalThink(interval);
        }
    }

    public OnIntervalThink(): void {
        if (!IsServer() || !this.mutationDef) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;

        parent.Heal(Math.floor(parent.GetMaxHealth() * 0.04), undefined);
        parent.GiveMana(Math.floor(parent.GetMaxMana() * 0.04));
    }

    public DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_EXTRA_HEALTH_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
        ];
    }

    public GetModifierPreAttack_BonusDamage(): number {
        if (!this.mutationDef) return 0;
        if (this.mutationDef.triggerType === "PASSIVE" || this.isTriggerActive()) {
            return this.mutationDef.bonusDamage ?? 0;
        }
        return 0;
    }

    public GetModifierPhysicalArmorBonus(): number {
        if (!this.mutationDef) return 0;
        if (this.mutationDef.triggerType === "PASSIVE" || this.isTriggerActive()) {
            return this.mutationDef.bonusArmor ?? 0;
        }
        return 0;
    }

    public GetModifierMoveSpeedBonus_Constant(): number {
        if (!this.mutationDef) return 0;
        if (this.mutationDef.triggerType === "PASSIVE" || this.isTriggerActive()) {
            return this.mutationDef.bonusMoveSpeed ?? 0;
        }
        return 0;
    }

    public GetModifierAttackSpeedBonus_Constant(): number {
        if (!this.mutationDef) return 0;
        if (this.mutationDef.triggerType === "PASSIVE" || this.isTriggerActive()) {
            return this.mutationDef.bonusAttackSpeed ?? 0;
        }
        return 0;
    }

    public GetModifierExtraHealthBonus(): number {
        if (!this.mutationDef) return 0;
        return this.mutationDef.bonusHealth ?? 0;
    }

    public OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer() || !this.mutationDef) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || event.unit !== parent) return;

        const now = GameRules.GetGameTime();
        const cooldown = this.mutationDef.cooldown ?? 5;
        if (now - this.lastTriggerTime < cooldown) return;

        if (this.mutationDef.triggerType === "HP_BELOW_PERCENT") {
            const threshold = this.mutationDef.thresholdPercent ?? 35;
            if (parent.GetHealthPercent() <= threshold) {
                this.lastTriggerTime = now;
                this.triggerBuffUntil = now + 4;
            }
        } else if (this.mutationDef.triggerType === "ON_DAMAGE_TAKEN" && event.damage > 0) {
            this.lastTriggerTime = now;
            this.triggerBuffUntil = now + 3;
        }
    }

    public OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer() || !this.mutationDef) return;
        if (this.mutationDef.triggerType !== "ON_KILL") return;

        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || event.attacker !== parent) return;

        const now = GameRules.GetGameTime();
        const cooldown = this.mutationDef.cooldown ?? 5;
        if (now - this.lastTriggerTime < cooldown) return;

        this.lastTriggerTime = now;
        this.triggerBuffUntil = now + 6;
        parent.Heal(Math.floor(parent.GetMaxHealth() * 0.1), undefined);
    }

    private isTriggerActive(): boolean {
        return GameRules.GetGameTime() <= this.triggerBuffUntil;
    }
}
