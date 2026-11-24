local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["19"] = 10,["20"] = 11,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 11,["27"] = 10,["28"] = 11,["30"] = 11,["31"] = 17,["32"] = 18,["33"] = 17,["34"] = 18,["36"] = 18,["37"] = 19,["38"] = 17,["39"] = 21,["40"] = 22,["41"] = 21,["42"] = 24,["43"] = 25,["44"] = 24,["45"] = 27,["46"] = 28,["47"] = 27,["48"] = 30,["49"] = 31,["50"] = 30,["51"] = 33,["52"] = 34,["55"] = 35,["56"] = 36,["57"] = 33,["58"] = 38,["59"] = 39,["62"] = 40,["65"] = 41,["66"] = 42,["67"] = 43,["69"] = 38,["70"] = 46,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 47,["75"] = 47,["76"] = 46,["77"] = 53,["78"] = 54,["79"] = 55,["80"] = 56,["81"] = 53,["82"] = 58,["83"] = 59,["84"] = 60,["85"] = 61,["86"] = 58,["87"] = 63,["88"] = 64,["91"] = 65,["92"] = 66,["95"] = 67,["98"] = 68,["99"] = 69,["102"] = 70,["105"] = 71,["108"] = 73,["109"] = 74,["110"] = 75,["111"] = 76,["112"] = 78,["113"] = 79,["114"] = 80,["115"] = 80,["116"] = 80,["117"] = 80,["118"] = 80,["119"] = 80,["120"] = 80,["121"] = 81,["123"] = 83,["125"] = 63,["126"] = 86,["127"] = 87,["128"] = 88,["129"] = 89,["130"] = 91,["131"] = 92,["132"] = 97,["133"] = 98,["134"] = 98,["135"] = 98,["136"] = 98,["137"] = 98,["138"] = 99,["139"] = 101,["140"] = 101,["141"] = 101,["142"] = 101,["143"] = 101,["144"] = 101,["145"] = 101,["146"] = 101,["147"] = 101,["148"] = 101,["149"] = 101,["150"] = 113,["152"] = 114,["153"] = 114,["155"] = 115,["156"] = 115,["157"] = 115,["158"] = 115,["159"] = 115,["160"] = 115,["161"] = 115,["162"] = 122,["166"] = 86,["167"] = 18,["168"] = 17,["169"] = 18,["171"] = 18,["172"] = 127,["173"] = 128,["174"] = 127,["175"] = 128,["176"] = 129,["177"] = 130,["178"] = 129,["179"] = 132,["180"] = 133,["181"] = 132,["182"] = 135,["183"] = 136,["184"] = 135,["185"] = 138,["186"] = 139,["187"] = 138,["188"] = 141,["189"] = 142,["190"] = 141,["191"] = 144,["192"] = 145,["193"] = 144,["194"] = 128,["195"] = 127,["196"] = 128,["198"] = 128});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_adaptive_scales"
if IsServer() then
    LinkLuaModifier("modifier_evo_elasmyr_adaptive_scales", SCRIPT_PATH, 0)
    LinkLuaModifier("modifier_evo_elasmyr_scales_burst_slow", SCRIPT_PATH, 0)
end
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
                goto __continue27
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
        ::__continue27::
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
