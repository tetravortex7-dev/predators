local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 9,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 10,["20"] = 14,["21"] = 15,["22"] = 14,["23"] = 18,["24"] = 19,["25"] = 18,["26"] = 22,["27"] = 23,["28"] = 22,["29"] = 26,["30"] = 27,["31"] = 26,["32"] = 30,["33"] = 31,["34"] = 30,["35"] = 34,["36"] = 35,["37"] = 34,["38"] = 38,["39"] = 39,["40"] = 38,["41"] = 42,["42"] = 43,["43"] = 42,["44"] = 46,["45"] = 47,["46"] = 46,["47"] = 50,["48"] = 51,["49"] = 50,["50"] = 54,["51"] = 55,["52"] = 54,["53"] = 58,["54"] = 59,["55"] = 59,["56"] = 59,["57"] = 59,["58"] = 58,["59"] = 65,["60"] = 66,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 66,["65"] = 66,["66"] = 65,["67"] = 74,["68"] = 75,["69"] = 74,["70"] = 78,["71"] = 79,["72"] = 78,["73"] = 82,["74"] = 83,["75"] = 82,["76"] = 86,["77"] = 87,["78"] = 86,["79"] = 9,["80"] = 8,["81"] = 9,["83"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_evo_boss_courage = __TS__Class()
local modifier_evo_boss_courage = ____exports.modifier_evo_boss_courage
modifier_evo_boss_courage.name = "modifier_evo_boss_courage"
__TS__ClassExtends(modifier_evo_boss_courage, BaseModifier)
function modifier_evo_boss_courage.prototype.IsHidden(self)
    return false
end
function modifier_evo_boss_courage.prototype.IsPurgable(self)
    return false
end
function modifier_evo_boss_courage.prototype.RemoveOnDeath(self)
    return true
end
function modifier_evo_boss_courage.prototype.GetTexture(self)
    return "bloodseeker_bloodrage"
end
function modifier_evo_boss_courage.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_bloodrage.vpcf"
end
function modifier_evo_boss_courage.prototype.StatusEffectPriority(self)
    return 2
end
function modifier_evo_boss_courage.prototype.IsAura(self)
    return true
end
function modifier_evo_boss_courage.prototype.GetAuraRadius(self)
    return 900
end
function modifier_evo_boss_courage.prototype.GetModifierAura(self)
    return "modifier_truesight"
end
function modifier_evo_boss_courage.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_boss_courage.prototype.GetAuraSearchType(self)
    return bit.bor(1, 18)
end
function modifier_evo_boss_courage.prototype.GetAuraSearchFlags(self)
    return bit.bor(16, 64)
end
function modifier_evo_boss_courage.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_CANNOT_MISS")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_UNSLOWABLE")] = true
    }
end
function modifier_evo_boss_courage.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MODEL_SCALE")
    }
end
function modifier_evo_boss_courage.prototype.GetModifierBaseDamageOutgoing_Percentage(self)
    return 35
end
function modifier_evo_boss_courage.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 60
end
function modifier_evo_boss_courage.prototype.GetModifierMoveSpeedBonus_Constant(self)
    return 65
end
function modifier_evo_boss_courage.prototype.GetModifierModelScale(self)
    return 20
end
modifier_evo_boss_courage = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_boss_courage")},
    modifier_evo_boss_courage
)
____exports.modifier_evo_boss_courage = modifier_evo_boss_courage
return ____exports
