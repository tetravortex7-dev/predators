import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    findMirrorQAbility,
    findSpectreEnemies,
    getSpectreBranchMaxLevel,
    getSpectreInt,
    getSpectreTier,
    triggerAstralInversionReflect,
} from "./evo_spectre_shared";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror";

LinkLuaModifier("modifier_evo_spectre_mirror_inversion", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_w_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_mirror_inversion")
export class evo_spectre_mirror_inversion extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_mirror_inversion";
    }
}

@registerAbility("evo_spectre_mirror_inversion_t3")
export class evo_spectre_mirror_inversion_t3 extends evo_spectre_mirror_inversion {}

@registerAbility("evo_spectre_mirror_inversion_t4")
export class evo_spectre_mirror_inversion_t4 extends evo_spectre_mirror_inversion {}

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
        return "evo_spectre_mirror_inversion";
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
        return "evo_spectre_mirror_w";
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
            this.bonusDmg =
                ab.GetSpecialValueFor("bonus_dmg") + (getSpectreInt(parent) * ab.GetSpecialValueFor("int_pct")) / 100;
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
            const qAb = findMirrorQAbility(parent);
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

@registerAbility("evo_spectre_mirror_w_t3")
export class evo_spectre_mirror_w_t3 extends evo_spectre_mirror_w {}

@registerAbility("evo_spectre_mirror_w_t4")
export class evo_spectre_mirror_w_t4 extends evo_spectre_mirror_w {}
