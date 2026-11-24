import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bosses/evo_elasmyr_abyssal_flood";

LinkLuaModifier("modifier_evo_elasmyr_flood_thinker", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_elasmyr_flood_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_elasmyr_flood_debuff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_elasmyr_abyssal_flood")
export class evo_elasmyr_abyssal_flood extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const duration = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Slardar.Amplify_Damage");

        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_elasmyr_flood_thinker",
            { duration },
            caster.GetAbsOrigin(),
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_elasmyr_flood_thinker")
export class modifier_evo_elasmyr_flood_thinker extends BaseModifier {
    private radius = 600;
    private dps = 45;
    private tickCount = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.tickCount = 0;
        const ability = this.GetAbility();
        this.radius = ability ? ability.GetSpecialValueFor("radius") : 600;
        this.dps = ability ? ability.GetSpecialValueFor("dps") : 45;
        this.emitRipple();
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;

        this.tickCount += 1;
        if (this.tickCount % 2 === 0) {
            this.emitRipple();
        }

        const origin = parent.GetAbsOrigin();
        if (caster.IsAlive()) {
            const dist = ((caster.GetAbsOrigin() - origin) as Vector).Length2D();
            if (dist <= this.radius) {
                caster.AddNewModifier(caster, this.GetAbility(), "modifier_evo_elasmyr_flood_buff", {
                    duration: 1.5,
                });
            }
        }

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            this.radius,
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
                attacker: caster,
                ability: this.GetAbility(),
                damage: this.dps,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this.GetAbility(), "modifier_evo_elasmyr_flood_debuff", {
                duration: 1.5,
            });
        }
    }
    private emitRipple(): void {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
        ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, this.radius, this.radius));
        ParticleManager.ReleaseParticleIndex(pfx);
    }
}

@registerModifier("modifier_evo_elasmyr_flood_buff")
export class modifier_evo_elasmyr_flood_buff extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "slardar_amplify_damage";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 40;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return 55;
    }
    GetModifierPhysicalArmorBonus(): number {
        return 10;
    }
}

@registerModifier("modifier_evo_elasmyr_flood_debuff")
export class modifier_evo_elasmyr_flood_debuff extends BaseModifier {
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
        return "slardar_amplify_damage";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}
