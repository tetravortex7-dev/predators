local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["26"] = 13,["27"] = 14,["30"] = 16,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 21,["35"] = 23,["36"] = 28,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 29,["42"] = 30,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 44,["56"] = 45,["57"] = 45,["59"] = 46,["60"] = 47,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 53,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 55,["72"] = 55,["73"] = 55,["74"] = 55,["75"] = 62,["79"] = 11,["80"] = 10,["81"] = 9,["82"] = 10,["84"] = 10,["85"] = 69,["86"] = 70,["87"] = 69,["88"] = 70,["89"] = 71,["90"] = 72,["91"] = 71,["92"] = 74,["93"] = 75,["94"] = 74,["95"] = 77,["96"] = 78,["97"] = 77,["98"] = 80,["99"] = 81,["100"] = 80,["101"] = 83,["102"] = 84,["103"] = 83,["104"] = 86,["105"] = 87,["106"] = 86,["107"] = 70,["108"] = 69,["109"] = 70,["111"] = 70});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_maelstrom_slam"
if IsServer() then
    LinkLuaModifier("modifier_evo_elasmyr_maelstrom_slow", SCRIPT_PATH, 0)
end
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
                goto __continue6
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
        ::__continue6::
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
