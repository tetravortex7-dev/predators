local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 13,["20"] = 15,["21"] = 16,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 18,["28"] = 19,["29"] = 20,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 29,["43"] = 30,["44"] = 32,["45"] = 33,["46"] = 35,["47"] = 17,["48"] = 16,["49"] = 15,["50"] = 16,["52"] = 16,["53"] = 44,["54"] = 45,["55"] = 44,["56"] = 45,["58"] = 45,["59"] = 46,["60"] = 47,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 44,["67"] = 55,["68"] = 56,["69"] = 55,["70"] = 58,["71"] = 59,["72"] = 58,["73"] = 61,["74"] = 62,["75"] = 62,["76"] = 62,["77"] = 62,["78"] = 61,["79"] = 67,["80"] = 68,["83"] = 69,["84"] = 70,["85"] = 71,["86"] = 72,["87"] = 73,["88"] = 74,["89"] = 75,["90"] = 76,["91"] = 78,["92"] = 79,["93"] = 80,["95"] = 86,["96"] = 67,["97"] = 88,["98"] = 89,["101"] = 90,["102"] = 91,["103"] = 92,["106"] = 96,["107"] = 97,["108"] = 98,["109"] = 99,["110"] = 100,["111"] = 102,["112"] = 102,["113"] = 102,["114"] = 102,["115"] = 102,["116"] = 102,["117"] = 102,["118"] = 102,["119"] = 102,["120"] = 102,["121"] = 102,["122"] = 114,["123"] = 115,["125"] = 116,["126"] = 116,["128"] = 117,["129"] = 118,["130"] = 118,["132"] = 119,["133"] = 121,["134"] = 121,["135"] = 121,["136"] = 121,["137"] = 121,["138"] = 121,["139"] = 121,["140"] = 128,["144"] = 88,["145"] = 133,["146"] = 134,["149"] = 135,["150"] = 136,["151"] = 137,["152"] = 138,["154"] = 140,["155"] = 141,["156"] = 142,["157"] = 142,["158"] = 142,["159"] = 142,["160"] = 142,["162"] = 133,["163"] = 45,["164"] = 44,["165"] = 45,["167"] = 45,["168"] = 147,["169"] = 148,["170"] = 147,["171"] = 148,["172"] = 149,["173"] = 150,["174"] = 149,["175"] = 152,["176"] = 153,["177"] = 152,["178"] = 155,["179"] = 156,["180"] = 155,["181"] = 158,["182"] = 159,["183"] = 158,["184"] = 161,["185"] = 162,["186"] = 161,["187"] = 164,["188"] = 165,["189"] = 166,["190"] = 167,["191"] = 164,["192"] = 148,["193"] = 147,["194"] = 148,["196"] = 148});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_t1_water_splash"
LinkLuaModifier("modifier_evo_morph_t1_water_splash_dash", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_morph_t1_water_splash_slow", SCRIPT_PATH, 0)
____exports.evo_morph_t1_water_splash = __TS__Class()
local evo_morph_t1_water_splash = ____exports.evo_morph_t1_water_splash
evo_morph_t1_water_splash.name = "evo_morph_t1_water_splash"
__TS__ClassExtends(evo_morph_t1_water_splash, BaseAbility)
function evo_morph_t1_water_splash.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local maxDist = self:GetSpecialValueFor("dash_range")
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local rawDist = delta:Length2D()
    local dir = rawDist > 1 and delta:Normalized() or caster:GetForwardVector()
    local distance = math.min(
        maxDist,
        math.max(150, rawDist)
    )
    local speed = 1500
    local duration = math.max(0.12, distance / speed)
    caster:SetForwardVector(dir)
    caster:EmitSound("Hero_Morphling.Waveform")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_t1_water_splash_dash", {duration = duration, dir_x = dir.x, dir_y = dir.y, speed = speed})
end
evo_morph_t1_water_splash = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_t1_water_splash")},
    evo_morph_t1_water_splash
)
____exports.evo_morph_t1_water_splash = evo_morph_t1_water_splash
____exports.modifier_evo_morph_t1_water_splash_dash = __TS__Class()
local modifier_evo_morph_t1_water_splash_dash = ____exports.modifier_evo_morph_t1_water_splash_dash
modifier_evo_morph_t1_water_splash_dash.name = "modifier_evo_morph_t1_water_splash_dash"
__TS__ClassExtends(modifier_evo_morph_t1_water_splash_dash, BaseModifier)
function modifier_evo_morph_t1_water_splash_dash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1500
    self.width = 175
    self.damage = 75
    self.slowDuration = 2
    self.hitTargets = __TS__New(Set)
end
function modifier_evo_morph_t1_water_splash_dash.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_t1_water_splash_dash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_t1_water_splash_dash.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_morph_t1_water_splash_dash.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    self.speed = params.speed or 1500
    local ability = self:GetAbility()
    self.width = ability and ability:GetSpecialValueFor("width") or 175
    self.damage = ability and ability:GetSpecialValueFor("damage") or 75
    self.slowDuration = ability and ability:GetSpecialValueFor("slow_duration") or 2
    self.hitTargets = __TS__New(Set)
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_waveform.vpcf", 1, parent)
    end
    self:StartIntervalThink(0.03)
end
function modifier_evo_morph_t1_water_splash_dash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        self:Destroy()
        return
    end
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    nextPos.z = GetGroundHeight(nextPos, parent)
    parent:SetAbsOrigin(nextPos)
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        self.width,
        2,
        1 + 18,
        0,
        0,
        false
    )
    local ability = self:GetAbility()
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue14
            end
            local id = enemy:entindex()
            if self.hitTargets:has(id) then
                goto __continue14
            end
            self.hitTargets:add(id)
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ability,
                damage = self.damage,
                damage_type = 2
            })
            enemy:AddNewModifier(parent, ability, "modifier_evo_morph_t1_water_splash_slow", {duration = self.slowDuration})
        end
        ::__continue14::
    end
end
function modifier_evo_morph_t1_water_splash_dash.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() and IsValidEntity(parent) then
        FindClearSpaceForUnit(
            parent,
            parent:GetAbsOrigin(),
            true
        )
    end
end
modifier_evo_morph_t1_water_splash_dash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_t1_water_splash_dash")},
    modifier_evo_morph_t1_water_splash_dash
)
____exports.modifier_evo_morph_t1_water_splash_dash = modifier_evo_morph_t1_water_splash_dash
____exports.modifier_evo_morph_t1_water_splash_slow = __TS__Class()
local modifier_evo_morph_t1_water_splash_slow = ____exports.modifier_evo_morph_t1_water_splash_slow
modifier_evo_morph_t1_water_splash_slow.name = "modifier_evo_morph_t1_water_splash_slow"
__TS__ClassExtends(modifier_evo_morph_t1_water_splash_slow, BaseModifier)
function modifier_evo_morph_t1_water_splash_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_t1_water_splash_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_t1_water_splash_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_t1_water_splash_slow.prototype.GetTexture(self)
    return "morphling_waveform"
end
function modifier_evo_morph_t1_water_splash_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_morph_t1_water_splash_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    local slow = ability and ability:GetSpecialValueFor("slow_pct") or 15
    return -slow
end
modifier_evo_morph_t1_water_splash_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_t1_water_splash_slow")},
    modifier_evo_morph_t1_water_splash_slow
)
____exports.modifier_evo_morph_t1_water_splash_slow = modifier_evo_morph_t1_water_splash_slow
return ____exports
