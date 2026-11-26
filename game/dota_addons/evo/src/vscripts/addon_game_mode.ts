import { EvoGameMode } from "./GameMode";
import { EVO_BODIES_CATALOG } from "./data/bodies_catalog";
import { EVO_BOSSES_CATALOG } from "./data/bosses_catalog";
import { EVO_NEUTRAL_CREEP_MODELS } from "./data/neutral_creeps_catalog";
import { HeroAppearancePreset } from "./lib/HeroAppearance";

declare global {
    interface CDOTAGameRules {
        EvoAddon?: EvoGameMode;
    }
}

const CHA_ITEM_LIBS: readonly string[] = [
    "lib/timers",
    "lib/players",
    "lib/server",
    "lib/abilities",
    "lib/unit_status",
    "lib/modifiers",
];

function loadChaItemLibs(): void {
    const runtimeRequire = (_G as unknown as { require: (this: void, path: string) => void }).require;
    for (const libPath of CHA_ITEM_LIBS) {
        runtimeRequire(libPath);
    }
}

function precacheUniqueModel(
    modelPath: string | undefined,
    seenModels: Set<string>,
    context: CScriptPrecacheContext
): void {
    if (!modelPath || modelPath.length === 0 || seenModels.has(modelPath)) return;
    seenModels.add(modelPath);
    PrecacheModel(modelPath, context);
}

function precacheUniquePreset(
    preset: HeroAppearancePreset | undefined,
    seenModels: Set<string>,
    seenParticles: Set<string>,
    context: CScriptPrecacheContext
): void {
    if (!preset) return;
    precacheUniqueModel(preset.model, seenModels, context);
    if (!preset.wearables) return;
    for (const spec of preset.wearables) {
        precacheUniqueModel(spec.model, seenModels, context);
        if (!spec.particles) continue;
        for (const vpcf of spec.particles) {
            if (!vpcf || vpcf.length === 0 || seenParticles.has(vpcf)) continue;
            seenParticles.add(vpcf);
            PrecacheResource("particle", vpcf, context);
        }
    }
}

function Precache(this: void, context: CScriptPrecacheContext): void {
    const seenModels = new Set<string>();
    const seenParticles = new Set<string>();

    const stealVpcf = "particles/generic_gameplay/generic_lifesteal.vpcf";
    seenParticles.add(stealVpcf);
    PrecacheResource("particle", stealVpcf, context);

    const lionImpaleVpcf = "particles/units/heroes/hero_lion/lion_spell_impale.vpcf";
    seenParticles.add(lionImpaleVpcf);
    PrecacheResource("particle", lionImpaleVpcf, context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_lion.vsndevts", context);

    const extraModels = [
        "models/heroes/venomancer/venomancer_ward.vmdl",
    ];
    for (const modelPath of extraModels) {
        precacheUniqueModel(modelPath, seenModels, context);
    }

    const extraParticles = [
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
    ];
    for (const vpcf of extraParticles) {
        if (!seenParticles.has(vpcf)) {
            seenParticles.add(vpcf);
            PrecacheResource("particle", vpcf, context);
        }
    }
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_wisp.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_spectre.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_abaddon.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_obsidian_destroyer.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_venomancer.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_viper.vsndevts", context);
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_treant.vsndevts", context);

    for (const modelPath of EVO_NEUTRAL_CREEP_MODELS) {
        precacheUniqueModel(modelPath, seenModels, context);
    }

    for (const boss of EVO_BOSSES_CATALOG) {
        PrecacheUnitByNameSync(boss.unitName, context);
        precacheUniquePreset(boss.appearance, seenModels, seenParticles, context);
    }

    for (const body of EVO_BODIES_CATALOG) {
        if (body.tierIndex === 0 && body.heroClass && body.heroClass.length > 0) {
            PrecacheUnitByNameSync(body.heroClass, context);
        }
        precacheUniqueModel(body.model, seenModels, context);
        precacheUniquePreset(body.appearance, seenModels, seenParticles, context);
    }
}

function Activate(this: void): void {
    loadChaItemLibs();
    GameRules.EvoAddon = new EvoGameMode();
}

Object.assign(getfenv(), {
    Activate,
    Precache,
});
