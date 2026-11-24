import { BaseModifier, dotaModifierFunction, registerModifier } from "../../lib/dota_ts_adapter";

const AURA_SCRIPT_PATH = "modifiers/neutrals/modifier_evo_creep_auras";

const ALL_AURA_MODS: readonly string[] = [
    "modifier_evo_creep_aura_frenzy_emitter",
    "modifier_evo_creep_aura_frenzy",
    "modifier_evo_creep_aura_carapace_emitter",
    "modifier_evo_creep_aura_carapace",
    "modifier_evo_creep_aura_vitality_emitter",
    "modifier_evo_creep_aura_vitality",
    "modifier_evo_creep_aura_vampiric_emitter",
    "modifier_evo_creep_aura_vampiric",
    "modifier_evo_creep_aura_haste_emitter",
    "modifier_evo_creep_aura_haste",
    "modifier_evo_creep_aura_thorns_emitter",
    "modifier_evo_creep_aura_thorns",
    "modifier_evo_creep_aura_ward_emitter",
    "modifier_evo_creep_aura_ward",
];

if (IsServer()) {
    for (const modName of ALL_AURA_MODS) {
        LinkLuaModifier(modName, AURA_SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

export const EVO_CREEP_AURA_MODIFIERS: readonly string[] = [
    "modifier_evo_creep_aura_frenzy_emitter",
    "modifier_evo_creep_aura_carapace_emitter",
    "modifier_evo_creep_aura_vitality_emitter",
    "modifier_evo_creep_aura_vampiric_emitter",
    "modifier_evo_creep_aura_haste_emitter",
    "modifier_evo_creep_aura_thorns_emitter",
    "modifier_evo_creep_aura_ward_emitter",
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

function syncAuraTier(mod: BaseModifier, emitterName: string): void {
    if (!IsServer()) return;
    const caster = mod.GetCaster();
    if (!caster || caster.IsNull() || !IsValidEntity(caster)) {
        mod.SetStackCount(1);
        return;
    }
    const emitter = caster.FindModifierByName(emitterName);
    mod.SetStackCount(emitter ? clampTier(emitter.GetStackCount()) : 1);
}

class BaseCreepAuraEmitter extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    IsAura(): boolean {
        return true;
    }
    GetAuraRadius(): number {
        return 700;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.FRIENDLY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.BASIC + UnitTargetType.CREEP) as UnitTargetType;
    }
    GetAuraDuration(): number {
        return 0.5;
    }
}

@registerModifier("modifier_evo_creep_aura_frenzy_emitter")
export class modifier_evo_creep_aura_frenzy_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_frenzy";
    }
}

@registerModifier("modifier_evo_creep_aura_frenzy")
export class modifier_evo_creep_aura_frenzy extends BaseModifier {
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
        return "alpha_wolf_command_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_frenzy_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_frenzy_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")];
    }
    GetModifierAttackSpeedBonus_Constant(): number {
        return pickByTier(this.GetStackCount(), 20, 35, 55);
    }
}

@registerModifier("modifier_evo_creep_aura_carapace_emitter")
export class modifier_evo_creep_aura_carapace_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_carapace";
    }
}

@registerModifier("modifier_evo_creep_aura_carapace")
export class modifier_evo_creep_aura_carapace extends BaseModifier {
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
        return "enraged_wildkin_toughness_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_carapace_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_carapace_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")];
    }
    GetModifierPhysicalArmorBonus(): number {
        return pickByTier(this.GetStackCount(), 3, 5, 9);
    }
}

@registerModifier("modifier_evo_creep_aura_vitality_emitter")
export class modifier_evo_creep_aura_vitality_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_vitality";
    }
}

@registerModifier("modifier_evo_creep_aura_vitality")
export class modifier_evo_creep_aura_vitality extends BaseModifier {
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
        return "satyr_hellcaller_unholy_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_vitality_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_vitality_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE")];
    }
    GetModifierHealthRegenPercentage(): number {
        return pickByTier(this.GetStackCount(), 1.2, 2.0, 3.0);
    }
}

@registerModifier("modifier_evo_creep_aura_vampiric_emitter")
export class modifier_evo_creep_aura_vampiric_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_vampiric";
    }
}

@registerModifier("modifier_evo_creep_aura_vampiric")
export class modifier_evo_creep_aura_vampiric extends BaseModifier {
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
        return "skeleton_king_vampiric_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_vampiric_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_vampiric_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (event.attacker !== parent) return;
        if (!event.target || event.target.IsNull() || event.target.IsBuilding()) return;
        const pct = pickByTier(this.GetStackCount(), 0.12, 0.2, 0.28);
        const heal = event.damage * pct;
        if (heal <= 0) return;
        parent.Heal(heal, undefined);
        const pfx = ParticleManager.CreateParticle(
            "particles/generic_gameplay/generic_lifesteal.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            parent
        );
        ParticleManager.ReleaseParticleIndex(pfx);
    }
}

@registerModifier("modifier_evo_creep_aura_haste_emitter")
export class modifier_evo_creep_aura_haste_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_haste";
    }
}

@registerModifier("modifier_evo_creep_aura_haste")
export class modifier_evo_creep_aura_haste extends BaseModifier {
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
        return "kobold_taskmaster_speed_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_haste_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_haste_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return pickByTier(this.GetStackCount(), 12, 16, 20);
    }
}

@registerModifier("modifier_evo_creep_aura_thorns_emitter")
export class modifier_evo_creep_aura_thorns_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_thorns";
    }
}

@registerModifier("modifier_evo_creep_aura_thorns")
export class modifier_evo_creep_aura_thorns extends BaseModifier {
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
        return "centaur_return";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_thorns_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_thorns_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE")];
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;
        if (event.unit !== parent) return;
        const attacker = event.attacker;
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || attacker === parent || !attacker.IsAlive()) {
            return;
        }
        if (event.damage_type !== DamageTypes.PHYSICAL) return;
        if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return;
        const pct = pickByTier(this.GetStackCount(), 0.1, 0.14, 0.2);
        const reflected = event.original_damage * pct;
        if (reflected <= 1) return;
        ApplyDamage({
            victim: attacker,
            attacker: parent,
            damage: reflected,
            damage_type: DamageTypes.PHYSICAL,
            damage_flags: DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION,
        });
    }
}

@registerModifier("modifier_evo_creep_aura_ward_emitter")
export class modifier_evo_creep_aura_ward_emitter extends BaseCreepAuraEmitter {
    GetModifierAura(): string {
        return "modifier_evo_creep_aura_ward";
    }
}

@registerModifier("modifier_evo_creep_aura_ward")
export class modifier_evo_creep_aura_ward extends BaseModifier {
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
        return "centaur_khan_endurance_aura";
    }
    OnCreated(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_ward_emitter");
    }
    OnRefresh(): void {
        syncAuraTier(this, "modifier_evo_creep_aura_ward_emitter");
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        return pickByTier(this.GetStackCount(), 15, 24, 32);
    }
}
