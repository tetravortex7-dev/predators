import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoChitinShard,
    applyVenoCreepDamage,
    findVenoEnemies,
    getVenoAgi,
    getVenoBranchMaxLevel,
    getVenoTier,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_needle";

LinkLuaModifier("modifier_evo_veno_needle_q_trail", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_q_trail_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_w", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_needle_q")
export class evo_veno_needle_q extends BaseAbility {
    private hitCounts: Record<number, number> = {};
    private hitByProj: Record<number, Set<EntityIndex>> = {};
    private castOriginByProj: Record<number, number> = {};
    private castSerial = 0;

    GetMaxLevel(): number {
        return getSpectreSafeCastCount(this);
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const origin = caster.GetAbsOrigin();
        let dir = (this.GetCursorPosition() - origin) as Vector;
        dir.z = 0;
        if (dir.Length2D() < 1) {
            dir = caster.GetForwardVector();
        }
        dir = dir.Normalized();

        const tier = getVenoTier(caster);
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const speed = this.GetSpecialValueFor("speed");
        const count = this.GetSpecialValueFor("needle_count");
        const coneDeg = 65;

        this.castSerial += 1;
        const serial = this.castSerial;

        caster.EmitSound("Hero_Venomancer.VenomousGale");

        for (let i = 0; i < count; i++) {
            const frac = count > 1 ? i / (count - 1) - 0.5 : 0;
            const angleRad = (frac * coneDeg * Math.PI) / 180;
            const cos = Math.cos(angleRad);
            const sin = Math.sin(angleRad);
            const rotDir = Vector(dir.x * cos - dir.y * sin, dir.x * sin + dir.y * cos, 0).Normalized();

            const projId = ProjectileManager.CreateLinearProjectile({
                Ability: this,
                EffectName: "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf",
                vSpawnOrigin: origin,
                fDistance: range,
                fStartRadius: width,
                fEndRadius: width,
                Source: caster,
                bHasFrontalCone: false,
                iUnitTargetTeam: UnitTargetTeam.ENEMY,
                iUnitTargetFlags: UnitTargetFlags.NONE,
                iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                vVelocity: (rotDir * speed) as Vector,
                bProvidesVision: i === Math.floor(count / 2),
                iVisionRadius: 180,
                iVisionTeamNumber: caster.GetTeamNumber(),
            });
            this.hitByProj[projId] = new Set<EntityIndex>();
            this.castOriginByProj[projId] = serial;
        }

        if (tier >= 4) {
            const dashDist = this.GetSpecialValueFor("dash_back");
            const trailDur = this.GetSpecialValueFor("trail_duration");
            const backPos = GetGroundPosition((origin - dir * dashDist) as Vector, caster);
            FindClearSpaceForUnit(caster, backPos, true);
            CreateModifierThinker(
                caster,
                this,
                "modifier_evo_veno_needle_q_trail",
                { duration: trailDur },
                GetGroundPosition((origin + dir * 180) as Vector, caster),
                caster.GetTeamNumber(),
                false
            );
        }
    }

    OnProjectileHitHandle(
        target: CDOTA_BaseNPC | undefined,
        _location: Vector,
        projectileHandle: ProjectileID
    ): boolean {
        if (!IsServer()) return false;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            delete this.hitByProj[projectileHandle];
            delete this.castOriginByProj[projectileHandle];
            return false;
        }

        const projSet = this.hitByProj[projectileHandle];
        const eIdx = target.GetEntityIndex();
        if (projSet !== undefined && projSet.has(eIdx)) return false;
        if (projSet !== undefined) projSet.add(eIdx);

        const serial = this.castOriginByProj[projectileHandle] ?? 0;
        const compositeKey = serial * 100000 + eIdx;
        const hitsSoFar = this.hitCounts[compositeKey] ?? 0;
        if (hitsSoFar >= 2) return false;
        this.hitCounts[compositeKey] = hitsSoFar + 1;

        const caster = this.GetCaster();
        const tier = getVenoTier(caster);
        const fullDmg =
            this.GetSpecialValueFor("base_damage") + (getVenoAgi(caster) * this.GetSpecialValueFor("agi_pct")) / 100;
        const dmg = hitsSoFar === 1 ? fullDmg * 0.5 : fullDmg;
        const creepMult = this.GetSpecialValueFor("creep_mult");

        applyVenoCreepDamage(caster, target, this, dmg, DamageTypes.PHYSICAL, creepMult);
        applyVenoChitinShard(caster, target, this);
        target.AddNewModifier(caster, this, "modifier_evo_veno_needle_q_slow", {
            duration: this.GetSpecialValueFor("slow_duration"),
        });

        if (tier >= 3 && hitsSoFar === 0) {
            caster.PerformAttack(target, true, true, true, true, false, false, true);
            target.AddNewModifier(caster, this, "modifier_evo_veno_needle_heal_cut", {
                duration: this.GetSpecialValueFor("heal_cut_dur"),
            });
        }
        return false;
    }
}

function getSpectreSafeCastCount(ab: evo_veno_needle_q): number {
    return getVenoBranchMaxLevel(ab.GetCaster());
}

@registerModifier("modifier_evo_veno_needle_q_trail")
export class modifier_evo_veno_needle_q_trail extends BaseModifier {
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
        return "modifier_evo_veno_needle_q_trail_slow";
    }
    GetAuraRadius(): number {
        return 260;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_viper/viper_nethertoxin.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(260, 1, 1));
        this.AddParticle(pfx, false, false, -1, false, false);
    }
}

@registerModifier("modifier_evo_veno_needle_q_trail_slow")
export class modifier_evo_veno_needle_q_trail_slow extends BaseModifier {
    private slowPct = 30;
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
        return "venomancer_venomous_gale";
    }
    OnCreated(): void {
        this.slowPct = 30;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("trail_slow_pct");
            if (v > 0) this.slowPct = v;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerAbility("evo_veno_needle_w")
export class evo_veno_needle_w extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const charges = this.GetSpecialValueFor("charges");
        caster.EmitSound("Hero_Viper.PoisonAttack.Cast");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_veno_needle_w", {
            duration: dur,
            charges,
        });
        if (mod !== undefined) {
            mod.SetStackCount(charges);
        }
    }
}

@registerModifier("modifier_evo_veno_needle_w")
export class modifier_evo_veno_needle_w extends BaseModifier {
    private bonusAs = 40;
    private bonusRange = 75;
    private bonusDmg = 30;

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
        return "viper_poison_attack";
    }
    OnCreated(params: { charges?: number }): void {
        this.bonusAs = 40;
        this.bonusRange = 75;
        this.bonusDmg = 30;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (ab && !ab.IsNull() && parent && !parent.IsNull()) {
            this.bonusAs = ab.GetSpecialValueFor("bonus_as");
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
            this.bonusDmg = ab.GetSpecialValueFor("bonus_dmg") + (getVenoAgi(parent) * ab.GetSpecialValueFor("agi_pct")) / 100;
        }
        if (IsServer() && params && params.charges !== undefined) {
            this.SetStackCount(params.charges);
        }
    }
    OnRefresh(params: { charges?: number }): void {
        this.OnCreated(params);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.bonusAs;
    }
    GetModifierAttackRangeBonus(): number {
        return this.bonusRange;
    }
    GetModifierProcAttack_BonusDamage_Physical(): number {
        return this.bonusDmg;
    }
    private refundCooldown(): void {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull()) return;
        const rem = ab.GetCooldownTimeRemaining();
        if (rem > 0) {
            const pct = ab.GetSpecialValueFor("cd_refund_pct") / 100;
            ab.EndCooldown();
            const next = rem * (1 - pct);
            if (next > 0.05) ab.StartCooldown(next);
        }
        const mana = ab.GetSpecialValueFor("mana_refund");
        if (mana > 0) parent.GiveMana(mana);
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent || getVenoTier(parent) < 4) return;
        this.refundCooldown();
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || event.attacker !== parent) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        const tier = getVenoTier(parent);
        if (tier >= 3) {
            const armor = target.GetPhysicalArmorValue(false);
            if (armor > 0) {
                const factor = (0.052 * armor) / (0.9 + 0.048 * Math.abs(armor));
                const ignoreFrac = tier >= 4 ? 0.35 : 0.25;
                const pierceBonus = (event.damage + this.bonusDmg) * factor * ignoreFrac;
                if (pierceBonus > 1) {
                    ApplyDamage({
                        victim: target,
                        attacker: parent,
                        ability: ab,
                        damage: pierceBonus,
                        damage_type: DamageTypes.PURE,
                    });
                }
            }
        }

        const wasLast = this.GetStackCount() <= 1;
        if (wasLast) {
            const shardMod = target.FindModifierByName("modifier_evo_veno_chitin_shard");
            const shards = shardMod ? shardMod.GetStackCount() : 0;
            if (shards > 0) {
                const perShard = ab.GetSpecialValueFor("detonate_per_shard");
                ApplyDamage({
                    victim: target,
                    attacker: parent,
                    ability: ab,
                    damage: shards * perShard,
                    damage_type: DamageTypes.PHYSICAL,
                });
                if (shardMod) shardMod.Destroy();
            }
            if (tier >= 4 && target.IsRealHero()) {
                this.refundCooldown();
            }
        }

        this.DecrementStackCount();
        if (this.GetStackCount() <= 0) {
            this.Destroy();
        }
    }
}
