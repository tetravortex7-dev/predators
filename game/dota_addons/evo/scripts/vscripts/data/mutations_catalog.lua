local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 3,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 3,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 3,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 3,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 3,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 3,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 52,["62"] = 3,["63"] = 60,["64"] = 60,["65"] = 60,["66"] = 60,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 3,["71"] = 68,["72"] = 68,["73"] = 68,["74"] = 68,["75"] = 68,["76"] = 68,["77"] = 68,["78"] = 3,["79"] = 76,["80"] = 76,["81"] = 76,["82"] = 76,["83"] = 76,["84"] = 76,["85"] = 76,["86"] = 3,["87"] = 3,["88"] = 86,["89"] = 87,["90"] = 88,["91"] = 89,["94"] = 92,["95"] = 86,["96"] = 95,["97"] = 96,["98"] = 96,["99"] = 96,["100"] = 96,["101"] = 95});
local ____exports = {}
____exports.EVO_MUTATIONS_CATALOG = {
    {
        id = "evo_mut_stat_atk_5",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_atk_5",
        iconAbility = "sven_gods_strength",
        bonusDamage = 5
    },
    {
        id = "evo_mut_stat_ms_5",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_ms_5",
        iconAbility = "dark_seer_surge",
        bonusMoveSpeed = 5
    },
    {
        id = "evo_mut_stat_mana_regen",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_mana_regen",
        iconAbility = "keeper_of_the_light_chakra_magic",
        bonusManaRegen = 1
    },
    {
        id = "evo_mut_stat_hp_regen",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_hp_regen",
        iconAbility = "dragon_knight_dragon_blood",
        bonusHealthRegen = 2.5
    },
    {
        id = "evo_mut_stat_str_1",
        slotType = "PASSIVE_SLOT_1",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_str_1",
        iconAbility = "centaur_return",
        bonusStrength = 1
    },
    {
        id = "evo_mut_stat_agi_1",
        slotType = "PASSIVE_SLOT_1",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_agi_1",
        iconAbility = "drow_ranger_marksmanship",
        bonusAgility = 1
    },
    {
        id = "evo_mut_stat_int_1",
        slotType = "PASSIVE_SLOT_1",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_int_1",
        iconAbility = "crystal_maiden_brilliance_aura",
        bonusIntellect = 1
    },
    {
        id = "evo_mut_stat_armor_1",
        slotType = "PASSIVE_SLOT_2",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_armor_1",
        iconAbility = "sven_warcry",
        bonusArmor = 1
    },
    {
        id = "evo_mut_stat_as_5",
        slotType = "PASSIVE_SLOT_2",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_as_5",
        iconAbility = "ursa_overpower",
        bonusAttackSpeed = 5
    },
    {
        id = "evo_mut_stat_hp_40",
        slotType = "PASSIVE_SLOT_2",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mut_stat_hp_40",
        iconAbility = "undying_flesh_golem",
        bonusHealth = 40
    }
}
function ____exports.getMutationDefinition(self, mutationId)
    for ____, mutation in ipairs(____exports.EVO_MUTATIONS_CATALOG) do
        if mutation.id == mutationId then
            return mutation
        end
    end
    return nil
end
function ____exports.getMutationsForSlot(self, slotType)
    return __TS__ArrayFilter(
        ____exports.EVO_MUTATIONS_CATALOG,
        function(____, mutation) return mutation.slotType == slotType end
    )
end
return ____exports
