local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["26"] = 13,["27"] = 14,["30"] = 16,["31"] = 17,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 19,["41"] = 11,["42"] = 10,["43"] = 9,["44"] = 10,["46"] = 10,["47"] = 31,["48"] = 32,["49"] = 31,["50"] = 32,["52"] = 32,["53"] = 33,["54"] = 34,["55"] = 35,["56"] = 31,["57"] = 37,["58"] = 38,["59"] = 37,["60"] = 40,["61"] = 41,["62"] = 40,["63"] = 43,["64"] = 44,["67"] = 45,["68"] = 46,["69"] = 47,["70"] = 48,["71"] = 49,["72"] = 50,["73"] = 43,["74"] = 52,["75"] = 53,["78"] = 54,["79"] = 55,["80"] = 56,["83"] = 57,["86"] = 59,["87"] = 60,["88"] = 61,["90"] = 64,["91"] = 65,["92"] = 66,["93"] = 67,["94"] = 68,["95"] = 68,["96"] = 68,["97"] = 68,["98"] = 68,["99"] = 68,["102"] = 74,["103"] = 74,["104"] = 74,["105"] = 74,["106"] = 74,["107"] = 74,["108"] = 74,["109"] = 74,["110"] = 74,["111"] = 74,["112"] = 74,["113"] = 86,["115"] = 87,["116"] = 87,["118"] = 88,["119"] = 88,["120"] = 88,["121"] = 88,["122"] = 88,["123"] = 88,["124"] = 88,["125"] = 95,["126"] = 95,["127"] = 95,["128"] = 95,["129"] = 95,["130"] = 95,["134"] = 52,["135"] = 100,["136"] = 101,["137"] = 102,["140"] = 103,["141"] = 108,["142"] = 108,["143"] = 108,["144"] = 108,["145"] = 108,["146"] = 109,["147"] = 109,["148"] = 109,["149"] = 109,["150"] = 109,["151"] = 110,["152"] = 100,["153"] = 32,["154"] = 31,["155"] = 32,["157"] = 32,["158"] = 114,["159"] = 115,["160"] = 114,["161"] = 115,["162"] = 116,["163"] = 117,["164"] = 116,["165"] = 119,["166"] = 120,["167"] = 119,["168"] = 122,["169"] = 123,["170"] = 122,["171"] = 125,["172"] = 126,["173"] = 125,["174"] = 128,["175"] = 129,["176"] = 129,["177"] = 129,["178"] = 129,["179"] = 129,["180"] = 128,["181"] = 135,["182"] = 136,["183"] = 135,["184"] = 138,["185"] = 139,["186"] = 138,["187"] = 141,["188"] = 142,["189"] = 141,["190"] = 115,["191"] = 114,["192"] = 115,["194"] = 115,["195"] = 146,["196"] = 147,["197"] = 146,["198"] = 147,["199"] = 148,["200"] = 149,["201"] = 148,["202"] = 151,["203"] = 152,["204"] = 151,["205"] = 154,["206"] = 155,["207"] = 154,["208"] = 157,["209"] = 158,["210"] = 157,["211"] = 160,["212"] = 161,["213"] = 160,["214"] = 163,["215"] = 164,["216"] = 163,["217"] = 147,["218"] = 146,["219"] = 147,["221"] = 147});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_abyssal_flood"
LinkLuaModifier("modifier_evo_elasmyr_flood_thinker", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_elasmyr_flood_buff", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_elasmyr_flood_debuff", SCRIPT_PATH, 0)
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
                goto __continue16
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
        ::__continue16::
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
