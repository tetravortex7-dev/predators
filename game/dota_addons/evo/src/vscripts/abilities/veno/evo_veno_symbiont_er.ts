import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoSymbiontPollen,
    findVenoAllies,
    findVenoEnemies,
    getVenoAllAttrSum,
    getVenoBranchMaxLevel,
    getVenoTier,
    triggerVenoSporePulse,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_symbiont_er";

LinkLuaModifier("modifier_evo_veno_symbiont_e_aura", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_e_aura_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_e_surge", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_r_aura", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_r_ally", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_r_enemy_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_symbiont_e")
export class evo_veno_symbiont_e extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_veno_symbiont_e_aura";
    }
    GetBehavior(): AbilityBehavior | Uint64 {
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && getVenoTier(caster) >= 3) {
            return AbilityBehavior.NO_TARGET + AbilityBehavior.IMMEDIATE;
        }
        return AbilityBehavior.PASSIVE;
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (getVenoTier(caster) < 3) return;
        const radius = this.GetSpecialValueFor("surge_radius");
        const dur = this.GetSpecialValueFor("surge_duration");
        const origin = caster.GetAbsOrigin();

        caster.EmitSound("Hero_Treant.Overgrowth.Cast");
        for (const ally of findVenoAllies(caster, origin, radius)) {
            if (!ally || ally.IsNull() || !ally.IsAlive()) continue;
            applyVenoSymbiontPollen(caster, ally, this);
            ally.AddNewModifier(caster, this, "modifier_evo_veno_symbiont_e_surge", { duration: dur });
        }
        for (const enemy of findVenoEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            applyVenoSymbiontPollen(caster, enemy, this);
        }
    }
}

@registerModifier("modifier_evo_veno_symbiont_e_aura")
export class modifier_evo_veno_symbiont_e_aura extends BaseModifier {
    private auraRadius = 650;
    private bonusStats = 0;

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
        return "modifier_evo_veno_symbiont_e_aura_buff";
    }
    GetAuraRadius(): number {
        return this.auraRadius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }
    GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO;
    }
    OnCreated(): void {
        this.auraRadius = 650;
        this.bonusStats = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.auraRadius = ab.GetSpecialValueFor("aura_radius");
        }
        if (!IsServer()) return;
        this.StartIntervalThink(0.4);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull()) return;
        if (getVenoTier(parent) < 4) {
            this.bonusStats = 0;
            return;
        }
        const scanRadius = ab.GetSpecialValueFor("bonus_scan_radius");
        const perHero = ab.GetSpecialValueFor("bonus_per_hero");
        const origin = parent.GetAbsOrigin();
        let count = 0;
        for (const u of FindUnitsInRadius(
            parent.GetTeamNumber(),
            origin,
            undefined,
            scanRadius,
            UnitTargetTeam.BOTH,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        )) {
            if (u && !u.IsNull() && u.IsAlive() && u.HasModifier("modifier_evo_veno_symbiont_pollen")) {
                count += 1;
            }
        }
        this.bonusStats = count * perHero;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.bonusStats;
    }
    GetModifierBonusStats_Agility(): number {
        return this.bonusStats;
    }
    GetModifierBonusStats_Intellect(): number {
        return this.bonusStats;
    }
}

@registerModifier("modifier_evo_veno_symbiont_e_aura_buff")
export class modifier_evo_veno_symbiont_e_aura_buff extends BaseModifier {
    private allStats = 4;
    private healAmp = 15;

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
        return "treant_natures_guise";
    }
    OnCreated(): void {
        this.allStats = 4;
        this.healAmp = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.allStats = ab.GetSpecialValueFor("all_stats_bonus");
            this.healAmp = ab.GetSpecialValueFor("heal_amp_pct");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.allStats;
    }
    GetModifierBonusStats_Agility(): number {
        return this.allStats;
    }
    GetModifierBonusStats_Intellect(): number {
        return this.allStats;
    }
    GetModifierHealAmplify_PercentageTarget(): number {
        return this.healAmp;
    }
}

@registerModifier("modifier_evo_veno_symbiont_e_surge")
export class modifier_evo_veno_symbiont_e_surge extends BaseModifier {
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
        return "treant_natures_guise";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const ally = this.GetParent();
        const veno = this.GetCaster();
        const target = event.target;
        if (!ally || ally.IsNull() || !veno || veno.IsNull() || event.attacker !== ally) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === ally.GetTeamNumber() || target.IsBuilding()) return;
        triggerVenoSporePulse(veno, target, 0.5);
    }
}

@registerAbility("evo_veno_symbiont_r")
export class evo_veno_symbiont_r extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const radius = this.GetSpecialValueFor("radius");
        const dur = this.GetSpecialValueFor("duration");
        const silDur = this.GetSpecialValueFor("silence_duration");
        const origin = caster.GetAbsOrigin();

        caster.EmitSound("Hero_Treant.Overgrowth.Cast");
        for (const ally of findVenoAllies(caster, origin, radius)) {
            if (ally && !ally.IsNull() && ally.IsAlive()) {
                ally.Purge(false, true, false, true, true);
            }
        }
        for (const enemy of findVenoEnemies(caster, origin, radius)) {
            if (enemy && !enemy.IsNull() && enemy.IsAlive()) {
                enemy.AddNewModifier(caster, this, "modifier_silence", { duration: silDur });
            }
        }
        caster.AddNewModifier(caster, this, "modifier_evo_veno_symbiont_r_aura", { duration: dur });
    }
}

@registerModifier("modifier_evo_veno_symbiont_r_aura")
export class modifier_evo_veno_symbiont_r_aura extends BaseModifier {
    private radius = 550;
    private accum = 0;

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
        return "treant_overgrowth";
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_veno_symbiont_r_ally";
    }
    GetAuraRadius(): number {
        return this.radius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }
    GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO;
    }
    OnCreated(): void {
        this.radius = 550;
        this.accum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.radius = ab.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_treant/scepter_overgrowth_aura.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ab || ab.IsNull()) return;
        const halfDps =
            (ab.GetSpecialValueFor("enemy_dps_base") +
                (getVenoAllAttrSum(parent) * ab.GetSpecialValueFor("enemy_dps_all_pct")) / 100) *
            0.5;
        for (const enemy of findVenoEnemies(parent, parent.GetAbsOrigin(), this.radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: halfDps,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(parent, ab, "modifier_evo_veno_symbiont_r_enemy_slow", { duration: 0.7 });
        }
    }
}

@registerModifier("modifier_evo_veno_symbiont_r_ally")
export class modifier_evo_veno_symbiont_r_ally extends BaseModifier {
    private dmgReduce = 25;
    private regenPerSec = 75;

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
        return "treant_overgrowth";
    }
    OnCreated(): void {
        this.dmgReduce = 25;
        this.regenPerSec = 75;
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (ab && !ab.IsNull() && caster && !caster.IsNull()) {
            this.dmgReduce = ab.GetSpecialValueFor("ally_dmg_reduce");
            this.regenPerSec =
                ab.GetSpecialValueFor("ally_regen_base") +
                (getVenoAllAttrSum(caster) * ab.GetSpecialValueFor("ally_regen_all_pct")) / 100;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
        ];
    }
    GetModifierIncomingDamage_Percentage(): number {
        return -this.dmgReduce;
    }
    GetModifierConstantHealthRegen(): number {
        return this.regenPerSec;
    }
}

@registerModifier("modifier_evo_veno_symbiont_r_enemy_slow")
export class modifier_evo_veno_symbiont_r_enemy_slow extends BaseModifier {
    private slowPct = 35;
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
        return "treant_overgrowth";
    }
    OnCreated(): void {
        this.slowPct = 35;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("enemy_slow_pct");
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
