import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier("modifier_evo_peace_time")
export class modifier_evo_peace_time extends BaseModifier {
    public IsHidden(): boolean {
        return false;
    }

    public IsPurgable(): boolean {
        return false;
    }

    public RemoveOnDeath(): boolean {
        return false;
    }

    public GetTexture(): string {
        return "omniknight_guardian_angel";
    }
}
