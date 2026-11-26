local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 9,["14"] = 9,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 13,["31"] = 17,["32"] = 18,["33"] = 19,["35"] = 21,["36"] = 22,["38"] = 11,["39"] = 26,["40"] = 27,["41"] = 28,["42"] = 29,["44"] = 31,["45"] = 32,["47"] = 26,["48"] = 36,["50"] = 37,["51"] = 37,["53"] = 38,["54"] = 39,["55"] = 39,["57"] = 40,["58"] = 40,["60"] = 42,["61"] = 43,["62"] = 44,["64"] = 47,["65"] = 48,["66"] = 49,["70"] = 37,["73"] = 36,["74"] = 59,["75"] = 60,["78"] = 61,["79"] = 62,["80"] = 62,["81"] = 62,["82"] = 62,["83"] = 62,["84"] = 59,["85"] = 69,["86"] = 70,["87"] = 71,["89"] = 73,["90"] = 74,["93"] = 77,["94"] = 77,["96"] = 78,["97"] = 79,["98"] = 79,["100"] = 80,["101"] = 80,["103"] = 82,["104"] = 83,["105"] = 83,["107"] = 85,["110"] = 77,["113"] = 93,["114"] = 69});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
____exports.PassiveGoldManager = __TS__Class()
local PassiveGoldManager = ____exports.PassiveGoldManager
PassiveGoldManager.name = "PassiveGoldManager"
function PassiveGoldManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.started = false
    self.matchEnded = false
    self.startingGoldEnsured = __TS__New(Set)
end
function PassiveGoldManager.prototype.init(self)
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
    self.eventBus:on(
        "match_ended",
        function()
            self.matchEnded = true
        end
    )
    local state = GameRules:State_Get()
    if state == 8 or state == 10 then
        self:ensureStartingGold()
    end
    if state == 10 then
        self:startTicker()
    end
end
function PassiveGoldManager.prototype.onGameStateChange(self)
    local state = GameRules:State_Get()
    if state == 8 or state == 10 then
        self:ensureStartingGold()
    end
    if state == 10 then
        self:startTicker()
    end
end
function PassiveGoldManager.prototype.ensureStartingGold(self)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if self.startingGoldEnsured:has(playerId) then
                    goto __continue12
                end
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue12
                end
                local team = PlayerResource:GetTeam(playerId)
                if team == 5 or team == 10 or team == 13 then
                    goto __continue12
                end
                self.startingGoldEnsured:add(playerId)
                if PlayerResource:GetGold(playerId) == 0 then
                    PlayerResource:ModifyGold(playerId, EVO_CONSTANTS.STARTING_GOLD, true, 0)
                end
            end
            ::__continue12::
            i = i + 1
        end
    end
end
function PassiveGoldManager.prototype.startTicker(self)
    if self.started or self.matchEnded then
        return
    end
    self.started = true
    GameRules:GetGameModeEntity():SetContextThink(
        "EvoPassiveGoldThink",
        function() return self:onThink() end,
        EVO_CONSTANTS.GOLD_TICK_TIME
    )
end
function PassiveGoldManager.prototype.onThink(self)
    if self.matchEnded or GameRules:State_Get() >= 11 then
        return nil
    end
    if GameRules:IsGamePaused() then
        return 0.1
    end
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue23
                end
                if not PlayerResource:HasSelectedHero(playerId) then
                    goto __continue23
                end
                local team = PlayerResource:GetTeam(playerId)
                if team == 5 or team == 10 then
                    goto __continue23
                end
                PlayerResource:ModifyGold(playerId, EVO_CONSTANTS.GOLD_PER_TICK, true, 10)
            end
            ::__continue23::
            i = i + 1
        end
    end
    return EVO_CONSTANTS.GOLD_TICK_TIME
end
return ____exports
