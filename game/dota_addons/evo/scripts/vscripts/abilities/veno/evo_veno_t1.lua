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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 2,["15"] = 3,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 16,["27"] = 18,["28"] = 20,["29"] = 21,["30"] = 23,["31"] = 24,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 25,["37"] = 24,["38"] = 23,["39"] = 24,["41"] = 24,["42"] = 30,["43"] = 31,["44"] = 30,["45"] = 31,["46"] = 31,["47"] = 30,["48"] = 31,["50"] = 31,["51"] = 33,["52"] = 34,["53"] = 33,["54"] = 34,["55"] = 34,["56"] = 33,["57"] = 34,["59"] = 34,["60"] = 36,["61"] = 37,["62"] = 36,["63"] = 37,["64"] = 37,["65"] = 36,["66"] = 37,["68"] = 37,["69"] = 39,["70"] = 40,["71"] = 39,["72"] = 40,["74"] = 40,["75"] = 41,["76"] = 39,["77"] = 43,["78"] = 44,["79"] = 43,["80"] = 46,["81"] = 47,["82"] = 46,["83"] = 49,["84"] = 50,["85"] = 49,["86"] = 52,["87"] = 53,["88"] = 52,["89"] = 55,["90"] = 56,["91"] = 55,["92"] = 58,["93"] = 59,["94"] = 60,["97"] = 61,["98"] = 58,["99"] = 63,["100"] = 64,["103"] = 65,["104"] = 66,["107"] = 67,["108"] = 68,["109"] = 69,["110"] = 69,["111"] = 69,["112"] = 69,["113"] = 70,["114"] = 71,["116"] = 73,["117"] = 74,["119"] = 63,["120"] = 77,["121"] = 78,["122"] = 78,["123"] = 78,["124"] = 78,["125"] = 78,["126"] = 77,["127"] = 84,["128"] = 85,["129"] = 86,["130"] = 87,["131"] = 87,["133"] = 88,["134"] = 88,["136"] = 89,["137"] = 90,["138"] = 90,["139"] = 90,["140"] = 90,["141"] = 84,["142"] = 92,["143"] = 93,["146"] = 94,["147"] = 95,["148"] = 96,["149"] = 97,["152"] = 98,["155"] = 99,["158"] = 100,["161"] = 102,["162"] = 103,["163"] = 104,["164"] = 105,["165"] = 106,["166"] = 110,["167"] = 111,["170"] = 114,["171"] = 115,["172"] = 116,["174"] = 92,["175"] = 119,["176"] = 120,["179"] = 121,["180"] = 122,["181"] = 123,["184"] = 124,["187"] = 125,["188"] = 125,["189"] = 125,["190"] = 125,["193"] = 127,["194"] = 128,["195"] = 129,["198"] = 132,["199"] = 132,["200"] = 132,["201"] = 132,["202"] = 132,["203"] = 132,["204"] = 133,["205"] = 134,["207"] = 119,["208"] = 40,["209"] = 39,["210"] = 40,["212"] = 40,["213"] = 139,["214"] = 140,["215"] = 139,["216"] = 140,["218"] = 140,["219"] = 141,["220"] = 142,["221"] = 139,["222"] = 144,["223"] = 145,["224"] = 145,["225"] = 145,["226"] = 145,["227"] = 144,["228"] = 147,["229"] = 148,["232"] = 149,["233"] = 150,["234"] = 151,["235"] = 152,["236"] = 153,["237"] = 154,["239"] = 156,["240"] = 158,["241"] = 159,["242"] = 160,["243"] = 162,["244"] = 163,["245"] = 163,["246"] = 163,["247"] = 163,["248"] = 163,["249"] = 163,["250"] = 163,["251"] = 163,["252"] = 163,["253"] = 163,["254"] = 163,["255"] = 163,["256"] = 163,["257"] = 163,["258"] = 163,["259"] = 163,["260"] = 163,["261"] = 180,["262"] = 147,["263"] = 182,["264"] = 187,["265"] = 187,["267"] = 188,["268"] = 189,["269"] = 190,["270"] = 191,["272"] = 193,["273"] = 194,["274"] = 195,["275"] = 195,["277"] = 196,["278"] = 196,["280"] = 198,["281"] = 199,["282"] = 200,["283"] = 201,["284"] = 203,["285"] = 204,["286"] = 204,["287"] = 204,["288"] = 204,["289"] = 204,["290"] = 204,["291"] = 204,["292"] = 204,["293"] = 204,["294"] = 205,["295"] = 207,["296"] = 208,["297"] = 209,["299"] = 211,["300"] = 182,["301"] = 140,["302"] = 139,["303"] = 140,["305"] = 140,["306"] = 215,["307"] = 216,["308"] = 215,["309"] = 216,["311"] = 216,["312"] = 217,["313"] = 215,["314"] = 219,["315"] = 220,["316"] = 220,["317"] = 220,["318"] = 220,["319"] = 219,["320"] = 222,["321"] = 223,["324"] = 224,["325"] = 225,["326"] = 225,["327"] = 225,["328"] = 225,["329"] = 226,["330"] = 227,["331"] = 228,["332"] = 230,["333"] = 230,["334"] = 230,["335"] = 230,["336"] = 231,["337"] = 232,["338"] = 233,["339"] = 234,["342"] = 238,["343"] = 239,["344"] = 239,["345"] = 239,["346"] = 239,["347"] = 239,["348"] = 239,["349"] = 239,["350"] = 239,["351"] = 240,["352"] = 241,["353"] = 241,["354"] = 241,["355"] = 241,["356"] = 242,["357"] = 243,["358"] = 244,["359"] = 245,["360"] = 246,["361"] = 246,["363"] = 222,["364"] = 216,["365"] = 215,["366"] = 216,["368"] = 216,["369"] = 251,["370"] = 252,["371"] = 251,["372"] = 252,["374"] = 252,["375"] = 253,["376"] = 254,["377"] = 255,["378"] = 256,["379"] = 251,["380"] = 258,["381"] = 259,["382"] = 258,["383"] = 261,["384"] = 262,["385"] = 261,["386"] = 264,["387"] = 265,["388"] = 266,["389"] = 267,["390"] = 268,["391"] = 269,["392"] = 270,["393"] = 271,["394"] = 272,["395"] = 273,["396"] = 274,["398"] = 276,["401"] = 277,["402"] = 264,["403"] = 279,["404"] = 280,["407"] = 281,["408"] = 282,["409"] = 283,["410"] = 284,["413"] = 286,["414"] = 286,["415"] = 286,["416"] = 286,["417"] = 286,["418"] = 286,["419"] = 287,["422"] = 289,["423"] = 290,["424"] = 291,["425"] = 292,["429"] = 296,["432"] = 298,["433"] = 299,["434"] = 299,["435"] = 299,["436"] = 299,["437"] = 299,["438"] = 299,["439"] = 299,["440"] = 299,["441"] = 307,["442"] = 307,["443"] = 307,["444"] = 307,["445"] = 307,["446"] = 307,["447"] = 307,["448"] = 307,["449"] = 307,["450"] = 279,["451"] = 252,["452"] = 251,["453"] = 252,["455"] = 252});
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
____exports.evo_veno_hive_glands = __TS__Class()
local evo_veno_hive_glands = ____exports.evo_veno_hive_glands
evo_veno_hive_glands.name = "evo_veno_hive_glands"
__TS__ClassExtends(evo_veno_hive_glands, ____exports.evo_veno_glands)
evo_veno_hive_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_glands")},
    evo_veno_hive_glands
)
____exports.evo_veno_hive_glands = evo_veno_hive_glands
____exports.evo_veno_symbiont_glands = __TS__Class()
local evo_veno_symbiont_glands = ____exports.evo_veno_symbiont_glands
evo_veno_symbiont_glands.name = "evo_veno_symbiont_glands"
__TS__ClassExtends(evo_veno_symbiont_glands, ____exports.evo_veno_glands)
evo_veno_symbiont_glands = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_glands")},
    evo_veno_symbiont_glands
)
____exports.evo_veno_symbiont_glands = evo_veno_symbiont_glands
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
    if ab:GetAbilityName() ~= "evo_veno_hive_glands" then
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
