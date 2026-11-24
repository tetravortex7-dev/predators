import { BodyDefinition } from "../data_schemas";

export const EVO_STARTER_BODIES: readonly BodyDefinition[] = [
    {
        id: "evo_body_t1_amoeba",
        tierIndex: 0,
        diet: "HYBRID",
        tags: ["aquatic", "starter"],
        spellPoolTags: ["aquatic", "utility"],
        model: "models/heroes/wisp/wisp.vmdl",
        modelScale: 1.0,
        heroClass: "npc_dota_hero_wisp",
        nextBodyIds: ["evo_body_t1_bristle", "evo_body_t15_morph_mini", "evo_body_t1_nyx", "evo_body_t1_slark"],
        appearance: {
            scale: 1.0,
            hideBaseWearables: true,
            wearables: [
                { model: "models/items/io/dark_carnival_io/dark_carnival_io.vmdl" },
            ],
            displayName: "Выбор судьбы",
        },
        primaryAttribute: "STR",
        baseStr: 16,
        baseAgi: 16,
        baseInt: 16,
        strGain: 2.0,
        agiGain: 2.0,
        intGain: 2.0,
        baseMoveSpeed: 310,
        baseAttackDamageMin: 24,
        baseAttackDamageMax: 28,
        baseAttackRange: 150,
        baseArmor: 1,
        innateAbility: "slardar_sprint",
        signatureAbility: "tidehunter_gush",
    },
];
