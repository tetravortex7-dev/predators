import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier("modifier_evo_hero_tier")
export class modifier_evo_hero_tier extends BaseModifier {
    IsHidden(): boolean {
        return true;
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
    OnCreated(params: { tier?: number }): void {
        if (!IsServer()) return;
        if (params.tier !== undefined) {
            this.SetStackCount(params.tier);
        }
    }
    OnRefresh(params: { tier?: number }): void {
        if (!IsServer()) return;
        if (params.tier !== undefined) {
            this.SetStackCount(params.tier);
        }
    }
}
