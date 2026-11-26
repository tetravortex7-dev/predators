import {
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_debuffs";

LinkLuaModifier("modifier_evo_spectre_dagger_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_shadow_path", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_armor_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_reality_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_portal_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_break_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_polarity", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_mr_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_inv_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerModifier("modifier_evo_spectre_dagger_slow")
export class modifier_evo_spectre_dagger_slow extends BaseModifier {
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
        return "spectre_spectral_dagger";
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

@registerModifier("modifier_evo_spectre_shadow_path")
export class modifier_evo_spectre_shadow_path extends BaseModifier {
    private msPct = 16;
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
        return "spectre_spectral_dagger";
    }
    OnCreated(): void {
        this.msPct = 16;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.msPct = ab.GetSpecialValueFor("path_ms_pct");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
}

@registerModifier("modifier_evo_spectre_armor_shred")
export class modifier_evo_spectre_armor_shred extends BaseModifier {
    private shred = 4;
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
    OnCreated(params: { shred?: number }): void {
        this.shred = 4;
        if (params && params.shred !== undefined) {
            this.shred = params.shred;
        } else {
            const ab = this.GetAbility();
            if (ab && !ab.IsNull()) {
                const v = ab.GetSpecialValueFor("armor_shred");
                if (v > 0) this.shred = v;
            }
        }
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

@registerModifier("modifier_evo_spectre_reality_ms")
export class modifier_evo_spectre_reality_ms extends BaseModifier {
    private msPct = 25;
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
        return "spectre_reality";
    }
    OnCreated(): void {
        this.msPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("ms_pct");
            if (val > 0) this.msPct = val;
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
}

@registerModifier("modifier_evo_spectre_portal_slow")
export class modifier_evo_spectre_portal_slow extends BaseModifier {
    private slowPct = 15;
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
        return "spectre_haunt";
    }
    OnCreated(): void {
        this.slowPct = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("slow_pct");
            if (val > 0) this.slowPct = val;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.slowPct;
    }
}

@registerModifier("modifier_evo_spectre_bastion_slow")
export class modifier_evo_spectre_bastion_slow extends BaseModifier {
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
        return "abaddon_aphotic_shield";
    }
    OnCreated(): void {
        this.slowPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("slow_pct");
            if (val > 0) this.slowPct = val;
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

@registerModifier("modifier_evo_spectre_bastion_break_ms")
export class modifier_evo_spectre_bastion_break_ms extends BaseModifier {
    private msPct = 25;
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
        return "abaddon_frostmourne";
    }
    OnCreated(): void {
        this.msPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("break_ms_pct");
            if (val > 0) this.msPct = val;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
}

@registerModifier("modifier_evo_spectre_mirror_q_slow")
export class modifier_evo_spectre_mirror_q_slow extends BaseModifier {
    private slowPct = 24;
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
        return "void_spirit_aether_remnant";
    }
    OnCreated(): void {
        this.slowPct = 24;
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

@registerModifier("modifier_evo_spectre_mirror_polarity")
export class modifier_evo_spectre_mirror_polarity extends BaseModifier {
    private pct = 25;
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
        return "void_spirit_aether_remnant";
    }
    OnCreated(): void {
        this.pct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.pct = ab.GetSpecialValueFor("polarity_pct");
        }
        if (IsServer()) {
            this.SetStackCount(Math.round(this.pct));
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE")];
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const markedAttacker = this.GetParent();
        const spectre = this.GetCaster();
        const ability = this.GetAbility();
        if (!markedAttacker || markedAttacker.IsNull() || !spectre || spectre.IsNull() || !ability || ability.IsNull()) {
            return;
        }
        if (event.attacker !== markedAttacker) return;
        if (event.damage_type !== DamageTypes.PHYSICAL) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;
        const victim = event.unit;
        if (!victim || victim.IsNull() || victim === markedAttacker || victim === spectre) return;
        if (victim.GetTeamNumber() !== spectre.GetTeamNumber() || !victim.IsRealHero()) return;
        const raw = event.original_damage > 0 ? event.original_damage : event.damage;
        const reflected = (raw * Math.max(1, this.GetStackCount())) / 100;
        if (reflected <= 0.5 || !markedAttacker.IsAlive()) return;
        ApplyDamage({
            victim: markedAttacker,
            attacker: spectre,
            ability,
            damage: reflected,
            damage_type: DamageTypes.MAGICAL,
            damage_flags: (DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION) as DamageFlag,
        });
    }
}

@registerModifier("modifier_evo_spectre_mirror_mr_shred")
export class modifier_evo_spectre_mirror_mr_shred extends BaseModifier {
    private shred = 15;
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
        return "void_spirit_aether_remnant";
    }
    OnCreated(): void {
        this.shred = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("mr_shred");
            if (val > 0) this.shred = val;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        return -this.shred;
    }
}

@registerModifier("modifier_evo_spectre_mirror_inv_shred")
export class modifier_evo_spectre_mirror_inv_shred extends BaseModifier {
    private shred = 12;
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
        return "spectre_dispersion";
    }
    OnCreated(): void {
        this.shred = 12;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("mr_shred");
            if (val > 0) this.shred = val;
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        return -this.shred;
    }
}
