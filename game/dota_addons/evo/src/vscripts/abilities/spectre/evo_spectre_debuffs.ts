import {
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_debuffs";

LinkLuaModifier("modifier_evo_spectre_armor_shred", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_reality_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_portal_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_bastion_break_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

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
        return "evo_spectre_phantom_w";
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
        return "evo_spectre_phantom_d";
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
        return "evo_spectre_phantom_e";
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
        return "evo_spectre_bastion_q";
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
        return "evo_spectre_bastion_e";
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
    private slowPct = 14;
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
        return "evo_spectre_mirror_q";
    }
    OnCreated(): void {
        this.slowPct = 14;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const val = ab.GetSpecialValueFor("bonus_movespeed");
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
