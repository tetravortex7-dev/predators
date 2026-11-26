local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 148,["12"] = 1,["13"] = 2,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 8,["19"] = 9,["20"] = 10,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 16,["25"] = 148,["26"] = 149,["27"] = 149,["28"] = 149,["29"] = 149,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 24,["36"] = 25,["37"] = 24,["38"] = 25,["40"] = 25,["41"] = 26,["42"] = 27,["43"] = 28,["44"] = 29,["45"] = 24,["46"] = 31,["47"] = 32,["48"] = 31,["49"] = 34,["50"] = 35,["53"] = 36,["54"] = 37,["55"] = 38,["56"] = 39,["57"] = 40,["58"] = 41,["60"] = 43,["61"] = 45,["62"] = 46,["63"] = 47,["64"] = 48,["65"] = 49,["66"] = 50,["67"] = 52,["68"] = 53,["69"] = 55,["71"] = 57,["72"] = 57,["73"] = 58,["74"] = 59,["75"] = 60,["76"] = 61,["77"] = 62,["78"] = 64,["79"] = 64,["80"] = 64,["81"] = 64,["82"] = 64,["83"] = 64,["84"] = 64,["85"] = 64,["86"] = 64,["87"] = 64,["88"] = 64,["89"] = 64,["90"] = 64,["91"] = 64,["92"] = 64,["93"] = 64,["94"] = 64,["95"] = 81,["96"] = 82,["97"] = 57,["100"] = 85,["101"] = 86,["102"] = 87,["103"] = 88,["104"] = 89,["105"] = 90,["106"] = 90,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 90,["113"] = 90,["115"] = 34,["116"] = 102,["117"] = 107,["118"] = 107,["120"] = 108,["121"] = 109,["122"] = 110,["123"] = 111,["125"] = 114,["126"] = 115,["127"] = 116,["128"] = 116,["130"] = 117,["131"] = 117,["133"] = 119,["134"] = 120,["135"] = 121,["136"] = 122,["137"] = 122,["139"] = 123,["140"] = 125,["141"] = 126,["142"] = 127,["143"] = 129,["144"] = 130,["145"] = 132,["146"] = 132,["147"] = 132,["148"] = 132,["149"] = 132,["150"] = 132,["151"] = 132,["152"] = 132,["153"] = 132,["154"] = 133,["155"] = 134,["156"] = 134,["157"] = 134,["158"] = 134,["159"] = 134,["160"] = 134,["161"] = 138,["162"] = 139,["163"] = 139,["164"] = 139,["165"] = 139,["166"] = 139,["167"] = 139,["168"] = 139,["169"] = 139,["170"] = 139,["171"] = 139,["172"] = 140,["173"] = 140,["174"] = 140,["175"] = 140,["176"] = 140,["177"] = 140,["179"] = 144,["180"] = 102,["181"] = 25,["182"] = 24,["183"] = 25,["185"] = 25,["186"] = 152,["187"] = 153,["188"] = 152,["189"] = 153,["190"] = 154,["191"] = 155,["192"] = 154,["193"] = 157,["194"] = 158,["195"] = 157,["196"] = 160,["197"] = 161,["198"] = 160,["199"] = 163,["200"] = 164,["201"] = 163,["202"] = 166,["203"] = 167,["204"] = 166,["205"] = 169,["206"] = 170,["207"] = 169,["208"] = 172,["209"] = 173,["210"] = 172,["211"] = 175,["212"] = 176,["215"] = 177,["216"] = 177,["217"] = 177,["218"] = 177,["219"] = 177,["220"] = 182,["221"] = 182,["222"] = 182,["223"] = 182,["224"] = 182,["225"] = 183,["226"] = 183,["227"] = 183,["228"] = 183,["229"] = 183,["230"] = 183,["231"] = 183,["232"] = 183,["233"] = 175,["234"] = 153,["235"] = 152,["236"] = 153,["238"] = 153,["239"] = 187,["240"] = 188,["241"] = 187,["242"] = 188,["244"] = 188,["245"] = 189,["246"] = 187,["247"] = 190,["248"] = 191,["249"] = 190,["250"] = 193,["251"] = 194,["252"] = 193,["253"] = 196,["254"] = 197,["255"] = 196,["256"] = 199,["257"] = 200,["258"] = 199,["259"] = 202,["260"] = 203,["261"] = 204,["262"] = 205,["263"] = 206,["264"] = 207,["265"] = 207,["268"] = 202,["269"] = 210,["270"] = 211,["271"] = 210,["272"] = 213,["273"] = 214,["274"] = 213,["275"] = 188,["276"] = 187,["277"] = 188,["279"] = 188,["280"] = 218,["281"] = 219,["282"] = 218,["283"] = 219,["284"] = 220,["285"] = 221,["286"] = 221,["287"] = 221,["288"] = 221,["289"] = 220,["290"] = 223,["291"] = 224,["294"] = 225,["295"] = 226,["296"] = 227,["297"] = 228,["298"] = 229,["299"] = 233,["300"] = 234,["302"] = 223,["303"] = 219,["304"] = 218,["305"] = 219,["307"] = 219,["308"] = 239,["309"] = 240,["310"] = 239,["311"] = 240,["313"] = 240,["314"] = 241,["315"] = 242,["316"] = 243,["317"] = 239,["318"] = 245,["319"] = 246,["320"] = 245,["321"] = 248,["322"] = 249,["323"] = 248,["324"] = 251,["325"] = 252,["326"] = 251,["327"] = 254,["328"] = 255,["329"] = 254,["330"] = 257,["331"] = 258,["332"] = 259,["333"] = 260,["334"] = 261,["335"] = 262,["336"] = 263,["337"] = 264,["338"] = 265,["339"] = 266,["341"] = 268,["342"] = 269,["344"] = 257,["345"] = 272,["346"] = 273,["347"] = 272,["348"] = 275,["349"] = 276,["350"] = 276,["351"] = 276,["352"] = 276,["353"] = 276,["354"] = 276,["355"] = 276,["356"] = 275,["357"] = 284,["358"] = 285,["359"] = 284,["360"] = 287,["361"] = 288,["362"] = 287,["363"] = 290,["364"] = 291,["365"] = 290,["366"] = 293,["367"] = 294,["368"] = 295,["369"] = 296,["372"] = 297,["373"] = 298,["374"] = 299,["375"] = 300,["376"] = 301,["377"] = 302,["378"] = 302,["381"] = 304,["382"] = 305,["383"] = 305,["385"] = 293,["386"] = 307,["387"] = 308,["390"] = 309,["391"] = 310,["394"] = 311,["395"] = 307,["396"] = 313,["397"] = 314,["400"] = 315,["401"] = 316,["402"] = 317,["403"] = 318,["406"] = 319,["409"] = 320,["412"] = 322,["413"] = 323,["414"] = 324,["415"] = 325,["416"] = 326,["417"] = 327,["418"] = 328,["419"] = 329,["420"] = 330,["421"] = 330,["422"] = 330,["423"] = 330,["424"] = 330,["425"] = 330,["426"] = 330,["430"] = 341,["431"] = 342,["432"] = 343,["433"] = 344,["434"] = 345,["435"] = 346,["436"] = 347,["437"] = 347,["438"] = 347,["439"] = 347,["440"] = 347,["441"] = 347,["442"] = 347,["443"] = 354,["444"] = 354,["447"] = 356,["448"] = 357,["451"] = 361,["452"] = 362,["453"] = 363,["455"] = 313,["456"] = 240,["457"] = 239,["458"] = 240,["460"] = 240});
local ____exports = {}
local getSpectreSafeCastCount
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_veno_shared = require("abilities.veno.evo_veno_shared")
local applyVenoChitinShard = ____evo_veno_shared.applyVenoChitinShard
local applyVenoCreepDamage = ____evo_veno_shared.applyVenoCreepDamage
local getVenoAgi = ____evo_veno_shared.getVenoAgi
local getVenoBranchMaxLevel = ____evo_veno_shared.getVenoBranchMaxLevel
local getVenoTier = ____evo_veno_shared.getVenoTier
require("abilities.veno.evo_veno_debuffs")
function getSpectreSafeCastCount(self, ab)
    return getVenoBranchMaxLevel(
        nil,
        ab:GetCaster()
    )
end
local SCRIPT_PATH = "abilities/veno/evo_veno_needle"
LinkLuaModifier("modifier_evo_veno_needle_q_trail", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_needle_q_trail_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_needle_w", SCRIPT_PATH, 0)
____exports.evo_veno_needle_q = __TS__Class()
local evo_veno_needle_q = ____exports.evo_veno_needle_q
evo_veno_needle_q.name = "evo_veno_needle_q"
__TS__ClassExtends(evo_veno_needle_q, BaseAbility)
function evo_veno_needle_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.hitCounts = {}
    self.hitByProj = {}
    self.castOriginByProj = {}
    self.castSerial = 0
end
function evo_veno_needle_q.prototype.GetMaxLevel(self)
    return getSpectreSafeCastCount(nil, self)
end
function evo_veno_needle_q.prototype.OnSpellStart(self)
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
    local tier = getVenoTier(nil, caster)
    local range = self:GetSpecialValueFor("range")
    local width = self:GetSpecialValueFor("width")
    local speed = self:GetSpecialValueFor("speed")
    local count = self:GetSpecialValueFor("needle_count")
    local coneDeg = 65
    self.castSerial = self.castSerial + 1
    local serial = self.castSerial
    caster:EmitSound("Hero_Venomancer.VenomousGale")
    do
        local i = 0
        while i < count do
            local frac = count > 1 and i / (count - 1) - 0.5 or 0
            local angleRad = frac * coneDeg * math.pi / 180
            local cos = math.cos(angleRad)
            local sin = math.sin(angleRad)
            local rotDir = Vector(dir.x * cos - dir.y * sin, dir.x * sin + dir.y * cos, 0):Normalized()
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
                vVelocity = rotDir * speed,
                bProvidesVision = i == math.floor(count / 2),
                iVisionRadius = 180,
                iVisionTeamNumber = caster:GetTeamNumber()
            })
            self.hitByProj[projId] = __TS__New(Set)
            self.castOriginByProj[projId] = serial
            i = i + 1
        end
    end
    if tier >= 4 then
        local dashDist = self:GetSpecialValueFor("dash_back")
        local trailDur = self:GetSpecialValueFor("trail_duration")
        local backPos = GetGroundPosition(origin - dir * dashDist, caster)
        FindClearSpaceForUnit(caster, backPos, true)
        CreateModifierThinker(
            caster,
            self,
            "modifier_evo_veno_needle_q_trail",
            {duration = trailDur},
            GetGroundPosition(origin + dir * 180, caster),
            caster:GetTeamNumber(),
            false
        )
    end
end
function evo_veno_needle_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.hitByProj, projectileHandle)
        __TS__Delete(self.castOriginByProj, projectileHandle)
        return false
    end
    local projSet = self.hitByProj[projectileHandle]
    local eIdx = target:GetEntityIndex()
    if projSet ~= nil and projSet:has(eIdx) then
        return false
    end
    if projSet ~= nil then
        projSet:add(eIdx)
    end
    local serial = self.castOriginByProj[projectileHandle] or 0
    local compositeKey = serial * 100000 + eIdx
    local hitsSoFar = self.hitCounts[compositeKey] or 0
    if hitsSoFar >= 2 then
        return false
    end
    self.hitCounts[compositeKey] = hitsSoFar + 1
    local caster = self:GetCaster()
    local tier = getVenoTier(nil, caster)
    local fullDmg = self:GetSpecialValueFor("base_damage") + getVenoAgi(nil, caster) * self:GetSpecialValueFor("agi_pct") / 100
    local dmg = hitsSoFar == 1 and fullDmg * 0.5 or fullDmg
    local creepMult = self:GetSpecialValueFor("creep_mult")
    applyVenoCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        1,
        creepMult
    )
    applyVenoChitinShard(nil, caster, target, self)
    target:AddNewModifier(
        caster,
        self,
        "modifier_evo_veno_needle_q_slow",
        {duration = self:GetSpecialValueFor("slow_duration")}
    )
    if tier >= 3 and hitsSoFar == 0 then
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
        target:AddNewModifier(
            caster,
            self,
            "modifier_evo_veno_needle_heal_cut",
            {duration = self:GetSpecialValueFor("heal_cut_dur")}
        )
    end
    return false
end
evo_veno_needle_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_q")},
    evo_veno_needle_q
)
____exports.evo_veno_needle_q = evo_veno_needle_q
____exports.modifier_evo_veno_needle_q_trail = __TS__Class()
local modifier_evo_veno_needle_q_trail = ____exports.modifier_evo_veno_needle_q_trail
modifier_evo_veno_needle_q_trail.name = "modifier_evo_veno_needle_q_trail"
__TS__ClassExtends(modifier_evo_veno_needle_q_trail, BaseModifier)
function modifier_evo_veno_needle_q_trail.prototype.IsHidden(self)
    return true
end
function modifier_evo_veno_needle_q_trail.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_needle_q_trail.prototype.IsAura(self)
    return true
end
function modifier_evo_veno_needle_q_trail.prototype.GetModifierAura(self)
    return "modifier_evo_veno_needle_q_trail_slow"
end
function modifier_evo_veno_needle_q_trail.prototype.GetAuraRadius(self)
    return 260
end
function modifier_evo_veno_needle_q_trail.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_veno_needle_q_trail.prototype.GetAuraSearchType(self)
    return 1 + 18
end
function modifier_evo_veno_needle_q_trail.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local pfx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_viper/viper_nethertoxin.vpcf",
        1,
        self:GetParent()
    )
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(260, 1, 1)
    )
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
end
modifier_evo_veno_needle_q_trail = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_q_trail")},
    modifier_evo_veno_needle_q_trail
)
____exports.modifier_evo_veno_needle_q_trail = modifier_evo_veno_needle_q_trail
____exports.modifier_evo_veno_needle_q_trail_slow = __TS__Class()
local modifier_evo_veno_needle_q_trail_slow = ____exports.modifier_evo_veno_needle_q_trail_slow
modifier_evo_veno_needle_q_trail_slow.name = "modifier_evo_veno_needle_q_trail_slow"
__TS__ClassExtends(modifier_evo_veno_needle_q_trail_slow, BaseModifier)
function modifier_evo_veno_needle_q_trail_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 30
end
function modifier_evo_veno_needle_q_trail_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_needle_q_trail_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_veno_needle_q_trail_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_needle_q_trail_slow.prototype.GetTexture(self)
    return "venomancer_venomous_gale"
end
function modifier_evo_veno_needle_q_trail_slow.prototype.OnCreated(self)
    self.slowPct = 30
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local v = ab:GetSpecialValueFor("trail_slow_pct")
        if v > 0 then
            self.slowPct = v
        end
    end
end
function modifier_evo_veno_needle_q_trail_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_veno_needle_q_trail_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.slowPct
end
modifier_evo_veno_needle_q_trail_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_q_trail_slow")},
    modifier_evo_veno_needle_q_trail_slow
)
____exports.modifier_evo_veno_needle_q_trail_slow = modifier_evo_veno_needle_q_trail_slow
____exports.evo_veno_needle_w = __TS__Class()
local evo_veno_needle_w = ____exports.evo_veno_needle_w
evo_veno_needle_w.name = "evo_veno_needle_w"
__TS__ClassExtends(evo_veno_needle_w, BaseAbility)
function evo_veno_needle_w.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_needle_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("duration")
    local charges = self:GetSpecialValueFor("charges")
    caster:EmitSound("Hero_Viper.PoisonAttack.Cast")
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_veno_needle_w", {duration = dur, charges = charges})
    if mod ~= nil then
        mod:SetStackCount(charges)
    end
end
evo_veno_needle_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_w")},
    evo_veno_needle_w
)
____exports.evo_veno_needle_w = evo_veno_needle_w
____exports.modifier_evo_veno_needle_w = __TS__Class()
local modifier_evo_veno_needle_w = ____exports.modifier_evo_veno_needle_w
modifier_evo_veno_needle_w.name = "modifier_evo_veno_needle_w"
__TS__ClassExtends(modifier_evo_veno_needle_w, BaseModifier)
function modifier_evo_veno_needle_w.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusAs = 40
    self.bonusRange = 75
    self.bonusDmg = 30
end
function modifier_evo_veno_needle_w.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_needle_w.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_needle_w.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_needle_w.prototype.GetTexture(self)
    return "viper_poison_attack"
end
function modifier_evo_veno_needle_w.prototype.OnCreated(self, params)
    self.bonusAs = 40
    self.bonusRange = 75
    self.bonusDmg = 30
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if ab and not ab:IsNull() and parent and not parent:IsNull() then
        self.bonusAs = ab:GetSpecialValueFor("bonus_as")
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
        self.bonusDmg = ab:GetSpecialValueFor("bonus_dmg") + getVenoAgi(nil, parent) * ab:GetSpecialValueFor("agi_pct") / 100
    end
    if IsServer() and params and params.charges ~= nil then
        self:SetStackCount(params.charges)
    end
end
function modifier_evo_veno_needle_w.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_veno_needle_w.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")
    }
end
function modifier_evo_veno_needle_w.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonusAs
end
function modifier_evo_veno_needle_w.prototype.GetModifierAttackRangeBonus(self)
    return self.bonusRange
end
function modifier_evo_veno_needle_w.prototype.GetModifierProcAttack_BonusDamage_Physical(self)
    return self.bonusDmg
end
function modifier_evo_veno_needle_w.prototype.refundCooldown(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() then
        return
    end
    local rem = ab:GetCooldownTimeRemaining()
    if rem > 0 then
        local pct = ab:GetSpecialValueFor("cd_refund_pct") / 100
        ab:EndCooldown()
        local next = rem * (1 - pct)
        if next > 0.05 then
            ab:StartCooldown(next)
        end
    end
    local mana = ab:GetSpecialValueFor("mana_refund")
    if mana > 0 then
        parent:GiveMana(mana)
    end
end
function modifier_evo_veno_needle_w.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent or getVenoTier(nil, parent) < 4 then
        return
    end
    self:refundCooldown()
end
function modifier_evo_veno_needle_w.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    local tier = getVenoTier(nil, parent)
    if tier >= 3 then
        local armor = target:GetPhysicalArmorValue(false)
        if armor > 0 then
            local factor = 0.052 * armor / (0.9 + 0.048 * math.abs(armor))
            local ignoreFrac = tier >= 4 and 0.35 or 0.25
            local pierceBonus = (event.damage + self.bonusDmg) * factor * ignoreFrac
            if pierceBonus > 1 then
                ApplyDamage({
                    victim = target,
                    attacker = parent,
                    ability = ab,
                    damage = pierceBonus,
                    damage_type = 4
                })
            end
        end
    end
    local wasLast = self:GetStackCount() <= 1
    if wasLast then
        local shardMod = target:FindModifierByName("modifier_evo_veno_chitin_shard")
        local shards = shardMod and shardMod:GetStackCount() or 0
        if shards > 0 then
            local perShard = ab:GetSpecialValueFor("detonate_per_shard")
            ApplyDamage({
                victim = target,
                attacker = parent,
                ability = ab,
                damage = shards * perShard,
                damage_type = 1
            })
            if shardMod then
                shardMod:Destroy()
            end
        end
        if tier >= 4 and target:IsRealHero() then
            self:refundCooldown()
        end
    end
    self:DecrementStackCount()
    if self:GetStackCount() <= 0 then
        self:Destroy()
    end
end
modifier_evo_veno_needle_w = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_w")},
    modifier_evo_veno_needle_w
)
____exports.modifier_evo_veno_needle_w = modifier_evo_veno_needle_w
return ____exports
