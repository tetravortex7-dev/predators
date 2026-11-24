local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 9,["20"] = 10,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 17,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 17,["35"] = 4,["36"] = 3,["37"] = 4,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_evo_world_pause = __TS__Class()
local modifier_evo_world_pause = ____exports.modifier_evo_world_pause
modifier_evo_world_pause.name = "modifier_evo_world_pause"
__TS__ClassExtends(modifier_evo_world_pause, BaseModifier)
function modifier_evo_world_pause.prototype.IsHidden(self)
    return false
end
function modifier_evo_world_pause.prototype.IsPurgable(self)
    return false
end
function modifier_evo_world_pause.prototype.IsDebuff(self)
    return false
end
function modifier_evo_world_pause.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_STUNNED")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_INVULNERABLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_ATTACK_IMMUNE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_MAGIC_IMMUNE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_FROZEN")] = true
    }
end
modifier_evo_world_pause = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_world_pause")},
    modifier_evo_world_pause
)
____exports.modifier_evo_world_pause = modifier_evo_world_pause
return ____exports
