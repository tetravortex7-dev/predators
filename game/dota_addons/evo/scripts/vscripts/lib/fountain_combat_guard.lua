local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 3,["9"] = 8,["12"] = 9,["15"] = 10,["18"] = 12,["19"] = 13,["20"] = 14,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 3,["27"] = 23,["28"] = 24,["29"] = 24,["31"] = 25,["32"] = 26,["33"] = 26,["35"] = 27,["36"] = 23,["37"] = 30,["38"] = 31,["39"] = 30});
local ____exports = {}
local pvpCombatUntilByPlayer = __TS__New(Map)
function ____exports.markFountainCombatLock(self, attacker, victim, durationSeconds)
    if attacker == victim then
        return
    end
    if attacker:GetTeamNumber() == victim:GetTeamNumber() then
        return
    end
    if not attacker:IsRealHero() or not victim:IsRealHero() then
        return
    end
    local attackerPid = attacker:GetPlayerOwnerID()
    local victimPid = victim:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(attackerPid) or not PlayerResource:IsValidPlayerID(victimPid) then
        return
    end
    local lockUntil = GameRules:GetDOTATime(false, false) + durationSeconds
    pvpCombatUntilByPlayer:set(attackerPid, lockUntil)
    pvpCombatUntilByPlayer:set(victimPid, lockUntil)
end
function ____exports.isFountainCombatLocked(self, unit)
    if not unit:IsRealHero() then
        return false
    end
    local pid = unit:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(pid) then
        return false
    end
    return (pvpCombatUntilByPlayer:get(pid) or -999) > GameRules:GetDOTATime(false, false)
end
function ____exports.clearFountainCombatLock(self, playerId)
    pvpCombatUntilByPlayer:delete(playerId)
end
return ____exports
