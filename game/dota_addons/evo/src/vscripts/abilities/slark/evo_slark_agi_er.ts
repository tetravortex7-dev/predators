import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { grantSlarkAgiEssenceStack } from "./evo_slark_shared";

const SCRIPT_PATH = "abilities/slark/evo_slark_agi_er";

const SLARK_AGI_ER_MODS: readonly string[] = [
    "modifier_evo_slark_agi_e_passive",
    "modifier_evo_slark_agi_essence_buff",
    "modifier_evo_slark_agi_essence_debuff",
    "modifier_evo_slark_agi_r_shadow",
];

for (const modName of SLARK_AGI_ER_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_slark_agi_e")
export class evo_slark_agi_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_slark_agi_e_passive";
    }
}

@registerModifier("modifier_evo_slark_agi_e_passive")
export class modifier_evo_slark_agi_e_passive extends BaseModifier {
    private hitCounter = 0;
    private lastTargetId?: EntityIndex;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    OnCreated(): void {
        this.hitCounter = 0;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const inShadow = parent.HasModifier("modifier_evo_slark_agi_r_shadow");
        const baseStacks = inShadow ? 2 : 1;
        grantSlarkAgiEssenceStack(parent, target, baseStacks);

        const level = ab.GetLevel();
        if (level >= 2 && target.IsHero()) {
            const tid = target.entindex();
            if (this.lastTargetId === tid) {
                this.hitCounter += 1;
            } else {
                this.lastTargetId = tid;
                this.hitCounter = 1;
            }
            if (this.hitCounter >= 4) {
                this.hitCounter = 0;
                const agi = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetAgility() : 0;
                ApplyDamage({
                    victim: target,
                    attacker: parent,
                    ability: ab,
                    damage: 70 + agi * 0.6,
                    damage_type: DamageTypes.PHYSICAL,
                });
                grantSlarkAgiEssenceStack(parent, target, 1);
                target.EmitSound("Hero_Slark.EssenceShift");
            }
        }

        if (level >= 3) {
            const buff = parent.FindModifierByName("modifier_evo_slark_agi_essence_buff");
            if (buff && buff.GetStackCount() >= 10) {
                const heal = event.damage * 0.15;
                if (heal > 0) {
                    parent.Heal(heal, ab);
                }
            }
        }
    }
}

@registerModifier("modifier_evo_slark_agi_essence_buff")
export class modifier_evo_slark_agi_essence_buff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    GetModifierBonusStats_Agility(): number {
        return this.GetStackCount();
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ab = this.GetAbility();
        if (ab && ab.GetLevel() >= 3 && this.GetStackCount() >= 10) {
            return 10;
        }
        return 0;
    }
}

@registerModifier("modifier_evo_slark_agi_essence_debuff")
export class modifier_evo_slark_agi_essence_debuff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return -this.GetStackCount();
    }
    GetModifierBonusStats_Agility(): number {
        return -this.GetStackCount();
    }
    GetModifierBonusStats_Intellect(): number {
        return -this.GetStackCount();
    }
}

@registerAbility("evo_slark_agi_r")
export class evo_slark_agi_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Slark.ShadowDance");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_agi_r_shadow", { duration: dur });
    }
}

@registerModifier("modifier_evo_slark_agi_r_shadow")
export class modifier_evo_slark_agi_r_shadow extends BaseModifier {
    private pfx?: ParticleID;

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
        return "slark_shadow_dance";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            this.pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_slark/slark_shadow_dance.vpcf",
                ParticleAttachment.ABSORIGIN_FOLLOW,
                parent
            );
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        if (this.pfx !== undefined) {
            ParticleManager.DestroyParticle(this.pfx, false);
            ParticleManager.ReleaseParticleIndex(this.pfx);
            this.pfx = undefined;
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVISIBLE")]: true,
            [dotaModifierState("MODIFIER_STATE_TRUESIGHT_IMMUNE")]: true,
            [dotaModifierState("MODIFIER_STATE_UNTARGETABLE_ENEMY")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierInvisibilityLevel(): number {
        return 2;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 30;
    }
    GetModifierHealthRegenPercentage(): number {
        return 5;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return 50;
    }
}
