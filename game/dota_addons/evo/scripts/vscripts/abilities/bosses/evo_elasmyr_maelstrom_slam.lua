local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 7,["17"] = 8,["18"] = 7,["19"] = 8,["20"] = 9,["21"] = 10,["24"] = 11,["25"] = 12,["28"] = 14,["29"] = 15,["30"] = 16,["31"] = 17,["32"] = 19,["33"] = 21,["34"] = 26,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 28,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 30,["50"] = 30,["51"] = 30,["52"] = 42,["54"] = 43,["55"] = 43,["57"] = 44,["58"] = 45,["59"] = 46,["60"] = 47,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 60,["77"] = 9,["78"] = 8,["79"] = 7,["80"] = 8,["82"] = 8,["83"] = 67,["84"] = 68,["85"] = 67,["86"] = 68,["87"] = 69,["88"] = 70,["89"] = 69,["90"] = 72,["91"] = 73,["92"] = 72,["93"] = 75,["94"] = 76,["95"] = 75,["96"] = 78,["97"] = 79,["98"] = 78,["99"] = 81,["100"] = 82,["101"] = 81,["102"] = 84,["103"] = 85,["104"] = 84,["105"] = 68,["106"] = 67,["107"] = 68,["109"] = 68});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_maelstrom_slam"
LinkLuaModifier("modifier_evo_elasmyr_maelstrom_slow", SCRIPT_PATH, 0)
____exports.evo_elasmyr_maelstrom_slam = __TS__Class()
local evo_elasmyr_maelstrom_slam = ____exports.evo_elasmyr_maelstrom_slam
evo_elasmyr_maelstrom_slam.name = "evo_elasmyr_maelstrom_slam"
__TS__ClassExtends(evo_elasmyr_maelstrom_slam, BaseAbility)
function evo_elasmyr_maelstrom_slam.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local radius = self:GetSpecialValueFor("radius")
    local damage = self:GetSpecialValueFor("damage")
    local slowDuration = self:GetSpecialValueFor("slow_duration")
    caster:EmitSound("Hero_Slardar.Slithereen_Crush")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(radius, radius, radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
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
                goto __continue5
            end
            local pos = enemy:GetAbsOrigin()
            local toCaster = Vector(origin.x - pos.x, origin.y - pos.y, 0)
            local dist = toCaster:Length2D()
            if dist > 130 then
                local pullDist = math.min(dist - 115, 190)
                local dir = toCaster:Normalized()
                local pulled = Vector(pos.x + dir.x * pullDist, pos.y + dir.y * pullDist, pos.z)
                FindClearSpaceForUnit(enemy, pulled, true)
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = damage,
                damage_type = 2
            })
            enemy:AddNewModifier(caster, self, "modifier_evo_elasmyr_maelstrom_slow", {duration = slowDuration})
        end
        ::__continue5::
    end
end
evo_elasmyr_maelstrom_slam = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_elasmyr_maelstrom_slam")},
    evo_elasmyr_maelstrom_slam
)
____exports.evo_elasmyr_maelstrom_slam = evo_elasmyr_maelstrom_slam
____exports.modifier_evo_elasmyr_maelstrom_slow = __TS__Class()
local modifier_evo_elasmyr_maelstrom_slow = ____exports.modifier_evo_elasmyr_maelstrom_slow
modifier_evo_elasmyr_maelstrom_slow.name = "modifier_evo_elasmyr_maelstrom_slow"
__TS__ClassExtends(modifier_evo_elasmyr_maelstrom_slow, BaseModifier)
function modifier_evo_elasmyr_maelstrom_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_elasmyr_maelstrom_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_elasmyr_maelstrom_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_elasmyr_maelstrom_slow.prototype.GetTexture(self)
    return "slardar_slithereen_crush"
end
function modifier_evo_elasmyr_maelstrom_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_elasmyr_maelstrom_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -40
end
modifier_evo_elasmyr_maelstrom_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_maelstrom_slow")},
    modifier_evo_elasmyr_maelstrom_slow
)
____exports.modifier_evo_elasmyr_maelstrom_slow = modifier_evo_elasmyr_maelstrom_slow
return ____exports
