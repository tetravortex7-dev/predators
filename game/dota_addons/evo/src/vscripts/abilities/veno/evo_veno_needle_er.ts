import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoChitinShard,
    findVenoEnemies,
    getVenoAgi,
    getVenoBranchMaxLevel,
    getVenoTier,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_needle_er";

LinkLuaModifier("modifier_evo_veno_needle_e_passive", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_e_as", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_e_root", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_needle_r", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_needle_e")
export class evo_veno_needle_e extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    GetIntrinsicModifierName(): string {
        return "modifier_evo_veno_needle_e_passive";
    }
}

@registerModifier("modifier_evo_veno_needle_e_as")
export class modifier_evo_veno_needle_e_as extends BaseModifier {
    private asPerStack = 15;
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
        return "viper_nethertoxin";
    }
    OnCreated(): void {
        this.asPerStack = 15;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.asPerStack = ab.GetSpecialValueFor("as_per_stack");
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return this.asPerStack * Math.max(1, this.GetStackCount());
    }
}

@registerModifier("modifier_evo_veno_needle_e_root")
export class modifier_evo_veno_needle_e_root extends BaseModifier {
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
        return "viper_nethertoxin";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}

@registerModifier("modifier_evo_veno_needle_e_passive")
export class modifier_evo_veno_needle_e_passive extends BaseModifier {
    private bonusRange = 75;
    private rootTracking: Map<EntityIndex, { hits: number; lastRoot: number }> = new Map();
    private splitGuard = false;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        this.bonusRange = 75;
        this.rootTracking = new Map();
        this.splitGuard = false;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
        }
    }
    OnRefresh(): void {
        this.bonusRange = 75;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackRangeBonus(): number {
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || parent.PassivesDisabled()) return 0;
        return this.bonusRange;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || event.attacker !== parent) return;
        if (parent.PassivesDisabled()) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return;
        if (target.GetTeamNumber() === parent.GetTeamNumber() || target.IsBuilding()) return;

        const isSlowed =
            target.HasModifier("modifier_evo_veno_needle_q_slow") ||
            target.HasModifier("modifier_evo_veno_glands_slow") ||
            target.HasModifier("modifier_evo_veno_chitin_shard");
        if (isSlowed) {
            const bonusDmg =
                ab.GetSpecialValueFor("slow_bonus_dmg") +
                (getVenoAgi(parent) * ab.GetSpecialValueFor("slow_agi_pct")) / 100;
            ApplyDamage({
                victim: target,
                attacker: parent,
                ability: ab,
                damage: bonusDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            const maxStacks = ab.GetSpecialValueFor("max_as_stacks");
            const asMod = parent.AddNewModifier(parent, ab, "modifier_evo_veno_needle_e_as", {
                duration: ab.GetSpecialValueFor("as_duration"),
            });
            if (asMod !== undefined && asMod.GetStackCount() < maxStacks) {
                asMod.SetStackCount(Math.min(maxStacks, asMod.GetStackCount() + 1));
            }
        }

        const tier = getVenoTier(parent);
        if (tier >= 3 && target.IsRealHero()) {
            const eIdx = target.GetEntityIndex();
            const entry = this.rootTracking.get(eIdx) ?? { hits: 0, lastRoot: -999 };
            entry.hits += 1;
            const now = GameRules.GetGameTime();
            const icd = ab.GetSpecialValueFor("root_icd");
            if (entry.hits >= 4 && now - entry.lastRoot >= icd) {
                entry.hits = 0;
                entry.lastRoot = now;
                const rootDur = tier >= 4 ? 1.2 : 0.9;
                target.AddNewModifier(parent, ab, "modifier_evo_veno_needle_e_root", { duration: rootDur });
            }
            this.rootTracking.set(eIdx, entry);
        }

        if (tier >= 4 && !this.splitGuard) {
            const chance = ab.GetSpecialValueFor("split_chance");
            if (RandomFloat(0, 100) <= chance) {
                const splitRadius = ab.GetSpecialValueFor("split_radius");
                const candidates = findVenoEnemies(parent, target.GetAbsOrigin(), splitRadius).filter(
                    (u) => u && !u.IsNull() && u.IsAlive() && u !== target
                );
                if (candidates.length > 0) {
                    const secondary = candidates[0];
                    const splitDmg = (event.damage * ab.GetSpecialValueFor("split_dmg_pct")) / 100;
                    this.splitGuard = true;
                    ProjectileManager.CreateTrackingProjectile({
                        Target: secondary,
                        Source: parent,
                        Ability: ab,
                        EffectName: "particles/units/heroes/hero_venomancer/venomancer_base_attack.vpcf",
                        iMoveSpeed: 1200,
                        bDodgeable: true,
                    });
                    ApplyDamage({
                        victim: secondary,
                        attacker: parent,
                        ability: ab,
                        damage: splitDmg,
                        damage_type: DamageTypes.PHYSICAL,
                    });
                    this.splitGuard = false;
                }
            }
        }
    }
}

@registerAbility("evo_veno_needle_r")
export class evo_veno_needle_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Venomancer.PoisonNova");
        caster.AddNewModifier(caster, this, "modifier_evo_veno_needle_r", { duration: dur });
    }
}

@registerModifier("modifier_evo_veno_needle_r")
export class modifier_evo_veno_needle_r extends BaseModifier {
    private bonusRange = 175;
    private agiBonus = 0;
    private homingGuard = false;

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
        return "venomancer_noxious_plague";
    }
    OnCreated(): void {
        this.bonusRange = 175;
        this.agiBonus = 0;
        this.homingGuard = false;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (ab && !ab.IsNull() && parent && !parent.IsNull()) {
            this.bonusRange = ab.GetSpecialValueFor("bonus_range");
            this.agiBonus = Math.round((getVenoAgi(parent) * ab.GetSpecialValueFor("agi_bonus_pct")) / 100);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_CANNOT_MISS")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierAttackRangeBonus(): number {
        return this.bonusRange;
    }
    GetModifierBonusStats_Agility(): number {
        return this.agiBonus;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer() || this.homingGuard) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || ab.IsNull() || event.attacker !== parent) return;

        const homingRadius = ab.GetSpecialValueFor("homing_radius");
        const candidates = findVenoEnemies(parent, parent.GetAbsOrigin(), homingRadius);
        if (candidates.length === 0) return;

        let lowest = candidates[0];
        for (const u of candidates) {
            if (u && !u.IsNull() && u.IsAlive() && u.GetHealth() < lowest.GetHealth()) {
                lowest = u;
            }
        }
        if (!lowest || lowest.IsNull() || !lowest.IsAlive()) return;

        const dmg = (parent.GetAverageTrueAttackDamage(lowest) * ab.GetSpecialValueFor("homing_dmg_pct")) / 100;
        this.homingGuard = true;
        ProjectileManager.CreateTrackingProjectile({
            Target: lowest,
            Source: parent,
            Ability: ab,
            EffectName: "particles/units/heroes/hero_venomancer/venomancer_latent_poison_projectile.vpcf",
            iMoveSpeed: 1400,
            bDodgeable: true,
        });
        ApplyDamage({
            victim: lowest,
            attacker: parent,
            ability: ab,
            damage: dmg,
            damage_type: DamageTypes.PHYSICAL,
        });
        applyVenoChitinShard(parent, lowest, ab);
        this.homingGuard = false;
    }
}
