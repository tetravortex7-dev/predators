import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { fireDreadnoughtQuillFan, grantBristleAdrenalineStacks } from "./evo_bristle_shared";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_dreadnought_er";

const DREAD_ER_MODS: readonly string[] = [
    "modifier_evo_bristle_dread_e_passive",
    "modifier_evo_bristle_dread_e_active",
    "modifier_evo_bristle_dread_e_slow",
    "modifier_evo_bristle_dread_r_ram",
];

for (const modName of DREAD_ER_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_bristle_dread_e")
export class evo_bristle_dread_e extends BaseAbility {
    GetBehavior(): AbilityBehavior {
        if (this.GetLevel() >= 2) {
            return (AbilityBehavior.NO_TARGET + AbilityBehavior.IMMEDIATE) as AbilityBehavior;
        }
        return AbilityBehavior.PASSIVE;
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_bristle_dread_e_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster) || this.GetLevel() < 2) return;

        const dur = this.GetSpecialValueFor("active_duration");
        const tauntDur = this.GetLevel() >= 3 ? 1.7 : 1.3;
        const baseShield = this.GetLevel() >= 3 ? 220 : 140;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const shieldPool = Math.floor(baseShield + str * 0.45);

        caster.EmitSound("Hero_Axe.Berserkers_Call");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_bristle_dread_e_active", { duration: dur });
        if (mod !== undefined) {
            mod.SetStackCount(shieldPool);
        }

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            caster.GetAbsOrigin(),
            undefined,
            375,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            enemy.SetForceAttackTarget(caster);
            enemy.SetContextThink(
                DoUniqueString("dread_taunt"),
                () => {
                    if (enemy && !enemy.IsNull() && IsValidEntity(enemy)) {
                        enemy.SetForceAttackTarget(undefined);
                    }
                    return undefined;
                },
                tauntDur
            );
        }
    }
}

@registerModifier("modifier_evo_bristle_dread_e_passive")
export class modifier_evo_bristle_dread_e_passive extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("bonus_armor");
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.unit !== parent || parent.PassivesDisabled()) return;
        if (event.damage_type !== DamageTypes.PHYSICAL) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;

        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return;
        if (attacker.GetTeamNumber() === parent.GetTeamNumber()) return;

        const dist = ((parent.GetAbsOrigin() - attacker.GetAbsOrigin()) as Vector).Length2D();
        if (dist <= 450) {
            const pct = ab.GetSpecialValueFor("reflect_pct") / 100;
            const ret = event.original_damage * pct;
            if (ret > 1) {
                ApplyDamage({
                    victim: attacker,
                    attacker: parent,
                    ability: ab,
                    damage: ret,
                    damage_type: DamageTypes.PHYSICAL,
                    damage_flags: DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION,
                });
            }
        }

        if (ab.GetLevel() >= 3 && parent.HasModifier("modifier_evo_bristle_dread_e_active")) {
            attacker.AddNewModifier(parent, ab, "modifier_evo_bristle_dread_e_slow", { duration: 2.0 });
        }
    }
}

@registerModifier("modifier_evo_bristle_dread_e_active")
export class modifier_evo_bristle_dread_e_active extends BaseModifier {
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
        return "bristleback_bristleback";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")];
    }
    GetModifierTotal_ConstantBlock(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const pool = this.GetStackCount();
        if (pool <= 0 || event.damage <= 0) return 0;
        const blocked = Math.min(pool, Math.ceil(event.damage));
        const rem = pool - blocked;
        if (rem <= 0) {
            this.SetStackCount(0);
        } else {
            this.SetStackCount(rem);
        }
        return blocked;
    }
}

@registerModifier("modifier_evo_bristle_dread_e_slow")
export class modifier_evo_bristle_dread_e_slow extends BaseModifier {
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
        return "bristleback_bristleback";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}

@registerAbility("evo_bristle_dread_r")
export class evo_bristle_dread_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.Purge(false, true, false, true, true);
        caster.EmitSound("Hero_Bristleback.Warpath.Cast");
        grantBristleAdrenalineStacks(caster, 2);
        caster.AddNewModifier(caster, this, "modifier_evo_bristle_dread_r_ram", { duration: dur });
    }
}

@registerModifier("modifier_evo_bristle_dread_r_ram")
export class modifier_evo_bristle_dread_r_ram extends BaseModifier {
    private lastQuillTime = -999;
    private hitCooldownByEnt: Map<EntityIndex, number> = new Map();

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
        return "bristleback_warpath";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.lastQuillTime = -999;
        this.hitCooldownByEnt = new Map();
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;
        const now = GameRules.GetDOTATime(false, false);

        if (now - this.lastQuillTime >= 0.8) {
            this.lastQuillTime = now;
            const wAb = parent.FindAbilityByName("evo_bristle_dread_w");
            if (wAb && !wAb.IsNull() && wAb.GetLevel() > 0) {
                fireDreadnoughtQuillFan(parent, wAb);
            }
        }

        const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const ramDmg = 90 + str * 0.45;
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            200,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const eid = enemy.entindex();
            const last = this.hitCooldownByEnt.get(eid) ?? -999;
            if (now - last < 2.5) continue;
            this.hitCooldownByEnt.set(eid, now);
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: ramDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            enemy.AddNewModifier(parent, ab, "modifier_stunned", { duration: 0.5 });
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_UNSLOWABLE")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 30;
    }
}
