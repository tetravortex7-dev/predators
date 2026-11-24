local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 7,["17"] = 8,["18"] = 7,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 9,["23"] = 8,["24"] = 7,["25"] = 8,["27"] = 8,["28"] = 14,["29"] = 15,["30"] = 14,["31"] = 15,["32"] = 16,["33"] = 17,["34"] = 16,["35"] = 19,["36"] = 20,["37"] = 19,["38"] = 22,["39"] = 23,["40"] = 22,["41"] = 25,["42"] = 26,["43"] = 25,["44"] = 28,["45"] = 29,["46"] = 28,["47"] = 31,["48"] = 32,["51"] = 33,["52"] = 34,["53"] = 31,["54"] = 36,["55"] = 37,["58"] = 38,["59"] = 36,["60"] = 40,["61"] = 41,["64"] = 42,["65"] = 40,["66"] = 44,["67"] = 45,["68"] = 46,["71"] = 47,["72"] = 49,["73"] = 50,["74"] = 51,["77"] = 55,["78"] = 56,["79"] = 57,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 59,["85"] = 60,["88"] = 64,["89"] = 65,["90"] = 66,["93"] = 70,["94"] = 71,["95"] = 72,["96"] = 74,["97"] = 75,["98"] = 76,["99"] = 77,["101"] = 79,["103"] = 44,["104"] = 82,["105"] = 83,["106"] = 84,["107"] = 84,["109"] = 85,["110"] = 85,["112"] = 86,["113"] = 82,["114"] = 88,["115"] = 89,["116"] = 90,["117"] = 88,["118"] = 92,["119"] = 93,["120"] = 94,["121"] = 92,["122"] = 96,["123"] = 97,["124"] = 97,["125"] = 97,["126"] = 97,["127"] = 97,["128"] = 97,["129"] = 97,["130"] = 97,["131"] = 97,["132"] = 96,["133"] = 107,["134"] = 108,["135"] = 109,["136"] = 109,["138"] = 110,["139"] = 111,["140"] = 112,["141"] = 107,["142"] = 114,["143"] = 115,["144"] = 116,["145"] = 116,["147"] = 117,["148"] = 118,["149"] = 119,["150"] = 114,["151"] = 121,["152"] = 122,["153"] = 122,["155"] = 123,["156"] = 124,["157"] = 121,["158"] = 126,["159"] = 127,["160"] = 127,["162"] = 128,["163"] = 129,["164"] = 126,["165"] = 131,["166"] = 132,["167"] = 132,["169"] = 133,["170"] = 134,["171"] = 131,["172"] = 136,["173"] = 137,["174"] = 137,["176"] = 138,["177"] = 139,["178"] = 136,["179"] = 141,["180"] = 142,["181"] = 142,["183"] = 143,["184"] = 141,["185"] = 15,["186"] = 14,["187"] = 15,["189"] = 15});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_adaptive_essence"
LinkLuaModifier("modifier_evo_morph_adaptive_essence", SCRIPT_PATH, 0)
____exports.evo_morph_adaptive_essence = __TS__Class()
local evo_morph_adaptive_essence = ____exports.evo_morph_adaptive_essence
evo_morph_adaptive_essence.name = "evo_morph_adaptive_essence"
__TS__ClassExtends(evo_morph_adaptive_essence, BaseAbility)
function evo_morph_adaptive_essence.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_morph_adaptive_essence"
end
evo_morph_adaptive_essence = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_adaptive_essence")},
    evo_morph_adaptive_essence
)
____exports.evo_morph_adaptive_essence = evo_morph_adaptive_essence
____exports.modifier_evo_morph_adaptive_essence = __TS__Class()
local modifier_evo_morph_adaptive_essence = ____exports.modifier_evo_morph_adaptive_essence
modifier_evo_morph_adaptive_essence.name = "modifier_evo_morph_adaptive_essence"
__TS__ClassExtends(modifier_evo_morph_adaptive_essence, BaseModifier)
function modifier_evo_morph_adaptive_essence.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_adaptive_essence.prototype.IsDebuff(self)
    return false
end
function modifier_evo_morph_adaptive_essence.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_adaptive_essence.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_morph_adaptive_essence.prototype.GetTexture(self)
    return "morphling_morph_agi"
end
function modifier_evo_morph_adaptive_essence.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:updateMode()
    self:StartIntervalThink(0.5)
end
function modifier_evo_morph_adaptive_essence.prototype.OnRefresh(self)
    if not IsServer() then
        return
    end
    self:updateMode()
end
function modifier_evo_morph_adaptive_essence.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    self:updateMode()
end
function modifier_evo_morph_adaptive_essence.prototype.updateMode(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsRealHero() then
        return
    end
    local hero = parent
    local waterE = hero:FindAbilityByName("evo_morph_water_e")
    if waterE and not waterE:IsNull() and waterE:GetLevel() >= 2 then
        self:SetStackCount(4)
        return
    end
    local bloodE = hero:FindAbilityByName("evo_morph_blood_e")
    if bloodE and not bloodE:IsNull() and bloodE:GetLevel() >= 2 then
        local hpPct = hero:GetHealthPercent()
        local missingRatio = math.min(
            1,
            math.max(0, (100 - hpPct) / 65)
        )
        local scale = math.floor((1 + missingRatio) * 100 + 0.5)
        self:SetStackCount(scale)
        return
    end
    local voidE = hero:FindAbilityByName("evo_morph_void_e")
    if voidE and not voidE:IsNull() and voidE:GetLevel() >= 2 then
        self:SetStackCount(5)
        return
    end
    local str = hero:GetStrength()
    local agi = hero:GetAgility()
    local intVal = hero:GetIntellect(false)
    if str >= agi and str >= intVal then
        self:SetStackCount(1)
    elseif agi >= str and agi >= intVal then
        self:SetStackCount(2)
    else
        self:SetStackCount(3)
    end
end
function modifier_evo_morph_adaptive_essence.prototype.getStrScale(self)
    local s = self:GetStackCount()
    if s == 1 or s == 4 then
        return 1
    end
    if s >= 100 and s <= 200 then
        return s / 100
    end
    return 0
end
function modifier_evo_morph_adaptive_essence.prototype.hasAgi(self)
    local s = self:GetStackCount()
    return s == 2 or s == 4
end
function modifier_evo_morph_adaptive_essence.prototype.hasInt(self)
    local s = self:GetStackCount()
    return s == 3 or s == 5
end
function modifier_evo_morph_adaptive_essence.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_CASTER")
    }
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierPhysicalArmorBonus(self)
    local mult = self:getStrScale()
    if mult <= 0 then
        return 0
    end
    local ability = self:GetAbility()
    local base = ability and ability:GetSpecialValueFor("str_armor") or 4
    return base * mult
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierConstantHealthRegen(self)
    local mult = self:getStrScale()
    if mult <= 0 then
        return 0
    end
    local ability = self:GetAbility()
    local base = ability and ability:GetSpecialValueFor("str_hp_regen") or 4
    return base * mult
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierAttackSpeedBonus_Constant(self)
    if not self:hasAgi() then
        return 0
    end
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("agi_attack_speed") or 18
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    if not self:hasAgi() then
        return 0
    end
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("agi_move_speed_pct") or 5
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierSpellAmplify_Percentage(self)
    if not self:hasInt() then
        return 0
    end
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("int_spell_amp") or 6
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierConstantManaRegen(self)
    if not self:hasInt() then
        return 0
    end
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("int_mana_regen") or 1.5
end
function modifier_evo_morph_adaptive_essence.prototype.GetModifierStatusResistanceCaster(self)
    if self:GetStackCount() ~= 5 then
        return 0
    end
    return -12
end
modifier_evo_morph_adaptive_essence = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_adaptive_essence")},
    modifier_evo_morph_adaptive_essence
)
____exports.modifier_evo_morph_adaptive_essence = modifier_evo_morph_adaptive_essence
return ____exports
