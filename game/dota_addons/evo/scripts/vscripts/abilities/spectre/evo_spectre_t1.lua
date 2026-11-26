local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 19,["28"] = 21,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 27,["33"] = 28,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 29,["39"] = 28,["40"] = 27,["41"] = 28,["43"] = 28,["44"] = 34,["45"] = 35,["46"] = 34,["47"] = 35,["48"] = 35,["49"] = 34,["50"] = 35,["52"] = 35,["53"] = 37,["54"] = 38,["55"] = 37,["56"] = 38,["58"] = 38,["59"] = 39,["60"] = 37,["61"] = 40,["62"] = 41,["63"] = 40,["64"] = 43,["65"] = 44,["66"] = 43,["67"] = 46,["68"] = 47,["69"] = 46,["70"] = 49,["71"] = 50,["72"] = 49,["73"] = 52,["74"] = 53,["75"] = 54,["76"] = 55,["77"] = 56,["78"] = 57,["79"] = 57,["82"] = 52,["83"] = 60,["84"] = 61,["85"] = 60,["86"] = 65,["87"] = 66,["88"] = 65,["89"] = 68,["90"] = 69,["91"] = 68,["92"] = 38,["93"] = 37,["94"] = 38,["96"] = 38,["97"] = 73,["98"] = 74,["99"] = 73,["100"] = 74,["101"] = 75,["102"] = 76,["103"] = 75,["104"] = 78,["105"] = 79,["106"] = 78,["107"] = 81,["108"] = 82,["109"] = 81,["110"] = 84,["111"] = 85,["112"] = 84,["113"] = 87,["114"] = 88,["115"] = 87,["116"] = 90,["117"] = 91,["118"] = 92,["120"] = 90,["121"] = 95,["122"] = 96,["123"] = 95,["124"] = 98,["125"] = 99,["128"] = 100,["129"] = 101,["130"] = 102,["133"] = 103,["136"] = 104,["139"] = 105,["142"] = 107,["143"] = 108,["146"] = 109,["147"] = 110,["148"] = 111,["149"] = 112,["150"] = 114,["151"] = 115,["152"] = 115,["153"] = 115,["154"] = 115,["155"] = 115,["156"] = 115,["157"] = 115,["159"] = 123,["160"] = 124,["161"] = 125,["162"] = 126,["163"] = 127,["164"] = 128,["165"] = 129,["166"] = 130,["170"] = 134,["171"] = 135,["172"] = 136,["174"] = 98,["175"] = 74,["176"] = 73,["177"] = 74,["179"] = 74,["180"] = 141,["181"] = 142,["182"] = 141,["183"] = 142,["185"] = 142,["186"] = 143,["187"] = 144,["188"] = 141,["189"] = 146,["190"] = 147,["191"] = 146,["192"] = 149,["193"] = 150,["194"] = 149,["195"] = 152,["196"] = 153,["197"] = 152,["198"] = 155,["199"] = 156,["200"] = 155,["201"] = 158,["202"] = 159,["203"] = 158,["204"] = 161,["205"] = 162,["206"] = 163,["207"] = 161,["208"] = 165,["209"] = 166,["210"] = 166,["211"] = 166,["212"] = 166,["213"] = 165,["214"] = 171,["215"] = 172,["216"] = 173,["217"] = 174,["218"] = 175,["220"] = 177,["221"] = 178,["222"] = 179,["223"] = 171,["224"] = 181,["225"] = 182,["228"] = 183,["229"] = 184,["230"] = 185,["233"] = 186,["236"] = 187,["239"] = 188,["242"] = 190,["243"] = 191,["244"] = 192,["245"] = 193,["248"] = 195,["249"] = 196,["250"] = 197,["253"] = 199,["254"] = 200,["255"] = 201,["256"] = 202,["257"] = 204,["258"] = 205,["260"] = 208,["261"] = 208,["262"] = 208,["263"] = 208,["264"] = 208,["265"] = 208,["266"] = 208,["267"] = 208,["268"] = 208,["269"] = 208,["270"] = 208,["271"] = 219,["272"] = 220,["275"] = 222,["276"] = 223,["277"] = 224,["279"] = 227,["280"] = 227,["281"] = 227,["282"] = 227,["283"] = 227,["284"] = 228,["285"] = 229,["286"] = 230,["287"] = 230,["288"] = 230,["289"] = 230,["290"] = 230,["291"] = 230,["292"] = 230,["293"] = 230,["294"] = 230,["295"] = 230,["296"] = 230,["298"] = 242,["299"] = 243,["300"] = 244,["301"] = 245,["302"] = 246,["303"] = 247,["304"] = 248,["305"] = 249,["306"] = 255,["307"] = 256,["308"] = 257,["310"] = 259,["316"] = 181,["317"] = 142,["318"] = 141,["319"] = 142,["321"] = 142,["322"] = 268,["323"] = 269,["324"] = 268,["325"] = 269,["327"] = 269,["328"] = 270,["329"] = 268,["330"] = 272,["331"] = 273,["334"] = 274,["335"] = 275,["336"] = 276,["337"] = 277,["338"] = 278,["339"] = 279,["341"] = 281,["342"] = 283,["343"] = 284,["344"] = 285,["345"] = 286,["346"] = 288,["347"] = 289,["348"] = 291,["349"] = 291,["350"] = 291,["351"] = 291,["352"] = 291,["353"] = 291,["354"] = 291,["355"] = 291,["356"] = 291,["357"] = 291,["358"] = 291,["359"] = 291,["360"] = 291,["361"] = 291,["362"] = 291,["363"] = 291,["364"] = 291,["365"] = 308,["366"] = 272,["367"] = 311,["368"] = 316,["369"] = 316,["371"] = 317,["372"] = 318,["373"] = 319,["375"] = 321,["376"] = 322,["377"] = 323,["378"] = 323,["380"] = 324,["381"] = 324,["383"] = 326,["384"] = 327,["385"] = 328,["386"] = 329,["387"] = 331,["388"] = 332,["389"] = 332,["390"] = 332,["391"] = 332,["392"] = 332,["393"] = 332,["394"] = 332,["395"] = 332,["396"] = 332,["397"] = 333,["398"] = 334,["399"] = 311,["400"] = 269,["401"] = 268,["402"] = 269,["404"] = 269,["405"] = 338,["406"] = 339,["407"] = 338,["408"] = 339,["409"] = 340,["410"] = 341,["411"] = 340,["412"] = 343,["413"] = 344,["416"] = 345,["417"] = 346,["418"] = 347,["421"] = 348,["424"] = 350,["425"] = 351,["426"] = 352,["427"] = 354,["428"] = 355,["429"] = 360,["430"] = 362,["431"] = 362,["432"] = 362,["433"] = 362,["434"] = 362,["435"] = 362,["436"] = 362,["437"] = 370,["438"] = 371,["439"] = 374,["440"] = 375,["441"] = 376,["443"] = 379,["444"] = 380,["445"] = 381,["446"] = 381,["447"] = 381,["448"] = 381,["449"] = 381,["450"] = 381,["452"] = 382,["453"] = 382,["455"] = 383,["456"] = 383,["457"] = 383,["458"] = 383,["459"] = 383,["460"] = 383,["461"] = 383,["462"] = 383,["463"] = 383,["467"] = 343,["468"] = 339,["469"] = 338,["470"] = 339,["472"] = 339});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local applyDispersionAroundOrigin = ____evo_spectre_shared.applyDispersionAroundOrigin
local applySpectreCreepDamage = ____evo_spectre_shared.applySpectreCreepDamage
local computeDispersionPct = ____evo_spectre_shared.computeDispersionPct
local detectSpectreBranchAndTier = ____evo_spectre_shared.detectSpectreBranchAndTier
local findNearestSpectrePortal = ____evo_spectre_shared.findNearestSpectrePortal
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreAgi = ____evo_spectre_shared.getSpectreAgi
local getSpectreHighestAttr = ____evo_spectre_shared.getSpectreHighestAttr
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_t1"
LinkLuaModifier("modifier_evo_spectre_dispersion", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_dispersion_haste", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_dispersion_charge", SCRIPT_PATH, 0)
____exports.evo_spectre_dispersion = __TS__Class()
local evo_spectre_dispersion = ____exports.evo_spectre_dispersion
evo_spectre_dispersion.name = "evo_spectre_dispersion"
__TS__ClassExtends(evo_spectre_dispersion, BaseAbility)
function evo_spectre_dispersion.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_spectre_dispersion"
end
evo_spectre_dispersion = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_dispersion")},
    evo_spectre_dispersion
)
____exports.evo_spectre_dispersion = evo_spectre_dispersion
____exports.evo_spectre_phantom_dispersion = __TS__Class()
local evo_spectre_phantom_dispersion = ____exports.evo_spectre_phantom_dispersion
evo_spectre_phantom_dispersion.name = "evo_spectre_phantom_dispersion"
__TS__ClassExtends(evo_spectre_phantom_dispersion, ____exports.evo_spectre_dispersion)
evo_spectre_phantom_dispersion = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_dispersion")},
    evo_spectre_phantom_dispersion
)
____exports.evo_spectre_phantom_dispersion = evo_spectre_phantom_dispersion
____exports.modifier_evo_spectre_dispersion_haste = __TS__Class()
local modifier_evo_spectre_dispersion_haste = ____exports.modifier_evo_spectre_dispersion_haste
modifier_evo_spectre_dispersion_haste.name = "modifier_evo_spectre_dispersion_haste"
__TS__ClassExtends(modifier_evo_spectre_dispersion_haste, BaseModifier)
function modifier_evo_spectre_dispersion_haste.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 15
end
function modifier_evo_spectre_dispersion_haste.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_dispersion_haste.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_dispersion_haste.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_dispersion_haste.prototype.GetTexture(self)
    return "spectre_dispersion"
end
function modifier_evo_spectre_dispersion_haste.prototype.OnCreated(self)
    self.msPct = 15
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local v = ab:GetSpecialValueFor("ms_pct")
        if v > 0 then
            self.msPct = v
        end
    end
end
function modifier_evo_spectre_dispersion_haste.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_spectre_dispersion_haste.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_dispersion_haste.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.msPct
end
modifier_evo_spectre_dispersion_haste = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_dispersion_haste")},
    modifier_evo_spectre_dispersion_haste
)
____exports.modifier_evo_spectre_dispersion_haste = modifier_evo_spectre_dispersion_haste
____exports.modifier_evo_spectre_dispersion_charge = __TS__Class()
local modifier_evo_spectre_dispersion_charge = ____exports.modifier_evo_spectre_dispersion_charge
modifier_evo_spectre_dispersion_charge.name = "modifier_evo_spectre_dispersion_charge"
__TS__ClassExtends(modifier_evo_spectre_dispersion_charge, BaseModifier)
function modifier_evo_spectre_dispersion_charge.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_dispersion_charge.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_dispersion_charge.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_dispersion_charge.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_spectre_dispersion_charge.prototype.GetTexture(self)
    return "spectre_dispersion"
end
function modifier_evo_spectre_dispersion_charge.prototype.OnCreated(self)
    if IsServer() and self:GetStackCount() <= 0 then
        self:SetStackCount(1)
    end
end
function modifier_evo_spectre_dispersion_charge.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_spectre_dispersion_charge.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local target = event.target
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    if self:GetStackCount() <= 0 then
        return
    end
    local disp = parent:FindAbilityByName("evo_spectre_phantom_dispersion")
    if not disp or disp:IsNull() then
        return
    end
    local baseDmg = disp:GetSpecialValueFor("charge_dmg")
    local agiPct = disp:GetSpecialValueFor("charge_agi_pct")
    local bonusDmg = baseDmg + getSpectreAgi(nil, parent) * agiPct / 100
    local cdReduce = disp:GetSpecialValueFor("reality_cd_reduce")
    if bonusDmg > 0 then
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = disp,
            damage = bonusDmg,
            damage_type = 2
        })
    end
    local dAb = parent:FindAbilityByName("evo_spectre_phantom_d")
    if dAb and not dAb:IsNull() and cdReduce > 0 then
        local rem = dAb:GetCooldownTimeRemaining()
        if rem > 0 then
            dAb:EndCooldown()
            local next = rem - cdReduce
            if next > 0.05 then
                dAb:StartCooldown(next)
            end
        end
    end
    self:DecrementStackCount()
    if self:GetStackCount() <= 0 then
        self:Destroy()
    end
end
modifier_evo_spectre_dispersion_charge = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_dispersion_charge")},
    modifier_evo_spectre_dispersion_charge
)
____exports.modifier_evo_spectre_dispersion_charge = modifier_evo_spectre_dispersion_charge
____exports.modifier_evo_spectre_dispersion = __TS__Class()
local modifier_evo_spectre_dispersion = ____exports.modifier_evo_spectre_dispersion
modifier_evo_spectre_dispersion.name = "modifier_evo_spectre_dispersion"
__TS__ClassExtends(modifier_evo_spectre_dispersion, BaseModifier)
function modifier_evo_spectre_dispersion.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.absorbedPool = 0
    self.lastHeroDispersionTime = -999
end
function modifier_evo_spectre_dispersion.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_dispersion.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_dispersion.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_dispersion.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_spectre_dispersion.prototype.GetTexture(self)
    return "spectre_dispersion"
end
function modifier_evo_spectre_dispersion.prototype.OnCreated(self)
    self.absorbedPool = 0
    self.lastHeroDispersionTime = -999
end
function modifier_evo_spectre_dispersion.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_spectre_dispersion.prototype.GetModifierIncomingDamage_Percentage(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    local basePct = ability:GetSpecialValueFor("base_pct")
    local maxPct = ability:GetSpecialValueFor("max_pct")
    return -computeDispersionPct(nil, parent, basePct, maxPct)
end
function modifier_evo_spectre_dispersion.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() or parent:PassivesDisabled() then
        return
    end
    if event.unit ~= parent or event.damage <= 0 then
        return
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return
    end
    if bit.band(event.damage_flags, 32) ~= 0 then
        return
    end
    local basePct = ability:GetSpecialValueFor("base_pct")
    local maxPct = ability:GetSpecialValueFor("max_pct")
    local pct = computeDispersionPct(nil, parent, basePct, maxPct) / 100
    if pct <= 0 then
        return
    end
    local raw = event.original_damage > 0 and event.original_damage or event.damage / math.max(0.1, 1 - pct)
    local blocked = raw * pct
    if blocked <= 0.5 then
        return
    end
    local minRadius = ability:GetSpecialValueFor("min_radius")
    local maxRadius = ability:GetSpecialValueFor("max_radius")
    local dmgType = event.damage_type or 2
    local hitTracker = __TS__New(Set)
    if event.attacker and not event.attacker:IsNull() and event.attacker:IsRealHero() and event.attacker ~= parent then
        self.lastHeroDispersionTime = GameRules:GetGameTime()
    end
    applyDispersionAroundOrigin(
        nil,
        parent,
        ability,
        parent:GetAbsOrigin(),
        blocked,
        dmgType,
        minRadius,
        maxRadius,
        hitTracker
    )
    local info = detectSpectreBranchAndTier(nil, parent)
    if info.branch ~= "PHANTOM" then
        return
    end
    if event.attacker and not event.attacker:IsNull() and event.attacker:IsRealHero() and event.attacker ~= parent then
        local msDur = ability:GetSpecialValueFor("ms_duration")
        parent:AddNewModifier(parent, ability, "modifier_evo_spectre_dispersion_haste", {duration = msDur})
    end
    local portal = findNearestSpectrePortal(
        nil,
        parent,
        parent:GetAbsOrigin()
    )
    if portal then
        local echoRadius = ability:GetSpecialValueFor("portal_echo_radius")
        applyDispersionAroundOrigin(
            nil,
            parent,
            ability,
            portal:GetAbsOrigin(),
            blocked,
            dmgType,
            minRadius,
            math.min(maxRadius, echoRadius),
            hitTracker
        )
    end
    if info.tier >= 3 then
        local threshold = ability:GetSpecialValueFor("charge_threshold")
        local maxCharges = ability:GetSpecialValueFor("max_charges")
        if threshold > 0 and maxCharges > 0 then
            self.absorbedPool = self.absorbedPool + blocked
            while self.absorbedPool >= threshold do
                self.absorbedPool = self.absorbedPool - threshold
                local mod = parent:AddNewModifier(parent, ability, "modifier_evo_spectre_dispersion_charge", {})
                if mod and mod:GetStackCount() < maxCharges then
                    if mod:GetStackCount() == 0 then
                        mod:SetStackCount(1)
                    else
                        mod:IncrementStackCount()
                    end
                end
            end
        end
    end
end
modifier_evo_spectre_dispersion = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_dispersion")},
    modifier_evo_spectre_dispersion
)
____exports.modifier_evo_spectre_dispersion = modifier_evo_spectre_dispersion
____exports.evo_spectre_t1_q = __TS__Class()
local evo_spectre_t1_q = ____exports.evo_spectre_t1_q
evo_spectre_t1_q.name = "evo_spectre_t1_q"
__TS__ClassExtends(evo_spectre_t1_q, BaseAbility)
function evo_spectre_t1_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.hitSets = {}
end
function evo_spectre_t1_q.prototype.OnSpellStart(self)
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
    local pathDur = self:GetSpecialValueFor("path_duration")
    caster:EmitSound("Hero_Spectre.DaggerCast")
    caster:AddNewModifier(caster, self, "modifier_evo_spectre_shadow_path", {duration = pathDur})
    local projId = ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_spectre/spectre_spectral_dagger.vpcf",
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
function evo_spectre_t1_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.hitSets, projectileHandle)
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
    target:EmitSound("Hero_Spectre.DaggerImpact")
    applySpectreCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        2,
        creepMult
    )
    target:AddNewModifier(caster, self, "modifier_evo_spectre_dagger_slow", {duration = slowDur})
    return false
end
evo_spectre_t1_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_t1_q")},
    evo_spectre_t1_q
)
____exports.evo_spectre_t1_q = evo_spectre_t1_q
____exports.evo_spectre_t1_w = __TS__Class()
local evo_spectre_t1_w = ____exports.evo_spectre_t1_w
evo_spectre_t1_w.name = "evo_spectre_t1_w"
__TS__ClassExtends(evo_spectre_t1_w, BaseAbility)
function evo_spectre_t1_w.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("aoe_radius")
end
function evo_spectre_t1_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local physBase = self:GetSpecialValueFor("phys_base")
    local attrPct = self:GetSpecialValueFor("attr_pct")
    local physDmg = physBase + getSpectreHighestAttr(nil, caster) * attrPct / 100
    caster:EmitSound("Hero_Spectre.Desolate")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_desolate.vpcf", 1, target)
    ParticleManager:ReleaseParticleIndex(pfx)
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = physDmg,
        damage_type = 1
    })
    local pureDmg = self:GetSpecialValueFor("pure_base")
    local dispMod = caster:FindModifierByName("modifier_evo_spectre_dispersion")
    local windowSec = self:GetSpecialValueFor("dispersion_window")
    if dispMod and GameRules:GetGameTime() - dispMod.lastHeroDispersionTime <= windowSec then
        pureDmg = pureDmg * (1 + self:GetSpecialValueFor("dispersion_bonus_pct") / 100)
    end
    local radius = self:GetSpecialValueFor("aoe_radius")
    local creepMult = self:GetSpecialValueFor("creep_mult")
    for ____, enemy in ipairs(findSpectreEnemies(
        nil,
        caster,
        target:GetAbsOrigin(),
        radius
    )) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue74
            end
            applySpectreCreepDamage(
                nil,
                caster,
                enemy,
                self,
                pureDmg,
                4,
                creepMult
            )
        end
        ::__continue74::
    end
end
evo_spectre_t1_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_t1_w")},
    evo_spectre_t1_w
)
____exports.evo_spectre_t1_w = evo_spectre_t1_w
return ____exports
