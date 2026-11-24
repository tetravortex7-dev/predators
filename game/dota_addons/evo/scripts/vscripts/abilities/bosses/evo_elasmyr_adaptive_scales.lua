local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 8,["18"] = 9,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 10,["24"] = 9,["25"] = 8,["26"] = 9,["28"] = 9,["29"] = 15,["30"] = 16,["31"] = 15,["32"] = 16,["34"] = 16,["35"] = 17,["36"] = 15,["37"] = 19,["38"] = 20,["39"] = 19,["40"] = 22,["41"] = 23,["42"] = 22,["43"] = 25,["44"] = 26,["45"] = 25,["46"] = 28,["47"] = 29,["48"] = 28,["49"] = 31,["50"] = 32,["53"] = 33,["54"] = 34,["55"] = 31,["56"] = 36,["57"] = 37,["60"] = 38,["63"] = 39,["64"] = 40,["65"] = 41,["67"] = 36,["68"] = 44,["69"] = 45,["70"] = 45,["71"] = 45,["72"] = 45,["73"] = 45,["74"] = 44,["75"] = 51,["76"] = 52,["77"] = 53,["78"] = 54,["79"] = 51,["80"] = 56,["81"] = 57,["82"] = 58,["83"] = 59,["84"] = 56,["85"] = 61,["86"] = 62,["89"] = 63,["90"] = 64,["93"] = 65,["96"] = 66,["97"] = 67,["100"] = 68,["103"] = 69,["106"] = 71,["107"] = 72,["108"] = 73,["109"] = 74,["110"] = 76,["111"] = 77,["112"] = 78,["113"] = 78,["114"] = 78,["115"] = 78,["116"] = 78,["117"] = 78,["118"] = 78,["119"] = 79,["121"] = 81,["123"] = 61,["124"] = 84,["125"] = 85,["126"] = 86,["127"] = 87,["128"] = 89,["129"] = 90,["130"] = 95,["131"] = 96,["132"] = 96,["133"] = 96,["134"] = 96,["135"] = 96,["136"] = 97,["137"] = 99,["138"] = 99,["139"] = 99,["140"] = 99,["141"] = 99,["142"] = 99,["143"] = 99,["144"] = 99,["145"] = 99,["146"] = 99,["147"] = 99,["148"] = 111,["150"] = 112,["151"] = 112,["153"] = 113,["154"] = 113,["155"] = 113,["156"] = 113,["157"] = 113,["158"] = 113,["159"] = 113,["160"] = 120,["164"] = 84,["165"] = 16,["166"] = 15,["167"] = 16,["169"] = 16,["170"] = 125,["171"] = 126,["172"] = 125,["173"] = 126,["174"] = 127,["175"] = 128,["176"] = 127,["177"] = 130,["178"] = 131,["179"] = 130,["180"] = 133,["181"] = 134,["182"] = 133,["183"] = 136,["184"] = 137,["185"] = 136,["186"] = 139,["187"] = 140,["188"] = 139,["189"] = 142,["190"] = 143,["191"] = 142,["192"] = 126,["193"] = 125,["194"] = 126,["196"] = 126});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_adaptive_scales"
LinkLuaModifier("modifier_evo_elasmyr_adaptive_scales", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_elasmyr_scales_burst_slow", SCRIPT_PATH, 0)
____exports.evo_elasmyr_adaptive_scales = __TS__Class()
local evo_elasmyr_adaptive_scales = ____exports.evo_elasmyr_adaptive_scales
evo_elasmyr_adaptive_scales.name = "evo_elasmyr_adaptive_scales"
__TS__ClassExtends(evo_elasmyr_adaptive_scales, BaseAbility)
function evo_elasmyr_adaptive_scales.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_elasmyr_adaptive_scales"
end
evo_elasmyr_adaptive_scales = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_elasmyr_adaptive_scales")},
    evo_elasmyr_adaptive_scales
)
____exports.evo_elasmyr_adaptive_scales = evo_elasmyr_adaptive_scales
____exports.modifier_evo_elasmyr_adaptive_scales = __TS__Class()
local modifier_evo_elasmyr_adaptive_scales = ____exports.modifier_evo_elasmyr_adaptive_scales
modifier_evo_elasmyr_adaptive_scales.name = "modifier_evo_elasmyr_adaptive_scales"
__TS__ClassExtends(modifier_evo_elasmyr_adaptive_scales, BaseModifier)
function modifier_evo_elasmyr_adaptive_scales.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastStackTime = 0
end
function modifier_evo_elasmyr_adaptive_scales.prototype.IsHidden(self)
    return self:GetStackCount() <= 0
end
function modifier_evo_elasmyr_adaptive_scales.prototype.IsDebuff(self)
    return false
end
function modifier_evo_elasmyr_adaptive_scales.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_adaptive_scales.prototype.GetTexture(self)
    return "slardar_bash"
end
function modifier_evo_elasmyr_adaptive_scales.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.lastStackTime = 0
    self:StartIntervalThink(1)
end
function modifier_evo_elasmyr_adaptive_scales.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    if self:GetStackCount() <= 0 then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now - self.lastStackTime >= 6 then
        self:SetStackCount(0)
    end
end
function modifier_evo_elasmyr_adaptive_scales.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")
    }
end
function modifier_evo_elasmyr_adaptive_scales.prototype.GetModifierPhysicalArmorBonus(self)
    local ability = self:GetAbility()
    local perStack = ability and ability:GetSpecialValueFor("armor_per_stack") or 2
    return self:GetStackCount() * perStack
end
function modifier_evo_elasmyr_adaptive_scales.prototype.GetModifierMagicalResistanceBonus(self)
    local ability = self:GetAbility()
    local perStack = ability and ability:GetSpecialValueFor("magic_resist_per_stack") or 2.5
    return self:GetStackCount() * perStack
end
function modifier_evo_elasmyr_adaptive_scales.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if event.unit ~= parent then
        return
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or attacker == parent then
        return
    end
    if not attacker:IsHero() and not attacker:IsConsideredHero() then
        return
    end
    if event.damage < 15 then
        return
    end
    local ability = self:GetAbility()
    local maxStacks = ability and ability:GetSpecialValueFor("max_stacks") or 10
    local nextStacks = self:GetStackCount() + 1
    self.lastStackTime = GameRules:GetDOTATime(false, false)
    if nextStacks >= maxStacks then
        self:SetStackCount(0)
        parent:Purge(
            false,
            true,
            false,
            true,
            false
        )
        self:triggerTideBurst(parent, ability)
    else
        self:SetStackCount(nextStacks)
    end
end
function modifier_evo_elasmyr_adaptive_scales.prototype.triggerTideBurst(self, parent, ability)
    local radius = ability and ability:GetSpecialValueFor("burst_radius") or 350
    local damage = ability and ability:GetSpecialValueFor("burst_damage") or 180
    local origin = parent:GetAbsOrigin()
    parent:EmitSound("Hero_Slardar.Slithereen_Crush")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(radius, radius, radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        origin,
        nil,
        radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue26
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ability,
                damage = damage,
                damage_type = 2
            })
            enemy:AddNewModifier(parent, ability, "modifier_evo_elasmyr_scales_burst_slow", {duration = 1.5})
        end
        ::__continue26::
    end
end
modifier_evo_elasmyr_adaptive_scales = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_adaptive_scales")},
    modifier_evo_elasmyr_adaptive_scales
)
____exports.modifier_evo_elasmyr_adaptive_scales = modifier_evo_elasmyr_adaptive_scales
____exports.modifier_evo_elasmyr_scales_burst_slow = __TS__Class()
local modifier_evo_elasmyr_scales_burst_slow = ____exports.modifier_evo_elasmyr_scales_burst_slow
modifier_evo_elasmyr_scales_burst_slow.name = "modifier_evo_elasmyr_scales_burst_slow"
__TS__ClassExtends(modifier_evo_elasmyr_scales_burst_slow, BaseModifier)
function modifier_evo_elasmyr_scales_burst_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_elasmyr_scales_burst_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_elasmyr_scales_burst_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_elasmyr_scales_burst_slow.prototype.GetTexture(self)
    return "slardar_bash"
end
function modifier_evo_elasmyr_scales_burst_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_elasmyr_scales_burst_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -35
end
modifier_evo_elasmyr_scales_burst_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_scales_burst_slow")},
    modifier_evo_elasmyr_scales_burst_slow
)
____exports.modifier_evo_elasmyr_scales_burst_slow = modifier_evo_elasmyr_scales_burst_slow
return ____exports
