import { BaseAbility, BaseModifier, dotaModifierFunction, registerAbility, registerModifier } from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_adaptive_essence";

LinkLuaModifier("modifier_evo_morph_adaptive_essence", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_morph_adaptive_essence")
export class evo_morph_adaptive_essence extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_morph_adaptive_essence";
    }
}

@registerModifier("modifier_evo_morph_adaptive_essence")
export class modifier_evo_morph_adaptive_essence extends BaseModifier {
    IsHidden(): boolean {
        return false;
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
    GetTexture(): string {
        return "morphling_morph_agi";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.updateMode();
        this.StartIntervalThink(0.5);
    }
    OnRefresh(): void {
        if (!IsServer()) return;
        this.updateMode();
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.updateMode();
    }
    private updateMode(): void {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsRealHero()) return;
        const hero = parent as CDOTA_BaseNPC_Hero;

        const waterE = hero.FindAbilityByName("evo_morph_water_e");
        if (waterE && !waterE.IsNull() && waterE.GetLevel() >= 2) {
            this.SetStackCount(4);
            return;
        }

        const bloodE = hero.FindAbilityByName("evo_morph_blood_e");
        if (bloodE && !bloodE.IsNull() && bloodE.GetLevel() >= 2) {
            const hpPct = hero.GetHealthPercent();
            const missingRatio = Math.min(1, Math.max(0, (100 - hpPct) / 65));
            const scale = Math.round((1 + missingRatio) * 100);
            this.SetStackCount(scale);
            return;
        }

        const voidE = hero.FindAbilityByName("evo_morph_void_e");
        if (voidE && !voidE.IsNull() && voidE.GetLevel() >= 2) {
            this.SetStackCount(5);
            return;
        }

        const str = hero.GetStrength();
        const agi = hero.GetAgility();
        const intVal = hero.GetIntellect(false);

        if (str >= agi && str >= intVal) {
            this.SetStackCount(1);
        } else if (agi >= str && agi >= intVal) {
            this.SetStackCount(2);
        } else {
            this.SetStackCount(3);
        }
    }
    private getStrScale(): number {
        const s = this.GetStackCount();
        if (s === 1 || s === 4) return 1.0;
        if (s >= 100 && s <= 200) return s / 100;
        return 0;
    }
    private hasAgi(): boolean {
        const s = this.GetStackCount();
        return s === 2 || s === 4;
    }
    private hasInt(): boolean {
        const s = this.GetStackCount();
        return s === 3 || s === 5;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_CASTER"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const mult = this.getStrScale();
        if (mult <= 0) return 0;
        const ability = this.GetAbility();
        const base = ability ? ability.GetSpecialValueFor("str_armor") : 4;
        return base * mult;
    }
    GetModifierConstantHealthRegen(): number {
        const mult = this.getStrScale();
        if (mult <= 0) return 0;
        const ability = this.GetAbility();
        const base = ability ? ability.GetSpecialValueFor("str_hp_regen") : 4;
        return base * mult;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        if (!this.hasAgi()) return 0;
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("agi_attack_speed") : 18;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        if (!this.hasAgi()) return 0;
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("agi_move_speed_pct") : 5;
    }
    GetModifierSpellAmplify_Percentage(): number {
        if (!this.hasInt()) return 0;
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("int_spell_amp") : 6;
    }
    GetModifierConstantManaRegen(): number {
        if (!this.hasInt()) return 0;
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("int_mana_regen") : 1.5;
    }
    GetModifierStatusResistanceCaster(): number {
        if (this.GetStackCount() !== 5) return 0;
        return -12;
    }
}
