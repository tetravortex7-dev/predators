local ____lualib = require("lualib_bundle")
local __TS__ArrayFindIndex = ____lualib.__TS__ArrayFindIndex
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 7,["12"] = 8,["13"] = 11,["14"] = 17,["17"] = 18,["18"] = 19,["21"] = 21,["22"] = 22,["25"] = 24,["26"] = 25,["29"] = 27,["30"] = 28,["33"] = 30,["34"] = 31,["37"] = 35,["38"] = 36,["39"] = 37,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 43,["46"] = 47,["47"] = 53,["48"] = 54,["49"] = 11,["50"] = 57,["51"] = 61,["54"] = 62,["57"] = 64,["58"] = 65,["61"] = 67,["62"] = 68,["65"] = 69,["68"] = 71,["69"] = 76,["72"] = 78,["73"] = 79,["74"] = 80,["75"] = 57,["76"] = 83,["77"] = 87,["78"] = 88,["79"] = 88,["80"] = 88,["81"] = 88,["82"] = 89,["83"] = 90,["84"] = 95,["85"] = 96,["86"] = 97,["87"] = 98,["88"] = 99,["89"] = 100,["91"] = 83});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
local ____evolution_types = require("systems.evolution.evolution_types")
local rollMutationChoices = ____evolution_types.rollMutationChoices
local syncPlayerEvoNetTable = ____evolution_types.syncPlayerEvoNetTable
function ____exports.handleSelectMutationDraft(self, params)
    if not EVO_CONSTANTS.ENABLE_MUTATION_DRAFT then
        return
    end
    local playerId = params.event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = params:getState(playerId)
    if state.pendingDraftType ~= "MUTATION" then
        return
    end
    local slotIndex = params.event.slot or state.pendingMutationSlot
    if slotIndex ~= state.pendingMutationSlot then
        return
    end
    local optionIndex = params.event.option_index
    if optionIndex == nil or optionIndex < 0 or optionIndex >= #state.draftOptions then
        return
    end
    local mutationId = state.draftOptions[optionIndex + 1]
    local mutationDef = getMutationDefinition(nil, mutationId)
    if not mutationDef then
        return
    end
    state.mutations[slotIndex + 1] = mutationDef.id
    state.pendingDraftType = "NONE"
    state.draftOptions = {}
    hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
    params.eventBus:emit("mutation_applied", {playerId = playerId, slotIndex = slotIndex, mutationId = mutationDef.id})
    params:checkProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
end
function ____exports.handleRerollMutationDraft(self, params)
    if not EVO_CONSTANTS.ENABLE_MUTATION_DRAFT then
        return
    end
    if not PlayerResource:IsValidPlayerID(params.playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(params.playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = params:getState(params.playerId)
    if state.pendingDraftType ~= "MUTATION" then
        return
    end
    if state.mutationRerollsRemaining <= 0 then
        return
    end
    local rerolled = rollMutationChoices(nil, state, state.draftOptions, EVO_CONSTANTS.MUTATION_DRAFT_CHOICES)
    if #rerolled == 0 then
        return
    end
    state.mutationRerollsRemaining = state.mutationRerollsRemaining - 1
    state.draftOptions = rerolled
    syncPlayerEvoNetTable(nil, params.playerId, state)
end
function ____exports.openDevMutationDraft(self, playerId, getState)
    local state = getState(nil, playerId)
    local openSlot = __TS__ArrayFindIndex(
        state.mutations,
        function(____, m) return m == nil end
    )
    local slotIndex = openSlot ~= -1 and openSlot or 0
    local choices = rollMutationChoices(nil, state, state.draftOptions, EVO_CONSTANTS.MUTATION_DRAFT_CHOICES)
    if #choices > 0 then
        state.unlockedMutationSlots[slotIndex + 1] = true
        state.pendingDraftType = "MUTATION"
        state.pendingMutationSlot = slotIndex
        state.draftOptions = choices
        syncPlayerEvoNetTable(nil, playerId, state)
    end
end
return ____exports
