local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 12,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 19,["28"] = 20,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 21,["37"] = 24,["38"] = 25,["39"] = 24,["40"] = 20,["41"] = 19,["42"] = 20,["44"] = 20,["45"] = 29,["46"] = 30,["47"] = 29,["48"] = 30,["49"] = 31,["50"] = 32,["51"] = 31,["52"] = 34,["53"] = 35,["54"] = 34,["55"] = 37,["56"] = 38,["57"] = 37,["58"] = 40,["59"] = 41,["60"] = 40,["61"] = 43,["62"] = 44,["65"] = 45,["66"] = 46,["67"] = 47,["70"] = 48,["73"] = 49,["74"] = 50,["77"] = 54,["78"] = 55,["79"] = 56,["80"] = 57,["81"] = 60,["82"] = 61,["84"] = 64,["85"] = 65,["86"] = 66,["87"] = 67,["88"] = 67,["89"] = 67,["90"] = 67,["91"] = 67,["92"] = 67,["93"] = 67,["94"] = 67,["95"] = 76,["96"] = 77,["97"] = 78,["98"] = 79,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 80,["103"] = 83,["104"] = 84,["106"] = 86,["107"] = 87,["108"] = 88,["109"] = 89,["110"] = 90,["111"] = 91,["112"] = 92,["117"] = 98,["118"] = 99,["119"] = 100,["120"] = 100,["121"] = 100,["122"] = 100,["123"] = 100,["124"] = 100,["125"] = 100,["126"] = 100,["127"] = 108,["128"] = 109,["131"] = 43,["132"] = 30,["133"] = 29,["134"] = 30,["136"] = 30,["137"] = 115,["138"] = 116,["139"] = 115,["140"] = 116,["141"] = 117,["142"] = 118,["143"] = 117,["144"] = 120,["145"] = 121,["146"] = 120,["147"] = 123,["148"] = 124,["149"] = 123,["150"] = 126,["151"] = 127,["152"] = 126,["153"] = 129,["154"] = 130,["155"] = 129,["156"] = 132,["157"] = 133,["158"] = 134,["159"] = 134,["161"] = 135,["162"] = 136,["163"] = 137,["164"] = 137,["165"] = 137,["166"] = 137,["167"] = 132,["168"] = 116,["169"] = 115,["170"] = 116,["172"] = 116,["173"] = 141,["174"] = 142,["175"] = 141,["176"] = 142,["177"] = 143,["178"] = 144,["179"] = 143,["180"] = 146,["181"] = 147,["182"] = 146,["183"] = 149,["184"] = 150,["185"] = 149,["186"] = 152,["187"] = 153,["188"] = 152,["189"] = 155,["190"] = 156,["191"] = 155,["192"] = 158,["193"] = 159,["194"] = 158,["195"] = 142,["196"] = 141,["197"] = 142,["199"] = 142,["200"] = 163,["201"] = 164,["202"] = 163,["203"] = 164,["204"] = 165,["205"] = 166,["208"] = 167,["209"] = 168,["210"] = 169,["211"] = 170,["212"] = 165,["213"] = 164,["214"] = 163,["215"] = 164,["217"] = 164,["218"] = 174,["219"] = 175,["220"] = 174,["221"] = 175,["222"] = 176,["223"] = 177,["224"] = 176,["225"] = 179,["226"] = 180,["227"] = 179,["228"] = 182,["229"] = 183,["230"] = 182,["231"] = 185,["232"] = 186,["233"] = 185,["234"] = 188,["235"] = 189,["238"] = 190,["239"] = 191,["240"] = 188,["241"] = 193,["242"] = 194,["245"] = 195,["246"] = 193,["247"] = 197,["248"] = 198,["249"] = 199,["250"] = 200,["253"] = 201,["254"] = 202,["255"] = 203,["256"] = 204,["257"] = 206,["258"] = 211,["259"] = 211,["260"] = 211,["261"] = 211,["262"] = 211,["263"] = 212,["264"] = 214,["265"] = 214,["266"] = 214,["267"] = 214,["268"] = 214,["269"] = 214,["270"] = 214,["271"] = 215,["272"] = 215,["273"] = 215,["274"] = 215,["275"] = 215,["276"] = 215,["277"] = 215,["278"] = 222,["279"] = 223,["280"] = 224,["281"] = 225,["282"] = 228,["283"] = 229,["287"] = 197,["288"] = 234,["289"] = 235,["290"] = 234,["291"] = 239,["292"] = 240,["293"] = 240,["294"] = 240,["295"] = 240,["296"] = 239,["297"] = 245,["298"] = 246,["299"] = 247,["300"] = 245,["301"] = 249,["302"] = 250,["303"] = 251,["304"] = 249,["305"] = 175,["306"] = 174,["307"] = 175,["309"] = 175});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getNyxAgi = ____evo_nyx_shared.getNyxAgi
local getNyxBranchMaxLevel = ____evo_nyx_shared.getNyxBranchMaxLevel
local getNyxTier = ____evo_nyx_shared.getNyxTier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis_ult"
LinkLuaModifier("modifier_evo_nyx_mantis_e", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_e_wound", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_e_shred", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_r", SCRIPT_PATH, 0)
____exports.evo_nyx_mantis_e = __TS__Class()
local evo_nyx_mantis_e = ____exports.evo_nyx_mantis_e
evo_nyx_mantis_e.name = "evo_nyx_mantis_e"
__TS__ClassExtends(evo_nyx_mantis_e, BaseAbility)
function evo_nyx_mantis_e.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_mantis_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_mantis_e"
end
evo_nyx_mantis_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_e")},
    evo_nyx_mantis_e
)
____exports.evo_nyx_mantis_e = evo_nyx_mantis_e
____exports.modifier_evo_nyx_mantis_e = __TS__Class()
local modifier_evo_nyx_mantis_e = ____exports.modifier_evo_nyx_mantis_e
modifier_evo_nyx_mantis_e.name = "modifier_evo_nyx_mantis_e"
__TS__ClassExtends(modifier_evo_nyx_mantis_e, BaseModifier)
function modifier_evo_nyx_mantis_e.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_mantis_e.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_e.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_mantis_e.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_nyx_mantis_e.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local woundDur = ability:GetSpecialValueFor("wound_duration")
    local ex = target:FindModifierByName("modifier_evo_nyx_mantis_e_wound")
    local nextStacks = (ex and ex:GetStackCount() or 0) + 1
    local woundMod = target:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_e_wound", {duration = woundDur})
    if woundMod ~= nil then
        woundMod:SetStackCount(nextStacks)
    end
    local dmgPerStack = ability:GetSpecialValueFor("damage_per_stack")
    local mult = (isEvoCreepUnit(nil, target) or target:IsBuilding()) and 0.5 or 1
    local physDmg = nextStacks * dmgPerStack * mult
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ability,
        damage = physDmg,
        damage_type = 1,
        damage_flags = 1024
    })
    local tier = getNyxTier(nil, parent)
    if tier >= 3 and nextStacks >= 4 then
        local shredEx = target:FindModifierByName("modifier_evo_nyx_mantis_e_shred")
        local nextShred = math.min(
            6,
            (shredEx and shredEx:GetStackCount() or 0) + 1
        )
        local shredMod = target:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_e_shred", {duration = 4})
        if shredMod ~= nil then
            shredMod:SetStackCount(nextShred)
        end
        if not parent:HasModifier("modifier_evo_nyx_mantis_q_flurry") then
            local qAb = parent:FindAbilityByName("evo_nyx_mantis_q")
            if qAb and not qAb:IsNull() then
                local rem = qAb:GetCooldownTimeRemaining()
                if rem > 0 then
                    qAb:EndCooldown()
                    qAb:StartCooldown(math.max(0.05, rem - 0.35))
                end
            end
        end
    end
    if tier >= 4 and nextStacks >= 6 and not target:IsBuilding() then
        local pureDmg = 15 + getNyxAgi(nil, parent) * 0.2
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ability,
            damage = pureDmg,
            damage_type = 4,
            damage_flags = 1024
        })
        if not target:IsInvulnerable() then
            parent:Heal(pureDmg * 0.35, ability)
        end
    end
end
modifier_evo_nyx_mantis_e = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_e")},
    modifier_evo_nyx_mantis_e
)
____exports.modifier_evo_nyx_mantis_e = modifier_evo_nyx_mantis_e
____exports.modifier_evo_nyx_mantis_e_wound = __TS__Class()
local modifier_evo_nyx_mantis_e_wound = ____exports.modifier_evo_nyx_mantis_e_wound
modifier_evo_nyx_mantis_e_wound.name = "modifier_evo_nyx_mantis_e_wound"
__TS__ClassExtends(modifier_evo_nyx_mantis_e_wound, BaseModifier)
function modifier_evo_nyx_mantis_e_wound.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_e_wound.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_e_wound.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_e_wound.prototype.GetTexture(self)
    return "bounty_hunter_jinada"
end
function modifier_evo_nyx_mantis_e_wound.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_mantis_e_wound.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    local slowPer = ability:GetSpecialValueFor("slow_per_stack")
    local maxSlow = ability:GetSpecialValueFor("max_slow_stacks")
    return -math.min(
        maxSlow,
        self:GetStackCount()
    ) * slowPer
end
modifier_evo_nyx_mantis_e_wound = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_e_wound")},
    modifier_evo_nyx_mantis_e_wound
)
____exports.modifier_evo_nyx_mantis_e_wound = modifier_evo_nyx_mantis_e_wound
____exports.modifier_evo_nyx_mantis_e_shred = __TS__Class()
local modifier_evo_nyx_mantis_e_shred = ____exports.modifier_evo_nyx_mantis_e_shred
modifier_evo_nyx_mantis_e_shred.name = "modifier_evo_nyx_mantis_e_shred"
__TS__ClassExtends(modifier_evo_nyx_mantis_e_shred, BaseModifier)
function modifier_evo_nyx_mantis_e_shred.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_e_shred.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_e_shred.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_e_shred.prototype.GetTexture(self)
    return "bounty_hunter_jinada"
end
function modifier_evo_nyx_mantis_e_shred.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_nyx_mantis_e_shred.prototype.GetModifierPhysicalArmorBonus(self)
    return -self:GetStackCount()
end
modifier_evo_nyx_mantis_e_shred = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_e_shred")},
    modifier_evo_nyx_mantis_e_shred
)
____exports.modifier_evo_nyx_mantis_e_shred = modifier_evo_nyx_mantis_e_shred
____exports.evo_nyx_mantis_r = __TS__Class()
local evo_nyx_mantis_r = ____exports.evo_nyx_mantis_r
evo_nyx_mantis_r.name = "evo_nyx_mantis_r"
__TS__ClassExtends(evo_nyx_mantis_r, BaseAbility)
function evo_nyx_mantis_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_NyxAssassin.Vendetta")
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_mantis_r", {duration = duration})
end
evo_nyx_mantis_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_r")},
    evo_nyx_mantis_r
)
____exports.evo_nyx_mantis_r = evo_nyx_mantis_r
____exports.modifier_evo_nyx_mantis_r = __TS__Class()
local modifier_evo_nyx_mantis_r = ____exports.modifier_evo_nyx_mantis_r
modifier_evo_nyx_mantis_r.name = "modifier_evo_nyx_mantis_r"
__TS__ClassExtends(modifier_evo_nyx_mantis_r, BaseModifier)
function modifier_evo_nyx_mantis_r.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_r.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_r.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_r.prototype.GetTexture(self)
    return "nyx_assassin_vendetta"
end
function modifier_evo_nyx_mantis_r.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:pulseBlade()
    self:StartIntervalThink(0.5)
end
function modifier_evo_nyx_mantis_r.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    self:pulseBlade()
end
function modifier_evo_nyx_mantis_r.prototype.pulseBlade(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or not ability or ability:IsNull() then
        return
    end
    local radius = ability:GetSpecialValueFor("radius")
    local dmg = ability:GetSpecialValueFor("wave_damage")
    local eAb = parent:FindAbilityByName("evo_nyx_mantis_e")
    local woundDur = eAb and not eAb:IsNull() and eAb:GetSpecialValueFor("wound_duration") or 6
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf", 1, parent)
    ParticleManager:SetParticleControl(
        pfx,
        5,
        Vector(radius, 0, 0)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findEnemiesInRadius(
        nil,
        parent,
        parent:GetAbsOrigin(),
        radius,
        true
    )) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = dmg,
            damage_type = 1
        })
        if eAb and not eAb:IsNull() then
            local ex = enemy:FindModifierByName("modifier_evo_nyx_mantis_e_wound")
            local next = (ex and ex:GetStackCount() or 0) + 1
            local mod = enemy:AddNewModifier(parent, eAb, "modifier_evo_nyx_mantis_e_wound", {duration = woundDur})
            if mod ~= nil then
                mod:SetStackCount(next)
            end
        end
    end
end
function modifier_evo_nyx_mantis_r.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_nyx_mantis_r.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING")
    }
end
function modifier_evo_nyx_mantis_r.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    return ability and not ability:IsNull() and ability:GetSpecialValueFor("bonus_ms_pct") or 35
end
function modifier_evo_nyx_mantis_r.prototype.GetModifierStatusResistanceStacking(self)
    local ability = self:GetAbility()
    return ability and not ability:IsNull() and ability:GetSpecialValueFor("status_res_pct") or 30
end
modifier_evo_nyx_mantis_r = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_r")},
    modifier_evo_nyx_mantis_r
)
____exports.modifier_evo_nyx_mantis_r = modifier_evo_nyx_mantis_r
return ____exports
