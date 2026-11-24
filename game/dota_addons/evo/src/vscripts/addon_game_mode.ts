import { EvoGameMode } from "./GameMode";
import { EVO_BODIES_CATALOG } from "./data/bodies_catalog";
import { EVO_BOSSES_CATALOG } from "./data/bosses_catalog";
import { EVO_NEUTRAL_CREEP_MODELS } from "./data/neutral_creeps_catalog";
import { HeroAppearance } from "./lib/HeroAppearance";

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

function Precache(this: void, context: CScriptPrecacheContext): void {
    PrecacheResource("particle", "particles/generic_gameplay/generic_lifesteal.vpcf", context);
    for (const modelPath of EVO_NEUTRAL_CREEP_MODELS) {
        PrecacheModel(modelPath, context);
    }
    for (const boss of EVO_BOSSES_CATALOG) {
        PrecacheUnitByNameSync(boss.unitName, context);
        if (boss.ownerHeroName && boss.ownerHeroName !== boss.unitName) {
            PrecacheUnitByNameSync(boss.ownerHeroName, context);
        }
        if (boss.appearance) {
            HeroAppearance.precachePreset(boss.appearance, context);
        }
    }
    for (const body of EVO_BODIES_CATALOG) {
        if (body.heroClass && body.heroClass.length > 0) {
            PrecacheUnitByNameSync(body.heroClass, context);
        } else if (body.model && body.model.length > 0) {
            PrecacheModel(body.model, context);
        }
        if (body.appearance) {
            HeroAppearance.precachePreset(body.appearance, context);
        }
    }
    PrecacheUnitByNameSync("npc_dota_hero_morphling", context);
    HeroAppearance.precachePreset(
        {
            model: "models/heroes/morphling/morphling.vmdl",
            wearables: [
                {
                    model: "models/items/morphling/crown_of_tears/mesh/crown_of_tears_model.vmdl",
                    particles: [
                        "particles/econ/items/morphling/morphling_crown_of_tears/morphling_crown_ambient.vpcf",
                    ],
                },
                {
                    model: "models/items/morphling/ethereal_blade/ethereal_blade.vmdl",
                    particles: [
                        "particles/econ/items/morphling/morphling_ethereal/morphling_ethereal_ambient.vpcf",
                    ],
                },
                {
                    model: "models/items/morphling/abyss_overlord_shoulder/abyss_overlord_shoulder.vmdl",
                    particles: [
                        "particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_shoulder_ambient.vpcf",
                    ],
                },
                {
                    model: "models/items/morphling/abyss_overlord_back/abyss_overlord_back.vmdl",
                    particles: [
                        "particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_back_ambient.vpcf",
                    ],
                },
            ],
        },
        context
    );
}

function Activate(this: void): void {
    loadChaItemLibs();
    GameRules.EvoAddon = new EvoGameMode();
}

Object.assign(getfenv(), {
    Activate,
    Precache,
});
