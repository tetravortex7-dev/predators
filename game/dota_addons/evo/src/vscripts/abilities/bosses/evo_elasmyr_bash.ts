import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bosses/evo_elasmyr_bash";

if (IsServer()) {
    LinkLuaModifier("modifier_evo_elasmyr_bash", SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_elasmyr_bash")
export class evo_elasmyr_bash extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_elasmyr_bash";
    }
}

@registerModifier("modifier_evo_elasmyr_bash")
export class modifier_evo_elasmyr_bash extends BaseModifier {
    IsHidden(): boolean {
        return this.GetStackCount() <= 0;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "slardar_bash";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding() || target.IsOther()) return;
        if (parent.PassivesDisabled()) return;

        const ability = this.GetAbility();
        const attackCount = ability ? ability.GetSpecialValueFor("attack_count") : 4;
        const nextStacks = this.GetStackCount() + 1;

        if (nextStacks >= attackCount) {
            this.SetStackCount(0);
            const bonusDamage = ability ? ability.GetSpecialValueFor("bonus_damage") : 50;
            const bashDuration = ability ? ability.GetSpecialValueFor("bash_duration") : 0.7;

            target.EmitSound("Hero_Slardar.Bash");
            target.AddNewModifier(parent, ability, "modifier_stunned", { duration: bashDuration });
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability,
                damage: bonusDamage,
                damage_type: DamageTypes.PHYSICAL,
            });
        } else {
            this.SetStackCount(nextStacks);
        }
    }
}
