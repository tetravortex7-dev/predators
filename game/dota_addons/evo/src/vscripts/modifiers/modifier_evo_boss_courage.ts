import {
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerModifier,
} from "../lib/dota_ts_adapter";

@registerModifier("modifier_evo_boss_courage")
export class modifier_evo_boss_courage extends BaseModifier {
    public IsHidden(): boolean {
        return false;
    }

    public IsPurgable(): boolean {
        return false;
    }

    public RemoveOnDeath(): boolean {
        return true;
    }

    public GetTexture(): string {
        return "bloodseeker_bloodrage";
    }

    public GetStatusEffectName(): string {
        return "particles/status_fx/status_effect_bloodrage.vpcf";
    }

    public StatusEffectPriority(): ModifierPriority {
        return ModifierPriority.HIGH;
    }

    public IsAura(): boolean {
        return true;
    }

    public GetAuraRadius(): number {
        return 900;
    }

    public GetModifierAura(): string {
        return "modifier_truesight";
    }

    public GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }

    public GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO | UnitTargetType.BASIC;
    }

    public GetAuraSearchFlags(): UnitTargetFlags {
        return UnitTargetFlags.MAGIC_IMMUNE_ENEMIES | UnitTargetFlags.INVULNERABLE;
    }

    public CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_CANNOT_MISS")]: true,
            [dotaModifierState("MODIFIER_STATE_UNSLOWABLE")]: true,
        };
    }

    public DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_MODEL_SCALE"),
        ];
    }

    public GetModifierBaseDamageOutgoing_Percentage(): number {
        return 35;
    }

    public GetModifierAttackSpeedBonus_Constant(): number {
        return 60;
    }

    public GetModifierMoveSpeedBonus_Constant(): number {
        return 65;
    }

    public GetModifierModelScale(): number {
        return 20;
    }
}
