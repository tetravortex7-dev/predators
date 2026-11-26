import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoCreepDamage,
    applyVenoSymbiontPollen,
    findVenoAllies,
    findVenoEnemies,
    getVenoAllAttrSum,
    getVenoBranchMaxLevel,
    getVenoTier,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_symbiont";

LinkLuaModifier("modifier_evo_veno_symbiont_w_ally", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_w_enemy", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_symbiont_q")
export class evo_veno_symbiont_q extends BaseAbility {
    private projMeta: Record<number, { isReturn: boolean; hit: Set<EntityIndex> }> = {};

    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    private launchWave(origin: Vector, dir: Vector, isReturn: boolean): void {
        const caster = this.GetCaster();
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const speed = this.GetSpecialValueFor("speed");

        const projId = ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: width,
            fEndRadius: width,
            Source: caster,
            bHasFrontalCone: false,
            iUnitTargetTeam: UnitTargetTeam.BOTH,
            iUnitTargetFlags: UnitTargetFlags.NONE,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            vVelocity: (dir * speed) as Vector,
            bProvidesVision: true,
            iVisionRadius: 220,
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

        caster.EmitSound("Hero_Venomancer.VenomousGale");
        this.launchWave(origin, dir, false);

        if (getVenoTier(caster) >= 4) {
            const endPos = GetGroundPosition((origin + dir * range) as Vector, caster);
            const delay = range / Math.max(100, speed) + 0.2;
            caster.SetContextThink(
                DoUniqueString("VenoSymbiontWaveReturn"),
                () => {
                    if (!this || this.IsNull() || !caster || caster.IsNull()) return undefined;
                    const dest = caster.IsAlive() ? caster.GetAbsOrigin() : origin;
                    let backDir = (dest - endPos) as Vector;
                    backDir.z = 0;
                    if (backDir.Length2D() < 1) backDir = (-dir) as Vector;
                    this.launchWave(endPos, backDir.Normalized(), true);
                    return undefined;
                },
                delay
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
        const eIdx = target.GetEntityIndex();
        if (meta !== undefined && meta.hit.has(eIdx)) return false;
        if (meta !== undefined) meta.hit.add(eIdx);

        const caster = this.GetCaster();
        const tier = getVenoTier(caster);
        const allStats = getVenoAllAttrSum(caster);
        const mult = meta && meta.isReturn ? this.GetSpecialValueFor("return_pct") / 100 : 1.0;

        applyVenoSymbiontPollen(caster, target, this);
        if (target.GetTeamNumber() === caster.GetTeamNumber()) {
            const heal = (this.GetSpecialValueFor("heal_base") + (allStats * this.GetSpecialValueFor("heal_all_pct")) / 100) * mult;
            target.Heal(heal, this);
            if (tier >= 3 && !(meta && meta.isReturn)) {
                target.Purge(false, true, false, false, false);
                const shield = Math.ceil((heal * this.GetSpecialValueFor("shield_heal_pct")) / 100);
                target.AddNewModifier(caster, this, "modifier_evo_veno_symbiont_shield", {
                    duration: this.GetSpecialValueFor("shield_duration"),
                    shield,
                });
            }
        } else {
            const dmg = (this.GetSpecialValueFor("dmg_base") + (allStats * this.GetSpecialValueFor("dmg_all_pct")) / 100) * mult;
            applyVenoCreepDamage(caster, target, this, dmg, DamageTypes.MAGICAL, this.GetSpecialValueFor("creep_mult"));
        }
        return false;
    }
}

@registerAbility("evo_veno_symbiont_w")
export class evo_veno_symbiont_w extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    GetAbilityTargetTeam(): UnitTargetTeam {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && getVenoTier(caster) >= 3) {
            return UnitTargetTeam.BOTH;
        }
        return UnitTargetTeam.FRIENDLY;
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget() ?? caster;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        const tier = getVenoTier(caster);

        if (target.GetTeamNumber() !== caster.GetTeamNumber() && tier >= 3) {
            const rootDur = tier >= 4 ? 1.5 : 1.2;
            target.EmitSound("Hero_Treant.Overgrowth.Target");
            target.AddNewModifier(caster, this, "modifier_evo_veno_symbiont_w_enemy", { duration: rootDur });
            return;
        }

        const dur = this.GetSpecialValueFor("duration");
        const shield = Math.ceil(
            this.GetSpecialValueFor("shield_base") +
                (getVenoAllAttrSum(caster) * this.GetSpecialValueFor("shield_all_pct")) / 100
        );
        target.EmitSound("Hero_Treant.LivingArmor.Target");
        const mod = target.AddNewModifier(caster, this, "modifier_evo_veno_symbiont_w_ally", {
            duration: dur,
            shield,
        });
        if (mod !== undefined) {
            mod.SetStackCount(shield);
        }
    }
}

@registerModifier("modifier_evo_veno_symbiont_w_ally")
export class modifier_evo_veno_symbiont_w_ally extends BaseModifier {
    private statusRes = 20;
    private pulseAccum = 0;

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
        return "treant_living_armor";
    }
    OnCreated(params: { shield?: number }): void {
        this.statusRes = 20;
        this.pulseAccum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.statusRes = ab.GetSpecialValueFor("status_res");
        }
        if (!IsServer()) return;
        if (params && params.shield !== undefined) {
            this.SetStackCount(params.shield);
        }
        this.StartIntervalThink(0.1);
    }
    OnRefresh(params: { shield?: number }): void {
        this.OnCreated(params);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        this.pulseAccum += 0.1;
        const interval = ab.GetSpecialValueFor("pulse_interval");
        if (this.pulseAccum < interval) return;
        this.pulseAccum -= interval;

        const radius = ab.GetSpecialValueFor("pulse_radius");
        const dmg = ab.GetSpecialValueFor("pulse_dmg") + (getVenoAllAttrSum(caster) * ab.GetSpecialValueFor("pulse_all_pct")) / 100;
        for (const enemy of findVenoEnemies(caster, parent.GetAbsOrigin(), radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;
        if (getVenoTier(caster) < 4) return;

        const origin = parent.GetAbsOrigin();
        const radius = ab.GetSpecialValueFor("burst_radius");
        const heal = ab.GetSpecialValueFor("burst_heal") + (getVenoAllAttrSum(caster) * ab.GetSpecialValueFor("burst_all_pct")) / 100;
        const pushDist = ab.GetSpecialValueFor("burst_push");

        for (const ally of findVenoAllies(caster, origin, radius)) {
            if (ally && !ally.IsNull() && ally.IsAlive()) {
                ally.Heal(heal, ab);
            }
        }
        for (const enemy of findVenoEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            let dir = (enemy.GetAbsOrigin() - origin) as Vector;
            dir.z = 0;
            if (dir.Length2D() < 1) dir = Vector(1, 0, 0);
            const nextPos = GetGroundPosition((enemy.GetAbsOrigin() + dir.Normalized() * pushDist) as Vector, enemy);
            FindClearSpaceForUnit(enemy, nextPos, false);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        ];
    }
    GetModifierStatusResistanceStacking(): number {
        return this.statusRes;
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

@registerModifier("modifier_evo_veno_symbiont_w_enemy")
export class modifier_evo_veno_symbiont_w_enemy extends BaseModifier {
    private accum = 0;

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
        return "treant_living_armor";
    }
    OnCreated(): void {
        this.accum = 0;
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_treant/treant_bramble_root.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        const baseDrain = getVenoTier(caster) >= 4 ? 65 : 40;
        const halfDrain = (baseDrain + (getVenoAllAttrSum(caster) * ab.GetSpecialValueFor("drain_all_pct")) / 100) * 0.5;
        ApplyDamage({
            victim: parent,
            attacker: caster,
            ability: ab,
            damage: halfDrain,
            damage_type: DamageTypes.MAGICAL,
        });
        if (caster.IsAlive()) {
            caster.Heal(halfDrain, ab);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}
