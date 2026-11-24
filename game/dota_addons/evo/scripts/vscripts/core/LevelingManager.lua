local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 12,["15"] = 12,["16"] = 10,["17"] = 12,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 14,["29"] = 23,["30"] = 24,["31"] = 23,["32"] = 27,["33"] = 27,["34"] = 27,["36"] = 27,["37"] = 27,["39"] = 28,["42"] = 29,["43"] = 30,["44"] = 32,["45"] = 33,["46"] = 27,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["52"] = 45,["53"] = 46,["54"] = 47,["55"] = 40,["56"] = 50,["57"] = 51,["58"] = 52,["61"] = 54,["62"] = 55,["65"] = 57,["66"] = 58,["67"] = 60,["68"] = 66,["69"] = 67,["70"] = 68,["71"] = 69,["74"] = 50,["75"] = 74,["76"] = 75,["77"] = 76,["78"] = 77,["79"] = 81,["81"] = 83,["82"] = 74,["83"] = 86,["84"] = 87,["85"] = 88,["86"] = 88,["87"] = 88,["89"] = 88,["90"] = 89,["91"] = 90,["92"] = 86});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_XP_PER_LEVEL_TABLE = ____game_constants.EVO_XP_PER_LEVEL_TABLE
____exports.LevelingManager = __TS__Class()
local LevelingManager = ____exports.LevelingManager
LevelingManager.name = "LevelingManager"
function LevelingManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.playerStates = __TS__New(Map)
end
function LevelingManager.prototype.init(self)
    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetUseCustomHeroLevels(true)
    gameMode:SetCustomHeroMaxLevel(EVO_CONSTANTS.MAX_HERO_LEVEL)
    gameMode:SetCustomXPRequiredToReachNextLevel(EVO_XP_PER_LEVEL_TABLE)
    ListenToGameEvent(
        "dota_player_gained_level",
        function(event) return self:onPlayerGainedLevel(event) end,
        nil
    )
end
function LevelingManager.prototype.getFortificationCharges(self, playerId)
    return self:getOrCreateState(playerId).fortificationCharges
end
function LevelingManager.prototype.grantFortificationCharge(self, playerId, amount, sourceLevel)
    if amount == nil then
        amount = 1
    end
    if sourceLevel == nil then
        sourceLevel = 0
    end
    if amount <= 0 then
        return
    end
    local state = self:getOrCreateState(playerId)
    state.fortificationCharges = state.fortificationCharges + amount
    self:syncPlayerCharges(playerId, state.fortificationCharges)
    self.eventBus:emit("fortification_charge_granted", {playerId = playerId, level = sourceLevel, totalCharges = state.fortificationCharges})
end
function LevelingManager.prototype.consumeFortificationCharge(self, playerId)
    local state = self:getOrCreateState(playerId)
    if state.fortificationCharges <= 0 then
        return false
    end
    state.fortificationCharges = state.fortificationCharges - 1
    self:syncPlayerCharges(playerId, state.fortificationCharges)
    return true
end
function LevelingManager.prototype.onPlayerGainedLevel(self, event)
    local playerId = event.player_id
    if playerId == nil or not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    local newLevel = hero:GetLevel()
    local state = self:getOrCreateState(playerId)
    self.eventBus:emit("hero_leveled_up", {playerId = playerId, hero = hero, newLevel = newLevel})
    for ____, milestone in ipairs(EVO_CONSTANTS.FORTIFICATION_LEVELS) do
        if newLevel >= milestone and state.highestRewardedLevel < milestone then
            state.highestRewardedLevel = milestone
            self:grantFortificationCharge(playerId, 1, milestone)
        end
    end
end
function LevelingManager.prototype.getOrCreateState(self, playerId)
    local state = self.playerStates:get(playerId)
    if not state then
        state = {highestRewardedLevel = 1, fortificationCharges = 0}
        self.playerStates:set(playerId, state)
    end
    return state
end
function LevelingManager.prototype.syncPlayerCharges(self, playerId, charges)
    local key = tostring(playerId)
    local ____temp_0 = CustomNetTables:GetTableValue("player_evo", key)
    if ____temp_0 == nil then
        ____temp_0 = {}
    end
    local existing = ____temp_0
    existing.fortification_charges = charges
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
