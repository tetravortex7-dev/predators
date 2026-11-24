local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 41,["13"] = 47,["14"] = 48,["15"] = 49,["16"] = 50,["17"] = 51,["20"] = 54,["21"] = 47,["22"] = 57,["23"] = 58,["25"] = 59,["26"] = 59,["28"] = 60,["29"] = 61,["30"] = 61,["32"] = 62,["36"] = 57,["37"] = 68,["38"] = 69,["39"] = 70,["40"] = 71,["41"] = 71,["42"] = 71,["44"] = 71,["45"] = 76,["46"] = 77,["47"] = 78,["48"] = 79,["49"] = 80,["50"] = 81,["51"] = 82,["52"] = 83,["53"] = 84,["54"] = 86,["55"] = 87,["56"] = 88,["58"] = 89,["59"] = 90,["60"] = 90,["62"] = 91,["63"] = 95,["64"] = 95,["65"] = 95,["66"] = 95,["67"] = 95,["68"] = 95,["69"] = 95,["70"] = 95,["71"] = 95,["72"] = 95,["77"] = 107,["78"] = 109,["79"] = 68});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local getTierConfig = ____game_constants.getTierConfig
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
____exports.MUTATION_SLOT_ORDER = {"ACTIVE_UPGRADE", "PASSIVE_SLOT_1", "PASSIVE_SLOT_2"}
function ____exports.findFloorEvoThreshold(self, points)
    local floorValue = 0
    for ____, threshold in ipairs(EVO_CONSTANTS.EVO_THRESHOLDS) do
        if points >= threshold then
            floorValue = threshold
        end
    end
    return floorValue
end
function ____exports.reapplyMutationsToHero(self, hero, state)
    for ____, mutationId in ipairs(state.mutations) do
        do
            if not mutationId then
                goto __continue7
            end
            local mutationDef = getMutationDefinition(nil, mutationId)
            if not mutationDef then
                goto __continue7
            end
            hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
        end
        ::__continue7::
    end
end
function ____exports.syncPlayerEvoNetTable(self, playerId, state)
    local tierConfig = getTierConfig(nil, state.tierIndex)
    local key = tostring(playerId)
    local ____temp_0 = CustomNetTables:GetTableValue("player_evo", key)
    if ____temp_0 == nil then
        ____temp_0 = {}
    end
    local existing = ____temp_0
    existing.body_id = state.bodyId
    existing.tier_index = state.tierIndex
    existing.tier_label = tierConfig.label
    existing.evo_points = state.evoPoints
    existing.biomass = state.biomass
    existing.mutations = state.mutations
    existing.pending_draft_type = state.pendingDraftType
    existing.pending_mutation_slot = state.pendingMutationSlot
    existing.draft_options = state.draftOptions
    local draftMeta = {}
    if state.pendingDraftType == "BODY" then
        for ____, optId in ipairs(state.draftOptions) do
            do
                local b = getBodyDefinition(nil, optId)
                if not b then
                    goto __continue13
                end
                local abList = b.kitAbilities and #b.kitAbilities > 0 and b.kitAbilities or ({b.signatureAbility, b.innateAbility})
                draftMeta[optId] = {
                    hero_class = b.heroClass or "",
                    attr = b.primaryAttribute,
                    abilities = abList,
                    ms = b.baseMoveSpeed,
                    str = b.baseStr,
                    agi = b.baseAgi,
                    int = b.baseInt,
                    tier_index = b.tierIndex
                }
            end
            ::__continue13::
        end
    end
    existing.draft_meta = draftMeta
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
