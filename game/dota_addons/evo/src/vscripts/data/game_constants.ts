import { EvolutionTierConfig } from "./data_schemas";

export const EVO_TIERS: readonly EvolutionTierConfig[] = [
    {
        tierIndex: 0,
        label: "T0",
        requiredHeroLevel: 1,
        requiredEvoPoints: 0,
        statMultiplier: 1.0,
        spellShopSlots: 1,
        offerBasicCount: 4,
        offerUltimateCount: 0,
    },
    {
        tierIndex: 1,
        label: "T1",
        requiredHeroLevel: 2,
        requiredEvoPoints: 5,
        statMultiplier: 1.1,
        spellShopSlots: 2,
        offerBasicCount: 5,
        offerUltimateCount: 0,
    },
    {
        tierIndex: 2,
        label: "T2",
        requiredHeroLevel: 7,
        requiredEvoPoints: 15,
        statMultiplier: 1.25,
        spellShopSlots: 3,
        offerBasicCount: 6,
        offerUltimateCount: 2,
    },
    {
        tierIndex: 3,
        label: "T3",
        requiredHeroLevel: 14,
        requiredEvoPoints: 35,
        statMultiplier: 1.45,
        spellShopSlots: 3,
        offerBasicCount: 6,
        offerUltimateCount: 3,
    },
    {
        tierIndex: 4,
        label: "T4",
        requiredHeroLevel: 20,
        requiredEvoPoints: 60,
        statMultiplier: 1.7,
        spellShopSlots: 4,
        offerBasicCount: 6,
        offerUltimateCount: 3,
    },
];

export const EVO_CONSTANTS = {
    MAX_PLAYERS: 12,
    DEFAULT_TEAM_COUNT: 4,
    DEFAULT_PLAYERS_PER_TEAM: 3,
    BASE_HERO_NAME: "npc_dota_hero_wisp",

    PHASE1_T15_TIME: 60,
    PHASE1_END_TIME: 300,
    ESCALATION_START_TIME: 900,
    MATCH_TIME_LIMIT: 1500,
    DAY_DURATION: 120,
    NIGHT_DURATION: 60,

    AFK_TIMEOUT_SECONDS: 180,
    STARVATION_TIMEOUT_SECONDS: 300,

    EVO_THRESHOLDS: [0, 10, 15, 25, 40, 50] as readonly number[],
    MUTATION_SLOT_THRESHOLDS: [10, 25, 40] as readonly number[],
    ENABLE_ABILITY_DRAFT: false,
    ABILITY_DRAFT_LEVELS: [3, 7, 13] as readonly number[],
    MUTATION_DRAFT_LEVELS: [5, 10, 15] as readonly number[],
    ABILITY_DRAFT_CHOICES: 3,
    BIOMASS_SPAWN_INTERVAL_SECONDS: 12,
    BIOMASS_MAX_ACTIVE_COUNT: 24,
    BIOMASS_EVO_POINTS_REWARD: 2,

    NEUTRAL_CAMP_RESPAWN_SECONDS: 30,
    NEUTRAL_CAMP_MAX_UNITS: 5,
    NEUTRAL_CAMP_MAX_UNITS_DEV: 3,

    BOUNTY_RUNE_INTERVAL_SECONDS: 120,
    POWER_RUNE_INTERVAL_SECONDS: 120,

    SPELL_SHOP_DEFAULT_SLOTS: 3,

    MAX_HERO_LEVEL: 35,
    FORTIFICATION_LEVELS: [7, 14, 22, 30] as readonly number[],
    FORTIFICATION_ROLL_CHOICES: 4,

    ACTIVE_ITEM_SLOTS: 4,
    LOCKED_ITEM_SLOTS: [4, 5] as readonly number[],
    BACKPACK_SLOTS: [6, 7, 8] as readonly number[],
    MAX_POTION_BACKPACK_STACKS: 3,
    ITEM_SELL_REFUND_RATIO: 0.7,
    DEATH_GOLD_PENALTY_RATIO: 0.2,
    BUYBACK_COOLDOWN_SECONDS: 240,
    SOLO_KILL_BONUS_MULTIPLIER: 1.5,

    CREEP_SHARE_RADIUS: 1200,
    SOLO_KILL_RADIUS: 1350,
    ITEM_TRADE_MAX_DISTANCE: 450,
    DEFAULT_BASE_RADIUS: 900,
    DEFAULT_WATER_ZONE_RADIUS: 1050,

    BASE_HP_REGEN: 30,
    BASE_MP_REGEN: 20,
    BASE_TP_COOLDOWN: 60,

    BOSS_COUNT_PER_MATCH: 1,
    BOSS_MAX_LEVEL: 150,
    BOSS_RESPAWN_SECONDS: 360,
    BOSS_COURAGE_TIME_SECONDS: 480,

    DUEL_INTERVAL_SECONDS: 180,
    DUEL_MAX_ROUNDS: 10,
    DUEL_DURATION_SECONDS: 30,
    BOSS_DUEL_DURATION_SECONDS: 45,
    BOSS_DUEL_EVERY_N_ROUNDS: 2,
    BOSS_DUEL_LOOT_WINDOW_SECONDS: 5,
    BOSS_DUEL_DEFEAT_BONUS_XP: 1500,
    BOSS_DUEL_DEFEAT_BONUS_GOLD: 1500,
    DUEL_APPLY_WEIGHT_MULTIPLIER: 3.0,
    DUEL_BET_PAYOUT_MULTIPLIER: 1.5,

    TARGET_TEAM_SCORE: 1000,
    SCORE_FARM_CREEP: 1,
    SCORE_GOLIATH_CREEP: 3,
    SCORE_HERO_KILL: 25,
    SCORE_HERO_DEATH: -5,
    SCORE_DUEL_WIN: 15,
    SCORE_OBJECTIVE: 5,
    SCORE_BOSS_MIN: 50,
    SCORE_BOSS_MAX: 125,
    COMEBACK_SCORE_MULT_MIN: 1.0,
    COMEBACK_SCORE_MULT_MAX: 3.0,
} as const;

export function getTierConfig(tierIndex: number): EvolutionTierConfig {
    for (const tier of EVO_TIERS) {
        if (tier.tierIndex === tierIndex) {
            return tier;
        }
    }
    return EVO_TIERS[EVO_TIERS.length - 1];
}

export function getNextTierConfig(currentTierIndex: number): EvolutionTierConfig | undefined {
    for (const tier of EVO_TIERS) {
        if (tier.tierIndex > currentTierIndex) {
            return tier;
        }
    }
    return undefined;
}

export const EVO_XP_PER_LEVEL_TABLE: Record<number, number> = {
    1: 0,
    2: 240,
    3: 640,
    4: 1160,
    5: 1760,
    6: 2440,
    7: 3200,
    8: 4000,
    9: 4900,
    10: 5900,
    11: 7000,
    12: 8200,
    13: 9500,
    14: 10900,
    15: 12400,
    16: 14000,
    17: 15700,
    18: 17500,
    19: 19400,
    20: 21400,
    21: 23600,
    22: 26000,
    23: 28600,
    24: 31400,
    25: 34400,
    26: 38400,
    27: 43400,
    28: 49400,
    29: 56400,
    30: 63900,
    31: 71900,
    32: 80400,
    33: 89400,
    34: 98900,
    35: 108900,
};

export const EVO_MAP_ENTITIES = {
    BASE_TRIGGER_PREFIX: "evo_base_trigger_",
    BASE_SPAWN_PREFIX: "evo_base_spawn_",
    INCUBATOR_ZONE: "evo_incubator_zone",
    BIOMASS_SPAWN_PREFIX: "evo_biomass_spawn_",
    CHOKEPOINT_TRIGGER_PREFIX: "evo_chokepoint_trigger_",
    WATER_TRIGGER_PREFIX: "evo_water_trigger_",
    CAMP_SWARM_PREFIX: "evo_camp_swarm_",
    CAMP_GOLIATH_PREFIX: "evo_camp_goliath_",
    BOSS_SPAWN_PREFIX: "evo_boss_spawn_",
    DUEL_ARENA_CENTER: "evo_duel_arena_center",
    DUEL_SPAWN_A: "evo_duel_spawn_a",
    DUEL_SPAWN_B: "evo_duel_spawn_b",
} as const;

export function calculateEscalationMultiplier(elapsedTimeSeconds: number): number {
    if (elapsedTimeSeconds <= EVO_CONSTANTS.ESCALATION_START_TIME) {
        return 1.0;
    }
    const escalationWindow = EVO_CONSTANTS.MATCH_TIME_LIMIT - EVO_CONSTANTS.ESCALATION_START_TIME;
    const progress = Math.min(1.0, (elapsedTimeSeconds - EVO_CONSTANTS.ESCALATION_START_TIME) / escalationWindow);
    return 1.0 + progress;
}

export function calculateComebackScoreMultiplier(teamScore: number, leaderScore: number): number {
    const deficit = Math.max(0, leaderScore - teamScore);
    if (deficit <= 100) {
        return EVO_CONSTANTS.COMEBACK_SCORE_MULT_MIN;
    }
    const raw = 1.0 + (deficit - 100) / 250;
    return Math.min(EVO_CONSTANTS.COMEBACK_SCORE_MULT_MAX, Math.max(EVO_CONSTANTS.COMEBACK_SCORE_MULT_MIN, raw));
}

export function calculateStreakKillGold(victimKillStreak: number, victimLevel: number): number {
    const baseKillGold = 120 + victimLevel * 10;
    if (victimKillStreak < 3) {
        return baseKillGold;
    }
    const streakBonus = Math.min(800, (victimKillStreak - 2) * 80);
    return baseKillGold + streakBonus;
}

export function calculateComebackKillXp(killerLevel: number, victimLevel: number): number {
    const baseKillXp = 100 + victimLevel * 35;
    const levelDiff = Math.max(0, victimLevel - killerLevel);
    const comebackBonus = levelDiff * 60;
    return baseKillXp + comebackBonus;
}
