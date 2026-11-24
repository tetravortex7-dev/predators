import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bosses/evo_elasmyr_adaptive_scales";

LinkLuaModifier("modifier_evo_elasmyr_adaptive_scales", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_elasmyr_scales_burst_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_elasmyr_adaptive_scales")
export class evo_elasmyr_adaptive_scales extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_elasmyr_adaptive_scales";
    }
}

@registerModifier("modifier_evo_elasmyr_adaptive_scales")
export class modifier_evo_elasmyr_adaptive_scales extends BaseModifier {
    private lastStackTime = 0;

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
    OnCreated(): void {
        if (!IsServer()) return;
        this.lastStackTime = 0;
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        if (this.GetStackCount() <= 0) return;
        const now = GameRules.GetDOTATime(false, false);
        if (now - this.lastStackTime >= 6.0) {
            this.SetStackCount(0);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const ability = this.GetAbility();
        const perStack = ability ? ability.GetSpecialValueFor("armor_per_stack") : 2;
        return this.GetStackCount() * perStack;
    }
    GetModifierMagicalResistanceBonus(): number {
        const ability = this.GetAbility();
        const perStack = ability ? ability.GetSpecialValueFor("magic_resist_per_stack") : 2.5;
        return this.GetStackCount() * perStack;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.unit !== parent) return;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return;
        if (!attacker.IsHero() && !attacker.IsConsideredHero()) return;
        if (event.damage < 15) return;

        const ability = this.GetAbility();
        const maxStacks = ability ? ability.GetSpecialValueFor("max_stacks") : 10;
        const nextStacks = this.GetStackCount() + 1;
        this.lastStackTime = GameRules.GetDOTATime(false, false);

        if (nextStacks >= maxStacks) {
            this.SetStackCount(0);
            parent.Purge(false, true, false, true, false);
            this.triggerTideBurst(parent, ability);
        } else {
            this.SetStackCount(nextStacks);
        }
    }
    private triggerTideBurst(parent: CDOTA_BaseNPC, ability?: CDOTABaseAbility): void {
        const radius = ability ? ability.GetSpecialValueFor("burst_radius") : 350;
        const damage = ability ? ability.GetSpecialValueFor("burst_damage") : 180;
        const origin = parent.GetAbsOrigin();

        parent.EmitSound("Hero_Slardar.Slithereen_Crush");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, radius, radius));
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
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
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(parent, ability, "modifier_evo_elasmyr_scales_burst_slow", { duration: 1.5 });
        }
    }
}

@registerModifier("modifier_evo_elasmyr_scales_burst_slow")
export class modifier_evo_elasmyr_scales_burst_slow extends BaseModifier {
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
        return "slardar_bash";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -35;
    }
}
