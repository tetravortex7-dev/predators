import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";

const SCRIPT_PATH = "abilities/wisp/evo_wisp_t0";

LinkLuaModifier("modifier_evo_wisp_pulse_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_wisp_surge", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_wisp_pulse")
export class evo_wisp_pulse extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const radius = this.GetSpecialValueFor("radius");
        const heroDamage = this.GetSpecialValueFor("damage");
        const creepDamage = this.GetSpecialValueFor("creep_damage");
        const slowDuration = this.GetSpecialValueFor("slow_duration");

        const origin = caster.GetAbsOrigin();
        const fx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_wisp/wisp_guardian_explosion.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(fx, 0, origin);
        ParticleManager.ReleaseParticleIndex(fx);

        EmitSoundOn("Hero_Wisp.Spirits.Target", caster);

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            radius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const dmg = isEvoCreepUnit(enemy) ? creepDamage : heroDamage;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            if (enemy.IsAlive()) {
                enemy.AddNewModifier(caster, this, "modifier_evo_wisp_pulse_slow", {
                    duration: slowDuration,
                });
            }
        }
    }
}

@registerModifier("modifier_evo_wisp_pulse_slow")
export class modifier_evo_wisp_pulse_slow extends BaseModifier {
    private slowPct = 20;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "wisp_spirits";
    }
    OnCreated(): void {
        const ability = this.GetAbility();
        this.slowPct = ability && !ability.IsNull() ? ability.GetSpecialValueFor("slow_pct") : 20;
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -(this.slowPct ?? 20);
    }
}

@registerAbility("evo_wisp_surge")
export class evo_wisp_surge extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const duration = this.GetSpecialValueFor("duration");
        caster.AddNewModifier(caster, this, "modifier_evo_wisp_surge", { duration });
        EmitSoundOn("Hero_Wisp.Overcharge", caster);
    }
}

@registerModifier("modifier_evo_wisp_surge")
export class modifier_evo_wisp_surge extends BaseModifier {
    private bonusMsPct = 25;
    private bonusAs = 70;
    private bonusCreepDmg = 25;
    private killHeal = 35;
    private killMana = 15;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "wisp_overcharge";
    }
    GetEffectName(): string {
        return "particles/units/heroes/hero_wisp/wisp_overcharge.vpcf";
    }
    GetEffectAttachType(): ParticleAttachment {
        return ParticleAttachment.ABSORIGIN_FOLLOW;
    }
    OnCreated(): void {
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            this.bonusMsPct = ability.GetSpecialValueFor("bonus_ms_pct");
            this.bonusAs = ability.GetSpecialValueFor("bonus_attack_speed");
            this.bonusCreepDmg = ability.GetSpecialValueFor("bonus_creep_damage");
            this.killHeal = ability.GetSpecialValueFor("kill_heal");
            this.killMana = ability.GetSpecialValueFor("kill_mana");
        } else {
            this.bonusMsPct = 25;
            this.bonusAs = 70;
            this.bonusCreepDmg = 25;
            this.killHeal = 35;
            this.killMana = 15;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.bonusMsPct ?? 25;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.bonusAs ?? 70;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.attacker !== parent) return;

        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (!isEvoCreepUnit(target)) return;

        ApplyDamage({
            victim: target,
            attacker: parent,
            ability: this.GetAbility(),
            damage: this.bonusCreepDmg ?? 25,
            damage_type: DamageTypes.MAGICAL,
        });
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.attacker !== parent || event.unit === parent) return;
        if (!event.unit || event.unit.IsNull()) return;

        parent.Heal(this.killHeal ?? 35, this.GetAbility());
        parent.GiveMana(this.killMana ?? 15);

        const fx = ParticleManager.CreateParticle(
            "particles/generic_gameplay/generic_lifesteal.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.ReleaseParticleIndex(fx);
    }
}
