import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { grantBristleAdrenalineStacks } from "./evo_bristle_t1";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_dreadnought";

const DREAD_MODS: readonly string[] = [
    "modifier_evo_bristle_dread_q_debuff",
    "modifier_evo_bristle_dread_q_leash",
    "modifier_evo_bristle_dread_q_puddle",
    "modifier_evo_bristle_dread_w_quill",
    "modifier_evo_bristle_dread_w_dmg",
    "modifier_evo_bristle_dread_e_passive",
    "modifier_evo_bristle_dread_e_active",
    "modifier_evo_bristle_dread_e_slow",
    "modifier_evo_bristle_dread_r_ram",
];

if (IsServer()) {
    for (const modName of DREAD_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

const pushCooldownByEnt: Map<EntityIndex, number> = new Map();

export function fireDreadnoughtQuillFan(caster: CDOTA_BaseNPC, ability: CDOTABaseAbility): void {
    const level = ability.GetLevel();
    const radius = ability.GetSpecialValueFor("radius");
    const baseDmg = ability.GetSpecialValueFor("base_damage");
    const strPct = ability.GetSpecialValueFor("str_pct") / 100;
    const perStackBonus = ability.GetSpecialValueFor("stack_damage");
    const maxStacks = ability.GetSpecialValueFor("max_stacks");
    const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
    const rawBase = baseDmg + str * strPct;
    const now = GameRules.GetDOTATime(false, false);

    caster.EmitSound("Hero_Bristleback.QuillSpray.Cast");
    const pfx = ParticleManager.CreateParticle(
        "particles/units/heroes/hero_bristleback/bristleback_quill_spray.vpcf",
        ParticleAttachment.ABSORIGIN_FOLLOW,
        caster
    );
    ParticleManager.ReleaseParticleIndex(pfx);

    const enemies = FindUnitsInRadius(
        caster.GetTeamNumber(),
        caster.GetAbsOrigin(),
        undefined,
        radius,
        UnitTargetTeam.ENEMY,
        (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
        UnitTargetFlags.NONE,
        FindOrder.ANY,
        false
    );

    const casterOrigin = caster.GetAbsOrigin();
    for (const enemy of enemies) {
        if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
        const ex = enemy.FindModifierByName("modifier_evo_bristle_dread_w_quill");
        const curStacks = ex ? ex.GetStackCount() : 0;
        let dmg = rawBase + curStacks * perStackBonus;
        if (enemy.IsCreep()) {
            dmg *= 1.3;
        }
        ApplyDamage({
            victim: enemy,
            attacker: caster,
            ability,
            damage: dmg,
            damage_type: DamageTypes.PHYSICAL,
            damage_flags: level >= 2 ? DamageFlag.BYPASSES_ALL_BLOCK : DamageFlag.NONE,
        });

        const nextStacks = Math.min(maxStacks, curStacks + 1);
        const mod = enemy.AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_quill", { duration: 5.0 });
        if (mod !== undefined) {
            mod.SetStackCount(nextStacks);
        }

        if (level >= 2 && nextStacks >= 3) {
            enemy.AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_dmg", { duration: 3.0 });
        }

        if (level >= 3) {
            const dist = ((enemy.GetAbsOrigin() - casterOrigin) as Vector).Length2D();
            const eid = enemy.entindex();
            const lastPush = pushCooldownByEnt.get(eid) ?? -999;
            if (dist <= 225 && now - lastPush >= 4.0) {
                pushCooldownByEnt.set(eid, now);
                const pushDir =
                    dist > 1
                        ? Vector(
                              enemy.GetAbsOrigin().x - casterOrigin.x,
                              enemy.GetAbsOrigin().y - casterOrigin.y,
                              0
                          ).Normalized()
                        : caster.GetForwardVector();
                const targetPos = Vector(
                    enemy.GetAbsOrigin().x + pushDir.x * 110,
                    enemy.GetAbsOrigin().y + pushDir.y * 110,
                    enemy.GetAbsOrigin().z
                );
                FindClearSpaceForUnit(enemy, targetPos, true);
                enemy.Interrupt();
            }
        }
    }
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
