import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_blood";

const BLOOD_MODS: readonly string[] = [
    "modifier_evo_morph_bleed",
    "modifier_evo_morph_blood_shield",
    "modifier_evo_morph_blood_e_passive",
    "modifier_evo_morph_blood_e_active",
    "modifier_evo_morph_blood_r_tether",
    "modifier_evo_morph_blood_r_caster",
];

for (const modName of BLOOD_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerModifier("modifier_evo_morph_bleed")
export class modifier_evo_morph_bleed extends BaseModifier {
    private lastPos?: Vector;
    private dps = 25;
    private isMoving = false;
    private slowOnMove = false;

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
        return "bloodseeker_rupture";
    }
    OnCreated(params: { dps?: number; slow_on_move?: number }): void {
        if (!IsServer()) return;
        this.isMoving = false;
        this.dps = params.dps ?? 25;
        this.slowOnMove = (params.slow_on_move ?? 0) === 1;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            this.lastPos = parent.GetAbsOrigin();
        }
        this.StartIntervalThink(1.0);
    }
    OnRefresh(params: { dps?: number; slow_on_move?: number }): void {
        if (!IsServer()) return;
        if (params.dps !== undefined && params.dps > this.dps) {
            this.dps = params.dps;
        }
        if ((params.slow_on_move ?? 0) === 1) {
            this.slowOnMove = true;
        }
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        const curPos = parent.GetAbsOrigin();
        const moved = this.lastPos ? ((curPos - this.lastPos) as Vector).Length2D() : 0;
        this.lastPos = curPos;
        this.isMoving = moved > 35;

        if (this.slowOnMove && this.isMoving && this.GetRemainingTime() < 7.5) {
            this.SetDuration(this.GetRemainingTime() + 0.3, true);
        }

        ApplyDamage({
            victim: parent,
            attacker: caster && !caster.IsNull() ? caster : parent,
            ability: this.GetAbility(),
            damage: this.dps,
            damage_type: DamageTypes.PHYSICAL,
        });
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.slowOnMove && this.isMoving ? -18 : 0;
    }
}

@registerAbility("evo_morph_blood_q")
export class evo_morph_blood_q extends BaseAbility {
    CastFilterResultTarget(target: CDOTA_BaseNPC): UnitFilterResult {
        if (!IsServer()) return UnitFilterResult.SUCCESS;
        const caster = this.GetCaster();
        if (target === caster) return UnitFilterResult.FAIL_CUSTOM;
        if (target.GetTeamNumber() === caster.GetTeamNumber() && this.GetLevel() < 3) {
            return UnitFilterResult.FAIL_FRIENDLY;
        }
        return UnitFilterResult.SUCCESS;
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;

        const isEnemy = target.GetTeamNumber() !== caster.GetTeamNumber();
        if (isEnemy && target.TriggerSpellAbsorb(this)) return;

        const targetPos = target.GetAbsOrigin();
        const dir = Vector(
            targetPos.x - caster.GetAbsOrigin().x,
            targetPos.y - caster.GetAbsOrigin().y,
            0
        ).Normalized();
        const blinkPos = Vector(targetPos.x - dir.x * 90, targetPos.y - dir.y * 90, targetPos.z);

        FindClearSpaceForUnit(caster, blinkPos, true);
        caster.SetForwardVector(dir);
        caster.EmitSound("Hero_PhantomAssassin.Strike.Start");

        if (!isEnemy) return;

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const bleedDps = this.GetSpecialValueFor("bleed_dps");
        const bleedDur = this.GetSpecialValueFor("bleed_duration");
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;

        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: baseDmg + str * strPct,
            damage_type: DamageTypes.PHYSICAL,
        });
        target.AddNewModifier(caster, this, "modifier_evo_morph_bleed", {
            duration: bleedDur,
            dps: bleedDps,
            slow_on_move: this.GetLevel() >= 2 ? 1 : 0,
        });
        caster.MoveToTargetToAttack(target);
    }
}

@registerAbility("evo_morph_blood_w")
export class evo_morph_blood_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;

        const level = this.GetLevel();
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const strPct = this.GetSpecialValueFor("str_pct") / 100;
        const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
        const dmg = baseDmg + str * strPct;

        caster.EmitSound("Hero_Bloodseeker.BloodBath");
        const victims: CDOTA_BaseNPC[] = [];

        if (level === 1) {
            if (!target.TriggerSpellAbsorb(this)) {
                victims.push(target);
            }
        } else {
            const origin = caster.GetAbsOrigin();
            const dir = Vector(
                target.GetAbsOrigin().x - origin.x,
                target.GetAbsOrigin().y - origin.y,
                0
            ).Normalized();
            const range = this.GetSpecialValueFor("range");
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
            for (const enemy of nearby) {
                if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
                const toEnemy = Vector(enemy.GetAbsOrigin().x - origin.x, enemy.GetAbsOrigin().y - origin.y, 0);
                if (enemy === target || (toEnemy.Length2D() > 0 && dir.x * toEnemy.Normalized().x + dir.y * toEnemy.Normalized().y >= 0.45)) {
                    victims.push(enemy);
                }
            }
        }

        let totalHeal = 0;
        for (const v of victims) {
            const dealt = ApplyDamage({
                victim: v,
                attacker: caster,
                ability: this,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            const ratio = v.IsHero() || level === 1 ? 0.5 : 0.25;
            totalHeal += dealt * ratio;
        }

        if (totalHeal > 0) {
            const missingHp = Math.max(0, caster.GetMaxHealth() - caster.GetHealth());
            caster.Heal(totalHeal, this);
            const overheal = totalHeal - missingHp;
            if (level >= 3 && overheal > 0) {
                const cap = Math.floor(caster.GetMaxHealth() * 0.25);
                const existing = caster.FindModifierByName("modifier_evo_morph_blood_shield");
                const currentShield = existing ? existing.GetStackCount() : 0;
                const nextShield = Math.min(cap, Math.floor(currentShield + overheal));
                const mod = caster.AddNewModifier(caster, this, "modifier_evo_morph_blood_shield", { duration: 6.0 });
                if (mod !== undefined) {
                    mod.SetStackCount(nextShield);
                }
            }
        }
    }
}

@registerModifier("modifier_evo_morph_blood_shield")
export class modifier_evo_morph_blood_shield extends BaseModifier {
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
        return "bloodseeker_bloodrage";
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

@registerAbility("evo_morph_blood_e")
export class evo_morph_blood_e extends BaseAbility {
    GetBehavior(): AbilityBehavior {
        if (this.GetLevel() >= 2) {
            return (AbilityBehavior.NO_TARGET + AbilityBehavior.IMMEDIATE) as AbilityBehavior;
        }
        return AbilityBehavior.PASSIVE;
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_morph_blood_e_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster) || this.GetLevel() < 2) return;
        const hpCost = Math.floor(caster.GetHealth() * 0.1);
        if (hpCost > 0 && caster.GetHealth() > hpCost + 1) {
            caster.SetHealth(caster.GetHealth() - hpCost);
        }
        caster.EmitSound("Hero_Bloodseeker.Bloodrage");
        caster.AddNewModifier(caster, this, "modifier_evo_morph_blood_e_active", { duration: 8.0 });
    }
}

@registerModifier("modifier_evo_morph_blood_e_active")
export class modifier_evo_morph_blood_e_active extends BaseModifier {
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
        return "bloodseeker_thirst";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 15;
    }
}

@registerModifier("modifier_evo_morph_blood_e_passive")
export class modifier_evo_morph_blood_e_passive extends BaseModifier {
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
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull()) return 0;
        const baseAs = ab.GetSpecialValueFor("bonus_as");
        const mult = parent.HasModifier("modifier_evo_morph_blood_e_active") ? 2 : 1;
        return baseAs * mult;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !target.HasModifier("modifier_evo_morph_bleed")) return;
        const ab = this.GetAbility();
        if (!ab || ab.IsNull()) return;
        const pct = ab.GetSpecialValueFor("lifesteal_pct") / 100;
        const mult = parent.HasModifier("modifier_evo_morph_blood_e_active") ? 2 : 1;
        const heal = event.damage * pct * mult;
        if (heal > 0) {
            parent.Heal(heal, ab);
        }
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || ab.GetLevel() < 3) return;
        if (event.attacker !== parent) return;
        const dead = event.unit;
        if (!dead || dead.IsNull() || !dead.HasModifier("modifier_evo_morph_bleed")) return;
        const q = parent.FindAbilityByName("evo_morph_blood_q");
        if (q && !q.IsNull()) {
            q.EndCooldown();
        }
        parent.Heal(parent.GetMaxHealth() * 0.2, ab);
    }
}

@registerAbility("evo_morph_blood_r")
export class evo_morph_blood_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Bloodseeker.Rupture.Cast");
        target.AddNewModifier(caster, this, "modifier_evo_morph_blood_r_tether", { duration: dur });
        target.AddNewModifier(caster, this, "modifier_evo_morph_bleed", {
            duration: dur,
            dps: 70,
            slow_on_move: 1,
        });
        caster.AddNewModifier(caster, this, "modifier_evo_morph_blood_r_caster", {
            duration: dur,
            target_idx: target.entindex(),
        });
    }
}

@registerModifier("modifier_evo_morph_blood_r_tether")
export class modifier_evo_morph_blood_r_tether extends BaseModifier {
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
        return "bloodseeker_rupture";
    }
}

@registerModifier("modifier_evo_morph_blood_r_caster")
export class modifier_evo_morph_blood_r_caster extends BaseModifier {
    private targetIndex?: EntityIndex;

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
        return "bloodseeker_rupture";
    }
    OnCreated(params: { target_idx?: number }): void {
        if (!IsServer()) return;
        this.targetIndex = params.target_idx as EntityIndex | undefined;
        this.StartIntervalThink(0.25);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || this.targetIndex === undefined) {
            this.Destroy();
            return;
        }
        const target = EntIndexToHScript(this.targetIndex) as CDOTA_BaseNPC | undefined;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            this.Destroy();
            return;
        }
        const dist = ((parent.GetAbsOrigin() - target.GetAbsOrigin()) as Vector).Length2D();
        if (dist > 1100) {
            target.RemoveModifierByName("modifier_evo_morph_blood_r_tether");
            this.Destroy();
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierIncomingDamage_Percentage(): number {
        return -30;
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent || this.targetIndex === undefined) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;
        const target = EntIndexToHScript(this.targetIndex) as CDOTA_BaseNPC | undefined;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        const redirected = event.original_damage * 0.3;
        if (redirected <= 1) return;
        ApplyDamage({
            victim: target,
            attacker: parent,
            ability: this.GetAbility(),
            damage: redirected,
            damage_type: DamageTypes.PURE,
            damage_flags: DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION,
        });
    }
}
