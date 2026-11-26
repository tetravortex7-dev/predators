local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 7,["13"] = 9,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 14,["18"] = 15,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 16,["24"] = 19,["25"] = 20,["26"] = 19,["27"] = 22,["28"] = 23,["29"] = 22,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 28,["34"] = 29,["35"] = 28,["36"] = 31,["37"] = 32,["38"] = 31,["39"] = 15,["40"] = 14,["41"] = 15,["43"] = 15,["44"] = 36,["45"] = 37,["46"] = 36,["47"] = 37,["48"] = 38,["49"] = 39,["50"] = 38,["51"] = 41,["52"] = 42,["53"] = 41,["54"] = 44,["55"] = 45,["56"] = 44,["57"] = 47,["58"] = 48,["59"] = 47,["60"] = 50,["61"] = 51,["64"] = 52,["65"] = 53,["67"] = 50,["68"] = 56,["69"] = 57,["70"] = 57,["71"] = 57,["72"] = 57,["73"] = 56,["74"] = 62,["75"] = 63,["76"] = 63,["77"] = 63,["78"] = 63,["79"] = 63,["80"] = 63,["81"] = 63,["82"] = 64,["83"] = 62,["84"] = 66,["85"] = 67,["86"] = 67,["87"] = 67,["88"] = 67,["89"] = 67,["90"] = 67,["91"] = 67,["92"] = 68,["93"] = 66,["94"] = 37,["95"] = 36,["96"] = 37,["98"] = 37,["99"] = 72,["100"] = 73,["101"] = 72,["102"] = 73,["103"] = 74,["104"] = 75,["105"] = 74,["106"] = 77,["107"] = 78,["108"] = 77,["109"] = 80,["110"] = 81,["111"] = 80,["112"] = 83,["113"] = 84,["114"] = 83,["115"] = 86,["116"] = 87,["119"] = 88,["120"] = 89,["122"] = 86,["123"] = 92,["124"] = 93,["125"] = 93,["126"] = 93,["127"] = 93,["128"] = 93,["129"] = 92,["130"] = 99,["131"] = 100,["132"] = 100,["133"] = 100,["134"] = 100,["135"] = 100,["136"] = 100,["137"] = 100,["138"] = 101,["139"] = 99,["140"] = 103,["141"] = 104,["142"] = 104,["143"] = 104,["144"] = 104,["145"] = 104,["146"] = 104,["147"] = 104,["148"] = 105,["149"] = 103,["150"] = 107,["151"] = 108,["152"] = 108,["153"] = 108,["154"] = 108,["155"] = 108,["156"] = 108,["157"] = 108,["158"] = 109,["159"] = 107,["160"] = 73,["161"] = 72,["162"] = 73,["164"] = 73,["165"] = 113,["166"] = 114,["167"] = 113,["168"] = 114,["169"] = 115,["170"] = 116,["171"] = 115,["172"] = 118,["173"] = 119,["174"] = 118,["175"] = 121,["176"] = 122,["177"] = 121,["178"] = 124,["179"] = 125,["180"] = 124,["181"] = 127,["182"] = 128,["183"] = 127,["184"] = 130,["185"] = 131,["186"] = 130,["187"] = 114,["188"] = 113,["189"] = 114,["191"] = 114});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_debuffs"
LinkLuaModifier("modifier_evo_nyx_t1_burst_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_psi_resonance", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_acoustic_disruption", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_cicada_chitin_as", SCRIPT_PATH, 0)
____exports.modifier_evo_nyx_t1_burst_slow = __TS__Class()
local modifier_evo_nyx_t1_burst_slow = ____exports.modifier_evo_nyx_t1_burst_slow
modifier_evo_nyx_t1_burst_slow.name = "modifier_evo_nyx_t1_burst_slow"
__TS__ClassExtends(modifier_evo_nyx_t1_burst_slow, BaseModifier)
function modifier_evo_nyx_t1_burst_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_t1_burst_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_t1_burst_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_t1_burst_slow.prototype.GetTexture(self)
    return "nyx_assassin_vendetta"
end
function modifier_evo_nyx_t1_burst_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_t1_burst_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_nyx_t1_burst_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_t1_burst_slow")},
    modifier_evo_nyx_t1_burst_slow
)
____exports.modifier_evo_nyx_t1_burst_slow = modifier_evo_nyx_t1_burst_slow
____exports.modifier_evo_nyx_psi_resonance = __TS__Class()
local modifier_evo_nyx_psi_resonance = ____exports.modifier_evo_nyx_psi_resonance
modifier_evo_nyx_psi_resonance.name = "modifier_evo_nyx_psi_resonance"
__TS__ClassExtends(modifier_evo_nyx_psi_resonance, BaseModifier)
function modifier_evo_nyx_psi_resonance.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_psi_resonance.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_psi_resonance.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_psi_resonance.prototype.GetTexture(self)
    return "nyx_assassin_jolt"
end
function modifier_evo_nyx_psi_resonance.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    if self:GetStackCount() <= 0 then
        self:SetStackCount(1)
    end
end
function modifier_evo_nyx_psi_resonance.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING")
    }
end
function modifier_evo_nyx_psi_resonance.prototype.GetModifierMagicalResistanceBonus(self)
    local s = math.max(
        1,
        math.min(
            3,
            self:GetStackCount()
        )
    )
    return -(8 + (s - 1) * 3)
end
function modifier_evo_nyx_psi_resonance.prototype.GetModifierPercentageManacostStacking(self)
    local s = math.max(
        1,
        math.min(
            3,
            self:GetStackCount()
        )
    )
    return -(15 + (s - 1) * 5)
end
modifier_evo_nyx_psi_resonance = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_psi_resonance")},
    modifier_evo_nyx_psi_resonance
)
____exports.modifier_evo_nyx_psi_resonance = modifier_evo_nyx_psi_resonance
____exports.modifier_evo_nyx_acoustic_disruption = __TS__Class()
local modifier_evo_nyx_acoustic_disruption = ____exports.modifier_evo_nyx_acoustic_disruption
modifier_evo_nyx_acoustic_disruption.name = "modifier_evo_nyx_acoustic_disruption"
__TS__ClassExtends(modifier_evo_nyx_acoustic_disruption, BaseModifier)
function modifier_evo_nyx_acoustic_disruption.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_acoustic_disruption.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_acoustic_disruption.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_acoustic_disruption.prototype.GetTexture(self)
    return "queenofpain_sonic_wave"
end
function modifier_evo_nyx_acoustic_disruption.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    if self:GetStackCount() <= 0 then
        self:SetStackCount(1)
    end
end
function modifier_evo_nyx_acoustic_disruption.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE")
    }
end
function modifier_evo_nyx_acoustic_disruption.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local s = math.max(
        1,
        math.min(
            3,
            self:GetStackCount()
        )
    )
    return -(12 + (s - 1) * 4)
end
function modifier_evo_nyx_acoustic_disruption.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local s = math.max(
        1,
        math.min(
            3,
            self:GetStackCount()
        )
    )
    return -(15 + (s - 1) * 5)
end
function modifier_evo_nyx_acoustic_disruption.prototype.GetModifierDamageOutgoing_Percentage(self)
    local s = math.max(
        1,
        math.min(
            3,
            self:GetStackCount()
        )
    )
    return -(6 + (s - 1) * 3)
end
modifier_evo_nyx_acoustic_disruption = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_acoustic_disruption")},
    modifier_evo_nyx_acoustic_disruption
)
____exports.modifier_evo_nyx_acoustic_disruption = modifier_evo_nyx_acoustic_disruption
____exports.modifier_evo_nyx_cicada_chitin_as = __TS__Class()
local modifier_evo_nyx_cicada_chitin_as = ____exports.modifier_evo_nyx_cicada_chitin_as
modifier_evo_nyx_cicada_chitin_as.name = "modifier_evo_nyx_cicada_chitin_as"
__TS__ClassExtends(modifier_evo_nyx_cicada_chitin_as, BaseModifier)
function modifier_evo_nyx_cicada_chitin_as.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_cicada_chitin_as.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_cicada_chitin_as.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_cicada_chitin_as.prototype.GetTexture(self)
    return "nyx_assassin_spiked_carapace"
end
function modifier_evo_nyx_cicada_chitin_as.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")}
end
function modifier_evo_nyx_cicada_chitin_as.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self:GetStackCount()
end
modifier_evo_nyx_cicada_chitin_as = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_cicada_chitin_as")},
    modifier_evo_nyx_cicada_chitin_as
)
____exports.modifier_evo_nyx_cicada_chitin_as = modifier_evo_nyx_cicada_chitin_as
return ____exports
