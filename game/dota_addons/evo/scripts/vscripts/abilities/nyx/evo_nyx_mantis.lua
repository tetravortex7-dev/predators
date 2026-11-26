local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 16,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 25,["28"] = 26,["29"] = 25,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 27,["37"] = 30,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 31,["48"] = 32,["49"] = 33,["50"] = 34,["52"] = 36,["53"] = 30,["54"] = 38,["55"] = 39,["58"] = 40,["59"] = 41,["60"] = 42,["63"] = 43,["66"] = 45,["67"] = 46,["68"] = 47,["69"] = 49,["70"] = 50,["71"] = 51,["72"] = 52,["73"] = 53,["76"] = 57,["77"] = 58,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 58,["86"] = 58,["87"] = 58,["88"] = 38,["89"] = 26,["90"] = 25,["91"] = 26,["93"] = 26,["94"] = 67,["95"] = 68,["96"] = 67,["97"] = 68,["99"] = 68,["100"] = 69,["101"] = 70,["102"] = 71,["103"] = 72,["104"] = 67,["105"] = 74,["106"] = 75,["107"] = 74,["108"] = 77,["109"] = 78,["110"] = 77,["111"] = 80,["112"] = 81,["113"] = 82,["114"] = 83,["115"] = 84,["116"] = 86,["117"] = 87,["118"] = 88,["119"] = 89,["120"] = 90,["122"] = 92,["123"] = 93,["124"] = 94,["126"] = 96,["129"] = 97,["130"] = 98,["131"] = 99,["132"] = 100,["133"] = 101,["134"] = 102,["136"] = 80,["137"] = 105,["138"] = 106,["141"] = 107,["142"] = 105,["143"] = 109,["144"] = 110,["145"] = 111,["146"] = 112,["147"] = 113,["150"] = 116,["151"] = 117,["152"] = 118,["155"] = 122,["156"] = 123,["157"] = 123,["158"] = 123,["159"] = 123,["160"] = 123,["161"] = 123,["162"] = 123,["163"] = 123,["164"] = 123,["165"] = 123,["166"] = 124,["167"] = 126,["168"] = 127,["169"] = 128,["171"] = 130,["172"] = 131,["174"] = 133,["176"] = 109,["177"] = 136,["178"] = 137,["179"] = 137,["180"] = 137,["181"] = 137,["182"] = 136,["183"] = 142,["184"] = 143,["185"] = 142,["186"] = 145,["187"] = 146,["188"] = 145,["189"] = 68,["190"] = 67,["191"] = 68,["193"] = 68,["194"] = 150,["195"] = 151,["196"] = 150,["197"] = 151,["198"] = 152,["199"] = 153,["200"] = 152,["201"] = 155,["202"] = 156,["203"] = 155,["204"] = 158,["205"] = 159,["206"] = 158,["207"] = 161,["208"] = 162,["209"] = 161,["210"] = 164,["211"] = 165,["212"] = 164,["213"] = 167,["214"] = 168,["215"] = 169,["216"] = 167,["217"] = 151,["218"] = 150,["219"] = 151,["221"] = 151,["222"] = 173,["223"] = 174,["224"] = 173,["225"] = 174,["226"] = 175,["227"] = 176,["228"] = 176,["229"] = 176,["230"] = 176,["231"] = 175,["232"] = 178,["233"] = 179,["236"] = 180,["237"] = 181,["238"] = 182,["239"] = 183,["240"] = 185,["241"] = 186,["242"] = 186,["243"] = 186,["244"] = 186,["245"] = 186,["246"] = 186,["247"] = 186,["249"] = 188,["250"] = 189,["251"] = 190,["252"] = 191,["254"] = 178,["255"] = 174,["256"] = 173,["257"] = 174,["259"] = 174,["260"] = 196,["261"] = 197,["262"] = 196,["263"] = 197,["265"] = 197,["266"] = 198,["267"] = 199,["268"] = 196,["269"] = 201,["270"] = 202,["271"] = 201,["272"] = 204,["273"] = 205,["274"] = 204,["275"] = 207,["276"] = 208,["277"] = 207,["278"] = 210,["279"] = 211,["280"] = 210,["281"] = 213,["282"] = 214,["283"] = 215,["284"] = 213,["285"] = 217,["286"] = 218,["287"] = 217,["288"] = 220,["289"] = 221,["290"] = 221,["292"] = 222,["293"] = 223,["294"] = 224,["295"] = 224,["297"] = 225,["298"] = 225,["300"] = 226,["301"] = 226,["303"] = 227,["304"] = 228,["306"] = 230,["307"] = 231,["308"] = 231,["310"] = 232,["311"] = 232,["313"] = 234,["314"] = 235,["315"] = 236,["316"] = 237,["317"] = 239,["318"] = 240,["319"] = 241,["320"] = 242,["321"] = 243,["322"] = 244,["324"] = 246,["325"] = 246,["326"] = 246,["327"] = 246,["328"] = 246,["329"] = 246,["330"] = 247,["333"] = 250,["334"] = 251,["335"] = 252,["336"] = 255,["337"] = 256,["339"] = 258,["340"] = 259,["341"] = 260,["343"] = 262,["344"] = 263,["345"] = 264,["347"] = 267,["348"] = 268,["349"] = 269,["351"] = 271,["352"] = 220,["353"] = 197,["354"] = 196,["355"] = 197,["357"] = 197,["358"] = 275,["359"] = 276,["360"] = 275,["361"] = 276,["362"] = 277,["363"] = 278,["364"] = 277,["365"] = 280,["366"] = 281,["367"] = 280,["368"] = 283,["369"] = 284,["370"] = 283,["371"] = 286,["372"] = 287,["373"] = 286,["374"] = 289,["375"] = 290,["376"] = 289,["377"] = 292,["378"] = 293,["379"] = 292,["380"] = 276,["381"] = 275,["382"] = 276,["384"] = 276,["385"] = 297,["386"] = 298,["387"] = 297,["388"] = 298,["389"] = 299,["390"] = 300,["391"] = 299,["392"] = 302,["393"] = 303,["394"] = 302,["395"] = 305,["396"] = 306,["397"] = 305,["398"] = 308,["399"] = 309,["400"] = 308,["401"] = 311,["402"] = 312,["403"] = 311,["404"] = 314,["405"] = 315,["406"] = 314,["407"] = 298,["408"] = 297,["409"] = 298,["411"] = 298,["412"] = 319,["413"] = 320,["414"] = 319,["415"] = 320,["416"] = 321,["417"] = 322,["418"] = 321,["419"] = 324,["420"] = 325,["421"] = 324,["422"] = 327,["423"] = 328,["424"] = 327,["425"] = 330,["426"] = 331,["427"] = 330,["428"] = 333,["429"] = 334,["430"] = 333,["431"] = 336,["432"] = 337,["433"] = 337,["435"] = 338,["436"] = 339,["437"] = 339,["439"] = 340,["440"] = 340,["441"] = 340,["442"] = 340,["443"] = 341,["444"] = 342,["445"] = 343,["446"] = 344,["448"] = 346,["449"] = 336,["450"] = 320,["451"] = 319,["452"] = 320,["454"] = 320});
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
local getNyxAgi = ____evo_nyx_shared.getNyxAgi
local getNyxBranchMaxLevel = ____evo_nyx_shared.getNyxBranchMaxLevel
local getNyxTier = ____evo_nyx_shared.getNyxTier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis"
LinkLuaModifier("modifier_evo_nyx_mantis_q_flurry", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_q_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_w", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_w_as", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_w_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_mantis_w_shield", SCRIPT_PATH, 0)
____exports.evo_nyx_mantis_q = __TS__Class()
local evo_nyx_mantis_q = ____exports.evo_nyx_mantis_q
evo_nyx_mantis_q.name = "evo_nyx_mantis_q"
__TS__ClassExtends(evo_nyx_mantis_q, BaseAbility)
function evo_nyx_mantis_q.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_mantis_q.prototype.GetCooldown(self, level)
    local base = ({
        10,
        9,
        8,
        7,
        6.5
    })[math.max(
        0,
        math.min(4, level)
    ) + 1] or 10
    local caster = self:GetCaster()
    if caster and not caster:IsNull() and caster:HasModifier("modifier_evo_nyx_mantis_r") then
        return base * 0.5
    end
    return base
end
function evo_nyx_mantis_q.prototype.OnSpellStart(self)
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
    local tier = getNyxTier(nil, caster)
    local hits = self:GetSpecialValueFor("hit_count")
    local dur = self:GetSpecialValueFor("duration")
    if tier >= 4 then
        local wound = target:FindModifierByName("modifier_evo_nyx_mantis_e_wound")
        if wound and wound:GetStackCount() >= 5 then
            hits = 4
            dur = dur * (4 / 3)
        end
    end
    target:AddNewModifier(caster, self, "modifier_stunned", {duration = dur})
    caster:AddNewModifier(
        caster,
        self,
        "modifier_evo_nyx_mantis_q_flurry",
        {
            duration = dur + 0.1,
            targetIdx = target:GetEntityIndex(),
            hits = hits,
            interval = dur / hits
        }
    )
end
evo_nyx_mantis_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_q")},
    evo_nyx_mantis_q
)
____exports.evo_nyx_mantis_q = evo_nyx_mantis_q
____exports.modifier_evo_nyx_mantis_q_flurry = __TS__Class()
local modifier_evo_nyx_mantis_q_flurry = ____exports.modifier_evo_nyx_mantis_q_flurry
modifier_evo_nyx_mantis_q_flurry.name = "modifier_evo_nyx_mantis_q_flurry"
__TS__ClassExtends(modifier_evo_nyx_mantis_q_flurry, BaseModifier)
function modifier_evo_nyx_mantis_q_flurry.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.targetIdx = -1
    self.remainingHits = 0
    self.bonusPerStrike = 0
    self.dmgPctDelta = -45
end
function modifier_evo_nyx_mantis_q_flurry.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_mantis_q_flurry.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_q_flurry.prototype.OnCreated(self, params)
    self.targetIdx = -1
    self.remainingHits = 0
    self.bonusPerStrike = 0
    self.dmgPctDelta = -45
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if ability and not ability:IsNull() then
        local pct = ability:GetSpecialValueFor("attack_damage_pct")
        self.dmgPctDelta = pct - 100
    end
    local tier = parent and not parent:IsNull() and getNyxTier(nil, parent) or 2
    if tier >= 3 then
        self.bonusPerStrike = tier >= 4 and 25 or 15
    end
    if not IsServer() then
        return
    end
    self.targetIdx = params.targetIdx or -1
    self.remainingHits = params.hits or 3
    local interval = params.interval or 0.15
    self:doStrike()
    if self.remainingHits > 0 then
        self:StartIntervalThink(interval)
    end
end
function modifier_evo_nyx_mantis_q_flurry.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    self:doStrike()
end
function modifier_evo_nyx_mantis_q_flurry.prototype.doStrike(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or parent:IsStunned() then
        self:Destroy()
        return
    end
    local targetEnt = EntIndexToHScript(self.targetIdx)
    if not targetEnt or targetEnt:IsNull() or not IsValidEntity(targetEnt) or not targetEnt:IsBaseNPC() or not targetEnt:IsAlive() then
        self:Destroy()
        return
    end
    parent:EmitSound("Hero_Pangolier.Swashbuckle.Attack")
    parent:PerformAttack(
        targetEnt,
        true,
        true,
        true,
        true,
        false,
        false,
        true
    )
    self.remainingHits = self.remainingHits - 1
    if self.remainingHits <= 0 then
        if targetEnt:IsRealHero() then
            addLivingChitinStacks(nil, parent, 1)
        end
        if ability and not ability:IsNull() and getNyxTier(nil, parent) >= 3 then
            parent:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_q_ms", {duration = 2.5})
        end
        self:Destroy()
    end
end
function modifier_evo_nyx_mantis_q_flurry.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE")
    }
end
function modifier_evo_nyx_mantis_q_flurry.prototype.GetModifierDamageOutgoing_Percentage(self)
    return self.dmgPctDelta
end
function modifier_evo_nyx_mantis_q_flurry.prototype.GetModifierPreAttack_BonusDamage(self)
    return self.bonusPerStrike
end
modifier_evo_nyx_mantis_q_flurry = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_q_flurry")},
    modifier_evo_nyx_mantis_q_flurry
)
____exports.modifier_evo_nyx_mantis_q_flurry = modifier_evo_nyx_mantis_q_flurry
____exports.modifier_evo_nyx_mantis_q_ms = __TS__Class()
local modifier_evo_nyx_mantis_q_ms = ____exports.modifier_evo_nyx_mantis_q_ms
modifier_evo_nyx_mantis_q_ms.name = "modifier_evo_nyx_mantis_q_ms"
__TS__ClassExtends(modifier_evo_nyx_mantis_q_ms, BaseModifier)
function modifier_evo_nyx_mantis_q_ms.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_q_ms.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_q_ms.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_q_ms.prototype.GetTexture(self)
    return "pangolier_swashbuckle"
end
function modifier_evo_nyx_mantis_q_ms.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_mantis_q_ms.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local parent = self:GetParent()
    return parent and not parent:IsNull() and getNyxTier(nil, parent) >= 4 and 25 or 20
end
modifier_evo_nyx_mantis_q_ms = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_q_ms")},
    modifier_evo_nyx_mantis_q_ms
)
____exports.modifier_evo_nyx_mantis_q_ms = modifier_evo_nyx_mantis_q_ms
____exports.evo_nyx_mantis_w = __TS__Class()
local evo_nyx_mantis_w = ____exports.evo_nyx_mantis_w
evo_nyx_mantis_w.name = "evo_nyx_mantis_w"
__TS__ClassExtends(evo_nyx_mantis_w, BaseAbility)
function evo_nyx_mantis_w.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_mantis_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local tier = getNyxTier(nil, caster)
    local duration = self:GetSpecialValueFor("duration")
    local charges = tier >= 4 and 3 or self:GetSpecialValueFor("block_charges")
    if tier >= 3 then
        caster:Purge(
            false,
            true,
            false,
            false,
            false
        )
    end
    caster:EmitSound("Hero_Riki.TricksOfTheTrade")
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_nyx_mantis_w", {duration = duration})
    if mod ~= nil then
        mod:SetStackCount(charges)
    end
end
evo_nyx_mantis_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_w")},
    evo_nyx_mantis_w
)
____exports.evo_nyx_mantis_w = evo_nyx_mantis_w
____exports.modifier_evo_nyx_mantis_w = __TS__Class()
local modifier_evo_nyx_mantis_w = ____exports.modifier_evo_nyx_mantis_w
modifier_evo_nyx_mantis_w.name = "modifier_evo_nyx_mantis_w"
__TS__ClassExtends(modifier_evo_nyx_mantis_w, BaseModifier)
function modifier_evo_nyx_mantis_w.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastRecord = -1
    self.lastPct = 0
end
function modifier_evo_nyx_mantis_w.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_w.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_w.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_w.prototype.GetTexture(self)
    return "riki_tricks_of_the_trade"
end
function modifier_evo_nyx_mantis_w.prototype.OnCreated(self)
    self.lastRecord = -1
    self.lastPct = 0
end
function modifier_evo_nyx_mantis_w.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")}
end
function modifier_evo_nyx_mantis_w.prototype.GetModifierIncomingDamage_Percentage(self, event)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return 0
    end
    if event.damage <= 0 or self:GetStackCount() <= 0 then
        return 0
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return 0
    end
    if event.record ~= nil and event.record == self.lastRecord then
        return self.lastPct
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsRealHero() then
        return 0
    end
    if attacker:GetTeamNumber() == parent:GetTeamNumber() then
        return 0
    end
    local blockPct = parent:HasModifier("modifier_evo_nyx_mantis_r") and 65 or ability:GetSpecialValueFor("block_pct")
    local nextCharges = self:GetStackCount() - 1
    self:SetStackCount(nextCharges)
    addLivingChitinStacks(nil, parent, 1)
    parent:EmitSound("DOTA_Item.BladeMail.Activate")
    local tier = getNyxTier(nil, parent)
    if tier >= 3 then
        local asMod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_as", {duration = 3})
        if asMod ~= nil then
            asMod:IncrementStackCount()
        end
        for ____, enemy in ipairs(findEnemiesInRadius(
            nil,
            parent,
            parent:GetAbsOrigin(),
            250
        )) do
            enemy:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_slow", {duration = 1.5})
        end
    end
    if tier >= 4 and nextCharges <= 0 then
        local shieldAmt = math.ceil(150 + getNyxAgi(nil, parent) * 0.4)
        local shieldMod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_mantis_w_shield", {duration = 3})
        if shieldMod ~= nil then
            shieldMod:SetStackCount(shieldAmt)
        end
        local qAb = parent:FindAbilityByName("evo_nyx_mantis_q")
        if qAb and not qAb:IsNull() then
            qAb:EndCooldown()
        end
        self:Destroy()
    elseif nextCharges <= 0 then
        self:Destroy()
    end
    if event.record ~= nil then
        self.lastRecord = event.record
        self.lastPct = -blockPct
    end
    return -blockPct
end
modifier_evo_nyx_mantis_w = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_w")},
    modifier_evo_nyx_mantis_w
)
____exports.modifier_evo_nyx_mantis_w = modifier_evo_nyx_mantis_w
____exports.modifier_evo_nyx_mantis_w_as = __TS__Class()
local modifier_evo_nyx_mantis_w_as = ____exports.modifier_evo_nyx_mantis_w_as
modifier_evo_nyx_mantis_w_as.name = "modifier_evo_nyx_mantis_w_as"
__TS__ClassExtends(modifier_evo_nyx_mantis_w_as, BaseModifier)
function modifier_evo_nyx_mantis_w_as.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_w_as.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_w_as.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_w_as.prototype.GetTexture(self)
    return "riki_tricks_of_the_trade"
end
function modifier_evo_nyx_mantis_w_as.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")}
end
function modifier_evo_nyx_mantis_w_as.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self:GetStackCount() * 25
end
modifier_evo_nyx_mantis_w_as = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_w_as")},
    modifier_evo_nyx_mantis_w_as
)
____exports.modifier_evo_nyx_mantis_w_as = modifier_evo_nyx_mantis_w_as
____exports.modifier_evo_nyx_mantis_w_slow = __TS__Class()
local modifier_evo_nyx_mantis_w_slow = ____exports.modifier_evo_nyx_mantis_w_slow
modifier_evo_nyx_mantis_w_slow.name = "modifier_evo_nyx_mantis_w_slow"
__TS__ClassExtends(modifier_evo_nyx_mantis_w_slow, BaseModifier)
function modifier_evo_nyx_mantis_w_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_w_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_w_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_w_slow.prototype.GetTexture(self)
    return "riki_tricks_of_the_trade"
end
function modifier_evo_nyx_mantis_w_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_mantis_w_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_nyx_mantis_w_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_w_slow")},
    modifier_evo_nyx_mantis_w_slow
)
____exports.modifier_evo_nyx_mantis_w_slow = modifier_evo_nyx_mantis_w_slow
____exports.modifier_evo_nyx_mantis_w_shield = __TS__Class()
local modifier_evo_nyx_mantis_w_shield = ____exports.modifier_evo_nyx_mantis_w_shield
modifier_evo_nyx_mantis_w_shield.name = "modifier_evo_nyx_mantis_w_shield"
__TS__ClassExtends(modifier_evo_nyx_mantis_w_shield, BaseModifier)
function modifier_evo_nyx_mantis_w_shield.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_w_shield.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_mantis_w_shield.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_w_shield.prototype.GetTexture(self)
    return "riki_tricks_of_the_trade"
end
function modifier_evo_nyx_mantis_w_shield.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")}
end
function modifier_evo_nyx_mantis_w_shield.prototype.GetModifierTotal_ConstantBlock(self, event)
    if not IsServer() then
        return 0
    end
    local pool = self:GetStackCount()
    if pool <= 0 or event.damage <= 0 then
        return 0
    end
    local blocked = math.min(
        pool,
        math.ceil(event.damage)
    )
    local rem = pool - blocked
    self:SetStackCount(math.max(0, rem))
    if rem <= 0 then
        self:Destroy()
    end
    return blocked
end
modifier_evo_nyx_mantis_w_shield = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_w_shield")},
    modifier_evo_nyx_mantis_w_shield
)
____exports.modifier_evo_nyx_mantis_w_shield = modifier_evo_nyx_mantis_w_shield
return ____exports
