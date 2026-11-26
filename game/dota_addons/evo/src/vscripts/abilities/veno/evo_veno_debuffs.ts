import {
    BaseModifier,
    dotaModifierFunction,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { getVenoTier } from "./evo_veno_shared";

const SCRIPT_PATH = "abilities/veno/evo_veno_debuffs";

LinkLuaModifier("modifier_evo_veno_glands_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_glands_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_mark", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_glands_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_t1_q_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_chitin_shard", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_q_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_heal_cut", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_spore_infection", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_tether_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_pollen", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_symbiont_shield", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerModifier("modifier_evo_veno_glands_slow")
export class modifier_evo_veno_glands_slow extends BaseModifier {
    private slowPct = 12;
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
        return "venomancer_poison_sting";
    }
    OnCreated(): void {
        this.slowPct = 12;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("slow_pct");
            if (v > 0) this.slowPct = v;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerModifier("modifier_evo_veno_glands_shred")
export class modifier_evo_veno_glands_shred extends BaseModifier {
    private shred = 2;
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
        return "venomancer_poison_sting";
    }
    OnCreated(params: { shred?: number }): void {
        this.shred = params?.shred ?? 2;
        if (IsServer()) {
            this.SetStackCount(Math.max(1, Math.round(this.shred)));
        }
    }
    OnRefresh(params: { shred?: number }): void {
        this.OnCreated(params);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -Math.max(1, this.GetStackCount());
    }
}

@registerModifier("modifier_evo_veno_needle_mark")
export class modifier_evo_veno_needle_mark extends BaseModifier {
    private ampPct = 15;
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
        return "venomancer_poison_sting";
    }
    OnCreated(): void {
        this.ampPct = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("mark_amp_pct");
            if (v > 0) this.ampPct = v;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_PERCENTAGE")];
    }
    GetModifierIncomingPhysicalDamage_Percentage(event: ModifierAttackEvent): number {
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || event.attacker !== caster) return 0;
        return this.ampPct;
    }
}

@registerModifier("modifier_evo_veno_symbiont_glands_buff")
export class modifier_evo_veno_symbiont_glands_buff extends BaseModifier {
    private msPct = 10;
    private asBonus = 15;
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
        return "venomancer_poison_sting";
    }
    OnCreated(): void {
        this.msPct = 10;
        this.asBonus = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.msPct = ab.GetSpecialValueFor("ally_ms_pct");
            this.asBonus = ab.GetSpecialValueFor("ally_as");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.asBonus;
    }
}

@registerModifier("modifier_evo_veno_t1_q_slow")
export class modifier_evo_veno_t1_q_slow extends BaseModifier {
    private slowPct = 25;
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
        this.slowPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.slowPct = ab.GetSpecialValueFor("slow_pct");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerModifier("modifier_evo_veno_chitin_shard")
export class modifier_evo_veno_chitin_shard extends BaseModifier {
    private armorPerStack = 1.5;

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
        return "viper_poison_attack";
    }
    OnCreated(): void {
        this.armorPerStack = 1.5;
        const caster = this.GetCaster();
        if (caster && !caster.IsNull()) {
            const tier = getVenoTier(caster);
            this.armorPerStack = tier >= 4 ? 2.5 : tier >= 3 ? 2.0 : 1.5;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -this.armorPerStack * Math.max(1, this.GetStackCount());
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -4 * Math.max(1, this.GetStackCount());
    }
}

@registerModifier("modifier_evo_veno_needle_q_slow")
export class modifier_evo_veno_needle_q_slow extends BaseModifier {
    private slowPct = 20;
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
        this.slowPct = 20;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.slowPct = ab.GetSpecialValueFor("slow_pct");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerModifier("modifier_evo_veno_needle_heal_cut")
export class modifier_evo_veno_needle_heal_cut extends BaseModifier {
    private cutPct = 25;
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
        this.cutPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("heal_cut_pct");
            if (v > 0) this.cutPct = v;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET")];
    }
    GetModifierHealAmplify_PercentageTarget(): number {
        return -this.cutPct;
    }
}

@registerModifier("modifier_evo_veno_spore_infection")
export class modifier_evo_veno_spore_infection extends BaseModifier {
    private mrLoss = 6;
    private msLoss = 15;

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
        return "venomancer_noxious_plague";
    }
    OnCreated(): void {
        this.mrLoss = 6;
        this.msLoss = 15;
        const caster = this.GetCaster();
        if (caster && !caster.IsNull()) {
            const tier = getVenoTier(caster);
            this.mrLoss = tier >= 4 ? 12 : tier >= 3 ? 9 : 6;
            this.msLoss = tier >= 4 ? 25 : tier >= 3 ? 20 : 15;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    GetModifierMagicalResistanceBonus(): number {
        return -this.mrLoss;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.msLoss;
    }
}

@registerModifier("modifier_evo_veno_tether_slow")
export class modifier_evo_veno_tether_slow extends BaseModifier {
    private slowPct = 25;
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
        return "venomancer_plague_ward";
    }
    OnCreated(): void {
        this.slowPct = 25;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerModifier("modifier_evo_veno_symbiont_pollen")
export class modifier_evo_veno_symbiont_pollen extends BaseModifier {
    private isAlly = false;
    private tier = 2;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return !this.isAlly;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "dazzle_shadow_wave";
    }
    OnCreated(): void {
        const parent = this.GetParent();
        const caster = this.GetCaster();
        this.isAlly =
            parent !== undefined &&
            caster !== undefined &&
            !parent.IsNull() &&
            !caster.IsNull() &&
            parent.GetTeamNumber() === caster.GetTeamNumber();
        this.tier = caster && !caster.IsNull() ? getVenoTier(caster) : 2;
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        if (this.isAlly) {
            return this.tier >= 4 ? 26 : this.tier >= 3 ? 20 : 14;
        }
        return -(this.tier >= 4 ? 35 : this.tier >= 3 ? 26 : 18);
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        if (this.isAlly) {
            return this.tier >= 4 ? 18 : this.tier >= 3 ? 14 : 10;
        }
        return -(this.tier >= 4 ? 22 : this.tier >= 3 ? 18 : 14);
    }
    GetModifierConstantHealthRegen(): number {
        if (!this.isAlly) return 0;
        return this.tier >= 4 ? 35 : this.tier >= 3 ? 25 : 15;
    }
    GetModifierHealAmplify_PercentageTarget(): number {
        if (this.isAlly) return 0;
        return -(this.tier >= 4 ? 35 : this.tier >= 3 ? 28 : 20);
    }
}

@registerModifier("modifier_evo_veno_symbiont_shield")
export class modifier_evo_veno_symbiont_shield extends BaseModifier {
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
        return "dazzle_shadow_wave";
    }
    OnCreated(params: { shield?: number }): void {
        if (IsServer() && params && params.shield !== undefined) {
            this.SetStackCount(params.shield);
        }
    }
    OnRefresh(params: { shield?: number }): void {
        if (IsServer() && params && params.shield !== undefined) {
            this.SetStackCount(Math.max(this.GetStackCount(), params.shield));
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
