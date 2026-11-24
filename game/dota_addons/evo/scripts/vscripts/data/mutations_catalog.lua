local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 3,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 3,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 3,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 3,["41"] = 38,["42"] = 38,["43"] = 38,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 3,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 46,["54"] = 46,["55"] = 46,["56"] = 3,["57"] = 3,["58"] = 56,["59"] = 57,["60"] = 58,["61"] = 59,["64"] = 62,["65"] = 56,["66"] = 65,["67"] = 66,["68"] = 66,["69"] = 66,["70"] = 66,["71"] = 65});
local ____exports = {}
____exports.EVO_MUTATIONS_CATALOG = {
    {
        id = "evo_mut_active_frenzy",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mutation_runtime",
        bonusDamage = 18,
        bonusAttackSpeed = 25
    },
    {
        id = "evo_mut_active_surge",
        slotType = "ACTIVE_UPGRADE",
        triggerType = "INTERVAL",
        modifierName = "modifier_evo_mutation_runtime",
        bonusMoveSpeed = 20,
        intervalSeconds = 10
    },
    {
        id = "evo_mut_passive_chitin",
        slotType = "PASSIVE_SLOT_1",
        triggerType = "PASSIVE",
        modifierName = "modifier_evo_mutation_runtime",
        bonusArmor = 5,
        bonusHealth = 200
    },
    {
        id = "evo_mut_passive_adrenaline",
        slotType = "PASSIVE_SLOT_1",
        triggerType = "HP_BELOW_PERCENT",
        modifierName = "modifier_evo_mutation_runtime",
        thresholdPercent = 35,
        bonusMoveSpeed = 45,
        bonusAttackSpeed = 40,
        cooldown = 12
    },
    {
        id = "evo_mut_passive_bloodlust",
        slotType = "PASSIVE_SLOT_2",
        triggerType = "ON_KILL",
        modifierName = "modifier_evo_mutation_runtime",
        bonusDamage = 12,
        cooldown = 5
    },
    {
        id = "evo_mut_passive_spines",
        slotType = "PASSIVE_SLOT_2",
        triggerType = "ON_DAMAGE_TAKEN",
        modifierName = "modifier_evo_mutation_runtime",
        bonusArmor = 3,
        cooldown = 6
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
