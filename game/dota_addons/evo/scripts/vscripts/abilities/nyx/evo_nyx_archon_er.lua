local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 9,["18"] = 11,["19"] = 13,["20"] = 14,["21"] = 16,["22"] = 17,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 19,["27"] = 18,["28"] = 21,["29"] = 22,["32"] = 23,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 25,["38"] = 27,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 21,["49"] = 17,["50"] = 16,["51"] = 17,["53"] = 17,["54"] = 40,["55"] = 41,["56"] = 40,["57"] = 41,["59"] = 41,["60"] = 42,["61"] = 43,["62"] = 40,["63"] = 45,["64"] = 46,["65"] = 45,["66"] = 48,["67"] = 49,["68"] = 48,["69"] = 51,["70"] = 52,["71"] = 51,["72"] = 54,["73"] = 55,["74"] = 54,["75"] = 57,["76"] = 58,["77"] = 57,["78"] = 60,["79"] = 61,["80"] = 60,["81"] = 63,["82"] = 64,["83"] = 63,["84"] = 66,["85"] = 67,["86"] = 68,["87"] = 69,["88"] = 70,["89"] = 71,["91"] = 73,["94"] = 74,["95"] = 74,["96"] = 74,["97"] = 74,["98"] = 74,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 79,["104"] = 79,["105"] = 79,["106"] = 79,["107"] = 80,["108"] = 66,["109"] = 82,["110"] = 83,["113"] = 84,["114"] = 85,["115"] = 86,["116"] = 87,["119"] = 88,["120"] = 90,["122"] = 91,["123"] = 91,["125"] = 92,["126"] = 93,["127"] = 94,["128"] = 95,["129"] = 95,["130"] = 95,["131"] = 95,["132"] = 96,["137"] = 100,["138"] = 101,["139"] = 102,["140"] = 103,["141"] = 104,["142"] = 105,["143"] = 106,["144"] = 106,["145"] = 106,["146"] = 106,["147"] = 106,["148"] = 106,["149"] = 106,["150"] = 107,["151"] = 108,["154"] = 111,["155"] = 112,["156"] = 113,["157"] = 114,["158"] = 115,["159"] = 116,["160"] = 117,["161"] = 117,["162"] = 117,["163"] = 117,["164"] = 118,["165"] = 119,["166"] = 120,["171"] = 82,["172"] = 126,["173"] = 127,["176"] = 128,["177"] = 126,["178"] = 130,["179"] = 131,["180"] = 130,["181"] = 133,["182"] = 134,["185"] = 135,["186"] = 136,["187"] = 137,["188"] = 138,["191"] = 139,["192"] = 140,["193"] = 141,["196"] = 142,["197"] = 142,["198"] = 142,["199"] = 142,["200"] = 143,["203"] = 145,["204"] = 146,["205"] = 148,["208"] = 150,["209"] = 151,["210"] = 152,["211"] = 157,["212"] = 158,["213"] = 160,["214"] = 161,["215"] = 161,["216"] = 161,["217"] = 161,["218"] = 161,["219"] = 161,["220"] = 161,["222"] = 133,["223"] = 41,["224"] = 40,["225"] = 41,["227"] = 41,["228"] = 172,["229"] = 173,["230"] = 172,["231"] = 173,["232"] = 174,["233"] = 175,["234"] = 174,["235"] = 177,["236"] = 178,["237"] = 177,["238"] = 180,["239"] = 181,["240"] = 180,["241"] = 183,["242"] = 184,["243"] = 183,["244"] = 186,["245"] = 187,["246"] = 186,["247"] = 191,["248"] = 192,["249"] = 191,["250"] = 194,["251"] = 195,["252"] = 196,["253"] = 194,["254"] = 173,["255"] = 172,["256"] = 173,["258"] = 173});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local applyPsiResonance = ____evo_nyx_shared.applyPsiResonance
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local SCRIPT_PATH = "abilities/nyx/evo_nyx_archon_er"
LinkLuaModifier("modifier_evo_nyx_archon_r_crystal", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_r_tether", SCRIPT_PATH, 0)
____exports.evo_nyx_archon_r = __TS__Class()
local evo_nyx_archon_r = ____exports.evo_nyx_archon_r
evo_nyx_archon_r.name = "evo_nyx_archon_r"
__TS__ClassExtends(evo_nyx_archon_r, BaseAbility)
function evo_nyx_archon_r.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function evo_nyx_archon_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local pos = GetGroundPosition(
        self:GetCursorPosition(),
        caster
    )
    local duration = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_ObsidianDestroyer.SanityEclipse")
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_nyx_archon_r_crystal",
        {duration = duration},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_nyx_archon_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_r")},
    evo_nyx_archon_r
)
____exports.evo_nyx_archon_r = evo_nyx_archon_r
____exports.modifier_evo_nyx_archon_r_crystal = __TS__Class()
local modifier_evo_nyx_archon_r_crystal = ____exports.modifier_evo_nyx_archon_r_crystal
modifier_evo_nyx_archon_r_crystal.name = "modifier_evo_nyx_archon_r_crystal"
__TS__ClassExtends(modifier_evo_nyx_archon_r_crystal, BaseModifier)
function modifier_evo_nyx_archon_r_crystal.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 475
    self.pulseAccum = 0
end
function modifier_evo_nyx_archon_r_crystal.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_archon_r_crystal.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_archon_r_crystal.prototype.IsAura(self)
    return true
end
function modifier_evo_nyx_archon_r_crystal.prototype.GetModifierAura(self)
    return "modifier_evo_nyx_archon_r_tether"
end
function modifier_evo_nyx_archon_r_crystal.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_evo_nyx_archon_r_crystal.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_nyx_archon_r_crystal.prototype.GetAuraSearchType(self)
    return 1 + 18
end
function modifier_evo_nyx_archon_r_crystal.prototype.OnCreated(self)
    self.radius = 475
    self.pulseAccum = 0
    local ability = self:GetAbility()
    if ability and not ability:IsNull() then
        self.radius = ability:GetSpecialValueFor("radius")
    end
    if not IsServer() then
        return
    end
    local pfx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_pugna/pugna_nether_ward.vpcf",
        1,
        self:GetParent()
    )
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
    self:StartIntervalThink(0.1)
end
function modifier_evo_nyx_archon_r_crystal.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local crystal = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if not crystal or crystal:IsNull() or not caster or caster:IsNull() or not ability or ability:IsNull() then
        return
    end
    local center = crystal:GetAbsOrigin()
    for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, center, self.radius + 140)) do
        do
            if not enemy:HasModifier("modifier_evo_nyx_archon_r_tether") then
                goto __continue18
            end
            local delta = enemy:GetAbsOrigin() - center
            local dist = delta:Length2D()
            if dist > self.radius - 15 then
                local clamped = GetGroundPosition(
                    center + delta:Normalized() * (self.radius - 20),
                    enemy
                )
                FindClearSpaceForUnit(enemy, clamped, false)
            end
        end
        ::__continue18::
    end
    self.pulseAccum = self.pulseAccum + 0.1
    local pulseInterval = ability:GetSpecialValueFor("pulse_interval")
    if self.pulseAccum >= pulseInterval then
        self.pulseAccum = self.pulseAccum - pulseInterval
        local heroesHit = 0
        for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, center, self.radius)) do
            applyPsiResonance(
                nil,
                caster,
                enemy,
                ability,
                3
            )
            if enemy:IsRealHero() then
                heroesHit = heroesHit + 1
            end
        end
        if heroesHit > 0 then
            local eAb = caster:FindAbilityByName("evo_nyx_archon_e")
            if eAb and not eAb:IsNull() then
                local maxStacks = eAb:GetSpecialValueFor("max_stacks")
                local dur = eAb:GetSpecialValueFor("stack_duration")
                local ex = caster:FindModifierByName("modifier_evo_nyx_archon_e_stack")
                local next = math.min(
                    maxStacks,
                    (ex and ex:GetStackCount() or 0) + heroesHit
                )
                local mod = caster:AddNewModifier(caster, eAb, "modifier_evo_nyx_archon_e_stack", {duration = dur})
                if mod ~= nil then
                    mod:SetStackCount(next)
                end
            end
        end
    end
end
function modifier_evo_nyx_archon_r_crystal.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    UTIL_Remove(self:GetParent())
end
function modifier_evo_nyx_archon_r_crystal.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED")}
end
function modifier_evo_nyx_archon_r_crystal.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    local crystal = self:GetParent()
    if not caster or caster:IsNull() or not ability or ability:IsNull() or not crystal or crystal:IsNull() then
        return
    end
    local unit = event.unit
    local castAb = event.ability
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not castAb or castAb:IsNull() or castAb:IsItem() then
        return
    end
    local manaCost = castAb:GetManaCost(math.max(
        0,
        castAb:GetLevel() - 1
    ))
    if manaCost <= 0 then
        return
    end
    local isNyx = unit == caster
    local isTetheredEnemy = unit:GetTeamNumber() ~= caster:GetTeamNumber() and unit:HasModifier("modifier_evo_nyx_archon_r_tether")
    if not isNyx and not isTetheredEnemy then
        return
    end
    local dmg = manaCost * ability:GetSpecialValueFor("mana_dmg_ratio")
    local center = crystal:GetAbsOrigin()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_pugna/pugna_ward_attack.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, center)
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, center, self.radius)) do
        ApplyDamage({
            victim = enemy,
            attacker = caster,
            ability = ability,
            damage = dmg,
            damage_type = 2
        })
    end
end
modifier_evo_nyx_archon_r_crystal = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_r_crystal")},
    modifier_evo_nyx_archon_r_crystal
)
____exports.modifier_evo_nyx_archon_r_crystal = modifier_evo_nyx_archon_r_crystal
____exports.modifier_evo_nyx_archon_r_tether = __TS__Class()
local modifier_evo_nyx_archon_r_tether = ____exports.modifier_evo_nyx_archon_r_tether
modifier_evo_nyx_archon_r_tether.name = "modifier_evo_nyx_archon_r_tether"
__TS__ClassExtends(modifier_evo_nyx_archon_r_tether, BaseModifier)
function modifier_evo_nyx_archon_r_tether.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_archon_r_tether.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_archon_r_tether.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_archon_r_tether.prototype.GetTexture(self)
    return "tinker_laser"
end
function modifier_evo_nyx_archon_r_tether.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_TETHERED")] = true}
end
function modifier_evo_nyx_archon_r_tether.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_archon_r_tether.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    return ability and not ability:IsNull() and -ability:GetSpecialValueFor("slow_pct") or -30
end
modifier_evo_nyx_archon_r_tether = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_r_tether")},
    modifier_evo_nyx_archon_r_tether
)
____exports.modifier_evo_nyx_archon_r_tether = modifier_evo_nyx_archon_r_tether
return ____exports
