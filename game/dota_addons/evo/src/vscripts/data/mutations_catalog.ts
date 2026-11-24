import { MutationDefinition, MutationSlotType } from "./data_schemas";

export const EVO_MUTATIONS_CATALOG: readonly MutationDefinition[] = [
    {
        id: "evo_mut_active_frenzy",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mutation_runtime",
        bonusDamage: 18,
        bonusAttackSpeed: 25,
    },
    {
        id: "evo_mut_active_surge",
        slotType: "ACTIVE_UPGRADE",
        triggerType: "INTERVAL",
        modifierName: "modifier_evo_mutation_runtime",
        bonusMoveSpeed: 20,
        intervalSeconds: 10,
    },
    {
        id: "evo_mut_passive_chitin",
        slotType: "PASSIVE_SLOT_1",
        triggerType: "PASSIVE",
        modifierName: "modifier_evo_mutation_runtime",
        bonusArmor: 5,
        bonusHealth: 200,
    },
    {
        id: "evo_mut_passive_adrenaline",
        slotType: "PASSIVE_SLOT_1",
        triggerType: "HP_BELOW_PERCENT",
        modifierName: "modifier_evo_mutation_runtime",
        thresholdPercent: 35,
        bonusMoveSpeed: 45,
        bonusAttackSpeed: 40,
        cooldown: 12,
    },
    {
        id: "evo_mut_passive_bloodlust",
        slotType: "PASSIVE_SLOT_2",
        triggerType: "ON_KILL",
        modifierName: "modifier_evo_mutation_runtime",
        bonusDamage: 12,
        cooldown: 5,
    },
    {
        id: "evo_mut_passive_spines",
        slotType: "PASSIVE_SLOT_2",
        triggerType: "ON_DAMAGE_TAKEN",
        modifierName: "modifier_evo_mutation_runtime",
        bonusArmor: 3,
        cooldown: 6,
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
