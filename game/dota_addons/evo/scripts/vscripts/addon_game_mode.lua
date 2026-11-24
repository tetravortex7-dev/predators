local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 25,["30"] = 22,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 32,["36"] = 34,["37"] = 35,["38"] = 36,["39"] = 37,["41"] = 39,["42"] = 40,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["49"] = 47,["51"] = 49,["52"] = 50,["55"] = 53,["56"] = 54,["57"] = 29,["58"] = 88,["59"] = 89,["60"] = 90,["61"] = 88,["62"] = 93,["63"] = 93,["64"] = 93,["65"] = 93});
local ____exports = {}
local ____GameMode = require("GameMode")
local EvoGameMode = ____GameMode.EvoGameMode
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_BODIES_CATALOG = ____bodies_catalog.EVO_BODIES_CATALOG
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____neutral_creeps_catalog = require("data.neutral_creeps_catalog")
local EVO_NEUTRAL_CREEP_MODELS = ____neutral_creeps_catalog.EVO_NEUTRAL_CREEP_MODELS
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local CHA_ITEM_LIBS = {
    "lib/timers",
    "lib/players",
    "lib/server",
    "lib/abilities",
    "lib/unit_status",
    "lib/modifiers"
}
local function loadChaItemLibs(self)
    local runtimeRequire = _G.require
    for ____, libPath in ipairs(CHA_ITEM_LIBS) do
        runtimeRequire(libPath)
    end
end
local function Precache(context)
    PrecacheResource("particle", "particles/generic_gameplay/generic_lifesteal.vpcf", context)
    for ____, modelPath in ipairs(EVO_NEUTRAL_CREEP_MODELS) do
        PrecacheModel(modelPath, context)
    end
    for ____, boss in ipairs(EVO_BOSSES_CATALOG) do
        PrecacheUnitByNameSync(boss.unitName, context)
        if boss.ownerHeroName and boss.ownerHeroName ~= boss.unitName then
            PrecacheUnitByNameSync(boss.ownerHeroName, context)
        end
        if boss.appearance then
            HeroAppearance:precachePreset(boss.appearance, context)
        end
    end
    for ____, body in ipairs(EVO_BODIES_CATALOG) do
        if body.heroClass and #body.heroClass > 0 then
            PrecacheUnitByNameSync(body.heroClass, context)
        elseif body.model and #body.model > 0 then
            PrecacheModel(body.model, context)
        end
        if body.appearance then
            HeroAppearance:precachePreset(body.appearance, context)
        end
    end
    PrecacheUnitByNameSync("npc_dota_hero_morphling", context)
    HeroAppearance:precachePreset({model = "models/heroes/morphling/morphling.vmdl", wearables = {{model = "models/items/morphling/crown_of_tears/mesh/crown_of_tears_model.vmdl", particles = {"particles/econ/items/morphling/morphling_crown_of_tears/morphling_crown_ambient.vpcf"}}, {model = "models/items/morphling/ethereal_blade/ethereal_blade.vmdl", particles = {"particles/econ/items/morphling/morphling_ethereal/morphling_ethereal_ambient.vpcf"}}, {model = "models/items/morphling/abyss_overlord_shoulder/abyss_overlord_shoulder.vmdl", particles = {"particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_shoulder_ambient.vpcf"}}, {model = "models/items/morphling/abyss_overlord_back/abyss_overlord_back.vmdl", particles = {"particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_back_ambient.vpcf"}}}}, context)
end
local function Activate()
    loadChaItemLibs(nil)
    GameRules.EvoAddon = __TS__New(EvoGameMode)
end
__TS__ObjectAssign(
    getfenv(),
    {Activate = Activate, Precache = Precache}
)
return ____exports
