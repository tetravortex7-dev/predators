import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { grantSlarkAgiEssenceStack } from "./evo_slark_shared";

const SCRIPT_PATH = "abilities/slark/evo_slark_agi";

const SLARK_AGI_QW_MODS: readonly string[] = [
    "modifier_evo_slark_agi_q_leap",
    "modifier_evo_slark_agi_q_leash",
    "modifier_evo_slark_agi_w_charge",
    "modifier_evo_slark_agi_w_pulse",
    "modifier_evo_slark_agi_w_buff",
];

for (const modName of SLARK_AGI_QW_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
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
            grantSlarkAgiEssenceStack(caster, target, 2);
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
