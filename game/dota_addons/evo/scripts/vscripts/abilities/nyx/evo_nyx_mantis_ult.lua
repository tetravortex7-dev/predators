local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 10,["16"] = 12,["17"] = 18,["18"] = 19,["19"] = 20,["22"] = 24,["23"] = 25,["24"] = 24,["25"] = 28,["26"] = 29,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["33"] = 32,["34"] = 33,["37"] = 35,["38"] = 36,["39"] = 37,["40"] = 30,["41"] = 29,["42"] = 28,["43"] = 29,["45"] = 29,["46"] = 41,["47"] = 42,["48"] = 41,["49"] = 42,["50"] = 43,["51"] = 44,["52"] = 43,["53"] = 46,["54"] = 47,["55"] = 46,["56"] = 49,["57"] = 50,["58"] = 49,["59"] = 52,["60"] = 53,["61"] = 52,["62"] = 55,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 55,["68"] = 61,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 62,["75"] = 61,["76"] = 69,["77"] = 70,["78"] = 71,["79"] = 69,["80"] = 73,["81"] = 74,["82"] = 73,["83"] = 76,["84"] = 77,["87"] = 78,["88"] = 79,["89"] = 80,["92"] = 81,["93"] = 82,["94"] = 83,["95"] = 84,["96"] = 85,["97"] = 86,["98"] = 88,["99"] = 89,["100"] = 90,["101"] = 90,["102"] = 90,["103"] = 90,["104"] = 90,["105"] = 90,["106"] = 90,["107"] = 97,["109"] = 99,["110"] = 76,["111"] = 101,["112"] = 102,["115"] = 103,["116"] = 104,["119"] = 105,["122"] = 106,["123"] = 101,["124"] = 42,["125"] = 41,["126"] = 42,["128"] = 42,["129"] = 110,["130"] = 111,["131"] = 110,["132"] = 111,["133"] = 112,["134"] = 113,["135"] = 112,["136"] = 115,["137"] = 116,["138"] = 115,["139"] = 118,["140"] = 119,["141"] = 118,["142"] = 121,["143"] = 122,["144"] = 121,["145"] = 124,["146"] = 125,["147"] = 125,["148"] = 125,["149"] = 125,["150"] = 124,["151"] = 130,["152"] = 131,["153"] = 132,["154"] = 130,["155"] = 134,["156"] = 135,["159"] = 136,["160"] = 137,["163"] = 138,["166"] = 139,["167"] = 139,["168"] = 139,["169"] = 139,["170"] = 134,["171"] = 111,["172"] = 110,["173"] = 111,["175"] = 111,["176"] = 143,["177"] = 144,["178"] = 143,["179"] = 144,["180"] = 145,["181"] = 146,["182"] = 145,["183"] = 148,["184"] = 149,["185"] = 148,["186"] = 151,["187"] = 152,["188"] = 151,["189"] = 154,["190"] = 155,["191"] = 154,["192"] = 157,["193"] = 158,["194"] = 157,["195"] = 144,["196"] = 143,["197"] = 144,["199"] = 144});
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
if IsServer() then
    for ____, modName in ipairs(MANTIS_ULT_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
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
