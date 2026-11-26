local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 7,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 7,["23"] = 7,["24"] = 7,["25"] = 7,["26"] = 7,["27"] = 7,["28"] = 21,["29"] = 22,["30"] = 23,["32"] = 21,["33"] = 27,["34"] = 27,["35"] = 27,["36"] = 30,["37"] = 31,["38"] = 30,["39"] = 34,["40"] = 35,["41"] = 34,["42"] = 38,["43"] = 39,["44"] = 38,["45"] = 42,["46"] = 43,["47"] = 42,["48"] = 46,["49"] = 47,["50"] = 46,["51"] = 50,["52"] = 51,["53"] = 50,["54"] = 54,["55"] = 55,["56"] = 56,["57"] = 57,["59"] = 54,["60"] = 61,["61"] = 62,["62"] = 63,["63"] = 64,["65"] = 61,["66"] = 68,["67"] = 69,["68"] = 69,["69"] = 69,["70"] = 69,["71"] = 69,["72"] = 69,["73"] = 69,["74"] = 69,["75"] = 69,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 68,["80"] = 83,["81"] = 84,["82"] = 84,["83"] = 83,["84"] = 87,["85"] = 88,["86"] = 88,["87"] = 87,["88"] = 91,["89"] = 92,["90"] = 92,["91"] = 91,["92"] = 95,["93"] = 96,["94"] = 96,["95"] = 95,["96"] = 99,["97"] = 100,["98"] = 100,["99"] = 99,["100"] = 103,["101"] = 104,["102"] = 104,["103"] = 103,["104"] = 107,["105"] = 108,["106"] = 108,["107"] = 107,["108"] = 111,["109"] = 112,["110"] = 112,["111"] = 111,["112"] = 115,["113"] = 116,["114"] = 116,["115"] = 115,["116"] = 119,["117"] = 120,["118"] = 120,["119"] = 119,["120"] = 124,["121"] = 125,["122"] = 124,["123"] = 125,["124"] = 126,["125"] = 127,["126"] = 126,["127"] = 125,["128"] = 124,["129"] = 125,["131"] = 125,["132"] = 131,["133"] = 132,["134"] = 131,["135"] = 132,["136"] = 133,["137"] = 134,["138"] = 133,["139"] = 137,["140"] = 138,["141"] = 137,["142"] = 132,["143"] = 131,["144"] = 132,["146"] = 132,["147"] = 142,["148"] = 143,["149"] = 142,["150"] = 143,["151"] = 144,["152"] = 145,["153"] = 144,["154"] = 148,["155"] = 149,["156"] = 148,["157"] = 143,["158"] = 142,["159"] = 143,["161"] = 143,["162"] = 153,["163"] = 154,["164"] = 153,["165"] = 154,["166"] = 155,["167"] = 156,["168"] = 155,["169"] = 159,["170"] = 160,["171"] = 159,["172"] = 154,["173"] = 153,["174"] = 154,["176"] = 154,["177"] = 164,["178"] = 165,["179"] = 164,["180"] = 165,["181"] = 166,["182"] = 167,["183"] = 166,["184"] = 170,["185"] = 171,["186"] = 170,["187"] = 165,["188"] = 164,["189"] = 165,["191"] = 165,["192"] = 175,["193"] = 176,["194"] = 175,["195"] = 176,["196"] = 177,["197"] = 178,["198"] = 177,["199"] = 181,["200"] = 182,["201"] = 181,["202"] = 176,["203"] = 175,["204"] = 176,["206"] = 176,["207"] = 186,["208"] = 187,["209"] = 186,["210"] = 187,["211"] = 188,["212"] = 189,["213"] = 188,["214"] = 192,["215"] = 193,["216"] = 192,["217"] = 187,["218"] = 186,["219"] = 187,["221"] = 187,["222"] = 197,["223"] = 198,["224"] = 197,["225"] = 198,["226"] = 199,["227"] = 200,["228"] = 199,["229"] = 203,["230"] = 204,["231"] = 203,["232"] = 198,["233"] = 197,["234"] = 198,["236"] = 198,["237"] = 208,["238"] = 209,["239"] = 208,["240"] = 209,["241"] = 210,["242"] = 211,["243"] = 210,["244"] = 214,["245"] = 215,["246"] = 214,["247"] = 209,["248"] = 208,["249"] = 209,["251"] = 209,["252"] = 219,["253"] = 220,["254"] = 219,["255"] = 220,["256"] = 221,["257"] = 222,["258"] = 221,["259"] = 225,["260"] = 226,["261"] = 225,["262"] = 220,["263"] = 219,["264"] = 220,["266"] = 220,["267"] = 230,["268"] = 231,["269"] = 230,["270"] = 231,["271"] = 232,["272"] = 233,["273"] = 232,["274"] = 236,["275"] = 237,["276"] = 236,["277"] = 231,["278"] = 230,["279"] = 231,["281"] = 231});
local ____exports = {}
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerModifier = ____dota_ts_adapter.registerModifier
local MUTATION_RUNTIME_SCRIPT = "modifiers/modifier_evo_mutation_runtime"
____exports.EVO_MUTATION_MODIFIERS = {
    "modifier_evo_mutation_runtime",
    "modifier_evo_mut_stat_atk_5",
    "modifier_evo_mut_stat_ms_5",
    "modifier_evo_mut_stat_mana_regen",
    "modifier_evo_mut_stat_hp_regen",
    "modifier_evo_mut_stat_str_1",
    "modifier_evo_mut_stat_agi_1",
    "modifier_evo_mut_stat_int_1",
    "modifier_evo_mut_stat_armor_1",
    "modifier_evo_mut_stat_as_5",
    "modifier_evo_mut_stat_hp_40"
}
function ____exports.linkMutationModifiers(self)
    for ____, modName in ipairs(____exports.EVO_MUTATION_MODIFIERS) do
        LinkLuaModifier(modName, MUTATION_RUNTIME_SCRIPT, 0)
    end
end
local BaseMutationRuntimeModifier = __TS__Class()
BaseMutationRuntimeModifier.name = "BaseMutationRuntimeModifier"
__TS__ClassExtends(BaseMutationRuntimeModifier, BaseModifier)
function BaseMutationRuntimeModifier.prototype.getDefaultMutationId(self)
    return nil
end
function BaseMutationRuntimeModifier.prototype.IsHidden(self)
    return false
end
function BaseMutationRuntimeModifier.prototype.IsDebuff(self)
    return false
end
function BaseMutationRuntimeModifier.prototype.IsPurgable(self)
    return false
end
function BaseMutationRuntimeModifier.prototype.RemoveOnDeath(self)
    return false
end
function BaseMutationRuntimeModifier.prototype.GetAttributes(self)
    return 1
end
function BaseMutationRuntimeModifier.prototype.OnCreated(self, params)
    local mutId = params and params.mutation_id or self:getDefaultMutationId()
    if mutId then
        self.mutationDef = getMutationDefinition(nil, mutId)
    end
end
function BaseMutationRuntimeModifier.prototype.OnRefresh(self, params)
    local mutId = params and params.mutation_id or self:getDefaultMutationId()
    if mutId then
        self.mutationDef = getMutationDefinition(nil, mutId)
    end
end
function BaseMutationRuntimeModifier.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function BaseMutationRuntimeModifier.prototype.GetModifierPreAttack_BonusDamage(self)
    local ____opt_4 = self.mutationDef
    return ____opt_4 and ____opt_4.bonusDamage or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierPhysicalArmorBonus(self)
    local ____opt_6 = self.mutationDef
    return ____opt_6 and ____opt_6.bonusArmor or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierMoveSpeedBonus_Constant(self)
    local ____opt_8 = self.mutationDef
    return ____opt_8 and ____opt_8.bonusMoveSpeed or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local ____opt_10 = self.mutationDef
    return ____opt_10 and ____opt_10.bonusAttackSpeed or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierHealthBonus(self)
    local ____opt_12 = self.mutationDef
    return ____opt_12 and ____opt_12.bonusHealth or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierConstantManaRegen(self)
    local ____opt_14 = self.mutationDef
    return ____opt_14 and ____opt_14.bonusManaRegen or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierConstantHealthRegen(self)
    local ____opt_16 = self.mutationDef
    return ____opt_16 and ____opt_16.bonusHealthRegen or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierBonusStats_Strength(self)
    local ____opt_18 = self.mutationDef
    return ____opt_18 and ____opt_18.bonusStrength or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierBonusStats_Agility(self)
    local ____opt_20 = self.mutationDef
    return ____opt_20 and ____opt_20.bonusAgility or 0
end
function BaseMutationRuntimeModifier.prototype.GetModifierBonusStats_Intellect(self)
    local ____opt_22 = self.mutationDef
    return ____opt_22 and ____opt_22.bonusIntellect or 0
end
____exports.modifier_evo_mutation_runtime = __TS__Class()
local modifier_evo_mutation_runtime = ____exports.modifier_evo_mutation_runtime
modifier_evo_mutation_runtime.name = "modifier_evo_mutation_runtime"
__TS__ClassExtends(modifier_evo_mutation_runtime, BaseMutationRuntimeModifier)
function modifier_evo_mutation_runtime.prototype.GetTexture(self)
    return "alchemist_chemical_rage"
end
modifier_evo_mutation_runtime = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mutation_runtime")},
    modifier_evo_mutation_runtime
)
____exports.modifier_evo_mutation_runtime = modifier_evo_mutation_runtime
____exports.modifier_evo_mut_stat_atk_5 = __TS__Class()
local modifier_evo_mut_stat_atk_5 = ____exports.modifier_evo_mut_stat_atk_5
modifier_evo_mut_stat_atk_5.name = "modifier_evo_mut_stat_atk_5"
__TS__ClassExtends(modifier_evo_mut_stat_atk_5, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_atk_5.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_atk_5"
end
function modifier_evo_mut_stat_atk_5.prototype.GetTexture(self)
    return "sven_gods_strength"
end
modifier_evo_mut_stat_atk_5 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_atk_5")},
    modifier_evo_mut_stat_atk_5
)
____exports.modifier_evo_mut_stat_atk_5 = modifier_evo_mut_stat_atk_5
____exports.modifier_evo_mut_stat_ms_5 = __TS__Class()
local modifier_evo_mut_stat_ms_5 = ____exports.modifier_evo_mut_stat_ms_5
modifier_evo_mut_stat_ms_5.name = "modifier_evo_mut_stat_ms_5"
__TS__ClassExtends(modifier_evo_mut_stat_ms_5, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_ms_5.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_ms_5"
end
function modifier_evo_mut_stat_ms_5.prototype.GetTexture(self)
    return "dark_seer_surge"
end
modifier_evo_mut_stat_ms_5 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_ms_5")},
    modifier_evo_mut_stat_ms_5
)
____exports.modifier_evo_mut_stat_ms_5 = modifier_evo_mut_stat_ms_5
____exports.modifier_evo_mut_stat_mana_regen = __TS__Class()
local modifier_evo_mut_stat_mana_regen = ____exports.modifier_evo_mut_stat_mana_regen
modifier_evo_mut_stat_mana_regen.name = "modifier_evo_mut_stat_mana_regen"
__TS__ClassExtends(modifier_evo_mut_stat_mana_regen, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_mana_regen.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_mana_regen"
end
function modifier_evo_mut_stat_mana_regen.prototype.GetTexture(self)
    return "keeper_of_the_light_chakra_magic"
end
modifier_evo_mut_stat_mana_regen = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_mana_regen")},
    modifier_evo_mut_stat_mana_regen
)
____exports.modifier_evo_mut_stat_mana_regen = modifier_evo_mut_stat_mana_regen
____exports.modifier_evo_mut_stat_hp_regen = __TS__Class()
local modifier_evo_mut_stat_hp_regen = ____exports.modifier_evo_mut_stat_hp_regen
modifier_evo_mut_stat_hp_regen.name = "modifier_evo_mut_stat_hp_regen"
__TS__ClassExtends(modifier_evo_mut_stat_hp_regen, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_hp_regen.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_hp_regen"
end
function modifier_evo_mut_stat_hp_regen.prototype.GetTexture(self)
    return "dragon_knight_dragon_blood"
end
modifier_evo_mut_stat_hp_regen = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_hp_regen")},
    modifier_evo_mut_stat_hp_regen
)
____exports.modifier_evo_mut_stat_hp_regen = modifier_evo_mut_stat_hp_regen
____exports.modifier_evo_mut_stat_str_1 = __TS__Class()
local modifier_evo_mut_stat_str_1 = ____exports.modifier_evo_mut_stat_str_1
modifier_evo_mut_stat_str_1.name = "modifier_evo_mut_stat_str_1"
__TS__ClassExtends(modifier_evo_mut_stat_str_1, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_str_1.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_str_1"
end
function modifier_evo_mut_stat_str_1.prototype.GetTexture(self)
    return "centaur_return"
end
modifier_evo_mut_stat_str_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_str_1")},
    modifier_evo_mut_stat_str_1
)
____exports.modifier_evo_mut_stat_str_1 = modifier_evo_mut_stat_str_1
____exports.modifier_evo_mut_stat_agi_1 = __TS__Class()
local modifier_evo_mut_stat_agi_1 = ____exports.modifier_evo_mut_stat_agi_1
modifier_evo_mut_stat_agi_1.name = "modifier_evo_mut_stat_agi_1"
__TS__ClassExtends(modifier_evo_mut_stat_agi_1, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_agi_1.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_agi_1"
end
function modifier_evo_mut_stat_agi_1.prototype.GetTexture(self)
    return "drow_ranger_marksmanship"
end
modifier_evo_mut_stat_agi_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_agi_1")},
    modifier_evo_mut_stat_agi_1
)
____exports.modifier_evo_mut_stat_agi_1 = modifier_evo_mut_stat_agi_1
____exports.modifier_evo_mut_stat_int_1 = __TS__Class()
local modifier_evo_mut_stat_int_1 = ____exports.modifier_evo_mut_stat_int_1
modifier_evo_mut_stat_int_1.name = "modifier_evo_mut_stat_int_1"
__TS__ClassExtends(modifier_evo_mut_stat_int_1, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_int_1.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_int_1"
end
function modifier_evo_mut_stat_int_1.prototype.GetTexture(self)
    return "crystal_maiden_brilliance_aura"
end
modifier_evo_mut_stat_int_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_int_1")},
    modifier_evo_mut_stat_int_1
)
____exports.modifier_evo_mut_stat_int_1 = modifier_evo_mut_stat_int_1
____exports.modifier_evo_mut_stat_armor_1 = __TS__Class()
local modifier_evo_mut_stat_armor_1 = ____exports.modifier_evo_mut_stat_armor_1
modifier_evo_mut_stat_armor_1.name = "modifier_evo_mut_stat_armor_1"
__TS__ClassExtends(modifier_evo_mut_stat_armor_1, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_armor_1.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_armor_1"
end
function modifier_evo_mut_stat_armor_1.prototype.GetTexture(self)
    return "sven_warcry"
end
modifier_evo_mut_stat_armor_1 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_armor_1")},
    modifier_evo_mut_stat_armor_1
)
____exports.modifier_evo_mut_stat_armor_1 = modifier_evo_mut_stat_armor_1
____exports.modifier_evo_mut_stat_as_5 = __TS__Class()
local modifier_evo_mut_stat_as_5 = ____exports.modifier_evo_mut_stat_as_5
modifier_evo_mut_stat_as_5.name = "modifier_evo_mut_stat_as_5"
__TS__ClassExtends(modifier_evo_mut_stat_as_5, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_as_5.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_as_5"
end
function modifier_evo_mut_stat_as_5.prototype.GetTexture(self)
    return "ursa_overpower"
end
modifier_evo_mut_stat_as_5 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_as_5")},
    modifier_evo_mut_stat_as_5
)
____exports.modifier_evo_mut_stat_as_5 = modifier_evo_mut_stat_as_5
____exports.modifier_evo_mut_stat_hp_40 = __TS__Class()
local modifier_evo_mut_stat_hp_40 = ____exports.modifier_evo_mut_stat_hp_40
modifier_evo_mut_stat_hp_40.name = "modifier_evo_mut_stat_hp_40"
__TS__ClassExtends(modifier_evo_mut_stat_hp_40, BaseMutationRuntimeModifier)
function modifier_evo_mut_stat_hp_40.prototype.getDefaultMutationId(self)
    return "evo_mut_stat_hp_40"
end
function modifier_evo_mut_stat_hp_40.prototype.GetTexture(self)
    return "undying_flesh_golem"
end
modifier_evo_mut_stat_hp_40 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mut_stat_hp_40")},
    modifier_evo_mut_stat_hp_40
)
____exports.modifier_evo_mut_stat_hp_40 = modifier_evo_mut_stat_hp_40
return ____exports
