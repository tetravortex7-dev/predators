local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 16,["25"] = 18,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 26,["35"] = 26,["36"] = 27,["37"] = 25,["38"] = 29,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 29,["44"] = 33,["45"] = 34,["46"] = 35,["47"] = 36,["48"] = 37,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 39,["58"] = 39,["59"] = 39,["60"] = 39,["61"] = 39,["62"] = 39,["63"] = 39,["64"] = 39,["65"] = 39,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 33,["71"] = 59,["72"] = 60,["75"] = 61,["76"] = 62,["77"] = 63,["78"] = 64,["79"] = 65,["80"] = 66,["82"] = 68,["83"] = 70,["84"] = 71,["85"] = 72,["86"] = 74,["87"] = 75,["88"] = 76,["89"] = 78,["90"] = 79,["91"] = 80,["92"] = 81,["93"] = 81,["94"] = 83,["95"] = 84,["96"] = 84,["98"] = 85,["99"] = 86,["100"] = 87,["101"] = 88,["102"] = 89,["104"] = 91,["105"] = 91,["106"] = 91,["107"] = 91,["108"] = 91,["109"] = 92,["110"] = 81,["111"] = 81,["112"] = 81,["114"] = 59,["115"] = 99,["116"] = 104,["117"] = 104,["119"] = 105,["120"] = 106,["121"] = 107,["122"] = 108,["124"] = 110,["125"] = 111,["126"] = 111,["128"] = 112,["129"] = 112,["131"] = 114,["132"] = 115,["133"] = 116,["134"] = 117,["135"] = 118,["136"] = 119,["137"] = 121,["138"] = 122,["139"] = 122,["140"] = 122,["141"] = 122,["142"] = 122,["143"] = 122,["144"] = 122,["145"] = 122,["146"] = 122,["147"] = 123,["148"] = 125,["149"] = 126,["150"] = 126,["151"] = 126,["152"] = 126,["153"] = 126,["154"] = 126,["155"] = 126,["156"] = 126,["157"] = 126,["158"] = 126,["159"] = 127,["160"] = 128,["161"] = 129,["162"] = 130,["163"] = 131,["164"] = 132,["165"] = 133,["166"] = 134,["167"] = 135,["168"] = 135,["174"] = 140,["175"] = 99,["176"] = 26,["177"] = 25,["178"] = 26,["180"] = 26,["181"] = 144,["182"] = 145,["183"] = 144,["184"] = 145,["185"] = 146,["186"] = 147,["187"] = 147,["188"] = 147,["189"] = 147,["190"] = 146,["191"] = 149,["192"] = 150,["193"] = 149,["194"] = 152,["195"] = 153,["198"] = 154,["199"] = 155,["200"] = 156,["201"] = 157,["202"] = 160,["203"] = 161,["205"] = 152,["206"] = 145,["207"] = 144,["208"] = 145,["210"] = 145,["211"] = 166,["212"] = 167,["213"] = 166,["214"] = 167,["216"] = 167,["217"] = 168,["218"] = 169,["219"] = 166,["220"] = 171,["221"] = 172,["222"] = 171,["223"] = 174,["224"] = 175,["225"] = 174,["226"] = 177,["227"] = 178,["228"] = 179,["229"] = 180,["230"] = 181,["231"] = 182,["233"] = 177,["234"] = 185,["235"] = 186,["236"] = 185,["237"] = 188,["238"] = 189,["239"] = 189,["240"] = 189,["241"] = 189,["242"] = 188,["243"] = 194,["244"] = 195,["245"] = 196,["246"] = 196,["248"] = 197,["249"] = 194,["250"] = 199,["251"] = 200,["254"] = 201,["255"] = 202,["256"] = 203,["257"] = 204,["260"] = 205,["263"] = 206,["266"] = 207,["269"] = 209,["270"] = 210,["271"] = 211,["272"] = 212,["273"] = 213,["274"] = 216,["275"] = 217,["276"] = 219,["279"] = 222,["280"] = 223,["282"] = 226,["283"] = 229,["284"] = 230,["285"] = 232,["286"] = 237,["287"] = 239,["288"] = 239,["289"] = 239,["290"] = 239,["291"] = 239,["292"] = 239,["293"] = 239,["294"] = 247,["295"] = 247,["296"] = 247,["297"] = 247,["298"] = 247,["299"] = 247,["301"] = 248,["302"] = 248,["304"] = 249,["305"] = 249,["306"] = 249,["307"] = 249,["308"] = 249,["309"] = 249,["310"] = 249,["314"] = 258,["315"] = 259,["316"] = 260,["317"] = 261,["318"] = 262,["319"] = 266,["320"] = 266,["322"] = 267,["323"] = 271,["324"] = 271,["326"] = 273,["327"] = 274,["328"] = 275,["329"] = 276,["330"] = 277,["331"] = 277,["332"] = 277,["333"] = 277,["334"] = 277,["335"] = 277,["336"] = 277,["337"] = 277,["338"] = 277,["341"] = 199,["342"] = 167,["343"] = 166,["344"] = 167,["346"] = 167,["347"] = 286,["348"] = 287,["349"] = 286,["350"] = 287,["352"] = 287,["353"] = 288,["354"] = 289,["355"] = 286,["356"] = 291,["357"] = 292,["358"] = 291,["359"] = 294,["360"] = 295,["361"] = 294,["362"] = 297,["363"] = 298,["364"] = 297,["365"] = 300,["366"] = 301,["367"] = 300,["368"] = 303,["369"] = 304,["370"] = 305,["371"] = 306,["372"] = 307,["373"] = 308,["374"] = 309,["376"] = 303,["377"] = 312,["378"] = 313,["379"] = 312,["380"] = 315,["381"] = 316,["382"] = 315,["383"] = 320,["384"] = 321,["385"] = 321,["386"] = 321,["387"] = 321,["388"] = 320,["389"] = 326,["390"] = 327,["391"] = 326,["392"] = 329,["393"] = 330,["394"] = 329,["395"] = 287,["396"] = 286,["397"] = 287,["399"] = 287,["400"] = 334,["401"] = 335,["402"] = 334,["403"] = 335,["405"] = 335,["406"] = 336,["407"] = 334,["408"] = 338,["409"] = 339,["410"] = 338,["411"] = 341,["412"] = 342,["413"] = 341,["414"] = 344,["415"] = 345,["416"] = 344,["417"] = 347,["418"] = 348,["419"] = 347,["420"] = 350,["421"] = 351,["423"] = 351,["424"] = 351,["425"] = 351,["427"] = 351,["428"] = 352,["429"] = 353,["431"] = 350,["432"] = 356,["433"] = 357,["434"] = 356,["435"] = 359,["436"] = 360,["437"] = 359,["438"] = 362,["439"] = 363,["440"] = 364,["441"] = 362,["442"] = 335,["443"] = 334,["444"] = 335,["446"] = 335,["447"] = 368,["448"] = 369,["449"] = 368,["450"] = 369,["451"] = 370,["452"] = 371,["453"] = 370,["454"] = 373,["455"] = 374,["456"] = 373,["457"] = 376,["458"] = 377,["459"] = 376,["460"] = 379,["461"] = 380,["462"] = 379,["463"] = 382,["464"] = 383,["465"] = 382,["466"] = 369,["467"] = 368,["468"] = 369,["470"] = 369});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local applySpectreCreepDamage = ____evo_spectre_shared.applySpectreCreepDamage
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreAgi = ____evo_spectre_shared.getSpectreAgi
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_phantom"
LinkLuaModifier("modifier_evo_spectre_phantom_w_passive", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_w_active", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_ms_steal", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_phantom_root", SCRIPT_PATH, 0)
____exports.evo_spectre_phantom_q = __TS__Class()
local evo_spectre_phantom_q = ____exports.evo_spectre_phantom_q
evo_spectre_phantom_q.name = "evo_spectre_phantom_q"
__TS__ClassExtends(evo_spectre_phantom_q, BaseAbility)
function evo_spectre_phantom_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.projMeta = {}
end
function evo_spectre_phantom_q.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_phantom_q.prototype.launchCrescent(self, origin, dir, isReturn)
    local caster = self:GetCaster()
    local range = self:GetSpecialValueFor("range")
    local width = self:GetSpecialValueFor("width")
    local speed = self:GetSpecialValueFor("speed")
    local projId = ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
        vSpawnOrigin = origin,
        fDistance = range,
        fStartRadius = width,
        fEndRadius = width,
        Source = caster,
        bHasFrontalCone = false,
        iUnitTargetTeam = 2,
        iUnitTargetFlags = 0,
        iUnitTargetType = 1 + 18,
        vVelocity = dir * speed,
        bProvidesVision = true,
        iVisionRadius = 225,
        iVisionTeamNumber = caster:GetTeamNumber()
    })
    self.projMeta[projId] = {
        isReturn = isReturn,
        hit = __TS__New(Set)
    }
end
function evo_spectre_phantom_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local dir = self:GetCursorPosition() - origin
    dir.z = 0
    if dir:Length2D() < 1 then
        dir = caster:GetForwardVector()
    end
    dir = dir:Normalized()
    local range = self:GetSpecialValueFor("range")
    local speed = self:GetSpecialValueFor("speed")
    local pathDur = self:GetSpecialValueFor("path_duration")
    caster:EmitSound("Hero_Spectre.DaggerCast")
    caster:AddNewModifier(caster, self, "modifier_evo_spectre_shadow_path", {duration = pathDur})
    self:launchCrescent(origin, dir, false)
    if getSpectreTier(nil, caster) >= 3 then
        local endPoint = GetGroundPosition(origin + dir * range, caster)
        local returnDelay = range / math.max(100, speed) + self:GetSpecialValueFor("return_delay")
        caster:SetContextThink(
            DoUniqueString("SpectreCrescentReturn"),
            function()
                if not self or self:IsNull() or not caster or caster:IsNull() then
                    return nil
                end
                local targetPos = caster:IsAlive() and caster:GetAbsOrigin() or origin
                local backDir = targetPos - endPoint
                backDir.z = 0
                if backDir:Length2D() < 1 then
                    backDir = -dir
                end
                self:launchCrescent(
                    endPoint,
                    backDir:Normalized(),
                    true
                )
                return nil
            end,
            returnDelay
        )
    end
end
function evo_spectre_phantom_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    local meta = self.projMeta[projectileHandle]
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.projMeta, projectileHandle)
        return false
    end
    local idx = target:GetEntityIndex()
    if meta ~= nil and meta.hit:has(idx) then
        return false
    end
    if meta ~= nil then
        meta.hit:add(idx)
    end
    local caster = self:GetCaster()
    local tier = getSpectreTier(nil, caster)
    local rawBase = self:GetSpecialValueFor("base_damage") + getSpectreAgi(nil, caster) * self:GetSpecialValueFor("agi_pct") / 100
    local dmg = meta and meta.isReturn and rawBase * self:GetSpecialValueFor("return_dmg_pct") / 100 or rawBase
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local slowDur = self:GetSpecialValueFor("slow_duration")
    target:EmitSound("Hero_Spectre.DaggerImpact")
    applySpectreCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        1,
        creepMult
    )
    target:AddNewModifier(caster, self, "modifier_evo_spectre_dagger_slow", {duration = slowDur})
    if tier >= 4 and not (meta and meta.isReturn) then
        caster:PerformAttack(
            target,
            true,
            true,
            true,
            true,
            false,
            false,
            true
        )
        if target:IsRealHero() then
            local dAb = caster:FindAbilityByName("evo_spectre_phantom_d")
            local reduce = self:GetSpecialValueFor("reality_cd_reduce")
            if dAb and not dAb:IsNull() and reduce > 0 then
                local rem = dAb:GetCooldownTimeRemaining()
                if rem > 0 then
                    dAb:EndCooldown()
                    local next = rem - reduce
                    if next > 0.05 then
                        dAb:StartCooldown(next)
                    end
                end
            end
        end
    end
    return false
end
evo_spectre_phantom_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_q")},
    evo_spectre_phantom_q
)
____exports.evo_spectre_phantom_q = evo_spectre_phantom_q
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
    caster:EmitSound("Hero_Spectre.Desolate")
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
    local isSlowed = target:HasModifier("modifier_evo_spectre_dagger_slow")
    if not hasEmpower and not isSlowed and self.hitCounter < cadence then
        return
    end
    if self.hitCounter >= cadence then
        self.hitCounter = 0
    end
    local pureDmg = ability:GetSpecialValueFor("pure_base") + getSpectreAgi(nil, parent) * ability:GetSpecialValueFor("pure_agi_pct") / 100
    local cleaveRadius = ability:GetSpecialValueFor("cleave_radius")
    local cleavePct = ability:GetSpecialValueFor("cleave_pct") / 100
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_desolate.vpcf", 1, target)
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
                goto __continue42
            end
            ApplyDamage({
                victim = other,
                attacker = parent,
                ability = ability,
                damage = pureDmg * cleavePct,
                damage_type = 4
            })
        end
        ::__continue42::
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
            local rootDur = tier >= 4 and 1.3 or 1
            local shred = tier >= 4 and 6 or 4
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
    return "spectre_desolate"
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
    return "spectre_desolate"
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
    return "spectre_desolate"
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
