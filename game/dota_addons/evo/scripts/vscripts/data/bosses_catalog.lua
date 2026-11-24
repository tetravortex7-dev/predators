local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 36,["6"] = 37,["7"] = 37,["8"] = 37,["9"] = 37,["10"] = 37,["11"] = 37,["12"] = 37,["13"] = 37,["14"] = 70,["15"] = 70,["16"] = 70,["17"] = 70,["18"] = 70,["19"] = 70,["20"] = 37,["21"] = 37,["22"] = 82,["23"] = 88,["24"] = 88,["25"] = 88,["26"] = 88,["27"] = 88,["28"] = 37,["29"] = 101,["30"] = 102,["31"] = 102,["32"] = 102,["33"] = 102,["34"] = 102,["35"] = 102,["36"] = 101,["37"] = 110,["38"] = 110,["39"] = 110,["40"] = 110,["41"] = 110,["42"] = 110,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 36,["48"] = 125,["49"] = 126,["50"] = 127,["51"] = 128,["54"] = 131,["55"] = 125,["56"] = 134,["57"] = 135,["58"] = 136,["59"] = 137,["62"] = 140,["63"] = 134});
local ____exports = {}
____exports.EVO_BOSSES_CATALOG = {{
    id = "evo_boss_slardar",
    unitName = "npc_dota_evo_boss_slardar",
    modelScaleMin = 0.7,
    modelScaleMax = 1.1,
    appearance = {scale = 0.7, hideBaseWearables = true, displayName = "Эласмир, Хозяин Прилива", wearables = {{model = "models/items/slardar/dota_plus_slardar_head/dota_plus_slardar_head.vmdl", particles = {"particles/econ/items/slardar/dota_plus_slardar/dota_plus_slardar_head.vpcf"}}, {model = "models/items/slardar/dota_plus_slardar_back/dota_plus_slardar_back.vmdl"}, {model = "models/items/slardar/dota_plus_slardar_arm/dota_plus_slardar_arm.vmdl"}, {model = "models/items/slardar/dota_plus_slardar_weapon/dota_plus_slardar_weapon.vmdl", particles = {"particles/econ/items/slardar/dota_plus_slardar/dota_plus_slardar_weapon.vpcf"}}}},
    coreItemName = "item_evo_boss_core_alpha",
    grantedAbilityName = "evo_elasmyr_maelstrom_slam",
    ownerHeroName = "npc_dota_hero_slardar",
    abilities = {
        "evo_elasmyr_tidal_lunge",
        "evo_elasmyr_maelstrom_slam",
        "evo_elasmyr_adaptive_scales",
        "evo_elasmyr_bash",
        "evo_elasmyr_abyssal_flood"
    },
    abilityUpgradeOrder = {"evo_elasmyr_maelstrom_slam", "evo_elasmyr_adaptive_scales", "evo_elasmyr_tidal_lunge"},
    abilityRules = {{abilityName = "evo_elasmyr_tidal_lunge", usage = "HERO_ONLY", maxCastDistance = 520}, {
        abilityName = "evo_elasmyr_maelstrom_slam",
        usage = "FARM_AND_HERO",
        minManaRatioForFarm = 0.45,
        minFarmTargets = 2,
        maxCastDistance = 340
    }, {abilityName = "evo_elasmyr_abyssal_flood", usage = "ULTIMATE_COMBAT", maxCastDistance = 580}},
    itemBuilds = {{
        {itemName = "item_phase_boots", goldCost = 1500},
        {itemName = "item_cursed_sange_lua", goldCost = 5000},
        {itemName = "item_amaliels_cuirass_lua", goldCost = 6500},
        {itemName = "item_angels_armor_lua", goldCost = 7500},
        {itemName = "item_heart_of_alaron_lua", goldCost = 8500},
        {itemName = "item_dead_boots_lua", goldCost = 10000}
    }, {
        {itemName = "item_power_treads", goldCost = 1400},
        {itemName = "item_bfury_lua", goldCost = 4200},
        {itemName = "item_saint_yasha_lua", goldCost = 5000},
        {itemName = "item_demons_claw_lua", goldCost = 7500},
        {itemName = "item_burning_blades_lua", goldCost = 8000},
        {itemName = "item_piercing_blade_lua", goldCost = 9000}
    }},
    baseScoreReward = 50,
    maxScoreReward = 125,
    destroyCoreScoreBonus = 15
}}
function ____exports.getBossDefinition(self, bossId)
    for ____, boss in ipairs(____exports.EVO_BOSSES_CATALOG) do
        if boss.id == bossId then
            return boss
        end
    end
    return nil
end
function ____exports.getBossDefinitionByCoreItem(self, coreItemName)
    for ____, boss in ipairs(____exports.EVO_BOSSES_CATALOG) do
        if boss.coreItemName == coreItemName then
            return boss
        end
    end
    return nil
end
return ____exports
