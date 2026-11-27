import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    findMirrorInversionAbility,
    findMirrorWAbility,
    findSpectreEnemies,
    getSpectreBranchMaxLevel,
    getSpectreInt,
    getSpectreTier,
    triggerAstralInversionReflect,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror_er";

LinkLuaModifier("modifier_evo_spectre_mirror_e_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_e_active", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_e_taunt", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_r_aura", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_r_ally", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_mirror_e")
export class evo_spectre_mirror_e extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_mirror_e_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        const radius = this.GetSpecialValueFor("taunt_radius");
        const tauntDur = this.GetSpecialValueFor("taunt_dur");
        const shield = Math.ceil(
            this.GetSpecialValueFor("magic_shield") + (getSpectreInt(caster) * this.GetSpecialValueFor("shield_int_pct")) / 100
        );

        caster.Purge(false, true, false, false, false);
        caster.EmitSound("Hero_Spectre.Dispersion");

        const mod = caster.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_e_active", {
            duration: dur,
            shield,
        });
        if (mod !== undefined) {
            mod.SetStackCount(shield);
        }

        if (getSpectreTier(caster) >= 4) {
            for (const enemy of findSpectreEnemies(caster, caster.GetAbsOrigin(), radius)) {
                if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
                enemy.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_e_taunt", { duration: tauntDur });
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_e_passive")
export class modifier_evo_spectre_mirror_e_passive extends BaseModifier {
    private mr = 14;
    private amp = 6;
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.mr = 14;
        this.amp = 6;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.mr = ab.GetSpecialValueFor("passive_mr");
            this.amp = ab.GetSpecialValueFor("passive_amp");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        ];
    }
    GetModifierMagicalResistanceBonus(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || parent.PassivesDisabled()) return 0;
        return this.mr;
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || parent.PassivesDisabled()) return 0;
        return this.amp;
    }
}

@registerModifier("modifier_evo_spectre_mirror_e_active")
export class modifier_evo_spectre_mirror_e_active extends BaseModifier {
    private physReduce = 35;

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
        return "evo_spectre_mirror_e";
    }
    OnCreated(params: { shield?: number }): void {
        this.physReduce = 35;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.physReduce = ab.GetSpecialValueFor("phys_reduce_pct");
        }
        if (!IsServer()) return;
        if (params && params.shield !== undefined) {
            this.SetStackCount(params.shield);
        }
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_dispersion.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
    }
    OnRefresh(params: { shield?: number }): void {
        this.OnCreated(params);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_CONSTANT_BLOCK"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_PERCENTAGE"),
        ];
    }
    GetModifierMagical_ConstantBlock(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const pool = this.GetStackCount();
        if (pool <= 0 || event.damage <= 0) return 0;
        const blocked = Math.min(pool, Math.ceil(event.damage));
        this.SetStackCount(Math.max(0, pool - blocked));
        return blocked;
    }
    GetModifierIncomingPhysicalDamage_Percentage(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || getSpectreTier(parent) < 3) return 0;
        return -this.physReduce;
    }
}

@registerModifier("modifier_evo_spectre_mirror_e_taunt")
export class modifier_evo_spectre_mirror_e_taunt extends BaseModifier {
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
        return "evo_spectre_mirror_e";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (parent && !parent.IsNull() && caster && !caster.IsNull()) {
            parent.SetForceAttackTarget(caster);
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            parent.SetForceAttackTarget(undefined);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_TAUNTED")]: true,
        };
    }
}

@registerAbility("evo_spectre_mirror_r")
export class evo_spectre_mirror_r extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Spectre.HauntCast");
        caster.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_r_aura", { duration: dur });

        const wAb = findMirrorWAbility(caster);
        if (wAb && !wAb.IsNull() && wAb.GetLevel() > 0) {
            caster.AddNewModifier(caster, wAb, "modifier_evo_spectre_mirror_w_buff", {
                duration: dur,
                charges: 4,
            });
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_r_aura")
export class modifier_evo_spectre_mirror_r_aura extends BaseModifier {
    private radius = 525;

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
        return "evo_spectre_mirror_r";
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_spectre_mirror_r_ally";
    }
    GetAuraRadius(): number {
        return this.radius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }
    GetAuraSearchType(): UnitTargetType {
        return UnitTargetType.HERO;
    }
    GetAuraEntityReject(entity: CDOTA_BaseNPC): boolean {
        return entity === this.GetParent();
    }
    OnCreated(): void {
        this.radius = 525;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.radius = ab.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_dispersion.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        this.AddParticle(pfx, false, false, -1, false, false);
    }
}

@registerModifier("modifier_evo_spectre_mirror_r_ally")
export class modifier_evo_spectre_mirror_r_ally extends BaseModifier {
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
        return "evo_spectre_mirror_r";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE")];
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const ally = this.GetParent();
        const spectre = this.GetCaster();
        if (!ally || ally.IsNull() || !spectre || spectre.IsNull()) return;
        const invAb = findMirrorInversionAbility(spectre);
        if (!invAb || invAb.IsNull()) return;
        triggerAstralInversionReflect(ally, spectre, invAb, event);
    }
}

@registerAbility("evo_spectre_mirror_e_t3")
export class evo_spectre_mirror_e_t3 extends evo_spectre_mirror_e {}

@registerAbility("evo_spectre_mirror_e_t4")
export class evo_spectre_mirror_e_t4 extends evo_spectre_mirror_e {}
