import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/slark/evo_slark_agi";

const SLARK_AGI_MODS: readonly string[] = [
    "modifier_evo_slark_agi_q_leap",
    "modifier_evo_slark_agi_q_leash",
    "modifier_evo_slark_agi_w_charge",
    "modifier_evo_slark_agi_w_pulse",
    "modifier_evo_slark_agi_w_buff",
    "modifier_evo_slark_agi_e_passive",
    "modifier_evo_slark_agi_essence_buff",
    "modifier_evo_slark_agi_essence_debuff",
    "modifier_evo_slark_agi_r_shadow",
];

for (const modName of SLARK_AGI_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

function grantEssenceStack(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, stacks: number): void {
    const eAb = caster.FindAbilityByName("evo_slark_agi_e");
    if (!eAb || eAb.IsNull() || eAb.GetLevel() <= 0) return;

    const isHero = target.IsHero();
    const dur = isHero ? eAb.GetSpecialValueFor("hero_duration") : eAb.GetSpecialValueFor("creep_duration");
    const agiPerStack = isHero ? eAb.GetSpecialValueFor("agi_per_stack") : 1;

    const existing = caster.FindModifierByName("modifier_evo_slark_agi_essence_buff");
    const cur = existing ? existing.GetStackCount() : 0;
    const maxTotal = isHero ? 120 : Math.max(cur, 18);
    const next = Math.min(maxTotal, cur + stacks * agiPerStack);
    const buff = caster.AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_buff", { duration: dur });
    if (buff !== undefined) {
        buff.SetStackCount(next);
    }

    if (isHero) {
        const debuffPerStack = eAb.GetSpecialValueFor("enemy_stat_loss");
        const exDebuff = target.FindModifierByName("modifier_evo_slark_agi_essence_debuff");
        const curDebuff = exDebuff ? exDebuff.GetStackCount() : 0;
        const debuff = target.AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_debuff", { duration: dur });
        if (debuff !== undefined) {
            debuff.SetStackCount(Math.min(40, curDebuff + stacks * debuffPerStack));
        }
    }
}

@registerAbility("evo_slark_agi_q")
export class evo_slark_agi_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const dir = caster.GetForwardVector();
        const distance = this.GetSpecialValueFor("leap_distance");
        const duration = Math.max(0.28, distance / 1750);

        caster.EmitSound("Hero_Slark.Pounce.Cast");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_agi_q_leap", {
            duration,
            dir_x: dir.x,
            dir_y: dir.y,
            distance,
        });
    }
}

@registerModifier("modifier_evo_slark_agi_q_leap")
export class modifier_evo_slark_agi_q_leap extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1750;
    private elapsed = 0;
    private totalDur = 0.4;
    private latched = false;

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
        const dist = params.distance ?? 650;
        this.totalDur = Math.max(0.2, this.GetDuration());
        this.speed = dist / this.totalDur;
        this.elapsed = 0;
        this.latched = false;
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
        nextPos.z = groundZ + Math.sin(t * Math.PI) * 155;
        parent.SetAbsOrigin(nextPos);

        const heroes = FindUnitsInRadius(
            parent.GetTeamNumber(),
            nextPos,
            undefined,
            135,
            UnitTargetTeam.ENEMY,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.CLOSEST,
            false
        );
        for (const enemy of heroes) {
            if (enemy && !enemy.IsNull() && IsValidEntity(enemy) && enemy.IsAlive()) {
                this.latchOnto(parent, enemy);
                this.Destroy();
                return;
            }
        }
    }
    private latchOnto(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC): void {
        this.latched = true;
        const ab = this.GetAbility();
        if (!ab || ab.IsNull()) return;

        const level = ab.GetLevel();
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const agiPct = ab.GetSpecialValueFor("agi_pct") / 100;
        const leashDur = ab.GetSpecialValueFor("leash_duration");
        const agi = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetAgility() : 0;

        caster.EmitSound("Hero_Slark.Pounce.Impact");
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: ab,
            damage: baseDmg + agi * agiPct,
            damage_type: DamageTypes.PHYSICAL,
        });

        const anchor = target.GetAbsOrigin();
        target.AddNewModifier(caster, ab, "modifier_evo_slark_agi_q_leash", {
            duration: leashDur,
            anchor_x: anchor.x,
            anchor_y: anchor.y,
        });

        if (level >= 2) {
            grantEssenceStack(caster, target, 2);
            caster.PerformAttack(target, true, true, true, false, false, false, false);
        }
        caster.MoveToTargetToAttack(target);
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;
        FindClearSpaceForUnit(parent, parent.GetAbsOrigin(), true);

        if (this.latched) return;
        const ab = this.GetAbility();
        if (!ab || ab.IsNull()) return;
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const agiPct = ab.GetSpecialValueFor("agi_pct") / 100;
        const agi = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetAgility() : 0;
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            225,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.CLOSEST,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: baseDmg + agi * agiPct,
                damage_type: DamageTypes.PHYSICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_slark_agi_q_leash")
export class modifier_evo_slark_agi_q_leash extends BaseModifier {
    private anchorX = 0;
    private anchorY = 0;
    private maxRadius = 350;

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
        return "slark_pounce";
    }
    OnCreated(params: { anchor_x?: number; anchor_y?: number }): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const origin = parent && !parent.IsNull() ? parent.GetAbsOrigin() : Vector(0, 0, 0);
        this.anchorX = params.anchor_x ?? origin.x;
        this.anchorY = params.anchor_y ?? origin.y;
        const ab = this.GetAbility();
        this.maxRadius = ab ? ab.GetSpecialValueFor("leash_radius") : 350;
        this.StartIntervalThink(0.05);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        const pos = parent.GetAbsOrigin();
        const dx = pos.x - this.anchorX;
        const dy = pos.y - this.anchorY;
        const dist = Math.sqrt(dx * dx + dy * dy);
        if (dist > this.maxRadius) {
            const nx = this.anchorX + (dx / dist) * this.maxRadius;
            const ny = this.anchorY + (dy / dist) * this.maxRadius;
            const clamped = Vector(nx, ny, GetGroundHeight(Vector(nx, ny, pos.z), parent));
            parent.SetAbsOrigin(clamped);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_TETHERED")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_DEATH")];
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !caster || caster.IsNull() || !ab) return;
        if (event.unit !== parent || ab.GetLevel() < 3) return;
        ab.EndCooldown();
        caster.GiveMana(caster.GetMaxMana() * 0.25);
    }
}

@registerAbility("evo_slark_agi_w")
export class evo_slark_agi_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const delay = this.GetSpecialValueFor("delay");
        caster.EmitSound("Hero_Slark.DarkPact.PreCast");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_agi_w_charge", { duration: delay });
    }
}

@registerModifier("modifier_evo_slark_agi_w_charge")
export class modifier_evo_slark_agi_w_charge extends BaseModifier {
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
        return "slark_dark_pact";
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;
        parent.EmitSound("Hero_Slark.DarkPact.Cast");
        parent.AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_pulse", { duration: 0.85 });
    }
}

@registerModifier("modifier_evo_slark_agi_w_pulse")
export class modifier_evo_slark_agi_w_pulse extends BaseModifier {
    private hitHeroIds: Set<EntityIndex> = new Set();

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.hitHeroIds = new Set();
        this.OnIntervalThink();
        this.StartIntervalThink(0.2);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;

        parent.Purge(false, true, false, true, true);

        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const agiPct = ab.GetSpecialValueFor("agi_pct") / 100;
        const radius = ab.GetSpecialValueFor("radius");
        const agi = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetAgility() : 0;
        const pulseDmg = (baseDmg + agi * agiPct) / 5;

        const selfDmg = pulseDmg * 0.35;
        if (parent.GetHealth() > selfDmg + 1) {
            parent.SetHealth(parent.GetHealth() - selfDmg);
        }

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slark/slark_dark_pact_pulses.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
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
                damage: pulseDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            if (enemy.IsHero()) {
                this.hitHeroIds.add(enemy.entindex());
            }
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;
        if (ab.GetLevel() >= 2) {
            const dur = ab.GetLevel() >= 3 ? 4.0 : 2.5;
            const mod = parent.AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_buff", { duration: dur });
            if (mod !== undefined) {
                mod.SetStackCount(ab.GetLevel() >= 3 ? Math.max(1, this.hitHeroIds.size) : 0);
            }
        }
    }
}

@registerModifier("modifier_evo_slark_agi_w_buff")
export class modifier_evo_slark_agi_w_buff extends BaseModifier {
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
        return "slark_dark_pact";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_EVASION_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 20;
    }
    GetModifierEvasion_Constant(): number {
        return Math.min(50, this.GetStackCount() * 10);
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.GetStackCount() * 20;
    }
}

@registerAbility("evo_slark_agi_e")
export class evo_slark_agi_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_slark_agi_e_passive";
    }
}

@registerModifier("modifier_evo_slark_agi_e_passive")
export class modifier_evo_slark_agi_e_passive extends BaseModifier {
    private hitCounter = 0;
    private lastTargetId?: EntityIndex;

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
        this.hitCounter = 0;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const inShadow = parent.HasModifier("modifier_evo_slark_agi_r_shadow");
        const baseStacks = inShadow ? 2 : 1;
        grantEssenceStack(parent, target, baseStacks);

        const level = ab.GetLevel();
        if (level >= 2 && target.IsHero()) {
            const tid = target.entindex();
            if (this.lastTargetId === tid) {
                this.hitCounter += 1;
            } else {
                this.lastTargetId = tid;
                this.hitCounter = 1;
            }
            if (this.hitCounter >= 4) {
                this.hitCounter = 0;
                const agi = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetAgility() : 0;
                ApplyDamage({
                    victim: target,
                    attacker: parent,
                    ability: ab,
                    damage: 70 + agi * 0.6,
                    damage_type: DamageTypes.PHYSICAL,
                });
                grantEssenceStack(parent, target, 1);
                target.EmitSound("Hero_Slark.EssenceShift");
            }
        }

        if (level >= 3) {
            const buff = parent.FindModifierByName("modifier_evo_slark_agi_essence_buff");
            if (buff && buff.GetStackCount() >= 10) {
                const heal = event.damage * 0.15;
                if (heal > 0) {
                    parent.Heal(heal, ab);
                }
            }
        }
    }
}

@registerModifier("modifier_evo_slark_agi_essence_buff")
export class modifier_evo_slark_agi_essence_buff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        ];
    }
    GetModifierBonusStats_Agility(): number {
        return this.GetStackCount();
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ab = this.GetAbility();
        if (ab && ab.GetLevel() >= 3 && this.GetStackCount() >= 10) {
            return 10;
        }
        return 0;
    }
}

@registerModifier("modifier_evo_slark_agi_essence_debuff")
export class modifier_evo_slark_agi_essence_debuff extends BaseModifier {
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
        return "slark_essence_shift";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return -this.GetStackCount();
    }
    GetModifierBonusStats_Agility(): number {
        return -this.GetStackCount();
    }
    GetModifierBonusStats_Intellect(): number {
        return -this.GetStackCount();
    }
}

@registerAbility("evo_slark_agi_r")
export class evo_slark_agi_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Slark.ShadowDance");
        caster.AddNewModifier(caster, this, "modifier_evo_slark_agi_r_shadow", { duration: dur });
    }
}

@registerModifier("modifier_evo_slark_agi_r_shadow")
export class modifier_evo_slark_agi_r_shadow extends BaseModifier {
    private pfx?: ParticleID;

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
        return "slark_shadow_dance";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            this.pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_slark/slark_shadow_dance.vpcf",
                ParticleAttachment.ABSORIGIN_FOLLOW,
                parent
            );
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        if (this.pfx !== undefined) {
            ParticleManager.DestroyParticle(this.pfx, false);
            ParticleManager.ReleaseParticleIndex(this.pfx);
            this.pfx = undefined;
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVISIBLE")]: true,
            [dotaModifierState("MODIFIER_STATE_TRUESIGHT_IMMUNE")]: true,
            [dotaModifierState("MODIFIER_STATE_UNTARGETABLE_ENEMY")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierInvisibilityLevel(): number {
        return 2;
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 30;
    }
    GetModifierHealthRegenPercentage(): number {
        return 5;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return 50;
    }
}
