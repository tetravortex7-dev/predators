import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    addLivingChitinStacks,
    findEnemiesInRadius,
    getNyxBranchMaxLevel,
    getNyxStr,
    getNyxTier,
    isNyxBurrowed,
    knockbackUnitFrom,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_scarab_er";

LinkLuaModifier("modifier_evo_nyx_scarab_e", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_e_hardening", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_e_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_r_aura", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_scarab_r_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_scarab_e")
export class evo_nyx_scarab_e extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_scarab_e";
    }
}

@registerModifier("modifier_evo_nyx_scarab_e")
export class modifier_evo_nyx_scarab_e extends BaseModifier {
    private lastRecord = -1;
    private lastPct = 0;
    private lastEvadeChitinTime = -999;
    private counterCdByEnt: Map<EntityIndex, number> = new Map();

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
        this.lastRecord = -1;
        this.lastPct = 0;
        this.lastEvadeChitinTime = -999;
        this.counterCdByEnt = new Map();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")];
    }
    GetModifierIncomingDamage_Percentage(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return 0;
        if (parent.PassivesDisabled() || event.damage <= 0) return 0;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return 0;

        if (event.record !== undefined && event.record === this.lastRecord) {
            return this.lastPct;
        }

        const tier = getNyxTier(parent);
        const burrowed = isNyxBurrowed(parent);
        const wAb = parent.FindAbilityByName("evo_nyx_scarab_w");
        const evadeBonus = burrowed && wAb && !wAb.IsNull() ? wAb.GetSpecialValueFor("evade_bonus") : 0;
        const grazeBonus = burrowed && wAb && !wAb.IsNull() ? wAb.GetSpecialValueFor("graze_bonus") : 0;

        const evadeChance = ability.GetSpecialValueFor("evade_chance") + evadeBonus;
        const grazeChance = ability.GetSpecialValueFor("graze_chance") + grazeBonus;

        let pct = 0;
        if (RollPercentage(evadeChance)) {
            pct = -100;
            this.onEvadeSuccess(parent, ability, tier, event.attacker);
        } else if (RollPercentage(grazeChance)) {
            const ultActive = parent.HasModifier("modifier_evo_nyx_scarab_r_aura");
            const rAb = parent.FindAbilityByName("evo_nyx_scarab_r");
            const blockPct =
                ultActive && rAb && !rAb.IsNull()
                    ? rAb.GetSpecialValueFor("graze_block_pct")
                    : ability.GetSpecialValueFor("graze_block_pct");
            pct = -blockPct;
            this.onGrazeSuccess(parent, ability, tier);
        }

        if (event.record !== undefined) {
            this.lastRecord = event.record;
            this.lastPct = pct;
        }
        return pct;
    }
    private onEvadeSuccess(
        parent: CDOTA_BaseNPC,
        ability: CDOTABaseAbility,
        tier: number,
        attacker: CDOTA_BaseNPC | undefined
    ): void {
        const now = GameRules.GetDOTATime(false, false);
        if (tier >= 3) {
            const heal = 25 + getNyxStr(parent) * 0.12;
            parent.Heal(heal, ability);
            if (now - this.lastEvadeChitinTime >= 3.0) {
                this.lastEvadeChitinTime = now;
                addLivingChitinStacks(parent, 1);
            }
        }
        if (tier >= 4 && attacker && !attacker.IsNull() && IsValidEntity(attacker) && attacker.IsAlive()) {
            const dist = ((attacker.GetAbsOrigin() - parent.GetAbsOrigin()) as Vector).Length2D();
            if (dist <= 600 && attacker.GetTeamNumber() !== parent.GetTeamNumber()) {
                const idx = attacker.GetEntityIndex();
                const prev = this.counterCdByEnt.get(idx) ?? -999;
                if (now - prev >= 2.0) {
                    this.counterCdByEnt.set(idx, now);
                    const dmg = 65 + getNyxStr(parent) * 0.3;
                    ApplyDamage({
                        victim: attacker,
                        attacker: parent,
                        ability,
                        damage: dmg,
                        damage_type: DamageTypes.MAGICAL,
                        damage_flags: DamageFlag.REFLECTION,
                    });
                    attacker.AddNewModifier(parent, ability, "modifier_evo_nyx_scarab_e_slow", { duration: 1.5 });
                }
            }
        }
    }
    private onGrazeSuccess(parent: CDOTA_BaseNPC, ability: CDOTABaseAbility, tier: number): void {
        if (tier < 3) return;
        const ex = parent.FindModifierByName("modifier_evo_nyx_scarab_e_hardening");
        const next = Math.min(5, (ex ? ex.GetStackCount() : 0) + 1);
        const mod = parent.AddNewModifier(parent, ability, "modifier_evo_nyx_scarab_e_hardening", { duration: 4.0 });
        if (mod !== undefined) {
            mod.SetStackCount(next);
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_e_hardening")
export class modifier_evo_nyx_scarab_e_hardening extends BaseModifier {
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
        return "nyx_assassin_spiked_carapace";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        ];
    }
    GetModifierBonusStats_Strength(): number {
        return this.GetStackCount() * 2;
    }
    GetModifierMagicalResistanceBonus(): number {
        return this.GetStackCount() * 3;
    }
}

@registerModifier("modifier_evo_nyx_scarab_e_slow")
export class modifier_evo_nyx_scarab_e_slow extends BaseModifier {
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
        return "nyx_assassin_spiked_carapace";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerAbility("evo_nyx_scarab_r")
export class evo_nyx_scarab_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const duration = this.GetSpecialValueFor("duration");

        const wAb = caster.FindAbilityByName("evo_nyx_scarab_w");
        if (wAb && !wAb.IsNull() && !wAb.GetToggleState()) {
            wAb.ToggleAbility();
            if (!caster.HasModifier("modifier_evo_nyx_scarab_w")) {
                caster.AddNewModifier(caster, wAb, "modifier_evo_nyx_scarab_w", {});
            }
        }

        caster.EmitSound("Ability.SandKing_Epicenter");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_scarab_r_aura", { duration });
    }
}

@registerModifier("modifier_evo_nyx_scarab_r_aura")
export class modifier_evo_nyx_scarab_r_aura extends BaseModifier {
    private radius = 525;
    private qCdAdjusted = false;

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
        return "sandking_epicenter";
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_nyx_scarab_r_slow";
    }
    GetAuraRadius(): number {
        return this.radius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnCreated(): void {
        this.radius = 525;
        this.qCdAdjusted = false;
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            this.radius = ability.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const interval = ability && !ability.IsNull() ? ability.GetSpecialValueFor("wave_interval") : 1.1;
        this.pulseWave();
        this.StartIntervalThink(interval);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.pulseWave();
        const qAb = this.GetParent().FindAbilityByName("evo_nyx_scarab_q");
        if (qAb && !qAb.IsNull() && qAb.GetCooldownTimeRemaining() > 4.5) {
            qAb.EndCooldown();
            qAb.StartCooldown(4.5);
        }
    }
    private pulseWave(): void {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !ability || ability.IsNull()) return;
        const dmg = ability.GetSpecialValueFor("wave_damage");
        const origin = parent.GetAbsOrigin();

        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_sandking/sandking_epicenter.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, this.radius, 1));
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findEnemiesInRadius(parent, origin, this.radius)) {
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            const delta = ((origin - enemy.GetAbsOrigin()) as Vector).Normalized();
            const pullCenter = (enemy.GetAbsOrigin() - delta * 90) as Vector;
            knockbackUnitFrom(parent, enemy, pullCenter, 90, 0.25, 0);
        }
    }
}

@registerModifier("modifier_evo_nyx_scarab_r_slow")
export class modifier_evo_nyx_scarab_r_slow extends BaseModifier {
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
        return "sandking_epicenter";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -30;
    }
}
