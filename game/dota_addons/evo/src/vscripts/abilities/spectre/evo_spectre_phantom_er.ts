import {
    BaseAbility,
    BaseModifier,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    findNearestSpectrePortal,
    findSpectreEnemies,
    getSpectreAgi,
    getSpectreBranchMaxLevel,
    getSpectreTier,
    registerSpectrePortal,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_phantom_er";

LinkLuaModifier("modifier_evo_spectre_portal_unit", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_r_storm", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_r_free_d", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_phantom_e")
export class evo_spectre_phantom_e extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    OnUpgrade(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dAb = caster.FindAbilityByName("evo_spectre_phantom_d");
        if (!dAb || dAb.IsNull()) return;
        const lvl = this.GetLevel();
        const targetDLevel = lvl >= 4 ? 3 : lvl >= 2 ? 2 : 1;
        if (dAb.GetLevel() !== targetDLevel) {
            dAb.SetLevel(targetDLevel);
        }
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const maxPortals = this.GetSpecialValueFor("max_portals");
        const visionRadius = this.GetSpecialValueFor("vision_radius");

        caster.EmitSound("Hero_Spectre.HauntCast");
        const portal = CreateUnitByName(
            "npc_dota_companion",
            pos,
            true,
            caster,
            caster,
            caster.GetTeamNumber()
        );
        portal.SetDayTimeVisionRange(visionRadius);
        portal.SetNightTimeVisionRange(visionRadius);
        portal.SetModel("models/heroes/spectre/spectre.vmdl");
        portal.SetModelScale(0.75);
        portal.SetRenderColor(155, 65, 235);
        portal.AddNewModifier(caster, this, "modifier_evo_spectre_portal_unit", {});
        registerSpectrePortal(caster, portal, maxPortals);
    }
}

@registerModifier("modifier_evo_spectre_portal_unit")
export class modifier_evo_spectre_portal_unit extends BaseModifier {
    private auraRadius = 275;
    private isTier3Plus = false;
    private stormPulseAccum = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    IsAura(): boolean {
        return this.isTier3Plus;
    }
    GetModifierAura(): string {
        return "modifier_evo_spectre_portal_slow";
    }
    GetAuraRadius(): number {
        return this.auraRadius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnCreated(): void {
        this.auraRadius = 275;
        this.isTier3Plus = false;
        this.stormPulseAccum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.auraRadius = ab.GetSpecialValueFor("truesight_radius");
        }
        const caster = this.GetCaster();
        if (caster && !caster.IsNull()) {
            this.isTier3Plus = getSpectreTier(caster) >= 3;
        }
        if (!IsServer()) return;
        const parent = this.GetParent();
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_dispersion.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !caster || caster.IsNull()) return;
        const origin = parent.GetAbsOrigin();

        if (getSpectreTier(caster) >= 3) {
            AddFOWViewer(caster.GetTeamNumber(), origin, this.auraRadius, 0.2, false);
            for (const enemy of findSpectreEnemies(caster, origin, this.auraRadius)) {
                if (enemy && !enemy.IsNull() && enemy.IsAlive()) {
                    enemy.AddNewModifier(caster, this.GetAbility(), "modifier_truesight", { duration: 0.25 });
                }
            }
        }

        const storm = caster.FindModifierByName("modifier_evo_spectre_phantom_r_storm");
        if (storm && !storm.IsNull()) {
            const stormAb = storm.GetAbility();
            if (stormAb && !stormAb.IsNull()) {
                this.stormPulseAccum += 0.1;
                const interval = stormAb.GetSpecialValueFor("pulse_interval");
                if (this.stormPulseAccum >= interval) {
                    this.stormPulseAccum -= interval;
                    const pulseRadius = stormAb.GetSpecialValueFor("pulse_radius");
                    const dmg =
                        stormAb.GetSpecialValueFor("pulse_dmg") +
                        (getSpectreAgi(caster) * stormAb.GetSpecialValueFor("pulse_agi_pct")) / 100;
                    const slowDur = stormAb.GetSpecialValueFor("slow_duration");
                    const eAb = caster.FindAbilityByName("evo_spectre_phantom_e");
                    const shred = eAb && !eAb.IsNull() ? eAb.GetSpecialValueFor("armor_shred") : 4;
                    const shredDur = eAb && !eAb.IsNull() ? eAb.GetSpecialValueFor("shred_duration") : 4;

                    const pfx = ParticleManager.CreateParticle(
                        "particles/units/heroes/hero_spectre/spectre_shadowstep_fear.vpcf",
                        ParticleAttachment.WORLDORIGIN,
                        undefined
                    );
                    ParticleManager.SetParticleControl(pfx, 0, origin);
                    ParticleManager.ReleaseParticleIndex(pfx);

                    for (const enemy of findSpectreEnemies(caster, origin, pulseRadius)) {
                        if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
                        ApplyDamage({
                            victim: enemy,
                            attacker: caster,
                            ability: stormAb,
                            damage: dmg,
                            damage_type: DamageTypes.MAGICAL,
                        });
                        enemy.AddNewModifier(caster, stormAb, "modifier_evo_spectre_portal_slow", { duration: slowDur });
                        enemy.AddNewModifier(caster, stormAb, "modifier_evo_spectre_armor_shred", {
                            duration: shredDur,
                            shred,
                        });
                    }
                }
            }
        } else {
            this.stormPulseAccum = 0;
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVULNERABLE")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_HEALTH_BAR")]: true,
            [dotaModifierState("MODIFIER_STATE_UNSELECTABLE")]: true,
            [dotaModifierState("MODIFIER_STATE_NOT_ON_MINIMAP")]: false,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
            [dotaModifierState("MODIFIER_STATE_COMMAND_RESTRICTED")]: true,
            [dotaModifierState("MODIFIER_STATE_DISARMED")]: true,
        };
    }
}

@registerAbility("evo_spectre_phantom_d")
export class evo_spectre_phantom_d extends BaseAbility {
    GetCooldown(level: number): number {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && caster.HasModifier("modifier_evo_spectre_phantom_r_free_d")) {
            return 0;
        }
        return [45.0, 40.0, 35.0][Math.max(0, Math.min(2, level))] ?? 45.0;
    }
    CastFilterResultLocation(location: Vector): UnitFilterResult {
        if (!IsServer()) return UnitFilterResult.SUCCESS;
        const caster = this.GetCaster();
        const portal = findNearestSpectrePortal(caster, location);
        if (!portal) {
            return UnitFilterResult.FAIL_CUSTOM;
        }
        return UnitFilterResult.SUCCESS;
    }
    GetCustomCastErrorLocation(_location: Vector): string {
        return "#evo_spectre_no_portal_error";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const portal = findNearestSpectrePortal(caster, this.GetCursorPosition());
        if (!portal) {
            this.EndCooldown();
            return;
        }

        const dest = portal.GetAbsOrigin();
        ProjectileManager.ProjectileDodge(caster);
        caster.EmitSound("Hero_Spectre.Reality");
        FindClearSpaceForUnit(caster, dest, true);

        const msDur = this.GetSpecialValueFor("ms_duration");
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_reality_ms", { duration: msDur });

        if (getSpectreTier(caster) >= 4) {
            const radius = this.GetSpecialValueFor("shock_radius");
            const dmg =
                this.GetSpecialValueFor("shock_dmg") +
                (getSpectreAgi(caster) * this.GetSpecialValueFor("shock_agi_pct")) / 100;
            const shred = this.GetSpecialValueFor("armor_shred");
            const shredDur = this.GetSpecialValueFor("shred_duration");

            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_spectre/spectre_shadowstep_fear.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, dest);
            ParticleManager.ReleaseParticleIndex(pfx);

            for (const enemy of findSpectreEnemies(caster, dest, radius)) {
                if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: dmg,
                    damage_type: DamageTypes.MAGICAL,
                });
                enemy.AddNewModifier(caster, this, "modifier_evo_spectre_armor_shred", {
                    duration: shredDur,
                    shred,
                });
            }
        }
    }
}

@registerAbility("evo_spectre_phantom_r")
export class evo_spectre_phantom_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const freeDur = this.GetSpecialValueFor("free_d_duration");

        caster.EmitSound("Hero_Spectre.HauntCast");
        const dAb = caster.FindAbilityByName("evo_spectre_phantom_d");
        if (dAb && !dAb.IsNull()) {
            dAb.EndCooldown();
        }
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_phantom_r_storm", { duration: dur });
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_phantom_r_free_d", { duration: freeDur });
    }
}

@registerModifier("modifier_evo_spectre_phantom_r_storm")
export class modifier_evo_spectre_phantom_r_storm extends BaseModifier {
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
        return "spectre_haunt_single";
    }
}

@registerModifier("modifier_evo_spectre_phantom_r_free_d")
export class modifier_evo_spectre_phantom_r_free_d extends BaseModifier {
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
        return "spectre_reality";
    }
}
