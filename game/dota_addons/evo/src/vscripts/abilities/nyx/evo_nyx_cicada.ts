import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import { isEvoCreepUnit } from "../../lib/unit_helpers";
import {
    applyAcousticDisruption,
    findEnemiesInRadius,
    getNyxAllAttrSum,
    getNyxBranchMaxLevel,
    getNyxTier,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_cicada";

LinkLuaModifier("modifier_evo_nyx_cicada_q_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_cicada_w_buff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_cicada_w_sting", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_cicada_q")
export class evo_nyx_cicada_q extends BaseAbility {
    private hitTracker: Map<number, Set<EntityIndex>> = new Map();
    private projSeq = 0;

    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getNyxTier(caster);
        const origin = caster.GetAbsOrigin();
        const dir = ((this.GetCursorPosition() - origin) as Vector).Normalized();
        const range = this.GetSpecialValueFor("range");
        const width = this.GetSpecialValueFor("width");

        this.launchWave(caster, origin, dir, range, width, tier, false);
        if (tier >= 3) {
            GameRules.GetGameModeEntity().SetContextThink(
                DoUniqueString("evo_cicada_echo"),
                () => {
                    if (caster && !caster.IsNull() && IsValidEntity(caster) && this && !this.IsNull()) {
                        this.launchWave(caster, origin, dir, range, 140, tier, true);
                    }
                    return undefined;
                },
                0.6
            );
        }
    }
    private launchWave(
        caster: CDOTA_BaseNPC,
        origin: Vector,
        dir: Vector,
        range: number,
        width: number,
        tier: number,
        isEcho: boolean
    ): void {
        this.projSeq += 1;
        const waveId = this.projSeq;
        this.hitTracker.set(waveId, new Set());

        caster.EmitSound("Hero_QueenOfPain.SonicWave");
        ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_queenofpain/queen_sonic_wave.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: width,
            fEndRadius: width,
            Source: caster,
            bHasFrontalCone: false,
            iUnitTargetTeam: UnitTargetTeam.ENEMY,
            iUnitTargetFlags: UnitTargetFlags.NONE,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            fExpireTime: GameRules.GetGameTime() + 4.0,
            vVelocity: (dir * 1350) as Vector,
            bProvidesVision: false,
            ExtraData: { waveId, isEcho: isEcho ? 1 : 0, tier },
        });
    }
    OnProjectileHit_ExtraData(
        target: CDOTA_BaseNPC | undefined,
        _location: Vector,
        extraData: { waveId?: number; isEcho?: number; tier?: number }
    ): boolean {
        if (!IsServer() || !target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            return false;
        }
        const waveId = extraData.waveId ?? 0;
        const tracked = this.hitTracker.get(waveId);
        if (tracked) {
            const idx = target.GetEntityIndex();
            if (tracked.has(idx)) return false;
            tracked.add(idx);
        }

        const caster = this.GetCaster();
        const isEcho = (extraData.isEcho ?? 0) === 1;
        const tier = extraData.tier ?? getNyxTier(caster);
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const allPct = this.GetSpecialValueFor("all_pct") / 100;
        let dmg = baseDmg + getNyxAllAttrSum(caster) * allPct;
        if (isEcho) {
            dmg *= 0.5;
        }
        if (isEvoCreepUnit(target)) {
            dmg *= this.GetSpecialValueFor("creep_mult");
        }

        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });
        applyAcousticDisruption(caster, target, this, Math.max(1, tier - 1));
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_cicada_q_ms", { duration: 2.5 });

        if (!isEcho && tier >= 4 && target.IsRealHero()) {
            for (const name of ["evo_nyx_cicada_q", "evo_nyx_cicada_w", "evo_nyx_cicada_e"]) {
                const ab = caster.FindAbilityByName(name);
                if (ab && !ab.IsNull()) {
                    const rem = ab.GetCooldownTimeRemaining();
                    if (rem > 0) {
                        ab.EndCooldown();
                        ab.StartCooldown(Math.max(0.05, rem - 0.8));
                    }
                }
            }
        }
        return false;
    }
}

@registerModifier("modifier_evo_nyx_cicada_q_ms")
export class modifier_evo_nyx_cicada_q_ms extends BaseModifier {
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
        return "queenofpain_sonic_wave";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("ms_bonus_pct") : 14;
    }
}

@registerAbility("evo_nyx_cicada_w")
export class evo_nyx_cicada_w extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        caster.EmitSound("Hero_Silencer.GlaivesOfWisdom");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_cicada_w_buff", { duration: 8.0 });
    }
}

@registerModifier("modifier_evo_nyx_cicada_w_buff")
export class modifier_evo_nyx_cicada_w_buff extends BaseModifier {
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
        return "silencer_glaives_of_wisdom";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackRangeBonus(): number {
        const ability = this.GetAbility();
        return ability && !ability.IsNull() ? ability.GetSpecialValueFor("range_bonus") : 150;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return;
        if (event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.GetTeamNumber() === parent.GetTeamNumber()) {
            return;
        }
        const dmg = ability.GetSpecialValueFor("base_damage") + (getNyxAllAttrSum(parent) * ability.GetSpecialValueFor("all_pct")) / 100;
        ApplyDamage({
            victim: target,
            attacker: parent,
            ability,
            damage: dmg,
            damage_type: DamageTypes.PHYSICAL,
        });
        const sting = target.AddNewModifier(parent, ability, "modifier_evo_nyx_cicada_w_sting", {
            duration: ability.GetSpecialValueFor("sting_duration"),
            implantTime: GameRules.GetDOTATime(false, false),
        });
        if (sting !== undefined) {
            sting.SetStackCount(0);
        }
        this.Destroy();
    }
}

@registerModifier("modifier_evo_nyx_cicada_w_sting")
export class modifier_evo_nyx_cicada_w_sting extends BaseModifier {
    private implantTime = -999;
    private lastTriggerTime = -999;
    private shattered = false;

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
        return "silencer_glaives_of_wisdom";
    }
    OnCreated(params: { implantTime?: number }): void {
        this.implantTime = params.implantTime ?? GameRules.GetDOTATime(false, false);
        this.lastTriggerTime = this.implantTime;
        this.shattered = false;
    }
    OnRefresh(params: { implantTime?: number }): void {
        this.implantTime = params.implantTime ?? GameRules.GetDOTATime(false, false);
        this.lastTriggerTime = this.implantTime;
        this.shattered = false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer() || this.shattered) return;
        const caster = this.GetCaster();
        const target = this.GetParent();
        if (!caster || caster.IsNull() || event.attacker !== caster || event.target !== target) return;
        this.advancePulse();
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer() || this.shattered) return;
        const caster = this.GetCaster();
        const target = this.GetParent();
        if (!caster || caster.IsNull() || event.attacker !== caster || event.unit !== target) return;
        if (!event.inflictor || event.inflictor.IsNull() || event.inflictor.IsItem()) return;
        if (event.inflictor === this.GetAbility()) return;
        this.advancePulse();
    }
    public advancePulse(): void {
        if (this.shattered) return;
        const caster = this.GetCaster();
        const target = this.GetParent();
        const ability = this.GetAbility();
        if (!caster || caster.IsNull() || !target || target.IsNull() || !target.IsAlive() || !ability || ability.IsNull()) {
            return;
        }
        const now = GameRules.GetDOTATime(false, false);
        if (now - this.lastTriggerTime < 0.08) return;
        this.lastTriggerTime = now;

        const tier = getNyxTier(caster);
        const radius = ability.GetSpecialValueFor("pulse_radius");
        const pulseDmg =
            ability.GetSpecialValueFor("pulse_damage") +
            (getNyxAllAttrSum(caster) * ability.GetSpecialValueFor("pulse_all_pct")) / 100;

        this.triggerPulseAt(caster, ability, target.GetAbsOrigin(), radius, pulseDmg);
        const nextCount = this.GetStackCount() + 1;
        this.SetStackCount(nextCount);

        const needed = tier >= 4 && target.HasModifier("modifier_evo_nyx_acoustic_disruption") ? 2 : 3;
        if (nextCount >= needed) {
            this.shattered = true;
            target.EmitSound("Hero_Silencer.Curse.Impact");
            target.AddNewModifier(caster, ability, "modifier_stunned", {
                duration: ability.GetSpecialValueFor("stun_duration"),
            });
            if (tier >= 3) {
                target.AddNewModifier(caster, ability, "modifier_disarmed", {
                    duration: tier >= 4 ? 2.0 : 1.5,
                });
                caster.GiveMana(tier >= 4 ? 35 : 25);
            }
            if (tier >= 4) {
                const others = findEnemiesInRadius(caster, target.GetAbsOrigin(), 350).filter((e) => e !== target);
                if (others.length > 0) {
                    others.sort((a, b) => {
                        const aAd = a.HasModifier("modifier_evo_nyx_acoustic_disruption") ? 1 : 0;
                        const bAd = b.HasModifier("modifier_evo_nyx_acoustic_disruption") ? 1 : 0;
                        return bAd - aAd;
                    });
                    this.triggerPulseAt(caster, ability, others[0].GetAbsOrigin(), radius, pulseDmg);
                }
            }
            this.Destroy();
        }
    }
    private triggerPulseAt(
        caster: CDOTA_BaseNPC,
        ability: CDOTABaseAbility,
        center: Vector,
        radius: number,
        dmg: number
    ): void {
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_silencer/silencer_curse_hit.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, center);
        ParticleManager.ReleaseParticleIndex(pfx);

        for (const enemy of findEnemiesInRadius(caster, center, radius)) {
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}
