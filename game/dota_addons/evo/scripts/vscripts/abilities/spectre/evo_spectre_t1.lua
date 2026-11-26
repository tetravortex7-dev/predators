local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 18,["26"] = 20,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 26,["31"] = 27,["32"] = 26,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 28,["37"] = 27,["38"] = 26,["39"] = 27,["41"] = 27,["42"] = 33,["43"] = 34,["44"] = 33,["45"] = 34,["46"] = 34,["47"] = 33,["48"] = 34,["50"] = 34,["51"] = 36,["52"] = 37,["53"] = 36,["54"] = 37,["56"] = 37,["57"] = 38,["58"] = 36,["59"] = 39,["60"] = 40,["61"] = 39,["62"] = 42,["63"] = 43,["64"] = 42,["65"] = 45,["66"] = 46,["67"] = 45,["68"] = 48,["69"] = 49,["70"] = 48,["71"] = 51,["72"] = 52,["73"] = 53,["74"] = 54,["75"] = 55,["76"] = 56,["77"] = 56,["80"] = 51,["81"] = 59,["82"] = 60,["83"] = 59,["84"] = 64,["85"] = 65,["86"] = 64,["87"] = 67,["88"] = 68,["89"] = 67,["90"] = 37,["91"] = 36,["92"] = 37,["94"] = 37,["95"] = 72,["96"] = 73,["97"] = 72,["98"] = 73,["99"] = 74,["100"] = 75,["101"] = 74,["102"] = 77,["103"] = 78,["104"] = 77,["105"] = 80,["106"] = 81,["107"] = 80,["108"] = 83,["109"] = 84,["110"] = 83,["111"] = 86,["112"] = 87,["113"] = 86,["114"] = 89,["115"] = 90,["116"] = 91,["118"] = 89,["119"] = 94,["120"] = 95,["121"] = 94,["122"] = 97,["123"] = 98,["126"] = 99,["127"] = 100,["128"] = 101,["131"] = 102,["134"] = 103,["137"] = 104,["140"] = 106,["141"] = 107,["144"] = 108,["145"] = 109,["146"] = 110,["147"] = 111,["148"] = 113,["149"] = 114,["150"] = 114,["151"] = 114,["152"] = 114,["153"] = 114,["154"] = 114,["155"] = 114,["157"] = 122,["158"] = 123,["159"] = 124,["160"] = 125,["161"] = 126,["162"] = 127,["163"] = 128,["164"] = 129,["168"] = 133,["169"] = 134,["170"] = 135,["172"] = 97,["173"] = 73,["174"] = 72,["175"] = 73,["177"] = 73,["178"] = 140,["179"] = 141,["180"] = 140,["181"] = 141,["183"] = 141,["184"] = 142,["185"] = 143,["186"] = 140,["187"] = 145,["188"] = 146,["189"] = 145,["190"] = 148,["191"] = 149,["192"] = 148,["193"] = 151,["194"] = 152,["195"] = 151,["196"] = 154,["197"] = 155,["198"] = 154,["199"] = 157,["200"] = 158,["201"] = 157,["202"] = 160,["203"] = 161,["204"] = 162,["205"] = 160,["206"] = 164,["207"] = 165,["208"] = 165,["209"] = 165,["210"] = 165,["211"] = 164,["212"] = 170,["213"] = 171,["214"] = 172,["215"] = 173,["216"] = 174,["218"] = 176,["219"] = 170,["220"] = 178,["221"] = 179,["224"] = 180,["225"] = 181,["226"] = 182,["229"] = 183,["232"] = 184,["235"] = 185,["238"] = 187,["239"] = 188,["242"] = 190,["243"] = 191,["244"] = 192,["247"] = 194,["248"] = 195,["249"] = 196,["250"] = 197,["251"] = 199,["252"] = 200,["254"] = 203,["255"] = 203,["256"] = 203,["257"] = 203,["258"] = 203,["259"] = 203,["260"] = 203,["261"] = 203,["262"] = 203,["263"] = 203,["264"] = 203,["265"] = 214,["266"] = 215,["269"] = 217,["270"] = 218,["271"] = 219,["273"] = 222,["274"] = 222,["275"] = 222,["276"] = 222,["277"] = 222,["278"] = 223,["279"] = 224,["280"] = 225,["281"] = 225,["282"] = 225,["283"] = 225,["284"] = 225,["285"] = 225,["286"] = 225,["287"] = 225,["288"] = 225,["289"] = 225,["290"] = 225,["292"] = 237,["293"] = 238,["294"] = 239,["295"] = 240,["296"] = 241,["297"] = 242,["298"] = 243,["299"] = 244,["300"] = 250,["301"] = 251,["302"] = 252,["304"] = 254,["310"] = 178,["311"] = 141,["312"] = 140,["313"] = 141,["315"] = 141,["316"] = 263,["317"] = 264,["318"] = 263,["319"] = 264,["320"] = 265,["321"] = 266,["322"] = 265,["323"] = 268,["324"] = 269,["327"] = 270,["328"] = 271,["329"] = 272,["332"] = 273,["335"] = 275,["336"] = 276,["337"] = 277,["338"] = 279,["339"] = 280,["340"] = 281,["341"] = 282,["342"] = 284,["343"] = 285,["344"] = 286,["345"] = 291,["346"] = 292,["347"] = 294,["348"] = 294,["349"] = 294,["350"] = 294,["351"] = 294,["352"] = 294,["353"] = 294,["354"] = 302,["355"] = 303,["356"] = 306,["357"] = 307,["358"] = 308,["360"] = 311,["361"] = 312,["362"] = 313,["363"] = 313,["364"] = 313,["365"] = 313,["366"] = 313,["367"] = 313,["369"] = 314,["370"] = 314,["372"] = 315,["373"] = 315,["374"] = 315,["375"] = 315,["376"] = 315,["377"] = 315,["378"] = 315,["379"] = 315,["380"] = 315,["384"] = 268,["385"] = 264,["386"] = 263,["387"] = 264,["389"] = 264});
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
    local targetPos = target:GetAbsOrigin()
    local dir = targetPos:__sub(caster:GetAbsOrigin())
    dir.z = 0
    local forward = dir:Length2D() > 1 and dir:Normalized() or caster:GetForwardVector()
    caster:EmitSound("Hero_VoidSpirit.Pulse.Cast")
    target:EmitSound("Hero_VoidSpirit.AstralStep.Target")
    local pfx = ParticleManager:CreateParticle("particles/evo_spectre/evo_spectre_void_surge.vpcf", 1, target)
    ParticleManager:SetParticleControlForward(pfx, 0, forward)
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
                goto __continue66
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
        ::__continue66::
    end
end
evo_spectre_t1_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_t1_w")},
    evo_spectre_t1_w
)
____exports.evo_spectre_t1_w = evo_spectre_t1_w
return ____exports
