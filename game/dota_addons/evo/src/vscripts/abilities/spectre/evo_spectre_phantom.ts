import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applySpectreCreepDamage,
    findSpectreEnemies,
    getSpectreAgi,
    getSpectreBranchMaxLevel,
    getSpectreTier,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_phantom";

LinkLuaModifier("modifier_evo_spectre_phantom_w_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_w_active", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_ms_steal", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_root", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_phantom_q")
export class evo_spectre_phantom_q extends BaseAbility {
    private projMeta: Record<number, { isReturn: boolean; hit: Set<EntityIndex> }> = {};

    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }

    private launchCrescent(origin: Vector, dir: Vector, isReturn: boolean): void {
        const caster = this.GetCaster();
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const speed = this.GetSpecialValueFor("speed");

        const projId = ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_spectre/spectre_spectral_dagger.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: width,
            fEndRadius: width,
            Source: caster,
            bHasFrontalCone: false,
            iUnitTargetTeam: UnitTargetTeam.ENEMY,
            iUnitTargetFlags: UnitTargetFlags.NONE,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            vVelocity: (dir * speed) as Vector,
            bProvidesVision: true,
            iVisionRadius: 225,
            iVisionTeamNumber: caster.GetTeamNumber(),
        });
        this.projMeta[projId] = { isReturn, hit: new Set<EntityIndex>() };
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

        const range = this.GetSpecialValueFor("range");
        const speed = this.GetSpecialValueFor("speed");
        const pathDur = this.GetSpecialValueFor("path_duration");

        caster.EmitSound("Hero_Spectre.DaggerCast");
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_shadow_path", { duration: pathDur });
        this.launchCrescent(origin, dir, false);

        if (getSpectreTier(caster) >= 3) {
            const endPoint = GetGroundPosition((origin + dir * range) as Vector, caster);
            const returnDelay = range / Math.max(100, speed) + this.GetSpecialValueFor("return_delay");
            caster.SetContextThink(
                DoUniqueString("SpectreCrescentReturn"),
                () => {
                    if (!this || this.IsNull() || !caster || caster.IsNull()) return undefined;
                    const targetPos = caster.IsAlive() ? caster.GetAbsOrigin() : origin;
                    let backDir = (targetPos - endPoint) as Vector;
                    backDir.z = 0;
                    if (backDir.Length2D() < 1) {
                        backDir = (-dir) as Vector;
                    }
                    this.launchCrescent(endPoint, backDir.Normalized(), true);
                    return undefined;
                },
                returnDelay
            );
        }
    }

    OnProjectileHitHandle(
        target: CDOTA_BaseNPC | undefined,
        _location: Vector,
        projectileHandle: ProjectileID
    ): boolean {
        if (!IsServer()) return false;
        const meta = this.projMeta[projectileHandle];
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            delete this.projMeta[projectileHandle];
            return false;
        }
        const idx = target.GetEntityIndex();
        if (meta !== undefined && meta.hit.has(idx)) return false;
        if (meta !== undefined) meta.hit.add(idx);

        const caster = this.GetCaster();
        const tier = getSpectreTier(caster);
        const rawBase = this.GetSpecialValueFor("base_damage") + (getSpectreAgi(caster) * this.GetSpecialValueFor("agi_pct")) / 100;
        const dmg = meta && meta.isReturn ? (rawBase * this.GetSpecialValueFor("return_dmg_pct")) / 100 : rawBase;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const slowDur = this.GetSpecialValueFor("slow_duration");

        target.EmitSound("Hero_Spectre.DaggerImpact");
        applySpectreCreepDamage(caster, target, this, dmg, DamageTypes.PHYSICAL, creepMult);
        target.AddNewModifier(caster, this, "modifier_evo_spectre_dagger_slow", { duration: slowDur });

        if (tier >= 4 && !(meta && meta.isReturn)) {
            caster.PerformAttack(target, true, true, true, true, false, false, true);
            if (target.IsRealHero()) {
                const dAb = caster.FindAbilityByName("evo_spectre_phantom_d");
                const reduce = this.GetSpecialValueFor("reality_cd_reduce");
                if (dAb && !dAb.IsNull() && reduce > 0) {
                    const rem = dAb.GetCooldownTimeRemaining();
                    if (rem > 0) {
                        dAb.EndCooldown();
                        const next = rem - reduce;
                        if (next > 0.05) dAb.StartCooldown(next);
                    }
                }
            }
        }
        return false;
    }
}

@registerAbility("evo_spectre_phantom_w")
export class evo_spectre_phantom_w extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_phantom_w_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("active_duration");
        caster.EmitSound("Hero_Spectre.Desolate");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_spectre_phantom_w_active", {
            duration: dur,
        });
        if (mod !== undefined) {
            mod.SetStackCount(1);
        }
    }
}

@registerModifier("modifier_evo_spectre_phantom_w_passive")
export class modifier_evo_spectre_phantom_w_passive extends BaseModifier {
    private hitCounter = 0;
    private bonusAs = 20;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.hitCounter = 0;
        this.bonusAs = 20;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.bonusAs = ab.GetSpecialValueFor("bonus_as");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || parent.PassivesDisabled()) return 0;
        return this.bonusAs;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        this.hitCounter += 1;
        const tier = getSpectreTier(parent);
        const activeMod = parent.FindModifierByName("modifier_evo_spectre_phantom_w_active");
        const hasEmpower = activeMod !== undefined && activeMod.GetStackCount() > 0;
        const isFastCycle =
            tier >= 4 &&
            (activeMod !== undefined || parent.HasModifier("modifier_evo_spectre_reality_ms"));
        const cadence = isFastCycle ? 2 : 3;
        const isSlowed = target.HasModifier("modifier_evo_spectre_dagger_slow");

        if (!hasEmpower && !isSlowed && this.hitCounter < cadence) {
            return;
        }
        if (this.hitCounter >= cadence) {
            this.hitCounter = 0;
        }

        const pureDmg =
            ability.GetSpecialValueFor("pure_base") +
            (getSpectreAgi(parent) * ability.GetSpecialValueFor("pure_agi_pct")) / 100;
        const cleaveRadius = ability.GetSpecialValueFor("cleave_radius");
        const cleavePct = ability.GetSpecialValueFor("cleave_pct") / 100;

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_desolate.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        ParticleManager.ReleaseParticleIndex(pfx);

        ApplyDamage({
            victim: target,
            attacker: parent,
            ability,
            damage: pureDmg,
            damage_type: DamageTypes.PURE,
        });

        for (const other of findSpectreEnemies(parent, target.GetAbsOrigin(), cleaveRadius)) {
            if (!other || other.IsNull() || !other.IsAlive() || other === target) continue;
            ApplyDamage({
                victim: other,
                attacker: parent,
                ability,
                damage: pureDmg * cleavePct,
                damage_type: DamageTypes.PURE,
            });
        }

        if (hasEmpower && activeMod) {
            activeMod.SetStackCount(0);
            const stealPct = Math.round(ability.GetSpecialValueFor("ms_steal_pct"));
            const stealDur = ability.GetSpecialValueFor("ms_steal_duration");
            const slowMod = target.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {
                duration: stealDur,
                amount: -stealPct,
            });
            if (slowMod !== undefined) slowMod.SetStackCount(stealPct);
            const hastedMod = parent.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {
                duration: stealDur,
                amount: stealPct,
            });
            if (hastedMod !== undefined) hastedMod.SetStackCount(stealPct);

            if (tier >= 3) {
                const rootDur = tier >= 4 ? 1.3 : 1.0;
                const shred = tier >= 4 ? 6 : 4;
                target.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_root", { duration: rootDur });
                target.AddNewModifier(parent, ability, "modifier_evo_spectre_armor_shred", {
                    duration: ability.GetSpecialValueFor("shred_duration"),
                    shred,
                });
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_phantom_w_active")
export class modifier_evo_spectre_phantom_w_active extends BaseModifier {
    private evasion = 30;
    private bonusRange = 175;

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
        return "spectre_desolate";
    }
    OnCreated(): void {
        this.evasion = 30;
        this.bonusRange = 175;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.evasion = ab.GetSpecialValueFor("evasion_pct");
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_CANNOT_MISS")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_EVASION_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        ];
    }
    GetModifierEvasion_Constant(): number {
        return this.evasion;
    }
    GetModifierAttackRangeBonus(): number {
        return this.GetStackCount() > 0 ? this.bonusRange : 0;
    }
}

@registerModifier("modifier_evo_spectre_phantom_ms_steal")
export class modifier_evo_spectre_phantom_ms_steal extends BaseModifier {
    private isDebuffFlag = false;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return this.isDebuffFlag;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "spectre_desolate";
    }
    OnCreated(params: { amount?: number }): void {
        this.isDebuffFlag = (params && (params.amount ?? 0) < 0) || this.GetParent().GetTeamNumber() !== this.GetCaster()?.GetTeamNumber();
        if (IsServer() && params && params.amount !== undefined) {
            this.SetStackCount(Math.abs(Math.round(params.amount)));
        }
    }
    OnRefresh(params: { amount?: number }): void {
        this.OnCreated(params);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const val = this.GetStackCount();
        return this.isDebuffFlag ? -val : val;
    }
}

@registerModifier("modifier_evo_spectre_phantom_root")
export class modifier_evo_spectre_phantom_root extends BaseModifier {
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
        return "spectre_desolate";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}
