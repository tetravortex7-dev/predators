local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 12,["15"] = 12,["16"] = 10,["17"] = 12,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 20,["24"] = 21,["25"] = 21,["26"] = 21,["27"] = 21,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 14,["40"] = 28,["41"] = 29,["42"] = 30,["45"] = 31,["46"] = 32,["49"] = 33,["52"] = 34,["53"] = 35,["54"] = 36,["55"] = 37,["56"] = 38,["57"] = 39,["58"] = 40,["60"] = 28,["61"] = 44,["62"] = 45,["63"] = 46,["65"] = 48,["66"] = 44,["67"] = 51,["68"] = 52,["69"] = 51,["70"] = 55,["71"] = 55,["72"] = 55,["74"] = 55,["75"] = 55,["77"] = 56,["80"] = 57,["81"] = 58,["82"] = 60,["83"] = 61,["84"] = 55,["85"] = 68,["86"] = 69,["87"] = 70,["88"] = 71,["90"] = 73,["91"] = 74,["92"] = 75,["93"] = 68,["94"] = 78,["95"] = 79,["96"] = 80,["99"] = 82,["100"] = 83,["103"] = 85,["104"] = 86,["105"] = 88,["106"] = 94,["107"] = 95,["108"] = 96,["109"] = 97,["112"] = 78,["113"] = 102,["114"] = 103,["115"] = 104,["116"] = 105,["117"] = 109,["119"] = 111,["120"] = 102,["121"] = 114,["122"] = 115,["123"] = 116,["124"] = 116,["125"] = 116,["127"] = 116,["128"] = 117,["129"] = 118,["130"] = 114});
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
    if IsInToolsMode() then
        gameMode:SetModifyExperienceFilter(
            function(____, event) return self:onModifyExperience(event) end,
            self
        )
    end
    ListenToGameEvent(
        "dota_player_gained_level",
        function(event) return self:onPlayerGainedLevel(event) end,
        nil
    )
    ListenToGameEvent(
        "dota_player_learned_ability",
        function(event) return self:onAbilityLearned(event) end,
        nil
    )
end
function LevelingManager.prototype.onAbilityLearned(self, event)
    local playerId = event.PlayerID
    if playerId == nil or not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    if event.abilityname ~= "lion_impale" then
        return
    end
    local tierMod = hero:FindModifierByName("modifier_evo_hero_tier")
    local tier = tierMod and tierMod:GetStackCount() or 1
    local maxAllowed = tier <= 1 and 3 or (tier == 2 and 4 or 5)
    local ab = hero:FindAbilityByName("lion_impale")
    if ab and not ab:IsNull() and ab:GetLevel() > maxAllowed then
        ab:SetLevel(maxAllowed)
        hero:SetAbilityPoints(hero:GetAbilityPoints() + 1)
    end
end
function LevelingManager.prototype.onModifyExperience(self, event)
    if event.experience > 0 then
        event.experience = math.floor(event.experience * EVO_CONSTANTS.DEV_XP_MULTIPLIER)
    end
    return true
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
