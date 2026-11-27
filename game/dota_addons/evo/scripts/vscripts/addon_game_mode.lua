local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 23,["27"] = 24,["28"] = 25,["29"] = 26,["31"] = 23,["32"] = 30,["33"] = 35,["36"] = 36,["37"] = 37,["38"] = 30,["39"] = 40,["40"] = 46,["43"] = 47,["44"] = 48,["47"] = 49,["49"] = 50,["50"] = 51,["51"] = 51,["53"] = 52,["55"] = 53,["56"] = 53,["58"] = 54,["59"] = 55,["66"] = 40,["67"] = 60,["68"] = 61,["69"] = 62,["70"] = 64,["71"] = 65,["72"] = 66,["73"] = 68,["74"] = 69,["75"] = 70,["76"] = 71,["77"] = 73,["78"] = 76,["79"] = 77,["81"] = 80,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 80,["87"] = 80,["88"] = 80,["89"] = 80,["90"] = 80,["91"] = 80,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["99"] = 80,["100"] = 80,["101"] = 80,["102"] = 80,["103"] = 80,["104"] = 80,["105"] = 80,["106"] = 80,["107"] = 80,["108"] = 80,["109"] = 80,["110"] = 80,["111"] = 80,["112"] = 80,["113"] = 80,["114"] = 80,["115"] = 114,["116"] = 115,["117"] = 116,["118"] = 117,["121"] = 120,["122"] = 121,["123"] = 122,["124"] = 123,["125"] = 124,["126"] = 125,["127"] = 126,["128"] = 127,["129"] = 128,["130"] = 129,["131"] = 131,["132"] = 132,["134"] = 135,["135"] = 136,["136"] = 137,["137"] = 137,["138"] = 137,["139"] = 137,["140"] = 137,["141"] = 137,["142"] = 137,["144"] = 140,["145"] = 141,["146"] = 142,["147"] = 143,["148"] = 144,["150"] = 146,["151"] = 147,["152"] = 147,["153"] = 147,["154"] = 147,["155"] = 147,["156"] = 147,["157"] = 147,["159"] = 60,["160"] = 151,["161"] = 152,["162"] = 153,["163"] = 151,["164"] = 156,["165"] = 156,["166"] = 156,["167"] = 156});
local ____exports = {}
local ____GameMode = require("GameMode")
local EvoGameMode = ____GameMode.EvoGameMode
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_BODIES_CATALOG = ____bodies_catalog.EVO_BODIES_CATALOG
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____neutral_creeps_catalog = require("data.neutral_creeps_catalog")
local EVO_NEUTRAL_CREEP_MODELS = ____neutral_creeps_catalog.EVO_NEUTRAL_CREEP_MODELS
local ____start_body_override = require("data.start_body_override")
local getInitialStartBody = ____start_body_override.getInitialStartBody
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
        "particles/units/heroes/hero_spectre/spectre_spectral_dagger.vpcf",
        "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
        "particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf",
        "particles/units/heroes/hero_spectre/spectre_shadow_path_owner.vpcf",
        "particles/units/heroes/hero_spectre/spectre_ambient_blade.vpcf",
        "particles/units/heroes/hero_spectre/spectre_shadowstep_fear.vpcf",
        "particles/units/heroes/hero_void_spirit/void_spirit_entryportal.vpcf",
        "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg_burst.vpcf",
        "particles/evo_spectre/evo_spectre_cleave.vpcf",
        "particles/evo_spectre/evo_bastion_cocoon.vpcf",
        "particles/evo_spectre/evo_bastion_explosion.vpcf",
        "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf",
        "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf",
        "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_aura.vpcf",
        "particles/units/heroes/hero_arc_warden/arc_warden_magnetic.vpcf"
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
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_mars.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts", context)
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
    local startBody = getInitialStartBody(nil)
    for ____, body in ipairs(EVO_BODIES_CATALOG) do
        local isDevStartHero = startBody ~= nil and body.id == startBody.id
        if (body.tierIndex == 0 or isDevStartHero) and body.heroClass and #body.heroClass > 0 then
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
