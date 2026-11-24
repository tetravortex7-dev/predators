import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis_ult";

const MANTIS_ULT_MODS: readonly string[] = [
    "modifier_evo_nyx_mantis_r_stealth",
    "modifier_evo_nyx_mantis_r_frenzy",
    "modifier_evo_nyx_mantis_r_break",
];

if (IsServer()) {
    for (const modName of MANTIS_ULT_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

function getAgi(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetAgility() : 0;
}

@registerAbility("evo_nyx_mantis_r")
export class evo_nyx_mantis_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dur = this.GetSpecialValueFor("stealth_duration");
        caster.EmitSound("Hero_NyxAssassin.Vendetta");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_r_stealth", { duration: dur });
    }
}

@registerModifier("modifier_evo_nyx_mantis_r_stealth")
export class modifier_evo_nyx_mantis_r_stealth extends BaseModifier {
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
        return "nyx_assassin_vendetta";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVISIBLE")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("bonus_ms_pct") : 35;
    }
    GetModifierInvisibilityLevel(): number {
        return 1;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        const target = event.target;
        if (target && !target.IsNull() && IsValidEntity(target) && !target.IsBuilding()) {
            const baseDmg = ab.GetSpecialValueFor("base_damage");
            const agiPct = ab.GetSpecialValueFor("agi_pct") / 100;
            const breakDur = ab.GetSpecialValueFor("break_duration");
            const frenzyDur = ab.GetSpecialValueFor("frenzy_duration");

            target.EmitSound("Hero_NyxAssassin.Vendetta.Crit");
            target.AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_r_break", { duration: breakDur });
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability: ab,
                damage: baseDmg + getAgi(parent) * agiPct,
                damage_type: DamageTypes.PURE,
            });
            parent.AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_r_frenzy", { duration: frenzyDur });
        }
        this.Destroy();
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        if (event.ability && event.ability.GetAbilityName() === "evo_nyx_mantis_r") return;
        this.Destroy();
    }
}

@registerModifier("modifier_evo_nyx_mantis_r_frenzy")
export class modifier_evo_nyx_mantis_r_frenzy extends BaseModifier {
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
        return "nyx_assassin_vendetta";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("frenzy_as") : 100;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        if (event.damage_type !== DamageTypes.PHYSICAL || event.damage <= 0) return;
        parent.Heal(event.damage * 0.25, this.GetAbility());
    }
}

@registerModifier("modifier_evo_nyx_mantis_r_break")
export class modifier_evo_nyx_mantis_r_break extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "nyx_assassin_vendetta";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_PASSIVES_DISABLED")]: true,
        };
    }
}
