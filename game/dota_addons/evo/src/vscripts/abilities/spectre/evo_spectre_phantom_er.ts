import {
    BaseAbility,
    BaseModifier,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    findNearestSpectrePortal,
    findPhantomDAbility,
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
        const dAb = findPhantomDAbility(caster);
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

        caster.EmitSound("Hero_Spectre.HauntCast");
        EmitSoundOnLocationWithCaster(pos, "Hero_VoidSpirit.Dissimilate.Portals", caster);
        const portal = CreateModifierThinker(
            caster,
            this,
            "modifier_evo_spectre_portal_unit",
            {},
            pos,
            caster.GetTeamNumber(),
            false
        );
        registerSpectrePortal(caster, portal, maxPortals);
    }
}

@registerModifier("modifier_evo_spectre_portal_unit")
export class modifier_evo_spectre_portal_unit extends BaseModifier {
    private auraRadius = 275;
    private visionRadius = 450;
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
        this.visionRadius = 450;
        this.isTier3Plus = false;
        this.stormPulseAccum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.auraRadius = ab.GetSpecialValueFor("truesight_radius");
            this.visionRadius = Math.max(250, ab.GetSpecialValueFor("vision_radius"));
        }
        const caster = this.GetCaster();
        if (caster && !caster.IsNull()) {
            this.isTier3Plus = getSpectreTier(caster) >= 3;
        }
        if (!IsServer()) return;
        const parent = this.GetParent();
        const origin = GetGroundPosition(parent.GetAbsOrigin(), parent);

        const portalPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_void_spirit/void_spirit_entryportal.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(portalPfx, 0, origin);
        ParticleManager.SetParticleControl(portalPfx, 3, origin);
        this.AddParticle(portalPfx, false, false, -1, false, false);

        const spirePfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_ambient_blade.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(spirePfx, 0, (origin + Vector(0, 0, 64)) as Vector);
        this.AddParticle(spirePfx, false, false, -1, false, false);

        if (caster && !caster.IsNull()) {
            AddFOWViewer(caster.GetTeamNumber(), origin, this.visionRadius, 0.3, false);
        }
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !caster || caster.IsNull()) return;
        const origin = parent.GetAbsOrigin();

        AddFOWViewer(caster.GetTeamNumber(), origin, this.visionRadius, 0.25, false);

        if (getSpectreTier(caster) >= 3) {
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
                    const shred = stormAb.GetSpecialValueFor("armor_shred") || 4;
                    const shredDur = stormAb.GetSpecialValueFor("shred_duration") || 4;

                    const pfx = ParticleManager.CreateParticle(
                        "particles/units/heroes/hero_spectre/spectre_shadowstep_fear.vpcf",
                        ParticleAttachment.WORLDORIGIN,
                        undefined
                    );
                    ParticleManager.SetParticleControl(pfx, 0, origin);
                    ParticleManager.SetParticleControl(pfx, 1, Vector(0, pulseRadius, 0));
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
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
}

const REALITY_COOLDOWNS: readonly number[] = [35.0, 30.0, 25.0];

@registerAbility("evo_spectre_phantom_d")
export class evo_spectre_phantom_d extends BaseAbility {
    GetCooldown(level: number): number {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull()) {
            if (
                caster.HasModifier("modifier_evo_spectre_phantom_r_free_d") ||
                caster.HasModifier("modifier_item_aghanims_shard")
            ) {
                return 0;
            }
        }
        return REALITY_COOLDOWNS[Math.max(0, Math.min(2, level))] ?? 35.0;
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
    private restoreSingleCharge(): void {
        const maxCharges = this.GetMaxAbilityCharges(this.GetLevel());
        if (maxCharges > 0) {
            this.SetCurrentAbilityCharges(Math.min(maxCharges, this.GetCurrentAbilityCharges() + 1));
        } else {
            this.EndCooldown();
        }
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const portal = findNearestSpectrePortal(caster, this.GetCursorPosition());
        if (!portal) {
            this.restoreSingleCharge();
            return;
        }
        if (caster.HasModifier("modifier_evo_spectre_phantom_r_free_d") && this.GetMaxAbilityCharges(this.GetLevel()) > 0) {
            this.restoreSingleCharge();
        }

        const origin = caster.GetAbsOrigin();
        const dest = GetGroundPosition(portal.GetAbsOrigin(), caster);
        const dir = (dest - origin) as Vector;
        dir.z = 0;
        const forward = dir.Length2D() > 1 ? dir.Normalized() : caster.GetForwardVector();

        const startPfx = ParticleManager.CreateParticle(
            "particles/items_fx/blink_dagger_start.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(startPfx, 0, origin);
        ParticleManager.SetParticleControlForward(startPfx, 0, forward);
        ParticleManager.ReleaseParticleIndex(startPfx);
        EmitSoundOnLocationWithCaster(origin, "Hero_VoidSpirit.AstralStep.Start", caster);
        EmitSoundOnLocationWithCaster(origin, "Hero_Spectre.Reality", caster);

        ProjectileManager.ProjectileDodge(caster);
        caster.Stop();
        FindClearSpaceForUnit(caster, dest, true);
        caster.SetForwardVector(forward);

        const dagger = caster.FindAbilityByName("spectre_spectral_dagger");
        if (dagger && !dagger.IsNull() && dagger.GetCooldownTimeRemaining() > 0) {
            dagger.EndCooldown();
        }

        const arrivedPos = caster.GetAbsOrigin();
        const endPfx = ParticleManager.CreateParticle(
            "particles/items_fx/blink_dagger_end.vpcf",
            ParticleAttachment.ABSORIGIN,
            caster
        );
        ParticleManager.SetParticleControl(endPfx, 0, arrivedPos);
        ParticleManager.SetParticleControlForward(endPfx, 0, forward);
        ParticleManager.ReleaseParticleIndex(endPfx);

        const burstPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(burstPfx, 0, arrivedPos);
        ParticleManager.ReleaseParticleIndex(burstPfx);

        caster.EmitSound("Hero_Spectre.Reality");
        caster.EmitSound("Hero_VoidSpirit.Dissimilate.TeleportIn");

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
            ParticleManager.SetParticleControl(pfx, 0, arrivedPos);
            ParticleManager.SetParticleControl(pfx, 1, Vector(0, radius, 0));
            ParticleManager.ReleaseParticleIndex(pfx);

            for (const enemy of findSpectreEnemies(caster, arrivedPos, radius)) {
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

@registerAbility("evo_spectre_phantom_e_t3")
export class evo_spectre_phantom_e_t3 extends evo_spectre_phantom_e {}

@registerAbility("evo_spectre_phantom_d_t4")
export class evo_spectre_phantom_d_t4 extends evo_spectre_phantom_d {}

@registerAbility("evo_spectre_phantom_r")
export class evo_spectre_phantom_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const freeDur = this.GetSpecialValueFor("free_d_duration");

        caster.EmitSound("Hero_Spectre.HauntCast");
        const dAb = findPhantomDAbility(caster);
        if (dAb && !dAb.IsNull()) {
            dAb.EndCooldown();
            if (dAb.GetMaxAbilityCharges(dAb.GetLevel()) > 0) {
                dAb.RefreshCharges();
            }
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
        return "evo_spectre_phantom_r";
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
        return "evo_spectre_phantom_d";
    }
}
