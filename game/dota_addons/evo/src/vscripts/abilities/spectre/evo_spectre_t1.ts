import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyDispersionAroundOrigin,
    applySpectreCreepDamage,
    detectSpectreBranchAndTier,
    findNearestSpectrePortal,
    findSpectreEnemies,
    getSpectreAgi,
    getSpectreHighestAttr,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_t1";

LinkLuaModifier("modifier_evo_spectre_dispersion", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_dispersion_haste", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_dispersion_charge", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_spectre_dispersion")
export class evo_spectre_dispersion extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_spectre_dispersion";
    }
}

@registerAbility("evo_spectre_phantom_dispersion")
export class evo_spectre_phantom_dispersion extends evo_spectre_dispersion {}

@registerModifier("modifier_evo_spectre_dispersion_haste")
export class modifier_evo_spectre_dispersion_haste extends BaseModifier {
    private msPct = 15;
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
        return "spectre_dispersion";
    }
    OnCreated(): void {
        this.msPct = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("ms_pct");
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

@registerModifier("modifier_evo_spectre_dispersion_charge")
export class modifier_evo_spectre_dispersion_charge extends BaseModifier {
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
    OnCreated(): void {
        if (IsServer() && this.GetStackCount() <= 0) {
            this.SetStackCount(1);
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const target = event.target;
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;
        if (this.GetStackCount() <= 0) return;

        const disp = parent.FindAbilityByName("evo_spectre_phantom_dispersion");
        if (!disp || disp.IsNull()) return;
        const baseDmg = disp.GetSpecialValueFor("charge_dmg");
        const agiPct = disp.GetSpecialValueFor("charge_agi_pct");
        const bonusDmg = baseDmg + (getSpectreAgi(parent) * agiPct) / 100;
        const cdReduce = disp.GetSpecialValueFor("reality_cd_reduce");

        if (bonusDmg > 0) {
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability: disp,
                damage: bonusDmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
        const dAb = parent.FindAbilityByName("evo_spectre_phantom_d");
        if (dAb && !dAb.IsNull() && cdReduce > 0) {
            const rem = dAb.GetCooldownTimeRemaining();
            if (rem > 0) {
                dAb.EndCooldown();
                const next = rem - cdReduce;
                if (next > 0.05) {
                    dAb.StartCooldown(next);
                }
            }
        }
        this.DecrementStackCount();
        if (this.GetStackCount() <= 0) {
            this.Destroy();
        }
    }
}

@registerModifier("modifier_evo_spectre_dispersion")
export class modifier_evo_spectre_dispersion extends BaseModifier {
    private absorbedPool = 0;
    public lastHeroDispersionTime = -999;

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
    OnCreated(): void {
        this.absorbedPool = 0;
        this.lastHeroDispersionTime = -999;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
        ];
    }
    GetModifierIncomingDamage_Percentage(): number {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || parent.PassivesDisabled()) {
            return 0;
        }
        return -ability.GetSpecialValueFor("absorb_pct");
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull() || parent.PassivesDisabled()) return;
        if (event.unit !== parent || event.damage <= 0) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;
        if (bit.band(event.damage_flags, DamageFlag.HPLOSS) !== 0) return;

        const pct = ability.GetSpecialValueFor("absorb_pct") / 100;
        if (pct <= 0) return;

        const raw = event.original_damage > 0 ? event.original_damage : event.damage / Math.max(0.1, 1 - pct);
        const blocked = raw * pct;
        if (blocked <= 0.5) return;

        const minRadius = ability.GetSpecialValueFor("min_radius");
        const maxRadius = ability.GetSpecialValueFor("max_radius");
        const dmgType = (event.damage_type || DamageTypes.MAGICAL) as DamageTypes;
        const hitTracker = new Set<EntityIndex>();

        if (event.attacker && !event.attacker.IsNull() && event.attacker.IsRealHero() && event.attacker !== parent) {
            this.lastHeroDispersionTime = GameRules.GetGameTime();
        }

        applyDispersionAroundOrigin(
            parent,
            ability,
            parent.GetAbsOrigin(),
            blocked,
            dmgType,
            minRadius,
            maxRadius,
            hitTracker
        );

        const info = detectSpectreBranchAndTier(parent);
        if (info.branch !== "PHANTOM") return;

        if (event.attacker && !event.attacker.IsNull() && event.attacker.IsRealHero() && event.attacker !== parent) {
            const msDur = ability.GetSpecialValueFor("ms_duration");
            parent.AddNewModifier(parent, ability, "modifier_evo_spectre_dispersion_haste", { duration: msDur });
        }

        const portal = findNearestSpectrePortal(parent, parent.GetAbsOrigin());
        if (portal) {
            const echoRadius = ability.GetSpecialValueFor("portal_echo_radius");
            applyDispersionAroundOrigin(
                parent,
                ability,
                portal.GetAbsOrigin(),
                blocked,
                dmgType,
                minRadius,
                Math.min(maxRadius, echoRadius),
                hitTracker
            );
        }

        if (info.tier >= 3) {
            const threshold = ability.GetSpecialValueFor("charge_threshold");
            const maxCharges = ability.GetSpecialValueFor("max_charges");
            if (threshold > 0 && maxCharges > 0) {
                this.absorbedPool += blocked;
                while (this.absorbedPool >= threshold) {
                    this.absorbedPool -= threshold;
                    const mod = parent.AddNewModifier(
                        parent,
                        ability,
                        "modifier_evo_spectre_dispersion_charge",
                        {}
                    );
                    if (mod && mod.GetStackCount() < maxCharges) {
                        if (mod.GetStackCount() === 0) {
                            mod.SetStackCount(1);
                        } else {
                            mod.IncrementStackCount();
                        }
                    }
                }
            }
        }
    }
}

@registerAbility("evo_spectre_t1_w")
export class evo_spectre_t1_w extends BaseAbility {
    GetAOERadius(): number {
        return this.GetSpecialValueFor("aoe_radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const physBase = this.GetSpecialValueFor("phys_base");
        const attrPct = this.GetSpecialValueFor("attr_pct");
        const physDmg = physBase + (getSpectreHighestAttr(caster) * attrPct) / 100;

        const targetPos = target.GetAbsOrigin();
        const dir = targetPos.__sub(caster.GetAbsOrigin());
        dir.z = 0;
        const forward = dir.Length2D() > 1 ? dir.Normalized() : caster.GetForwardVector();

        caster.EmitSound("Hero_VoidSpirit.Pulse.Cast");
        target.EmitSound("Hero_VoidSpirit.AstralStep.Target");
        const pfx = ParticleManager.CreateParticle(
            "particles/evo_spectre/evo_spectre_void_surge.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        ParticleManager.SetParticleControlForward(pfx, 0, forward);
        ParticleManager.ReleaseParticleIndex(pfx);

        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: physDmg,
            damage_type: DamageTypes.PHYSICAL,
        });

        let pureDmg = this.GetSpecialValueFor("pure_base");
        const dispMod = caster.FindModifierByName("modifier_evo_spectre_dispersion") as
            | modifier_evo_spectre_dispersion
            | undefined;
        const windowSec = this.GetSpecialValueFor("dispersion_window");
        if (dispMod && GameRules.GetGameTime() - dispMod.lastHeroDispersionTime <= windowSec) {
            pureDmg *= 1 + this.GetSpecialValueFor("dispersion_bonus_pct") / 100;
        }

        const radius = this.GetSpecialValueFor("aoe_radius");
        const creepMult = this.GetSpecialValueFor("creep_mult");
        for (const enemy of findSpectreEnemies(caster, target.GetAbsOrigin(), radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            applySpectreCreepDamage(caster, enemy, this, pureDmg, DamageTypes.PURE, creepMult);
        }
    }
}
