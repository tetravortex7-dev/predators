import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    addLivingChitinStacks,
    applyAcousticDisruption,
    findEnemiesInRadius,
    getNyxAllAttrSum,
    getNyxBranchMaxLevel,
    getNyxTier,
    knockbackUnitFrom,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_cicada_er";

LinkLuaModifier("modifier_evo_nyx_cicada_e_shield", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_cicada_r", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_cicada_r_debuff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_cicada_e")
export class evo_nyx_cicada_e extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getNyxTier(caster);
        const duration = this.GetSpecialValueFor("duration");
        const shieldAmt = Math.ceil(
            this.GetSpecialValueFor("base_shield") + (getNyxAllAttrSum(caster) * this.GetSpecialValueFor("shield_all_pct")) / 100
        );

        if (tier >= 3) {
            caster.Purge(false, true, false, false, false);
        }
        caster.EmitSound("Hero_Dark_Seer.Ion_Shield_Start");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_nyx_cicada_e_shield", { duration });
        if (mod !== undefined) {
            mod.SetStackCount(shieldAmt);
        }
    }
}

@registerModifier("modifier_evo_nyx_cicada_e_shield")
export class modifier_evo_nyx_cicada_e_shield extends BaseModifier {
    private radius = 300;
    private blasted = false;

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
        return "dark_seer_ion_shell";
    }
    OnCreated(): void {
        this.radius = 300;
        this.blasted = false;
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            this.radius = ability.GetSpecialValueFor("dps_radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_dark_seer/dark_seer_ion_shell.vpcf",
            ParticleAttachment.POINT_FOLLOW,
            this.GetParent()
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(75, 75, 75));
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ability || ability.IsNull()) return;
        const halfDps = ability.GetSpecialValueFor("dps_base") * 0.5;
        for (const enemy of findEnemiesInRadius(parent, parent.GetAbsOrigin(), this.radius)) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: halfDps,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
    OnDestroy(): void {
        if (!IsServer() || this.blasted) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || getNyxTier(parent) < 4) return;
        this.blasted = true;
        const origin = parent.GetAbsOrigin();
        for (const enemy of findEnemiesInRadius(parent, origin, 350)) {
            knockbackUnitFrom(parent, enemy, origin, 225, 0.3, 50);
        }
        const wAb = parent.FindAbilityByName("evo_nyx_cicada_w");
        if (wAb && !wAb.IsNull()) {
            wAb.EndCooldown();
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("bonus_ms_pct") : 15;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || this.GetStackCount() <= 0) return 0;
        const tier = getNyxTier(parent);
        if (tier < 3) return 0;
        return tier >= 4 ? 35 : 25;
    }
    GetModifierStatusResistanceStacking(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || this.GetStackCount() <= 0 || getNyxTier(parent) < 3) return 0;
        return 25;
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

@registerAbility("evo_nyx_cicada_r")
export class evo_nyx_cicada_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const duration = this.GetSpecialValueFor("duration");
        caster.EmitSound("Ability.Razor.PlasmaField");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_cicada_r", { duration });
    }
}

@registerModifier("modifier_evo_nyx_cicada_r")
export class modifier_evo_nyx_cicada_r extends BaseModifier {
    private radius = 550;

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
        return "razor_plasma_field";
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_nyx_cicada_r_debuff";
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
        this.radius = 550;
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            this.radius = ability.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const interval = ability && !ability.IsNull() ? ability.GetSpecialValueFor("pulse_interval") : 1.2;
        this.pulseAura();
        this.StartIntervalThink(interval);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.pulseAura();
    }
    private pulseAura(): void {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ability || ability.IsNull()) return;
        const dmg = ability.GetSpecialValueFor("pulse_damage");
        const origin = parent.GetAbsOrigin();

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_razor/razor_plasmafield_shockwave.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, this.radius, 1));
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findEnemiesInRadius(parent, origin, this.radius)) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            applyAcousticDisruption(parent, enemy, ability, 3);
            const sting = enemy.FindModifierByName("modifier_evo_nyx_cicada_w_sting") as
                | { advancePulse?: () => void }
                | undefined;
            if (sting && sting.advancePulse) {
                sting.advancePulse();
            }
        }
        addLivingChitinStacks(parent, 1);
    }
}

@registerModifier("modifier_evo_nyx_cicada_r_debuff")
export class modifier_evo_nyx_cicada_r_debuff extends BaseModifier {
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
        return "razor_plasma_field";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MISS_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? -ability.GetSpecialValueFor("slow_pct") : -22;
    }
    GetModifierMiss_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("miss_pct") : 20;
    }
}
