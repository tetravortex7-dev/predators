local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 9,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 21,["35"] = 24,["36"] = 25,["37"] = 24,["38"] = 27,["39"] = 28,["40"] = 27,["41"] = 32,["42"] = 33,["43"] = 32,["44"] = 33,["45"] = 34,["46"] = 35,["47"] = 34,["48"] = 33,["49"] = 32,["50"] = 33,["52"] = 33,["53"] = 39,["54"] = 40,["55"] = 39,["56"] = 40,["57"] = 41,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 41,["63"] = 47,["64"] = 48,["65"] = 47,["66"] = 50,["67"] = 51,["68"] = 50,["69"] = 40,["70"] = 39,["71"] = 40,["73"] = 40,["74"] = 55,["75"] = 56,["76"] = 55,["77"] = 56,["78"] = 57,["79"] = 58,["80"] = 57,["81"] = 56,["82"] = 55,["83"] = 56,["85"] = 56,["86"] = 62,["87"] = 63,["88"] = 62,["89"] = 63,["90"] = 64,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 65,["95"] = 64,["96"] = 70,["97"] = 71,["98"] = 70,["99"] = 73,["100"] = 74,["101"] = 73,["102"] = 63,["103"] = 62,["104"] = 63,["106"] = 63,["107"] = 78,["108"] = 79,["109"] = 78,["110"] = 79,["111"] = 80,["112"] = 81,["113"] = 80,["114"] = 79,["115"] = 78,["116"] = 79,["118"] = 79,["119"] = 85,["120"] = 86,["121"] = 85,["122"] = 86,["123"] = 87,["124"] = 88,["125"] = 87,["126"] = 90,["127"] = 91,["128"] = 90,["129"] = 86,["130"] = 85,["131"] = 86,["133"] = 86,["134"] = 95,["135"] = 96,["136"] = 95,["137"] = 96,["138"] = 97,["139"] = 98,["140"] = 97,["141"] = 96,["142"] = 95,["143"] = 96,["145"] = 96,["146"] = 102,["147"] = 103,["148"] = 102,["149"] = 103,["150"] = 104,["151"] = 105,["152"] = 104,["153"] = 107,["154"] = 108,["155"] = 107,["156"] = 103,["157"] = 102,["158"] = 103,["160"] = 103,["161"] = 112,["162"] = 113,["163"] = 112,["164"] = 113,["165"] = 114,["166"] = 115,["167"] = 114,["168"] = 113,["169"] = 112,["170"] = 113,["172"] = 113,["173"] = 119,["174"] = 120,["175"] = 119,["176"] = 120,["177"] = 121,["178"] = 122,["179"] = 121,["180"] = 124,["181"] = 125,["182"] = 124,["183"] = 120,["184"] = 119,["185"] = 120,["187"] = 120,["188"] = 129,["189"] = 130,["190"] = 129,["191"] = 130,["192"] = 131,["193"] = 132,["194"] = 131,["195"] = 130,["196"] = 129,["197"] = 130,["199"] = 130,["200"] = 136,["201"] = 137,["202"] = 136,["203"] = 137,["204"] = 138,["205"] = 139,["206"] = 138,["207"] = 141,["208"] = 142,["209"] = 141,["210"] = 137,["211"] = 136,["212"] = 137,["214"] = 137,["215"] = 146,["216"] = 147,["217"] = 146,["218"] = 147,["219"] = 148,["220"] = 149,["221"] = 148,["222"] = 147,["223"] = 146,["224"] = 147,["226"] = 147,["227"] = 153,["228"] = 154,["229"] = 153,["230"] = 154,["231"] = 155,["232"] = 156,["233"] = 156,["234"] = 156,["235"] = 156,["236"] = 156,["237"] = 155,["238"] = 162,["239"] = 163,["240"] = 162,["241"] = 165,["242"] = 166,["243"] = 165,["244"] = 168,["245"] = 169,["246"] = 168,["247"] = 154,["248"] = 153,["249"] = 154,["251"] = 154,["252"] = 173,["253"] = 174,["254"] = 173,["255"] = 174,["256"] = 175,["257"] = 176,["258"] = 175,["259"] = 174,["260"] = 173,["261"] = 174,["263"] = 174,["264"] = 180,["265"] = 181,["266"] = 180,["267"] = 181,["268"] = 182,["269"] = 183,["270"] = 182,["271"] = 185,["272"] = 186,["273"] = 185,["274"] = 181,["275"] = 180,["276"] = 181,["278"] = 181,["279"] = 190,["280"] = 191,["281"] = 190,["282"] = 191,["283"] = 192,["284"] = 193,["285"] = 192,["286"] = 191,["287"] = 190,["288"] = 191,["290"] = 191,["291"] = 197,["292"] = 198,["293"] = 197,["294"] = 198,["295"] = 199,["296"] = 200,["297"] = 199,["298"] = 202,["299"] = 203,["300"] = 202,["301"] = 198,["302"] = 197,["303"] = 198,["305"] = 198,["306"] = 207,["307"] = 208,["308"] = 207,["309"] = 208,["310"] = 209,["311"] = 210,["312"] = 209,["313"] = 208,["314"] = 207,["315"] = 208,["317"] = 208,["318"] = 214,["319"] = 215,["320"] = 214,["321"] = 215,["322"] = 216,["323"] = 217,["324"] = 216,["325"] = 219,["326"] = 220,["327"] = 219,["328"] = 215,["329"] = 214,["330"] = 215,["332"] = 215,["333"] = 224,["334"] = 225,["335"] = 224,["336"] = 225,["337"] = 226,["338"] = 227,["339"] = 226,["340"] = 225,["341"] = 224,["342"] = 225,["344"] = 225,["345"] = 231,["346"] = 232,["347"] = 231,["348"] = 232,["349"] = 233,["350"] = 234,["351"] = 233,["352"] = 236,["353"] = 237,["354"] = 236,["355"] = 232,["356"] = 231,["357"] = 232,["359"] = 232,["360"] = 241,["361"] = 242,["362"] = 241,["363"] = 242,["364"] = 243,["365"] = 244,["366"] = 243,["367"] = 242,["368"] = 241,["369"] = 242,["371"] = 242,["372"] = 248,["373"] = 249,["374"] = 248,["375"] = 249,["376"] = 250,["377"] = 251,["378"] = 250,["379"] = 253,["380"] = 254,["381"] = 253,["382"] = 249,["383"] = 248,["384"] = 249,["386"] = 249});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/common/evo_generic_talents"
if IsServer() then
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
end
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
