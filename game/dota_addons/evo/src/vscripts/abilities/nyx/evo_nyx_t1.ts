import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_t1";

LinkLuaModifier("modifier_evo_nyx_living_chitin", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_t1_chitin_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

function getHighestAttribute(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

export function addNyxChitinStacks(hero: CDOTA_BaseNPC, delta: number): void {
    const mod = hero.FindModifierByName("modifier_evo_nyx_living_chitin");
    if (!mod) return;
    const ab = mod.GetAbility();
    const maxStacks = ab ? ab.GetSpecialValueFor("max_stacks") : 3;
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
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
            dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const ability = this.GetAbility();
        const val = ability ? ability.GetSpecialValueFor("armor_per_stack") : 1.5;
        return this.GetStackCount() * val;
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

        this.SetStackCount(this.GetStackCount() - 1);
        const ability = this.GetAbility();
        const baseBlock = ability ? ability.GetSpecialValueFor("base_block") : 25;
        const attrPct = (ability ? ability.GetSpecialValueFor("block_attr_pct") : 30) / 100;
        const pulseDmg = ability ? ability.GetSpecialValueFor("pulse_damage") : 25;
        const pulseRadius = ability ? ability.GetSpecialValueFor("pulse_radius") : 250;

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
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: pulseDmg,
                damage_type: DamageTypes.MAGICAL,
            });
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
