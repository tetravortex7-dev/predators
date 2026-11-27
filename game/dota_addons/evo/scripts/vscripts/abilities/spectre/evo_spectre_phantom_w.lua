local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 15,["21"] = 17,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 24,["27"] = 25,["28"] = 24,["29"] = 25,["30"] = 26,["31"] = 27,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 26,["36"] = 29,["37"] = 30,["38"] = 29,["39"] = 32,["40"] = 33,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 44,["54"] = 45,["55"] = 48,["56"] = 49,["58"] = 32,["59"] = 25,["60"] = 24,["61"] = 25,["63"] = 25,["64"] = 54,["65"] = 55,["66"] = 54,["67"] = 55,["69"] = 55,["70"] = 56,["71"] = 57,["72"] = 54,["73"] = 59,["74"] = 60,["75"] = 59,["76"] = 62,["77"] = 63,["78"] = 62,["79"] = 65,["80"] = 66,["81"] = 67,["82"] = 68,["83"] = 69,["84"] = 70,["86"] = 65,["87"] = 73,["88"] = 74,["89"] = 73,["90"] = 76,["91"] = 77,["92"] = 77,["93"] = 77,["94"] = 77,["95"] = 76,["96"] = 82,["97"] = 83,["98"] = 84,["99"] = 84,["101"] = 85,["102"] = 82,["103"] = 87,["104"] = 88,["107"] = 89,["108"] = 90,["109"] = 91,["110"] = 92,["113"] = 93,["116"] = 94,["119"] = 95,["122"] = 97,["123"] = 98,["124"] = 99,["125"] = 100,["126"] = 101,["127"] = 104,["128"] = 105,["129"] = 109,["132"] = 112,["133"] = 113,["135"] = 116,["136"] = 119,["137"] = 120,["138"] = 122,["139"] = 123,["140"] = 124,["141"] = 125,["142"] = 126,["143"] = 128,["144"] = 129,["145"] = 131,["146"] = 136,["147"] = 137,["148"] = 138,["149"] = 139,["150"] = 141,["151"] = 146,["152"] = 147,["153"] = 149,["154"] = 154,["155"] = 155,["156"] = 157,["157"] = 157,["158"] = 157,["159"] = 157,["160"] = 157,["161"] = 157,["162"] = 157,["163"] = 165,["164"] = 165,["165"] = 165,["166"] = 165,["167"] = 165,["168"] = 165,["170"] = 166,["171"] = 166,["173"] = 167,["174"] = 167,["175"] = 167,["176"] = 167,["177"] = 167,["178"] = 167,["179"] = 167,["183"] = 176,["184"] = 177,["185"] = 178,["186"] = 179,["187"] = 180,["188"] = 184,["189"] = 184,["191"] = 185,["192"] = 189,["193"] = 189,["195"] = 191,["196"] = 192,["197"] = 193,["198"] = 194,["199"] = 195,["200"] = 196,["201"] = 197,["202"] = 197,["203"] = 197,["204"] = 197,["205"] = 197,["206"] = 197,["207"] = 197,["208"] = 197,["209"] = 197,["212"] = 87,["213"] = 55,["214"] = 54,["215"] = 55,["217"] = 55,["218"] = 206,["219"] = 207,["220"] = 206,["221"] = 207,["222"] = 207,["223"] = 206,["224"] = 207,["226"] = 207,["227"] = 209,["228"] = 210,["229"] = 209,["230"] = 210,["231"] = 210,["232"] = 209,["233"] = 210,["235"] = 210,["236"] = 212,["237"] = 213,["238"] = 212,["239"] = 213,["241"] = 213,["242"] = 214,["243"] = 215,["244"] = 212,["245"] = 217,["246"] = 218,["247"] = 217,["248"] = 220,["249"] = 221,["250"] = 220,["251"] = 223,["252"] = 224,["253"] = 223,["254"] = 226,["255"] = 227,["256"] = 226,["257"] = 229,["258"] = 230,["259"] = 229,["260"] = 232,["261"] = 233,["262"] = 232,["263"] = 235,["264"] = 236,["265"] = 237,["266"] = 238,["267"] = 239,["268"] = 240,["269"] = 241,["271"] = 235,["272"] = 244,["273"] = 245,["274"] = 244,["275"] = 247,["276"] = 248,["277"] = 247,["278"] = 252,["279"] = 253,["280"] = 253,["281"] = 253,["282"] = 253,["283"] = 252,["284"] = 258,["285"] = 259,["286"] = 258,["287"] = 261,["288"] = 262,["289"] = 261,["290"] = 213,["291"] = 212,["292"] = 213,["294"] = 213,["295"] = 266,["296"] = 267,["297"] = 266,["298"] = 267,["300"] = 267,["301"] = 268,["302"] = 266,["303"] = 270,["304"] = 271,["305"] = 270,["306"] = 273,["307"] = 274,["308"] = 273,["309"] = 276,["310"] = 277,["311"] = 276,["312"] = 279,["313"] = 280,["314"] = 279,["315"] = 282,["316"] = 283,["318"] = 283,["319"] = 283,["320"] = 283,["322"] = 283,["323"] = 284,["324"] = 285,["326"] = 282,["327"] = 288,["328"] = 289,["329"] = 288,["330"] = 291,["331"] = 292,["332"] = 291,["333"] = 294,["334"] = 295,["335"] = 296,["336"] = 294,["337"] = 267,["338"] = 266,["339"] = 267,["341"] = 267,["342"] = 300,["343"] = 301,["344"] = 300,["345"] = 301,["346"] = 302,["347"] = 303,["348"] = 302,["349"] = 305,["350"] = 306,["351"] = 305,["352"] = 308,["353"] = 309,["354"] = 308,["355"] = 311,["356"] = 312,["357"] = 311,["358"] = 314,["359"] = 315,["360"] = 314,["361"] = 317,["362"] = 318,["363"] = 317,["364"] = 320,["365"] = 321,["366"] = 320,["367"] = 301,["368"] = 300,["369"] = 301,["371"] = 301});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreAgi = ____evo_spectre_shared.getSpectreAgi
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_phantom_w"
LinkLuaModifier("modifier_evo_spectre_phantom_w_passive", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_w_active", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_ms_steal", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_root", SCRIPT_PATH, 0)
____exports.evo_spectre_phantom_w = __TS__Class()
local evo_spectre_phantom_w = ____exports.evo_spectre_phantom_w
evo_spectre_phantom_w.name = "evo_spectre_phantom_w"
__TS__ClassExtends(evo_spectre_phantom_w, BaseAbility)
function evo_spectre_phantom_w.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_phantom_w.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_spectre_phantom_w_passive"
end
function evo_spectre_phantom_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("active_duration")
    caster:EmitSound("Hero_VoidSpirit.Dissimilate.Cast")
    caster:EmitSound("Hero_Spectre.ShadowStep.Cast")
    local castPfx = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf", 1, caster)
    ParticleManager:SetParticleControl(
        castPfx,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(castPfx)
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_spectre_phantom_w_active", {duration = dur})
    if mod ~= nil then
        mod:SetStackCount(1)
    end
end
evo_spectre_phantom_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_w")},
    evo_spectre_phantom_w
)
____exports.evo_spectre_phantom_w = evo_spectre_phantom_w
____exports.modifier_evo_spectre_phantom_w_passive = __TS__Class()
local modifier_evo_spectre_phantom_w_passive = ____exports.modifier_evo_spectre_phantom_w_passive
modifier_evo_spectre_phantom_w_passive.name = "modifier_evo_spectre_phantom_w_passive"
__TS__ClassExtends(modifier_evo_spectre_phantom_w_passive, BaseModifier)
function modifier_evo_spectre_phantom_w_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitCounter = 0
    self.bonusAs = 20
end
function modifier_evo_spectre_phantom_w_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_spectre_phantom_w_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_phantom_w_passive.prototype.OnCreated(self)
    self.hitCounter = 0
    self.bonusAs = 20
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.bonusAs = ab:GetSpecialValueFor("bonus_as")
    end
end
function modifier_evo_spectre_phantom_w_passive.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_phantom_w_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_spectre_phantom_w_passive.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    return self.bonusAs
end
function modifier_evo_spectre_phantom_w_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ability or ability:IsNull() or event.attacker ~= parent then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    self.hitCounter = self.hitCounter + 1
    local tier = getSpectreTier(nil, parent)
    local activeMod = parent:FindModifierByName("modifier_evo_spectre_phantom_w_active")
    local hasEmpower = activeMod ~= nil and activeMod:GetStackCount() > 0
    local isFastCycle = tier >= 4 and (activeMod ~= nil or parent:HasModifier("modifier_evo_spectre_reality_ms"))
    local cadence = isFastCycle and 2 or 3
    local isSlowed = target:HasModifier("modifier_spectre_spectral_dagger_slow") or target:HasModifier("modifier_spectre_spectral_dagger")
    if not hasEmpower and not isSlowed and self.hitCounter < cadence then
        return
    end
    if self.hitCounter >= cadence then
        self.hitCounter = 0
    end
    local pureDmg = ability:GetSpecialValueFor("pure_base") + getSpectreAgi(nil, parent) * ability:GetSpecialValueFor("pure_agi_pct") / 100
    local cleaveRadius = ability:GetSpecialValueFor("cleave_radius")
    local cleavePct = ability:GetSpecialValueFor("cleave_pct") / 100
    local parentPos = parent:GetAbsOrigin()
    local targetPos = target:GetAbsOrigin()
    local dir = targetPos:__sub(parentPos)
    dir.z = 0
    local forward = dir:Length2D() > 1 and dir:Normalized() or parent:GetForwardVector()
    target:EmitSound("Hero_Spectre.Desolate")
    target:EmitSound(hasEmpower and "Hero_VoidSpirit.AstralStep.Target" or "Hero_VoidSpirit.Pulse.Target")
    local cleavePfx = ParticleManager:CreateParticle("particles/evo_spectre/evo_spectre_cleave.vpcf", 0, parent)
    ParticleManager:SetParticleControl(cleavePfx, 0, parentPos)
    ParticleManager:SetParticleControlForward(cleavePfx, 0, forward)
    ParticleManager:SetParticleControl(cleavePfx, 2, targetPos)
    ParticleManager:ReleaseParticleIndex(cleavePfx)
    local burstPfx = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf", 0, target)
    ParticleManager:SetParticleControl(burstPfx, 0, targetPos)
    ParticleManager:ReleaseParticleIndex(burstPfx)
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_desolate.vpcf", 1, target)
    ParticleManager:SetParticleControl(pfx, 4, parentPos)
    ParticleManager:ReleaseParticleIndex(pfx)
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ability,
        damage = pureDmg,
        damage_type = 4
    })
    for ____, other in ipairs(findSpectreEnemies(
        nil,
        parent,
        target:GetAbsOrigin(),
        cleaveRadius
    )) do
        do
            if not other or other:IsNull() or not other:IsAlive() or other == target then
                goto __continue23
            end
            ApplyDamage({
                victim = other,
                attacker = parent,
                ability = ability,
                damage = pureDmg * cleavePct,
                damage_type = 4
            })
        end
        ::__continue23::
    end
    if hasEmpower and activeMod then
        activeMod:SetStackCount(0)
        local stealPct = math.floor(ability:GetSpecialValueFor("ms_steal_pct") + 0.5)
        local stealDur = ability:GetSpecialValueFor("ms_steal_duration")
        local slowMod = target:AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {duration = stealDur, amount = -stealPct})
        if slowMod ~= nil then
            slowMod:SetStackCount(stealPct)
        end
        local hastedMod = parent:AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_ms_steal", {duration = stealDur, amount = stealPct})
        if hastedMod ~= nil then
            hastedMod:SetStackCount(stealPct)
        end
        if tier >= 3 then
            local kvRoot = ability:GetSpecialValueFor("root_duration")
            local kvShred = ability:GetSpecialValueFor("armor_shred")
            local rootDur = kvRoot > 0 and kvRoot or (tier >= 4 and 1.3 or 1)
            local shred = kvShred > 0 and kvShred or (tier >= 4 and 6 or 4)
            target:AddNewModifier(parent, ability, "modifier_evo_spectre_phantom_root", {duration = rootDur})
            target:AddNewModifier(
                parent,
                ability,
                "modifier_evo_spectre_armor_shred",
                {
                    duration = ability:GetSpecialValueFor("shred_duration"),
                    shred = shred
                }
            )
        end
    end
end
modifier_evo_spectre_phantom_w_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_phantom_w_passive")},
    modifier_evo_spectre_phantom_w_passive
)
____exports.modifier_evo_spectre_phantom_w_passive = modifier_evo_spectre_phantom_w_passive
____exports.evo_spectre_phantom_w_t3 = __TS__Class()
local evo_spectre_phantom_w_t3 = ____exports.evo_spectre_phantom_w_t3
evo_spectre_phantom_w_t3.name = "evo_spectre_phantom_w_t3"
__TS__ClassExtends(evo_spectre_phantom_w_t3, ____exports.evo_spectre_phantom_w)
evo_spectre_phantom_w_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_w_t3")},
    evo_spectre_phantom_w_t3
)
____exports.evo_spectre_phantom_w_t3 = evo_spectre_phantom_w_t3
____exports.evo_spectre_phantom_w_t4 = __TS__Class()
local evo_spectre_phantom_w_t4 = ____exports.evo_spectre_phantom_w_t4
evo_spectre_phantom_w_t4.name = "evo_spectre_phantom_w_t4"
__TS__ClassExtends(evo_spectre_phantom_w_t4, ____exports.evo_spectre_phantom_w)
evo_spectre_phantom_w_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_w_t4")},
    evo_spectre_phantom_w_t4
)
____exports.evo_spectre_phantom_w_t4 = evo_spectre_phantom_w_t4
____exports.modifier_evo_spectre_phantom_w_active = __TS__Class()
local modifier_evo_spectre_phantom_w_active = ____exports.modifier_evo_spectre_phantom_w_active
modifier_evo_spectre_phantom_w_active.name = "modifier_evo_spectre_phantom_w_active"
__TS__ClassExtends(modifier_evo_spectre_phantom_w_active, BaseModifier)
function modifier_evo_spectre_phantom_w_active.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.evasion = 30
    self.bonusRange = 175
end
function modifier_evo_spectre_phantom_w_active.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_phantom_w_active.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_phantom_w_active.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_phantom_w_active.prototype.GetTexture(self)
    return "evo_spectre_phantom_w"
end
function modifier_evo_spectre_phantom_w_active.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_spectre/spectre_ambient_blade.vpcf"
end
function modifier_evo_spectre_phantom_w_active.prototype.GetEffectAttachType(self)
    return 1
end
function modifier_evo_spectre_phantom_w_active.prototype.OnCreated(self)
    self.evasion = 30
    self.bonusRange = 175
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.evasion = ab:GetSpecialValueFor("evasion_pct")
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
    end
end
function modifier_evo_spectre_phantom_w_active.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_phantom_w_active.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_CANNOT_MISS")] = true}
end
function modifier_evo_spectre_phantom_w_active.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EVASION_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS")
    }
end
function modifier_evo_spectre_phantom_w_active.prototype.GetModifierEvasion_Constant(self)
    return self.evasion
end
function modifier_evo_spectre_phantom_w_active.prototype.GetModifierAttackRangeBonus(self)
    return self:GetStackCount() > 0 and self.bonusRange or 0
end
modifier_evo_spectre_phantom_w_active = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_phantom_w_active")},
    modifier_evo_spectre_phantom_w_active
)
____exports.modifier_evo_spectre_phantom_w_active = modifier_evo_spectre_phantom_w_active
____exports.modifier_evo_spectre_phantom_ms_steal = __TS__Class()
local modifier_evo_spectre_phantom_ms_steal = ____exports.modifier_evo_spectre_phantom_ms_steal
modifier_evo_spectre_phantom_ms_steal.name = "modifier_evo_spectre_phantom_ms_steal"
__TS__ClassExtends(modifier_evo_spectre_phantom_ms_steal, BaseModifier)
function modifier_evo_spectre_phantom_ms_steal.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.isDebuffFlag = false
end
function modifier_evo_spectre_phantom_ms_steal.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_phantom_ms_steal.prototype.IsDebuff(self)
    return self.isDebuffFlag
end
function modifier_evo_spectre_phantom_ms_steal.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_phantom_ms_steal.prototype.GetTexture(self)
    return "evo_spectre_phantom_w"
end
function modifier_evo_spectre_phantom_ms_steal.prototype.OnCreated(self, params)
    local ____temp_3 = params and (params.amount or 0) < 0
    if not ____temp_3 then
        local ____temp_2 = self:GetParent():GetTeamNumber()
        local ____opt_0 = self:GetCaster()
        ____temp_3 = ____temp_2 ~= (____opt_0 and ____opt_0:GetTeamNumber())
    end
    self.isDebuffFlag = ____temp_3
    if IsServer() and params and params.amount ~= nil then
        self:SetStackCount(math.abs(math.floor(params.amount + 0.5)))
    end
end
function modifier_evo_spectre_phantom_ms_steal.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_spectre_phantom_ms_steal.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_phantom_ms_steal.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local val = self:GetStackCount()
    return self.isDebuffFlag and -val or val
end
modifier_evo_spectre_phantom_ms_steal = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_phantom_ms_steal")},
    modifier_evo_spectre_phantom_ms_steal
)
____exports.modifier_evo_spectre_phantom_ms_steal = modifier_evo_spectre_phantom_ms_steal
____exports.modifier_evo_spectre_phantom_root = __TS__Class()
local modifier_evo_spectre_phantom_root = ____exports.modifier_evo_spectre_phantom_root
modifier_evo_spectre_phantom_root.name = "modifier_evo_spectre_phantom_root"
__TS__ClassExtends(modifier_evo_spectre_phantom_root, BaseModifier)
function modifier_evo_spectre_phantom_root.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_phantom_root.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_phantom_root.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_phantom_root.prototype.GetTexture(self)
    return "evo_spectre_phantom_w"
end
function modifier_evo_spectre_phantom_root.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_treant/treant_bramble_root.vpcf"
end
function modifier_evo_spectre_phantom_root.prototype.GetEffectAttachType(self)
    return 1
end
function modifier_evo_spectre_phantom_root.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_spectre_phantom_root = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_phantom_root")},
    modifier_evo_spectre_phantom_root
)
____exports.modifier_evo_spectre_phantom_root = modifier_evo_spectre_phantom_root
return ____exports
