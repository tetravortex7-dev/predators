local ____lualib = require("lualib_bundle")
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 7,["9"] = 7,["10"] = 19,["11"] = 24,["12"] = 25,["13"] = 26,["14"] = 27,["15"] = 27,["16"] = 27,["17"] = 28,["20"] = 31,["21"] = 24,["22"] = 34,["23"] = 35,["24"] = 36,["26"] = 37,["27"] = 37,["29"] = 38,["30"] = 39,["35"] = 42,["36"] = 34,["37"] = 45,["38"] = 46,["39"] = 48,["40"] = 49,["41"] = 48,["42"] = 52,["43"] = 53,["44"] = 52});
local ____exports = {}
local ____dmgFilterNyx = require("data.damage.dmgFilterNyx")
local DMG_FILTER_NYX = ____dmgFilterNyx.DMG_FILTER_NYX
local ____dmgFilterSpectre = require("data.damage.dmgFilterSpectre")
local DMG_FILTER_SPECTRE = ____dmgFilterSpectre.DMG_FILTER_SPECTRE
local HERO_DAMAGE_MODULES = {DMG_FILTER_NYX, DMG_FILTER_SPECTRE}
local function collectDamageRules(self)
    local merged = {}
    for ____, mod in ipairs(HERO_DAMAGE_MODULES) do
        for ____, ____value in ipairs(__TS__ObjectEntries(mod.rules)) do
            local abilityName = ____value[1]
            local rule = ____value[2]
            merged[abilityName] = rule
        end
    end
    return merged
end
local function collectPostModifiers(self)
    local collected = {}
    for ____, mod in ipairs(HERO_DAMAGE_MODULES) do
        do
            if not mod.postModifiers then
                goto __continue8
            end
            for ____, hook in ipairs(mod.postModifiers) do
                collected[#collected + 1] = hook
            end
        end
        ::__continue8::
    end
    return collected
end
____exports.EVO_DAMAGE_RULES = collectDamageRules(nil)
____exports.EVO_DAMAGE_POST_MODIFIERS = collectPostModifiers(nil)
function ____exports.getDamageRule(self, abilityName)
    return ____exports.EVO_DAMAGE_RULES[abilityName]
end
function ____exports.getGlobalDamagePostModifiers(self)
    return ____exports.EVO_DAMAGE_POST_MODIFIERS
end
return ____exports
