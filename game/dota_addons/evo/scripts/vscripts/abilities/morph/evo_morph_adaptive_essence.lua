local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 10,["26"] = 9,["27"] = 10,["29"] = 10,["30"] = 16,["31"] = 17,["32"] = 16,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 18,["37"] = 21,["38"] = 22,["39"] = 21,["40"] = 24,["41"] = 25,["42"] = 24,["43"] = 27,["44"] = 28,["45"] = 27,["46"] = 30,["47"] = 31,["48"] = 30,["49"] = 33,["50"] = 34,["53"] = 35,["54"] = 36,["55"] = 33,["56"] = 38,["57"] = 39,["60"] = 40,["61"] = 38,["62"] = 42,["63"] = 43,["66"] = 44,["67"] = 42,["68"] = 46,["69"] = 47,["70"] = 48,["73"] = 49,["74"] = 51,["75"] = 52,["76"] = 53,["79"] = 57,["80"] = 58,["81"] = 59,["82"] = 60,["83"] = 60,["84"] = 60,["85"] = 60,["86"] = 61,["87"] = 62,["90"] = 66,["91"] = 67,["92"] = 68,["95"] = 72,["96"] = 73,["97"] = 74,["98"] = 76,["99"] = 77,["100"] = 78,["101"] = 79,["103"] = 81,["105"] = 46,["106"] = 84,["107"] = 85,["108"] = 86,["109"] = 86,["111"] = 87,["112"] = 87,["114"] = 88,["115"] = 84,["116"] = 90,["117"] = 91,["118"] = 92,["119"] = 90,["120"] = 94,["121"] = 95,["122"] = 96,["123"] = 94,["124"] = 98,["125"] = 99,["126"] = 99,["127"] = 99,["128"] = 99,["129"] = 99,["130"] = 99,["131"] = 99,["132"] = 99,["133"] = 99,["134"] = 98,["135"] = 109,["136"] = 110,["137"] = 111,["138"] = 111,["140"] = 112,["141"] = 113,["142"] = 114,["143"] = 109,["144"] = 116,["145"] = 117,["146"] = 118,["147"] = 118,["149"] = 119,["150"] = 120,["151"] = 121,["152"] = 116,["153"] = 123,["154"] = 124,["155"] = 124,["157"] = 125,["158"] = 126,["159"] = 123,["160"] = 128,["161"] = 129,["162"] = 129,["164"] = 130,["165"] = 131,["166"] = 128,["167"] = 133,["168"] = 134,["169"] = 134,["171"] = 135,["172"] = 136,["173"] = 133,["174"] = 138,["175"] = 139,["176"] = 139,["178"] = 140,["179"] = 141,["180"] = 138,["181"] = 143,["182"] = 144,["183"] = 144,["185"] = 145,["186"] = 143,["187"] = 17,["188"] = 16,["189"] = 17,["191"] = 17});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_adaptive_essence"
if IsServer() then
    LinkLuaModifier("modifier_evo_morph_adaptive_essence", SCRIPT_PATH, 0)
end
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
