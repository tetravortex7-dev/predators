local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 8,["18"] = 9,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["25"] = 12,["26"] = 13,["29"] = 15,["30"] = 16,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 20,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 26,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 28,["50"] = 28,["51"] = 28,["52"] = 28,["53"] = 39,["55"] = 40,["56"] = 40,["58"] = 41,["59"] = 41,["60"] = 41,["61"] = 41,["62"] = 41,["63"] = 41,["64"] = 41,["68"] = 50,["69"] = 51,["70"] = 52,["71"] = 54,["72"] = 59,["73"] = 59,["74"] = 59,["75"] = 59,["76"] = 59,["77"] = 60,["78"] = 60,["79"] = 60,["80"] = 60,["81"] = 60,["82"] = 61,["83"] = 63,["84"] = 63,["85"] = 63,["86"] = 63,["87"] = 63,["88"] = 63,["89"] = 63,["90"] = 63,["91"] = 63,["92"] = 10,["93"] = 9,["94"] = 8,["95"] = 9,["97"] = 9,["98"] = 75,["99"] = 76,["100"] = 75,["101"] = 76,["103"] = 76,["104"] = 77,["105"] = 75,["106"] = 80,["107"] = 81,["108"] = 80,["109"] = 83,["110"] = 84,["111"] = 83,["112"] = 86,["113"] = 87,["116"] = 88,["117"] = 89,["118"] = 90,["119"] = 91,["120"] = 92,["121"] = 97,["122"] = 97,["123"] = 97,["124"] = 97,["125"] = 97,["126"] = 98,["127"] = 98,["128"] = 98,["129"] = 98,["130"] = 98,["132"] = 100,["133"] = 86,["134"] = 102,["135"] = 103,["138"] = 104,["139"] = 105,["140"] = 106,["143"] = 107,["146"] = 108,["147"] = 109,["148"] = 110,["149"] = 110,["150"] = 110,["151"] = 110,["152"] = 110,["153"] = 110,["155"] = 102,["156"] = 113,["157"] = 114,["160"] = 115,["161"] = 116,["162"] = 117,["163"] = 118,["165"] = 113,["166"] = 76,["167"] = 75,["168"] = 76,["170"] = 76,["171"] = 123,["172"] = 124,["173"] = 123,["174"] = 124,["175"] = 125,["176"] = 126,["177"] = 125,["178"] = 128,["179"] = 129,["180"] = 128,["181"] = 131,["182"] = 132,["183"] = 131,["184"] = 134,["185"] = 135,["186"] = 134,["187"] = 137,["188"] = 138,["189"] = 138,["190"] = 138,["191"] = 138,["192"] = 138,["193"] = 137,["194"] = 144,["195"] = 145,["196"] = 144,["197"] = 147,["198"] = 148,["199"] = 147,["200"] = 150,["201"] = 151,["202"] = 150,["203"] = 124,["204"] = 123,["205"] = 124,["207"] = 124});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_tidal_lunge"
LinkLuaModifier("modifier_evo_elasmyr_puddle_thinker", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_elasmyr_puddle_buff", SCRIPT_PATH, 0)
____exports.evo_elasmyr_tidal_lunge = __TS__Class()
local evo_elasmyr_tidal_lunge = ____exports.evo_elasmyr_tidal_lunge
evo_elasmyr_tidal_lunge.name = "evo_elasmyr_tidal_lunge"
__TS__ClassExtends(evo_elasmyr_tidal_lunge, BaseAbility)
function evo_elasmyr_tidal_lunge.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local maxDist = self:GetSpecialValueFor("lunge_distance")
    local width = self:GetSpecialValueFor("width")
    local damage = self:GetSpecialValueFor("damage")
    local puddleDuration = self:GetSpecialValueFor("puddle_duration")
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local rawDist = delta:Length2D()
    local dir = rawDist > 1 and delta:Normalized() or caster:GetForwardVector()
    local travel = math.min(
        maxDist,
        math.max(150, rawDist)
    )
    local dest = Vector(origin.x + dir.x * travel, origin.y + dir.y * travel, origin.z)
    local enemies = FindUnitsInLine(
        caster:GetTeamNumber(),
        origin,
        dest,
        nil,
        width,
        2,
        1 + 18,
        0
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue5
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = damage,
                damage_type = 2
            })
        end
        ::__continue5::
    end
    caster:SetForwardVector(dir)
    FindClearSpaceForUnit(caster, dest, true)
    caster:EmitSound("Hero_Slardar.Slithereen_Crush")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
    ParticleManager:SetParticleControl(
        pfx,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(width, width, width)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_elasmyr_puddle_thinker",
        {duration = puddleDuration},
        caster:GetAbsOrigin(),
        caster:GetTeamNumber(),
        false
    )
end
evo_elasmyr_tidal_lunge = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_elasmyr_tidal_lunge")},
    evo_elasmyr_tidal_lunge
)
____exports.evo_elasmyr_tidal_lunge = evo_elasmyr_tidal_lunge
____exports.modifier_evo_elasmyr_puddle_thinker = __TS__Class()
local modifier_evo_elasmyr_puddle_thinker = ____exports.modifier_evo_elasmyr_puddle_thinker
modifier_evo_elasmyr_puddle_thinker.name = "modifier_evo_elasmyr_puddle_thinker"
__TS__ClassExtends(modifier_evo_elasmyr_puddle_thinker, BaseModifier)
function modifier_evo_elasmyr_puddle_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 320
end
function modifier_evo_elasmyr_puddle_thinker.prototype.IsHidden(self)
    return true
end
function modifier_evo_elasmyr_puddle_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_puddle_thinker.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local ability = self:GetAbility()
    self.radius = ability and ability:GetSpecialValueFor("puddle_radius") or 320
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
        ParticleManager:SetParticleControl(
            self.pfx,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            self.pfx,
            1,
            Vector(self.radius, self.radius, self.radius)
        )
    end
    self:StartIntervalThink(0.25)
end
function modifier_evo_elasmyr_puddle_thinker.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not IsValidEntity(caster) or not caster:IsAlive() then
        return
    end
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    local dist = (caster:GetAbsOrigin() - parent:GetAbsOrigin()):Length2D()
    if dist <= self.radius then
        caster:AddNewModifier(
            caster,
            self:GetAbility(),
            "modifier_evo_elasmyr_puddle_buff",
            {duration = 0.6}
        )
    end
end
function modifier_evo_elasmyr_puddle_thinker.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
end
modifier_evo_elasmyr_puddle_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_puddle_thinker")},
    modifier_evo_elasmyr_puddle_thinker
)
____exports.modifier_evo_elasmyr_puddle_thinker = modifier_evo_elasmyr_puddle_thinker
____exports.modifier_evo_elasmyr_puddle_buff = __TS__Class()
local modifier_evo_elasmyr_puddle_buff = ____exports.modifier_evo_elasmyr_puddle_buff
modifier_evo_elasmyr_puddle_buff.name = "modifier_evo_elasmyr_puddle_buff"
__TS__ClassExtends(modifier_evo_elasmyr_puddle_buff, BaseModifier)
function modifier_evo_elasmyr_puddle_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_elasmyr_puddle_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_elasmyr_puddle_buff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_puddle_buff.prototype.GetTexture(self)
    return "slardar_sprint"
end
function modifier_evo_elasmyr_puddle_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")
    }
end
function modifier_evo_elasmyr_puddle_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 30
end
function modifier_evo_elasmyr_puddle_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 35
end
function modifier_evo_elasmyr_puddle_buff.prototype.GetModifierPhysicalArmorBonus(self)
    return 6
end
modifier_evo_elasmyr_puddle_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_puddle_buff")},
    modifier_evo_elasmyr_puddle_buff
)
____exports.modifier_evo_elasmyr_puddle_buff = modifier_evo_elasmyr_puddle_buff
return ____exports
