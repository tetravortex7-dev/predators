import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";
import { findEnemiesInRadius, getNyxAgi, getNyxBranchMaxLevel, getNyxTier } from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis_ult";

LinkLuaModifier("modifier_evo_nyx_mantis_e", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_e_wound", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_e_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_r", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_mantis_e")
export class evo_nyx_mantis_e extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_mantis_e";
    }
}

@registerModifier("modifier_evo_nyx_mantis_e")
export class modifier_evo_nyx_mantis_e extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.attacker !== parent || parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.GetTeamNumber() === parent.GetTeamNumber()) {
            return;
        }

        const woundDur = ability.GetSpecialValueFor("wound_duration");
        const ex = target.FindModifierByName("modifier_evo_nyx_mantis_e_wound");
        const nextStacks = (ex ? ex.GetStackCount() : 0) + 1;
        const woundMod = target.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_e_wound", {
            duration: woundDur,
        });
        if (woundMod !== undefined) {
            woundMod.SetStackCount(nextStacks);
        }

        const dmgPerStack = ability.GetSpecialValueFor("damage_per_stack");
        const mult = isEvoCreepUnit(target) || target.IsBuilding() ? 0.5 : 1.0;
        const physDmg = nextStacks * dmgPerStack * mult;
        ApplyDamage({
            victim: target,
            attacker: parent,
            ability,
            damage: physDmg,
            damage_type: DamageTypes.PHYSICAL,
            damage_flags: DamageFlag.NO_SPELL_AMPLIFICATION,
        });

        const tier = getNyxTier(parent);
        if (tier >= 3 && nextStacks >= 4) {
            const shredEx = target.FindModifierByName("modifier_evo_nyx_mantis_e_shred");
            const nextShred = Math.min(6, (shredEx ? shredEx.GetStackCount() : 0) + 1);
            const shredMod = target.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_e_shred", {
                duration: 4.0,
            });
            if (shredMod !== undefined) {
                shredMod.SetStackCount(nextShred);
            }
            if (!parent.HasModifier("modifier_evo_nyx_mantis_q_flurry")) {
                const qAb = parent.FindAbilityByName("evo_nyx_mantis_q");
                if (qAb && !qAb.IsNull()) {
                    const rem = qAb.GetCooldownTimeRemaining();
                    if (rem > 0) {
                        qAb.EndCooldown();
                        qAb.StartCooldown(Math.max(0.05, rem - 0.35));
                    }
                }
            }
        }

        if (tier >= 4 && nextStacks >= 6 && !target.IsBuilding()) {
            const pureDmg = 15 + getNyxAgi(parent) * 0.2;
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability,
                damage: pureDmg,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.NO_SPELL_AMPLIFICATION,
            });
            if (!target.IsInvulnerable()) {
                parent.Heal(pureDmg * 0.35, ability);
            }
        }
    }
}

@registerModifier("modifier_evo_nyx_mantis_e_wound")
export class modifier_evo_nyx_mantis_e_wound extends BaseModifier {
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
        return "bounty_hunter_jinada";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        const slowPer = ability.GetSpecialValueFor("slow_per_stack");
        const maxSlow = ability.GetSpecialValueFor("max_slow_stacks");
        return -Math.min(maxSlow, this.GetStackCount()) * slowPer;
    }
}

@registerModifier("modifier_evo_nyx_mantis_e_shred")
export class modifier_evo_nyx_mantis_e_shred extends BaseModifier {
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
        return "bounty_hunter_jinada";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -this.GetStackCount();
    }
}

@registerAbility("evo_nyx_mantis_r")
export class evo_nyx_mantis_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const duration = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_NyxAssassin.Vendetta");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_r", { duration });
    }
}

@registerModifier("modifier_evo_nyx_mantis_r")
export class modifier_evo_nyx_mantis_r extends BaseModifier {
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
        return "nyx_assassin_vendetta";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.pulseBlade();
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.pulseBlade();
    }
    private pulseBlade(): void {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ability || ability.IsNull()) return;
        const radius = ability.GetSpecialValueFor("radius");
        const dmg = ability.GetSpecialValueFor("wave_damage");
        const eAb = parent.FindAbilityByName("evo_nyx_mantis_e");
        const woundDur = eAb && !eAb.IsNull() ? eAb.GetSpecialValueFor("wound_duration") : 6.0;

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.SetParticleControl(pfx, 5, Vector(radius, 0, 0));
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findEnemiesInRadius(parent, parent.GetAbsOrigin(), radius, true)) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: dmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            if (eAb && !eAb.IsNull()) {
                const ex = enemy.FindModifierByName("modifier_evo_nyx_mantis_e_wound");
                const next = (ex ? ex.GetStackCount() : 0) + 1;
                const mod = enemy.AddNewModifier(parent, eAb, "modifier_evo_nyx_mantis_e_wound", {
                    duration: woundDur,
                });
                if (mod !== undefined) {
                    mod.SetStackCount(next);
                }
            }
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("bonus_ms_pct") : 35;
    }
    GetModifierStatusResistanceStacking(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("status_res_pct") : 30;
    }
}
