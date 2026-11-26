import { MutationDefinition } from "../data/data_schemas";
import { getMutationDefinition } from "../data/mutations_catalog";
import { BaseModifier, dotaModifierFunction, registerModifier } from "../lib/dota_ts_adapter";

const MUTATION_RUNTIME_SCRIPT = "modifiers/modifier_evo_mutation_runtime";

export const EVO_MUTATION_MODIFIERS: readonly string[] = [
    "modifier_evo_mutation_runtime",
    "modifier_evo_mut_stat_atk_5",
    "modifier_evo_mut_stat_ms_5",
    "modifier_evo_mut_stat_mana_regen",
    "modifier_evo_mut_stat_hp_regen",
    "modifier_evo_mut_stat_str_1",
    "modifier_evo_mut_stat_agi_1",
    "modifier_evo_mut_stat_int_1",
    "modifier_evo_mut_stat_armor_1",
    "modifier_evo_mut_stat_as_5",
    "modifier_evo_mut_stat_hp_40",
];

export function linkMutationModifiers(): void {
    for (const modName of EVO_MUTATION_MODIFIERS) {
        LinkLuaModifier(modName, MUTATION_RUNTIME_SCRIPT, LuaModifierMotionType.NONE);
    }
}

class BaseMutationRuntimeModifier extends BaseModifier {
    private mutationDef?: MutationDefinition;

    protected getDefaultMutationId(): string | undefined {
        return undefined;
    }

    public IsHidden(): boolean {
        return false;
    }

    public IsDebuff(): boolean {
        return false;
    }

    public IsPurgable(): boolean {
        return false;
    }

    public RemoveOnDeath(): boolean {
        return false;
    }

    public GetAttributes(): ModifierAttribute {
        return ModifierAttribute.PERMANENT;
    }

    public OnCreated(params: { mutation_id?: string }): void {
        const mutId = params?.mutation_id ?? this.getDefaultMutationId();
        if (mutId) {
            this.mutationDef = getMutationDefinition(mutId);
        }
    }

    public OnRefresh(params: { mutation_id?: string }): void {
        const mutId = params?.mutation_id ?? this.getDefaultMutationId();
        if (mutId) {
            this.mutationDef = getMutationDefinition(mutId);
        }
    }

    public DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        ];
    }

    public GetModifierPreAttack_BonusDamage(): number {
        return this.mutationDef?.bonusDamage ?? 0;
    }

    public GetModifierPhysicalArmorBonus(): number {
        return this.mutationDef?.bonusArmor ?? 0;
    }

    public GetModifierMoveSpeedBonus_Constant(): number {
        return this.mutationDef?.bonusMoveSpeed ?? 0;
    }

    public GetModifierAttackSpeedBonus_Constant(): number {
        return this.mutationDef?.bonusAttackSpeed ?? 0;
    }

    public GetModifierHealthBonus(): number {
        return this.mutationDef?.bonusHealth ?? 0;
    }

    public GetModifierConstantManaRegen(): number {
        return this.mutationDef?.bonusManaRegen ?? 0;
    }

    public GetModifierConstantHealthRegen(): number {
        return this.mutationDef?.bonusHealthRegen ?? 0;
    }

    public GetModifierBonusStats_Strength(): number {
        return this.mutationDef?.bonusStrength ?? 0;
    }

    public GetModifierBonusStats_Agility(): number {
        return this.mutationDef?.bonusAgility ?? 0;
    }

    public GetModifierBonusStats_Intellect(): number {
        return this.mutationDef?.bonusIntellect ?? 0;
    }
}

@registerModifier("modifier_evo_mutation_runtime")
export class modifier_evo_mutation_runtime extends BaseMutationRuntimeModifier {
    public GetTexture(): string {
        return "alchemist_chemical_rage";
    }
}

@registerModifier("modifier_evo_mut_stat_atk_5")
export class modifier_evo_mut_stat_atk_5 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_atk_5";
    }

    public GetTexture(): string {
        return "sven_gods_strength";
    }
}

@registerModifier("modifier_evo_mut_stat_ms_5")
export class modifier_evo_mut_stat_ms_5 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_ms_5";
    }

    public GetTexture(): string {
        return "dark_seer_surge";
    }
}

@registerModifier("modifier_evo_mut_stat_mana_regen")
export class modifier_evo_mut_stat_mana_regen extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_mana_regen";
    }

    public GetTexture(): string {
        return "keeper_of_the_light_chakra_magic";
    }
}

@registerModifier("modifier_evo_mut_stat_hp_regen")
export class modifier_evo_mut_stat_hp_regen extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_hp_regen";
    }

    public GetTexture(): string {
        return "dragon_knight_dragon_blood";
    }
}

@registerModifier("modifier_evo_mut_stat_str_1")
export class modifier_evo_mut_stat_str_1 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_str_1";
    }

    public GetTexture(): string {
        return "centaur_return";
    }
}

@registerModifier("modifier_evo_mut_stat_agi_1")
export class modifier_evo_mut_stat_agi_1 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_agi_1";
    }

    public GetTexture(): string {
        return "drow_ranger_marksmanship";
    }
}

@registerModifier("modifier_evo_mut_stat_int_1")
export class modifier_evo_mut_stat_int_1 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_int_1";
    }

    public GetTexture(): string {
        return "crystal_maiden_brilliance_aura";
    }
}

@registerModifier("modifier_evo_mut_stat_armor_1")
export class modifier_evo_mut_stat_armor_1 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_armor_1";
    }

    public GetTexture(): string {
        return "sven_warcry";
    }
}

@registerModifier("modifier_evo_mut_stat_as_5")
export class modifier_evo_mut_stat_as_5 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_as_5";
    }

    public GetTexture(): string {
        return "ursa_overpower";
    }
}

@registerModifier("modifier_evo_mut_stat_hp_40")
export class modifier_evo_mut_stat_hp_40 extends BaseMutationRuntimeModifier {
    protected getDefaultMutationId(): string {
        return "evo_mut_stat_hp_40";
    }

    public GetTexture(): string {
        return "undying_flesh_golem";
    }
}
