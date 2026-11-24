local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 13,["19"] = 20,["20"] = 21,["22"] = 24,["23"] = 25,["24"] = 24,["25"] = 25,["26"] = 26,["27"] = 27,["28"] = 26,["29"] = 25,["30"] = 24,["31"] = 25,["33"] = 25,["34"] = 31,["35"] = 32,["36"] = 31,["37"] = 32,["39"] = 32,["40"] = 33,["41"] = 31,["42"] = 36,["43"] = 37,["44"] = 36,["45"] = 39,["46"] = 40,["47"] = 39,["48"] = 42,["49"] = 43,["50"] = 42,["51"] = 45,["52"] = 46,["53"] = 45,["54"] = 48,["55"] = 49,["56"] = 48,["57"] = 51,["58"] = 52,["61"] = 53,["62"] = 54,["63"] = 55,["66"] = 56,["69"] = 57,["70"] = 58,["73"] = 60,["74"] = 61,["75"] = 62,["76"] = 64,["77"] = 65,["78"] = 66,["79"] = 67,["80"] = 68,["82"] = 70,["83"] = 71,["85"] = 73,["86"] = 74,["87"] = 75,["88"] = 76,["89"] = 76,["90"] = 76,["91"] = 76,["92"] = 76,["93"] = 76,["94"] = 76,["95"] = 83,["96"] = 84,["99"] = 88,["100"] = 89,["101"] = 90,["102"] = 91,["103"] = 92,["104"] = 93,["108"] = 51,["109"] = 32,["110"] = 31,["111"] = 32,["113"] = 32,["114"] = 100,["115"] = 101,["116"] = 100,["117"] = 101,["118"] = 102,["119"] = 103,["120"] = 102,["121"] = 105,["122"] = 106,["123"] = 105,["124"] = 108,["125"] = 109,["126"] = 108,["127"] = 111,["128"] = 112,["129"] = 111,["130"] = 114,["131"] = 115,["132"] = 115,["133"] = 115,["134"] = 115,["135"] = 114,["136"] = 120,["137"] = 121,["138"] = 120,["139"] = 123,["140"] = 124,["141"] = 125,["142"] = 126,["144"] = 128,["145"] = 123,["146"] = 101,["147"] = 100,["148"] = 101,["150"] = 101,["151"] = 132,["152"] = 133,["153"] = 132,["154"] = 133,["155"] = 134,["156"] = 135,["157"] = 134,["158"] = 137,["159"] = 138,["160"] = 137,["161"] = 140,["162"] = 141,["163"] = 140,["164"] = 143,["165"] = 144,["166"] = 143,["167"] = 146,["168"] = 147,["169"] = 147,["170"] = 147,["171"] = 147,["172"] = 147,["173"] = 146,["174"] = 153,["175"] = 154,["176"] = 153,["177"] = 156,["178"] = 157,["179"] = 156,["180"] = 159,["181"] = 160,["182"] = 159,["183"] = 133,["184"] = 132,["185"] = 133,["187"] = 133,["188"] = 164,["189"] = 165,["190"] = 164,["191"] = 165,["192"] = 166,["193"] = 167,["196"] = 168,["197"] = 169,["200"] = 170,["201"] = 171,["202"] = 172,["203"] = 166,["204"] = 165,["205"] = 164,["206"] = 165,["208"] = 165,["209"] = 176,["210"] = 177,["211"] = 176,["212"] = 177,["213"] = 180,["214"] = 181,["215"] = 180,["216"] = 183,["217"] = 184,["218"] = 183,["219"] = 186,["220"] = 187,["221"] = 186,["222"] = 189,["223"] = 190,["224"] = 189,["225"] = 192,["226"] = 193,["229"] = 194,["230"] = 195,["231"] = 196,["233"] = 192,["234"] = 203,["235"] = 204,["238"] = 205,["239"] = 206,["240"] = 207,["241"] = 208,["243"] = 203,["244"] = 211,["245"] = 212,["246"] = 212,["247"] = 212,["248"] = 212,["249"] = 212,["250"] = 211,["251"] = 218,["252"] = 219,["253"] = 219,["254"] = 219,["255"] = 219,["256"] = 219,["257"] = 219,["258"] = 218,["259"] = 226,["260"] = 227,["261"] = 226,["262"] = 229,["263"] = 230,["264"] = 229,["265"] = 232,["266"] = 233,["267"] = 232,["268"] = 235,["269"] = 236,["270"] = 235,["271"] = 177,["272"] = 176,["273"] = 177,["275"] = 177});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_slark_shared = require("abilities.slark.evo_slark_shared")
local grantSlarkAgiEssenceStack = ____evo_slark_shared.grantSlarkAgiEssenceStack
local SCRIPT_PATH = "abilities/slark/evo_slark_agi_er"
local SLARK_AGI_ER_MODS = {"modifier_evo_slark_agi_e_passive", "modifier_evo_slark_agi_essence_buff", "modifier_evo_slark_agi_essence_debuff", "modifier_evo_slark_agi_r_shadow"}
for ____, modName in ipairs(SLARK_AGI_ER_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_slark_agi_e = __TS__Class()
local evo_slark_agi_e = ____exports.evo_slark_agi_e
evo_slark_agi_e.name = "evo_slark_agi_e"
__TS__ClassExtends(evo_slark_agi_e, BaseAbility)
function evo_slark_agi_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_slark_agi_e_passive"
end
evo_slark_agi_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_e")},
    evo_slark_agi_e
)
____exports.evo_slark_agi_e = evo_slark_agi_e
____exports.modifier_evo_slark_agi_e_passive = __TS__Class()
local modifier_evo_slark_agi_e_passive = ____exports.modifier_evo_slark_agi_e_passive
modifier_evo_slark_agi_e_passive.name = "modifier_evo_slark_agi_e_passive"
__TS__ClassExtends(modifier_evo_slark_agi_e_passive, BaseModifier)
function modifier_evo_slark_agi_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitCounter = 0
end
function modifier_evo_slark_agi_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_slark_agi_e_passive.prototype.OnCreated(self)
    self.hitCounter = 0
end
function modifier_evo_slark_agi_e_passive.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_slark_agi_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    local inShadow = parent:HasModifier("modifier_evo_slark_agi_r_shadow")
    local baseStacks = inShadow and 2 or 1
    grantSlarkAgiEssenceStack(nil, parent, target, baseStacks)
    local level = ab:GetLevel()
    if level >= 2 and target:IsHero() then
        local tid = target:entindex()
        if self.lastTargetId == tid then
            self.hitCounter = self.hitCounter + 1
        else
            self.lastTargetId = tid
            self.hitCounter = 1
        end
        if self.hitCounter >= 4 then
            self.hitCounter = 0
            local agi = parent:IsRealHero() and parent:GetAgility() or 0
            ApplyDamage({
                victim = target,
                attacker = parent,
                ability = ab,
                damage = 70 + agi * 0.6,
                damage_type = 1
            })
            grantSlarkAgiEssenceStack(nil, parent, target, 1)
            target:EmitSound("Hero_Slark.EssenceShift")
        end
    end
    if level >= 3 then
        local buff = parent:FindModifierByName("modifier_evo_slark_agi_essence_buff")
        if buff and buff:GetStackCount() >= 10 then
            local heal = event.damage * 0.15
            if heal > 0 then
                parent:Heal(heal, ab)
            end
        end
    end
end
modifier_evo_slark_agi_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_e_passive")},
    modifier_evo_slark_agi_e_passive
)
____exports.modifier_evo_slark_agi_e_passive = modifier_evo_slark_agi_e_passive
____exports.modifier_evo_slark_agi_essence_buff = __TS__Class()
local modifier_evo_slark_agi_essence_buff = ____exports.modifier_evo_slark_agi_essence_buff
modifier_evo_slark_agi_essence_buff.name = "modifier_evo_slark_agi_essence_buff"
__TS__ClassExtends(modifier_evo_slark_agi_essence_buff, BaseModifier)
function modifier_evo_slark_agi_essence_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_agi_essence_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")
    }
end
function modifier_evo_slark_agi_essence_buff.prototype.GetModifierBonusStats_Agility(self)
    return self:GetStackCount()
end
function modifier_evo_slark_agi_essence_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ab = self:GetAbility()
    if ab and ab:GetLevel() >= 3 and self:GetStackCount() >= 10 then
        return 10
    end
    return 0
end
modifier_evo_slark_agi_essence_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_essence_buff")},
    modifier_evo_slark_agi_essence_buff
)
____exports.modifier_evo_slark_agi_essence_buff = modifier_evo_slark_agi_essence_buff
____exports.modifier_evo_slark_agi_essence_debuff = __TS__Class()
local modifier_evo_slark_agi_essence_debuff = ____exports.modifier_evo_slark_agi_essence_debuff
modifier_evo_slark_agi_essence_debuff.name = "modifier_evo_slark_agi_essence_debuff"
__TS__ClassExtends(modifier_evo_slark_agi_essence_debuff, BaseModifier)
function modifier_evo_slark_agi_essence_debuff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_essence_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_agi_essence_debuff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_agi_essence_debuff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Strength(self)
    return -self:GetStackCount()
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Agility(self)
    return -self:GetStackCount()
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Intellect(self)
    return -self:GetStackCount()
end
modifier_evo_slark_agi_essence_debuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_essence_debuff")},
    modifier_evo_slark_agi_essence_debuff
)
____exports.modifier_evo_slark_agi_essence_debuff = modifier_evo_slark_agi_essence_debuff
____exports.evo_slark_agi_r = __TS__Class()
local evo_slark_agi_r = ____exports.evo_slark_agi_r
evo_slark_agi_r.name = "evo_slark_agi_r"
__TS__ClassExtends(evo_slark_agi_r, BaseAbility)
function evo_slark_agi_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Slark.ShadowDance")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_r_shadow", {duration = dur})
end
evo_slark_agi_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_r")},
    evo_slark_agi_r
)
____exports.evo_slark_agi_r = evo_slark_agi_r
____exports.modifier_evo_slark_agi_r_shadow = __TS__Class()
local modifier_evo_slark_agi_r_shadow = ____exports.modifier_evo_slark_agi_r_shadow
modifier_evo_slark_agi_r_shadow.name = "modifier_evo_slark_agi_r_shadow"
__TS__ClassExtends(modifier_evo_slark_agi_r_shadow, BaseModifier)
function modifier_evo_slark_agi_r_shadow.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.GetTexture(self)
    return "slark_shadow_dance"
end
function modifier_evo_slark_agi_r_shadow.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slark/slark_shadow_dance.vpcf", 1, parent)
    end
end
function modifier_evo_slark_agi_r_shadow.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
end
function modifier_evo_slark_agi_r_shadow.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_INVISIBLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_TRUESIGHT_IMMUNE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_UNTARGETABLE_ENEMY")] = true
    }
end
function modifier_evo_slark_agi_r_shadow.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierInvisibilityLevel(self)
    return 2
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 30
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierHealthRegenPercentage(self)
    return 5
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 50
end
modifier_evo_slark_agi_r_shadow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_r_shadow")},
    modifier_evo_slark_agi_r_shadow
)
____exports.modifier_evo_slark_agi_r_shadow = modifier_evo_slark_agi_r_shadow
return ____exports
