local ____lualib = require("lualib_bundle")
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 4,["18"] = 42,["19"] = 48,["20"] = 49,["22"] = 50,["23"] = 50,["24"] = 51,["25"] = 52,["26"] = 53,["27"] = 54,["28"] = 50,["31"] = 56,["32"] = 56,["33"] = 56,["34"] = 56,["35"] = 56,["36"] = 48,["37"] = 59,["38"] = 60,["39"] = 61,["40"] = 62,["41"] = 63,["44"] = 66,["45"] = 59,["46"] = 69,["47"] = 70,["49"] = 71,["50"] = 71,["52"] = 72,["53"] = 73,["54"] = 73,["56"] = 74,["60"] = 69,["61"] = 80,["62"] = 85,["63"] = 86,["64"] = 87,["65"] = 87,["68"] = 89,["69"] = 91,["70"] = 91,["71"] = 91,["72"] = 91,["73"] = 92,["74"] = 92,["75"] = 92,["76"] = 92,["77"] = 94,["78"] = 94,["79"] = 95,["80"] = 95,["81"] = 95,["82"] = 94,["83"] = 94,["84"] = 94,["85"] = 99,["86"] = 100,["87"] = 101,["88"] = 101,["89"] = 101,["90"] = 101,["91"] = 101,["92"] = 101,["93"] = 101,["94"] = 102,["95"] = 103,["98"] = 107,["99"] = 80,["100"] = 110,["101"] = 111,["102"] = 112,["103"] = 113,["104"] = 113,["105"] = 113,["107"] = 113,["108"] = 118,["109"] = 119,["110"] = 120,["111"] = 121,["112"] = 122,["113"] = 123,["114"] = 124,["115"] = 125,["116"] = 126,["117"] = 127,["118"] = 129,["119"] = 130,["120"] = 131,["122"] = 132,["123"] = 133,["124"] = 133,["126"] = 134,["127"] = 138,["128"] = 138,["129"] = 138,["130"] = 138,["131"] = 138,["132"] = 138,["133"] = 138,["134"] = 138,["135"] = 138,["136"] = 138,["140"] = 149,["141"] = 150,["143"] = 151,["144"] = 152,["145"] = 152,["147"] = 153,["152"] = 158,["153"] = 160,["154"] = 110});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local getTierConfig = ____game_constants.getTierConfig
local ____mutations_catalog = require("data.mutations_catalog")
local EVO_MUTATIONS_CATALOG = ____mutations_catalog.EVO_MUTATIONS_CATALOG
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
function ____exports.rollMutationChoices(self, state, excludeIds, count)
    local owned = __TS__New(Set)
    for ____, mutId in ipairs(state.mutations) do
        if mutId then
            owned:add(mutId)
        end
    end
    local excluded = __TS__New(Set, excludeIds)
    local available = __TS__ArrayFilter(
        EVO_MUTATIONS_CATALOG,
        function(____, m) return not owned:has(m.id) end
    )
    local fresh = __TS__ArrayFilter(
        available,
        function(____, m) return not excluded:has(m.id) end
    )
    local picked = ____exports.pickRandomSubset(
        nil,
        __TS__ArrayMap(
            fresh,
            function(____, m) return m.id end
        ),
        count
    )
    if #picked < count then
        local pickedSet = __TS__New(Set, picked)
        local fallback = __TS__ArrayMap(
            __TS__ArrayFilter(
                available,
                function(____, m) return not pickedSet:has(m.id) end
            ),
            function(____, m) return m.id end
        )
        for ____, id in ipairs(____exports.pickRandomSubset(nil, fallback, count - #picked)) do
            picked[#picked + 1] = id
        end
    end
    return picked
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
    existing.mutation_rerolls = state.mutationRerollsRemaining
    existing.pending_draft_type = state.pendingDraftType
    existing.pending_mutation_slot = state.pendingMutationSlot
    existing.draft_options = state.draftOptions
    local draftMeta = {}
    if state.pendingDraftType == "BODY" then
        for ____, optId in ipairs(state.draftOptions) do
            do
                local b = getBodyDefinition(nil, optId)
                if not b then
                    goto __continue27
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
            ::__continue27::
        end
    elseif state.pendingDraftType == "MUTATION" then
        for ____, optId in ipairs(state.draftOptions) do
            do
                local m = getMutationDefinition(nil, optId)
                if not m then
                    goto __continue31
                end
                draftMeta[optId] = {icon = m.iconAbility or "alchemist_chemical_rage"}
            end
            ::__continue31::
        end
    end
    existing.draft_meta = draftMeta
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
