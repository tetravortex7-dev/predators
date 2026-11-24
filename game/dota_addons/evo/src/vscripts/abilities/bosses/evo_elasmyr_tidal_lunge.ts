import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bosses/evo_elasmyr_tidal_lunge";

LinkLuaModifier("modifier_evo_elasmyr_puddle_thinker", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_elasmyr_puddle_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_elasmyr_tidal_lunge")
export class evo_elasmyr_tidal_lunge extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const maxDist = this.GetSpecialValueFor("lunge_distance");
        const width = this.GetSpecialValueFor("width");
        const damage = this.GetSpecialValueFor("damage");
        const puddleDuration = this.GetSpecialValueFor("puddle_duration");

        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const rawDist = delta.Length2D();
        const dir = rawDist > 1 ? delta.Normalized() : caster.GetForwardVector();
        const travel = Math.min(maxDist, Math.max(150, rawDist));
        const dest = Vector(origin.x + dir.x * travel, origin.y + dir.y * travel, origin.z);

        const enemies = FindUnitsInLine(
            caster.GetTeamNumber(),
            origin,
            dest,
            undefined,
            width,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE
        );

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage,
                damage_type: DamageTypes.MAGICAL,
            });
        }

        caster.SetForwardVector(dir);
        FindClearSpaceForUnit(caster, dest, true);
        caster.EmitSound("Hero_Slardar.Slithereen_Crush");

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, caster.GetAbsOrigin());
        ParticleManager.SetParticleControl(pfx, 1, Vector(width, width, width));
        ParticleManager.ReleaseParticleIndex(pfx);

        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_elasmyr_puddle_thinker",
            { duration: puddleDuration },
            caster.GetAbsOrigin(),
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_elasmyr_puddle_thinker")
export class modifier_evo_elasmyr_puddle_thinker extends BaseModifier {
    private radius = 320;
    private pfx?: ParticleID;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const ability = this.GetAbility();
        this.radius = ability ? ability.GetSpecialValueFor("puddle_radius") : 320;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            this.pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(this.pfx, 0, parent.GetAbsOrigin());
            ParticleManager.SetParticleControl(this.pfx, 1, Vector(this.radius, this.radius, this.radius));
        }
        this.StartIntervalThink(0.25);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        if (!caster || caster.IsNull() || !IsValidEntity(caster) || !caster.IsAlive()) return;
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;
        const dist = ((caster.GetAbsOrigin() - parent.GetAbsOrigin()) as Vector).Length2D();
        if (dist <= this.radius) {
            caster.AddNewModifier(caster, this.GetAbility(), "modifier_evo_elasmyr_puddle_buff", { duration: 0.6 });
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        if (this.pfx !== undefined) {
            ParticleManager.DestroyParticle(this.pfx, false);
            ParticleManager.ReleaseParticleIndex(this.pfx);
            this.pfx = undefined;
        }
    }
}

@registerModifier("modifier_evo_elasmyr_puddle_buff")
export class modifier_evo_elasmyr_puddle_buff extends BaseModifier {
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
        return "slardar_sprint";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 30;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return 35;
    }
    GetModifierPhysicalArmorBonus(): number {
        return 6;
    }
}
