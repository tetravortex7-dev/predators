local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 8,["19"] = 9,["20"] = 8,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 14,["25"] = 15,["26"] = 14,["27"] = 17,["28"] = 18,["31"] = 19,["32"] = 20,["34"] = 17,["35"] = 23,["36"] = 24,["39"] = 25,["40"] = 26,["42"] = 23,["43"] = 4,["44"] = 3,["45"] = 4,["47"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_evo_hero_tier = __TS__Class()
local modifier_evo_hero_tier = ____exports.modifier_evo_hero_tier
modifier_evo_hero_tier.name = "modifier_evo_hero_tier"
__TS__ClassExtends(modifier_evo_hero_tier, BaseModifier)
function modifier_evo_hero_tier.prototype.IsHidden(self)
    return true
end
function modifier_evo_hero_tier.prototype.IsDebuff(self)
    return false
end
function modifier_evo_hero_tier.prototype.IsPurgable(self)
    return false
end
function modifier_evo_hero_tier.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_hero_tier.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    if params.tier ~= nil then
        self:SetStackCount(params.tier)
    end
end
function modifier_evo_hero_tier.prototype.OnRefresh(self, params)
    if not IsServer() then
        return
    end
    if params.tier ~= nil then
        self:SetStackCount(params.tier)
    end
end
modifier_evo_hero_tier = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_hero_tier")},
    modifier_evo_hero_tier
)
____exports.modifier_evo_hero_tier = modifier_evo_hero_tier
return ____exports
