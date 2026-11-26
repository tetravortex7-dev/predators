import { MutationDefinition, MutationSlotType } from "./data_schemas";

export const EVO_MUTATIONS_CATALOG: readonly MutationDefinition[] = [
    {
        id: "evo_mut_stat_atk_5",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_atk_5",
        iconAbility: "sven_gods_strength",
        bonusDamage: 5,
    },
    {
        id: "evo_mut_stat_ms_5",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_ms_5",
        iconAbility: "dark_seer_surge",
        bonusMoveSpeed: 5,
    },
    {
        id: "evo_mut_stat_mana_regen",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_mana_regen",
        iconAbility: "keeper_of_the_light_chakra_magic",
        bonusManaRegen: 1,
    },
    {
        id: "evo_mut_stat_hp_regen",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_hp_regen",
        iconAbility: "dragon_knight_dragon_blood",
        bonusHealthRegen: 2.5,
    },
    {
        id: "evo_mut_stat_str_1",
        slotType: "PASSIVE_SLOT_1",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_str_1",
        iconAbility: "centaur_return",
        bonusStrength: 1,
    },
    {
        id: "evo_mut_stat_agi_1",
        slotType: "PASSIVE_SLOT_1",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_agi_1",
        iconAbility: "drow_ranger_marksmanship",
        bonusAgility: 1,
    },
    {
        id: "evo_mut_stat_int_1",
        slotType: "PASSIVE_SLOT_1",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_int_1",
        iconAbility: "crystal_maiden_brilliance_aura",
        bonusIntellect: 1,
    },
    {
        id: "evo_mut_stat_armor_1",
        slotType: "PASSIVE_SLOT_2",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_armor_1",
        iconAbility: "sven_warcry",
        bonusArmor: 1,
    },
    {
        id: "evo_mut_stat_as_5",
        slotType: "PASSIVE_SLOT_2",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_as_5",
        iconAbility: "ursa_overpower",
        bonusAttackSpeed: 5,
    },
    {
        id: "evo_mut_stat_hp_40",
        slotType: "PASSIVE_SLOT_2",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mut_stat_hp_40",
        iconAbility: "undying_flesh_golem",
        bonusHealth: 40,
    },
];

export function getMutationDefinition(mutationId: string): MutationDefinition | undefined {
    for (const mutation of EVO_MUTATIONS_CATALOG) {
        if (mutation.id === mutationId) {
            return mutation;
        }
    }
    return undefined;
}

export function getMutationsForSlot(slotType: MutationSlotType): MutationDefinition[] {
    return EVO_MUTATIONS_CATALOG.filter((mutation) => mutation.slotType === slotType);
}
