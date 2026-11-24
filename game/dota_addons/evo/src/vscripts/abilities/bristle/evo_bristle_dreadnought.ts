import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { fireDreadnoughtQuillFan } from "./evo_bristle_shared";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_dreadnought";

const DREAD_QW_MODS: readonly string[] = [
    "modifier_evo_bristle_dread_q_debuff",
    "modifier_evo_bristle_dread_q_leash",
    "modifier_evo_bristle_dread_q_puddle",
    "modifier_evo_bristle_dread_w_quill",
    "modifier_evo_bristle_dread_w_dmg",
];

for (const modName of DREAD_QW_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_bristle_dread_q")
export class evo_bristle_dread_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const pos = this.GetCursorPosition();
        const level = this.GetLevel();
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dmg = baseDmg + str * strPct;

        caster.EmitSound("Hero_Bristleback.ViscousGoo.Cast");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_bristleback/bristleback_viscous_nasal_goo.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, pos);
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            pos,
            undefined,
            radius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            const ex = enemy.FindModifierByName("modifier_evo_bristle_dread_q_debuff");
            const next = Math.min(4, (ex ? ex.GetStackCount() : 0) + 1);
            const mod = enemy.AddNewModifier(caster, this, "modifier_evo_bristle_dread_q_debuff", { duration: 5.0 });
            if (mod !== undefined) {
                mod.SetStackCount(next);
            }
            if (level >= 2 && !ex) {
                enemy.AddNewModifier(caster, this, "modifier_evo_bristle_dread_q_leash", { duration: 1.2 });
            }
        }

        if (level >= 3) {
            CreateModifierThinker(
                caster,
                this,
                "modifier_evo_bristle_dread_q_puddle",
                { duration: 3.5 },
                pos,
                caster.GetTeamNumber(),
                false
            );
        }
    }
}

@registerModifier("modifier_evo_bristle_dread_q_debuff")
export class modifier_evo_bristle_dread_q_debuff extends BaseModifier {
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
        return "bristleback_viscous_nasal_goo";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_TURN_RATE_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ab = this.GetAbility();
        return -(ab ? ab.GetSpecialValueFor("slow_pct") : 22);
    }
    GetModifierPhysicalArmorBonus(): number {
        const ab = this.GetAbility();
        return -(ab ? ab.GetSpecialValueFor("armor_per_stack") : 2) * this.GetStackCount();
    }
    GetModifierTurnRate_Percentage(): number {
        const ab = this.GetAbility();
        return ab && ab.GetLevel() >= 2 ? -35 : 0;
    }
}

@registerModifier("modifier_evo_bristle_dread_q_leash")
export class modifier_evo_bristle_dread_q_leash extends BaseModifier {
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
        return "bristleback_viscous_nasal_goo";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_TETHERED")]: true,
        };
    }
}

@registerModifier("modifier_evo_bristle_dread_q_puddle")
export class modifier_evo_bristle_dread_q_puddle extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!caster || caster.IsNull() || !parent || parent.IsNull() || !ab) return;

        const radius = ab.GetSpecialValueFor("radius");
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dot = 35 + str * 0.2;
        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            radius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: dot,
                damage_type: DamageTypes.MAGICAL,
            });
            const ex = enemy.FindModifierByName("modifier_evo_bristle_dread_q_debuff");
            const next = Math.min(4, Math.max(1, ex ? ex.GetStackCount() : 1));
            const mod = enemy.AddNewModifier(caster, ab, "modifier_evo_bristle_dread_q_debuff", { duration: 5.0 });
            if (mod !== undefined) {
                mod.SetStackCount(next);
            }
        }
    }
}

@registerAbility("evo_bristle_dread_w")
export class evo_bristle_dread_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        fireDreadnoughtQuillFan(caster, this);
    }
}

@registerModifier("modifier_evo_bristle_dread_w_quill")
export class modifier_evo_bristle_dread_w_quill extends BaseModifier {
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
        return "bristleback_quill_spray";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -1.5 * this.GetStackCount();
    }
}

@registerModifier("modifier_evo_bristle_dread_w_dmg")
export class modifier_evo_bristle_dread_w_dmg extends BaseModifier {
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
        return "bristleback_quill_spray";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE")];
    }
    GetModifierTotalDamageOutgoing_Percentage(): number {
        return -15;
    }
}
