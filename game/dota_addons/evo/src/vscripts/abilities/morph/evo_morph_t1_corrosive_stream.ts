import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_t1_corrosive_stream";

if (IsServer()) {
    LinkLuaModifier("modifier_evo_morph_t1_corrosive_armor", SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_morph_t1_corrosive_stream")
export class evo_morph_t1_corrosive_stream extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        if (!target || target.IsNull() || !IsValidEntity(target)) return;

        caster.EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast");

        ProjectileManager.CreateTrackingProjectile({
            Target: target,
            Source: caster,
            Ability: this,
            EffectName: "particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf",
            iMoveSpeed: 1150,
            bDodgeable: true,
            bProvidesVision: false,
            iSourceAttachment: ProjectileAttachment.ATTACK_1,
        });
    }

    OnProjectileHit(target: CDOTA_BaseNPC | undefined, _location: Vector): boolean | void {
        if (!IsServer()) return true;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return true;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return true;

        if (target.TriggerSpellAbsorb(this)) return true;

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_damage_pct") / 100;
        const splashPct = this.GetSpecialValueFor("splash_pct") / 100;
        const splashCount = this.GetSpecialValueFor("splash_targets");
        const splashRadius = this.GetSpecialValueFor("splash_radius");
        const armorDuration = this.GetSpecialValueFor("armor_duration");

        let highestAttr = 0;
        if (caster.IsRealHero()) {
            const hero = caster as CDOTA_BaseNPC_Hero;
            highestAttr = Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
        }
        const primaryDamage = baseDmg + highestAttr * attrPct;

        target.EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target");
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: primaryDamage,
            damage_type: DamageTypes.MAGICAL,
        });
        target.AddNewModifier(caster, this, "modifier_evo_morph_t1_corrosive_armor", {
            duration: armorDuration,
        });

        const nearby = FindUnitsInRadius(
            caster.GetTeamNumber(),
            target.GetAbsOrigin(),
            undefined,
            splashRadius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.CLOSEST,
            false
        );

        let splashed = 0;
        const splashDamage = primaryDamage * splashPct;
        for (const enemy of nearby) {
            if (splashed >= splashCount) break;
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            if (enemy === target) continue;
            splashed += 1;

            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: splashDamage,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this, "modifier_evo_morph_t1_corrosive_armor", {
                duration: armorDuration,
            });
        }

        return true;
    }
}

@registerModifier("modifier_evo_morph_t1_corrosive_armor")
export class modifier_evo_morph_t1_corrosive_armor extends BaseModifier {
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
        return "morphling_adaptive_strike_agi";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        const ability = this.GetAbility();
        const shred = ability ? ability.GetSpecialValueFor("armor_reduction") : 2;
        return -shred;
    }
}
