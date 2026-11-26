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
    applyPsiResonance,
    findEnemiesInRadius,
    getNyxBranchMaxLevel,
    getNyxInt,
    getNyxTier,
    knockbackUnitFrom,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_archon";

LinkLuaModifier("modifier_evo_nyx_archon_w_silence", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_e", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_e_stack", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_q_field", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_q_silence", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_e_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_archon_w")
export class evo_nyx_archon_w extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!target || target.IsNull() || !IsValidEntity(target) || target.TriggerSpellAbsorb(this)) return;

        const tier = getNyxTier(caster);
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const enemyIntMult = this.GetSpecialValueFor("enemy_int_mult");
        const creepMult = this.GetSpecialValueFor("creep_mult");

        this.hitTarget(caster, target, baseDmg, intPct, enemyIntMult, creepMult, tier, 1.0);

        if (tier >= 4) {
            const nearby = findEnemiesInRadius(caster, target.GetAbsOrigin(), 450).filter((e) => e !== target);
            if (nearby.length > 0) {
                nearby.sort((a, b) => {
                    const aRes = a.HasModifier("modifier_evo_nyx_psi_resonance") ? 1 : 0;
                    const bRes = b.HasModifier("modifier_evo_nyx_psi_resonance") ? 1 : 0;
                    return bRes - aRes;
                });
                const bounceTarget = nearby[0];
                this.hitTarget(caster, bounceTarget, baseDmg, intPct, enemyIntMult, creepMult, tier, 0.75, target);
            }
        }
    }
    private hitTarget(
        caster: CDOTA_BaseNPC,
        target: CDOTA_BaseNPC,
        baseDmg: number,
        intPct: number,
        enemyIntMult: number,
        creepMult: number,
        tier: number,
        scale: number,
        fromUnit?: CDOTA_BaseNPC
    ): void {
        const targetInt = target.IsRealHero() ? (target as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        let dmg = (baseDmg + getNyxInt(caster) * intPct + targetInt * enemyIntMult) * scale;
        if (isEvoCreepUnit(target)) {
            dmg *= creepMult;
        }

        caster.EmitSound("Hero_NyxAssassin.ManaBurn.Cast");
        target.EmitSound("Hero_NyxAssassin.ManaBurn.Target");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        if (fromUnit) {
            ParticleManager.SetParticleControlEnt(pfx, 1, fromUnit, ParticleAttachment.POINT_FOLLOW, "attach_hitloc", fromUnit.GetAbsOrigin(), true);
        }
        ParticleManager.ReleaseParticleIndex(pfx);

        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });

        if (tier >= 3) {
            const silDur = tier >= 4 ? 1.6 : 1.2;
            target.AddNewModifier(caster, this, "modifier_evo_nyx_archon_w_silence", {
                duration: 3.0,
                silenceDur: silDur,
            });
        }
    }
}

@registerModifier("modifier_evo_nyx_archon_w_silence")
export class modifier_evo_nyx_archon_w_silence extends BaseModifier {
    private silenceUntil = -999;

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
        return "nyx_assassin_jolt";
    }
    OnCreated(params: { silenceDur?: number }): void {
        this.silenceUntil = GameRules.GetDOTATime(false, false) + (params.silenceDur ?? 1.2);
    }
    OnRefresh(params: { silenceDur?: number }): void {
        this.silenceUntil = GameRules.GetDOTATime(false, false) + (params.silenceDur ?? 1.2);
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        const silenced = GameRules.GetDOTATime(false, false) <= this.silenceUntil;
        return {
            [dotaModifierState("MODIFIER_STATE_SILENCED")]: silenced,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_CASTTIME_PERCENTAGE")];
    }
    GetModifierPercentageCasttime(): number {
        return -35;
    }
}

@registerAbility("evo_nyx_archon_e")
export class evo_nyx_archon_e extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_archon_e";
    }
}

@registerModifier("modifier_evo_nyx_archon_e")
export class modifier_evo_nyx_archon_e extends BaseModifier {
    private lastGainCastTime = -999;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    OnCreated(): void {
        this.lastGainCastTime = -999;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || parent.PassivesDisabled()) return;

        const unit = event.unit;
        const castAb = event.ability;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !castAb || castAb.IsNull()) return;
        if (castAb.IsItem() || castAb.IsToggle()) return;
        const abName = castAb.GetAbilityName();
        const tier = getNyxTier(parent);

        if (unit === parent) {
            if (abName === "lion_impale" && tier >= 4) {
                const start = parent.GetAbsOrigin();
                const pos = castAb.GetCursorPosition();
                const dir = ((pos - start) as Vector).Normalized();
                const end = (start + dir * 1000) as Vector;
                CreateModifierThinker(
                    parent,
                    ability,
                    "modifier_evo_nyx_archon_q_field",
                    { duration: 2.5, startX: start.x, startY: start.y, endX: end.x, endY: end.y },
                    ((start + end) * 0.5) as Vector,
                    parent.GetTeamNumber(),
                    false
                );
            }
            if (tier >= 3 && (abName === "lion_impale" || abName === "evo_nyx_archon_w")) {
                const stackMod = parent.FindModifierByName("modifier_evo_nyx_archon_e_stack");
                const maxStacks = ability.GetSpecialValueFor("max_stacks");
                if (stackMod && stackMod.GetStackCount() >= maxStacks) {
                    const pulseDmg = 65 + getNyxInt(parent) * 0.4;
                    const origin = parent.GetAbsOrigin();
                    const pfx = ParticleManager.CreateParticle(
                        "particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_sanity_eclipse_area.vpcf",
                        ParticleAttachment.WORLDORIGIN,
                        undefined
                    );
                    ParticleManager.SetParticleControl(pfx, 0, origin);
                    ParticleManager.SetParticleControl(pfx, 1, Vector(375, 1, 1));
                    ParticleManager.ReleaseParticleIndex(pfx);

                    for (const enemy of findEnemiesInRadius(parent, origin, 375)) {
                        ApplyDamage({
                            victim: enemy,
                            attacker: parent,
                            ability,
                            damage: pulseDmg,
                            damage_type: DamageTypes.MAGICAL,
                        });
                        enemy.AddNewModifier(parent, ability, "modifier_evo_nyx_archon_e_slow", { duration: 2.0 });
                        knockbackUnitFrom(parent, enemy, origin, 125, 0.25, 40);
                    }
                }
            }
            return;
        }

        if (unit.GetTeamNumber() !== parent.GetTeamNumber() && unit.IsRealHero()) {
            const dist = ((unit.GetAbsOrigin() - parent.GetAbsOrigin()) as Vector).Length2D();
            const auraRadius = ability.GetSpecialValueFor("aura_radius");
            const manaCost = castAb.GetManaCost(Math.max(0, castAb.GetLevel() - 1));
            if (dist <= auraRadius && manaCost > 0) {
                this.grantConcentration(parent, ability);
            }
        }
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || parent.PassivesDisabled()) return;
        if (event.attacker !== parent) return;
        const victim = event.unit;
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || victim.GetTeamNumber() === parent.GetTeamNumber()) {
            return;
        }
        const inflictor = event.inflictor;
        if (!inflictor || inflictor.IsNull() || inflictor.IsItem()) return;

        const tier = getNyxTier(parent);
        if (inflictor.GetAbilityName() === "lion_impale" && tier >= 3) {
            applyPsiResonance(parent, victim, inflictor, Math.max(1, tier - 1));
        }

        if (event.damage_type === DamageTypes.MAGICAL && event.damage > 0) {
            const now = GameRules.GetDOTATime(false, false);
            if (now - this.lastGainCastTime >= 0.15) {
                this.lastGainCastTime = now;
                this.grantConcentration(parent, ability);
            }
        }

        if (tier >= 4 && bit.band(event.damage_flags, DamageFlag.REFLECTION) === 0 && event.damage > 0) {
            if (victim.GetMaxMana() <= 0 || victim.GetManaPercent() < 40) {
                ApplyDamage({
                    victim,
                    attacker: parent,
                    ability: inflictor,
                    damage: event.damage * 0.18,
                    damage_type: DamageTypes.PURE,
                    damage_flags: DamageFlag.NO_SPELL_AMPLIFICATION + DamageFlag.REFLECTION,
                });
            }
        }
    }
    private grantConcentration(parent: CDOTA_BaseNPC, ability: CDOTABaseAbility): void {
        const maxStacks = ability.GetSpecialValueFor("max_stacks");
        const dur = ability.GetSpecialValueFor("stack_duration");
        const ex = parent.FindModifierByName("modifier_evo_nyx_archon_e_stack");
        const next = Math.min(maxStacks, (ex ? ex.GetStackCount() : 0) + 1);
        const mod = parent.AddNewModifier(parent, ability, "modifier_evo_nyx_archon_e_stack", { duration: dur });
        if (mod !== undefined) {
            mod.SetStackCount(next);
        }
    }
}

@registerModifier("modifier_evo_nyx_archon_e_stack")
export class modifier_evo_nyx_archon_e_stack extends BaseModifier {
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
        return "obsidian_destroyer_equilibrium";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
        ];
    }
    GetModifierSpellAmplification_Percentage(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        return this.GetStackCount() * ability.GetSpecialValueFor("amp_per_stack");
    }
    GetModifierConstantManaRegen(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        return this.GetStackCount() * ability.GetSpecialValueFor("mp_regen_per_stack");
    }
}

@registerModifier("modifier_evo_nyx_archon_q_field")
export class modifier_evo_nyx_archon_q_field extends BaseModifier {
    private startPos?: Vector;
    private endPos?: Vector;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(params: { startX?: number; startY?: number; endX?: number; endY?: number }): void {
        this.startPos = undefined;
        this.endPos = undefined;
        if (!IsServer()) return;
        this.startPos = Vector(params.startX ?? 0, params.startY ?? 0, 0);
        this.endPos = Vector(params.endX ?? 0, params.endY ?? 0, 0);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        UTIL_Remove(this.GetParent());
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED")];
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const ability = this.GetAbility();
        if (!caster || caster.IsNull() || !ability || ability.IsNull()) return;
        if (!this.startPos || !this.endPos) return;
        const unit = event.unit;
        const castAb = event.ability;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !castAb || castAb.IsNull() || castAb.IsItem()) return;
        if (unit.GetTeamNumber() === caster.GetTeamNumber()) return;
        const pos = unit.GetAbsOrigin();
        const dist = CalcDistanceToLineSegment2D(pos, this.startPos, this.endPos);
        if (dist <= 165) {
            unit.AddNewModifier(caster, ability, "modifier_evo_nyx_archon_q_silence", { duration: 1.5 });
        }
    }
}

@registerModifier("modifier_evo_nyx_archon_q_silence")
export class modifier_evo_nyx_archon_q_silence extends BaseModifier {
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
        return "lion_impale";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_SILENCED")]: true,
        };
    }
}

@registerModifier("modifier_evo_nyx_archon_e_slow")
export class modifier_evo_nyx_archon_e_slow extends BaseModifier {
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
        return "obsidian_destroyer_equilibrium";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}
