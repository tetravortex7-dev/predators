import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    fireDreadnoughtQuillFan,
    getAllAttributesSum,
    grantBristleAdrenalineStacks,
} from "./evo_bristle_shared";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_t1";

LinkLuaModifier("modifier_evo_bristle_adrenaline", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_bristle_adrenaline_stack", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_bristle_t1_acid_spit", SCRIPT_PATH, LuaModifierMotionType.NONE);

function getHighestAttribute(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

@registerAbility("evo_bristle_adrenaline")
export class evo_bristle_adrenaline extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_bristle_adrenaline";
    }
}

@registerModifier("modifier_evo_bristle_adrenaline")
export class modifier_evo_bristle_adrenaline extends BaseModifier {
    private damageAccum = 0;
    private rearAbsorbAccum = 0;

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
        this.damageAccum = 0;
        this.rearAbsorbAccum = 0;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
        ];
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        if (!event.ability || event.ability.IsItem() || event.ability.IsToggle()) return;

        const reactE = parent.FindAbilityByName("evo_bristle_react_e");
        const stackMod = parent.FindModifierByName("modifier_evo_bristle_adrenaline_stack");
        if (
            reactE &&
            !reactE.IsNull() &&
            reactE.GetLevel() >= 2 &&
            stackMod &&
            stackMod.GetStackCount() >= 5 &&
            event.ability.GetAbilityName() !== "evo_bristle_react_w"
        ) {
            const manaCost = event.ability.GetManaCost(event.ability.GetLevel() - 1);
            if (manaCost > 0) {
                parent.GiveMana(manaCost);
            }
            const blastPos = event.target && !event.target.IsNull() ? event.target.GetAbsOrigin() : parent.GetAbsOrigin();
            const blastDmg = 80 + getAllAttributesSum(parent) * 0.25;
            const enemies = FindUnitsInRadius(
                parent.GetTeamNumber(),
                blastPos,
                undefined,
                325,
                UnitTargetTeam.ENEMY,
                (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                UnitTargetFlags.NONE,
                FindOrder.ANY,
                false
            );
            for (const e of enemies) {
                if (!e || e.IsNull() || !IsValidEntity(e) || !e.IsAlive()) continue;
                ApplyDamage({
                    victim: e,
                    attacker: parent,
                    ability: this.GetAbility(),
                    damage: blastDmg,
                    damage_type: DamageTypes.MAGICAL,
                });
            }
        }

        grantBristleAdrenalineStacks(parent, 1);
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.unit !== parent) return;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return;

        const dreadE = parent.FindAbilityByName("evo_bristle_dread_e");
        const dreadW = parent.FindAbilityByName("evo_bristle_dread_w");
        if (
            dreadE &&
            !dreadE.IsNull() &&
            dreadE.GetLevel() >= 2 &&
            dreadW &&
            !dreadW.IsNull() &&
            !parent.PassivesDisabled() &&
            bit.band(event.damage_flags, DamageFlag.REFLECTION) === 0
        ) {
            const forward = parent.GetForwardVector();
            const toAttacker = Vector(
                attacker.GetAbsOrigin().x - parent.GetAbsOrigin().x,
                attacker.GetAbsOrigin().y - parent.GetAbsOrigin().y,
                0
            ).Normalized();
            const dot = forward.x * toAttacker.x + forward.y * toAttacker.y;
            const full360 = dreadE.GetLevel() >= 3 && parent.HasModifier("modifier_evo_bristle_dread_e_active");
            if (dot <= -0.5 || full360) {
                const redPct = dreadE.GetLevel() >= 3 ? 0.32 : 0.24;
                this.rearAbsorbAccum += event.original_damage * redPct;
                if (this.rearAbsorbAccum >= 225) {
                    this.rearAbsorbAccum -= 225;
                    fireDreadnoughtQuillFan(parent, dreadW);
                }
            }
        }

        if (!attacker.IsHero() && !attacker.IsConsideredHero()) return;

        const ability = this.GetAbility();
        const threshold = ability ? ability.GetSpecialValueFor("damage_threshold") : 150;
        this.damageAccum += event.damage;
        if (this.damageAccum >= threshold) {
            const stacks = Math.floor(this.damageAccum / threshold);
            this.damageAccum = this.damageAccum % threshold;
            grantBristleAdrenalineStacks(parent, stacks);
        }
    }
    GetModifierIncomingDamage_Percentage(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const attacker = event.attacker;
        if (!parent || parent.IsNull() || !attacker || attacker.IsNull() || attacker === parent) return 0;
        if (parent.PassivesDisabled()) return 0;

        const ability = this.GetAbility();
        let rearPct = ability ? ability.GetSpecialValueFor("rear_reduction") : 12;
        let sidePct = ability ? ability.GetSpecialValueFor("side_reduction") : 6;
        const dreadE = parent.FindAbilityByName("evo_bristle_dread_e");
        let full360 = false;
        if (dreadE && !dreadE.IsNull() && dreadE.GetLevel() >= 2) {
            rearPct = dreadE.GetLevel() >= 3 ? 32 : 24;
            sidePct = dreadE.GetLevel() >= 3 ? 16 : 12;
            full360 = dreadE.GetLevel() >= 3 && parent.HasModifier("modifier_evo_bristle_dread_e_active");
        }

        if (full360) {
            return -rearPct;
        }

        const forward = parent.GetForwardVector();
        const toAttacker = Vector(
            attacker.GetAbsOrigin().x - parent.GetAbsOrigin().x,
            attacker.GetAbsOrigin().y - parent.GetAbsOrigin().y,
            0
        ).Normalized();
        const dot = forward.x * toAttacker.x + forward.y * toAttacker.y;

        if (dot <= -0.5) {
            return -rearPct;
        }
        if (dot <= 0.25) {
            return -sidePct;
        }
        return 0;
    }
}

@registerModifier("modifier_evo_bristle_adrenaline_stack")
export class modifier_evo_bristle_adrenaline_stack extends BaseModifier {
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
    CheckState(): Partial<Record<ModifierState, boolean>> {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || this.GetStackCount() < 5) return {};
        const crushE = parent.FindAbilityByName("evo_bristle_crush_e");
        if (crushE && !crushE.IsNull() && crushE.GetLevel() >= 2) {
            return { [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true };
        }
        return {};
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_SLOW_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const ability = this.GetAbility();
        const perStack = ability ? ability.GetSpecialValueFor("as_per_stack") : 12;
        return this.GetStackCount() * perStack;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        const perStack = ability ? ability.GetSpecialValueFor("ms_pct_per_stack") : 2.5;
        return this.GetStackCount() * perStack;
    }
    GetModifierPreAttack_BonusDamage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const crushE = parent.FindAbilityByName("evo_bristle_crush_e");
        if (!crushE || crushE.IsNull() || crushE.GetLevel() < 2) return 0;
        const per = crushE.GetLevel() >= 3 ? 10 : 6;
        return this.GetStackCount() * per;
    }
    GetModifierSlowResistance_Stacking(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || this.GetStackCount() < 5) return 0;
        const crushE = parent.FindAbilityByName("evo_bristle_crush_e");
        return crushE && !crushE.IsNull() && crushE.GetLevel() >= 2 ? 25 : 0;
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const reactE = parent.FindAbilityByName("evo_bristle_react_e");
        if (!reactE || reactE.IsNull() || reactE.GetLevel() < 2) return 0;
        const per = reactE.GetLevel() >= 3 ? 6 : 4;
        return this.GetStackCount() * per;
    }
    GetModifierConstantManaRegen(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const reactE = parent.FindAbilityByName("evo_bristle_react_e");
        if (!reactE || reactE.IsNull() || reactE.GetLevel() < 2) return 0;
        return this.GetStackCount() * 1.5;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        if (event.damage_type !== DamageTypes.PHYSICAL || event.damage <= 0) return;
        const crushE = parent.FindAbilityByName("evo_bristle_crush_e");
        if (!crushE || crushE.IsNull() || crushE.GetLevel() < 2) return;
        parent.Heal(event.damage * 0.02 * this.GetStackCount(), this.GetAbility());
    }
}

@registerAbility("evo_bristle_t1_acid_spit")
export class evo_bristle_t1_acid_spit extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;

        caster.EmitSound("Hero_Bristleback.ViscousGoo.Cast");
        ProjectileManager.CreateTrackingProjectile({
            Target: target,
            Source: caster,
            Ability: this,
            EffectName: "particles/units/heroes/hero_bristleback/bristleback_viscous_nasal_goo.vpcf",
            iMoveSpeed: 1000,
            bDodgeable: true,
            bProvidesVision: false,
            iSourceAttachment: ProjectileAttachment.ATTACK_1,
        });
    }
    OnProjectileHit(target: CDOTA_BaseNPC | undefined): boolean | void {
        if (!IsServer()) return true;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return true;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return true;
        if (target.TriggerSpellAbsorb(this)) return true;

        const baseDmg = this.GetSpecialValueFor("damage");
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const duration = this.GetSpecialValueFor("duration");
        const maxStacks = this.GetSpecialValueFor("max_stacks");
        const dmg = target.IsCreep() ? baseDmg * creepMult : baseDmg;

        target.EmitSound("Hero_Bristleback.ViscousGoo.Target");
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });

        const existing = target.FindModifierByName("modifier_evo_bristle_t1_acid_spit");
        const next = Math.min(maxStacks, (existing ? existing.GetStackCount() : 0) + 1);
        const mod = target.AddNewModifier(caster, this, "modifier_evo_bristle_t1_acid_spit", { duration });
        if (mod !== undefined) {
            mod.SetStackCount(next);
        }
        return true;
    }
}

@registerModifier("modifier_evo_bristle_t1_acid_spit")
export class modifier_evo_bristle_t1_acid_spit extends BaseModifier {
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
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        const slow = ability ? ability.GetSpecialValueFor("slow_pct") : 18;
        return -slow;
    }
    GetModifierPhysicalArmorBonus(): number {
        const ability = this.GetAbility();
        const armor = ability ? ability.GetSpecialValueFor("armor_per_stack") : 2;
        return -armor * this.GetStackCount();
    }
}

@registerAbility("evo_bristle_t1_quill_burst")
export class evo_bristle_t1_quill_burst extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_pct") / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const dmgBase = baseDmg + getHighestAttribute(caster) * attrPct;

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

        let hitCount = 0;
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            hitCount += 1;
            const dmg = enemy.IsCreep() ? dmgBase * creepMult : dmgBase;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.PHYSICAL,
            });
        }

        if (hitCount >= 3) {
            grantBristleAdrenalineStacks(caster, 1);
        }
    }
}
