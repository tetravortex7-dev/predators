import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    findSpectreEnemies,
    getSpectreAgi,
    getSpectreBranchMaxLevel,
    getSpectreTier,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_phantom_w";

LinkLuaModifier("modifier_evo_spectre_phantom_w_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_w_active", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_ms_steal", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_phantom_root", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_phantom_w")
export class evo_spectre_phantom_w extends BaseAbility {
    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_phantom_w_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("active_duration");
        caster.EmitSound("Hero_VoidSpirit.Dissimilate.Cast");
        caster.EmitSound("Hero_Spectre.ShadowStep.Cast");
        const castPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            caster
        );
        ParticleManager.SetParticleControl(castPfx, 0, caster.GetAbsOrigin());
        ParticleManager.ReleaseParticleIndex(castPfx);
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_spectre_phantom_w_active", {
            duration: dur,
        });
        if (mod !== undefined) {
            mod.SetStackCount(1);
        }
    }
}

@registerModifier("modifier_evo_spectre_phantom_w_passive")
export class modifier_evo_spectre_phantom_w_passive extends BaseModifier {
    private hitCounter = 0;
    private bonusAs = 20;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.hitCounter = 0;
        this.bonusAs = 20;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.bonusAs = ab.GetSpecialValueFor("bonus_as");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || parent.PassivesDisabled()) return 0;
        return this.bonusAs;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        this.hitCounter += 1;
        const tier = getSpectreTier(parent);
        const activeMod = parent.FindModifierByName("modifier_evo_spectre_phantom_w_active");
        const hasEmpower = activeMod !== undefined && activeMod.GetStackCount() > 0;
        const isFastCycle =
            tier >= 4 &&
            (activeMod !== undefined || parent.HasModifier("modifier_evo_spectre_reality_ms"));
        const cadence = isFastCycle ? 2 : 3;
        const isSlowed =
            target.HasModifier("modifier_spectre_spectral_dagger_slow") ||
            target.HasModifier("modifier_spectre_spectral_dagger");

        if (!hasEmpower && !isSlowed && this.hitCounter < cadence) {
            return;
        }
        if (this.hitCounter >= cadence) {
            this.hitCounter = 0;
        }

        const pureDmg =
            ability.GetSpecialValueFor("pure_base") +
            (getSpectreAgi(parent) * ability.GetSpecialValueFor("pure_agi_pct")) / 100;
        const cleaveRadius = ability.GetSpecialValueFor("cleave_radius");
        const cleavePct = ability.GetSpecialValueFor("cleave_pct") / 100;

        const parentPos = parent.GetAbsOrigin();
        const targetPos = target.GetAbsOrigin();
        const dir = targetPos.__sub(parentPos);
        dir.z = 0;
        const forward = dir.Length2D() > 1 ? dir.Normalized() : parent.GetForwardVector();

        target.EmitSound("Hero_Spectre.Desolate");
        target.EmitSound(hasEmpower ? "Hero_VoidSpirit.AstralStep.Target" : "Hero_VoidSpirit.Pulse.Target");

        const cleavePfx = ParticleManager.CreateParticle(
            "particles/evo_spectre/evo_spectre_cleave.vpcf",
            ParticleAttachment.ABSORIGIN,
            parent
        );
        ParticleManager.SetParticleControl(cleavePfx, 0, parentPos);
        ParticleManager.SetParticleControlForward(cleavePfx, 0, forward);
        ParticleManager.SetParticleControl(cleavePfx, 2, targetPos);
        ParticleManager.ReleaseParticleIndex(cleavePfx);

        const burstPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf",
            ParticleAttachment.ABSORIGIN,
            target
        );
        ParticleManager.SetParticleControl(burstPfx, 0, targetPos);
        ParticleManager.ReleaseParticleIndex(burstPfx);

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_desolate.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        ParticleManager.SetParticleControl(pfx, 4, parentPos);
        ParticleManager.ReleaseParticleIndex(pfx);

        ApplyDamage({
            victim: target,
            attacker: parent,
            ability,
            damage: pureDmg,
            damage_type: DamageTypes.PURE,
        });

        for (const other of findSpectreEnemies(parent, target.GetAbsOrigin(), cleaveRadius)) {
            if (!other || other.IsNull() || !other.IsAlive() || other === target) continue;
            ApplyDamage({
                victim: other,
                attacker: parent,
                ability,
                damage: pureDmg * cleavePct,
                damage_type: DamageTypes.PURE,
            });
        }

        if (hasEmpower && activeMod) {
            activeMod.SetStackCount(0);
            const stealPct = Math.round(ability.GetSpecialValueFor("ms_steal_pct"));
            const stealDur = ability.GetSpecialValueFor("ms_steal_duration");
            const slowMod = target.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {
                duration: stealDur,
                amount: -stealPct,
            });
            if (slowMod !== undefined) slowMod.SetStackCount(stealPct);
            const hastedMod = parent.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {
                duration: stealDur,
                amount: stealPct,
            });
            if (hastedMod !== undefined) hastedMod.SetStackCount(stealPct);

            if (tier >= 3) {
                const rootDur = tier >= 4 ? 1.3 : 1.0;
                const shred = tier >= 4 ? 6 : 4;
                target.AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_root", { duration: rootDur });
                target.AddNewModifier(parent, ability, "modifier_evo_spectre_armor_shred", {
                    duration: ability.GetSpecialValueFor("shred_duration"),
                    shred,
                });
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_phantom_w_active")
export class modifier_evo_spectre_phantom_w_active extends BaseModifier {
    private evasion = 30;
    private bonusRange = 175;

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
        return "evo_spectre_phantom_w";
    }
    GetEffectName(): string {
        return "particles/units/heroes/hero_spectre/spectre_ambient_blade.vpcf";
    }
    GetEffectAttachType(): ParticleAttachment {
        return ParticleAttachment.ABSORIGIN_FOLLOW;
    }
    OnCreated(): void {
        this.evasion = 30;
        this.bonusRange = 175;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.evasion = ab.GetSpecialValueFor("evasion_pct");
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_CANNOT_MISS")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_EVASION_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        ];
    }
    GetModifierEvasion_Constant(): number {
        return this.evasion;
    }
    GetModifierAttackRangeBonus(): number {
        return this.GetStackCount() > 0 ? this.bonusRange : 0;
    }
}

@registerModifier("modifier_evo_spectre_phantom_ms_steal")
export class modifier_evo_spectre_phantom_ms_steal extends BaseModifier {
    private isDebuffFlag = false;

    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return this.isDebuffFlag;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "evo_spectre_phantom_w";
    }
    OnCreated(params: { amount?: number }): void {
        this.isDebuffFlag = (params && (params.amount ?? 0) < 0) || this.GetParent().GetTeamNumber() !== this.GetCaster()?.GetTeamNumber();
        if (IsServer() && params && params.amount !== undefined) {
            this.SetStackCount(Math.abs(Math.round(params.amount)));
        }
    }
    OnRefresh(params: { amount?: number }): void {
        this.OnCreated(params);
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const val = this.GetStackCount();
        return this.isDebuffFlag ? -val : val;
    }
}

@registerModifier("modifier_evo_spectre_phantom_root")
export class modifier_evo_spectre_phantom_root extends BaseModifier {
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
        return "evo_spectre_phantom_w";
    }
    GetEffectName(): string {
        return "particles/units/heroes/hero_treant/treant_bramble_root.vpcf";
    }
    GetEffectAttachType(): ParticleAttachment {
        return ParticleAttachment.ABSORIGIN_FOLLOW;
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}
