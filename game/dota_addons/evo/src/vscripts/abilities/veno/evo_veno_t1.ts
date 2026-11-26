import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoCreepDamage,
    detectVenoBranchAndTier,
    findVenoEnemies,
    getVenoActiveTurrets,
    getVenoBranchMaxLevel,
    triggerVenoSporePulse,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_t1";

LinkLuaModifier("modifier_evo_veno_glands", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_t1_sprout", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_glands")
export class evo_veno_glands extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_veno_glands";
    }
}

@registerAbility("evo_veno_needle_glands")
export class evo_veno_needle_glands extends evo_veno_glands {}

@registerAbility("evo_veno_hive_glands")
export class evo_veno_hive_glands extends evo_veno_glands {}

@registerAbility("evo_veno_symbiont_glands")
export class evo_veno_symbiont_glands extends evo_veno_glands {}

@registerModifier("modifier_evo_veno_glands")
export class modifier_evo_veno_glands extends BaseModifier {
    private attackCount = 0;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    GetTexture(): string {
        return "venomancer_poison_sting";
    }
    OnCreated(): void {
        this.attackCount = 0;
        if (!IsServer()) return;
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return;
        const info = detectVenoBranchAndTier(parent);
        if (info.branch === "HIVE" && info.tier >= 3) {
            const count = Math.min(5, getVenoActiveTurrets(parent).length);
            if (this.GetStackCount() !== count) {
                this.SetStackCount(count);
            }
        } else if (this.GetStackCount() !== 0) {
            this.SetStackCount(0);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        ];
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        if (ab.GetAbilityName() !== "evo_veno_hive_glands") return 0;
        const ampPer = ab.GetSpecialValueFor("amp_per_turret");
        return Math.min(5, this.GetStackCount()) * ampPer;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        this.attackCount += 1;
        const info = detectVenoBranchAndTier(parent);
        let cadence = ab.GetSpecialValueFor("attack_cadence");
        if (info.branch === "NEEDLE" && info.tier >= 4) {
            const slowed =
                target.HasModifier("modifier_evo_veno_needle_q_slow") ||
                target.HasModifier("modifier_evo_veno_glands_slow") ||
                target.HasModifier("modifier_evo_veno_chitin_shard");
            if (slowed) {
                cadence = 2;
            }
        }
        if (this.attackCount >= Math.max(1, cadence)) {
            this.attackCount = 0;
            triggerVenoSporePulse(parent, target, 1.0);
        }
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const castAb = event.ability;
        if (!parent || parent.IsNull() || event.unit !== parent || parent.PassivesDisabled()) return;
        if (!castAb || castAb.IsNull() || castAb.IsItem()) return;
        if (castAb.GetAbilityName().startsWith("evo_empty_slot_")) return;

        const target = event.target;
        if (target && !target.IsNull() && IsValidEntity(target) && target.IsAlive() && target.GetTeamNumber() !== parent.GetTeamNumber()) {
            triggerVenoSporePulse(parent, target, 1.0);
            return;
        }
        const enemies = findVenoEnemies(parent, parent.GetAbsOrigin(), 650);
        if (enemies.length > 0 && enemies[0] && !enemies[0].IsNull()) {
            triggerVenoSporePulse(parent, enemies[0], 1.0);
        }
    }
}

@registerAbility("evo_veno_t1_q")
export class evo_veno_t1_q extends BaseAbility {
    private triggeredPulse: Set<ProjectileID> = new Set();
    private hitSets: Record<number, Set<EntityIndex>> = {};

    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
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
        const width = this.GetSpecialValueFor("width");
        const speed = this.GetSpecialValueFor("speed");

        caster.EmitSound("Hero_Venomancer.VenomousGale");
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
            vVelocity: (dir * speed) as Vector,
            bProvidesVision: true,
            iVisionRadius: 200,
            iVisionTeamNumber: caster.GetTeamNumber(),
        });
        this.hitSets[projId] = new Set<EntityIndex>();
    }
    OnProjectileHitHandle(
        target: CDOTA_BaseNPC | undefined,
        _location: Vector,
        projectileHandle: ProjectileID
    ): boolean {
        if (!IsServer()) return false;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            delete this.hitSets[projectileHandle];
            this.triggeredPulse.delete(projectileHandle);
            return false;
        }
        const set = this.hitSets[projectileHandle];
        const idx = target.GetEntityIndex();
        if (set !== undefined && set.has(idx)) return false;
        if (set !== undefined) set.add(idx);

        const caster = this.GetCaster();
        const dmg = this.GetSpecialValueFor("damage");
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const slowDur = this.GetSpecialValueFor("slow_duration");

        target.EmitSound("Hero_Venomancer.VenomousGaleImpact");
        applyVenoCreepDamage(caster, target, this, dmg, DamageTypes.MAGICAL, creepMult);
        target.AddNewModifier(caster, this, "modifier_evo_veno_t1_q_slow", { duration: slowDur });

        if (!this.triggeredPulse.has(projectileHandle)) {
            this.triggeredPulse.add(projectileHandle);
            triggerVenoSporePulse(caster, target, 1.0);
        }
        return false;
    }
}

@registerAbility("evo_veno_t1_w")
export class evo_veno_t1_w extends BaseAbility {
    private sprouts: CDOTA_BaseNPC[] = [];

    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const dur = this.GetSpecialValueFor("duration");
        const maxSprouts = this.GetSpecialValueFor("max_sprouts");
        const dmg = this.GetSpecialValueFor("attack_damage");

        this.sprouts = this.sprouts.filter((u) => u && !u.IsNull() && IsValidEntity(u) && u.IsAlive());
        while (this.sprouts.length >= maxSprouts) {
            const oldest = this.sprouts.shift();
            if (oldest && !oldest.IsNull() && IsValidEntity(oldest)) {
                oldest.ForceKill(false);
            }
        }

        caster.EmitSound("Hero_Venomancer.Plague_Ward");
        const sprout = CreateUnitByName("evo_veno_sprout", pos, true, caster, caster, caster.GetTeamNumber());
        if (sprout && !sprout.IsNull()) {
            sprout.SetControllableByPlayer(caster.GetPlayerOwnerID(), false);
            sprout.SetBaseDamageMin(dmg);
            sprout.SetBaseDamageMax(dmg);
            sprout.AddNewModifier(caster, this, "modifier_kill", { duration: dur });
            sprout.AddNewModifier(caster, this, "modifier_evo_veno_t1_sprout", { duration: dur });
            this.sprouts.push(sprout);
        }
    }
}

@registerModifier("modifier_evo_veno_t1_sprout")
export class modifier_evo_veno_t1_sprout extends BaseModifier {
    private range = 450;
    private interval = 1.2;
    private dmg = 24;
    private creepMult = 1.3;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.range = 450;
        this.interval = 1.2;
        this.dmg = 24;
        this.creepMult = 1.3;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.range = ab.GetSpecialValueFor("attack_range");
            this.interval = ab.GetSpecialValueFor("attack_interval");
            this.dmg = ab.GetSpecialValueFor("attack_damage");
            this.creepMult = ab.GetSpecialValueFor("creep_mult");
        }
        if (!IsServer()) return;
        this.StartIntervalThink(this.interval);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const sprout = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!sprout || sprout.IsNull() || !sprout.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        const enemies = findVenoEnemies(caster, sprout.GetAbsOrigin(), this.range);
        if (enemies.length === 0) return;

        let target = enemies[0];
        for (const candidate of enemies) {
            if (candidate && !candidate.IsNull() && candidate.HasModifier("modifier_evo_veno_t1_q_slow")) {
                target = candidate;
                break;
            }
        }
        if (!target || target.IsNull() || !target.IsAlive()) return;

        sprout.FaceTowards(target.GetAbsOrigin());
        ProjectileManager.CreateTrackingProjectile({
            Target: target,
            Source: sprout,
            Ability: ab,
            EffectName: "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
            iMoveSpeed: 1900,
            bDodgeable: true,
        });
        applyVenoCreepDamage(caster, target, ab, this.dmg, DamageTypes.PHYSICAL, this.creepMult);
    }
}
