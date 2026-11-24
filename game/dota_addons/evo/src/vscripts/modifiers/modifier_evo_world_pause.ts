import { BaseModifier, dotaModifierState, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier("modifier_evo_world_pause")
export class modifier_evo_world_pause extends BaseModifier {
    public IsHidden(): boolean {
        return false;
    }

    public IsPurgable(): boolean {
        return false;
    }

    public IsDebuff(): boolean {
        return false;
    }

    public CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_STUNNED")]: true,
            [dotaModifierState("MODIFIER_STATE_INVULNERABLE")]: true,
            [dotaModifierState("MODIFIER_STATE_COMMAND_RESTRICTED")]: true,
            [dotaModifierState("MODIFIER_STATE_ATTACK_IMMUNE")]: true,
            [dotaModifierState("MODIFIER_STATE_MAGIC_IMMUNE")]: true,
            [dotaModifierState("MODIFIER_STATE_FROZEN")]: true,
        };
    }
}
