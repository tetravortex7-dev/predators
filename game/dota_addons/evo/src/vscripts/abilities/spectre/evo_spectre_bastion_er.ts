import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    addBastionPassiveShield,
    findSpectreEnemies,
    getBastionMaxPassiveShield,
    getBastionTotalShields,
    getSpectreBranchMaxLevel,
    getSpectreStr,
    getSpectreTier,
    spawnBastionBlockFx,
    triggerBastionBreakMs,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_bastion_er";

LinkLuaModifier("modifier_evo_spectre_bastion_e_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_e_surge", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_r_dome", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_r_shield", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_bastion_e")
export class evo_spectre_bastion_e extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_bastion_e_passive";
    }
}

@registerAbility("evo_spectre_bastion_e_t3")
export class evo_spectre_bastion_e_t3 extends evo_spectre_bastion_e {}

@registerAbility("evo_spectre_bastion_e_t4")
export class evo_spectre_bastion_e_t4 extends evo_spectre_bastion_e {}

@registerModifier("modifier_evo_spectre_bastion_e_surge")
export class modifier_evo_spectre_bastion_e_surge extends BaseModifier {
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
        return "evo_spectre_bastion_e";
    }
}

@registerModifier("modifier_evo_spectre_bastion_e_passive")
export class modifier_evo_spectre_bastion_e_passive extends BaseModifier {
    private lastHurtTime = -999;
    private fracAccum = 0;

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
        return "evo_spectre_bastion_e";
    }
    OnCreated(): void {
        this.lastHurtTime = -999;
        this.fracAccum = 0;
        if (!IsServer()) return;
        this.SetStackCount(0);
        this.StartIntervalThink(0.2);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ab || ab.IsNull()) return;
        if (parent.PassivesDisabled() || ab.GetLevel() <= 0) return;

        const now = GameRules.GetGameTime();
        const idleDelay = ab.GetSpecialValueFor("idle_delay");
        const hasSurge = parent.HasModifier("modifier_evo_spectre_bastion_e_surge");
        if (now - this.lastHurtTime < idleDelay && !hasSurge) return;

        const perSec = ab.GetSpecialValueFor("regen_per_sec") + (getSpectreStr(parent) * ab.GetSpecialValueFor("regen_str_pct")) / 100;
        this.fracAccum += perSec * 0.2;
        const gain = Math.floor(this.fracAccum);
        if (gain >= 1) {
            this.fracAccum -= gain;
            addBastionPassiveShield(parent, gain);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierStatusResistanceStacking(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        if (getBastionTotalShields(parent) <= 0) return 0;
        return ab.GetSpecialValueFor("status_res");
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        if (getBastionTotalShields(parent) <= 0) return 0;
        return ab.GetSpecialValueFor("bonus_as");
    }
    GetModifierIncomingDamageConstant(event: ModifierAttackEvent): number {
        if (IsClient()) {
            if (event.report_max) {
                return getBastionMaxPassiveShield(this.GetParent());
            }
            return this.GetStackCount();
        }
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const pool = this.GetStackCount();
        if (!parent || parent.IsNull() || pool <= 0 || event.damage <= 0) return 0;
        const blocked = Math.min(pool, Math.ceil(event.damage));
        const rem = pool - blocked;
        this.SetStackCount(Math.max(0, rem));
        spawnBastionBlockFx(parent, event.attacker, blocked);
        if (rem === 0 && blocked > 0) {
            triggerBastionBreakMs(parent);
        }
        return -blocked;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || ab.GetLevel() <= 0) return;
        const now = GameRules.GetGameTime();

        if (event.unit === parent && event.damage > 0 && event.attacker !== parent) {
            this.lastHurtTime = now;
            return;
        }

        if (event.attacker === parent && event.unit && !event.unit.IsNull() && event.unit !== parent && event.damage > 0) {
            if (
                getSpectreTier(parent) >= 4 &&
                event.damage_type === DamageTypes.PHYSICAL &&
                event.damage_category === DamageCategory.ATTACK &&
                !event.inflictor &&
                bit.band(event.damage_flags, DamageFlag.REFLECTION) === 0
            ) {
                const cap = getBastionMaxPassiveShield(parent);
                if (cap > 0) {
                    const gain = (event.damage * ab.GetSpecialValueFor("leech_shield_pct")) / 100;
                    addBastionPassiveShield(parent, gain);
                }
            }
        }
    }
}

@registerAbility("evo_spectre_bastion_r")
export class evo_spectre_bastion_r extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const radius = this.GetSpecialValueFor("radius");
        const shieldAmt = Math.ceil(
            this.GetSpecialValueFor("ally_shield") +
                (getSpectreStr(caster) * this.GetSpecialValueFor("shield_str_pct")) / 100
        );

        caster.EmitSound("Hero_Abaddon.BorrowedTime");
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_bastion_r_dome", { duration: dur });

        const allies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            caster.GetAbsOrigin(),
            undefined,
            radius,
            UnitTargetTeam.FRIENDLY,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const ally of allies) {
            if (!ally || ally.IsNull() || !ally.IsAlive()) continue;
            const mod = ally.AddNewModifier(caster, this, "modifier_evo_spectre_bastion_r_shield", {
                duration: dur,
                capacity: shieldAmt,
            });
            if (mod !== undefined) {
                mod.SetStackCount(shieldAmt);
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_bastion_r_dome")
export class modifier_evo_spectre_bastion_r_dome extends BaseModifier {
    private radius = 475;
    private pulseAccum = 0;

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
        return "evo_spectre_bastion_r";
    }
    OnCreated(): void {
        this.radius = 475;
        this.pulseAccum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.radius = ab.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const parent = this.GetParent();
        const domePfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_arc_warden/arc_warden_magnetic.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.SetParticleControl(domePfx, 1, Vector(this.radius, 1, 1));
        this.AddParticle(domePfx, false, false, -1, false, false);

        const auraPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_aura.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        this.AddParticle(auraPfx, false, false, -1, false, false);
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ab || ab.IsNull()) return;

        this.pulseAccum += 0.1;
        const interval = ab.GetSpecialValueFor("pulse_interval");
        if (this.pulseAccum < interval) return;
        this.pulseAccum -= interval;

        const dmg =
            ab.GetSpecialValueFor("pulse_dmg") + (getSpectreStr(parent) * ab.GetSpecialValueFor("pulse_str_pct")) / 100;
        const slowDur = ab.GetSpecialValueFor("slow_duration");
        const perEnemyShield = ab.GetSpecialValueFor("shield_per_enemy");
        const creepMult = Math.max(0, ab.GetSpecialValueFor("creep_shield_pct") || 15) / 100;
        const origin = parent.GetAbsOrigin();
        const pulsePfx = ParticleManager.CreateParticle(
            "particles/evo_spectre/evo_bastion_explosion.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pulsePfx, 0, origin);
        ParticleManager.ReleaseParticleIndex(pulsePfx);

        const enemies = findSpectreEnemies(parent, origin, this.radius);
        let shieldGain = 0;

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(parent, ab, "modifier_evo_spectre_bastion_slow", { duration: slowDur });
            shieldGain += enemy.IsConsideredHero() ? perEnemyShield : perEnemyShield * creepMult;
        }
        if (shieldGain > 0) {
            addBastionPassiveShield(parent, Math.round(shieldGain));
        }
    }
}

@registerModifier("modifier_evo_spectre_bastion_r_shield")
export class modifier_evo_spectre_bastion_r_shield extends BaseModifier {
    private radius = 475;
    private maxCapacity = 400;

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
        return "evo_spectre_bastion_r";
    }
    OnCreated(params: { capacity?: number }): void {
        this.radius = 475;
        this.maxCapacity = 400;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.radius = ab.GetSpecialValueFor("radius");
        }
        if (params && params.capacity !== undefined) {
            this.maxCapacity = params.capacity;
        }
        if (IsServer() && params && params.capacity !== undefined) {
            this.SetStackCount(params.capacity);
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (parent && !parent.IsNull() && caster && !caster.IsNull() && parent === caster) {
            triggerBastionBreakMs(caster);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT")];
    }
    GetModifierIncomingDamageConstant(event: ModifierAttackEvent): number {
        if (IsClient()) {
            if (event.report_max) {
                return Math.max(this.maxCapacity, this.GetStackCount());
            }
            return this.GetStackCount();
        }
        if (!IsServer() || event.damage <= 0) return 0;
        const caster = this.GetCaster();
        const attacker = event.attacker;
        if (
            caster &&
            !caster.IsNull() &&
            caster.HasModifier("modifier_evo_spectre_bastion_r_dome") &&
            attacker &&
            !attacker.IsNull()
        ) {
            const distFromDome = ((attacker.GetAbsOrigin() - caster.GetAbsOrigin()) as Vector).Length2D();
            if (distFromDome > this.radius) {
                return -Math.ceil(event.damage);
            }
        }
        const pool = this.GetStackCount();
        if (pool <= 0) return 0;
        const blocked = Math.min(pool, Math.ceil(event.damage));
        const rem = pool - blocked;
        this.SetStackCount(Math.max(0, rem));
        spawnBastionBlockFx(this.GetParent(), attacker, blocked);
        if (rem <= 0) {
            this.Destroy();
        }
        return -blocked;
    }
}
