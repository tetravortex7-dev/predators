local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 2,["15"] = 3,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 16,["27"] = 18,["28"] = 20,["29"] = 21,["30"] = 23,["31"] = 24,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 25,["37"] = 24,["38"] = 23,["39"] = 24,["41"] = 24,["42"] = 30,["43"] = 31,["44"] = 30,["45"] = 31,["46"] = 31,["47"] = 30,["48"] = 31,["50"] = 31,["51"] = 33,["52"] = 34,["53"] = 33,["54"] = 34,["55"] = 34,["56"] = 33,["57"] = 34,["59"] = 34,["60"] = 36,["61"] = 37,["62"] = 36,["63"] = 37,["64"] = 37,["65"] = 36,["66"] = 37,["68"] = 37,["69"] = 39,["70"] = 40,["71"] = 39,["72"] = 40,["73"] = 40,["74"] = 39,["75"] = 40,["77"] = 40,["78"] = 42,["79"] = 43,["80"] = 42,["81"] = 43,["82"] = 43,["83"] = 42,["84"] = 43,["86"] = 43,["87"] = 45,["88"] = 46,["89"] = 45,["90"] = 46,["91"] = 46,["92"] = 45,["93"] = 46,["95"] = 46,["96"] = 48,["97"] = 49,["98"] = 48,["99"] = 49,["100"] = 49,["101"] = 48,["102"] = 49,["104"] = 49,["105"] = 51,["106"] = 52,["107"] = 51,["108"] = 52,["109"] = 52,["110"] = 51,["111"] = 52,["113"] = 52,["114"] = 54,["115"] = 55,["116"] = 54,["117"] = 55,["118"] = 55,["119"] = 54,["120"] = 55,["122"] = 55,["123"] = 57,["124"] = 58,["125"] = 57,["126"] = 58,["128"] = 58,["129"] = 59,["130"] = 57,["131"] = 61,["132"] = 62,["133"] = 61,["134"] = 64,["135"] = 65,["136"] = 64,["137"] = 67,["138"] = 68,["139"] = 67,["140"] = 70,["141"] = 71,["142"] = 70,["143"] = 73,["144"] = 74,["145"] = 73,["146"] = 76,["147"] = 77,["148"] = 78,["151"] = 79,["152"] = 76,["153"] = 81,["154"] = 82,["157"] = 83,["158"] = 84,["161"] = 85,["162"] = 86,["163"] = 87,["164"] = 87,["165"] = 87,["166"] = 87,["167"] = 88,["168"] = 89,["170"] = 91,["171"] = 92,["173"] = 81,["174"] = 95,["175"] = 96,["176"] = 96,["177"] = 96,["178"] = 96,["179"] = 96,["180"] = 95,["181"] = 102,["182"] = 103,["183"] = 104,["184"] = 105,["185"] = 105,["187"] = 106,["188"] = 106,["189"] = 106,["190"] = 106,["191"] = 106,["193"] = 107,["194"] = 108,["195"] = 108,["196"] = 108,["197"] = 108,["198"] = 102,["199"] = 110,["200"] = 111,["203"] = 112,["204"] = 113,["205"] = 114,["206"] = 115,["209"] = 116,["212"] = 117,["215"] = 118,["218"] = 120,["219"] = 121,["220"] = 122,["221"] = 123,["222"] = 124,["223"] = 128,["224"] = 129,["227"] = 132,["228"] = 133,["229"] = 134,["231"] = 110,["232"] = 137,["233"] = 138,["236"] = 139,["237"] = 140,["238"] = 141,["241"] = 142,["244"] = 143,["245"] = 143,["246"] = 143,["247"] = 143,["250"] = 145,["251"] = 146,["252"] = 147,["255"] = 150,["256"] = 150,["257"] = 150,["258"] = 150,["259"] = 150,["260"] = 150,["261"] = 151,["262"] = 152,["264"] = 137,["265"] = 58,["266"] = 57,["267"] = 58,["269"] = 58,["270"] = 157,["271"] = 158,["272"] = 157,["273"] = 158,["275"] = 158,["276"] = 159,["277"] = 160,["278"] = 157,["279"] = 162,["280"] = 163,["281"] = 163,["282"] = 163,["283"] = 163,["284"] = 162,["285"] = 165,["286"] = 166,["289"] = 167,["290"] = 168,["291"] = 169,["292"] = 170,["293"] = 171,["294"] = 172,["296"] = 174,["297"] = 176,["298"] = 177,["299"] = 178,["300"] = 180,["301"] = 181,["302"] = 181,["303"] = 181,["304"] = 181,["305"] = 181,["306"] = 181,["307"] = 181,["308"] = 181,["309"] = 181,["310"] = 181,["311"] = 181,["312"] = 181,["313"] = 181,["314"] = 181,["315"] = 181,["316"] = 181,["317"] = 181,["318"] = 198,["319"] = 165,["320"] = 200,["321"] = 205,["322"] = 205,["324"] = 206,["325"] = 207,["326"] = 208,["327"] = 209,["329"] = 211,["330"] = 212,["331"] = 213,["332"] = 213,["334"] = 214,["335"] = 214,["337"] = 216,["338"] = 217,["339"] = 218,["340"] = 219,["341"] = 221,["342"] = 222,["343"] = 222,["344"] = 222,["345"] = 222,["346"] = 222,["347"] = 222,["348"] = 222,["349"] = 222,["350"] = 222,["351"] = 223,["352"] = 225,["353"] = 226,["354"] = 227,["356"] = 229,["357"] = 200,["358"] = 158,["359"] = 157,["360"] = 158,["362"] = 158,["363"] = 233,["364"] = 234,["365"] = 233,["366"] = 234,["368"] = 234,["369"] = 235,["370"] = 233,["371"] = 237,["372"] = 238,["373"] = 238,["374"] = 238,["375"] = 238,["376"] = 237,["377"] = 240,["378"] = 241,["381"] = 242,["382"] = 243,["383"] = 243,["384"] = 243,["385"] = 243,["386"] = 244,["387"] = 245,["388"] = 246,["389"] = 248,["390"] = 248,["391"] = 248,["392"] = 248,["393"] = 249,["394"] = 250,["395"] = 251,["396"] = 252,["399"] = 256,["400"] = 257,["401"] = 257,["402"] = 257,["403"] = 257,["404"] = 257,["405"] = 257,["406"] = 257,["407"] = 257,["408"] = 258,["409"] = 259,["410"] = 259,["411"] = 259,["412"] = 259,["413"] = 260,["414"] = 261,["415"] = 262,["416"] = 263,["417"] = 264,["418"] = 264,["420"] = 240,["421"] = 234,["422"] = 233,["423"] = 234,["425"] = 234,["426"] = 269,["427"] = 270,["428"] = 269,["429"] = 270,["431"] = 270,["432"] = 271,["433"] = 272,["434"] = 273,["435"] = 274,["436"] = 269,["437"] = 276,["438"] = 277,["439"] = 276,["440"] = 279,["441"] = 280,["442"] = 279,["443"] = 282,["444"] = 283,["445"] = 284,["446"] = 285,["447"] = 286,["448"] = 287,["449"] = 288,["450"] = 289,["451"] = 290,["452"] = 291,["453"] = 292,["455"] = 294,["458"] = 295,["459"] = 282,["460"] = 297,["461"] = 298,["464"] = 299,["465"] = 300,["466"] = 301,["467"] = 302,["470"] = 304,["471"] = 304,["472"] = 304,["473"] = 304,["474"] = 304,["475"] = 304,["476"] = 305,["479"] = 307,["480"] = 308,["481"] = 309,["482"] = 310,["486"] = 314,["489"] = 316,["490"] = 317,["491"] = 317,["492"] = 317,["493"] = 317,["494"] = 317,["495"] = 317,["496"] = 317,["497"] = 317,["498"] = 325,["499"] = 325,["500"] = 325,["501"] = 325,["502"] = 325,["503"] = 325,["504"] = 325,["505"] = 325,["506"] = 325,["507"] = 297,["508"] = 270,["509"] = 269,["510"] = 270,["512"] = 270});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_veno_shared = require("abilities.veno.evo_veno_shared")
local applyVenoCreepDamage = ____evo_veno_shared.applyVenoCreepDamage
local detectVenoBranchAndTier = ____evo_veno_shared.detectVenoBranchAndTier
local findVenoEnemies = ____evo_veno_shared.findVenoEnemies
local getVenoActiveTurrets = ____evo_veno_shared.getVenoActiveTurrets
local getVenoBranchMaxLevel = ____evo_veno_shared.getVenoBranchMaxLevel
local triggerVenoSporePulse = ____evo_veno_shared.triggerVenoSporePulse
require("abilities.veno.evo_veno_debuffs")
local SCRIPT_PATH = "abilities/veno/evo_veno_t1"
LinkLuaModifier("modifier_evo_veno_glands", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_t1_sprout", SCRIPT_PATH, 0)
____exports.evo_veno_glands = __TS__Class()
local evo_veno_glands = ____exports.evo_veno_glands
evo_veno_glands.name = "evo_veno_glands"
__TS__ClassExtends(evo_veno_glands, BaseAbility)
function evo_veno_glands.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_veno_glands"
end
evo_veno_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_glands")},
    evo_veno_glands
)
____exports.evo_veno_glands = evo_veno_glands
____exports.evo_veno_needle_glands = __TS__Class()
local evo_veno_needle_glands = ____exports.evo_veno_needle_glands
evo_veno_needle_glands.name = "evo_veno_needle_glands"
__TS__ClassExtends(evo_veno_needle_glands, ____exports.evo_veno_glands)
evo_veno_needle_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_glands")},
    evo_veno_needle_glands
)
____exports.evo_veno_needle_glands = evo_veno_needle_glands
____exports.evo_veno_needle_glands_t3 = __TS__Class()
local evo_veno_needle_glands_t3 = ____exports.evo_veno_needle_glands_t3
evo_veno_needle_glands_t3.name = "evo_veno_needle_glands_t3"
__TS__ClassExtends(evo_veno_needle_glands_t3, ____exports.evo_veno_glands)
evo_veno_needle_glands_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_glands_t3")},
    evo_veno_needle_glands_t3
)
____exports.evo_veno_needle_glands_t3 = evo_veno_needle_glands_t3
____exports.evo_veno_needle_glands_t4 = __TS__Class()
local evo_veno_needle_glands_t4 = ____exports.evo_veno_needle_glands_t4
evo_veno_needle_glands_t4.name = "evo_veno_needle_glands_t4"
__TS__ClassExtends(evo_veno_needle_glands_t4, ____exports.evo_veno_glands)
evo_veno_needle_glands_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_glands_t4")},
    evo_veno_needle_glands_t4
)
____exports.evo_veno_needle_glands_t4 = evo_veno_needle_glands_t4
____exports.evo_veno_hive_glands = __TS__Class()
local evo_veno_hive_glands = ____exports.evo_veno_hive_glands
evo_veno_hive_glands.name = "evo_veno_hive_glands"
__TS__ClassExtends(evo_veno_hive_glands, ____exports.evo_veno_glands)
evo_veno_hive_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_glands")},
    evo_veno_hive_glands
)
____exports.evo_veno_hive_glands = evo_veno_hive_glands
____exports.evo_veno_hive_glands_t3 = __TS__Class()
local evo_veno_hive_glands_t3 = ____exports.evo_veno_hive_glands_t3
evo_veno_hive_glands_t3.name = "evo_veno_hive_glands_t3"
__TS__ClassExtends(evo_veno_hive_glands_t3, ____exports.evo_veno_glands)
evo_veno_hive_glands_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_glands_t3")},
    evo_veno_hive_glands_t3
)
____exports.evo_veno_hive_glands_t3 = evo_veno_hive_glands_t3
____exports.evo_veno_hive_glands_t4 = __TS__Class()
local evo_veno_hive_glands_t4 = ____exports.evo_veno_hive_glands_t4
evo_veno_hive_glands_t4.name = "evo_veno_hive_glands_t4"
__TS__ClassExtends(evo_veno_hive_glands_t4, ____exports.evo_veno_glands)
evo_veno_hive_glands_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_glands_t4")},
    evo_veno_hive_glands_t4
)
____exports.evo_veno_hive_glands_t4 = evo_veno_hive_glands_t4
____exports.evo_veno_symbiont_glands = __TS__Class()
local evo_veno_symbiont_glands = ____exports.evo_veno_symbiont_glands
evo_veno_symbiont_glands.name = "evo_veno_symbiont_glands"
__TS__ClassExtends(evo_veno_symbiont_glands, ____exports.evo_veno_glands)
evo_veno_symbiont_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_glands")},
    evo_veno_symbiont_glands
)
____exports.evo_veno_symbiont_glands = evo_veno_symbiont_glands
____exports.evo_veno_symbiont_glands_t3 = __TS__Class()
local evo_veno_symbiont_glands_t3 = ____exports.evo_veno_symbiont_glands_t3
evo_veno_symbiont_glands_t3.name = "evo_veno_symbiont_glands_t3"
__TS__ClassExtends(evo_veno_symbiont_glands_t3, ____exports.evo_veno_glands)
evo_veno_symbiont_glands_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_glands_t3")},
    evo_veno_symbiont_glands_t3
)
____exports.evo_veno_symbiont_glands_t3 = evo_veno_symbiont_glands_t3
____exports.evo_veno_symbiont_glands_t4 = __TS__Class()
local evo_veno_symbiont_glands_t4 = ____exports.evo_veno_symbiont_glands_t4
evo_veno_symbiont_glands_t4.name = "evo_veno_symbiont_glands_t4"
__TS__ClassExtends(evo_veno_symbiont_glands_t4, ____exports.evo_veno_glands)
evo_veno_symbiont_glands_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_glands_t4")},
    evo_veno_symbiont_glands_t4
)
____exports.evo_veno_symbiont_glands_t4 = evo_veno_symbiont_glands_t4
____exports.modifier_evo_veno_glands = __TS__Class()
local modifier_evo_veno_glands = ____exports.modifier_evo_veno_glands
modifier_evo_veno_glands.name = "modifier_evo_veno_glands"
__TS__ClassExtends(modifier_evo_veno_glands, BaseModifier)
function modifier_evo_veno_glands.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.attackCount = 0
end
function modifier_evo_veno_glands.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_glands.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_glands.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_glands.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_veno_glands.prototype.GetTexture(self)
    return "venomancer_poison_sting"
end
function modifier_evo_veno_glands.prototype.OnCreated(self)
    self.attackCount = 0
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.5)
end
function modifier_evo_veno_glands.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return
    end
    local info = detectVenoBranchAndTier(nil, parent)
    if info.branch == "HIVE" and info.tier >= 3 then
        local count = math.min(
            5,
            #getVenoActiveTurrets(nil, parent)
        )
        if self:GetStackCount() ~= count then
            self:SetStackCount(count)
        end
    elseif self:GetStackCount() ~= 0 then
        self:SetStackCount(0)
    end
end
function modifier_evo_veno_glands.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED")
    }
end
function modifier_evo_veno_glands.prototype.GetModifierSpellAmplify_Percentage(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    if not __TS__StringStartsWith(
        ab:GetAbilityName(),
        "evo_veno_hive_glands"
    ) then
        return 0
    end
    local ampPer = ab:GetSpecialValueFor("amp_per_turret")
    return math.min(
        5,
        self:GetStackCount()
    ) * ampPer
end
function modifier_evo_veno_glands.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
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
    self.attackCount = self.attackCount + 1
    local info = detectVenoBranchAndTier(nil, parent)
    local cadence = ab:GetSpecialValueFor("attack_cadence")
    if info.branch == "NEEDLE" and info.tier >= 4 then
        local slowed = target:HasModifier("modifier_evo_veno_needle_q_slow") or target:HasModifier("modifier_evo_veno_glands_slow") or target:HasModifier("modifier_evo_veno_chitin_shard")
        if slowed then
            cadence = 2
        end
    end
    if self.attackCount >= math.max(1, cadence) then
        self.attackCount = 0
        triggerVenoSporePulse(nil, parent, target, 1)
    end
end
function modifier_evo_veno_glands.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local castAb = event.ability
    if not parent or parent:IsNull() or event.unit ~= parent or parent:PassivesDisabled() then
        return
    end
    if not castAb or castAb:IsNull() or castAb:IsItem() then
        return
    end
    if __TS__StringStartsWith(
        castAb:GetAbilityName(),
        "evo_empty_slot_"
    ) then
        return
    end
    local target = event.target
    if target and not target:IsNull() and IsValidEntity(target) and target:IsAlive() and target:GetTeamNumber() ~= parent:GetTeamNumber() then
        triggerVenoSporePulse(nil, parent, target, 1)
        return
    end
    local enemies = findVenoEnemies(
        nil,
        parent,
        parent:GetAbsOrigin(),
        650
    )
    if #enemies > 0 and enemies[1] and not enemies[1]:IsNull() then
        triggerVenoSporePulse(nil, parent, enemies[1], 1)
    end
end
modifier_evo_veno_glands = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_glands")},
    modifier_evo_veno_glands
)
____exports.modifier_evo_veno_glands = modifier_evo_veno_glands
____exports.evo_veno_t1_q = __TS__Class()
local evo_veno_t1_q = ____exports.evo_veno_t1_q
evo_veno_t1_q.name = "evo_veno_t1_q"
__TS__ClassExtends(evo_veno_t1_q, BaseAbility)
function evo_veno_t1_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.triggeredPulse = __TS__New(Set)
    self.hitSets = {}
end
function evo_veno_t1_q.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_t1_q.prototype.OnSpellStart(self)
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
    local width = self:GetSpecialValueFor("width")
    local speed = self:GetSpecialValueFor("speed")
    caster:EmitSound("Hero_Venomancer.VenomousGale")
    local projId = ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf",
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
        iVisionRadius = 200,
        iVisionTeamNumber = caster:GetTeamNumber()
    })
    self.hitSets[projId] = __TS__New(Set)
end
function evo_veno_t1_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.hitSets, projectileHandle)
        self.triggeredPulse:delete(projectileHandle)
        return false
    end
    local set = self.hitSets[projectileHandle]
    local idx = target:GetEntityIndex()
    if set ~= nil and set:has(idx) then
        return false
    end
    if set ~= nil then
        set:add(idx)
    end
    local caster = self:GetCaster()
    local dmg = self:GetSpecialValueFor("damage")
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local slowDur = self:GetSpecialValueFor("slow_duration")
    target:EmitSound("Hero_Venomancer.VenomousGaleImpact")
    applyVenoCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        2,
        creepMult
    )
    target:AddNewModifier(caster, self, "modifier_evo_veno_t1_q_slow", {duration = slowDur})
    if not self.triggeredPulse:has(projectileHandle) then
        self.triggeredPulse:add(projectileHandle)
        triggerVenoSporePulse(nil, caster, target, 1)
    end
    return false
end
evo_veno_t1_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_t1_q")},
    evo_veno_t1_q
)
____exports.evo_veno_t1_q = evo_veno_t1_q
____exports.evo_veno_t1_w = __TS__Class()
local evo_veno_t1_w = ____exports.evo_veno_t1_w
evo_veno_t1_w.name = "evo_veno_t1_w"
__TS__ClassExtends(evo_veno_t1_w, BaseAbility)
function evo_veno_t1_w.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.sprouts = {}
end
function evo_veno_t1_w.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_t1_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local pos = GetGroundPosition(
        self:GetCursorPosition(),
        caster
    )
    local dur = self:GetSpecialValueFor("duration")
    local maxSprouts = self:GetSpecialValueFor("max_sprouts")
    local dmg = self:GetSpecialValueFor("attack_damage")
    self.sprouts = __TS__ArrayFilter(
        self.sprouts,
        function(____, u) return u and not u:IsNull() and IsValidEntity(u) and u:IsAlive() end
    )
    while #self.sprouts >= maxSprouts do
        local oldest = table.remove(self.sprouts, 1)
        if oldest and not oldest:IsNull() and IsValidEntity(oldest) then
            oldest:ForceKill(false)
        end
    end
    caster:EmitSound("Hero_Venomancer.Plague_Ward")
    local sprout = CreateUnitByName(
        "evo_veno_sprout",
        pos,
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    if sprout and not sprout:IsNull() then
        sprout:SetControllableByPlayer(
            caster:GetPlayerOwnerID(),
            false
        )
        sprout:SetBaseDamageMin(dmg)
        sprout:SetBaseDamageMax(dmg)
        sprout:AddNewModifier(caster, self, "modifier_kill", {duration = dur})
        sprout:AddNewModifier(caster, self, "modifier_evo_veno_t1_sprout", {duration = dur})
        local ____self_sprouts_0 = self.sprouts
        ____self_sprouts_0[#____self_sprouts_0 + 1] = sprout
    end
end
evo_veno_t1_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_t1_w")},
    evo_veno_t1_w
)
____exports.evo_veno_t1_w = evo_veno_t1_w
____exports.modifier_evo_veno_t1_sprout = __TS__Class()
local modifier_evo_veno_t1_sprout = ____exports.modifier_evo_veno_t1_sprout
modifier_evo_veno_t1_sprout.name = "modifier_evo_veno_t1_sprout"
__TS__ClassExtends(modifier_evo_veno_t1_sprout, BaseModifier)
function modifier_evo_veno_t1_sprout.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.range = 450
    self.interval = 1.2
    self.dmg = 24
    self.creepMult = 1.3
end
function modifier_evo_veno_t1_sprout.prototype.IsHidden(self)
    return true
end
function modifier_evo_veno_t1_sprout.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_t1_sprout.prototype.OnCreated(self)
    self.range = 450
    self.interval = 1.2
    self.dmg = 24
    self.creepMult = 1.3
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.range = ab:GetSpecialValueFor("attack_range")
        self.interval = ab:GetSpecialValueFor("attack_interval")
        self.dmg = ab:GetSpecialValueFor("attack_damage")
        self.creepMult = ab:GetSpecialValueFor("creep_mult")
    end
    if not IsServer() then
        return
    end
    self:StartIntervalThink(self.interval)
end
function modifier_evo_veno_t1_sprout.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local sprout = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not sprout or sprout:IsNull() or not sprout:IsAlive() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    local enemies = findVenoEnemies(
        nil,
        caster,
        sprout:GetAbsOrigin(),
        self.range
    )
    if #enemies == 0 then
        return
    end
    local target = enemies[1]
    for ____, candidate in ipairs(enemies) do
        if candidate and not candidate:IsNull() and candidate:HasModifier("modifier_evo_veno_t1_q_slow") then
            target = candidate
            break
        end
    end
    if not target or target:IsNull() or not target:IsAlive() then
        return
    end
    sprout:FaceTowards(target:GetAbsOrigin())
    ProjectileManager:CreateTrackingProjectile({
        Target = target,
        Source = sprout,
        Ability = ab,
        EffectName = "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
        iMoveSpeed = 1900,
        bDodgeable = true
    })
    applyVenoCreepDamage(
        nil,
        caster,
        target,
        ab,
        self.dmg,
        1,
        self.creepMult
    )
end
modifier_evo_veno_t1_sprout = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_t1_sprout")},
    modifier_evo_veno_t1_sprout
)
____exports.modifier_evo_veno_t1_sprout = modifier_evo_veno_t1_sprout
return ____exports
