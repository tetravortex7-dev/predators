import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";
import {
    addLivingChitinStacks,
    applyAcousticDisruption,
    applyPsiResonance,
    detectNyxBranchAndTier,
    findEnemiesInRadius,
    getLivingChitinStacks,
    getNyxAgi,
    getNyxAllAttrSum,
    getNyxHighestAttr,
} from "./evo_nyx_shared";
import "./evo_nyx_debuffs";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_t1";

LinkLuaModifier("modifier_evo_nyx_living_chitin", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_living_chitin")
export class evo_nyx_living_chitin extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_living_chitin";
    }
}

@registerAbility("evo_nyx_scarab_chitin")
export class evo_nyx_scarab_chitin extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_scarab_chitin_t4")
export class evo_nyx_scarab_chitin_t4 extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_mantis_chitin")
export class evo_nyx_mantis_chitin extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_mantis_chitin_t4")
export class evo_nyx_mantis_chitin_t4 extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_archon_chitin")
export class evo_nyx_archon_chitin extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_archon_chitin_t4")
export class evo_nyx_archon_chitin_t4 extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_cicada_chitin")
export class evo_nyx_cicada_chitin extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_cicada_chitin_t3")
export class evo_nyx_cicada_chitin_t3 extends evo_nyx_living_chitin {}

@registerAbility("evo_nyx_cicada_chitin_t4")
export class evo_nyx_cicada_chitin_t4 extends evo_nyx_living_chitin {}

@registerModifier("modifier_evo_nyx_living_chitin")
export class modifier_evo_nyx_living_chitin extends BaseModifier {
    private stackAccum = 0;
    private cicadaDistAccum = 0;
    private lastPos?: Vector;
    private lastPsiRestoreTime = -999;
    private empoweredUntil = -999;
    private empoweredAbilityName = "";
    private burnHeroRecords: Set<number> = new Set();

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
        this.stackAccum = 0;
        this.cicadaDistAccum = 0;
        this.lastPos = undefined;
        this.lastPsiRestoreTime = -999;
        this.empoweredUntil = -999;
        this.empoweredAbilityName = "";
        this.burnHeroRecords = new Set();
        if (!IsServer()) return;
        this.SetStackCount(1);
        this.lastPos = this.GetParent().GetAbsOrigin();
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !ability || ability.IsNull()) {
            return;
        }
        const info = detectNyxBranchAndTier(parent);
        const maxStacks = ability.GetSpecialValueFor("max_stacks");

        if (parent.IsAlive()) {
            this.stackAccum += 0.1;
            const interval = ability.GetSpecialValueFor("stack_interval");
            if (this.stackAccum >= interval) {
                this.stackAccum -= interval;
                if (this.GetStackCount() < maxStacks) {
                    this.IncrementStackCount();
                }
            }
            if (info.branch === "CICADA") {
                const pos = parent.GetAbsOrigin();
                if (this.lastPos) {
                    const delta = ((pos - this.lastPos) as Vector).Length2D();
                    if (delta > 0 && delta < 900) {
                        this.cicadaDistAccum += delta;
                        if (this.cicadaDistAccum >= 550) {
                            this.cicadaDistAccum -= 550;
                            if (this.GetStackCount() < maxStacks) {
                                this.IncrementStackCount();
                            }
                        }
                    }
                }
                this.lastPos = pos;
            } else {
                this.lastPos = parent.GetAbsOrigin();
            }
        } else {
            this.lastPos = parent.GetAbsOrigin();
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        return this.GetStackCount() * ability.GetSpecialValueFor("armor_per_stack");
    }
    GetModifierMagicalResistanceBonus(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        return this.GetStackCount() * ability.GetSpecialValueFor("mr_per_stack");
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        if (!ability || ability.IsNull()) return 0;
        const parent = this.GetParent();
        const stacks = this.GetStackCount();
        let bonus = stacks * ability.GetSpecialValueFor("ms_per_stack");
        const info = detectNyxBranchAndTier(parent);
        if (info.branch === "CICADA" && info.tier >= 3 && stacks >= 3) {
            bonus += info.tier >= 4 ? 18 : 12;
        }
        return bonus;
    }
    GetModifierBonusStats_Strength(): number {
        const info = detectNyxBranchAndTier(this.GetParent());
        if (info.branch !== "SCARAB" || info.tier < 3) return 0;
        return this.GetStackCount() * (info.tier >= 4 ? 7 : 4);
    }
    GetModifierStatusResistanceStacking(): number {
        const info = detectNyxBranchAndTier(this.GetParent());
        if (info.branch !== "SCARAB" || info.tier < 3) return 0;
        return this.GetStackCount() * (info.tier >= 4 ? 15 : 10);
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const info = detectNyxBranchAndTier(this.GetParent());
        if (info.branch !== "MANTIS" || info.tier < 3) return 0;
        return this.GetStackCount() * (info.tier >= 4 ? 16 : 10);
    }
    GetModifierSpellAmplification_Percentage(): number {
        const info = detectNyxBranchAndTier(this.GetParent());
        if (info.branch !== "ARCHON" || info.tier < 3) return 0;
        return this.GetStackCount() * (info.tier >= 4 ? 6 : 4);
    }
    GetModifierCastRangeBonusStacking(): number {
        const info = detectNyxBranchAndTier(this.GetParent());
        if (info.branch !== "ARCHON" || info.tier < 3 || this.GetStackCount() < 1) return 0;
        return info.tier >= 4 ? 225 : 150;
    }
    GetModifierTotal_ConstantBlock(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return 0;
        if (parent.PassivesDisabled()) return 0;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return 0;
        if (event.damage <= 0 || this.GetStackCount() <= 0) return 0;
        const info = detectNyxBranchAndTier(parent);
        if (info.branch === "CICADA" || info.tier >= 3) return 0;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsRealHero()) return 0;
        if (attacker.GetTeamNumber() === parent.GetTeamNumber()) return 0;

        this.DecrementStackCount();
        const attrVal = getNyxHighestAttr(parent);
        const block = ability.GetSpecialValueFor("base_block") + (attrVal * ability.GetSpecialValueFor("block_attr_pct")) / 100;
        const pulseDmg = ability.GetSpecialValueFor("pulse_damage");
        const pulseRadius = ability.GetSpecialValueFor("pulse_radius");

        parent.EmitSound("Hero_NyxAssassin.SpikedCarapace");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = findEnemiesInRadius(parent, parent.GetAbsOrigin(), pulseRadius);
        for (const enemy of enemies) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: pulseDmg,
                damage_type: DamageTypes.MAGICAL,
                damage_flags: DamageFlag.REFLECTION,
            });
        }
        return block;
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.attacker !== parent) return;
        const maxStacks = ability.GetSpecialValueFor("max_stacks");
        if (this.GetStackCount() < maxStacks) {
            this.IncrementStackCount();
        }
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.attacker !== parent || parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.GetTeamNumber() === parent.GetTeamNumber()) {
            return;
        }
        const info = detectNyxBranchAndTier(parent);
        if (info.branch === "MANTIS" && info.tier >= 3 && this.GetStackCount() >= 3 && !target.IsBuilding()) {
            const basePure = info.tier >= 4 ? 35 : 20;
            const pureDmg = basePure + getNyxAgi(parent) * 0.2;
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability,
                damage: pureDmg,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.NO_SPELL_AMPLIFICATION,
            });
        }
        if (info.branch === "CICADA" && this.GetStackCount() >= 3) {
            this.releaseCicadaSonicRing(parent, ability, info.tier, target.GetAbsOrigin());
        }
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.unit !== parent || parent.PassivesDisabled()) return;
        const castAb = event.ability;
        if (!castAb || castAb.IsNull() || castAb.IsItem() || castAb.IsToggle()) return;
        const abName = castAb.GetAbilityName();
        const info = detectNyxBranchAndTier(parent);

        if (info.branch === "ARCHON" && info.tier >= 3) {
            if ((abName === "lion_impale" || abName === "evo_nyx_archon_w") && this.GetStackCount() >= 1) {
                this.DecrementStackCount();
                this.empoweredUntil = GameRules.GetDOTATime(false, false) + 1.5;
                this.empoweredAbilityName = abName;
                this.burnHeroRecords = new Set();
            }
        }
        if (info.branch === "CICADA") {
            if (this.GetStackCount() >= 3) {
                this.releaseCicadaSonicRing(parent, ability, info.tier, parent.GetAbsOrigin());
            } else {
                const maxStacks = ability.GetSpecialValueFor("max_stacks");
                if (this.GetStackCount() < maxStacks) {
                    this.IncrementStackCount();
                }
            }
        }
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.attacker !== parent || parent.PassivesDisabled()) return;
        const victim = event.unit;
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || victim.GetTeamNumber() === parent.GetTeamNumber()) {
            return;
        }
        const inflictor = event.inflictor;
        if (!inflictor || inflictor.IsNull() || inflictor.IsItem()) return;

        const info = detectNyxBranchAndTier(parent);
        if (info.branch !== "ARCHON" || info.tier < 3) return;
        const now = GameRules.GetDOTATime(false, false);

        if (
            now <= this.empoweredUntil &&
            inflictor.GetAbilityName() === this.empoweredAbilityName &&
            victim.IsRealHero() &&
            !this.burnHeroRecords.has(victim.GetEntityIndex())
        ) {
            this.burnHeroRecords.add(victim.GetEntityIndex());
            const burnPct = info.tier >= 4 ? 0.09 : 0.06;
            const burn = victim.GetMaxMana() * burnPct;
            if (burn > 0) {
                victim.Script_ReduceMana(burn, inflictor);
                parent.GiveMana(burn * 0.5);
            }
            applyPsiResonance(parent, victim, inflictor, info.tier - 1);
        }

        if (victim.HasModifier("modifier_evo_nyx_psi_resonance") && now - this.lastPsiRestoreTime >= 3.0) {
            this.lastPsiRestoreTime = now;
            addLivingChitinStacks(parent, 1);
        }
    }
    private releaseCicadaSonicRing(
        parent: CDOTA_BaseNPC,
        ability: CDOTABaseAbility,
        tier: number,
        origin: Vector
    ): void {
        this.SetStackCount(0);
        const base = tier >= 4 ? 80 : tier >= 3 ? 45 : 35;
        const pct = tier >= 4 ? 0.35 : tier >= 3 ? 0.25 : 0.15;
        const dmg = base + getNyxAllAttrSum(parent) * pct;
        const debuffTier = Math.max(1, tier - 1);

        parent.EmitSound("Hero_QueenOfPain.SonicWave");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_razor/razor_plasmafield_shockwave.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, origin);
        ParticleManager.SetParticleControl(pfx, 1, Vector(325, 325, 1));
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = findEnemiesInRadius(parent, origin, 325);
        for (const enemy of enemies) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            applyAcousticDisruption(parent, enemy, ability, debuffTier);
        }

        if (tier >= 3) {
            const asMod = parent.AddNewModifier(parent, ability, "modifier_evo_nyx_cicada_chitin_as", {
                duration: 3.0,
            });
            if (asMod !== undefined) {
                asMod.SetStackCount(tier >= 4 ? 45 : 30);
            }
        }
    }
}

@registerAbility("evo_nyx_t1_chitin_burst")
export class evo_nyx_t1_chitin_burst extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!target || target.IsNull() || !IsValidEntity(target) || target.TriggerSpellAbsorb(this)) {
            return;
        }
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_pct") / 100;
        const dmg = baseDmg + getNyxHighestAttr(caster) * attrPct;

        caster.EmitSound("Hero_NyxAssassin.Vendetta.Crit");
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: dmg,
            damage_type: DamageTypes.PHYSICAL,
        });

        const stacks = getLivingChitinStacks(caster);
        if (stacks > 0) {
            addLivingChitinStacks(caster, -stacks);
            const burstDmg = stacks * this.GetSpecialValueFor("burst_per_stack");
            const radius = this.GetSpecialValueFor("burst_radius");
            const slowDuration = this.GetSpecialValueFor("slow_duration");
            const hitPos = target.GetAbsOrigin();

            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, hitPos);
            ParticleManager.ReleaseParticleIndex(pfx);

            for (const enemy of findEnemiesInRadius(caster, hitPos, radius)) {
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: burstDmg,
                    damage_type: DamageTypes.PURE,
                    damage_flags: DamageFlag.NO_SPELL_AMPLIFICATION,
                });
                enemy.AddNewModifier(caster, this, "modifier_evo_nyx_t1_burst_slow", {
                    duration: slowDuration,
                });
            }
        }

        if (isEvoCreepUnit(target) && (!target.IsAlive() || target.GetHealth() <= 0)) {
            addLivingChitinStacks(caster, 1);
        }
    }
}
