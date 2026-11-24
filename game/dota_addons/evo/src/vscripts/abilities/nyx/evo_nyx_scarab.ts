import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { addNyxChitinStacks } from "./evo_nyx_t1";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_scarab";

const SCARAB_MODS: readonly string[] = [
    "modifier_evo_nyx_scarab_q_armor",
    "modifier_evo_nyx_scarab_w_buff",
    "modifier_evo_nyx_scarab_w_slow",
    "modifier_evo_nyx_scarab_e_passive",
    "modifier_evo_nyx_scarab_r_citadel",
];

for (const modName of SCARAB_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

function getStr(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetStrength() : 0;
}

@registerAbility("evo_nyx_scarab_q")
export class evo_nyx_scarab_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const level = this.GetLevel();
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const stunDur = this.GetSpecialValueFor("stun_duration");
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

        const totalDmg = baseDmg + getStr(caster) * strPct;
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

        let hitHero = false;
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            if (enemy.IsHero()) hitHero = true;

            if (level >= 2) {
                enemy.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_q_armor", { duration: 4.0 });
                const toCaster = Vector(origin.x - enemy.GetAbsOrigin().x, origin.y - enemy.GetAbsOrigin().y, 0);
                if (toCaster.Length2D() > 140) {
                    const pullDir = toCaster.Normalized();
                    const pulled = Vector(
                        enemy.GetAbsOrigin().x + pullDir.x * 130,
                        enemy.GetAbsOrigin().y + pullDir.y * 130,
                        enemy.GetAbsOrigin().z
                    );
                    FindClearSpaceForUnit(enemy, pulled, true);
                }
            }

            enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: enemy.IsCreep() ? totalDmg * creepMult : totalDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
        }

        if (level >= 3) {
            if (hitHero) {
                addNyxChitinStacks(caster, 2);
            }
            const shockPfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_sandking/sandking_epicenter_ring.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(shockPfx, 0, endPos);
            ParticleManager.ReleaseParticleIndex(shockPfx);

            const afterEnemies = FindUnitsInRadius(
                caster.GetTeamNumber(),
                endPos,
                undefined,
                260,
                UnitTargetTeam.ENEMY,
                (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                UnitTargetFlags.NONE,
                FindOrder.ANY,
                false
            );
            for (const enemy of afterEnemies) {
                if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: totalDmg * 0.5,
                    damage_type: DamageTypes.PHYSICAL,
                });
            }
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_q_armor")
export class modifier_evo_nyx_scarab_q_armor extends BaseModifier {
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
        return "nyx_assassin_impale";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -4;
    }
}

@registerAbility("evo_nyx_scarab_w")
export class evo_nyx_scarab_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const duration = this.GetSpecialValueFor("duration");
        const creepMult = this.GetSpecialValueFor("creep_mult");

        caster.EmitSound("Hero_NyxAssassin.SpikedCarapace");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_w_buff", { duration });

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            caster
        );
        ParticleManager.ReleaseParticleIndex(pfx);

        const totalDmg = baseDmg + getStr(caster) * strPct;
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
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: enemy.IsCreep() ? totalDmg * creepMult : totalDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_w_slow", { duration: 2.5 });
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_w_buff")
export class modifier_evo_nyx_scarab_w_buff extends BaseModifier {
    private stunnedAttacker = false;

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
        return "nyx_assassin_spiked_carapace";
    }
    OnCreated(): void {
        this.stunnedAttacker = false;
    }
    OnRefresh(): void {
        this.stunnedAttacker = false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierPhysicalArmorBonus(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("bonus_armor") : 6;
    }
    GetModifierStatusResistanceStacking(): number {
        const ab = this.GetAbility();
        return ab && ab.GetLevel() >= 3 ? 25 : 0;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.unit !== parent || event.damage <= 0) return;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return;
        if (!attacker.IsHero() && !attacker.IsConsideredHero()) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;

        const reflectPct = ab.GetSpecialValueFor("reflect_pct") / 100;
        const reflectDmg = event.original_damage * reflectPct;
        if (reflectDmg > 0) {
            ApplyDamage({
                victim: attacker,
                attacker: parent,
                ability: ab,
                damage: reflectDmg,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.REFLECTION,
            });
            if (ab.GetLevel() >= 3) {
                parent.Heal(reflectDmg * 0.3, ab);
            }
        }

        if (ab.GetLevel() >= 2 && !this.stunnedAttacker && attacker.IsAlive()) {
            this.stunnedAttacker = true;
            attacker.EmitSound("Hero_NyxAssassin.SpikedCarapace.Stun");
            attacker.AddNewModifier(parent, ab, "modifier_stunned", { duration: 1.2 });
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_w_slow")
export class modifier_evo_nyx_scarab_w_slow extends BaseModifier {
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
        return -25;
    }
}

@registerAbility("evo_nyx_scarab_e")
export class evo_nyx_scarab_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_scarab_e_passive";
    }
}

@registerModifier("modifier_evo_nyx_scarab_e_passive")
export class modifier_evo_nyx_scarab_e_passive extends BaseModifier {
    private lastThornsTime = -999;

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
        this.lastThornsTime = -999;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("bonus_str");
    }
    GetModifierConstantHealthRegen(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("hp_regen");
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.unit !== parent || parent.PassivesDisabled()) return;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent) return;
        if (attacker.GetTeamNumber() === parent.GetTeamNumber()) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;

        const now = GameRules.GetDOTATime(false, false);
        const dist = ((parent.GetAbsOrigin() - attacker.GetAbsOrigin()) as Vector).Length2D();
        if (dist <= 325 && now - (this.lastThornsTime ?? -999) >= 0.7) {
            this.lastThornsTime = now;
            const thornsBase = ab.GetSpecialValueFor("thorns_base");
            const thornsPct = ab.GetSpecialValueFor("thorns_str_pct") / 100;
            ApplyDamage({
                victim: attacker,
                attacker: parent,
                ability: ab,
                damage: thornsBase + getStr(parent) * thornsPct,
                damage_type: DamageTypes.PURE,
                damage_flags: DamageFlag.REFLECTION,
            });
        }
    }
}

@registerAbility("evo_nyx_scarab_r")
export class evo_nyx_scarab_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dur = this.GetSpecialValueFor("duration");
        const healPct = this.GetSpecialValueFor("heal_pct") / 100;

        caster.EmitSound("Hero_SandKing.Epicenter");
        caster.Heal(caster.GetMaxHealth() * healPct, this);
        addNyxChitinStacks(caster, 5);
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_r_citadel", { duration: dur });
    }
}

@registerModifier("modifier_evo_nyx_scarab_r_citadel")
export class modifier_evo_nyx_scarab_r_citadel extends BaseModifier {
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
        return "sandking_epicenter";
    }
    OnCreated(): void {
        this.bonusStr = 0;
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (parent && !parent.IsNull() && ab) {
            const pct = ab.GetSpecialValueFor("str_bonus_pct") / 100;
            this.bonusStr = Math.round(getStr(parent) * pct);
        }
        this.StartIntervalThink(1.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;

        const radius = ab.GetSpecialValueFor("pulse_radius");
        const baseDmg = ab.GetSpecialValueFor("pulse_damage");
        const strPct = ab.GetSpecialValueFor("pulse_str_pct") / 100;
        const totalDmg = baseDmg + getStr(parent) * strPct;

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_sandking/sandking_epicenter_ring.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.ReleaseParticleIndex(pfx);

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
                ability: ab,
                damage: totalDmg,
                damage_type: DamageTypes.PURE,
            });
            enemy.AddNewModifier(parent, ab, "modifier_evo_nyx_scarab_w_slow", { duration: 1.5 });
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.bonusStr ?? 0;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 20;
    }
}
