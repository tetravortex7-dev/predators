local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 4,["37"] = 3,["38"] = 4,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
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
    return 1
end
function modifier_fountain_aura_lua.prototype.GetAuraSearchType(self)
    return bit.bor(1, 18)
end
function modifier_fountain_aura_lua.prototype.GetAuraDuration(self)
    return 0.1
end
function modifier_fountain_aura_lua.prototype.GetAuraRadius(self)
    return 1200
end
modifier_fountain_aura_lua = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_fountain_aura_lua")},
    modifier_fountain_aura_lua
)
____exports.modifier_fountain_aura_lua = modifier_fountain_aura_lua
return ____exports
