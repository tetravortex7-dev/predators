local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 20,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 27,["39"] = 26,["40"] = 27,["42"] = 27,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 34,["47"] = 34,["48"] = 33,["49"] = 34,["51"] = 34,["52"] = 36,["53"] = 37,["54"] = 36,["55"] = 37,["56"] = 37,["57"] = 36,["58"] = 37,["60"] = 37,["61"] = 39,["62"] = 40,["63"] = 39,["64"] = 40,["65"] = 40,["66"] = 39,["67"] = 40,["69"] = 40,["70"] = 42,["71"] = 43,["72"] = 48,["73"] = 49,["74"] = 49,["77"] = 51,["78"] = 42,["79"] = 54,["80"] = 55,["81"] = 54,["82"] = 55,["84"] = 55,["85"] = 56,["86"] = 54,["87"] = 57,["88"] = 58,["89"] = 57,["90"] = 60,["91"] = 61,["92"] = 60,["93"] = 63,["94"] = 64,["95"] = 63,["96"] = 66,["97"] = 67,["98"] = 66,["99"] = 69,["100"] = 70,["101"] = 71,["102"] = 72,["103"] = 73,["104"] = 74,["105"] = 74,["108"] = 69,["109"] = 77,["110"] = 78,["111"] = 77,["112"] = 82,["113"] = 83,["114"] = 82,["115"] = 85,["116"] = 86,["117"] = 85,["118"] = 55,["119"] = 54,["120"] = 55,["122"] = 55,["123"] = 90,["124"] = 91,["125"] = 90,["126"] = 91,["127"] = 92,["128"] = 93,["129"] = 92,["130"] = 95,["131"] = 96,["132"] = 95,["133"] = 98,["134"] = 99,["135"] = 98,["136"] = 101,["137"] = 102,["138"] = 101,["139"] = 104,["140"] = 105,["141"] = 104,["142"] = 107,["143"] = 108,["144"] = 109,["146"] = 107,["147"] = 112,["148"] = 113,["149"] = 112,["150"] = 115,["151"] = 116,["154"] = 117,["155"] = 118,["156"] = 119,["159"] = 120,["162"] = 121,["165"] = 122,["168"] = 124,["169"] = 125,["172"] = 126,["173"] = 127,["174"] = 128,["175"] = 129,["176"] = 131,["177"] = 132,["178"] = 132,["179"] = 132,["180"] = 132,["181"] = 132,["182"] = 132,["183"] = 132,["185"] = 140,["186"] = 141,["187"] = 142,["188"] = 143,["189"] = 144,["190"] = 145,["191"] = 146,["192"] = 147,["196"] = 151,["197"] = 152,["198"] = 153,["200"] = 115,["201"] = 91,["202"] = 90,["203"] = 91,["205"] = 91,["206"] = 158,["207"] = 159,["208"] = 158,["209"] = 159,["211"] = 159,["212"] = 160,["213"] = 161,["214"] = 158,["215"] = 163,["216"] = 164,["217"] = 163,["218"] = 166,["219"] = 167,["220"] = 166,["221"] = 169,["222"] = 170,["223"] = 169,["224"] = 172,["225"] = 173,["226"] = 172,["227"] = 175,["228"] = 176,["229"] = 177,["230"] = 178,["231"] = 179,["232"] = 179,["234"] = 180,["235"] = 180,["238"] = 182,["239"] = 175,["240"] = 184,["241"] = 185,["242"] = 186,["243"] = 184,["244"] = 188,["245"] = 189,["246"] = 189,["247"] = 189,["248"] = 189,["249"] = 188,["250"] = 194,["251"] = 195,["252"] = 196,["253"] = 197,["254"] = 198,["256"] = 200,["257"] = 194,["258"] = 202,["259"] = 203,["262"] = 204,["263"] = 205,["264"] = 206,["267"] = 207,["270"] = 208,["273"] = 209,["276"] = 211,["277"] = 212,["280"] = 214,["281"] = 215,["282"] = 216,["285"] = 218,["286"] = 219,["287"] = 220,["288"] = 221,["289"] = 223,["290"] = 224,["292"] = 227,["293"] = 227,["294"] = 227,["295"] = 227,["296"] = 227,["297"] = 227,["298"] = 227,["299"] = 227,["300"] = 227,["301"] = 227,["302"] = 227,["303"] = 238,["304"] = 239,["307"] = 241,["308"] = 242,["309"] = 243,["311"] = 246,["312"] = 246,["313"] = 246,["314"] = 246,["315"] = 246,["316"] = 247,["317"] = 248,["318"] = 249,["319"] = 249,["320"] = 249,["321"] = 249,["322"] = 249,["323"] = 249,["324"] = 249,["325"] = 249,["326"] = 249,["327"] = 249,["328"] = 249,["330"] = 261,["331"] = 262,["332"] = 263,["333"] = 264,["334"] = 265,["335"] = 266,["336"] = 267,["337"] = 268,["338"] = 274,["339"] = 275,["340"] = 276,["342"] = 278,["348"] = 202,["349"] = 159,["350"] = 158,["351"] = 159,["353"] = 159,["354"] = 287,["355"] = 288,["356"] = 287,["357"] = 288,["358"] = 289,["359"] = 290,["360"] = 289,["361"] = 292,["362"] = 293,["365"] = 294,["366"] = 295,["367"] = 296,["370"] = 297,["373"] = 299,["374"] = 300,["375"] = 301,["376"] = 303,["377"] = 304,["378"] = 305,["379"] = 306,["380"] = 307,["381"] = 309,["382"] = 310,["383"] = 311,["384"] = 316,["385"] = 317,["386"] = 318,["387"] = 319,["388"] = 321,["389"] = 321,["390"] = 321,["391"] = 321,["392"] = 321,["393"] = 321,["394"] = 321,["395"] = 329,["396"] = 330,["397"] = 333,["398"] = 334,["399"] = 335,["401"] = 338,["402"] = 339,["403"] = 340,["404"] = 340,["405"] = 340,["406"] = 340,["407"] = 340,["408"] = 340,["410"] = 341,["411"] = 341,["413"] = 342,["414"] = 342,["415"] = 342,["416"] = 342,["417"] = 342,["418"] = 342,["419"] = 342,["420"] = 342,["421"] = 342,["425"] = 292,["426"] = 288,["427"] = 287,["428"] = 288,["430"] = 288});
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
____exports.evo_spectre_phantom_dispersion_t3 = __TS__Class()
local evo_spectre_phantom_dispersion_t3 = ____exports.evo_spectre_phantom_dispersion_t3
evo_spectre_phantom_dispersion_t3.name = "evo_spectre_phantom_dispersion_t3"
__TS__ClassExtends(evo_spectre_phantom_dispersion_t3, ____exports.evo_spectre_dispersion)
evo_spectre_phantom_dispersion_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_dispersion_t3")},
    evo_spectre_phantom_dispersion_t3
)
____exports.evo_spectre_phantom_dispersion_t3 = evo_spectre_phantom_dispersion_t3
____exports.evo_spectre_phantom_dispersion_t4 = __TS__Class()
local evo_spectre_phantom_dispersion_t4 = ____exports.evo_spectre_phantom_dispersion_t4
evo_spectre_phantom_dispersion_t4.name = "evo_spectre_phantom_dispersion_t4"
__TS__ClassExtends(evo_spectre_phantom_dispersion_t4, ____exports.evo_spectre_dispersion)
evo_spectre_phantom_dispersion_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_phantom_dispersion_t4")},
    evo_spectre_phantom_dispersion_t4
)
____exports.evo_spectre_phantom_dispersion_t4 = evo_spectre_phantom_dispersion_t4
local function findPhantomDispersion(self, unit)
    for ____, name in ipairs({"evo_spectre_phantom_dispersion_t4", "evo_spectre_phantom_dispersion_t3", "evo_spectre_phantom_dispersion"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
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
    return "evo_spectre_phantom_dispersion"
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
    return "evo_spectre_phantom_dispersion"
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
    local disp = findPhantomDispersion(nil, parent)
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
    local ability = self:GetAbility()
    if ability and not ability:IsNull() then
        local name = ability:GetAbilityName()
        if name == "evo_spectre_dispersion" then
            return "evo_spectre_dispersion"
        end
        if __TS__StringStartsWith(name, "evo_spectre_phantom_dispersion") then
            return "evo_spectre_phantom_dispersion"
        end
    end
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
    return -ability:GetSpecialValueFor("absorb_pct")
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
    local pct = ability:GetSpecialValueFor("absorb_pct") / 100
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
    local casterPos = caster:GetAbsOrigin()
    local targetPos = target:GetAbsOrigin()
    local dir = targetPos:__sub(casterPos)
    dir.z = 0
    local forward = dir:Length2D() > 1 and dir:Normalized() or caster:GetForwardVector()
    caster:EmitSound("Hero_VoidSpirit.Pulse.Cast")
    target:EmitSound("Hero_VoidSpirit.AstralStep.Target")
    local pfx = ParticleManager:CreateParticle("particles/evo_spectre/evo_spectre_cleave.vpcf", 0, caster)
    ParticleManager:SetParticleControl(pfx, 0, casterPos)
    ParticleManager:SetParticleControlForward(pfx, 0, forward)
    ParticleManager:SetParticleControl(pfx, 2, targetPos)
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
                goto __continue73
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
        ::__continue73::
    end
end
evo_spectre_t1_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_t1_w")},
    evo_spectre_t1_w
)
____exports.evo_spectre_t1_w = evo_spectre_t1_w
return ____exports
