local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 10,["16"] = 12,["17"] = 18,["18"] = 19,["20"] = 22,["21"] = 23,["22"] = 22,["23"] = 26,["24"] = 27,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["31"] = 30,["32"] = 31,["35"] = 33,["36"] = 34,["37"] = 35,["38"] = 28,["39"] = 27,["40"] = 26,["41"] = 27,["43"] = 27,["44"] = 39,["45"] = 40,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 41,["51"] = 44,["52"] = 45,["53"] = 44,["54"] = 47,["55"] = 48,["56"] = 47,["57"] = 50,["58"] = 51,["59"] = 50,["60"] = 53,["61"] = 54,["62"] = 54,["63"] = 54,["64"] = 54,["65"] = 53,["66"] = 59,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 60,["71"] = 60,["72"] = 60,["73"] = 59,["74"] = 67,["75"] = 68,["76"] = 69,["77"] = 67,["78"] = 71,["79"] = 72,["80"] = 71,["81"] = 74,["82"] = 75,["85"] = 76,["86"] = 77,["87"] = 78,["90"] = 79,["91"] = 80,["92"] = 81,["93"] = 82,["94"] = 83,["95"] = 84,["96"] = 86,["97"] = 87,["98"] = 88,["99"] = 88,["100"] = 88,["101"] = 88,["102"] = 88,["103"] = 88,["104"] = 88,["105"] = 95,["107"] = 97,["108"] = 74,["109"] = 99,["110"] = 100,["113"] = 101,["114"] = 102,["117"] = 103,["120"] = 104,["121"] = 99,["122"] = 40,["123"] = 39,["124"] = 40,["126"] = 40,["127"] = 108,["128"] = 109,["129"] = 108,["130"] = 109,["131"] = 110,["132"] = 111,["133"] = 110,["134"] = 113,["135"] = 114,["136"] = 113,["137"] = 116,["138"] = 117,["139"] = 116,["140"] = 119,["141"] = 120,["142"] = 119,["143"] = 122,["144"] = 123,["145"] = 123,["146"] = 123,["147"] = 123,["148"] = 122,["149"] = 128,["150"] = 129,["151"] = 130,["152"] = 128,["153"] = 132,["154"] = 133,["157"] = 134,["158"] = 135,["161"] = 136,["164"] = 137,["165"] = 137,["166"] = 137,["167"] = 137,["168"] = 132,["169"] = 109,["170"] = 108,["171"] = 109,["173"] = 109,["174"] = 141,["175"] = 142,["176"] = 141,["177"] = 142,["178"] = 143,["179"] = 144,["180"] = 143,["181"] = 146,["182"] = 147,["183"] = 146,["184"] = 149,["185"] = 150,["186"] = 149,["187"] = 152,["188"] = 153,["189"] = 152,["190"] = 155,["191"] = 156,["192"] = 155,["193"] = 142,["194"] = 141,["195"] = 142,["197"] = 142});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis_ult"
local MANTIS_ULT_MODS = {"modifier_evo_nyx_mantis_r_stealth", "modifier_evo_nyx_mantis_r_frenzy", "modifier_evo_nyx_mantis_r_break"}
for ____, modName in ipairs(MANTIS_ULT_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
local function getAgi(self, unit)
    return unit:IsRealHero() and unit:GetAgility() or 0
end
____exports.evo_nyx_mantis_r = __TS__Class()
local evo_nyx_mantis_r = ____exports.evo_nyx_mantis_r
evo_nyx_mantis_r.name = "evo_nyx_mantis_r"
__TS__ClassExtends(evo_nyx_mantis_r, BaseAbility)
function evo_nyx_mantis_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("stealth_duration")
    caster:EmitSound("Hero_NyxAssassin.Vendetta")
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_mantis_r_stealth", {duration = dur})
end
evo_nyx_mantis_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_r")},
    evo_nyx_mantis_r
)
____exports.evo_nyx_mantis_r = evo_nyx_mantis_r
____exports.modifier_evo_nyx_mantis_r_stealth = __TS__Class()
local modifier_evo_nyx_mantis_r_stealth = ____exports.modifier_evo_nyx_mantis_r_stealth
modifier_evo_nyx_mantis_r_stealth.name = "modifier_evo_nyx_mantis_r_stealth"
__TS__ClassExtends(modifier_evo_nyx_mantis_r_stealth, BaseModifier)
function modifier_evo_nyx_mantis_r_stealth.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_r_stealth.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_r_stealth.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_r_stealth.prototype.GetTexture(self)
    return "nyx_assassin_vendetta"
end
function modifier_evo_nyx_mantis_r_stealth.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_INVISIBLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true
    }
end
function modifier_evo_nyx_mantis_r_stealth.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED")
    }
end
function modifier_evo_nyx_mantis_r_stealth.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ab = self:GetAbility()
    return ab and ab:GetSpecialValueFor("bonus_ms_pct") or 35
end
function modifier_evo_nyx_mantis_r_stealth.prototype.GetModifierInvisibilityLevel(self)
    return 1
end
function modifier_evo_nyx_mantis_r_stealth.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    local target = event.target
    if target and not target:IsNull() and IsValidEntity(target) and not target:IsBuilding() then
        local baseDmg = ab:GetSpecialValueFor("base_damage")
        local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
        local breakDur = ab:GetSpecialValueFor("break_duration")
        local frenzyDur = ab:GetSpecialValueFor("frenzy_duration")
        target:EmitSound("Hero_NyxAssassin.Vendetta.Crit")
        target:AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_r_break", {duration = breakDur})
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ab,
            damage = baseDmg + getAgi(nil, parent) * agiPct,
            damage_type = 4
        })
        parent:AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_r_frenzy", {duration = frenzyDur})
    end
    self:Destroy()
end
function modifier_evo_nyx_mantis_r_stealth.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.unit ~= parent then
        return
    end
    if event.ability and event.ability:GetAbilityName() == "evo_nyx_mantis_r" then
        return
    end
    self:Destroy()
end
modifier_evo_nyx_mantis_r_stealth = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_r_stealth")},
    modifier_evo_nyx_mantis_r_stealth
)
____exports.modifier_evo_nyx_mantis_r_stealth = modifier_evo_nyx_mantis_r_stealth
____exports.modifier_evo_nyx_mantis_r_frenzy = __TS__Class()
local modifier_evo_nyx_mantis_r_frenzy = ____exports.modifier_evo_nyx_mantis_r_frenzy
modifier_evo_nyx_mantis_r_frenzy.name = "modifier_evo_nyx_mantis_r_frenzy"
__TS__ClassExtends(modifier_evo_nyx_mantis_r_frenzy, BaseModifier)
function modifier_evo_nyx_mantis_r_frenzy.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.GetTexture(self)
    return "nyx_assassin_vendetta"
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local ab = self:GetAbility()
    return ab and ab:GetSpecialValueFor("frenzy_as") or 100
end
function modifier_evo_nyx_mantis_r_frenzy.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    if event.damage_type ~= 1 or event.damage <= 0 then
        return
    end
    parent:Heal(
        event.damage * 0.25,
        self:GetAbility()
    )
end
modifier_evo_nyx_mantis_r_frenzy = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_r_frenzy")},
    modifier_evo_nyx_mantis_r_frenzy
)
____exports.modifier_evo_nyx_mantis_r_frenzy = modifier_evo_nyx_mantis_r_frenzy
____exports.modifier_evo_nyx_mantis_r_break = __TS__Class()
local modifier_evo_nyx_mantis_r_break = ____exports.modifier_evo_nyx_mantis_r_break
modifier_evo_nyx_mantis_r_break.name = "modifier_evo_nyx_mantis_r_break"
__TS__ClassExtends(modifier_evo_nyx_mantis_r_break, BaseModifier)
function modifier_evo_nyx_mantis_r_break.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_r_break.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_r_break.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_r_break.prototype.GetTexture(self)
    return "nyx_assassin_vendetta"
end
function modifier_evo_nyx_mantis_r_break.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_PASSIVES_DISABLED")] = true}
end
modifier_evo_nyx_mantis_r_break = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_r_break")},
    modifier_evo_nyx_mantis_r_break
)
____exports.modifier_evo_nyx_mantis_r_break = modifier_evo_nyx_mantis_r_break
return ____exports
