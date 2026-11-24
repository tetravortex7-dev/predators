local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["19"] = 10,["20"] = 11,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 13,["27"] = 14,["28"] = 15,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 20,["35"] = 21,["36"] = 22,["37"] = 24,["38"] = 25,["39"] = 26,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 28,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 30,["50"] = 30,["51"] = 30,["52"] = 30,["53"] = 30,["54"] = 30,["55"] = 41,["57"] = 42,["58"] = 42,["60"] = 43,["61"] = 43,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["70"] = 52,["71"] = 53,["72"] = 54,["73"] = 56,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 61,["79"] = 62,["80"] = 62,["81"] = 62,["82"] = 62,["83"] = 62,["84"] = 63,["85"] = 65,["86"] = 65,["87"] = 65,["88"] = 65,["89"] = 65,["90"] = 65,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 12,["95"] = 11,["96"] = 10,["97"] = 11,["99"] = 11,["100"] = 77,["101"] = 78,["102"] = 77,["103"] = 78,["105"] = 78,["106"] = 79,["107"] = 77,["108"] = 82,["109"] = 83,["110"] = 82,["111"] = 85,["112"] = 86,["113"] = 85,["114"] = 88,["115"] = 89,["118"] = 90,["119"] = 91,["120"] = 92,["121"] = 93,["122"] = 94,["123"] = 99,["124"] = 99,["125"] = 99,["126"] = 99,["127"] = 99,["128"] = 100,["129"] = 100,["130"] = 100,["131"] = 100,["132"] = 100,["134"] = 102,["135"] = 88,["136"] = 104,["137"] = 105,["140"] = 106,["141"] = 107,["142"] = 108,["145"] = 109,["148"] = 110,["149"] = 111,["150"] = 112,["151"] = 112,["152"] = 112,["153"] = 112,["154"] = 112,["155"] = 112,["157"] = 104,["158"] = 115,["159"] = 116,["162"] = 117,["163"] = 118,["164"] = 119,["165"] = 120,["167"] = 115,["168"] = 78,["169"] = 77,["170"] = 78,["172"] = 78,["173"] = 125,["174"] = 126,["175"] = 125,["176"] = 126,["177"] = 127,["178"] = 128,["179"] = 127,["180"] = 130,["181"] = 131,["182"] = 130,["183"] = 133,["184"] = 134,["185"] = 133,["186"] = 136,["187"] = 137,["188"] = 136,["189"] = 139,["190"] = 140,["191"] = 140,["192"] = 140,["193"] = 140,["194"] = 140,["195"] = 139,["196"] = 146,["197"] = 147,["198"] = 146,["199"] = 149,["200"] = 150,["201"] = 149,["202"] = 152,["203"] = 153,["204"] = 152,["205"] = 126,["206"] = 125,["207"] = 126,["209"] = 126});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_tidal_lunge"
if IsServer() then
    LinkLuaModifier("modifier_evo_elasmyr_puddle_thinker", SCRIPT_PATH, 0)
    LinkLuaModifier("modifier_evo_elasmyr_puddle_buff", SCRIPT_PATH, 0)
end
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
                goto __continue6
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = damage,
                damage_type = 2
            })
        end
        ::__continue6::
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
