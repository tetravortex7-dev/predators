import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/slark/evo_slark_t1";

LinkLuaModifier("modifier_evo_slark_deep_predator", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_slark_deep_predator_active", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_slark_t1_leap_motion", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_slark_t1_leap_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_slark_t1_greedy_bite_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_slark_t1_greedy_bite_debuff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_slark_deep_predator")
export class evo_slark_deep_predator extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_slark_deep_predator";
    }
}

@registerModifier("modifier_evo_slark_deep_predator")
export class modifier_evo_slark_deep_predator extends BaseModifier {
    private unseenDuration = 0;

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
        if (!IsServer()) return;
        this.StartIntervalThink(0.25);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (parent.PassivesDisabled()) {
            this.unseenDuration = 0;
            return;
        }

        const myTeam = parent.GetTeamNumber();
        const enemyTeams: DotaTeam[] = [
            DotaTeam.GOODGUYS,
            DotaTeam.BADGUYS,
            DotaTeam.CUSTOM_1,
            DotaTeam.CUSTOM_2,
            DotaTeam.CUSTOM_3,
            DotaTeam.CUSTOM_4,
            DotaTeam.CUSTOM_5,
        ];

        let spotted = false;
        for (const team of enemyTeams) {
            if (team === myTeam) continue;
            if (CanTeamSeeUnit(team, parent)) {
                spotted = true;
                break;
            }
        }

        const ability = this.GetAbility();
        const delay = ability ? ability.GetSpecialValueFor("activation_delay") : 2.0;
        const linger = ability ? ability.GetSpecialValueFor("linger_duration") : 1.5;

        if (!spotted) {
            this.unseenDuration += 0.25;
            if (this.unseenDuration >= delay) {
                parent.AddNewModifier(parent, ability, "modifier_evo_slark_deep_predator_active", {
                    duration: linger,
                });
            }
        } else {
            this.unseenDuration = 0;
        }
    }
}

function CanTeamSeeUnit(team: DotaTeam, unit: CDOTA_BaseNPC): boolean {
    const heroes = FindUnitsInRadius(
        team,
        unit.GetAbsOrigin(),
        undefined,
        2000,
        UnitTargetTeam.FRIENDLY,
        UnitTargetType.HERO,
        UnitTargetFlags.NONE,
        FindOrder.ANY,
        false
    );
    for (const h of heroes) {
        if (h && !h.IsNull() && IsValidEntity(h) && h.CanEntityBeSeenByMyTeam(unit)) {
            return true;
        }
    }
    return false;
}

@registerModifier("modifier_evo_slark_deep_predator_active")
export class modifier_evo_slark_deep_predator_active extends BaseModifier {
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
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("bonus_ms_pct") : 14;
    }
    GetModifierHealthRegenPercentage(): number {
        const ability = this.GetAbility();
        return ability ? ability.GetSpecialValueFor("hp_regen_pct") : 2.5;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const agiE = parent.FindAbilityByName("evo_slark_agi_e");
        if (!agiE || agiE.IsNull()) return 0;
        if (agiE.GetLevel() >= 3) return 45;
        if (agiE.GetLevel() >= 2) return 25;
        return 0;
    }
    GetModifierPhysicalArmorBonus(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const strE = parent.FindAbilityByName("evo_slark_str_e");
        if (!strE || strE.IsNull()) return 0;
        if (strE.GetLevel() >= 3) return 12;
        if (strE.GetLevel() >= 2) return 6;
        return 0;
    }
    GetModifierStatusResistanceStacking(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const strE = parent.FindAbilityByName("evo_slark_str_e");
        if (!strE || strE.IsNull()) return 0;
        return strE.GetLevel() >= 3 ? 15 : 0;
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const intE = parent.FindAbilityByName("evo_slark_int_e");
        if (!intE || intE.IsNull()) return 0;
        if (intE.GetLevel() >= 3) return 18;
        if (intE.GetLevel() >= 2) return 10;
        return 0;
    }
    GetModifierConstantManaRegen(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const intE = parent.FindAbilityByName("evo_slark_int_e");
        if (!intE || intE.IsNull()) return 0;
        if (intE.GetLevel() >= 3) return 8;
        if (intE.GetLevel() >= 2) return 4;
        return 0;
    }
}

@registerAbility("evo_slark_t1_short_leap")
export class evo_slark_t1_short_leap extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dir = caster.GetForwardVector();
        const distance = this.GetSpecialValueFor("leap_distance");
        const duration = 0.36;

        caster.EmitSound("Hero_Slark.Pounce.Cast");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_t1_leap_motion", {
            duration,
            dir_x: dir.x,
            dir_y: dir.y,
            distance,
        });
    }
}

@registerModifier("modifier_evo_slark_t1_leap_motion")
export class modifier_evo_slark_t1_leap_motion extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1380;
    private elapsed = 0;
    private totalDur = 0.36;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
            [dotaModifierState("MODIFIER_STATE_COMMAND_RESTRICTED")]: true,
        };
    }
    OnCreated(params: { dir_x?: number; dir_y?: number; distance?: number }): void {
        if (!IsServer()) return;
        this.dirX = params.dir_x ?? 1;
        this.dirY = params.dir_y ?? 0;
        const dist = params.distance ?? 500;
        this.totalDur = Math.max(0.15, this.GetDuration());
        this.speed = dist / this.totalDur;
        this.elapsed = 0;
        this.StartIntervalThink(0.03);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) {
            this.Destroy();
            return;
        }
        this.elapsed += 0.03;
        const pos = parent.GetAbsOrigin();
        const step = this.speed * 0.03;
        const nextPos = Vector(pos.x + this.dirX * step, pos.y + this.dirY * step, pos.z);
        const groundZ = GetGroundHeight(nextPos, parent);
        const t = Math.min(1, this.elapsed / this.totalDur);
        const arc = Math.sin(t * Math.PI) * 140;
        nextPos.z = groundZ + arc;
        parent.SetAbsOrigin(nextPos);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;

        const landingPos = parent.GetAbsOrigin();
        FindClearSpaceForUnit(parent, landingPos, true);

        const ability = this.GetAbility();
        const radius = ability ? ability.GetSpecialValueFor("landing_radius") : 225;
        const damage = ability ? ability.GetSpecialValueFor("damage") : 70;
        const slowDur = ability ? ability.GetSpecialValueFor("slow_duration") : 2.5;

        parent.EmitSound("Hero_Slark.Pounce.Impact");
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
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
                attacker: parent,
                ability,
                damage,
                damage_type: DamageTypes.PHYSICAL,
            });
            enemy.AddNewModifier(parent, ability, "modifier_evo_slark_t1_leap_slow", { duration: slowDur });
        }
    }
}

@registerModifier("modifier_evo_slark_t1_leap_slow")
export class modifier_evo_slark_t1_leap_slow extends BaseModifier {
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
        return "slark_pounce";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerAbility("evo_slark_t1_greedy_bite")
export class evo_slark_t1_greedy_bite extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const bonusDmg = this.GetSpecialValueFor("bonus_damage");
        const baseSteal = this.GetSpecialValueFor("regen_steal");
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const duration = this.GetSpecialValueFor("duration");
        const stealAmount = target.IsCreep() ? Math.round(baseSteal * creepMult * 10) : Math.round(baseSteal * 10);

        caster.EmitSound("Hero_Slark.EssenceShift");
        caster.PerformAttack(target, true, true, true, false, false, false, false);
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: bonusDmg,
            damage_type: DamageTypes.PHYSICAL,
        });

        const buff = caster.AddNewModifier(caster, this, "modifier_evo_slark_t1_greedy_bite_buff", { duration });
        if (buff !== undefined) {
            buff.SetStackCount(stealAmount);
        }
        const debuff = target.AddNewModifier(caster, this, "modifier_evo_slark_t1_greedy_bite_debuff", { duration });
        if (debuff !== undefined) {
            debuff.SetStackCount(stealAmount);
        }
    }
}

@registerModifier("modifier_evo_slark_t1_greedy_bite_buff")
export class modifier_evo_slark_t1_greedy_bite_buff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")];
    }
    GetModifierConstantHealthRegen(): number {
        return this.GetStackCount() / 10;
    }
}

@registerModifier("modifier_evo_slark_t1_greedy_bite_debuff")
export class modifier_evo_slark_t1_greedy_bite_debuff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")];
    }
    GetModifierConstantHealthRegen(): number {
        return -(this.GetStackCount() / 10);
    }
}
