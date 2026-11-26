local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 18,["25"] = 20,["26"] = 21,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 26,["31"] = 27,["32"] = 26,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 28,["40"] = 31,["41"] = 32,["42"] = 31,["43"] = 27,["44"] = 26,["45"] = 27,["47"] = 27,["48"] = 36,["49"] = 37,["50"] = 36,["51"] = 37,["53"] = 37,["54"] = 38,["55"] = 39,["56"] = 40,["57"] = 41,["58"] = 36,["59"] = 43,["60"] = 44,["61"] = 43,["62"] = 46,["63"] = 47,["64"] = 46,["65"] = 49,["66"] = 50,["67"] = 49,["68"] = 52,["69"] = 53,["70"] = 54,["71"] = 55,["72"] = 56,["73"] = 52,["74"] = 58,["75"] = 59,["76"] = 58,["77"] = 61,["78"] = 62,["79"] = 62,["81"] = 63,["82"] = 64,["83"] = 65,["84"] = 65,["86"] = 66,["87"] = 66,["89"] = 67,["90"] = 67,["92"] = 69,["93"] = 70,["95"] = 73,["96"] = 74,["97"] = 75,["98"] = 76,["99"] = 77,["100"] = 79,["101"] = 80,["102"] = 82,["103"] = 83,["104"] = 84,["105"] = 85,["106"] = 86,["107"] = 87,["108"] = 88,["109"] = 89,["110"] = 93,["111"] = 94,["113"] = 97,["114"] = 98,["115"] = 99,["117"] = 101,["118"] = 61,["119"] = 103,["120"] = 109,["121"] = 110,["122"] = 111,["123"] = 112,["124"] = 113,["125"] = 114,["126"] = 115,["129"] = 118,["130"] = 119,["131"] = 120,["132"] = 121,["133"] = 122,["134"] = 123,["135"] = 124,["136"] = 125,["137"] = 126,["138"] = 126,["139"] = 126,["140"] = 126,["141"] = 126,["142"] = 126,["143"] = 126,["144"] = 126,["145"] = 134,["149"] = 103,["150"] = 139,["151"] = 140,["154"] = 141,["155"] = 142,["156"] = 142,["157"] = 142,["158"] = 142,["159"] = 143,["160"] = 144,["161"] = 145,["163"] = 139,["164"] = 37,["165"] = 36,["166"] = 37,["168"] = 37,["169"] = 150,["170"] = 151,["171"] = 150,["172"] = 151,["173"] = 152,["174"] = 153,["175"] = 152,["176"] = 155,["177"] = 156,["178"] = 155,["179"] = 158,["180"] = 159,["181"] = 158,["182"] = 161,["183"] = 162,["184"] = 161,["185"] = 164,["186"] = 165,["187"] = 165,["188"] = 165,["189"] = 165,["190"] = 164,["191"] = 170,["192"] = 171,["193"] = 170,["194"] = 173,["195"] = 174,["196"] = 173,["197"] = 151,["198"] = 150,["199"] = 151,["201"] = 151,["202"] = 178,["203"] = 179,["204"] = 178,["205"] = 179,["206"] = 180,["207"] = 181,["208"] = 180,["209"] = 183,["210"] = 184,["211"] = 183,["212"] = 186,["213"] = 187,["214"] = 186,["215"] = 189,["216"] = 190,["217"] = 189,["218"] = 192,["219"] = 193,["220"] = 192,["221"] = 195,["222"] = 196,["223"] = 195,["224"] = 179,["225"] = 178,["226"] = 179,["228"] = 179,["229"] = 200,["230"] = 201,["231"] = 200,["232"] = 201,["233"] = 202,["234"] = 203,["237"] = 204,["238"] = 205,["239"] = 207,["240"] = 208,["241"] = 209,["242"] = 210,["243"] = 211,["246"] = 215,["247"] = 216,["248"] = 202,["249"] = 201,["250"] = 200,["251"] = 201,["253"] = 201,["254"] = 220,["255"] = 221,["256"] = 220,["257"] = 221,["259"] = 221,["260"] = 222,["261"] = 223,["262"] = 220,["263"] = 225,["264"] = 226,["265"] = 225,["266"] = 228,["267"] = 229,["268"] = 228,["269"] = 231,["270"] = 232,["271"] = 231,["272"] = 234,["273"] = 235,["274"] = 234,["275"] = 237,["276"] = 238,["277"] = 237,["278"] = 240,["279"] = 241,["280"] = 240,["281"] = 243,["282"] = 244,["283"] = 243,["284"] = 246,["285"] = 247,["286"] = 246,["287"] = 249,["288"] = 250,["289"] = 249,["290"] = 252,["291"] = 253,["292"] = 254,["293"] = 255,["294"] = 256,["295"] = 257,["297"] = 259,["300"] = 260,["301"] = 261,["302"] = 262,["303"] = 252,["304"] = 264,["305"] = 265,["308"] = 266,["309"] = 267,["310"] = 268,["311"] = 269,["312"] = 270,["314"] = 264,["315"] = 273,["316"] = 274,["317"] = 275,["318"] = 276,["321"] = 277,["322"] = 278,["323"] = 280,["324"] = 285,["325"] = 285,["326"] = 285,["327"] = 285,["328"] = 285,["329"] = 286,["330"] = 288,["331"] = 289,["332"] = 289,["333"] = 289,["334"] = 289,["335"] = 289,["336"] = 289,["337"] = 289,["338"] = 296,["339"] = 297,["340"] = 298,["341"] = 298,["342"] = 298,["343"] = 298,["344"] = 298,["345"] = 298,["346"] = 298,["347"] = 298,["348"] = 298,["350"] = 273,["351"] = 221,["352"] = 220,["353"] = 221,["355"] = 221,["356"] = 303,["357"] = 304,["358"] = 303,["359"] = 304,["360"] = 305,["361"] = 306,["362"] = 305,["363"] = 308,["364"] = 309,["365"] = 308,["366"] = 311,["367"] = 312,["368"] = 311,["369"] = 314,["370"] = 315,["371"] = 314,["372"] = 317,["373"] = 318,["374"] = 317,["375"] = 320,["376"] = 321,["377"] = 320,["378"] = 304,["379"] = 303,["380"] = 304,["382"] = 304});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local addLivingChitinStacks = ____evo_nyx_shared.addLivingChitinStacks
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getNyxBranchMaxLevel = ____evo_nyx_shared.getNyxBranchMaxLevel
local getNyxStr = ____evo_nyx_shared.getNyxStr
local getNyxTier = ____evo_nyx_shared.getNyxTier
local isNyxBurrowed = ____evo_nyx_shared.isNyxBurrowed
local knockbackUnitFrom = ____evo_nyx_shared.knockbackUnitFrom
local SCRIPT_PATH = "abilities/nyx/evo_nyx_scarab_er"
LinkLuaModifier("modifier_evo_nyx_scarab_e", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_scarab_e_hardening", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_scarab_e_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_scarab_r_aura", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_scarab_r_slow", SCRIPT_PATH, 0)
____exports.evo_nyx_scarab_e = __TS__Class()
local evo_nyx_scarab_e = ____exports.evo_nyx_scarab_e
evo_nyx_scarab_e.name = "evo_nyx_scarab_e"
__TS__ClassExtends(evo_nyx_scarab_e, BaseAbility)
function evo_nyx_scarab_e.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_scarab_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_scarab_e"
end
evo_nyx_scarab_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_scarab_e")},
    evo_nyx_scarab_e
)
____exports.evo_nyx_scarab_e = evo_nyx_scarab_e
____exports.modifier_evo_nyx_scarab_e = __TS__Class()
local modifier_evo_nyx_scarab_e = ____exports.modifier_evo_nyx_scarab_e
modifier_evo_nyx_scarab_e.name = "modifier_evo_nyx_scarab_e"
__TS__ClassExtends(modifier_evo_nyx_scarab_e, BaseModifier)
function modifier_evo_nyx_scarab_e.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastRecord = -1
    self.lastPct = 0
    self.lastEvadeChitinTime = -999
    self.counterCdByEnt = __TS__New(Map)
end
function modifier_evo_nyx_scarab_e.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_scarab_e.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_scarab_e.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_scarab_e.prototype.OnCreated(self)
    self.lastRecord = -1
    self.lastPct = 0
    self.lastEvadeChitinTime = -999
    self.counterCdByEnt = __TS__New(Map)
end
function modifier_evo_nyx_scarab_e.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")}
end
function modifier_evo_nyx_scarab_e.prototype.GetModifierIncomingDamage_Percentage(self, event)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return 0
    end
    if parent:PassivesDisabled() or event.damage <= 0 then
        return 0
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return 0
    end
    if event.record ~= nil and event.record == self.lastRecord then
        return self.lastPct
    end
    local tier = getNyxTier(nil, parent)
    local burrowed = isNyxBurrowed(nil, parent)
    local wAb = parent:FindAbilityByName("evo_nyx_scarab_w")
    local evadeBonus = burrowed and wAb and not wAb:IsNull() and wAb:GetSpecialValueFor("evade_bonus") or 0
    local grazeBonus = burrowed and wAb and not wAb:IsNull() and wAb:GetSpecialValueFor("graze_bonus") or 0
    local evadeChance = ability:GetSpecialValueFor("evade_chance") + evadeBonus
    local grazeChance = ability:GetSpecialValueFor("graze_chance") + grazeBonus
    local pct = 0
    if RollPercentage(evadeChance) then
        pct = -100
        self:onEvadeSuccess(parent, ability, tier, event.attacker)
    elseif RollPercentage(grazeChance) then
        local ultActive = parent:HasModifier("modifier_evo_nyx_scarab_r_aura")
        local rAb = parent:FindAbilityByName("evo_nyx_scarab_r")
        local blockPct = ultActive and rAb and not rAb:IsNull() and rAb:GetSpecialValueFor("graze_block_pct") or ability:GetSpecialValueFor("graze_block_pct")
        pct = -blockPct
        self:onGrazeSuccess(parent, ability, tier)
    end
    if event.record ~= nil then
        self.lastRecord = event.record
        self.lastPct = pct
    end
    return pct
end
function modifier_evo_nyx_scarab_e.prototype.onEvadeSuccess(self, parent, ability, tier, attacker)
    local now = GameRules:GetDOTATime(false, false)
    if tier >= 3 then
        local heal = 25 + getNyxStr(nil, parent) * 0.12
        parent:Heal(heal, ability)
        if now - self.lastEvadeChitinTime >= 3 then
            self.lastEvadeChitinTime = now
            addLivingChitinStacks(nil, parent, 1)
        end
    end
    if tier >= 4 and attacker and not attacker:IsNull() and IsValidEntity(attacker) and attacker:IsAlive() then
        local dist = (attacker:GetAbsOrigin() - parent:GetAbsOrigin()):Length2D()
        if dist <= 600 and attacker:GetTeamNumber() ~= parent:GetTeamNumber() then
            local idx = attacker:GetEntityIndex()
            local prev = self.counterCdByEnt:get(idx) or -999
            if now - prev >= 2 then
                self.counterCdByEnt:set(idx, now)
                local dmg = 65 + getNyxStr(nil, parent) * 0.3
                ApplyDamage({
                    victim = attacker,
                    attacker = parent,
                    ability = ability,
                    damage = dmg,
                    damage_type = 2,
                    damage_flags = 16
                })
                attacker:AddNewModifier(parent, ability, "modifier_evo_nyx_scarab_e_slow", {duration = 1.5})
            end
        end
    end
end
function modifier_evo_nyx_scarab_e.prototype.onGrazeSuccess(self, parent, ability, tier)
    if tier < 3 then
        return
    end
    local ex = parent:FindModifierByName("modifier_evo_nyx_scarab_e_hardening")
    local next = math.min(
        5,
        (ex and ex:GetStackCount() or 0) + 1
    )
    local mod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_scarab_e_hardening", {duration = 4})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
modifier_evo_nyx_scarab_e = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_scarab_e")},
    modifier_evo_nyx_scarab_e
)
____exports.modifier_evo_nyx_scarab_e = modifier_evo_nyx_scarab_e
____exports.modifier_evo_nyx_scarab_e_hardening = __TS__Class()
local modifier_evo_nyx_scarab_e_hardening = ____exports.modifier_evo_nyx_scarab_e_hardening
modifier_evo_nyx_scarab_e_hardening.name = "modifier_evo_nyx_scarab_e_hardening"
__TS__ClassExtends(modifier_evo_nyx_scarab_e_hardening, BaseModifier)
function modifier_evo_nyx_scarab_e_hardening.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_scarab_e_hardening.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_scarab_e_hardening.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_scarab_e_hardening.prototype.GetTexture(self)
    return "nyx_assassin_spiked_carapace"
end
function modifier_evo_nyx_scarab_e_hardening.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")
    }
end
function modifier_evo_nyx_scarab_e_hardening.prototype.GetModifierBonusStats_Strength(self)
    return self:GetStackCount() * 2
end
function modifier_evo_nyx_scarab_e_hardening.prototype.GetModifierMagicalResistanceBonus(self)
    return self:GetStackCount() * 3
end
modifier_evo_nyx_scarab_e_hardening = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_scarab_e_hardening")},
    modifier_evo_nyx_scarab_e_hardening
)
____exports.modifier_evo_nyx_scarab_e_hardening = modifier_evo_nyx_scarab_e_hardening
____exports.modifier_evo_nyx_scarab_e_slow = __TS__Class()
local modifier_evo_nyx_scarab_e_slow = ____exports.modifier_evo_nyx_scarab_e_slow
modifier_evo_nyx_scarab_e_slow.name = "modifier_evo_nyx_scarab_e_slow"
__TS__ClassExtends(modifier_evo_nyx_scarab_e_slow, BaseModifier)
function modifier_evo_nyx_scarab_e_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_scarab_e_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_scarab_e_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_scarab_e_slow.prototype.GetTexture(self)
    return "nyx_assassin_spiked_carapace"
end
function modifier_evo_nyx_scarab_e_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_scarab_e_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_nyx_scarab_e_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_scarab_e_slow")},
    modifier_evo_nyx_scarab_e_slow
)
____exports.modifier_evo_nyx_scarab_e_slow = modifier_evo_nyx_scarab_e_slow
____exports.evo_nyx_scarab_r = __TS__Class()
local evo_nyx_scarab_r = ____exports.evo_nyx_scarab_r
evo_nyx_scarab_r.name = "evo_nyx_scarab_r"
__TS__ClassExtends(evo_nyx_scarab_r, BaseAbility)
function evo_nyx_scarab_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")
    local wAb = caster:FindAbilityByName("evo_nyx_scarab_w")
    if wAb and not wAb:IsNull() and not wAb:GetToggleState() then
        wAb:ToggleAbility()
        if not caster:HasModifier("modifier_evo_nyx_scarab_w") then
            caster:AddNewModifier(caster, wAb, "modifier_evo_nyx_scarab_w", {})
        end
    end
    caster:EmitSound("Ability.SandKing_Epicenter")
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_scarab_r_aura", {duration = duration})
end
evo_nyx_scarab_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_scarab_r")},
    evo_nyx_scarab_r
)
____exports.evo_nyx_scarab_r = evo_nyx_scarab_r
____exports.modifier_evo_nyx_scarab_r_aura = __TS__Class()
local modifier_evo_nyx_scarab_r_aura = ____exports.modifier_evo_nyx_scarab_r_aura
modifier_evo_nyx_scarab_r_aura.name = "modifier_evo_nyx_scarab_r_aura"
__TS__ClassExtends(modifier_evo_nyx_scarab_r_aura, BaseModifier)
function modifier_evo_nyx_scarab_r_aura.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 525
    self.qCdAdjusted = false
end
function modifier_evo_nyx_scarab_r_aura.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_scarab_r_aura.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_scarab_r_aura.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_scarab_r_aura.prototype.GetTexture(self)
    return "sandking_epicenter"
end
function modifier_evo_nyx_scarab_r_aura.prototype.IsAura(self)
    return true
end
function modifier_evo_nyx_scarab_r_aura.prototype.GetModifierAura(self)
    return "modifier_evo_nyx_scarab_r_slow"
end
function modifier_evo_nyx_scarab_r_aura.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_evo_nyx_scarab_r_aura.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_nyx_scarab_r_aura.prototype.GetAuraSearchType(self)
    return 1 + 18
end
function modifier_evo_nyx_scarab_r_aura.prototype.OnCreated(self)
    self.radius = 525
    self.qCdAdjusted = false
    local ability = self:GetAbility()
    if ability and not ability:IsNull() then
        self.radius = ability:GetSpecialValueFor("radius")
    end
    if not IsServer() then
        return
    end
    local interval = ability and not ability:IsNull() and ability:GetSpecialValueFor("wave_interval") or 1.1
    self:pulseWave()
    self:StartIntervalThink(interval)
end
function modifier_evo_nyx_scarab_r_aura.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    self:pulseWave()
    local qAb = self:GetParent():FindAbilityByName("evo_nyx_scarab_q")
    if qAb and not qAb:IsNull() and qAb:GetCooldownTimeRemaining() > 4.5 then
        qAb:EndCooldown()
        qAb:StartCooldown(4.5)
    end
end
function modifier_evo_nyx_scarab_r_aura.prototype.pulseWave(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or not ability or ability:IsNull() then
        return
    end
    local dmg = ability:GetSpecialValueFor("wave_damage")
    local origin = parent:GetAbsOrigin()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_sandking/sandking_epicenter.vpcf", 1, parent)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(self.radius, self.radius, 1)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findEnemiesInRadius(nil, parent, origin, self.radius)) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = dmg,
            damage_type = 2
        })
        local delta = (origin - enemy:GetAbsOrigin()):Normalized()
        local pullCenter = enemy:GetAbsOrigin() - delta * 90
        knockbackUnitFrom(
            nil,
            parent,
            enemy,
            pullCenter,
            90,
            0.25,
            0
        )
    end
end
modifier_evo_nyx_scarab_r_aura = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_scarab_r_aura")},
    modifier_evo_nyx_scarab_r_aura
)
____exports.modifier_evo_nyx_scarab_r_aura = modifier_evo_nyx_scarab_r_aura
____exports.modifier_evo_nyx_scarab_r_slow = __TS__Class()
local modifier_evo_nyx_scarab_r_slow = ____exports.modifier_evo_nyx_scarab_r_slow
modifier_evo_nyx_scarab_r_slow.name = "modifier_evo_nyx_scarab_r_slow"
__TS__ClassExtends(modifier_evo_nyx_scarab_r_slow, BaseModifier)
function modifier_evo_nyx_scarab_r_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_scarab_r_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_scarab_r_slow.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_scarab_r_slow.prototype.GetTexture(self)
    return "sandking_epicenter"
end
function modifier_evo_nyx_scarab_r_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_scarab_r_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -30
end
modifier_evo_nyx_scarab_r_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_scarab_r_slow")},
    modifier_evo_nyx_scarab_r_slow
)
____exports.modifier_evo_nyx_scarab_r_slow = modifier_evo_nyx_scarab_r_slow
return ____exports
