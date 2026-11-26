local ____lualib = require("lualib_bundle")
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 18,["9"] = 22,["10"] = 23,["11"] = 24,["12"] = 25,["13"] = 25,["14"] = 25,["15"] = 26,["18"] = 29,["19"] = 22,["20"] = 32,["21"] = 33,["22"] = 34,["24"] = 35,["25"] = 35,["27"] = 36,["28"] = 37,["33"] = 40,["34"] = 32,["35"] = 43,["36"] = 44,["37"] = 46,["38"] = 47,["39"] = 46,["40"] = 50,["41"] = 51,["42"] = 50});
local ____exports = {}
local ____dmgFilterNyx = require("data.damage.dmgFilterNyx")
local DMG_FILTER_NYX = ____dmgFilterNyx.DMG_FILTER_NYX
local HERO_DAMAGE_MODULES = {DMG_FILTER_NYX}
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
