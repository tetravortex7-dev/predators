local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 13,["20"] = 14,["22"] = 17,["23"] = 18,["24"] = 17,["25"] = 18,["26"] = 19,["27"] = 20,["30"] = 21,["31"] = 22,["34"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 31,["45"] = 32,["46"] = 34,["47"] = 35,["48"] = 37,["49"] = 19,["50"] = 18,["51"] = 17,["52"] = 18,["54"] = 18,["55"] = 46,["56"] = 47,["57"] = 46,["58"] = 47,["60"] = 47,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 53,["67"] = 54,["68"] = 46,["69"] = 57,["70"] = 58,["71"] = 57,["72"] = 60,["73"] = 61,["74"] = 60,["75"] = 63,["76"] = 64,["77"] = 64,["78"] = 64,["79"] = 64,["80"] = 63,["81"] = 69,["82"] = 70,["85"] = 71,["86"] = 72,["87"] = 73,["88"] = 74,["89"] = 75,["90"] = 76,["91"] = 77,["92"] = 78,["93"] = 80,["94"] = 81,["95"] = 82,["97"] = 88,["98"] = 69,["99"] = 90,["100"] = 91,["103"] = 92,["104"] = 93,["105"] = 94,["108"] = 98,["109"] = 99,["110"] = 100,["111"] = 101,["112"] = 102,["113"] = 104,["114"] = 104,["115"] = 104,["116"] = 104,["117"] = 104,["118"] = 104,["119"] = 104,["120"] = 104,["121"] = 104,["122"] = 104,["123"] = 104,["124"] = 116,["125"] = 117,["127"] = 118,["128"] = 118,["130"] = 119,["131"] = 120,["132"] = 120,["134"] = 121,["135"] = 123,["136"] = 123,["137"] = 123,["138"] = 123,["139"] = 123,["140"] = 123,["141"] = 123,["142"] = 130,["146"] = 90,["147"] = 135,["148"] = 136,["151"] = 137,["152"] = 138,["153"] = 139,["154"] = 140,["156"] = 142,["157"] = 143,["158"] = 144,["159"] = 144,["160"] = 144,["161"] = 144,["162"] = 144,["164"] = 135,["165"] = 47,["166"] = 46,["167"] = 47,["169"] = 47,["170"] = 149,["171"] = 150,["172"] = 149,["173"] = 150,["174"] = 151,["175"] = 152,["176"] = 151,["177"] = 154,["178"] = 155,["179"] = 154,["180"] = 157,["181"] = 158,["182"] = 157,["183"] = 160,["184"] = 161,["185"] = 160,["186"] = 163,["187"] = 164,["188"] = 163,["189"] = 166,["190"] = 167,["191"] = 168,["192"] = 169,["193"] = 166,["194"] = 150,["195"] = 149,["196"] = 150,["198"] = 150});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_t1_water_splash"
if IsServer() then
    LinkLuaModifier("modifier_evo_morph_t1_water_splash_dash", SCRIPT_PATH, 0)
    LinkLuaModifier("modifier_evo_morph_t1_water_splash_slow", SCRIPT_PATH, 0)
end
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
                goto __continue15
            end
            local id = enemy:entindex()
            if self.hitTargets:has(id) then
                goto __continue15
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
        ::__continue15::
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
