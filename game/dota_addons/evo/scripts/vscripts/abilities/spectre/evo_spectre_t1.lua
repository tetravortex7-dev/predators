local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 19,["28"] = 21,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 27,["33"] = 28,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 29,["39"] = 28,["40"] = 27,["41"] = 28,["43"] = 28,["44"] = 34,["45"] = 35,["46"] = 34,["47"] = 35,["48"] = 35,["49"] = 34,["50"] = 35,["52"] = 35,["53"] = 37,["54"] = 38,["55"] = 37,["56"] = 38,["57"] = 38,["58"] = 37,["59"] = 38,["61"] = 38,["62"] = 40,["63"] = 41,["64"] = 40,["65"] = 41,["66"] = 41,["67"] = 40,["68"] = 41,["70"] = 41,["71"] = 43,["72"] = 44,["73"] = 49,["74"] = 50,["75"] = 50,["78"] = 52,["79"] = 43,["80"] = 55,["81"] = 56,["82"] = 55,["83"] = 56,["85"] = 56,["86"] = 57,["87"] = 55,["88"] = 58,["89"] = 59,["90"] = 58,["91"] = 61,["92"] = 62,["93"] = 61,["94"] = 64,["95"] = 65,["96"] = 64,["97"] = 67,["98"] = 68,["99"] = 67,["100"] = 70,["101"] = 71,["102"] = 72,["103"] = 73,["104"] = 74,["105"] = 75,["106"] = 75,["109"] = 70,["110"] = 78,["111"] = 79,["112"] = 78,["113"] = 83,["114"] = 84,["115"] = 83,["116"] = 86,["117"] = 87,["118"] = 86,["119"] = 56,["120"] = 55,["121"] = 56,["123"] = 56,["124"] = 91,["125"] = 92,["126"] = 91,["127"] = 92,["128"] = 93,["129"] = 94,["130"] = 93,["131"] = 96,["132"] = 97,["133"] = 96,["134"] = 99,["135"] = 100,["136"] = 99,["137"] = 102,["138"] = 103,["139"] = 102,["140"] = 105,["141"] = 106,["142"] = 105,["143"] = 108,["144"] = 109,["145"] = 110,["147"] = 108,["148"] = 113,["149"] = 114,["150"] = 113,["151"] = 116,["152"] = 117,["155"] = 118,["156"] = 119,["157"] = 120,["160"] = 121,["163"] = 122,["166"] = 123,["169"] = 125,["170"] = 126,["173"] = 127,["174"] = 128,["175"] = 129,["176"] = 130,["177"] = 132,["178"] = 133,["179"] = 133,["180"] = 133,["181"] = 133,["182"] = 133,["183"] = 133,["184"] = 133,["186"] = 141,["187"] = 142,["188"] = 143,["189"] = 144,["190"] = 145,["191"] = 146,["192"] = 147,["193"] = 148,["197"] = 152,["198"] = 153,["199"] = 154,["201"] = 116,["202"] = 92,["203"] = 91,["204"] = 92,["206"] = 92,["207"] = 159,["208"] = 160,["209"] = 159,["210"] = 160,["212"] = 160,["213"] = 161,["214"] = 162,["215"] = 159,["216"] = 164,["217"] = 165,["218"] = 164,["219"] = 167,["220"] = 168,["221"] = 167,["222"] = 170,["223"] = 171,["224"] = 170,["225"] = 173,["226"] = 174,["227"] = 173,["228"] = 176,["229"] = 177,["230"] = 178,["231"] = 179,["232"] = 180,["233"] = 180,["235"] = 181,["236"] = 181,["239"] = 183,["240"] = 176,["241"] = 185,["242"] = 186,["243"] = 187,["244"] = 185,["245"] = 189,["246"] = 190,["247"] = 190,["248"] = 190,["249"] = 190,["250"] = 189,["251"] = 195,["252"] = 196,["253"] = 197,["254"] = 198,["255"] = 199,["257"] = 201,["258"] = 195,["259"] = 203,["260"] = 204,["263"] = 205,["264"] = 206,["265"] = 207,["268"] = 208,["271"] = 209,["274"] = 210,["277"] = 212,["278"] = 213,["281"] = 215,["282"] = 216,["283"] = 217,["286"] = 219,["287"] = 220,["288"] = 221,["289"] = 222,["290"] = 224,["291"] = 225,["293"] = 228,["294"] = 228,["295"] = 228,["296"] = 228,["297"] = 228,["298"] = 228,["299"] = 228,["300"] = 228,["301"] = 228,["302"] = 228,["303"] = 228,["304"] = 239,["305"] = 240,["308"] = 242,["309"] = 243,["310"] = 244,["312"] = 247,["313"] = 247,["314"] = 247,["315"] = 247,["316"] = 247,["317"] = 248,["318"] = 249,["319"] = 250,["320"] = 250,["321"] = 250,["322"] = 250,["323"] = 250,["324"] = 250,["325"] = 250,["326"] = 250,["327"] = 250,["328"] = 250,["329"] = 250,["331"] = 262,["332"] = 263,["333"] = 264,["334"] = 265,["335"] = 266,["336"] = 267,["337"] = 268,["338"] = 269,["339"] = 275,["340"] = 276,["341"] = 277,["343"] = 279,["349"] = 203,["350"] = 160,["351"] = 159,["352"] = 160,["354"] = 160,["355"] = 288,["356"] = 289,["357"] = 288,["358"] = 289,["359"] = 290,["360"] = 291,["361"] = 290,["362"] = 293,["363"] = 294,["366"] = 295,["367"] = 296,["368"] = 297,["371"] = 298,["374"] = 300,["375"] = 301,["376"] = 302,["377"] = 304,["378"] = 305,["379"] = 306,["380"] = 307,["381"] = 308,["382"] = 310,["383"] = 311,["384"] = 312,["385"] = 317,["386"] = 318,["387"] = 319,["388"] = 320,["389"] = 322,["390"] = 322,["391"] = 322,["392"] = 322,["393"] = 322,["394"] = 322,["395"] = 322,["396"] = 330,["397"] = 331,["398"] = 334,["399"] = 335,["400"] = 336,["402"] = 339,["403"] = 340,["404"] = 341,["405"] = 341,["406"] = 341,["407"] = 341,["408"] = 341,["409"] = 341,["411"] = 342,["412"] = 342,["414"] = 343,["415"] = 343,["416"] = 343,["417"] = 343,["418"] = 343,["419"] = 343,["420"] = 343,["421"] = 343,["422"] = 343,["426"] = 293,["427"] = 289,["428"] = 288,["429"] = 289,["431"] = 289});
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
local findPhantomDAbility = ____evo_spectre_shared.findPhantomDAbility
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
    local dAb = findPhantomDAbility(nil, parent)
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
