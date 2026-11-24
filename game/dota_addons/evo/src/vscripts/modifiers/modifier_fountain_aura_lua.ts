import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier("modifier_fountain_aura_lua")
export class modifier_fountain_aura_lua extends BaseModifier {
    public IsHidden(): boolean {
        return true;
    }

    public IsAura(): boolean {
        return true;
    }

    public GetModifierAura(): string {
        return "modifier_fountain_buff_lua";
    }

    public GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }

    public GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO | UnitTargetType.BASIC;
    }

    public GetAuraDuration(): number {
        return 0.1;
    }

    public GetAuraRadius(): number {
        return 1200;
    }
}
