import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";
import {
    findEnemiesInRadius,
    getNyxBranchMaxLevel,
    getNyxStr,
    getNyxTier,
    isNyxBurrowed,
    knockbackUnitFrom,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_scarab";

LinkLuaModifier("modifier_evo_nyx_scarab_q_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_q_dot", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_w", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_scarab_q")
export class evo_nyx_scarab_q extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetCooldown(level: number): number {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && caster.HasModifier("modifier_evo_nyx_scarab_r_aura")) {
            return 4.5;
        }
        return [11.0, 10.0, 9.0, 8.0, 7.0][Math.max(0, Math.min(4, level))] ?? 11.0;
    }
    GetAOERadius(): number {
        const caster = this.GetCaster();
        const base = this.GetSpecialValueFor("radius");
        if (!caster || caster.IsNull() || !isNyxBurrowed(caster)) return base;
        const w = caster.FindAbilityByName("evo_nyx_scarab_w");
        return base + (w && !w.IsNull() ? w.GetSpecialValueFor("q_radius_bonus") : 85);
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getNyxTier(caster);
        const burrowed = isNyxBurrowed(caster);
        const wAb = caster.FindAbilityByName("evo_nyx_scarab_w");
        const forwardBonus = burrowed ? (wAb && !wAb.IsNull() ? wAb.GetSpecialValueFor("q_range_bonus") : 225) : 0;
        const radiusBonus = burrowed ? (wAb && !wAb.IsNull() ? wAb.GetSpecialValueFor("q_radius_bonus") : 85) : 0;

        const dist = this.GetSpecialValueFor("forward_distance") + forwardBonus;
        const radius = this.GetSpecialValueFor("radius") + radiusBonus;
        const forward = caster.GetForwardVector().Normalized();
        const center = GetGroundPosition((caster.GetAbsOrigin() + forward * dist) as Vector, caster);

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const rawDmg = baseDmg + getNyxStr(caster) * strPct;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const stunDur = this.GetSpecialValueFor("stun_duration");

        caster.EmitSound("Hero_NyxAssassin.Impale");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_impale.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, caster.GetAbsOrigin());
        ParticleManager.SetParticleControl(pfx, 1, center);
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = findEnemiesInRadius(caster, center, radius);
        let heroHits = 0;
        for (const enemy of enemies) {
            if (enemy.IsRealHero()) {
                heroHits += 1;
            }
            const dmg = isEvoCreepUnit(enemy) ? rawDmg * creepMult : rawDmg;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this, "modifier_knockback", {
                center_x: enemy.GetAbsOrigin().x,
                center_y: enemy.GetAbsOrigin().y,
                center_z: enemy.GetAbsOrigin().z,
                duration: 0.5,
                knockback_duration: 0.5,
                knockback_distance: 0,
                knockback_height: 180,
                should_stun: 1,
            });
            enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            if (tier >= 3) {
                enemy.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_q_slow", { duration: 2.5 });
            }
            if (tier >= 4) {
                enemy.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_q_dot", { duration: 3.0 });
            }
        }

        if (tier >= 3 && heroHits > 0) {
            const rem = this.GetCooldownTimeRemaining();
            if (rem > 0) {
                this.EndCooldown();
                const nextCd = Math.max(0.25, rem - heroHits * 1.0);
                this.StartCooldown(nextCd);
            }
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_q_slow")
export class modifier_evo_nyx_scarab_q_slow extends BaseModifier {
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
        return "nyx_assassin_impale";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}

@registerModifier("modifier_evo_nyx_scarab_q_dot")
export class modifier_evo_nyx_scarab_q_dot extends BaseModifier {
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
        return "nyx_assassin_impale";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !caster || caster.IsNull()) return;
        const dmg = 35 + getNyxStr(caster) * 0.2;
        ApplyDamage({
            victim: parent,
            attacker: caster,
            ability,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerAbility("evo_nyx_scarab_w")
export class evo_nyx_scarab_w extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetCastPoint(): number {
        return this.GetToggleState() ? 0 : 0.8;
    }
    OnToggle(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (this.GetToggleState()) {
            caster.EmitSound("Hero_NyxAssassin.Burrow.In");
            caster.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_w", {});
        } else {
            caster.RemoveModifierByName("modifier_evo_nyx_scarab_w");
            caster.EmitSound("Hero_NyxAssassin.Burrow.Out");
            if (getNyxTier(caster) >= 3) {
                caster.Purge(false, true, false, false, false);
                for (const enemy of findEnemiesInRadius(caster, caster.GetAbsOrigin(), 225)) {
                    knockbackUnitFrom(caster, enemy, caster.GetAbsOrigin(), 150, 0.25, 45);
                }
            }
            this.UseResources(false, false, false, true);
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_w")
export class modifier_evo_nyx_scarab_w extends BaseModifier {
    private qCdAccum = 0;

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
        return "nyx_assassin_burrow";
    }
    OnCreated(): void {
        this.qCdAccum = 0;
        if (!IsServer()) return;
        this.StartIntervalThink(0.2);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ability || ability.IsNull()) return;

        const regenPct = ability.GetSpecialValueFor("regen_pct") / 100;
        parent.Heal(parent.GetMaxHealth() * regenPct * 0.2, ability);
        parent.GiveMana(parent.GetMaxMana() * regenPct * 0.2);

        if (getNyxTier(parent) >= 4) {
            const qAb = parent.FindAbilityByName("evo_nyx_scarab_q");
            if (qAb && !qAb.IsNull()) {
                const rem = qAb.GetCooldownTimeRemaining();
                if (rem > 0.06) {
                    qAb.EndCooldown();
                    qAb.StartCooldown(Math.max(0.01, rem - 0.05));
                }
            }
            GridNav.DestroyTreesAroundPoint(parent.GetAbsOrigin(), 100, false);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        const parent = this.GetParent();
        const t4 = parent && !parent.IsNull() && getNyxTier(parent) >= 4;
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: !t4,
            [dotaModifierState("MODIFIER_STATE_DISARMED")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: t4,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE"),
        ];
    }
    GetModifierStatusResistanceStacking(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const tier = getNyxTier(parent);
        if (tier < 3) return 0;
        return tier >= 4 ? 35 : 25;
    }
    GetModifierMoveSpeed_Absolute(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || getNyxTier(parent) < 4) return 0;
        return 175;
    }
}
