local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 4,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 4,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 4,["39"] = 4,["40"] = 3,["41"] = 44,["42"] = 44,["43"] = 44,["44"] = 44,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 54,["51"] = 54,["52"] = 54,["53"] = 54,["54"] = 54,["55"] = 54,["56"] = 54,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 44,["61"] = 44,["62"] = 44,["63"] = 44,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["68"] = 44,["69"] = 44,["70"] = 44,["71"] = 44,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 81,["76"] = 81,["77"] = 81,["78"] = 44,["79"] = 44,["80"] = 3});
local ____exports = {}
____exports.EVO_BRANCH_NYX_BODIES_2 = {{
    id = "evo_body_t3_nyx_cicada",
    tierIndex = 3,
    diet = "CARNIVORE",
    tags = {"insect", "hive", "nyx"},
    spellPoolTags = {"control", "burst"},
    model = "models/heroes/nerubian_assassin/nerubian_assassin.vmdl",
    modelScale = 0.95,
    heroClass = "npc_dota_hero_nyx_assassin",
    keepDefaultHeroAbilities = false,
    nextBodyIds = {"evo_body_t4_nyx_cicada"},
    appearance = {
        scale = 0.95,
        hideBaseWearables = true,
        wearables = {{model = "models/items/nerubian_assassin/nyx_dusky_back/nyx_dusky_back.vmdl"}, {model = "models/items/nerubian_assassin/nyx_dusky_head/nyx_dusky_head.vmdl"}, {model = "models/items/nerubian_assassin/nyx_dusky_weapon/nyx_dusky_weapon.vmdl"}},
        displayName = "Шершень Бури",
        color = {155, 235, 65},
        labelColor = {185, 250, 105}
    },
    primaryAttribute = "ALL",
    baseStr = 36,
    baseAgi = 36,
    baseInt = 27,
    strGain = 3.9,
    agiGain = 3.9,
    intGain = 2.9,
    baseMoveSpeed = 325,
    baseAttackDamageMin = 46,
    baseAttackDamageMax = 56,
    baseAttackRange = 150,
    baseArmor = 5,
    innateAbility = "evo_nyx_cicada_chitin",
    signatureAbility = "nyx_assassin_impale",
    kitAbilities = {"evo_nyx_cicada_q", "evo_nyx_cicada_w", "evo_nyx_cicada_e", "evo_nyx_cicada_chitin"},
    kitAbilityLevel = 1
}, {
    id = "evo_body_t4_nyx_cicada",
    tierIndex = 4,
    diet = "CARNIVORE",
    tags = {"insect", "hive", "nyx"},
    spellPoolTags = {"control", "burst"},
    model = "models/heroes/nerubian_assassin/nerubian_assassin.vmdl",
    modelScale = 1.1,
    heroClass = "npc_dota_hero_nyx_assassin",
    keepDefaultHeroAbilities = false,
    appearance = {
        scale = 1.1,
        hideBaseWearables = true,
        wearables = {{model = "models/items/nerubian_assassin/nyx_dusky_back/nyx_dusky_back.vmdl"}, {model = "models/items/nerubian_assassin/nyx_dusky_head/nyx_dusky_head.vmdl"}, {model = "models/items/nerubian_assassin/nyx_dusky_weapon/nyx_dusky_weapon.vmdl"}, {model = "models/items/nerubian_assassin/nyx_dusky_misc/nyx_dusky_misc.vmdl"}},
        displayName = "Владыка Резонанса",
        color = {95, 250, 120},
        labelColor = {145, 255, 165}
    },
    primaryAttribute = "ALL",
    baseStr = 36,
    baseAgi = 36,
    baseInt = 27,
    strGain = 3.9,
    agiGain = 3.9,
    intGain = 2.9,
    baseMoveSpeed = 325,
    baseAttackDamageMin = 46,
    baseAttackDamageMax = 56,
    baseAttackRange = 150,
    baseArmor = 5,
    innateAbility = "evo_nyx_cicada_chitin",
    signatureAbility = "nyx_assassin_impale",
    kitAbilities = {
        "evo_nyx_cicada_q",
        "evo_nyx_cicada_w",
        "evo_nyx_cicada_e",
        "evo_nyx_cicada_r",
        "evo_nyx_cicada_chitin"
    },
    kitAbilityLevel = 1
}}
return ____exports
