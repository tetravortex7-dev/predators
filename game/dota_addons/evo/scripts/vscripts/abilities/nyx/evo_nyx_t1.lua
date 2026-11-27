local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 8,["17"] = 8,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 20,["29"] = 22,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 27,["39"] = 26,["40"] = 27,["42"] = 27,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 34,["47"] = 34,["48"] = 33,["49"] = 34,["51"] = 34,["52"] = 36,["53"] = 37,["54"] = 36,["55"] = 37,["56"] = 37,["57"] = 36,["58"] = 37,["60"] = 37,["61"] = 39,["62"] = 40,["63"] = 39,["64"] = 40,["65"] = 40,["66"] = 39,["67"] = 40,["69"] = 40,["70"] = 42,["71"] = 43,["72"] = 42,["73"] = 43,["74"] = 43,["75"] = 42,["76"] = 43,["78"] = 43,["79"] = 45,["80"] = 46,["81"] = 45,["82"] = 46,["83"] = 46,["84"] = 45,["85"] = 46,["87"] = 46,["88"] = 48,["89"] = 49,["90"] = 48,["91"] = 49,["92"] = 49,["93"] = 48,["94"] = 49,["96"] = 49,["97"] = 51,["98"] = 52,["99"] = 51,["100"] = 52,["101"] = 52,["102"] = 51,["103"] = 52,["105"] = 52,["106"] = 54,["107"] = 55,["108"] = 54,["109"] = 55,["110"] = 55,["111"] = 54,["112"] = 55,["114"] = 55,["115"] = 57,["116"] = 58,["117"] = 57,["118"] = 58,["119"] = 58,["120"] = 57,["121"] = 58,["123"] = 58,["124"] = 60,["125"] = 61,["126"] = 60,["127"] = 61,["129"] = 61,["130"] = 62,["131"] = 63,["132"] = 65,["133"] = 66,["134"] = 67,["135"] = 68,["136"] = 60,["137"] = 70,["138"] = 71,["139"] = 70,["140"] = 73,["141"] = 74,["142"] = 73,["143"] = 76,["144"] = 77,["145"] = 76,["146"] = 79,["147"] = 80,["148"] = 79,["149"] = 82,["150"] = 83,["151"] = 82,["152"] = 85,["153"] = 86,["154"] = 87,["155"] = 88,["156"] = 89,["157"] = 90,["158"] = 91,["159"] = 92,["160"] = 93,["163"] = 94,["164"] = 95,["165"] = 96,["166"] = 85,["167"] = 98,["168"] = 99,["171"] = 100,["172"] = 101,["173"] = 102,["176"] = 105,["177"] = 106,["178"] = 108,["179"] = 109,["180"] = 110,["181"] = 111,["182"] = 112,["183"] = 113,["184"] = 114,["187"] = 117,["188"] = 118,["189"] = 119,["190"] = 120,["191"] = 121,["192"] = 122,["193"] = 123,["194"] = 124,["195"] = 125,["196"] = 126,["201"] = 131,["203"] = 133,["206"] = 136,["208"] = 98,["209"] = 139,["210"] = 140,["211"] = 140,["212"] = 140,["213"] = 140,["214"] = 140,["215"] = 140,["216"] = 140,["217"] = 140,["218"] = 140,["219"] = 140,["220"] = 140,["221"] = 140,["222"] = 140,["223"] = 140,["224"] = 140,["225"] = 139,["226"] = 156,["227"] = 157,["228"] = 158,["229"] = 158,["231"] = 159,["232"] = 156,["233"] = 161,["234"] = 162,["235"] = 163,["236"] = 163,["238"] = 164,["239"] = 161,["240"] = 166,["241"] = 167,["242"] = 168,["243"] = 168,["245"] = 169,["246"] = 170,["247"] = 171,["248"] = 172,["249"] = 173,["250"] = 174,["252"] = 176,["253"] = 166,["254"] = 178,["255"] = 179,["256"] = 179,["257"] = 179,["258"] = 179,["259"] = 180,["260"] = 180,["262"] = 181,["263"] = 178,["264"] = 183,["265"] = 184,["266"] = 184,["267"] = 184,["268"] = 184,["269"] = 185,["270"] = 185,["272"] = 186,["273"] = 183,["274"] = 188,["275"] = 189,["276"] = 189,["277"] = 189,["278"] = 189,["279"] = 190,["280"] = 190,["282"] = 191,["283"] = 188,["284"] = 193,["285"] = 194,["286"] = 194,["287"] = 194,["288"] = 194,["289"] = 195,["290"] = 195,["292"] = 196,["293"] = 193,["294"] = 198,["295"] = 199,["296"] = 199,["297"] = 199,["298"] = 199,["299"] = 200,["300"] = 200,["302"] = 201,["303"] = 198,["304"] = 203,["305"] = 204,["306"] = 204,["308"] = 205,["309"] = 206,["310"] = 207,["311"] = 207,["313"] = 208,["314"] = 208,["316"] = 209,["317"] = 209,["319"] = 210,["320"] = 210,["322"] = 211,["323"] = 212,["324"] = 212,["326"] = 213,["327"] = 214,["328"] = 214,["330"] = 215,["331"] = 215,["333"] = 217,["334"] = 218,["335"] = 219,["336"] = 220,["337"] = 221,["338"] = 223,["339"] = 224,["340"] = 229,["341"] = 231,["342"] = 231,["343"] = 231,["344"] = 231,["345"] = 231,["346"] = 231,["347"] = 232,["348"] = 233,["349"] = 233,["350"] = 233,["351"] = 233,["352"] = 233,["353"] = 233,["354"] = 233,["355"] = 233,["357"] = 242,["358"] = 203,["359"] = 244,["360"] = 245,["363"] = 246,["364"] = 247,["365"] = 248,["368"] = 249,["371"] = 250,["372"] = 251,["373"] = 252,["375"] = 244,["376"] = 255,["377"] = 256,["380"] = 257,["381"] = 258,["382"] = 259,["385"] = 260,["388"] = 261,["389"] = 262,["392"] = 265,["393"] = 266,["394"] = 267,["395"] = 268,["396"] = 269,["397"] = 269,["398"] = 269,["399"] = 269,["400"] = 269,["401"] = 269,["402"] = 269,["403"] = 269,["405"] = 278,["406"] = 279,["407"] = 279,["408"] = 279,["409"] = 279,["410"] = 279,["411"] = 279,["413"] = 255,["414"] = 282,["415"] = 283,["418"] = 284,["419"] = 285,["420"] = 286,["423"] = 287,["426"] = 288,["427"] = 289,["430"] = 290,["431"] = 291,["432"] = 293,["433"] = 294,["434"] = 295,["435"] = 296,["436"] = 297,["437"] = 298,["440"] = 301,["441"] = 302,["442"] = 303,["443"] = 303,["444"] = 303,["445"] = 303,["446"] = 303,["447"] = 303,["449"] = 305,["450"] = 306,["451"] = 307,["455"] = 282,["456"] = 312,["457"] = 313,["460"] = 314,["461"] = 315,["462"] = 316,["465"] = 317,["468"] = 318,["469"] = 319,["472"] = 322,["473"] = 323,["476"] = 325,["477"] = 326,["480"] = 327,["481"] = 330,["482"] = 335,["483"] = 336,["484"] = 337,["485"] = 338,["486"] = 339,["487"] = 340,["489"] = 342,["490"] = 342,["491"] = 342,["492"] = 342,["493"] = 342,["494"] = 342,["495"] = 342,["497"] = 345,["498"] = 346,["499"] = 347,["501"] = 312,["502"] = 350,["503"] = 356,["504"] = 357,["505"] = 358,["506"] = 359,["507"] = 360,["508"] = 362,["509"] = 363,["510"] = 368,["511"] = 369,["512"] = 369,["513"] = 369,["514"] = 369,["515"] = 369,["516"] = 370,["517"] = 372,["518"] = 373,["519"] = 374,["520"] = 374,["521"] = 374,["522"] = 374,["523"] = 374,["524"] = 374,["525"] = 374,["526"] = 381,["527"] = 381,["528"] = 381,["529"] = 381,["530"] = 381,["531"] = 381,["532"] = 381,["534"] = 384,["535"] = 385,["536"] = 388,["537"] = 389,["540"] = 350,["541"] = 61,["542"] = 60,["543"] = 61,["545"] = 61,["546"] = 395,["547"] = 396,["548"] = 395,["549"] = 396,["550"] = 397,["551"] = 398,["554"] = 399,["555"] = 400,["556"] = 401,["559"] = 404,["560"] = 405,["561"] = 406,["562"] = 408,["563"] = 409,["564"] = 409,["565"] = 409,["566"] = 409,["567"] = 409,["568"] = 409,["569"] = 409,["570"] = 417,["571"] = 418,["572"] = 419,["573"] = 420,["574"] = 421,["575"] = 422,["576"] = 423,["577"] = 425,["578"] = 430,["579"] = 431,["580"] = 433,["581"] = 434,["582"] = 434,["583"] = 434,["584"] = 434,["585"] = 434,["586"] = 434,["587"] = 434,["588"] = 434,["589"] = 442,["592"] = 448,["593"] = 449,["595"] = 397,["596"] = 396,["597"] = 395,["598"] = 396,["600"] = 396});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local addLivingChitinStacks = ____evo_nyx_shared.addLivingChitinStacks
local applyAcousticDisruption = ____evo_nyx_shared.applyAcousticDisruption
local applyPsiResonance = ____evo_nyx_shared.applyPsiResonance
local detectNyxBranchAndTier = ____evo_nyx_shared.detectNyxBranchAndTier
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getLivingChitinStacks = ____evo_nyx_shared.getLivingChitinStacks
local getNyxAgi = ____evo_nyx_shared.getNyxAgi
local getNyxAllAttrSum = ____evo_nyx_shared.getNyxAllAttrSum
local getNyxHighestAttr = ____evo_nyx_shared.getNyxHighestAttr
require("abilities.nyx.evo_nyx_debuffs")
local SCRIPT_PATH = "abilities/nyx/evo_nyx_t1"
LinkLuaModifier("modifier_evo_nyx_living_chitin", SCRIPT_PATH, 0)
____exports.evo_nyx_living_chitin = __TS__Class()
local evo_nyx_living_chitin = ____exports.evo_nyx_living_chitin
evo_nyx_living_chitin.name = "evo_nyx_living_chitin"
__TS__ClassExtends(evo_nyx_living_chitin, BaseAbility)
function evo_nyx_living_chitin.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_living_chitin"
end
evo_nyx_living_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_living_chitin")},
    evo_nyx_living_chitin
)
____exports.evo_nyx_living_chitin = evo_nyx_living_chitin
____exports.evo_nyx_scarab_chitin = __TS__Class()
local evo_nyx_scarab_chitin = ____exports.evo_nyx_scarab_chitin
evo_nyx_scarab_chitin.name = "evo_nyx_scarab_chitin"
__TS__ClassExtends(evo_nyx_scarab_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_scarab_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_scarab_chitin")},
    evo_nyx_scarab_chitin
)
____exports.evo_nyx_scarab_chitin = evo_nyx_scarab_chitin
____exports.evo_nyx_scarab_chitin_t4 = __TS__Class()
local evo_nyx_scarab_chitin_t4 = ____exports.evo_nyx_scarab_chitin_t4
evo_nyx_scarab_chitin_t4.name = "evo_nyx_scarab_chitin_t4"
__TS__ClassExtends(evo_nyx_scarab_chitin_t4, ____exports.evo_nyx_living_chitin)
evo_nyx_scarab_chitin_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_scarab_chitin_t4")},
    evo_nyx_scarab_chitin_t4
)
____exports.evo_nyx_scarab_chitin_t4 = evo_nyx_scarab_chitin_t4
____exports.evo_nyx_mantis_chitin = __TS__Class()
local evo_nyx_mantis_chitin = ____exports.evo_nyx_mantis_chitin
evo_nyx_mantis_chitin.name = "evo_nyx_mantis_chitin"
__TS__ClassExtends(evo_nyx_mantis_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_mantis_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_chitin")},
    evo_nyx_mantis_chitin
)
____exports.evo_nyx_mantis_chitin = evo_nyx_mantis_chitin
____exports.evo_nyx_mantis_chitin_t4 = __TS__Class()
local evo_nyx_mantis_chitin_t4 = ____exports.evo_nyx_mantis_chitin_t4
evo_nyx_mantis_chitin_t4.name = "evo_nyx_mantis_chitin_t4"
__TS__ClassExtends(evo_nyx_mantis_chitin_t4, ____exports.evo_nyx_living_chitin)
evo_nyx_mantis_chitin_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_chitin_t4")},
    evo_nyx_mantis_chitin_t4
)
____exports.evo_nyx_mantis_chitin_t4 = evo_nyx_mantis_chitin_t4
____exports.evo_nyx_archon_chitin = __TS__Class()
local evo_nyx_archon_chitin = ____exports.evo_nyx_archon_chitin
evo_nyx_archon_chitin.name = "evo_nyx_archon_chitin"
__TS__ClassExtends(evo_nyx_archon_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_archon_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_chitin")},
    evo_nyx_archon_chitin
)
____exports.evo_nyx_archon_chitin = evo_nyx_archon_chitin
____exports.evo_nyx_archon_chitin_t4 = __TS__Class()
local evo_nyx_archon_chitin_t4 = ____exports.evo_nyx_archon_chitin_t4
evo_nyx_archon_chitin_t4.name = "evo_nyx_archon_chitin_t4"
__TS__ClassExtends(evo_nyx_archon_chitin_t4, ____exports.evo_nyx_living_chitin)
evo_nyx_archon_chitin_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_chitin_t4")},
    evo_nyx_archon_chitin_t4
)
____exports.evo_nyx_archon_chitin_t4 = evo_nyx_archon_chitin_t4
____exports.evo_nyx_cicada_chitin = __TS__Class()
local evo_nyx_cicada_chitin = ____exports.evo_nyx_cicada_chitin
evo_nyx_cicada_chitin.name = "evo_nyx_cicada_chitin"
__TS__ClassExtends(evo_nyx_cicada_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_cicada_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_chitin")},
    evo_nyx_cicada_chitin
)
____exports.evo_nyx_cicada_chitin = evo_nyx_cicada_chitin
____exports.evo_nyx_cicada_chitin_t3 = __TS__Class()
local evo_nyx_cicada_chitin_t3 = ____exports.evo_nyx_cicada_chitin_t3
evo_nyx_cicada_chitin_t3.name = "evo_nyx_cicada_chitin_t3"
__TS__ClassExtends(evo_nyx_cicada_chitin_t3, ____exports.evo_nyx_living_chitin)
evo_nyx_cicada_chitin_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_chitin_t3")},
    evo_nyx_cicada_chitin_t3
)
____exports.evo_nyx_cicada_chitin_t3 = evo_nyx_cicada_chitin_t3
____exports.evo_nyx_cicada_chitin_t4 = __TS__Class()
local evo_nyx_cicada_chitin_t4 = ____exports.evo_nyx_cicada_chitin_t4
evo_nyx_cicada_chitin_t4.name = "evo_nyx_cicada_chitin_t4"
__TS__ClassExtends(evo_nyx_cicada_chitin_t4, ____exports.evo_nyx_living_chitin)
evo_nyx_cicada_chitin_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_chitin_t4")},
    evo_nyx_cicada_chitin_t4
)
____exports.evo_nyx_cicada_chitin_t4 = evo_nyx_cicada_chitin_t4
____exports.modifier_evo_nyx_living_chitin = __TS__Class()
local modifier_evo_nyx_living_chitin = ____exports.modifier_evo_nyx_living_chitin
modifier_evo_nyx_living_chitin.name = "modifier_evo_nyx_living_chitin"
__TS__ClassExtends(modifier_evo_nyx_living_chitin, BaseModifier)
function modifier_evo_nyx_living_chitin.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.stackAccum = 0
    self.cicadaDistAccum = 0
    self.lastPsiRestoreTime = -999
    self.empoweredUntil = -999
    self.empoweredAbilityName = ""
    self.burnHeroRecords = __TS__New(Set)
end
function modifier_evo_nyx_living_chitin.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.GetTexture(self)
    return "nyx_assassin_spiked_carapace"
end
function modifier_evo_nyx_living_chitin.prototype.OnCreated(self)
    self.stackAccum = 0
    self.cicadaDistAccum = 0
    self.lastPos = nil
    self.lastPsiRestoreTime = -999
    self.empoweredUntil = -999
    self.empoweredAbilityName = ""
    self.burnHeroRecords = __TS__New(Set)
    if not IsServer() then
        return
    end
    self:SetStackCount(1)
    self.lastPos = self:GetParent():GetAbsOrigin()
    self:StartIntervalThink(0.1)
end
function modifier_evo_nyx_living_chitin.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not ability or ability:IsNull() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    if parent:IsAlive() then
        self.stackAccum = self.stackAccum + 0.1
        local interval = ability:GetSpecialValueFor("stack_interval")
        if self.stackAccum >= interval then
            self.stackAccum = self.stackAccum - interval
            if self:GetStackCount() < maxStacks then
                self:IncrementStackCount()
            end
        end
        if info.branch == "CICADA" then
            local pos = parent:GetAbsOrigin()
            if self.lastPos then
                local delta = (pos - self.lastPos):Length2D()
                if delta > 0 and delta < 900 then
                    self.cicadaDistAccum = self.cicadaDistAccum + delta
                    if self.cicadaDistAccum >= 550 then
                        self.cicadaDistAccum = self.cicadaDistAccum - 550
                        if self:GetStackCount() < maxStacks then
                            self:IncrementStackCount()
                        end
                    end
                end
            end
            self.lastPos = pos
        else
            self.lastPos = parent:GetAbsOrigin()
        end
    else
        self.lastPos = parent:GetAbsOrigin()
    end
end
function modifier_evo_nyx_living_chitin.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierPhysicalArmorBonus(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("armor_per_stack")
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierMagicalResistanceBonus(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("mr_per_stack")
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    local parent = self:GetParent()
    local stacks = self:GetStackCount()
    local bonus = stacks * ability:GetSpecialValueFor("ms_per_stack")
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "CICADA" and info.tier >= 3 and stacks >= 3 then
        bonus = bonus + (info.tier >= 4 and 18 or 12)
    end
    return bonus
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierBonusStats_Strength(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "SCARAB" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 7 or 4)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierStatusResistanceStacking(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "SCARAB" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 15 or 10)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "MANTIS" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 16 or 10)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierSpellAmplification_Percentage(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "ARCHON" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 6 or 4)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierCastRangeBonusStacking(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "ARCHON" or info.tier < 3 or self:GetStackCount() < 1 then
        return 0
    end
    return info.tier >= 4 and 225 or 150
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierTotal_ConstantBlock(self, event)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return 0
    end
    if parent:PassivesDisabled() then
        return 0
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return 0
    end
    if event.damage <= 0 or self:GetStackCount() <= 0 then
        return 0
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "CICADA" or info.tier >= 3 then
        return 0
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsRealHero() then
        return 0
    end
    if attacker:GetTeamNumber() == parent:GetTeamNumber() then
        return 0
    end
    self:DecrementStackCount()
    local attrVal = getNyxHighestAttr(nil, parent)
    local block = ability:GetSpecialValueFor("base_block") + attrVal * ability:GetSpecialValueFor("block_attr_pct") / 100
    local pulseDmg = ability:GetSpecialValueFor("pulse_damage")
    local pulseRadius = ability:GetSpecialValueFor("pulse_radius")
    parent:EmitSound("Hero_NyxAssassin.SpikedCarapace")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf", 1, parent)
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = findEnemiesInRadius(
        nil,
        parent,
        parent:GetAbsOrigin(),
        pulseRadius
    )
    for ____, enemy in ipairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = pulseDmg,
            damage_type = 2,
            damage_flags = 16
        })
    end
    return block
end
function modifier_evo_nyx_living_chitin.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    if self:GetStackCount() < maxStacks then
        self:IncrementStackCount()
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "MANTIS" and info.tier >= 3 and self:GetStackCount() >= 3 and not target:IsBuilding() then
        local basePure = info.tier >= 4 and 35 or 20
        local pureDmg = basePure + getNyxAgi(nil, parent) * 0.2
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ability,
            damage = pureDmg,
            damage_type = 4,
            damage_flags = 1024
        })
    end
    if info.branch == "CICADA" and self:GetStackCount() >= 3 then
        self:releaseCicadaSonicRing(
            parent,
            ability,
            info.tier,
            target:GetAbsOrigin()
        )
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.unit ~= parent or parent:PassivesDisabled() then
        return
    end
    local castAb = event.ability
    if not castAb or castAb:IsNull() or castAb:IsItem() or castAb:IsToggle() then
        return
    end
    local abName = castAb:GetAbilityName()
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "ARCHON" and info.tier >= 3 then
        if (abName == "lion_impale" or abName == "evo_nyx_archon_w") and self:GetStackCount() >= 1 then
            self:DecrementStackCount()
            self.empoweredUntil = GameRules:GetDOTATime(false, false) + 1.5
            self.empoweredAbilityName = abName
            self.burnHeroRecords = __TS__New(Set)
        end
    end
    if info.branch == "CICADA" then
        if self:GetStackCount() >= 3 then
            self:releaseCicadaSonicRing(
                parent,
                ability,
                info.tier,
                parent:GetAbsOrigin()
            )
        else
            local maxStacks = ability:GetSpecialValueFor("max_stacks")
            if self:GetStackCount() < maxStacks then
                self:IncrementStackCount()
            end
        end
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local victim = event.unit
    if not victim or victim:IsNull() or not IsValidEntity(victim) or victim:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local inflictor = event.inflictor
    if not inflictor or inflictor:IsNull() or inflictor:IsItem() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch ~= "ARCHON" or info.tier < 3 then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now <= self.empoweredUntil and inflictor:GetAbilityName() == self.empoweredAbilityName and victim:IsRealHero() and not self.burnHeroRecords:has(victim:GetEntityIndex()) then
        self.burnHeroRecords:add(victim:GetEntityIndex())
        local burnPct = info.tier >= 4 and 0.09 or 0.06
        local burn = victim:GetMaxMana() * burnPct
        if burn > 0 then
            victim:Script_ReduceMana(burn, inflictor)
            parent:GiveMana(burn * 0.5)
        end
        applyPsiResonance(
            nil,
            parent,
            victim,
            inflictor,
            info.tier - 1
        )
    end
    if victim:HasModifier("modifier_evo_nyx_psi_resonance") and now - self.lastPsiRestoreTime >= 3 then
        self.lastPsiRestoreTime = now
        addLivingChitinStacks(nil, parent, 1)
    end
end
function modifier_evo_nyx_living_chitin.prototype.releaseCicadaSonicRing(self, parent, ability, tier, origin)
    self:SetStackCount(0)
    local base = tier >= 4 and 80 or (tier >= 3 and 45 or 35)
    local pct = tier >= 4 and 0.35 or (tier >= 3 and 0.25 or 0.15)
    local dmg = base + getNyxAllAttrSum(nil, parent) * pct
    local debuffTier = math.max(1, tier - 1)
    parent:EmitSound("Hero_QueenOfPain.SonicWave")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_razor/razor_plasmafield_shockwave.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(325, 325, 1)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = findEnemiesInRadius(nil, parent, origin, 325)
    for ____, enemy in ipairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = dmg,
            damage_type = 2
        })
        applyAcousticDisruption(
            nil,
            parent,
            enemy,
            ability,
            debuffTier
        )
    end
    if tier >= 3 then
        local asMod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_cicada_chitin_as", {duration = 3})
        if asMod ~= nil then
            asMod:SetStackCount(tier >= 4 and 45 or 30)
        end
    end
end
modifier_evo_nyx_living_chitin = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_living_chitin")},
    modifier_evo_nyx_living_chitin
)
____exports.modifier_evo_nyx_living_chitin = modifier_evo_nyx_living_chitin
____exports.evo_nyx_t1_chitin_burst = __TS__Class()
local evo_nyx_t1_chitin_burst = ____exports.evo_nyx_t1_chitin_burst
evo_nyx_t1_chitin_burst.name = "evo_nyx_t1_chitin_burst"
__TS__ClassExtends(evo_nyx_t1_chitin_burst, BaseAbility)
function evo_nyx_t1_chitin_burst.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target or target:IsNull() or not IsValidEntity(target) or target:TriggerSpellAbsorb(self) then
        return
    end
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local dmg = baseDmg + getNyxHighestAttr(nil, caster) * attrPct
    caster:EmitSound("Hero_NyxAssassin.Vendetta.Crit")
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = dmg,
        damage_type = 1
    })
    local stacks = getLivingChitinStacks(nil, caster)
    if stacks > 0 then
        addLivingChitinStacks(nil, caster, -stacks)
        local burstDmg = stacks * self:GetSpecialValueFor("burst_per_stack")
        local radius = self:GetSpecialValueFor("burst_radius")
        local slowDuration = self:GetSpecialValueFor("slow_duration")
        local hitPos = target:GetAbsOrigin()
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf", 8, nil)
        ParticleManager:SetParticleControl(pfx, 0, hitPos)
        ParticleManager:ReleaseParticleIndex(pfx)
        for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, hitPos, radius)) do
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = burstDmg,
                damage_type = 4,
                damage_flags = 1024
            })
            enemy:AddNewModifier(caster, self, "modifier_evo_nyx_t1_burst_slow", {duration = slowDuration})
        end
    end
    if isEvoCreepUnit(nil, target) and (not target:IsAlive() or target:GetHealth() <= 0) then
        addLivingChitinStacks(nil, caster, 1)
    end
end
evo_nyx_t1_chitin_burst = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_t1_chitin_burst")},
    evo_nyx_t1_chitin_burst
)
____exports.evo_nyx_t1_chitin_burst = evo_nyx_t1_chitin_burst
return ____exports
