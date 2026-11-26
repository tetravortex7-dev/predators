import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoCreepDamage,
    applyVenoSporeInfection,
    findVenoEnemies,
    getVenoActiveTurrets,
    getVenoBranchMaxLevel,
    getVenoInt,
    getVenoTier,
    spawnVenoBioTurret,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_hive_er";

LinkLuaModifier("modifier_evo_veno_hive_e_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_hive_obelisk", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_hive_obelisk_link", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_hive_e")
export class evo_veno_hive_e extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_veno_hive_e_passive";
    }
    GetAOERadius(): number {
        return this.GetSpecialValueFor("volley_radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getVenoTier(caster);
        const cursorTarget = this.GetCursorTarget();

        if (
            tier >= 3 &&
            cursorTarget &&
            !cursorTarget.IsNull() &&
            cursorTarget.GetTeamNumber() === caster.GetTeamNumber() &&
            cursorTarget.HasModifier("modifier_evo_veno_hive_turret")
        ) {
            const blastRadius = this.GetSpecialValueFor("blast_radius");
            const blastDmg =
                this.GetSpecialValueFor("blast_dmg") + (getVenoInt(caster) * this.GetSpecialValueFor("blast_int_pct")) / 100;
            const stunDur = tier >= 4 ? 1.4 : 1.1;
            const origin = cursorTarget.GetAbsOrigin();

            cursorTarget.EmitSound("Hero_Venomancer.PoisonNova");
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, origin);
            ParticleManager.SetParticleControl(pfx, 1, Vector(blastRadius, 1, blastRadius));
            ParticleManager.ReleaseParticleIndex(pfx);

            for (const enemy of findVenoEnemies(caster, origin, blastRadius)) {
                if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: blastDmg,
                    damage_type: DamageTypes.MAGICAL,
                });
                enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            }
            cursorTarget.ForceKill(false);
            return;
        }

        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const volleyRadius = this.GetSpecialValueFor("volley_radius");
        const volleyMult = this.GetSpecialValueFor("volley_dmg_pct") / 100;
        const asDur = this.GetSpecialValueFor("volley_as_dur");
        const wAb = caster.FindAbilityByName("evo_veno_hive_w");
        const perTurretBase =
            wAb && !wAb.IsNull() && wAb.GetLevel() > 0
                ? wAb.GetSpecialValueFor("base_damage") + (getVenoInt(caster) * wAb.GetSpecialValueFor("int_pct")) / 100
                : 28 + getVenoInt(caster) * 0.25;
        const creepMult = wAb && !wAb.IsNull() ? wAb.GetSpecialValueFor("creep_mult") : 1.3;

        const turrets = getVenoActiveTurrets(caster);
        caster.EmitSound("Hero_Venomancer.Plague_Ward");

        for (const turret of turrets) {
            turret.AddNewModifier(caster, this, "modifier_evo_veno_hive_turret_frenzy", { duration: asDur });
            const enemies = findVenoEnemies(caster, pos, volleyRadius);
            for (const enemy of enemies) {
                if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
                ProjectileManager.CreateTrackingProjectile({
                    Target: enemy,
                    Source: turret,
                    Ability: this,
                    EffectName: "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
                    iMoveSpeed: 1900,
                    bDodgeable: true,
                });
                applyVenoCreepDamage(caster, enemy, this, perTurretBase * volleyMult, DamageTypes.MAGICAL, creepMult);
                break;
            }
        }
    }
}

@registerModifier("modifier_evo_veno_hive_e_passive")
export class modifier_evo_veno_hive_e_passive extends BaseModifier {
    private nearTurret = false;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.nearTurret = false;
        if (!IsServer()) return;
        this.StartIntervalThink(0.25);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull()) return;
        if (getVenoTier(parent) < 4) {
            this.nearTurret = false;
            return;
        }
        const range = ab.GetSpecialValueFor("transfer_range");
        const origin = parent.GetAbsOrigin();
        this.nearTurret = getVenoActiveTurrets(parent).some(
            (u) => ((u.GetAbsOrigin() - origin) as Vector).Length2D() <= range
        );
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || !this.nearTurret || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("near_ms_pct");
    }
    GetModifierIncomingDamage_Percentage(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        if (getVenoTier(parent) < 4 || event.damage <= 0) return 0;

        const range = ab.GetSpecialValueFor("transfer_range");
        const origin = parent.GetAbsOrigin();
        let nearest: CDOTA_BaseNPC | undefined;
        let bestDist = range + 1;
        for (const turret of getVenoActiveTurrets(parent)) {
            const d = ((turret.GetAbsOrigin() - origin) as Vector).Length2D();
            if (d <= range && d < bestDist) {
                bestDist = d;
                nearest = turret;
            }
        }
        if (!nearest) return 0;
        const pct = ab.GetSpecialValueFor("transfer_pct");
        const redirect = (event.damage * pct) / 100;
        if (redirect > 0.5) {
            ApplyDamage({
                victim: nearest,
                attacker: event.attacker ?? parent,
                ability: ab,
                damage: redirect,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.HPLOSS,
            });
        }
        return -pct;
    }
}

@registerAbility("evo_veno_hive_r")
export class evo_veno_hive_r extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("pulse_radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const dur = this.GetSpecialValueFor("duration");
        const hp = Math.round(this.GetSpecialValueFor("base_hp") + (getVenoInt(caster) * this.GetSpecialValueFor("hp_int_pct")) / 100);

        caster.EmitSound("Hero_Venomancer.PoisonNova");
        const obelisk = CreateUnitByName("evo_veno_obelisk", pos, true, caster, caster, caster.GetTeamNumber());
        if (!obelisk || obelisk.IsNull()) return;
        obelisk.SetBaseMaxHealth(hp);
        obelisk.SetMaxHealth(hp);
        obelisk.SetHealth(hp);
        obelisk.AddNewModifier(caster, this, "modifier_kill", { duration: dur });
        obelisk.AddNewModifier(caster, this, "modifier_evo_veno_hive_obelisk", { duration: dur });

        const offsetPos = GetGroundPosition((pos + Vector(120, 0, 0)) as Vector, caster);
        spawnVenoBioTurret(caster, offsetPos, true);
    }
}

@registerModifier("modifier_evo_veno_hive_obelisk")
export class modifier_evo_veno_hive_obelisk extends BaseModifier {
    private pulseAccum = 0;
    private linkRadius = 700;

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
        return "pugna_nether_ward";
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_veno_hive_obelisk_link";
    }
    GetAuraRadius(): number {
        return this.linkRadius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }
    GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.ALL;
    }
    GetAuraEntityReject(entity: CDOTA_BaseNPC): boolean {
        return !entity.HasModifier("modifier_evo_veno_hive_turret");
    }
    OnCreated(): void {
        this.pulseAccum = 0;
        this.linkRadius = 700;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.linkRadius = ab.GetSpecialValueFor("link_radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const obelisk = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!obelisk || obelisk.IsNull() || !obelisk.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        this.pulseAccum += 0.1;
        const interval = ab.GetSpecialValueFor("pulse_interval");
        if (this.pulseAccum < interval) return;
        this.pulseAccum -= interval;

        const radius = ab.GetSpecialValueFor("pulse_radius");
        const dmg = ab.GetSpecialValueFor("pulse_dmg") + (getVenoInt(caster) * ab.GetSpecialValueFor("pulse_int_pct")) / 100;
        const origin = obelisk.GetAbsOrigin();

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, 1, radius));
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findVenoEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            applyVenoSporeInfection(caster, enemy, ab);
        }
    }
}

@registerModifier("modifier_evo_veno_hive_obelisk_link")
export class modifier_evo_veno_hive_obelisk_link extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
}
