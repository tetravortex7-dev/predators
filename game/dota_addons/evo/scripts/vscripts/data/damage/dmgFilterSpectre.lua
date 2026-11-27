local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 11,["17"] = 12,["18"] = 12,["20"] = 13,["21"] = 13,["23"] = 14,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 16,["29"] = 17,["30"] = 17,["32"] = 18,["33"] = 7,["34"] = 5});
local ____exports = {}
local DAGGER_AGI_RATIO = {
    0.55,
    0.65,
    0.75,
    0.85,
    0.95
}
____exports.DMG_FILTER_SPECTRE = {rules = {spectre_spectral_dagger = {
    mode = "MULTIPLIER",
    multiplier = 1,
    creepMultiplier = 1.4,
    customModify = function(____, ctx)
        if not ctx.attacker:IsRealHero() then
            return nil
        end
        if not ctx.attacker:HasAbility("evo_spectre_phantom_w") then
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
