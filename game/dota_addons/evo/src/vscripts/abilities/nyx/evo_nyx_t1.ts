import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_t1";

if (IsServer()) {
    LinkLuaModifier("modifier_evo_nyx_living_chitin", SCRIPT_PATH, LuaModifierMotionType.NONE);
    LinkLuaModifier("modifier_evo_nyx_t1_chitin_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
}

function getHighestAttribute(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

export function getNyxMaxChitinPlates(hero: CDOTA_BaseNPC, ability?: CDOTABaseAbility): number {
    const baseMax = ability ? ability.GetSpecialValueFor("max_stacks") : 3;
    const scarabE = hero.FindAbilityByName("evo_nyx_scarab_e");
    if (scarabE && !scarabE.IsNull() && scarabE.GetLevel() >= 2) {
        return 5;
    }
    return baseMax;
}

export function addNyxChitinStacks(hero: CDOTA_BaseNPC, delta: number): void {
    const mod = hero.FindModifierByName("modifier_evo_nyx_living_chitin");
    if (!mod) return;
    const ab = mod.GetAbility();
    const maxStacks = getNyxMaxChitinPlates(hero, ab);
    mod.SetStackCount(Math.min(maxStacks, Math.max(0, mod.GetStackCount() + delta)));
}

@registerAbility("evo_nyx_living_chitin")
export class evo_nyx_living_chitin extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_living_chitin";
    }
}

@registerModifier("modifier_evo_nyx_living_chitin")
export class modifier_evo_nyx_living_chitin extends BaseModifier {
    private lastFreeBlockTime = -999;
    private archonCastCounter = 0;

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
        return "nyx_assassin_spiked_carapace";
    }
    OnCreated(): void {
        this.lastFreeBlockTime = -999;
        this.archonCastCounter = 0;
        if (!IsServer()) return;
        const ability = this.GetAbility();
        const interval = ability ? ability.GetSpecialValueFor("stack_interval") : 6.0;
        this.SetStackCount(1);
        this.StartIntervalThink(interval);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        addNyxChitinStacks(parent, 1);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_EVASION_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
            dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        const base = ability ? ability.GetSpecialValueFor("armor_per_stack") : 1.5;
        const scarabE = parent && !parent.IsNull() ? parent.FindAbilityByName("evo_nyx_scarab_e") : undefined;
        const mult = scarabE && !scarabE.IsNull() && scarabE.GetLevel() >= 2 ? 2 : 1;
        return this.GetStackCount() * base * mult;
    }
    GetModifierMagicalResistanceBonus(): number {
        const ability = this.GetAbility();
        const val = ability ? ability.GetSpecialValueFor("mr_per_stack") : 3;
        return this.GetStackCount() * val;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        const val = ability ? ability.GetSpecialValueFor("ms_per_stack") : 3;
        return this.GetStackCount() * val;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const mantisE = parent.FindAbilityByName("evo_nyx_mantis_e");
        if (mantisE && !mantisE.IsNull() && mantisE.GetLevel() >= 2) {
            return this.GetStackCount() * 12;
        }
        return 0;
    }
    GetModifierEvasion_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const mantisE = parent.FindAbilityByName("evo_nyx_mantis_e");
        if (mantisE && !mantisE.IsNull() && mantisE.GetLevel() >= 2) {
            return this.GetStackCount() * 4;
        }
        return 0;
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const archonE = parent.FindAbilityByName("evo_nyx_archon_e");
        if (archonE && !archonE.IsNull() && archonE.GetLevel() >= 2) {
            return this.GetStackCount() * 3;
        }
        return 0;
    }
    GetModifierConstantManaRegen(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return 0;
        const archonE = parent.FindAbilityByName("evo_nyx_archon_e");
        if (archonE && !archonE.IsNull() && archonE.GetLevel() >= 2) {
            return this.GetStackCount() * 2.5;
        }
        return 0;
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        if (!event.ability || event.ability.IsItem() || event.ability.IsToggle()) return;
        const archonE = parent.FindAbilityByName("evo_nyx_archon_e");
        if (archonE && !archonE.IsNull() && archonE.GetLevel() >= 2) {
            this.archonCastCounter += 1;
            if (this.archonCastCounter >= 2) {
                this.archonCastCounter = 0;
                addNyxChitinStacks(parent, 1);
            }
        }
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        if (event.unit === parent) return;
        addNyxChitinStacks(parent, 1);
    }
    GetModifierTotal_ConstantBlock(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const attacker = event.attacker;
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return 0;
        if (parent.PassivesDisabled()) return 0;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return 0;
        if (!attacker.IsHero() && !attacker.IsConsideredHero()) return 0;
        if (this.GetStackCount() <= 0 || event.damage < 10) return 0;

        const mantisE = parent.FindAbilityByName("evo_nyx_mantis_e");
        const now = GameRules.GetDOTATime(false, false);
        let consumeStack = true;
        if (mantisE && !mantisE.IsNull() && mantisE.GetLevel() >= 3 && parent.GetHealthPercent() >= 70) {
            if (now - this.lastFreeBlockTime >= 2.5) {
                this.lastFreeBlockTime = now;
                consumeStack = false;
            }
        }
        if (consumeStack) {
            this.SetStackCount(this.GetStackCount() - 1);
        }

        const ability = this.GetAbility();
        const baseBlock = ability ? ability.GetSpecialValueFor("base_block") : 25;
        const attrPct = (ability ? ability.GetSpecialValueFor("block_attr_pct") : 30) / 100;
        const pulseDmg = ability ? ability.GetSpecialValueFor("pulse_damage") : 25;
        const pulseRadius = ability ? ability.GetSpecialValueFor("pulse_radius") : 250;

        const scarabE = parent.FindAbilityByName("evo_nyx_scarab_e");
        const archonE = parent.FindAbilityByName("evo_nyx_archon_e");
        const scarabLvl = scarabE && !scarabE.IsNull() ? scarabE.GetLevel() : 0;
        const archonLvl = archonE && !archonE.IsNull() ? archonE.GetLevel() : 0;

        if (scarabLvl >= 2 && attacker.IsAlive()) {
            const strVal = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
            ApplyDamage({
                victim: attacker,
                attacker: parent,
                ability,
                damage: 40 + strVal * 0.45,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.REFLECTION,
            });
        }

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            pulseRadius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        const intVal = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: pulseDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            if (scarabLvl >= 3) {
                enemy.AddNewModifier(parent, ability, "modifier_stunned", { duration: 0.35 });
            }
            if (archonLvl >= 3 && ability && enemy.IsHero() && enemy.GetMaxMana() > 0) {
                const manaDrain = 40 + intVal * 0.35;
                enemy.Script_ReduceMana(manaDrain, ability);
            }
        }

        return baseBlock + getHighestAttribute(parent) * attrPct;
    }
}

@registerAbility("evo_nyx_t1_burrow_spike")
export class evo_nyx_t1_burrow_spike extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const stunDur = this.GetSpecialValueFor("stun_duration");
        const baseDmg = this.GetSpecialValueFor("damage");
        const creepMult = this.GetSpecialValueFor("creep_mult");

        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const dir = delta.Length2D() > 1 ? delta.Normalized() : caster.GetForwardVector();
        const endPos = Vector(origin.x + dir.x * range, origin.y + dir.y * range, origin.z);

        caster.EmitSound("Hero_NyxAssassin.Impale");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_impale.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.SetParticleControl(pfx, 1, endPos);
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = FindUnitsInLine(
            caster.GetTeamNumber(),
            origin,
            endPos,
            undefined,
            width,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE
        );

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const dmg = enemy.IsCreep() ? baseDmg * creepMult : baseDmg;
            enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.PURE,
            });
        }
    }
}

@registerAbility("evo_nyx_t1_chitin_burst")
export class evo_nyx_t1_chitin_burst extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_pct") / 100;
        const burstPerStack = this.GetSpecialValueFor("burst_per_stack");
        const burstRadius = this.GetSpecialValueFor("burst_radius");
        const slowDuration = this.GetSpecialValueFor("slow_duration");

        const chitinMod = caster.FindModifierByName("modifier_evo_nyx_living_chitin");
        const consumed = chitinMod ? chitinMod.GetStackCount() : 0;
        if (chitinMod && consumed > 0) {
            chitinMod.SetStackCount(0);
        }

        caster.EmitSound("Hero_NyxAssassin.Vendetta.Crit");
        const hitDmg = baseDmg + getHighestAttribute(caster) * attrPct;
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: hitDmg,
            damage_type: DamageTypes.PHYSICAL,
        });

        let killedCreep = !target.IsAlive() && target.IsCreep();

        if (consumed > 0) {
            const burstDmg = consumed * burstPerStack;
            const enemies = FindUnitsInRadius(
                caster.GetTeamNumber(),
                target.GetAbsOrigin(),
                undefined,
                burstRadius,
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
                    damage: burstDmg,
                    damage_type: DamageTypes.PURE,
                });
                enemy.AddNewModifier(caster, this, "modifier_evo_nyx_t1_chitin_slow", { duration: slowDuration });
                if (!enemy.IsAlive() && enemy.IsCreep()) {
                    killedCreep = true;
                }
            }
        }

        if (killedCreep) {
            addNyxChitinStacks(caster, 1);
        }
    }
}

@registerModifier("modifier_evo_nyx_t1_chitin_slow")
export class modifier_evo_nyx_t1_chitin_slow extends BaseModifier {
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
        return "nyx_assassin_spiked_carapace";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}
