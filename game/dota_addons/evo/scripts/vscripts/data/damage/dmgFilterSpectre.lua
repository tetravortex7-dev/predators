local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 13,["20"] = 15,["21"] = 10,["22"] = 18,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 24,["27"] = 25,["28"] = 25,["30"] = 26,["31"] = 27,["33"] = 29,["34"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 31,["39"] = 32,["40"] = 32,["42"] = 33,["43"] = 20,["44"] = 18});
local ____exports = {}
local DAGGER_AGI_RATIO = {
    0.55,
    0.65,
    0.75,
    0.85,
    0.95
}
local PHANTOM_W_ABILITIES = {"evo_spectre_phantom_w", "evo_spectre_phantom_w_t3", "evo_spectre_phantom_w_t4"}
local function hasAnyAbility(self, unit, names)
    for ____, name in ipairs(names) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return true
        end
    end
    return false
end
____exports.DMG_FILTER_SPECTRE = {rules = {spectre_spectral_dagger = {
    mode = "MULTIPLIER",
    multiplier = 1,
    creepMultiplier = 1.4,
    customModify = function(____, ctx)
        if not ctx.attacker:IsRealHero() then
            return nil
        end
        if not hasAnyAbility(nil, ctx.attacker, PHANTOM_W_ABILITIES) then
            return nil
        end
        local agi = ctx.attacker:GetAgility()
        local idx = math.max(
            0,
            math.min(#DAGGER_AGI_RATIO - 1, ctx.level - 1)
        )
        local ratio = DAGGER_AGI_RATIO[idx + 1] or 0.55
        if agi <= 0 or ratio <= 0 then
            return nil
        end
        return {rawBonus = agi * ratio}
    end
}}}
return ____exports
