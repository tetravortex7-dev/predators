local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["20"] = 11,["21"] = 12,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["28"] = 15,["29"] = 16,["32"] = 18,["33"] = 19,["34"] = 21,["35"] = 21,["36"] = 21,["37"] = 21,["38"] = 21,["39"] = 21,["40"] = 21,["41"] = 21,["42"] = 21,["43"] = 13,["44"] = 12,["45"] = 11,["46"] = 12,["48"] = 12,["49"] = 33,["50"] = 34,["51"] = 33,["52"] = 34,["54"] = 34,["55"] = 35,["56"] = 36,["57"] = 37,["58"] = 33,["59"] = 39,["60"] = 40,["61"] = 39,["62"] = 42,["63"] = 43,["64"] = 42,["65"] = 45,["66"] = 46,["69"] = 47,["70"] = 48,["71"] = 49,["72"] = 50,["73"] = 51,["74"] = 52,["75"] = 45,["76"] = 54,["77"] = 55,["80"] = 56,["81"] = 57,["82"] = 58,["85"] = 59,["88"] = 61,["89"] = 62,["90"] = 63,["92"] = 66,["93"] = 67,["94"] = 68,["95"] = 69,["96"] = 70,["97"] = 70,["98"] = 70,["99"] = 70,["100"] = 70,["101"] = 70,["104"] = 76,["105"] = 76,["106"] = 76,["107"] = 76,["108"] = 76,["109"] = 76,["110"] = 76,["111"] = 76,["112"] = 76,["113"] = 76,["114"] = 76,["115"] = 88,["117"] = 89,["118"] = 89,["120"] = 90,["121"] = 90,["122"] = 90,["123"] = 90,["124"] = 90,["125"] = 90,["126"] = 90,["127"] = 97,["128"] = 97,["129"] = 97,["130"] = 97,["131"] = 97,["132"] = 97,["136"] = 54,["137"] = 102,["138"] = 103,["139"] = 104,["142"] = 105,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 110,["147"] = 110,["148"] = 111,["149"] = 111,["150"] = 111,["151"] = 111,["152"] = 111,["153"] = 112,["154"] = 102,["155"] = 34,["156"] = 33,["157"] = 34,["159"] = 34,["160"] = 116,["161"] = 117,["162"] = 116,["163"] = 117,["164"] = 118,["165"] = 119,["166"] = 118,["167"] = 121,["168"] = 122,["169"] = 121,["170"] = 124,["171"] = 125,["172"] = 124,["173"] = 127,["174"] = 128,["175"] = 127,["176"] = 130,["177"] = 131,["178"] = 131,["179"] = 131,["180"] = 131,["181"] = 131,["182"] = 130,["183"] = 137,["184"] = 138,["185"] = 137,["186"] = 140,["187"] = 141,["188"] = 140,["189"] = 143,["190"] = 144,["191"] = 143,["192"] = 117,["193"] = 116,["194"] = 117,["196"] = 117,["197"] = 148,["198"] = 149,["199"] = 148,["200"] = 149,["201"] = 150,["202"] = 151,["203"] = 150,["204"] = 153,["205"] = 154,["206"] = 153,["207"] = 156,["208"] = 157,["209"] = 156,["210"] = 159,["211"] = 160,["212"] = 159,["213"] = 162,["214"] = 163,["215"] = 162,["216"] = 165,["217"] = 166,["218"] = 165,["219"] = 149,["220"] = 148,["221"] = 149,["223"] = 149});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_abyssal_flood"
if IsServer() then
    LinkLuaModifier("modifier_evo_elasmyr_flood_thinker", SCRIPT_PATH, 0)
    LinkLuaModifier("modifier_evo_elasmyr_flood_buff", SCRIPT_PATH, 0)
    LinkLuaModifier("modifier_evo_elasmyr_flood_debuff", SCRIPT_PATH, 0)
end
____exports.evo_elasmyr_abyssal_flood = __TS__Class()
local evo_elasmyr_abyssal_flood = ____exports.evo_elasmyr_abyssal_flood
evo_elasmyr_abyssal_flood.name = "evo_elasmyr_abyssal_flood"
__TS__ClassExtends(evo_elasmyr_abyssal_flood, BaseAbility)
function evo_elasmyr_abyssal_flood.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local duration = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Slardar.Amplify_Damage")
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_elasmyr_flood_thinker",
        {duration = duration},
        caster:GetAbsOrigin(),
        caster:GetTeamNumber(),
        false
    )
end
evo_elasmyr_abyssal_flood = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_elasmyr_abyssal_flood")},
    evo_elasmyr_abyssal_flood
)
____exports.evo_elasmyr_abyssal_flood = evo_elasmyr_abyssal_flood
____exports.modifier_evo_elasmyr_flood_thinker = __TS__Class()
local modifier_evo_elasmyr_flood_thinker = ____exports.modifier_evo_elasmyr_flood_thinker
modifier_evo_elasmyr_flood_thinker.name = "modifier_evo_elasmyr_flood_thinker"
__TS__ClassExtends(modifier_evo_elasmyr_flood_thinker, BaseModifier)
function modifier_evo_elasmyr_flood_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 600
    self.dps = 45
    self.tickCount = 0
end
function modifier_evo_elasmyr_flood_thinker.prototype.IsHidden(self)
    return true
end
function modifier_evo_elasmyr_flood_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_flood_thinker.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.tickCount = 0
    local ability = self:GetAbility()
    self.radius = ability and ability:GetSpecialValueFor("radius") or 600
    self.dps = ability and ability:GetSpecialValueFor("dps") or 45
    self:emitRipple()
    self:StartIntervalThink(1)
end
function modifier_evo_elasmyr_flood_thinker.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    self.tickCount = self.tickCount + 1
    if self.tickCount % 2 == 0 then
        self:emitRipple()
    end
    local origin = parent:GetAbsOrigin()
    if caster:IsAlive() then
        local dist = (caster:GetAbsOrigin() - origin):Length2D()
        if dist <= self.radius then
            caster:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_elasmyr_flood_buff",
                {duration = 1.5}
            )
        end
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        self.radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue17
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self:GetAbility(),
                damage = self.dps,
                damage_type = 2
            })
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_elasmyr_flood_debuff",
                {duration = 1.5}
            )
        end
        ::__continue17::
    end
end
function modifier_evo_elasmyr_flood_thinker.prototype.emitRipple(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return
    end
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
    ParticleManager:SetParticleControl(
        pfx,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(self.radius, self.radius, self.radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
end
modifier_evo_elasmyr_flood_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_flood_thinker")},
    modifier_evo_elasmyr_flood_thinker
)
____exports.modifier_evo_elasmyr_flood_thinker = modifier_evo_elasmyr_flood_thinker
____exports.modifier_evo_elasmyr_flood_buff = __TS__Class()
local modifier_evo_elasmyr_flood_buff = ____exports.modifier_evo_elasmyr_flood_buff
modifier_evo_elasmyr_flood_buff.name = "modifier_evo_elasmyr_flood_buff"
__TS__ClassExtends(modifier_evo_elasmyr_flood_buff, BaseModifier)
function modifier_evo_elasmyr_flood_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_elasmyr_flood_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_elasmyr_flood_buff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_flood_buff.prototype.GetTexture(self)
    return "slardar_amplify_damage"
end
function modifier_evo_elasmyr_flood_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")
    }
end
function modifier_evo_elasmyr_flood_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 40
end
function modifier_evo_elasmyr_flood_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 55
end
function modifier_evo_elasmyr_flood_buff.prototype.GetModifierPhysicalArmorBonus(self)
    return 10
end
modifier_evo_elasmyr_flood_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_flood_buff")},
    modifier_evo_elasmyr_flood_buff
)
____exports.modifier_evo_elasmyr_flood_buff = modifier_evo_elasmyr_flood_buff
____exports.modifier_evo_elasmyr_flood_debuff = __TS__Class()
local modifier_evo_elasmyr_flood_debuff = ____exports.modifier_evo_elasmyr_flood_debuff
modifier_evo_elasmyr_flood_debuff.name = "modifier_evo_elasmyr_flood_debuff"
__TS__ClassExtends(modifier_evo_elasmyr_flood_debuff, BaseModifier)
function modifier_evo_elasmyr_flood_debuff.prototype.IsHidden(self)
    return false
end
function modifier_evo_elasmyr_flood_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_evo_elasmyr_flood_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_elasmyr_flood_debuff.prototype.GetTexture(self)
    return "slardar_amplify_damage"
end
function modifier_evo_elasmyr_flood_debuff.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_elasmyr_flood_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_elasmyr_flood_debuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_flood_debuff")},
    modifier_evo_elasmyr_flood_debuff
)
____exports.modifier_evo_elasmyr_flood_debuff = modifier_evo_elasmyr_flood_debuff
return ____exports
