import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    addBastionPassiveShield,
    applySpectreCreepDamage,
    findSpectreEnemies,
    getSpectreBranchMaxLevel,
    getSpectreStr,
    getSpectreTier,
    triggerBastionBreakMs,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_bastion";

LinkLuaModifier("modifier_evo_spectre_bastion_q_shield", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_bastion_q")
export class evo_spectre_bastion_q extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetBehavior(): AbilityBehavior | Uint64 {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && getSpectreTier(caster) >= 4) {
            return (
                AbilityBehavior.UNIT_TARGET +
                AbilityBehavior.IGNORE_BACKSWING +
                AbilityBehavior.IGNORE_PSEUDO_QUEUE +
                AbilityBehavior.UNRESTRICTED
            );
        }
        return AbilityBehavior.UNIT_TARGET + AbilityBehavior.IGNORE_BACKSWING;
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget() ?? caster;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;

        const tier = getSpectreTier(caster);
        const dur = this.GetSpecialValueFor("duration");
        const fullShield = Math.ceil(
            this.GetSpecialValueFor("base_shield") + (getSpectreStr(caster) * this.GetSpecialValueFor("str_pct")) / 100
        );

        caster.EmitSound("Hero_Abaddon.AphoticShield.Cast");
        if (tier >= 3) {
            target.Purge(false, true, false, true, true);
        }

        const mod = target.AddNewModifier(caster, this, "modifier_evo_spectre_bastion_q_shield", {
            duration: dur,
            capacity: fullShield,
        }) as modifier_evo_spectre_bastion_q_shield | undefined;
        if (mod) {
            mod.maxCapacity = fullShield;
            mod.SetStackCount(fullShield);
        }

        if (tier >= 4 && target !== caster && caster.IsAlive()) {
            const copyShield = Math.ceil((fullShield * this.GetSpecialValueFor("self_copy_pct")) / 100);
            const selfMod = caster.AddNewModifier(caster, this, "modifier_evo_spectre_bastion_q_shield", {
                duration: dur,
                capacity: copyShield,
            }) as modifier_evo_spectre_bastion_q_shield | undefined;
            if (selfMod) {
                selfMod.maxCapacity = copyShield;
                selfMod.SetStackCount(copyShield);
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_bastion_q_shield")
export class modifier_evo_spectre_bastion_q_shield extends BaseModifier {
    public maxCapacity = 160;
    public suppressedBlast = false;

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
        return "abaddon_aphotic_shield";
    }
    OnCreated(params: { capacity?: number }): void {
        this.maxCapacity = 160;
        this.suppressedBlast = false;
        const ab = this.GetAbility();
        if (params && params.capacity !== undefined) {
            this.maxCapacity = params.capacity;
        } else if (ab && !ab.IsNull()) {
            const caster = this.GetCaster() ?? this.GetParent();
            this.maxCapacity = Math.ceil(
                ab.GetSpecialValueFor("base_shield") + (getSpectreStr(caster) * ab.GetSpecialValueFor("str_pct")) / 100
            );
        }
        if (!IsServer()) return;
        this.SetStackCount(this.maxCapacity);
        const parent = this.GetParent();
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield.vpcf",
            ParticleAttachment.POINT_FOLLOW,
            parent
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(75, 75, 75));
        this.AddParticle(pfx, false, false, -1, false, false);
    }
    OnRefresh(params: { capacity?: number }): void {
        this.suppressedBlast = false;
        this.OnCreated(params);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        if (getSpectreTier(caster) >= 3 && parent.IsAlive()) {
            const heal = Math.ceil((this.maxCapacity * ab.GetSpecialValueFor("heal_pct")) / 100);
            if (heal > 0) {
                parent.Heal(heal, ab);
            }
        }
        if (parent === caster) {
            triggerBastionBreakMs(caster);
        }
        if (this.suppressedBlast) return;

        const radius = ab.GetSpecialValueFor("blast_radius");
        const slowDur = ab.GetSpecialValueFor("slow_duration");
        const origin = parent.GetAbsOrigin();

        parent.EmitSound("Hero_Abaddon.AphoticShield.Destroy");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findSpectreEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: this.maxCapacity,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, ab, "modifier_evo_spectre_bastion_slow", { duration: slowDur });
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")];
    }
    GetModifierTotal_ConstantBlock(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const pool = this.GetStackCount();
        if (pool <= 0 || event.damage <= 0) return 0;
        const blocked = Math.min(pool, Math.ceil(event.damage));
        const rem = pool - blocked;
        this.SetStackCount(Math.max(0, rem));
        if (rem <= 0) {
            this.Destroy();
        }
        return blocked;
    }
}

@registerAbility("evo_spectre_bastion_w")
export class evo_spectre_bastion_w extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getSpectreTier(caster);
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage") + (getSpectreStr(caster) * this.GetSpecialValueFor("str_pct")) / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const stunDur = this.GetSpecialValueFor("stun_duration");

        let detonated = 0;
        const qMod = caster.FindModifierByName("modifier_evo_spectre_bastion_q_shield") as
            | modifier_evo_spectre_bastion_q_shield
            | undefined;
        if (qMod && !qMod.IsNull()) {
            detonated += Math.max(0, qMod.GetStackCount());
            qMod.suppressedBlast = true;
            qMod.Destroy();
        }
        const eMod = caster.FindModifierByName("modifier_evo_spectre_bastion_e_passive");
        if (eMod && !eMod.IsNull() && eMod.GetStackCount() > 0) {
            detonated += eMod.GetStackCount();
            eMod.SetStackCount(0);
        }

        const totalHeroDmg = baseDmg + detonated;
        const origin = caster.GetAbsOrigin();
        caster.EmitSound("Hero_Abaddon.AphoticShield.Destroy");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.ReleaseParticleIndex(pfx);

        let heroHitCount = 0;
        const pullDist = this.GetSpecialValueFor("pull_distance");
        for (const enemy of findSpectreEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            if (enemy.IsRealHero()) heroHitCount += 1;
            applySpectreCreepDamage(caster, enemy, this, totalHeroDmg, DamageTypes.MAGICAL, creepMult);
            enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            if (tier >= 4) {
                const delta = (origin - enemy.GetAbsOrigin()) as Vector;
                const dist = delta.Length2D();
                if (dist > 60) {
                    const step = Math.min(pullDist, dist - 50);
                    const nextPos = GetGroundPosition((enemy.GetAbsOrigin() + delta.Normalized() * step) as Vector, enemy);
                    FindClearSpaceForUnit(enemy, nextPos, false);
                }
            }
        }

        if (detonated > 0) {
            const refund = (detonated * this.GetSpecialValueFor("refund_pct")) / 100;
            addBastionPassiveShield(caster, refund);
        } else if (tier >= 3) {
            caster.AddNewModifier(caster, this, "modifier_evo_spectre_bastion_e_surge", { duration: 2.5 });
        }

        if (tier >= 4 && heroHitCount > 0) {
            const qAb = caster.FindAbilityByName("evo_spectre_bastion_q");
            const reduce = this.GetSpecialValueFor("q_cd_reduce");
            if (qAb && !qAb.IsNull() && reduce > 0) {
                const rem = qAb.GetCooldownTimeRemaining();
                if (rem > 0) {
                    qAb.EndCooldown();
                    const next = rem - reduce;
                    if (next > 0.05) qAb.StartCooldown(next);
                }
            }
        }
    }
}
