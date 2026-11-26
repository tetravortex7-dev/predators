import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { isFountainCombatLocked } from "../lib/fountain_combat_guard";

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
        return UnitTargetTeam.BOTH;
    }

    public GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO | UnitTargetType.BASIC;
    }

    public GetAuraSearchFlags(): UnitTargetFlags {
        return UnitTargetFlags.INVULNERABLE;
    }

    public GetAuraEntityReject(target: CDOTA_BaseNPC): boolean {
        if (!target || target.IsNull() || !IsValidEntity(target)) return true;
        const duelMgr = GameRules.EvoAddon?.duelManager;
        if (duelMgr && duelMgr.isActiveDuelist(target)) return true;
        const team = target.GetTeamNumber();
        if (team === DotaTeam.NEUTRALS || team === DotaTeam.CUSTOM_5 || team === DotaTeam.NOTEAM) {
            return true;
        }
        if (!PlayerResource.IsValidPlayerID(target.GetPlayerOwnerID())) return true;
        if (!target.HasModifier("modifier_fountain_buff_lua") && isFountainCombatLocked(target)) {
            return true;
        }
        return false;
    }

    public GetAuraDuration(): number {
        return 0.1;
    }

    public GetAuraRadius(): number {
        return 750;
    }
}
