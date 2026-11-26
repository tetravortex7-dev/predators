import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applySpectreCreepDamage,
    findSpectreEnemies,
    getSpectreBranchMaxLevel,
    getSpectreInt,
    getSpectreTier,
    triggerAstralInversionReflect,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror";

LinkLuaModifier("modifier_evo_spectre_mirror_inversion", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_rift", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_phase", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_w_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_mirror_inversion")
export class evo_spectre_mirror_inversion extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_mirror_inversion";
    }
}

@registerModifier("modifier_evo_spectre_mirror_inversion")
export class modifier_evo_spectre_mirror_inversion extends BaseModifier {
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
        return "spectre_dispersion";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE")];
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || parent.PassivesDisabled()) return;
        triggerAstralInversionReflect(parent, parent, ab, event);
    }
}

@registerAbility("evo_spectre_mirror_q")
export class evo_spectre_mirror_q extends BaseAbility {
    private hitSets: Record<number, Set<EntityIndex>> = {};
    private silencedFirst: Set<ProjectileID> = new Set();

    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const origin = caster.GetAbsOrigin();
        let dir = (this.GetCursorPosition() - origin) as Vector;
        dir.z = 0;
        if (dir.Length2D() < 1) {
            dir = caster.GetForwardVector();
        }
        dir = dir.Normalized();

        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");
        const speed = this.GetSpecialValueFor("speed");

        caster.EmitSound("Hero_VoidSpirit.AetherRemnant.Cast");
        const projId = ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: width,
            fEndRadius: width,
            Source: caster,
            bHasFrontalCone: false,
            iUnitTargetTeam: UnitTargetTeam.ENEMY,
            iUnitTargetFlags: UnitTargetFlags.NONE,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            vVelocity: (dir * speed) as Vector,
            bProvidesVision: true,
            iVisionRadius: 220,
            iVisionTeamNumber: caster.GetTeamNumber(),
        });
        this.hitSets[projId] = new Set<EntityIndex>();

        if (getSpectreTier(caster) >= 4) {
            const riftDur = this.GetSpecialValueFor("rift_duration");
            const midPoint = GetGroundPosition((origin + dir * (range * 0.5)) as Vector, caster);
            CreateModifierThinker(
                caster,
                this,
                "modifier_evo_spectre_mirror_q_rift",
                {
                    duration: riftDur,
                    x0: origin.x,
                    y0: origin.y,
                    x1: origin.x + dir.x * range,
                    y1: origin.y + dir.y * range,
                },
                midPoint,
                caster.GetTeamNumber(),
                false
            );
        }
    }

    OnProjectileHitHandle(
        target: CDOTA_BaseNPC | undefined,
        _location: Vector,
        projectileHandle: ProjectileID
    ): boolean {
        if (!IsServer()) return false;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            delete this.hitSets[projectileHandle];
            this.silencedFirst.delete(projectileHandle);
            return false;
        }
        const set = this.hitSets[projectileHandle];
        const idx = target.GetEntityIndex();
        if (set !== undefined && set.has(idx)) return false;
        if (set !== undefined) set.add(idx);

        const caster = this.GetCaster();
        const tier = getSpectreTier(caster);
        const dmg = this.GetSpecialValueFor("base_damage") + (getSpectreInt(caster) * this.GetSpecialValueFor("int_pct")) / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const slowDur = this.GetSpecialValueFor("slow_duration");
        const polDur = this.GetSpecialValueFor("polarity_dur");

        applySpectreCreepDamage(caster, target, this, dmg, DamageTypes.MAGICAL, creepMult);
        target.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_q_slow", { duration: slowDur });
        target.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_polarity", { duration: polDur });

        if (tier >= 3 && !this.silencedFirst.has(projectileHandle)) {
            this.silencedFirst.add(projectileHandle);
            const silDur = tier >= 4 ? 1.4 : 1.1;
            target.AddNewModifier(caster, this, "modifier_silence", { duration: silDur });
            target.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_mr_shred", {
                duration: polDur,
            });
        }
        return false;
    }
}

@registerModifier("modifier_evo_spectre_mirror_q_rift")
export class modifier_evo_spectre_mirror_q_rift extends BaseModifier {
    private x0 = 0;
    private y0 = 0;
    private x1 = 0;
    private y1 = 0;
    private width = 180;
    private accum = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(params: { x0?: number; y0?: number; x1?: number; y1?: number }): void {
        this.x0 = params?.x0 ?? 0;
        this.y0 = params?.y0 ?? 0;
        this.x1 = params?.x1 ?? 0;
        this.y1 = params?.y1 ?? 0;
        this.width = 180;
        this.accum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.width = Math.max(160, ab.GetSpecialValueFor("width") + 20);
        }
        if (!IsServer()) return;
        const p0 = GetGroundPosition(Vector(this.x0, this.y0, 0), this.GetParent());
        const p1 = GetGroundPosition(Vector(this.x1, this.y1, 0), this.GetParent());
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, p0);
        ParticleManager.SetParticleControl(pfx, 1, p1);
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.25);
    }
    private isNearSegment(pos: Vector): boolean {
        const vx = this.x1 - this.x0;
        const vy = this.y1 - this.y0;
        const lenSq = vx * vx + vy * vy;
        if (lenSq <= 1) return false;
        const t = Math.max(0, Math.min(1, ((pos.x - this.x0) * vx + (pos.y - this.y0) * vy) / lenSq));
        const px = this.x0 + t * vx;
        const py = this.y0 + t * vy;
        const dx = pos.x - px;
        const dy = pos.y - py;
        return dx * dx + dy * dy <= this.width * this.width;
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        const thinker = this.GetParent();
        if (!caster || caster.IsNull() || !ab || ab.IsNull() || !thinker || thinker.IsNull()) return;

        if (caster.IsAlive() && this.isNearSegment(caster.GetAbsOrigin())) {
            caster.AddNewModifier(caster, ab, "modifier_evo_spectre_mirror_q_phase", { duration: 0.35 });
        }

        this.accum += 0.25;
        if (this.accum < 0.5) return;
        this.accum -= 0.5;
        const halfDps =
            (ab.GetSpecialValueFor("rift_dps") + (getSpectreInt(caster) * ab.GetSpecialValueFor("rift_int_pct")) / 100) *
            0.5;
        for (const enemy of findSpectreEnemies(caster, thinker.GetAbsOrigin(), 700)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            if (!this.isNearSegment(enemy.GetAbsOrigin())) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: halfDps,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_q_phase")
export class modifier_evo_spectre_mirror_q_phase extends BaseModifier {
    private msPct = 30;
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
        return "void_spirit_aether_remnant";
    }
    OnCreated(): void {
        this.msPct = 30;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("rift_ms_pct");
            if (v > 0) this.msPct = v;
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
}

@registerAbility("evo_spectre_mirror_w")
export class evo_spectre_mirror_w extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const charges = getSpectreTier(caster) >= 4 ? 4 : this.GetSpecialValueFor("charges");
        caster.EmitSound("Hero_ObsidianDestroyer.ArcaneOrb.Impact");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_w_buff", {
            duration: dur,
            charges,
        });
        if (mod !== undefined) {
            mod.SetStackCount(charges);
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_w_buff")
export class modifier_evo_spectre_mirror_w_buff extends BaseModifier {
    private bonusAs = 50;
    private bonusRange = 125;
    private bonusDmg = 40;
    private hitSequence = 0;

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
        return "obsidian_destroyer_arcane_orb";
    }
    OnCreated(params: { charges?: number }): void {
        this.bonusAs = 50;
        this.bonusRange = 125;
        this.bonusDmg = 40;
        this.hitSequence = 0;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (ab && !ab.IsNull() && parent && !parent.IsNull()) {
            this.bonusAs = ab.GetSpecialValueFor("bonus_as");
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
            this.bonusDmg = ab.GetSpecialValueFor("bonus_dmg") + (getSpectreInt(parent) * ab.GetSpecialValueFor("int_pct")) / 100;
        }
        if (IsServer() && params && params.charges !== undefined) {
            this.SetStackCount(params.charges);
        }
    }
    OnRefresh(params: { charges?: number }): void {
        this.OnCreated(params);
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        const parent = this.GetParent();
        if (parent && !parent.IsNull() && getSpectreTier(parent) >= 3) {
            return {
                [dotaModifierState("MODIFIER_STATE_CANNOT_MISS")]: true,
            };
        }
        return {};
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_OVERRIDE_ATTACK_MAGICAL"),
            dotaModifierFunction("MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.bonusAs;
    }
    GetModifierAttackRangeBonus(): number {
        return this.bonusRange;
    }
    GetOverrideAttackMagical(): 0 | 1 {
        return 1;
    }
    GetModifierProcAttack_BonusDamage_Magical(): number {
        return this.bonusDmg;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || event.attacker !== parent) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        const tier = getSpectreTier(parent);
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_arcane_orb_hit.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        ParticleManager.ReleaseParticleIndex(pfx);

        if (tier >= 3) {
            const cleaveRadius = ab.GetSpecialValueFor("cleave_radius");
            const cleaveDmg = ((event.damage + this.bonusDmg) * ab.GetSpecialValueFor("cleave_pct")) / 100;
            for (const other of findSpectreEnemies(parent, target.GetAbsOrigin(), cleaveRadius)) {
                if (!other || other.IsNull() || !other.IsAlive() || other === target) continue;
                ApplyDamage({
                    victim: other,
                    attacker: parent,
                    ability: ab,
                    damage: cleaveDmg,
                    damage_type: DamageTypes.MAGICAL,
                });
            }
            const steal = Math.min(target.GetMana(), ab.GetSpecialValueFor("mana_steal"));
            if (steal > 0) {
                target.Script_ReduceMana(steal, ab);
                parent.GiveMana(steal);
            }
        }

        this.hitSequence += 1;
        if (tier >= 4 && this.hitSequence % 4 === 0) {
            target.AddNewModifier(parent, ab, "modifier_stunned", {
                duration: ab.GetSpecialValueFor("stun_duration"),
            });
            const qAb = parent.FindAbilityByName("evo_spectre_mirror_q");
            const reduce = ab.GetSpecialValueFor("q_cd_reduce");
            if (qAb && !qAb.IsNull() && reduce > 0) {
                const rem = qAb.GetCooldownTimeRemaining();
                if (rem > 0) {
                    qAb.EndCooldown();
                    const next = rem - reduce;
                    if (next > 0.05) qAb.StartCooldown(next);
                }
            }
        }

        if (!parent.HasModifier("modifier_evo_spectre_mirror_r_aura")) {
            this.DecrementStackCount();
            if (this.GetStackCount() <= 0) {
                this.Destroy();
            }
        }
    }
}
