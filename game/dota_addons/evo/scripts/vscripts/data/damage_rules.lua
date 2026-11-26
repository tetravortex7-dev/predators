local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 41,["6"] = 43,["7"] = 44,["8"] = 43});
local ____exports = {}
____exports.EVO_DAMAGE_RULES = {}
function ____exports.getDamageRule(self, abilityName)
    return ____exports.EVO_DAMAGE_RULES[abilityName]
end
return ____exports
