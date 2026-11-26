import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";
import { grantBristleAdrenalineStacks } from "./evo_bristle_shared";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_crusher";

const CRUSH_MODS: readonly string[] = [
    "modifier_evo_bristle_crush_q_rush",
    "modifier_evo_bristle_crush_q_slow",
    "modifier_evo_bristle_crush_w_sunder",
    "modifier_evo_bristle_crush_e_passive",
    "modifier_evo_bristle_crush_r_frenzy",
];

for (const modName of CRUSH_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

function applySunderStacks(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, ability: CDOTABaseAbility, count: number): void {
    const ex = target.FindModifierByName("modifier_evo_bristle_crush_w_sunder");
    const next = Math.min(4, (ex ? ex.GetStackCount() : 0) + count);
    const mod = target.AddNewModifier(caster, ability, "modifier_evo_bristle_crush_w_sunder", { duration: 4.0 });
    if (mod !== undefined) {
        mod.SetStackCount(next);
    }
}

@registerAbility("evo_bristle_crush_q")
export class evo_bristle_crush_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Spirit_Breaker.ChargeOfDarkness");
        grantBristleAdrenalineStacks(caster, 2);
        caster.AddNewModifier(caster, this, "modifier_evo_bristle_crush_q_rush", { duration: dur });
    }
}

@registerModifier("modifier_evo_bristle_crush_q_rush")
export class modifier_evo_bristle_crush_q_rush extends BaseModifier {
    private usedStrike = false;

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
        return "spirit_breaker_charge_of_darkness";
    }
    OnCreated(): void {
        this.usedStrike = false;
    }
    OnRefresh(): void {
        this.usedStrike = false;
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("bonus_ms_pct") : 28;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer() || this.usedStrike) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        this.usedStrike = true;
        const level = ab.GetLevel();
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const strPct = ab.GetSpecialValueFor("str_pct") / 100;
        const stunDur = ab.GetSpecialValueFor("stun_duration");
        const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dmg = baseDmg + str * strPct;

        target.EmitSound("Hero_Earthshaker.Totem.Attack");
        target.AddNewModifier(parent, ab, "modifier_stunned", { duration: stunDur });

        const origin = parent.GetAbsOrigin();
        const dir = Vector(target.GetAbsOrigin().x - origin.x, target.GetAbsOrigin().y - origin.y, 0).Normalized();
        const nearby = FindUnitsInRadius(
            parent.GetTeamNumber(),
            origin,
            undefined,
            275,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        for (const enemy of nearby) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const toEnemy = Vector(enemy.GetAbsOrigin().x - origin.x, enemy.GetAbsOrigin().y - origin.y, 0);
            if (enemy === target || (toEnemy.Length2D() > 0 && dir.x * toEnemy.Normalized().x + dir.y * toEnemy.Normalized().y >= 0.35)) {
                ApplyDamage({
                    victim: enemy,
                    attacker: parent,
                    ability: ab,
                    damage: dmg,
                    damage_type: DamageTypes.PHYSICAL,
                });
                applySunderStacks(parent, enemy, ab, 2);
                if (level >= 2) {
                    enemy.AddNewModifier(parent, ab, "modifier_evo_bristle_crush_q_slow", { duration: 2.0 });
                }
            }
        }

        if (level >= 2) {
            const baseHeal = level >= 3 ? 100 : 60;
            parent.Heal(baseHeal + str * 0.25, ab);
        }

        this.Destroy();
    }
}

@registerModifier("modifier_evo_bristle_crush_q_slow")
export class modifier_evo_bristle_crush_q_slow extends BaseModifier {
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
        return "spirit_breaker_charge_of_darkness";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}

@registerAbility("evo_bristle_crush_w")
export class evo_bristle_crush_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        grantBristleAdrenalineStacks(caster, 1);
        this.performSweep(caster, 1.0);

        if (this.GetLevel() >= 3) {
            caster.SetContextThink(
                DoUniqueString("crush_w_echo"),
                () => {
                    if (caster && !caster.IsNull() && IsValidEntity(caster) && caster.IsAlive() && !this.IsNull()) {
                        this.performSweep(caster, 0.65);
                    }
                    return undefined;
                },
                0.35
            );
        }
    }
    private performSweep(caster: CDOTA_BaseNPC, scaleFactor: number): void {
        const level = this.GetLevel();
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dmgBase = (baseDmg + str * strPct) * scaleFactor;

        caster.EmitSound("Hero_Axe.CounterHelix");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_axe/axe_counterhelix.vpcf",
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
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const dmg = isEvoCreepUnit(enemy) ? dmgBase * 1.35 : dmgBase;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            if (level >= 2) {
                caster.PerformAttack(enemy, true, true, true, false, false, false, false);
            }
            applySunderStacks(caster, enemy, this, 1);
        }
    }
}

@registerModifier("modifier_evo_bristle_crush_w_sunder")
export class modifier_evo_bristle_crush_w_sunder extends BaseModifier {
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
        return "slardar_amplify_damage";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const wAb = caster && !caster.IsNull() ? caster.FindAbilityByName("evo_bristle_crush_w") : undefined;
        const lvl = wAb && !wAb.IsNull() ? wAb.GetLevel() : 1;
        const perStack = lvl >= 3 ? 18 : lvl >= 2 ? 14 : 10;
        if (!parent || parent.IsNull()) return 0;
        return -perStack * this.GetStackCount();
    }
    GetModifierIncomingDamage_Percentage(event: ModifierAttackEvent): number {
        if (event.damage_type !== DamageTypes.PHYSICAL) return 0;
        const caster = this.GetCaster();
        const wAb = caster && !caster.IsNull() ? caster.FindAbilityByName("evo_bristle_crush_w") : undefined;
        const lvl = wAb && !wAb.IsNull() ? wAb.GetLevel() : 1;
        const perStack = lvl >= 3 ? 9 : lvl >= 2 ? 7 : 5;
        return perStack * this.GetStackCount();
    }
}

@registerAbility("evo_bristle_crush_e")
export class evo_bristle_crush_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_bristle_crush_e_passive";
    }
}

@registerModifier("modifier_evo_bristle_crush_e_passive")
export class modifier_evo_bristle_crush_e_passive extends BaseModifier {
    private heroHitCount = 0;
    private creepHitCount = 0;

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
        this.heroHitCount = 0;
        this.creepHitCount = 0;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        ];
    }
    GetModifierStatusResistanceStacking(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || ab.GetLevel() < 3) return 0;
        if (parent.PassivesDisabled()) return 0;
        const hpPct = parent.GetHealthPercent();
        if (hpPct >= 100) return 0;
        const ratio = Math.min(1, Math.max(0, (100 - hpPct) / 65));
        return Math.round(35 * ratio);
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent || parent.PassivesDisabled()) return;
        if (event.damage_type !== DamageTypes.PHYSICAL || event.damage <= 0) return;

        let lifesteal = ab.GetSpecialValueFor("lifesteal_pct") / 100;
        if (ab.GetLevel() >= 3) {
            const ratio = Math.min(1, Math.max(0, (100 - parent.GetHealthPercent()) / 65));
            lifesteal += 0.45 * ratio;
        }
        const victim = event.unit;
        if (isEvoCreepUnit(victim)) {
            lifesteal *= 0.5;
        }
        parent.Heal(event.damage * lifesteal, ab);
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent || parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const cleavePct = ab.GetSpecialValueFor("cleave_pct") / 100;
        const cleaveDmg = event.damage * cleavePct;
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            target.GetAbsOrigin(),
            undefined,
            275,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive() || enemy === target) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: cleaveDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
        }

        const level = ab.GetLevel();
        if (level >= 2) {
            if (target.IsHero()) {
                this.heroHitCount += 1;
            } else {
                this.creepHitCount += 1;
            }
            if (this.heroHitCount >= 4 || this.creepHitCount >= 6) {
                if (this.heroHitCount >= 4) this.heroHitCount = 0;
                if (this.creepHitCount >= 6) this.creepHitCount = 0;
                const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
                const spikeDmg = 55 + str * 0.3;
                const aoe = FindUnitsInRadius(
                    parent.GetTeamNumber(),
                    parent.GetAbsOrigin(),
                    undefined,
                    300,
                    UnitTargetTeam.ENEMY,
                    (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                    UnitTargetFlags.NONE,
                    FindOrder.ANY,
                    false
                );
                parent.EmitSound("Hero_Bristleback.QuillSpray.Cast");
                for (const enemy of aoe) {
                    if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
                    ApplyDamage({
                        victim: enemy,
                        attacker: parent,
                        ability: ab,
                        damage: spikeDmg,
                        damage_type: DamageTypes.PHYSICAL,
                    });
                    applySunderStacks(parent, enemy, ab, 1);
                }
            }
        }

        if (parent.HasModifier("modifier_evo_bristle_crush_r_frenzy")) {
            const sunder = target.FindModifierByName("modifier_evo_bristle_crush_w_sunder");
            if (sunder && sunder.GetStackCount() >= 4) {
                const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
                ApplyDamage({
                    victim: target,
                    attacker: parent,
                    ability: ab,
                    damage: 45 + str * 0.25,
                    damage_type: DamageTypes.PURE,
                });
            }
        }
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const victim = event.unit;
        if (!victim || victim.IsNull() || !victim.IsHero()) return;
        const qAb = parent.FindAbilityByName("evo_bristle_crush_q");
        if (qAb && !qAb.IsNull() && qAb.GetLevel() >= 3) {
            const rem = qAb.GetCooldownTimeRemaining();
            if (rem > 0) {
                qAb.EndCooldown();
                qAb.StartCooldown(Math.max(0.1, rem * 0.3));
            }
        }
    }
}

@registerAbility("evo_bristle_crush_r")
export class evo_bristle_crush_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Bristleback.Warpath.Cast");
        grantBristleAdrenalineStacks(caster, 10);
        caster.AddNewModifier(caster, this, "modifier_evo_bristle_crush_r_frenzy", { duration: dur });
    }
}

@registerModifier("modifier_evo_bristle_crush_r_frenzy")
export class modifier_evo_bristle_crush_r_frenzy extends BaseModifier {
    private bonusStr = 0;

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
        this.bonusStr = 0;
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull() && parent.IsRealHero()) {
            this.bonusStr = Math.round((parent as CDOTA_BaseNPC_Hero).GetStrength() * 0.25);
        }
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull() && IsValidEntity(parent) && parent.IsAlive()) {
            grantBristleAdrenalineStacks(parent, 1);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.bonusStr;
    }
    GetModifierAttackRangeBonus(): number {
        return 225;
    }
}
