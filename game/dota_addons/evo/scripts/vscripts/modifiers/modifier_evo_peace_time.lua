local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 4,["28"] = 3,["29"] = 4,["31"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_evo_peace_time = __TS__Class()
local modifier_evo_peace_time = ____exports.modifier_evo_peace_time
modifier_evo_peace_time.name = "modifier_evo_peace_time"
__TS__ClassExtends(modifier_evo_peace_time, BaseModifier)
function modifier_evo_peace_time.prototype.IsHidden(self)
    return false
end
function modifier_evo_peace_time.prototype.IsPurgable(self)
    return false
end
function modifier_evo_peace_time.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_peace_time.prototype.GetTexture(self)
    return "omniknight_guardian_angel"
end
modifier_evo_peace_time = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_peace_time")},
    modifier_evo_peace_time
)
____exports.modifier_evo_peace_time = modifier_evo_peace_time
return ____exports
