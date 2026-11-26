import {
    BaseModifier,
    dotaModifierFunction,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_debuffs";

LinkLuaModifier("modifier_evo_nyx_t1_burst_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_psi_resonance", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_acoustic_disruption", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_cicada_chitin_as", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerModifier("modifier_evo_nyx_t1_burst_slow")
export class modifier_evo_nyx_t1_burst_slow extends BaseModifier {
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
        return "nyx_assassin_vendetta";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerModifier("modifier_evo_nyx_psi_resonance")
export class modifier_evo_nyx_psi_resonance extends BaseModifier {
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
        return "nyx_assassin_jolt";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        if (this.GetStackCount() <= 0) {
            this.SetStackCount(1);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING"),
        ];
    }
    GetModifierMagicalResistanceBonus(): number {
        const s = Math.max(1, Math.min(3, this.GetStackCount()));
        return -(8 + (s - 1) * 3);
    }
    GetModifierPercentageManacostStacking(): number {
        const s = Math.max(1, Math.min(3, this.GetStackCount()));
        return -(15 + (s - 1) * 5);
    }
}

@registerModifier("modifier_evo_nyx_acoustic_disruption")
export class modifier_evo_nyx_acoustic_disruption extends BaseModifier {
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
        return "queenofpain_sonic_wave";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        if (this.GetStackCount() <= 0) {
            this.SetStackCount(1);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const s = Math.max(1, Math.min(3, this.GetStackCount()));
        return -(12 + (s - 1) * 4);
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const s = Math.max(1, Math.min(3, this.GetStackCount()));
        return -(15 + (s - 1) * 5);
    }
    GetModifierDamageOutgoing_Percentage(): number {
        const s = Math.max(1, Math.min(3, this.GetStackCount()));
        return -(6 + (s - 1) * 3);
    }
}

@registerModifier("modifier_evo_nyx_cicada_chitin_as")
export class modifier_evo_nyx_cicada_chitin_as extends BaseModifier {
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
        return "nyx_assassin_spiked_carapace";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.GetStackCount();
    }
}
