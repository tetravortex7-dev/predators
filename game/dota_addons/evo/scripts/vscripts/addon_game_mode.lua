local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["29"] = 22,["30"] = 29,["31"] = 34,["34"] = 35,["35"] = 36,["36"] = 29,["37"] = 39,["38"] = 45,["41"] = 46,["42"] = 47,["45"] = 48,["47"] = 49,["48"] = 50,["49"] = 50,["51"] = 51,["53"] = 52,["54"] = 52,["56"] = 53,["57"] = 54,["64"] = 39,["65"] = 59,["66"] = 60,["67"] = 61,["68"] = 63,["69"] = 64,["70"] = 65,["71"] = 67,["72"] = 68,["73"] = 69,["74"] = 70,["75"] = 72,["76"] = 75,["77"] = 76,["79"] = 79,["80"] = 79,["81"] = 79,["82"] = 79,["83"] = 79,["84"] = 79,["85"] = 79,["86"] = 79,["87"] = 79,["88"] = 79,["89"] = 79,["90"] = 79,["91"] = 79,["92"] = 79,["93"] = 79,["94"] = 79,["95"] = 79,["96"] = 79,["97"] = 79,["98"] = 79,["99"] = 99,["100"] = 100,["101"] = 101,["102"] = 102,["105"] = 105,["106"] = 106,["107"] = 107,["108"] = 108,["109"] = 109,["110"] = 110,["111"] = 111,["112"] = 112,["113"] = 114,["114"] = 115,["116"] = 118,["117"] = 119,["118"] = 120,["119"] = 120,["120"] = 120,["121"] = 120,["122"] = 120,["123"] = 120,["124"] = 120,["126"] = 123,["127"] = 124,["128"] = 125,["130"] = 127,["131"] = 128,["132"] = 128,["133"] = 128,["134"] = 128,["135"] = 128,["136"] = 128,["137"] = 128,["139"] = 59,["140"] = 132,["141"] = 133,["142"] = 134,["143"] = 132,["144"] = 137,["145"] = 137,["146"] = 137,["147"] = 137});
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
    local lionImpaleVpcf = "particles/units/heroes/hero_lion/lion_spell_impale.vpcf"
    seenParticles:add(lionImpaleVpcf)
    PrecacheResource("particle", lionImpaleVpcf, context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_lion.vsndevts", context)
    local extraModels = {"models/heroes/venomancer/venomancer_ward.vmdl"}
    for ____, modelPath in ipairs(extraModels) do
        precacheUniqueModel(nil, modelPath, seenModels, context)
    end
    local extraParticles = {
        "particles/items_fx/blink_dagger_start.vpcf",
        "particles/items_fx/blink_dagger_end.vpcf",
        "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield.vpcf",
        "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf",
        "particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_arcane_orb_hit.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_base_attack.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_venomous_gale_impact.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_latent_poison_projectile.vpcf",
        "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf",
        "particles/units/heroes/hero_viper/viper_nethertoxin.vpcf",
        "particles/units/heroes/hero_treant/treant_bramble_root.vpcf",
        "particles/units/heroes/hero_treant/scepter_overgrowth_aura.vpcf",
        "particles/units/heroes/hero_wisp/wisp_guardian_explosion.vpcf",
        "particles/units/heroes/hero_wisp/wisp_overcharge.vpcf",
        "particles/units/heroes/hero_spectre/spectre_desolate.vpcf",
        "particles/evo_spectre/evo_spectre_void_surge.vpcf"
    }
    for ____, vpcf in ipairs(extraParticles) do
        if not seenParticles:has(vpcf) then
            seenParticles:add(vpcf)
            PrecacheResource("particle", vpcf, context)
        end
    end
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_wisp.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_spectre.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_abaddon.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_obsidian_destroyer.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_venomancer.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_viper.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_treant.vsndevts", context)
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
