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
