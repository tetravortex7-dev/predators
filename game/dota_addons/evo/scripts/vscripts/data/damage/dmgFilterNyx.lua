local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 4,["8"] = 5,["9"] = 11,["10"] = 11,["11"] = 11,["12"] = 14,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 11,["19"] = 11,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 19,["26"] = 20,["27"] = 21,["28"] = 21,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 23,["35"] = 23,["37"] = 24,["38"] = 25,["39"] = 26,["40"] = 27,["41"] = 28,["43"] = 30,["44"] = 11,["45"] = 5,["46"] = 5,["47"] = 5,["48"] = 43,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 46,["54"] = 5,["55"] = 5,["56"] = 4});
local ____exports = {}
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
____exports.DMG_FILTER_NYX = {rules = {
    nyx_assassin_impale = {mode = "MULTIPLIER", multiplier = 1, creepMultiplier = 1.5},
    lion_impale = {
        mode = "FLAT_STAT",
        stat = "INT",
        statRatio = {
            0.5,
            0.62,
            0.75,
            0.87,
            1
        },
        creepMultiplier = 1.3,
        customModify = function(____, ctx)
            local tierMod = ctx.attacker:FindModifierByName("modifier_evo_hero_tier")
            local tier = tierMod and tierMod:GetStackCount() or 2
            if tier < 3 then
                return nil
            end
            local maxMana = ctx.victim:GetMaxMana()
            if maxMana <= 0 then
                return nil
            end
            local missingMana = math.max(
                0,
                maxMana - ctx.victim:GetMana()
            )
            if missingMana <= 0 then
                return nil
            end
            local pct = tier >= 4 and 0.55 or 0.35
            local bonus = missingMana * pct
            if isEvoCreepUnit(nil, ctx.victim) then
                local cap = tier >= 4 and 250 or 150
                bonus = math.min(cap, bonus) / 1.3
            end
            return {rawBonus = bonus}
        end
    },
    evo_nyx_scarab_r = {mode = "FLAT_STAT", stat = "STR", statRatio = {0.35, 0.45, 0.55}},
    evo_nyx_mantis_r = {mode = "FLAT_STAT", stat = "AGI", statRatio = {0.18, 0.24, 0.3}},
    evo_nyx_cicada_e = {mode = "FLAT_STAT", stat = "ALL", statRatio = {
        0.08,
        0.09,
        0.1,
        0.11,
        0.12
    }},
    evo_nyx_cicada_r = {mode = "FLAT_STAT", stat = "ALL", statRatio = {0.18, 0.22, 0.26}}
}}
return ____exports
