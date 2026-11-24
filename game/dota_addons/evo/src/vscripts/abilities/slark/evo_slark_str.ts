import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/slark/evo_slark_str";

const SLARK_STR_MODS: readonly string[] = [
    "modifier_evo_slark_str_q_leap",
    "modifier_evo_slark_str_q_armor",
    "modifier_evo_slark_str_q_shield",
    "modifier_evo_slark_str_w_slow",
    "modifier_evo_slark_str_e_passive",
    "modifier_evo_slark_str_e_fury",
    "modifier_evo_slark_str_r_clamp",
    "modifier_evo_slark_str_r_caster",
];

for (const modName of SLARK_STR_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_slark_str_q")
export class evo_slark_str_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const maxDist = this.GetSpecialValueFor("leap_distance");
        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const rawDist = delta.Length2D();
        const dir = rawDist > 1 ? delta.Normalized() : caster.GetForwardVector();
        const dist = Math.min(maxDist, Math.max(180, rawDist));
        const duration = Math.max(0.28, dist / 1500);

        caster.SetForwardVector(dir);
        caster.EmitSound("Hero_Slark.Pounce.Cast");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_str_q_leap", {
            duration,
            dir_x: dir.x,
            dir_y: dir.y,
            distance: dist,
        });
    }
}

@registerModifier("modifier_evo_slark_str_q_leap")
export class modifier_evo_slark_str_q_leap extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1500;
    private elapsed = 0;
    private totalDur = 0.4;

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
        const dist = params.distance ?? 600;
        this.totalDur = Math.max(0.2, this.GetDuration());
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
        nextPos.z = groundZ + Math.sin(t * Math.PI) * 165;
        parent.SetAbsOrigin(nextPos);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;
        FindClearSpaceForUnit(parent, parent.GetAbsOrigin(), true);

        const ab = this.GetAbility();
        if (!ab || ab.IsNull()) return;

        const level = ab.GetLevel();
        const radius = ab.GetSpecialValueFor("radius");
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const strPct = ab.GetSpecialValueFor("str_pct") / 100;
        const stunDur = ab.GetSpecialValueFor("stun_duration");
        const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dmg = baseDmg + str * strPct;

        parent.EmitSound("Hero_Slardar.Slithereen_Crush");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, radius, radius));
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
                damage: dmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            enemy.AddNewModifier(parent, ab, "modifier_stunned", { duration: stunDur });
            if (level >= 2) {
                enemy.AddNewModifier(parent, ab, "modifier_evo_slark_str_q_armor", { duration: 5.0 });
            }
        }

        if (level >= 3) {
            const shieldAmt = Math.floor(parent.GetMaxHealth() * 0.12);
            const shield = parent.AddNewModifier(parent, ab, "modifier_evo_slark_str_q_shield", { duration: 4.0 });
            if (shield !== undefined) {
                shield.SetStackCount(shieldAmt);
            }
        }
    }
}

@registerModifier("modifier_evo_slark_str_q_armor")
export class modifier_evo_slark_str_q_armor extends BaseModifier {
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
        return "slardar_slithereen_crush";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -4;
    }
}

@registerModifier("modifier_evo_slark_str_q_shield")
export class modifier_evo_slark_str_q_shield extends BaseModifier {
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
        return "slark_pounce";
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

@registerAbility("evo_slark_str_w")
export class evo_slark_str_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const level = this.GetLevel();
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        let totalDmg = baseDmg + str * strPct;

        if (level >= 2) {
            totalDmg += target.GetMaxHealth() * 0.06;
            target.AddNewModifier(caster, this, "modifier_evo_slark_str_w_slow", { duration: 3.0 });
        }

        const executeBonus = level >= 3 && target.GetHealthPercent() <= 40;
        if (executeBonus) {
            totalDmg *= 1.5;
        }

        caster.EmitSound("Hero_LifeStealer.OpenWounds.Cast");
        caster.PerformAttack(target, true, true, true, false, false, false, false);
        const dealt = ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: totalDmg,
            damage_type: DamageTypes.PHYSICAL,
        });

        const healRatio = executeBonus ? 1.0 : 0.45;
        if (dealt > 0) {
            caster.Heal(dealt * healRatio, this);
        }
    }
}

@registerModifier("modifier_evo_slark_str_w_slow")
export class modifier_evo_slark_str_w_slow extends BaseModifier {
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
        return "slark_fish_bait";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}

@registerAbility("evo_slark_str_e")
export class evo_slark_str_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_slark_str_e_passive";
    }
}

@registerModifier("modifier_evo_slark_str_e_passive")
export class modifier_evo_slark_str_e_passive extends BaseModifier {
    private lastReturnTime = -999;

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
        this.lastReturnTime = -999;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    private getLowHpMult(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull()) return 1;
        if (ab.GetLevel() >= 3 && parent.GetHealthPercent() <= 45) return 2;
        return 1;
    }
    GetModifierPhysicalArmorBonus(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("bonus_armor") * this.getLowHpMult();
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
        if (dist <= 350 && now - this.lastReturnTime >= 0.6) {
            this.lastReturnTime = now;
            const baseRet = ab.GetSpecialValueFor("return_damage");
            const str = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetStrength() : 0;
            const retDmg = (baseRet + str * 0.25) * this.getLowHpMult();
            ApplyDamage({
                victim: attacker,
                attacker: parent,
                ability: ab,
                damage: retDmg,
                damage_type: DamageTypes.PHYSICAL,
                damage_flags: DamageFlag.REFLECTION,
            });
        }

        if (ab.GetLevel() >= 2 && attacker.IsHero() && event.damage >= 20) {
            const ex = parent.FindModifierByName("modifier_evo_slark_str_e_fury");
            const next = Math.min(5, (ex ? ex.GetStackCount() : 0) + 1);
            const mod = parent.AddNewModifier(parent, ab, "modifier_evo_slark_str_e_fury", { duration: 6.0 });
            if (mod !== undefined) {
                mod.SetStackCount(next);
            }
        }
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        const fury = parent.FindModifierByName("modifier_evo_slark_str_e_fury");
        if (!fury) return;
        const pct = fury.GetStackCount() * 0.04;
        const heal = event.damage * pct;
        if (heal > 0) {
            parent.Heal(heal, ab);
        }
    }
}

@registerModifier("modifier_evo_slark_str_e_fury")
export class modifier_evo_slark_str_e_fury extends BaseModifier {
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
        return "slark_depth_shroud";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS")];
    }
    GetModifierBonusStats_Strength(): number {
        return this.GetStackCount() * 4;
    }
}

@registerAbility("evo_slark_str_r")
export class evo_slark_str_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Bane.FiendsGrip.Cast");
        target.AddNewModifier(caster, this, "modifier_evo_slark_str_r_clamp", { duration: dur });
        caster.AddNewModifier(caster, this, "modifier_evo_slark_str_r_caster", { duration: dur });
    }
}

@registerModifier("modifier_evo_slark_str_r_clamp")
export class modifier_evo_slark_str_r_clamp extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "slark_fish_bait";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
            [dotaModifierState("MODIFIER_STATE_DISARMED")]: true,
        };
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !caster || caster.IsNull() || !caster.IsAlive() || !ab) {
            this.Destroy();
            return;
        }
        const baseDps = ab.GetSpecialValueFor("base_dps");
        const strPct = ab.GetSpecialValueFor("str_pct") / 100;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const tickDmg = (baseDps + str * strPct) * 0.5;
        const dealt = ApplyDamage({
            victim: parent,
            attacker: caster,
            ability: ab,
            damage: tickDmg,
            damage_type: DamageTypes.PHYSICAL,
        });
        if (dealt > 0) {
            caster.Heal(dealt * 0.6, ab);
        }
    }
}

@registerModifier("modifier_evo_slark_str_r_caster")
export class modifier_evo_slark_str_r_caster extends BaseModifier {
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
        return "slark_fish_bait";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")];
    }
    GetModifierIncomingDamage_Percentage(): number {
        return -35;
    }
}
