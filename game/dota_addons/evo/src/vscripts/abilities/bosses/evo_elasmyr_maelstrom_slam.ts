import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bosses/evo_elasmyr_maelstrom_slam";

if (IsServer()) {
    LinkLuaModifier("modifier_evo_elasmyr_maelstrom_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_elasmyr_maelstrom_slam")
export class evo_elasmyr_maelstrom_slam extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const radius = this.GetSpecialValueFor("radius");
        const damage = this.GetSpecialValueFor("damage");
        const slowDuration = this.GetSpecialValueFor("slow_duration");

        caster.EmitSound("Hero_Slardar.Slithereen_Crush");

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, radius, radius));
        ParticleManager.ReleaseParticleIndex(pfx);

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
            const pos = enemy.GetAbsOrigin();
            const toCaster = Vector(origin.x - pos.x, origin.y - pos.y, 0);
            const dist = toCaster.Length2D();
            if (dist > 130) {
                const pullDist = Math.min(dist - 115, 190);
                const dir = toCaster.Normalized();
                const pulled = Vector(pos.x + dir.x * pullDist, pos.y + dir.y * pullDist, pos.z);
                FindClearSpaceForUnit(enemy, pulled, true);
            }
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this, "modifier_evo_elasmyr_maelstrom_slow", {
                duration: slowDuration,
            });
        }
    }
}

@registerModifier("modifier_evo_elasmyr_maelstrom_slow")
export class modifier_evo_elasmyr_maelstrom_slow extends BaseModifier {
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
        return "slardar_slithereen_crush";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -40;
    }
}
