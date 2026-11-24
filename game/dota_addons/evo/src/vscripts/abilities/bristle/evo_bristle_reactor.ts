import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/bristle/evo_bristle_reactor";

const REACTOR_MODS: readonly string[] = [
    "modifier_evo_bristle_react_catalyst",
    "modifier_evo_bristle_react_q_puddle",
    "modifier_evo_bristle_react_w_buff",
    "modifier_evo_bristle_react_e_passive",
    "modifier_evo_bristle_react_e_shield",
    "modifier_evo_bristle_react_e_cloud",
    "modifier_evo_bristle_react_e_stats",
    "modifier_evo_bristle_react_r_thinker",
];

for (const modName of REACTOR_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

const activePuddles: Set<CDOTA_BaseNPC> = new Set();
const activeReactorZones: Set<CDOTA_BaseNPC> = new Set();

export function getAllAttributesSum(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return hero.GetStrength() + hero.GetAgility() + hero.GetIntellect(false);
}

function applyCatalystStacks(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    count: number
): void {
    const eAb = caster.FindAbilityByName("evo_bristle_react_e");
    const lvl = eAb && !eAb.IsNull() ? eAb.GetLevel() : ability.GetLevel();
    const maxStacks = lvl >= 3 ? 6 : lvl >= 2 ? 5 : 4;
    const ex = target.FindModifierByName("modifier_evo_bristle_react_catalyst");
    const next = Math.min(maxStacks, (ex ? ex.GetStackCount() : 0) + count);
    const mod = target.AddNewModifier(caster, ability, "modifier_evo_bristle_react_catalyst", { duration: 5.0 });
    if (mod !== undefined) {
        mod.SetStackCount(next);
    }
}

@registerAbility("evo_bristle_react_q")
export class evo_bristle_react_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const pos = this.GetCursorPosition();
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_pct") / 100;
        const dmgBase = baseDmg + getAllAttributesSum(caster) * attrPct;

        caster.EmitSound("Hero_Alchemist.AcidSpray");
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
                damage: enemy.IsCreep() ? dmgBase * 1.3 : dmgBase,
                damage_type: DamageTypes.MAGICAL,
            });
            applyCatalystStacks(caster, enemy, this, 2);
        }

        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_bristle_react_q_puddle",
            { duration: 4.0 },
            pos,
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_bristle_react_catalyst")
export class modifier_evo_bristle_react_catalyst extends BaseModifier {
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
        return "alchemist_acid_spray";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    private getLevel(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetLevel() : 1;
    }
    GetModifierMagicalResistanceBonus(): number {
        const lvl = this.getLevel();
        const per = lvl >= 3 ? 6 : lvl >= 2 ? 5 : 4;
        return -per * this.GetStackCount();
    }
    GetModifierPhysicalArmorBonus(): number {
        return -1.5 * this.GetStackCount();
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -5 * this.GetStackCount();
    }
}

@registerModifier("modifier_evo_bristle_react_q_puddle")
export class modifier_evo_bristle_react_q_puddle extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            activePuddles.add(parent);
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
            ParticleManager.SetParticleControl(pfx, 1, Vector(260, 1, 1));
            ParticleManager.ReleaseParticleIndex(pfx);
        }
        this.StartIntervalThink(1.0);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent !== undefined) {
            activePuddles.delete(parent);
        }
    }
    IsAura(): boolean {
        const ab = this.GetAbility();
        return ab !== undefined && ab.GetLevel() >= 2;
    }
    GetModifierAura(): string {
        return "modifier_truesight";
    }
    GetAuraRadius(): number {
        return 260;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!caster || caster.IsNull() || !parent || parent.IsNull() || !ab) return;

        const dot = 25 + getAllAttributesSum(caster) * 0.08;
        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            260,
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
        }
    }
}

@registerAbility("evo_bristle_react_w")
export class evo_bristle_react_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const level = this.GetLevel();
        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const range = this.GetSpecialValueFor("range");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const attrPct = this.GetSpecialValueFor("attr_pct") / 100;
        const attrSum = getAllAttributesSum(caster);
        const dmg = baseDmg + attrSum * attrPct;

        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const dir = delta.Length2D() > 1 ? delta.Normalized() : caster.GetForwardVector();
        const adrMod = caster.FindModifierByName("modifier_evo_bristle_adrenaline_stack");
        const isFullCircle = level >= 3 && adrMod !== undefined && adrMod.GetStackCount() >= 5;

        caster.EmitSound("Hero_Bristleback.QuillSpray.Cast");
        const nearby = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            range,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        let hitAny = false;
        const stunDur = level >= 3 ? 0.8 : 0.6;
        for (const enemy of nearby) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const toEnemy = Vector(enemy.GetAbsOrigin().x - origin.x, enemy.GetAbsOrigin().y - origin.y, 0);
            const inCone = isFullCircle || (toEnemy.Length2D() > 0 && dir.x * toEnemy.Normalized().x + dir.y * toEnemy.Normalized().y >= 0.4);
            if (!inCone) continue;

            hitAny = true;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.PHYSICAL,
            });

            const cat = enemy.FindModifierByName("modifier_evo_bristle_react_catalyst");
            if (cat && cat.GetStackCount() >= 3) {
                enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            }
        }

        const puddleBlastBase = level >= 3 ? 180 : level >= 2 ? 130 : 80;
        const puddleBlast = puddleBlastBase + attrSum * 0.25;
        for (const puddle of [...activePuddles]) {
            if (!puddle || puddle.IsNull() || !IsValidEntity(puddle)) {
                activePuddles.delete(puddle);
                continue;
            }
            const pOrigin = puddle.GetAbsOrigin();
            const toPuddle = Vector(pOrigin.x - origin.x, pOrigin.y - origin.y, 0);
            if (toPuddle.Length2D() <= range && (isFullCircle || dir.x * toPuddle.Normalized().x + dir.y * toPuddle.Normalized().y >= 0.35)) {
                const victims = FindUnitsInRadius(
                    caster.GetTeamNumber(),
                    pOrigin,
                    undefined,
                    260,
                    UnitTargetTeam.ENEMY,
                    (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                    UnitTargetFlags.NONE,
                    FindOrder.ANY,
                    false
                );
                for (const v of victims) {
                    if (!v || v.IsNull() || !IsValidEntity(v) || !v.IsAlive()) continue;
                    ApplyDamage({
                        victim: v,
                        attacker: caster,
                        ability: this,
                        damage: puddleBlast,
                        damage_type: DamageTypes.MAGICAL,
                    });
                }
                puddle.RemoveModifierByName("modifier_evo_bristle_react_q_puddle");
                activePuddles.delete(puddle);
            }
        }

        for (const zone of [...activeReactorZones]) {
            if (!zone || zone.IsNull() || !IsValidEntity(zone)) {
                activeReactorZones.delete(zone);
                continue;
            }
            const zMod = zone.FindModifierByName("modifier_evo_bristle_react_r_thinker") as
                | modifier_evo_bristle_react_r_thinker
                | undefined;
            const toZone = Vector(zone.GetAbsOrigin().x - origin.x, zone.GetAbsOrigin().y - origin.y, 0);
            if (zMod && toZone.Length2D() <= range + 250) {
                zMod.triggerPulse();
            }
        }

        if (level >= 2 && hitAny) {
            caster.AddNewModifier(caster, this, "modifier_evo_bristle_react_w_buff", { duration: 2.5 });
        }
    }
}

@registerModifier("modifier_evo_bristle_react_w_buff")
export class modifier_evo_bristle_react_w_buff extends BaseModifier {
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
        return "bristleback_quill_spray";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 15;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return 25;
    }
}

@registerAbility("evo_bristle_react_e")
export class evo_bristle_react_e extends BaseAbility {
    GetBehavior(): AbilityBehavior {
        if (this.GetLevel() >= 2) {
            return (AbilityBehavior.NO_TARGET + AbilityBehavior.IMMEDIATE) as AbilityBehavior;
        }
        return AbilityBehavior.PASSIVE;
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_bristle_react_e_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster) || this.GetLevel() < 2) return;

        const adr = caster.FindModifierByName("modifier_evo_bristle_adrenaline_stack");
        const stacks = Math.max(1, adr ? adr.GetStackCount() : 1);
        const shieldPool = Math.floor((65 + getAllAttributesSum(caster) * 0.15) * stacks);

        caster.Purge(false, true, false, false, false);
        caster.EmitSound("Hero_Alchemist.ChemicalRage.Cast");

        const sMod = caster.AddNewModifier(caster, this, "modifier_evo_bristle_react_e_shield", { duration: 4.0 });
        if (sMod !== undefined) {
            sMod.SetStackCount(shieldPool);
        }

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            caster.GetAbsOrigin(),
            undefined,
            350,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            enemy.AddNewModifier(caster, this, "modifier_evo_bristle_react_e_cloud", { duration: 2.5 });
        }
    }
}

@registerModifier("modifier_evo_bristle_react_e_passive")
export class modifier_evo_bristle_react_e_passive extends BaseModifier {
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
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.GetLevel() < 3) return;
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            700,
            UnitTargetTeam.ENEMY,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        let totalStacks = 0;
        for (const e of enemies) {
            const c = e.FindModifierByName("modifier_evo_bristle_react_catalyst");
            if (c) totalStacks += c.GetStackCount();
        }
        const statBonus = Math.min(24, totalStacks * 2);
        if (statBonus > 0) {
            const m = parent.AddNewModifier(parent, ab, "modifier_evo_bristle_react_e_stats", { duration: 1.0 });
            if (m !== undefined) {
                m.SetStackCount(statBonus);
            }
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackRangeBonus(): number {
        return 125;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent || parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const baseOnHit = ab.GetSpecialValueFor("on_hit_damage");
        const dmg = baseOnHit + getAllAttributesSum(parent) * 0.1;
        ApplyDamage({
            victim: target,
            attacker: parent,
            ability: ab,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });
        applyCatalystStacks(parent, target, ab, 1);
    }
}

@registerModifier("modifier_evo_bristle_react_e_shield")
export class modifier_evo_bristle_react_e_shield extends BaseModifier {
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
        return "alchemist_chemical_rage";
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
            this.Destroy();
        } else {
            this.SetStackCount(rem);
        }
        return blocked;
    }
}

@registerModifier("modifier_evo_bristle_react_e_cloud")
export class modifier_evo_bristle_react_e_cloud extends BaseModifier {
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
        return "alchemist_acid_spray";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MISS_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
    GetModifierMiss_Percentage(): number {
        return 30;
    }
}

@registerModifier("modifier_evo_bristle_react_e_stats")
export class modifier_evo_bristle_react_e_stats extends BaseModifier {
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
        return "alchemist_chemical_rage";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.GetStackCount();
    }
    GetModifierBonusStats_Agility(): number {
        return this.GetStackCount();
    }
    GetModifierBonusStats_Intellect(): number {
        return this.GetStackCount();
    }
}

@registerAbility("evo_bristle_react_r")
export class evo_bristle_react_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const pos = this.GetCursorPosition();
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Alchemist.AcidSpray");
        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_bristle_react_r_thinker",
            { duration: dur },
            pos,
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_bristle_react_r_thinker")
export class modifier_evo_bristle_react_r_thinker extends BaseModifier {
    private radius = 500;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const ab = this.GetAbility();
        this.radius = ab ? ab.GetSpecialValueFor("radius") : 500;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            activeReactorZones.add(parent);
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
            ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, 1, 1));
            ParticleManager.ReleaseParticleIndex(pfx);
        }
        this.triggerPulse();
        this.StartIntervalThink(1.1);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent !== undefined) {
            activeReactorZones.delete(parent);
        }
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.triggerPulse();
    }
    public triggerPulse(): void {
        const caster = this.GetCaster();
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!caster || caster.IsNull() || !parent || parent.IsNull() || !ab) return;

        const origin = parent.GetAbsOrigin();
        const pulseDmg = 75 + getAllAttributesSum(caster) * 0.24;
        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            this.radius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            applyCatalystStacks(caster, enemy, ab, 1);
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: pulseDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            const toCenter = Vector(origin.x - enemy.GetAbsOrigin().x, origin.y - enemy.GetAbsOrigin().y, 0);
            const d = toCenter.Length2D();
            if (d > 60) {
                const dir = toCenter.Normalized();
                const pull = Math.min(100, d - 50);
                const pulled = Vector(
                    enemy.GetAbsOrigin().x + dir.x * pull,
                    enemy.GetAbsOrigin().y + dir.y * pull,
                    enemy.GetAbsOrigin().z
                );
                FindClearSpaceForUnit(enemy, pulled, true);
            }
        }
    }
}
