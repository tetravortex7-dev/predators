local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 8,["12"] = 8,["13"] = 5,["14"] = 6,["15"] = 8,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 12,["28"] = 16,["29"] = 17,["31"] = 10,["32"] = 21,["33"] = 22,["34"] = 23,["36"] = 21,["37"] = 27,["38"] = 28,["41"] = 29,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 27,["48"] = 37,["49"] = 38,["50"] = 39,["52"] = 41,["53"] = 42,["56"] = 45,["57"] = 45,["59"] = 46,["60"] = 47,["61"] = 47,["63"] = 48,["64"] = 48,["66"] = 50,["67"] = 51,["68"] = 51,["70"] = 53,["73"] = 45,["76"] = 61,["77"] = 37});
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
    if GameRules:State_Get() == 10 then
        self:startTicker()
    end
end
function PassiveGoldManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 then
        self:startTicker()
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
                    goto __continue15
                end
                if not PlayerResource:HasSelectedHero(playerId) then
                    goto __continue15
                end
                local team = PlayerResource:GetTeam(playerId)
                if team == 5 or team == 10 then
                    goto __continue15
                end
                PlayerResource:ModifyGold(playerId, EVO_CONSTANTS.GOLD_PER_TICK, true, 10)
            end
            ::__continue15::
            i = i + 1
        end
    end
    return EVO_CONSTANTS.GOLD_TICK_TIME
end
return ____exports
