local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 10,["16"] = 12,["17"] = 18,["18"] = 19,["20"] = 22,["21"] = 23,["22"] = 22,["23"] = 23,["24"] = 24,["25"] = 25,["26"] = 24,["27"] = 27,["28"] = 28,["31"] = 29,["32"] = 30,["35"] = 31,["36"] = 32,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["45"] = 35,["46"] = 36,["47"] = 27,["48"] = 23,["49"] = 22,["50"] = 23,["52"] = 23,["53"] = 40,["54"] = 41,["55"] = 40,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 42,["60"] = 45,["61"] = 46,["62"] = 45,["63"] = 48,["64"] = 49,["65"] = 48,["66"] = 51,["67"] = 52,["68"] = 51,["69"] = 54,["70"] = 55,["71"] = 56,["72"] = 57,["74"] = 59,["75"] = 54,["76"] = 61,["77"] = 62,["78"] = 62,["79"] = 62,["80"] = 62,["81"] = 62,["82"] = 61,["83"] = 68,["84"] = 69,["85"] = 68,["86"] = 71,["87"] = 72,["88"] = 71,["89"] = 74,["90"] = 75,["91"] = 76,["92"] = 74,["93"] = 41,["94"] = 40,["95"] = 41,["97"] = 41,["98"] = 80,["99"] = 81,["100"] = 80,["101"] = 81,["102"] = 82,["103"] = 83,["104"] = 82,["105"] = 85,["106"] = 86,["107"] = 85,["108"] = 88,["109"] = 89,["110"] = 88,["111"] = 91,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 92,["116"] = 91,["117"] = 97,["118"] = 98,["119"] = 99,["120"] = 97,["121"] = 101,["122"] = 102,["123"] = 101,["124"] = 104,["125"] = 105,["126"] = 104,["127"] = 81,["128"] = 80,["129"] = 81,["131"] = 81,["132"] = 109,["133"] = 110,["134"] = 109,["135"] = 110,["136"] = 111,["137"] = 112,["140"] = 113,["141"] = 114,["144"] = 115,["145"] = 116,["146"] = 117,["147"] = 118,["148"] = 118,["149"] = 118,["150"] = 118,["151"] = 118,["152"] = 118,["153"] = 118,["154"] = 118,["155"] = 118,["156"] = 111,["157"] = 110,["158"] = 109,["159"] = 110,["161"] = 110,["162"] = 130,["163"] = 131,["164"] = 130,["165"] = 131,["167"] = 131,["168"] = 132,["169"] = 130,["170"] = 134,["171"] = 135,["172"] = 134,["173"] = 137,["174"] = 138,["175"] = 137,["176"] = 140,["177"] = 141,["180"] = 142,["181"] = 143,["182"] = 144,["183"] = 145,["184"] = 146,["185"] = 151,["186"] = 151,["187"] = 151,["188"] = 151,["189"] = 151,["190"] = 152,["191"] = 152,["192"] = 152,["193"] = 152,["194"] = 152,["195"] = 153,["197"] = 155,["198"] = 140,["199"] = 157,["200"] = 158,["203"] = 159,["204"] = 160,["205"] = 161,["208"] = 162,["209"] = 164,["210"] = 165,["211"] = 166,["212"] = 167,["213"] = 168,["214"] = 169,["215"] = 170,["216"] = 171,["217"] = 172,["222"] = 178,["223"] = 178,["224"] = 178,["225"] = 178,["226"] = 178,["227"] = 178,["228"] = 178,["229"] = 178,["230"] = 178,["231"] = 178,["232"] = 178,["233"] = 189,["235"] = 190,["236"] = 190,["238"] = 191,["239"] = 191,["240"] = 191,["241"] = 191,["242"] = 191,["243"] = 191,["247"] = 157,["248"] = 131,["249"] = 130,["250"] = 131,["252"] = 131});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_water_er"
local WATER_ER_MODS = {"modifier_evo_morph_water_e_buff", "modifier_evo_morph_water_e_passive", "modifier_evo_morph_water_r_thinker"}
for ____, modName in ipairs(WATER_ER_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_morph_water_e = __TS__Class()
local evo_morph_water_e = ____exports.evo_morph_water_e
evo_morph_water_e.name = "evo_morph_water_e"
__TS__ClassExtends(evo_morph_water_e, BaseAbility)
function evo_morph_water_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_morph_water_e_passive"
end
function evo_morph_water_e.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    if self:GetLevel() >= 2 then
        caster:Purge(
            false,
            true,
            false,
            false,
            false
        )
    end
    caster:EmitSound("Hero_Morphling.MorphAgi")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_water_e_buff", {duration = dur})
end
evo_morph_water_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_e")},
    evo_morph_water_e
)
____exports.evo_morph_water_e = evo_morph_water_e
____exports.modifier_evo_morph_water_e_buff = __TS__Class()
local modifier_evo_morph_water_e_buff = ____exports.modifier_evo_morph_water_e_buff
modifier_evo_morph_water_e_buff.name = "modifier_evo_morph_water_e_buff"
__TS__ClassExtends(modifier_evo_morph_water_e_buff, BaseModifier)
function modifier_evo_morph_water_e_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_e_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_morph_water_e_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_e_buff.prototype.GetTexture(self)
    return "morphling_morph_str"
end
function modifier_evo_morph_water_e_buff.prototype.CheckState(self)
    local ab = self:GetAbility()
    if ab and ab:GetLevel() >= 2 then
        return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
    end
    return {}
end
function modifier_evo_morph_water_e_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EVASION_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING")
    }
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 18
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierEvasion_Constant(self)
    return 25
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierStatusResistanceStacking(self)
    local ab = self:GetAbility()
    return ab and ab:GetLevel() >= 3 and 25 or 0
end
modifier_evo_morph_water_e_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_e_buff")},
    modifier_evo_morph_water_e_buff
)
____exports.modifier_evo_morph_water_e_buff = modifier_evo_morph_water_e_buff
____exports.modifier_evo_morph_water_e_passive = __TS__Class()
local modifier_evo_morph_water_e_passive = ____exports.modifier_evo_morph_water_e_passive
modifier_evo_morph_water_e_passive.name = "modifier_evo_morph_water_e_passive"
__TS__ClassExtends(modifier_evo_morph_water_e_passive, BaseModifier)
function modifier_evo_morph_water_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_morph_water_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")
    }
end
function modifier_evo_morph_water_e_passive.prototype.isOnCooldownT4(self)
    local ab = self:GetAbility()
    return ab ~= nil and not ab:IsNull() and ab:GetLevel() >= 3 and not ab:IsCooldownReady()
end
function modifier_evo_morph_water_e_passive.prototype.GetModifierPhysicalArmorBonus(self)
    return self:isOnCooldownT4() and 6 or 0
end
function modifier_evo_morph_water_e_passive.prototype.GetModifierConstantHealthRegen(self)
    return self:isOnCooldownT4() and 5 or 0
end
modifier_evo_morph_water_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_e_passive")},
    modifier_evo_morph_water_e_passive
)
____exports.modifier_evo_morph_water_e_passive = modifier_evo_morph_water_e_passive
____exports.evo_morph_water_r = __TS__Class()
local evo_morph_water_r = ____exports.evo_morph_water_r
evo_morph_water_r.name = "evo_morph_water_r"
__TS__ClassExtends(evo_morph_water_r, BaseAbility)
function evo_morph_water_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Slardar.Amplify_Damage")
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_morph_water_r_thinker",
        {duration = dur},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_morph_water_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_r")},
    evo_morph_water_r
)
____exports.evo_morph_water_r = evo_morph_water_r
____exports.modifier_evo_morph_water_r_thinker = __TS__Class()
local modifier_evo_morph_water_r_thinker = ____exports.modifier_evo_morph_water_r_thinker
modifier_evo_morph_water_r_thinker.name = "modifier_evo_morph_water_r_thinker"
__TS__ClassExtends(modifier_evo_morph_water_r_thinker, BaseModifier)
function modifier_evo_morph_water_r_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 500
end
function modifier_evo_morph_water_r_thinker.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_r_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_r_thinker.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local ab = self:GetAbility()
    self.radius = ab and ab:GetSpecialValueFor("radius") or 500
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
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
    self:StartIntervalThink(0.5)
end
function modifier_evo_morph_water_r_thinker.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not parent or parent:IsNull() then
        return
    end
    local origin = parent:GetAbsOrigin()
    if caster:IsAlive() then
        local dist = (caster:GetAbsOrigin() - origin):Length2D()
        if dist <= self.radius then
            local q = caster:FindAbilityByName("evo_morph_water_q")
            if q and not q:IsNull() then
                local rem = q:GetCooldownTimeRemaining()
                if rem > 0.3 then
                    q:EndCooldown()
                    q:StartCooldown(math.max(0.05, rem - 0.25))
                end
            end
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
                goto __continue41
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1}
            )
        end
        ::__continue41::
    end
end
modifier_evo_morph_water_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_r_thinker")},
    modifier_evo_morph_water_r_thinker
)
____exports.modifier_evo_morph_water_r_thinker = modifier_evo_morph_water_r_thinker
return ____exports
