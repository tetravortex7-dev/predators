local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 4,["22"] = 4,["23"] = 4,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 4,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3});
local ____exports = {}
____exports.EVO_STARTER_BODIES = {{
    id = "evo_body_t1_amoeba",
    tierIndex = 0,
    diet = "HYBRID",
    tags = {"aquatic", "starter"},
    spellPoolTags = {"aquatic", "utility"},
    model = "models/heroes/wisp/wisp.vmdl",
    modelScale = 1,
    heroClass = "npc_dota_hero_wisp",
    nextBodyIds = {
        "evo_body_t1_bristle",
        "evo_body_t15_morph_mini",
        "evo_body_t1_nyx",
        "evo_body_t1_slark",
        "evo_body_t1_spectre",
        "evo_body_t1_venomancer"
    },
    appearance = {scale = 1, hideBaseWearables = true, wearables = {{model = "models/items/io/dark_carnival_io/dark_carnival_io.vmdl"}}, displayName = "Выбор судьбы"},
    primaryAttribute = "STR",
    baseStr = 16,
    baseAgi = 16,
    baseInt = 16,
    strGain = 2,
    agiGain = 2,
    intGain = 2,
    baseMoveSpeed = 310,
    baseAttackDamageMin = 24,
    baseAttackDamageMax = 28,
    baseAttackRange = 150,
    baseArmor = 1,
    innateAbility = "evo_wisp_surge",
    signatureAbility = "evo_wisp_pulse"
}}
return ____exports
