import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { applyPsiResonance, findEnemiesInRadius } from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_archon_er";

LinkLuaModifier("modifier_evo_nyx_archon_r_crystal", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_archon_r_tether", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_archon_r")
export class evo_nyx_archon_r extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const duration = this.GetSpecialValueFor("duration");

        caster.EmitSound("Hero_ObsidianDestroyer.SanityEclipse");
        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_nyx_archon_r_crystal",
            { duration },
            pos,
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_nyx_archon_r_crystal")
export class modifier_evo_nyx_archon_r_crystal extends BaseModifier {
    private radius = 475;
    private pulseAccum = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_nyx_archon_r_tether";
    }
    GetAuraRadius(): number {
        return this.radius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnCreated(): void {
        this.radius = 475;
        this.pulseAccum = 0;
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            this.radius = ability.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_pugna/pugna_nether_ward.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const crystal = this.GetParent();
        const caster = this.GetCaster();
        const ability = this.GetAbility();
        if (!crystal || crystal.IsNull() || !caster || caster.IsNull() || !ability || ability.IsNull()) return;
        const center = crystal.GetAbsOrigin();

        for (const enemy of findEnemiesInRadius(caster, center, this.radius + 140)) {
            if (!enemy.HasModifier("modifier_evo_nyx_archon_r_tether")) continue;
            const delta = (enemy.GetAbsOrigin() - center) as Vector;
            const dist = delta.Length2D();
            if (dist > this.radius - 15) {
                const clamped = GetGroundPosition((center + delta.Normalized() * (this.radius - 20)) as Vector, enemy);
                FindClearSpaceForUnit(enemy, clamped, false);
            }
        }

        this.pulseAccum += 0.1;
        const pulseInterval = ability.GetSpecialValueFor("pulse_interval");
        if (this.pulseAccum >= pulseInterval) {
            this.pulseAccum -= pulseInterval;
            let heroesHit = 0;
            for (const enemy of findEnemiesInRadius(caster, center, this.radius)) {
                applyPsiResonance(caster, enemy, ability, 3);
                if (enemy.IsRealHero()) {
                    heroesHit += 1;
                }
            }
            if (heroesHit > 0) {
                const eAb = caster.FindAbilityByName("evo_nyx_archon_e");
                if (eAb && !eAb.IsNull()) {
                    const maxStacks = eAb.GetSpecialValueFor("max_stacks");
                    const dur = eAb.GetSpecialValueFor("stack_duration");
                    const ex = caster.FindModifierByName("modifier_evo_nyx_archon_e_stack");
                    const next = Math.min(maxStacks, (ex ? ex.GetStackCount() : 0) + heroesHit);
                    const mod = caster.AddNewModifier(caster, eAb, "modifier_evo_nyx_archon_e_stack", { duration: dur });
                    if (mod !== undefined) {
                        mod.SetStackCount(next);
                    }
                }
            }
        }
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
        const crystal = this.GetParent();
        if (!caster || caster.IsNull() || !ability || ability.IsNull() || !crystal || crystal.IsNull()) return;
        const unit = event.unit;
        const castAb = event.ability;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !castAb || castAb.IsNull() || castAb.IsItem()) return;
        const manaCost = castAb.GetManaCost(Math.max(0, castAb.GetLevel() - 1));
        if (manaCost <= 0) return;

        const isNyx = unit === caster;
        const isTetheredEnemy =
            unit.GetTeamNumber() !== caster.GetTeamNumber() && unit.HasModifier("modifier_evo_nyx_archon_r_tether");
        if (!isNyx && !isTetheredEnemy) return;

        const dmg = manaCost * ability.GetSpecialValueFor("mana_dmg_ratio");
        const center = crystal.GetAbsOrigin();
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_pugna/pugna_ward_attack.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, center);
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findEnemiesInRadius(caster, center, this.radius)) {
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_nyx_archon_r_tether")
export class modifier_evo_nyx_archon_r_tether extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "tinker_laser";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_TETHERED")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? -ability.GetSpecialValueFor("slow_pct") : -30;
    }
}
