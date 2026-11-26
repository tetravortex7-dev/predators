local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 14,["24"] = 15,["25"] = 14,["26"] = 18,["27"] = 19,["28"] = 18,["29"] = 22,["30"] = 23,["31"] = 22,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 30,["36"] = 31,["37"] = 31,["39"] = 32,["40"] = 32,["41"] = 33,["42"] = 33,["44"] = 34,["45"] = 35,["46"] = 36,["48"] = 38,["49"] = 38,["51"] = 39,["52"] = 40,["54"] = 42,["55"] = 30,["56"] = 45,["57"] = 46,["58"] = 45,["59"] = 49,["60"] = 50,["61"] = 49,["62"] = 5,["63"] = 4,["64"] = 5,["66"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____fountain_combat_guard = require("lib.fountain_combat_guard")
local isFountainCombatLocked = ____fountain_combat_guard.isFountainCombatLocked
____exports.modifier_fountain_aura_lua = __TS__Class()
local modifier_fountain_aura_lua = ____exports.modifier_fountain_aura_lua
modifier_fountain_aura_lua.name = "modifier_fountain_aura_lua"
__TS__ClassExtends(modifier_fountain_aura_lua, BaseModifier)
function modifier_fountain_aura_lua.prototype.IsHidden(self)
    return true
end
function modifier_fountain_aura_lua.prototype.IsAura(self)
    return true
end
function modifier_fountain_aura_lua.prototype.GetModifierAura(self)
    return "modifier_fountain_buff_lua"
end
function modifier_fountain_aura_lua.prototype.GetAuraSearchTeam(self)
    return 3
end
function modifier_fountain_aura_lua.prototype.GetAuraSearchType(self)
    return bit.bor(1, 18)
end
function modifier_fountain_aura_lua.prototype.GetAuraSearchFlags(self)
    return 64
end
function modifier_fountain_aura_lua.prototype.GetAuraEntityReject(self, target)
    if not target or target:IsNull() or not IsValidEntity(target) then
        return true
    end
    local ____opt_0 = GameRules.EvoAddon
    local duelMgr = ____opt_0 and ____opt_0.duelManager
    if duelMgr and duelMgr:isActiveDuelist(target) then
        return true
    end
    local team = target:GetTeamNumber()
    if team == 4 or team == 10 or team == 5 then
        return true
    end
    if not PlayerResource:IsValidPlayerID(target:GetPlayerOwnerID()) then
        return true
    end
    if not target:HasModifier("modifier_fountain_buff_lua") and isFountainCombatLocked(nil, target) then
        return true
    end
    return false
end
function modifier_fountain_aura_lua.prototype.GetAuraDuration(self)
    return 0.1
end
function modifier_fountain_aura_lua.prototype.GetAuraRadius(self)
    return 750
end
modifier_fountain_aura_lua = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_fountain_aura_lua")},
    modifier_fountain_aura_lua
)
____exports.modifier_fountain_aura_lua = modifier_fountain_aura_lua
return ____exports
