import { BaseModifier, dotaModifierFunction, registerModifier } from "../../lib/dota_ts_adapter";

const ABILITY_SCRIPT_PATH = "modifiers/neutrals/modifier_evo_creep_abilities";

const ALL_ABILITY_MODS: readonly string[] = [
    "modifier_evo_creep_ability_frost",
    "modifier_evo_creep_debuff_frost",
    "modifier_evo_creep_ability_venom",
    "modifier_evo_creep_debuff_venom",
    "modifier_evo_creep_ability_sunder",
    "modifier_evo_creep_debuff_sunder",
    "modifier_evo_creep_ability_manaburn",
    "modifier_evo_creep_ability_crit",
    "modifier_evo_creep_ability_explode",
    "modifier_evo_creep_ability_stomp",
    "modifier_evo_creep_debuff_stomp",
];

if (IsServer()) {
    for (const modName of ALL_ABILITY_MODS) {
        LinkLuaModifier(modName, ABILITY_SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

export const EVO_CREEP_ABILITY_MODIFIERS: readonly string[] = [
    "modifier_evo_creep_ability_frost",
    "modifier_evo_creep_ability_venom",
    "modifier_evo_creep_ability_sunder",
    "modifier_evo_creep_ability_manaburn",
    "modifier_evo_creep_ability_crit",
    "modifier_evo_creep_ability_explode",
    "modifier_evo_creep_ability_stomp",
];

function clampTier(raw: number): number {
    if (raw <= 1) return 1;
    if (raw >= 3) return 3;
    return 2;
}

function pickByTier(tier: number, t1: number, t2: number, t3: number): number {
    const t = clampTier(tier);
    if (t === 1) return t1;
    if (t === 2) return t2;
    return t3;
}

@registerModifier("modifier_evo_creep_ability_frost")
export class modifier_evo_creep_ability_frost extends BaseModifier {
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
        return "ghost_frost_attack";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding() || target.IsMagicImmune()) {
            return;
        }
        target.AddNewModifier(parent, undefined, "modifier_evo_creep_debuff_frost", { duration: 2.5 });
    }
}

@registerModifier("modifier_evo_creep_debuff_frost")
export class modifier_evo_creep_debuff_frost extends BaseModifier {
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
        return "ghost_frost_attack";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return -25;
    }
}

@registerModifier("modifier_evo_creep_ability_venom")
export class modifier_evo_creep_ability_venom extends BaseModifier {
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
        return "gnoll_assassin_envenomed_weapon";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding() || target.IsMagicImmune()) {
            return;
        }
        const mod = target.AddNewModifier(parent, undefined, "modifier_evo_creep_debuff_venom", { duration: 4.0 });
        if (mod !== undefined) {
            mod.SetStackCount(clampTier(this.GetStackCount()));
        }
    }
}

@registerModifier("modifier_evo_creep_debuff_venom")
export class modifier_evo_creep_debuff_venom extends BaseModifier {
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
        return "gnoll_assassin_envenomed_weapon";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        const dps = pickByTier(this.GetStackCount(), 12, 24, 42);
        ApplyDamage({
            victim: parent,
            attacker: caster && !caster.IsNull() ? caster : parent,
            damage: dps,
            damage_type: DamageTypes.MAGICAL,
        });
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
            dotaModifierFunction("MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE"),
        ];
    }
    GetModifierHealAmplify_PercentageTarget(): number {
        return -25;
    }
    GetModifierHPRegenAmplify_Percentage(): number {
        return -25;
    }
}

@registerModifier("modifier_evo_creep_ability_sunder")
export class modifier_evo_creep_ability_sunder extends BaseModifier {
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
        return "item_desolator";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;
        const mod = target.AddNewModifier(parent, undefined, "modifier_evo_creep_debuff_sunder", { duration: 4.0 });
        if (mod !== undefined) {
            mod.SetStackCount(clampTier(this.GetStackCount()));
        }
    }
}

@registerModifier("modifier_evo_creep_debuff_sunder")
export class modifier_evo_creep_debuff_sunder extends BaseModifier {
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
        return "item_desolator";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return -pickByTier(this.GetStackCount(), 3, 5, 8);
    }
}

@registerModifier("modifier_evo_creep_ability_manaburn")
export class modifier_evo_creep_ability_manaburn extends BaseModifier {
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
        return "necronomicon_warrior_mana_burn";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding() || target.IsMagicImmune()) {
            return;
        }
        const burn = pickByTier(this.GetStackCount(), 20, 35, 55);
        const available = target.GetMana();
        const actual = Math.min(available, burn);
        if (actual <= 0) return;
        target.SetMana(Math.max(0, available - actual));
        ApplyDamage({
            victim: target,
            attacker: parent,
            damage: actual,
            damage_type: DamageTypes.PHYSICAL,
        });
    }
}

@registerModifier("modifier_evo_creep_ability_crit")
export class modifier_evo_creep_ability_crit extends BaseModifier {
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
        return "alpha_wolf_critical_strike";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE")];
    }
    GetModifierPreAttack_CriticalStrike(): number {
        if (!IsServer()) return 0;
        if (RandomInt(1, 100) <= 20) {
            return pickByTier(this.GetStackCount(), 160, 180, 200);
        }
        return 0;
    }
}

@registerModifier("modifier_evo_creep_ability_explode")
export class modifier_evo_creep_ability_explode extends BaseModifier {
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
        return "techies_suicide";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_DEATH")];
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        const damage = Math.max(40, Math.floor(parent.GetMaxHealth() * 0.1));
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            275,
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
                damage,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_creep_ability_stomp")
export class modifier_evo_creep_ability_stomp extends BaseModifier {
    private nextReadyTime = 0;

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
        return "centaur_khan_war_stomp";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.nextReadyTime = 0;
        this.StartIntervalThink(1.0);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (parent.IsStunned() || parent.IsSilenced() || parent.IsHexed()) return;
        const now = GameRules.GetDOTATime(false, false);
        if (now < this.nextReadyTime) return;

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            275,
            UnitTargetTeam.ENEMY,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        if (enemies.length === 0) return;

        this.nextReadyTime = now + 8.0;
        const tier = clampTier(this.GetStackCount());
        const damage = pickByTier(tier, 65, 130, 240);
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                damage,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(parent, undefined, "modifier_evo_creep_debuff_stomp", { duration: 2.0 });
            if (tier >= 3) {
                enemy.AddNewModifier(parent, undefined, "modifier_stunned", { duration: 0.7 });
            }
        }
    }
}

@registerModifier("modifier_evo_creep_debuff_stomp")
export class modifier_evo_creep_debuff_stomp extends BaseModifier {
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
        return "centaur_khan_war_stomp";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -35;
    }
}
