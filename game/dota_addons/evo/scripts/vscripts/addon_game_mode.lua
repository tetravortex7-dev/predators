local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["29"] = 22,["30"] = 29,["31"] = 34,["34"] = 35,["35"] = 36,["36"] = 29,["37"] = 39,["38"] = 45,["41"] = 46,["42"] = 47,["45"] = 48,["47"] = 49,["48"] = 50,["49"] = 50,["51"] = 51,["53"] = 52,["54"] = 52,["56"] = 53,["57"] = 54,["64"] = 39,["65"] = 59,["66"] = 60,["67"] = 61,["68"] = 63,["69"] = 64,["70"] = 65,["71"] = 67,["72"] = 68,["74"] = 71,["75"] = 72,["76"] = 73,["77"] = 73,["78"] = 73,["79"] = 73,["80"] = 73,["81"] = 73,["82"] = 73,["84"] = 76,["85"] = 77,["86"] = 78,["88"] = 80,["89"] = 81,["90"] = 81,["91"] = 81,["92"] = 81,["93"] = 81,["94"] = 81,["95"] = 81,["97"] = 59,["98"] = 85,["99"] = 86,["100"] = 87,["101"] = 85,["102"] = 90,["103"] = 90,["104"] = 90,["105"] = 90});
local ____exports = {}
local ____GameMode = require("GameMode")
local EvoGameMode = ____GameMode.EvoGameMode
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_BODIES_CATALOG = ____bodies_catalog.EVO_BODIES_CATALOG
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____neutral_creeps_catalog = require("data.neutral_creeps_catalog")
local EVO_NEUTRAL_CREEP_MODELS = ____neutral_creeps_catalog.EVO_NEUTRAL_CREEP_MODELS
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
local function precacheUniqueModel(self, modelPath, seenModels, context)
    if not modelPath or #modelPath == 0 or seenModels:has(modelPath) then
        return
    end
    seenModels:add(modelPath)
    PrecacheModel(modelPath, context)
end
local function precacheUniquePreset(self, preset, seenModels, seenParticles, context)
    if not preset then
        return
    end
    precacheUniqueModel(nil, preset.model, seenModels, context)
    if not preset.wearables then
        return
    end
    for ____, spec in ipairs(preset.wearables) do
        do
            precacheUniqueModel(nil, spec.model, seenModels, context)
            if not spec.particles then
                goto __continue10
            end
            for ____, vpcf in ipairs(spec.particles) do
                do
                    if not vpcf or #vpcf == 0 or seenParticles:has(vpcf) then
                        goto __continue12
                    end
                    seenParticles:add(vpcf)
                    PrecacheResource("particle", vpcf, context)
                end
                ::__continue12::
            end
        end
        ::__continue10::
    end
end
local function Precache(context)
    local seenModels = __TS__New(Set)
    local seenParticles = __TS__New(Set)
    local stealVpcf = "particles/generic_gameplay/generic_lifesteal.vpcf"
    seenParticles:add(stealVpcf)
    PrecacheResource("particle", stealVpcf, context)
    for ____, modelPath in ipairs(EVO_NEUTRAL_CREEP_MODELS) do
        precacheUniqueModel(nil, modelPath, seenModels, context)
    end
    for ____, boss in ipairs(EVO_BOSSES_CATALOG) do
        PrecacheUnitByNameSync(boss.unitName, context)
        precacheUniquePreset(
            nil,
            boss.appearance,
            seenModels,
            seenParticles,
            context
        )
    end
    for ____, body in ipairs(EVO_BODIES_CATALOG) do
        if body.tierIndex == 0 and body.heroClass and #body.heroClass > 0 then
            PrecacheUnitByNameSync(body.heroClass, context)
        end
        precacheUniqueModel(nil, body.model, seenModels, context)
        precacheUniquePreset(
            nil,
            body.appearance,
            seenModels,
            seenParticles,
            context
        )
    end
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
