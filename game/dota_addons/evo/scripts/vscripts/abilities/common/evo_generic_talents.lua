local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 9,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 19,["33"] = 22,["34"] = 23,["35"] = 22,["36"] = 25,["37"] = 26,["38"] = 25,["39"] = 30,["40"] = 31,["41"] = 30,["42"] = 31,["43"] = 32,["44"] = 33,["45"] = 32,["46"] = 31,["47"] = 30,["48"] = 31,["50"] = 31,["51"] = 37,["52"] = 38,["53"] = 37,["54"] = 38,["55"] = 39,["56"] = 40,["57"] = 40,["58"] = 40,["59"] = 40,["60"] = 39,["61"] = 45,["62"] = 46,["63"] = 45,["64"] = 48,["65"] = 49,["66"] = 48,["67"] = 38,["68"] = 37,["69"] = 38,["71"] = 38,["72"] = 53,["73"] = 54,["74"] = 53,["75"] = 54,["76"] = 55,["77"] = 56,["78"] = 55,["79"] = 54,["80"] = 53,["81"] = 54,["83"] = 54,["84"] = 60,["85"] = 61,["86"] = 60,["87"] = 61,["88"] = 62,["89"] = 63,["90"] = 63,["91"] = 63,["92"] = 63,["93"] = 62,["94"] = 68,["95"] = 69,["96"] = 68,["97"] = 71,["98"] = 72,["99"] = 71,["100"] = 61,["101"] = 60,["102"] = 61,["104"] = 61,["105"] = 76,["106"] = 77,["107"] = 76,["108"] = 77,["109"] = 78,["110"] = 79,["111"] = 78,["112"] = 77,["113"] = 76,["114"] = 77,["116"] = 77,["117"] = 83,["118"] = 84,["119"] = 83,["120"] = 84,["121"] = 85,["122"] = 86,["123"] = 85,["124"] = 88,["125"] = 89,["126"] = 88,["127"] = 84,["128"] = 83,["129"] = 84,["131"] = 84,["132"] = 93,["133"] = 94,["134"] = 93,["135"] = 94,["136"] = 95,["137"] = 96,["138"] = 95,["139"] = 94,["140"] = 93,["141"] = 94,["143"] = 94,["144"] = 100,["145"] = 101,["146"] = 100,["147"] = 101,["148"] = 102,["149"] = 103,["150"] = 102,["151"] = 105,["152"] = 106,["153"] = 105,["154"] = 101,["155"] = 100,["156"] = 101,["158"] = 101,["159"] = 110,["160"] = 111,["161"] = 110,["162"] = 111,["163"] = 112,["164"] = 113,["165"] = 112,["166"] = 111,["167"] = 110,["168"] = 111,["170"] = 111,["171"] = 117,["172"] = 118,["173"] = 117,["174"] = 118,["175"] = 119,["176"] = 120,["177"] = 119,["178"] = 122,["179"] = 123,["180"] = 122,["181"] = 118,["182"] = 117,["183"] = 118,["185"] = 118,["186"] = 127,["187"] = 128,["188"] = 127,["189"] = 128,["190"] = 129,["191"] = 130,["192"] = 129,["193"] = 128,["194"] = 127,["195"] = 128,["197"] = 128,["198"] = 134,["199"] = 135,["200"] = 134,["201"] = 135,["202"] = 136,["203"] = 137,["204"] = 136,["205"] = 139,["206"] = 140,["207"] = 139,["208"] = 135,["209"] = 134,["210"] = 135,["212"] = 135,["213"] = 144,["214"] = 145,["215"] = 144,["216"] = 145,["217"] = 146,["218"] = 147,["219"] = 146,["220"] = 145,["221"] = 144,["222"] = 145,["224"] = 145,["225"] = 151,["226"] = 152,["227"] = 151,["228"] = 152,["229"] = 153,["230"] = 154,["231"] = 154,["232"] = 154,["233"] = 154,["234"] = 154,["235"] = 153,["236"] = 160,["237"] = 161,["238"] = 160,["239"] = 163,["240"] = 164,["241"] = 163,["242"] = 166,["243"] = 167,["244"] = 166,["245"] = 152,["246"] = 151,["247"] = 152,["249"] = 152,["250"] = 171,["251"] = 172,["252"] = 171,["253"] = 172,["254"] = 173,["255"] = 174,["256"] = 173,["257"] = 172,["258"] = 171,["259"] = 172,["261"] = 172,["262"] = 178,["263"] = 179,["264"] = 178,["265"] = 179,["266"] = 180,["267"] = 181,["268"] = 180,["269"] = 183,["270"] = 184,["271"] = 183,["272"] = 179,["273"] = 178,["274"] = 179,["276"] = 179,["277"] = 188,["278"] = 189,["279"] = 188,["280"] = 189,["281"] = 190,["282"] = 191,["283"] = 190,["284"] = 189,["285"] = 188,["286"] = 189,["288"] = 189,["289"] = 195,["290"] = 196,["291"] = 195,["292"] = 196,["293"] = 197,["294"] = 198,["295"] = 197,["296"] = 200,["297"] = 201,["298"] = 200,["299"] = 196,["300"] = 195,["301"] = 196,["303"] = 196,["304"] = 205,["305"] = 206,["306"] = 205,["307"] = 206,["308"] = 207,["309"] = 208,["310"] = 207,["311"] = 206,["312"] = 205,["313"] = 206,["315"] = 206,["316"] = 212,["317"] = 213,["318"] = 212,["319"] = 213,["320"] = 214,["321"] = 215,["322"] = 214,["323"] = 217,["324"] = 218,["325"] = 217,["326"] = 213,["327"] = 212,["328"] = 213,["330"] = 213,["331"] = 222,["332"] = 223,["333"] = 222,["334"] = 223,["335"] = 224,["336"] = 225,["337"] = 224,["338"] = 223,["339"] = 222,["340"] = 223,["342"] = 223,["343"] = 229,["344"] = 230,["345"] = 229,["346"] = 230,["347"] = 231,["348"] = 232,["349"] = 231,["350"] = 234,["351"] = 235,["352"] = 234,["353"] = 230,["354"] = 229,["355"] = 230,["357"] = 230,["358"] = 239,["359"] = 240,["360"] = 239,["361"] = 240,["362"] = 241,["363"] = 242,["364"] = 241,["365"] = 240,["366"] = 239,["367"] = 240,["369"] = 240,["370"] = 246,["371"] = 247,["372"] = 246,["373"] = 247,["374"] = 248,["375"] = 249,["376"] = 248,["377"] = 251,["378"] = 252,["379"] = 251,["380"] = 247,["381"] = 246,["382"] = 247,["384"] = 247});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/common/evo_generic_talents"
LinkLuaModifier("modifier_special_bonus_evo_agi_int_1", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_int_str_1", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_hp_100", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_mana_125", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_ms_25", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_armor_6", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_all_stats_5", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_magic_resist_15", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_hp_regen_15", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_mana_regen_75", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_damage_75", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_special_bonus_evo_spell_amp_28", SCRIPT_PATH, 0)
local BaseTalentModifier = __TS__Class()
BaseTalentModifier.name = "BaseTalentModifier"
__TS__ClassExtends(BaseTalentModifier, BaseModifier)
function BaseTalentModifier.prototype.IsHidden(self)
    return true
end
function BaseTalentModifier.prototype.IsPurgable(self)
    return false
end
function BaseTalentModifier.prototype.RemoveOnDeath(self)
    return false
end
____exports.special_bonus_evo_agi_int_1 = __TS__Class()
local special_bonus_evo_agi_int_1 = ____exports.special_bonus_evo_agi_int_1
special_bonus_evo_agi_int_1.name = "special_bonus_evo_agi_int_1"
__TS__ClassExtends(special_bonus_evo_agi_int_1, BaseAbility)
function special_bonus_evo_agi_int_1.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_agi_int_1"
end
special_bonus_evo_agi_int_1 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_agi_int_1")},
    special_bonus_evo_agi_int_1
)
____exports.special_bonus_evo_agi_int_1 = special_bonus_evo_agi_int_1
____exports.modifier_special_bonus_evo_agi_int_1 = __TS__Class()
local modifier_special_bonus_evo_agi_int_1 = ____exports.modifier_special_bonus_evo_agi_int_1
modifier_special_bonus_evo_agi_int_1.name = "modifier_special_bonus_evo_agi_int_1"
__TS__ClassExtends(modifier_special_bonus_evo_agi_int_1, BaseTalentModifier)
function modifier_special_bonus_evo_agi_int_1.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function modifier_special_bonus_evo_agi_int_1.prototype.GetModifierBonusStats_Agility(self)
    return 1
end
function modifier_special_bonus_evo_agi_int_1.prototype.GetModifierBonusStats_Intellect(self)
    return 1
end
modifier_special_bonus_evo_agi_int_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_agi_int_1")},
    modifier_special_bonus_evo_agi_int_1
)
____exports.modifier_special_bonus_evo_agi_int_1 = modifier_special_bonus_evo_agi_int_1
____exports.special_bonus_evo_int_str_1 = __TS__Class()
local special_bonus_evo_int_str_1 = ____exports.special_bonus_evo_int_str_1
special_bonus_evo_int_str_1.name = "special_bonus_evo_int_str_1"
__TS__ClassExtends(special_bonus_evo_int_str_1, BaseAbility)
function special_bonus_evo_int_str_1.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_int_str_1"
end
special_bonus_evo_int_str_1 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_int_str_1")},
    special_bonus_evo_int_str_1
)
____exports.special_bonus_evo_int_str_1 = special_bonus_evo_int_str_1
____exports.modifier_special_bonus_evo_int_str_1 = __TS__Class()
local modifier_special_bonus_evo_int_str_1 = ____exports.modifier_special_bonus_evo_int_str_1
modifier_special_bonus_evo_int_str_1.name = "modifier_special_bonus_evo_int_str_1"
__TS__ClassExtends(modifier_special_bonus_evo_int_str_1, BaseTalentModifier)
function modifier_special_bonus_evo_int_str_1.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS")
    }
end
function modifier_special_bonus_evo_int_str_1.prototype.GetModifierBonusStats_Intellect(self)
    return 1
end
function modifier_special_bonus_evo_int_str_1.prototype.GetModifierBonusStats_Strength(self)
    return 1
end
modifier_special_bonus_evo_int_str_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_int_str_1")},
    modifier_special_bonus_evo_int_str_1
)
____exports.modifier_special_bonus_evo_int_str_1 = modifier_special_bonus_evo_int_str_1
____exports.special_bonus_evo_hp_100 = __TS__Class()
local special_bonus_evo_hp_100 = ____exports.special_bonus_evo_hp_100
special_bonus_evo_hp_100.name = "special_bonus_evo_hp_100"
__TS__ClassExtends(special_bonus_evo_hp_100, BaseAbility)
function special_bonus_evo_hp_100.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_hp_100"
end
special_bonus_evo_hp_100 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_hp_100")},
    special_bonus_evo_hp_100
)
____exports.special_bonus_evo_hp_100 = special_bonus_evo_hp_100
____exports.modifier_special_bonus_evo_hp_100 = __TS__Class()
local modifier_special_bonus_evo_hp_100 = ____exports.modifier_special_bonus_evo_hp_100
modifier_special_bonus_evo_hp_100.name = "modifier_special_bonus_evo_hp_100"
__TS__ClassExtends(modifier_special_bonus_evo_hp_100, BaseTalentModifier)
function modifier_special_bonus_evo_hp_100.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_BONUS")}
end
function modifier_special_bonus_evo_hp_100.prototype.GetModifierHealthBonus(self)
    return 100
end
modifier_special_bonus_evo_hp_100 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_hp_100")},
    modifier_special_bonus_evo_hp_100
)
____exports.modifier_special_bonus_evo_hp_100 = modifier_special_bonus_evo_hp_100
____exports.special_bonus_evo_mana_125 = __TS__Class()
local special_bonus_evo_mana_125 = ____exports.special_bonus_evo_mana_125
special_bonus_evo_mana_125.name = "special_bonus_evo_mana_125"
__TS__ClassExtends(special_bonus_evo_mana_125, BaseAbility)
function special_bonus_evo_mana_125.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_mana_125"
end
special_bonus_evo_mana_125 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_mana_125")},
    special_bonus_evo_mana_125
)
____exports.special_bonus_evo_mana_125 = special_bonus_evo_mana_125
____exports.modifier_special_bonus_evo_mana_125 = __TS__Class()
local modifier_special_bonus_evo_mana_125 = ____exports.modifier_special_bonus_evo_mana_125
modifier_special_bonus_evo_mana_125.name = "modifier_special_bonus_evo_mana_125"
__TS__ClassExtends(modifier_special_bonus_evo_mana_125, BaseTalentModifier)
function modifier_special_bonus_evo_mana_125.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_BONUS")}
end
function modifier_special_bonus_evo_mana_125.prototype.GetModifierManaBonus(self)
    return 125
end
modifier_special_bonus_evo_mana_125 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_mana_125")},
    modifier_special_bonus_evo_mana_125
)
____exports.modifier_special_bonus_evo_mana_125 = modifier_special_bonus_evo_mana_125
____exports.special_bonus_evo_ms_25 = __TS__Class()
local special_bonus_evo_ms_25 = ____exports.special_bonus_evo_ms_25
special_bonus_evo_ms_25.name = "special_bonus_evo_ms_25"
__TS__ClassExtends(special_bonus_evo_ms_25, BaseAbility)
function special_bonus_evo_ms_25.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_ms_25"
end
special_bonus_evo_ms_25 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_ms_25")},
    special_bonus_evo_ms_25
)
____exports.special_bonus_evo_ms_25 = special_bonus_evo_ms_25
____exports.modifier_special_bonus_evo_ms_25 = __TS__Class()
local modifier_special_bonus_evo_ms_25 = ____exports.modifier_special_bonus_evo_ms_25
modifier_special_bonus_evo_ms_25.name = "modifier_special_bonus_evo_ms_25"
__TS__ClassExtends(modifier_special_bonus_evo_ms_25, BaseTalentModifier)
function modifier_special_bonus_evo_ms_25.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT")}
end
function modifier_special_bonus_evo_ms_25.prototype.GetModifierMoveSpeedBonus_Constant(self)
    return 25
end
modifier_special_bonus_evo_ms_25 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_ms_25")},
    modifier_special_bonus_evo_ms_25
)
____exports.modifier_special_bonus_evo_ms_25 = modifier_special_bonus_evo_ms_25
____exports.special_bonus_evo_armor_6 = __TS__Class()
local special_bonus_evo_armor_6 = ____exports.special_bonus_evo_armor_6
special_bonus_evo_armor_6.name = "special_bonus_evo_armor_6"
__TS__ClassExtends(special_bonus_evo_armor_6, BaseAbility)
function special_bonus_evo_armor_6.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_armor_6"
end
special_bonus_evo_armor_6 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_armor_6")},
    special_bonus_evo_armor_6
)
____exports.special_bonus_evo_armor_6 = special_bonus_evo_armor_6
____exports.modifier_special_bonus_evo_armor_6 = __TS__Class()
local modifier_special_bonus_evo_armor_6 = ____exports.modifier_special_bonus_evo_armor_6
modifier_special_bonus_evo_armor_6.name = "modifier_special_bonus_evo_armor_6"
__TS__ClassExtends(modifier_special_bonus_evo_armor_6, BaseTalentModifier)
function modifier_special_bonus_evo_armor_6.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_special_bonus_evo_armor_6.prototype.GetModifierPhysicalArmorBonus(self)
    return 6
end
modifier_special_bonus_evo_armor_6 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_armor_6")},
    modifier_special_bonus_evo_armor_6
)
____exports.modifier_special_bonus_evo_armor_6 = modifier_special_bonus_evo_armor_6
____exports.special_bonus_evo_all_stats_5 = __TS__Class()
local special_bonus_evo_all_stats_5 = ____exports.special_bonus_evo_all_stats_5
special_bonus_evo_all_stats_5.name = "special_bonus_evo_all_stats_5"
__TS__ClassExtends(special_bonus_evo_all_stats_5, BaseAbility)
function special_bonus_evo_all_stats_5.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_all_stats_5"
end
special_bonus_evo_all_stats_5 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_all_stats_5")},
    special_bonus_evo_all_stats_5
)
____exports.special_bonus_evo_all_stats_5 = special_bonus_evo_all_stats_5
____exports.modifier_special_bonus_evo_all_stats_5 = __TS__Class()
local modifier_special_bonus_evo_all_stats_5 = ____exports.modifier_special_bonus_evo_all_stats_5
modifier_special_bonus_evo_all_stats_5.name = "modifier_special_bonus_evo_all_stats_5"
__TS__ClassExtends(modifier_special_bonus_evo_all_stats_5, BaseTalentModifier)
function modifier_special_bonus_evo_all_stats_5.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function modifier_special_bonus_evo_all_stats_5.prototype.GetModifierBonusStats_Strength(self)
    return 5
end
function modifier_special_bonus_evo_all_stats_5.prototype.GetModifierBonusStats_Agility(self)
    return 5
end
function modifier_special_bonus_evo_all_stats_5.prototype.GetModifierBonusStats_Intellect(self)
    return 5
end
modifier_special_bonus_evo_all_stats_5 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_all_stats_5")},
    modifier_special_bonus_evo_all_stats_5
)
____exports.modifier_special_bonus_evo_all_stats_5 = modifier_special_bonus_evo_all_stats_5
____exports.special_bonus_evo_magic_resist_15 = __TS__Class()
local special_bonus_evo_magic_resist_15 = ____exports.special_bonus_evo_magic_resist_15
special_bonus_evo_magic_resist_15.name = "special_bonus_evo_magic_resist_15"
__TS__ClassExtends(special_bonus_evo_magic_resist_15, BaseAbility)
function special_bonus_evo_magic_resist_15.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_magic_resist_15"
end
special_bonus_evo_magic_resist_15 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_magic_resist_15")},
    special_bonus_evo_magic_resist_15
)
____exports.special_bonus_evo_magic_resist_15 = special_bonus_evo_magic_resist_15
____exports.modifier_special_bonus_evo_magic_resist_15 = __TS__Class()
local modifier_special_bonus_evo_magic_resist_15 = ____exports.modifier_special_bonus_evo_magic_resist_15
modifier_special_bonus_evo_magic_resist_15.name = "modifier_special_bonus_evo_magic_resist_15"
__TS__ClassExtends(modifier_special_bonus_evo_magic_resist_15, BaseTalentModifier)
function modifier_special_bonus_evo_magic_resist_15.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")}
end
function modifier_special_bonus_evo_magic_resist_15.prototype.GetModifierMagicalResistanceBonus(self)
    return 15
end
modifier_special_bonus_evo_magic_resist_15 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_magic_resist_15")},
    modifier_special_bonus_evo_magic_resist_15
)
____exports.modifier_special_bonus_evo_magic_resist_15 = modifier_special_bonus_evo_magic_resist_15
____exports.special_bonus_evo_hp_regen_15 = __TS__Class()
local special_bonus_evo_hp_regen_15 = ____exports.special_bonus_evo_hp_regen_15
special_bonus_evo_hp_regen_15.name = "special_bonus_evo_hp_regen_15"
__TS__ClassExtends(special_bonus_evo_hp_regen_15, BaseAbility)
function special_bonus_evo_hp_regen_15.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_hp_regen_15"
end
special_bonus_evo_hp_regen_15 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_hp_regen_15")},
    special_bonus_evo_hp_regen_15
)
____exports.special_bonus_evo_hp_regen_15 = special_bonus_evo_hp_regen_15
____exports.modifier_special_bonus_evo_hp_regen_15 = __TS__Class()
local modifier_special_bonus_evo_hp_regen_15 = ____exports.modifier_special_bonus_evo_hp_regen_15
modifier_special_bonus_evo_hp_regen_15.name = "modifier_special_bonus_evo_hp_regen_15"
__TS__ClassExtends(modifier_special_bonus_evo_hp_regen_15, BaseTalentModifier)
function modifier_special_bonus_evo_hp_regen_15.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")}
end
function modifier_special_bonus_evo_hp_regen_15.prototype.GetModifierConstantHealthRegen(self)
    return 15
end
modifier_special_bonus_evo_hp_regen_15 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_hp_regen_15")},
    modifier_special_bonus_evo_hp_regen_15
)
____exports.modifier_special_bonus_evo_hp_regen_15 = modifier_special_bonus_evo_hp_regen_15
____exports.special_bonus_evo_mana_regen_75 = __TS__Class()
local special_bonus_evo_mana_regen_75 = ____exports.special_bonus_evo_mana_regen_75
special_bonus_evo_mana_regen_75.name = "special_bonus_evo_mana_regen_75"
__TS__ClassExtends(special_bonus_evo_mana_regen_75, BaseAbility)
function special_bonus_evo_mana_regen_75.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_mana_regen_75"
end
special_bonus_evo_mana_regen_75 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_mana_regen_75")},
    special_bonus_evo_mana_regen_75
)
____exports.special_bonus_evo_mana_regen_75 = special_bonus_evo_mana_regen_75
____exports.modifier_special_bonus_evo_mana_regen_75 = __TS__Class()
local modifier_special_bonus_evo_mana_regen_75 = ____exports.modifier_special_bonus_evo_mana_regen_75
modifier_special_bonus_evo_mana_regen_75.name = "modifier_special_bonus_evo_mana_regen_75"
__TS__ClassExtends(modifier_special_bonus_evo_mana_regen_75, BaseTalentModifier)
function modifier_special_bonus_evo_mana_regen_75.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT")}
end
function modifier_special_bonus_evo_mana_regen_75.prototype.GetModifierConstantManaRegen(self)
    return 7.5
end
modifier_special_bonus_evo_mana_regen_75 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_mana_regen_75")},
    modifier_special_bonus_evo_mana_regen_75
)
____exports.modifier_special_bonus_evo_mana_regen_75 = modifier_special_bonus_evo_mana_regen_75
____exports.special_bonus_evo_damage_75 = __TS__Class()
local special_bonus_evo_damage_75 = ____exports.special_bonus_evo_damage_75
special_bonus_evo_damage_75.name = "special_bonus_evo_damage_75"
__TS__ClassExtends(special_bonus_evo_damage_75, BaseAbility)
function special_bonus_evo_damage_75.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_damage_75"
end
special_bonus_evo_damage_75 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_damage_75")},
    special_bonus_evo_damage_75
)
____exports.special_bonus_evo_damage_75 = special_bonus_evo_damage_75
____exports.modifier_special_bonus_evo_damage_75 = __TS__Class()
local modifier_special_bonus_evo_damage_75 = ____exports.modifier_special_bonus_evo_damage_75
modifier_special_bonus_evo_damage_75.name = "modifier_special_bonus_evo_damage_75"
__TS__ClassExtends(modifier_special_bonus_evo_damage_75, BaseTalentModifier)
function modifier_special_bonus_evo_damage_75.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE")}
end
function modifier_special_bonus_evo_damage_75.prototype.GetModifierPreAttack_BonusDamage(self)
    return 75
end
modifier_special_bonus_evo_damage_75 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_damage_75")},
    modifier_special_bonus_evo_damage_75
)
____exports.modifier_special_bonus_evo_damage_75 = modifier_special_bonus_evo_damage_75
____exports.special_bonus_evo_spell_amp_28 = __TS__Class()
local special_bonus_evo_spell_amp_28 = ____exports.special_bonus_evo_spell_amp_28
special_bonus_evo_spell_amp_28.name = "special_bonus_evo_spell_amp_28"
__TS__ClassExtends(special_bonus_evo_spell_amp_28, BaseAbility)
function special_bonus_evo_spell_amp_28.prototype.GetIntrinsicModifierName(self)
    return "modifier_special_bonus_evo_spell_amp_28"
end
special_bonus_evo_spell_amp_28 = __TS__DecorateLegacy(
    {registerAbility(nil, "special_bonus_evo_spell_amp_28")},
    special_bonus_evo_spell_amp_28
)
____exports.special_bonus_evo_spell_amp_28 = special_bonus_evo_spell_amp_28
____exports.modifier_special_bonus_evo_spell_amp_28 = __TS__Class()
local modifier_special_bonus_evo_spell_amp_28 = ____exports.modifier_special_bonus_evo_spell_amp_28
modifier_special_bonus_evo_spell_amp_28.name = "modifier_special_bonus_evo_spell_amp_28"
__TS__ClassExtends(modifier_special_bonus_evo_spell_amp_28, BaseTalentModifier)
function modifier_special_bonus_evo_spell_amp_28.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE")}
end
function modifier_special_bonus_evo_spell_amp_28.prototype.GetModifierSpellAmplify_Percentage(self)
    return 28
end
modifier_special_bonus_evo_spell_amp_28 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_special_bonus_evo_spell_amp_28")},
    modifier_special_bonus_evo_spell_amp_28
)
____exports.modifier_special_bonus_evo_spell_amp_28 = modifier_special_bonus_evo_spell_amp_28
return ____exports
