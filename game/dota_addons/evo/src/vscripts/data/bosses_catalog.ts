import { HeroAppearancePreset } from "../lib/HeroAppearance";

export type BossAbilityUsage = "HERO_ONLY" | "FARM_AND_HERO" | "ULTIMATE_COMBAT";

export interface BossAbilityRule {
    readonly abilityName: string;
    readonly usage: BossAbilityUsage;
    readonly minManaRatioForFarm?: number;
    readonly minFarmTargets?: number;
    readonly maxCastDistance?: number;
}

export interface BossItemStep {
    readonly itemName: string;
    readonly goldCost: number;
}

export interface BossDefinition {
    readonly id: string;
    readonly unitName: string;
    readonly modelScaleMin: number;
    readonly modelScaleMax: number;
    readonly appearance?: HeroAppearancePreset;
    readonly coreItemName: string;
    readonly grantedAbilityName: string;
    readonly ownerHeroName: string;
    readonly abilities: readonly string[];
    readonly abilityUpgradeOrder: readonly string[];
    readonly abilityRules: readonly BossAbilityRule[];
    readonly itemBuilds: readonly (readonly BossItemStep[])[];
    readonly baseScoreReward: number;
    readonly maxScoreReward: number;
    readonly destroyCoreScoreBonus: number;
}

export const EVO_BOSSES_CATALOG: readonly BossDefinition[] = [
    {
        id: "evo_boss_slardar",
        unitName: "npc_dota_evo_boss_slardar",
        modelScaleMin: 0.7,
        modelScaleMax: 1.1,
        appearance: {
            scale: 0.7,
            hideBaseWearables: true,
            displayName: "Эласмир, Хозяин Прилива",
            wearables: [
                {
                    model: "models/items/slardar/dota_plus_slardar_head/dota_plus_slardar_head.vmdl",
                    particles: [
                        "particles/econ/items/slardar/dota_plus_slardar/dota_plus_slardar_head.vpcf",
                    ],
                },
                {
                    model: "models/items/slardar/dota_plus_slardar_back/dota_plus_slardar_back.vmdl",
                },
                {
                    model: "models/items/slardar/dota_plus_slardar_arm/dota_plus_slardar_arm.vmdl",
                },
                {
                    model: "models/items/slardar/dota_plus_slardar_weapon/dota_plus_slardar_weapon.vmdl",
                    particles: [
                        "particles/econ/items/slardar/dota_plus_slardar/dota_plus_slardar_weapon.vpcf",
                    ],
                },
            ],
        },
        coreItemName: "item_evo_boss_core_alpha",
        grantedAbilityName: "evo_elasmyr_maelstrom_slam",
        ownerHeroName: "npc_dota_hero_slardar",
        abilities: [
            "evo_elasmyr_tidal_lunge",
            "evo_elasmyr_maelstrom_slam",
            "evo_elasmyr_adaptive_scales",
            "evo_elasmyr_bash",
            "evo_elasmyr_abyssal_flood",
        ],
        abilityUpgradeOrder: [
            "evo_elasmyr_maelstrom_slam",
            "evo_elasmyr_adaptive_scales",
            "evo_elasmyr_tidal_lunge",
        ],
        abilityRules: [
            {
                abilityName: "evo_elasmyr_tidal_lunge",
                usage: "HERO_ONLY",
                maxCastDistance: 520,
            },
            {
                abilityName: "evo_elasmyr_maelstrom_slam",
                usage: "FARM_AND_HERO",
                minManaRatioForFarm: 0.45,
                minFarmTargets: 2,
                maxCastDistance: 340,
            },
            {
                abilityName: "evo_elasmyr_abyssal_flood",
                usage: "ULTIMATE_COMBAT",
                maxCastDistance: 580,
            },
        ],
        itemBuilds: [
            [
                { itemName: "item_phase_boots", goldCost: 1500 },
                { itemName: "item_cursed_sange_lua", goldCost: 5000 },
                { itemName: "item_amaliels_cuirass_lua", goldCost: 6500 },
                { itemName: "item_angels_armor_lua", goldCost: 7500 },
                { itemName: "item_heart_of_alaron_lua", goldCost: 8500 },
                { itemName: "item_dead_boots_lua", goldCost: 10000 },
            ],
            [
                { itemName: "item_power_treads", goldCost: 1400 },
                { itemName: "item_bfury_lua", goldCost: 4200 },
                { itemName: "item_saint_yasha_lua", goldCost: 5000 },
                { itemName: "item_demons_claw_lua", goldCost: 7500 },
                { itemName: "item_burning_blades_lua", goldCost: 8000 },
                { itemName: "item_piercing_blade_lua", goldCost: 9000 },
            ],
        ],
        baseScoreReward: 50,
        maxScoreReward: 125,
        destroyCoreScoreBonus: 15,
    },
];

export function getBossDefinition(bossId: string): BossDefinition | undefined {
    for (const boss of EVO_BOSSES_CATALOG) {
        if (boss.id === bossId) {
            return boss;
        }
    }
    return undefined;
}

export function getBossDefinitionByCoreItem(coreItemName: string): BossDefinition | undefined {
    for (const boss of EVO_BOSSES_CATALOG) {
        if (boss.coreItemName === coreItemName) {
            return boss;
        }
    }
    return undefined;
}
