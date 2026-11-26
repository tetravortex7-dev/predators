local ____lualib = require("lualib_bundle")
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 41,["14"] = 47,["15"] = 48,["17"] = 49,["18"] = 49,["19"] = 50,["20"] = 51,["21"] = 52,["22"] = 53,["23"] = 49,["26"] = 55,["27"] = 55,["28"] = 55,["29"] = 55,["30"] = 55,["31"] = 47,["32"] = 58,["33"] = 59,["34"] = 60,["35"] = 61,["36"] = 62,["39"] = 65,["40"] = 58,["41"] = 68,["42"] = 69,["44"] = 70,["45"] = 70,["47"] = 71,["48"] = 72,["49"] = 72,["51"] = 73,["55"] = 68,["56"] = 79,["57"] = 80,["58"] = 81,["59"] = 82,["60"] = 82,["61"] = 82,["63"] = 82,["64"] = 87,["65"] = 88,["66"] = 89,["67"] = 90,["68"] = 91,["69"] = 92,["70"] = 93,["71"] = 94,["72"] = 95,["73"] = 97,["74"] = 98,["75"] = 99,["77"] = 100,["78"] = 101,["79"] = 101,["81"] = 102,["82"] = 106,["83"] = 106,["84"] = 106,["85"] = 106,["86"] = 106,["87"] = 106,["88"] = 106,["89"] = 106,["90"] = 106,["91"] = 106,["96"] = 118,["97"] = 120,["98"] = 79});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local getTierConfig = ____game_constants.getTierConfig
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
____exports.MUTATION_SLOT_ORDER = {"ACTIVE_UPGRADE", "PASSIVE_SLOT_1", "PASSIVE_SLOT_2"}
function ____exports.pickRandomSubset(self, items, maxCount)
    local pool = {unpack(items)}
    do
        local i = #pool - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local tmp = pool[i + 1]
            pool[i + 1] = pool[j + 1]
            pool[j + 1] = tmp
            i = i - 1
        end
    end
    return __TS__ArraySlice(
        pool,
        0,
        math.min(maxCount, #pool)
    )
end
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
                goto __continue9
            end
            local mutationDef = getMutationDefinition(nil, mutationId)
            if not mutationDef then
                goto __continue9
            end
            hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
        end
        ::__continue9::
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
                    goto __continue15
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
            ::__continue15::
        end
    end
    existing.draft_meta = draftMeta
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
