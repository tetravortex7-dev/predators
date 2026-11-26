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
    getNyxAgi,
    getNyxBranchMaxLevel,
    getNyxTier,
} from "./evo_nyx_shared";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis";

LinkLuaModifier("modifier_evo_nyx_mantis_q_flurry", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_q_ms", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_w", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_w_as", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_w_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_nyx_mantis_w_shield", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_nyx_mantis_q")
export class evo_nyx_mantis_q extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    GetCooldown(level: number): number {
        const base = [10.0, 9.0, 8.0, 7.0, 6.5][Math.max(0, Math.min(4, level))] ?? 10.0;
        const caster = this.GetCaster();
        if (caster && !caster.IsNull() && caster.HasModifier("modifier_evo_nyx_mantis_r")) {
            return base * 0.5;
        }
        return base;
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const tier = getNyxTier(caster);
        let hits = this.GetSpecialValueFor("hit_count");
        let dur = this.GetSpecialValueFor("duration");

        if (tier >= 4) {
            const wound = target.FindModifierByName("modifier_evo_nyx_mantis_e_wound");
            if (wound && wound.GetStackCount() >= 5) {
                hits = 4;
                dur = dur * (4 / 3);
            }
        }

        target.AddNewModifier(caster, this, "modifier_stunned", { duration: dur });
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_q_flurry", {
            duration: dur + 0.1,
            targetIdx: target.GetEntityIndex(),
            hits,
            interval: dur / hits,
        });
    }
}

@registerModifier("modifier_evo_nyx_mantis_q_flurry")
export class modifier_evo_nyx_mantis_q_flurry extends BaseModifier {
    private targetIdx: EntityIndex = -1 as EntityIndex;
    private remainingHits = 0;
    private bonusPerStrike = 0;
    private dmgPctDelta = -45;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(params: { targetIdx?: EntityIndex; hits?: number; interval?: number }): void {
        this.targetIdx = -1 as EntityIndex;
        this.remainingHits = 0;
        this.bonusPerStrike = 0;
        this.dmgPctDelta = -45;

        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (ability && !ability.IsNull()) {
            const pct = ability.GetSpecialValueFor("attack_damage_pct");
            this.dmgPctDelta = pct - 100;
        }
        const tier = parent && !parent.IsNull() ? getNyxTier(parent) : 2;
        if (tier >= 3) {
            this.bonusPerStrike = tier >= 4 ? 25 : 15;
        }
        if (!IsServer()) return;
        this.targetIdx = (params.targetIdx ?? -1) as EntityIndex;
        this.remainingHits = params.hits ?? 3;
        const interval = params.interval ?? 0.15;
        this.doStrike();
        if (this.remainingHits > 0) {
            this.StartIntervalThink(interval);
        }
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        this.doStrike();
    }
    private doStrike(): void {
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || parent.IsStunned()) {
            this.Destroy();
            return;
        }
        const targetEnt = EntIndexToHScript(this.targetIdx);
        if (!targetEnt || targetEnt.IsNull() || !IsValidEntity(targetEnt) || !targetEnt.IsBaseNPC() || !targetEnt.IsAlive()) {
            this.Destroy();
            return;
        }

        parent.EmitSound("Hero_Pangolier.Swashbuckle.Attack");
        parent.PerformAttack(targetEnt, true, true, true, true, false, false, true);
        this.remainingHits -= 1;

        if (this.remainingHits <= 0) {
            if (targetEnt.IsRealHero()) {
                addLivingChitinStacks(parent, 1);
            }
            if (ability && !ability.IsNull() && getNyxTier(parent) >= 3) {
                parent.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_q_ms", { duration: 2.5 });
            }
            this.Destroy();
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
        ];
    }
    GetModifierDamageOutgoing_Percentage(): number {
        return this.dmgPctDelta;
    }
    GetModifierPreAttack_BonusDamage(): number {
        return this.bonusPerStrike;
    }
}

@registerModifier("modifier_evo_nyx_mantis_q_ms")
export class modifier_evo_nyx_mantis_q_ms extends BaseModifier {
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
        return "pangolier_swashbuckle";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const parent = this.GetParent();
        return parent && !parent.IsNull() && getNyxTier(parent) >= 4 ? 25 : 20;
    }
}

@registerAbility("evo_nyx_mantis_w")
export class evo_nyx_mantis_w extends BaseAbility {
    GetMaxLevel(): number {
        return getNyxBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getNyxTier(caster);
        const duration = this.GetSpecialValueFor("duration");
        const charges = tier >= 4 ? 3 : this.GetSpecialValueFor("block_charges");

        if (tier >= 3) {
            caster.Purge(false, true, false, false, false);
        }
        caster.EmitSound("Hero_Riki.TricksOfTheTrade");
        const mod = caster.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_w", { duration });
        if (mod !== undefined) {
            mod.SetStackCount(charges);
        }
    }
}

@registerModifier("modifier_evo_nyx_mantis_w")
export class modifier_evo_nyx_mantis_w extends BaseModifier {
    private lastRecord = -1;
    private lastPct = 0;

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
        return "riki_tricks_of_the_trade";
    }
    OnCreated(): void {
        this.lastRecord = -1;
        this.lastPct = 0;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")];
    }
    GetModifierIncomingDamage_Percentage(event: ModifierAttackEvent): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const ability = this.GetAbility();
        if (!parent || parent.IsNull() || !ability || ability.IsNull()) return 0;
        if (event.damage <= 0 || this.GetStackCount() <= 0) return 0;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return 0;
        if (event.record !== undefined && event.record === this.lastRecord) {
            return this.lastPct;
        }
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsRealHero()) return 0;
        if (attacker.GetTeamNumber() === parent.GetTeamNumber()) return 0;

        const blockPct = parent.HasModifier("modifier_evo_nyx_mantis_r") ? 65 : ability.GetSpecialValueFor("block_pct");
        const nextCharges = this.GetStackCount() - 1;
        this.SetStackCount(nextCharges);
        addLivingChitinStacks(parent, 1);

        parent.EmitSound("DOTA_Item.BladeMail.Activate");
        const tier = getNyxTier(parent);
        if (tier >= 3) {
            const asMod = parent.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_as", { duration: 3.0 });
            if (asMod !== undefined) {
                asMod.IncrementStackCount();
            }
            for (const enemy of findEnemiesInRadius(parent, parent.GetAbsOrigin(), 250)) {
                enemy.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_slow", { duration: 1.5 });
            }
        }
        if (tier >= 4 && nextCharges <= 0) {
            const shieldAmt = Math.ceil(150 + getNyxAgi(parent) * 0.4);
            const shieldMod = parent.AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_shield", {
                duration: 3.0,
            });
            if (shieldMod !== undefined) {
                shieldMod.SetStackCount(shieldAmt);
            }
            const qAb = parent.FindAbilityByName("evo_nyx_mantis_q");
            if (qAb && !qAb.IsNull()) {
                qAb.EndCooldown();
            }
            this.Destroy();
        } else if (nextCharges <= 0) {
            this.Destroy();
        }

        if (event.record !== undefined) {
            this.lastRecord = event.record;
            this.lastPct = -blockPct;
        }
        return -blockPct;
    }
}

@registerModifier("modifier_evo_nyx_mantis_w_as")
export class modifier_evo_nyx_mantis_w_as extends BaseModifier {
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
        return "riki_tricks_of_the_trade";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.GetStackCount() * 25;
    }
}

@registerModifier("modifier_evo_nyx_mantis_w_slow")
export class modifier_evo_nyx_mantis_w_slow extends BaseModifier {
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
        return "riki_tricks_of_the_trade";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerModifier("modifier_evo_nyx_mantis_w_shield")
export class modifier_evo_nyx_mantis_w_shield extends BaseModifier {
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
        return "riki_tricks_of_the_trade";
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
        this.SetStackCount(Math.max(0, rem));
        if (rem <= 0) {
            this.Destroy();
        }
        return blocked;
    }
}
