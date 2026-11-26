local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 3,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 3,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 3,["36"] = 34,["37"] = 34,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 3,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 3,["56"] = 3,["57"] = 56,["58"] = 56,["59"] = 56,["60"] = 56,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 72,["71"] = 72,["72"] = 72,["73"] = 72,["74"] = 72,["75"] = 72,["76"] = 72,["77"] = 56,["78"] = 56,["79"] = 56,["80"] = 56,["81"] = 56,["82"] = 56,["83"] = 56,["84"] = 56,["85"] = 56,["86"] = 56,["87"] = 56,["88"] = 56,["89"] = 56,["90"] = 56,["91"] = 56,["92"] = 56,["93"] = 56,["94"] = 56,["95"] = 56,["96"] = 56,["97"] = 56,["98"] = 56,["99"] = 56,["100"] = 56,["101"] = 56,["102"] = 56,["103"] = 56,["104"] = 56,["105"] = 56,["106"] = 56,["107"] = 56,["108"] = 56,["109"] = 56,["110"] = 56,["111"] = 56,["112"] = 56,["113"] = 56,["114"] = 56,["115"] = 56,["116"] = 56,["117"] = 56,["118"] = 56,["119"] = 56,["120"] = 56,["121"] = 56,["122"] = 56,["123"] = 56,["124"] = 56,["125"] = 56,["126"] = 56,["127"] = 56,["128"] = 56,["129"] = 56,["130"] = 56,["131"] = 56,["132"] = 56,["133"] = 56,["134"] = 56,["135"] = 56,["136"] = 56,["137"] = 56,["138"] = 56,["139"] = 145,["140"] = 146,["141"] = 147,["142"] = 148,["145"] = 151,["146"] = 145,["147"] = 154,["148"] = 155,["149"] = 156,["150"] = 157,["153"] = 160,["154"] = 154,["155"] = 163,["156"] = 163,["157"] = 163,["158"] = 163,["159"] = 163,["160"] = 163,["161"] = 163,["162"] = 163,["163"] = 163,["164"] = 163,["165"] = 163,["166"] = 163,["167"] = 163,["168"] = 163,["169"] = 163,["170"] = 163,["171"] = 163,["172"] = 163,["173"] = 163,["174"] = 163,["175"] = 163,["176"] = 163,["177"] = 163,["178"] = 163,["179"] = 163,["180"] = 163,["181"] = 163,["182"] = 163,["183"] = 163,["184"] = 163,["185"] = 163,["186"] = 163,["187"] = 163,["188"] = 163,["189"] = 163,["190"] = 163,["191"] = 163,["192"] = 201,["193"] = 201,["194"] = 201,["195"] = 201,["196"] = 201,["197"] = 201,["198"] = 201,["199"] = 201,["200"] = 201,["201"] = 201,["202"] = 201,["203"] = 201,["204"] = 201,["205"] = 201,["206"] = 216,["207"] = 217,["208"] = 218,["210"] = 220,["211"] = 221,["212"] = 222,["213"] = 216,["214"] = 225,["215"] = 226,["216"] = 227,["217"] = 228,["219"] = 230,["220"] = 231,["221"] = 231,["222"] = 231,["223"] = 231,["224"] = 225,["225"] = 234,["226"] = 235,["227"] = 236,["228"] = 237,["230"] = 239,["231"] = 240,["232"] = 234,["233"] = 243,["234"] = 244,["235"] = 245,["236"] = 246,["237"] = 247,["238"] = 243});
local ____exports = {}
____exports.EVO_TIERS = {
    {
        tierIndex = 0,
        label = "T0",
        requiredHeroLevel = 1,
        requiredEvoPoints = 0,
        statMultiplier = 1,
        spellShopSlots = 1,
        offerBasicCount = 4,
        offerUltimateCount = 0
    },
    {
        tierIndex = 1,
        label = "T1",
        requiredHeroLevel = 2,
        requiredEvoPoints = 5,
        statMultiplier = 1.1,
        spellShopSlots = 2,
        offerBasicCount = 5,
        offerUltimateCount = 0
    },
    {
        tierIndex = 2,
        label = "T2",
        requiredHeroLevel = 7,
        requiredEvoPoints = 15,
        statMultiplier = 1.25,
        spellShopSlots = 3,
        offerBasicCount = 6,
        offerUltimateCount = 2
    },
    {
        tierIndex = 3,
        label = "T3",
        requiredHeroLevel = 14,
        requiredEvoPoints = 35,
        statMultiplier = 1.45,
        spellShopSlots = 3,
        offerBasicCount = 6,
        offerUltimateCount = 3
    },
    {
        tierIndex = 4,
        label = "T4",
        requiredHeroLevel = 20,
        requiredEvoPoints = 60,
        statMultiplier = 1.7,
        spellShopSlots = 4,
        offerBasicCount = 6,
        offerUltimateCount = 3
    }
}
____exports.EVO_CONSTANTS = {
    MAX_PLAYERS = 12,
    DEFAULT_TEAM_COUNT = 4,
    DEFAULT_PLAYERS_PER_TEAM = 3,
    BASE_HERO_NAME = "npc_dota_hero_wisp",
    PHASE1_T15_TIME = 60,
    PHASE1_END_TIME = 300,
    ESCALATION_START_TIME = 900,
    MATCH_TIME_LIMIT = 1500,
    DAY_DURATION = 120,
    NIGHT_DURATION = 60,
    AFK_TIMEOUT_SECONDS = 180,
    STARVATION_TIMEOUT_SECONDS = 300,
    EVO_THRESHOLDS = {
        0,
        10,
        15,
        25,
        40,
        50
    },
    MUTATION_SLOT_THRESHOLDS = {10, 25, 40},
    ENABLE_ABILITY_DRAFT = false,
    ENABLE_MUTATION_DRAFT = false,
    ABILITY_DRAFT_LEVELS = {3, 7, 13},
    MUTATION_DRAFT_LEVELS = {5, 10, 15},
    ABILITY_DRAFT_CHOICES = 3,
    BODY_DRAFT_T1_CHOICES = 3,
    BIOMASS_SPAWN_INTERVAL_SECONDS = 12,
    BIOMASS_MAX_ACTIVE_COUNT = 24,
    BIOMASS_EVO_POINTS_REWARD = 2,
    NEUTRAL_CAMP_RESPAWN_SECONDS = 30,
    NEUTRAL_CAMP_MAX_UNITS = 5,
    NEUTRAL_CAMP_MAX_UNITS_DEV = 3,
    BOUNTY_RUNE_INTERVAL_SECONDS = 120,
    POWER_RUNE_INTERVAL_SECONDS = 120,
    SPELL_SHOP_DEFAULT_SLOTS = 3,
    MAX_HERO_LEVEL = 35,
    FORTIFICATION_LEVELS = {7, 14, 22, 30},
    FORTIFICATION_ROLL_CHOICES = 4,
    ACTIVE_ITEM_SLOTS = 4,
    LOCKED_ITEM_SLOTS = {4, 5},
    BACKPACK_SLOTS = {6, 7, 8},
    MAX_POTION_BACKPACK_STACKS = 3,
    ITEM_SELL_REFUND_RATIO = 0.7,
    DEATH_GOLD_PENALTY_RATIO = 0.2,
    BUYBACK_COOLDOWN_SECONDS = 240,
    SOLO_KILL_BONUS_MULTIPLIER = 1.5,
    CREEP_SHARE_RADIUS = 1200,
    SOLO_KILL_RADIUS = 1350,
    ITEM_TRADE_MAX_DISTANCE = 450,
    DEFAULT_BASE_RADIUS = 900,
    DEFAULT_WATER_ZONE_RADIUS = 1050,
    BASE_HP_REGEN = 30,
    BASE_MP_REGEN = 20,
    BASE_TP_COOLDOWN = 60,
    BOSS_COUNT_PER_MATCH = 1,
    BOSS_MAX_LEVEL = 150,
    BOSS_RESPAWN_SECONDS = 360,
    BOSS_COURAGE_TIME_SECONDS = 480,
    DUEL_INTERVAL_SECONDS = 180,
    DUEL_MAX_ROUNDS = 10,
    DUEL_DURATION_SECONDS = 30,
    BOSS_DUEL_DURATION_SECONDS = 45,
    BOSS_DUEL_EVERY_N_ROUNDS = 2,
    BOSS_DUEL_LOOT_WINDOW_SECONDS = 5,
    BOSS_DUEL_DEFEAT_BONUS_XP = 1500,
    BOSS_DUEL_DEFEAT_BONUS_GOLD = 1500,
    DUEL_APPLY_WEIGHT_MULTIPLIER = 3,
    DUEL_BET_PAYOUT_MULTIPLIER = 1.5,
    TARGET_TEAM_SCORE = 1000,
    SCORE_FARM_CREEP = 1,
    SCORE_GOLIATH_CREEP = 3,
    SCORE_HERO_KILL = 25,
    SCORE_HERO_DEATH = -5,
    SCORE_DUEL_WIN = 15,
    SCORE_OBJECTIVE = 5,
    SCORE_BOSS_MIN = 50,
    SCORE_BOSS_MAX = 125,
    COMEBACK_SCORE_MULT_MIN = 1,
    COMEBACK_SCORE_MULT_MAX = 3
}
function ____exports.getTierConfig(self, tierIndex)
    for ____, tier in ipairs(____exports.EVO_TIERS) do
        if tier.tierIndex == tierIndex then
            return tier
        end
    end
    return ____exports.EVO_TIERS[#____exports.EVO_TIERS]
end
function ____exports.getNextTierConfig(self, currentTierIndex)
    for ____, tier in ipairs(____exports.EVO_TIERS) do
        if tier.tierIndex > currentTierIndex then
            return tier
        end
    end
    return nil
end
____exports.EVO_XP_PER_LEVEL_TABLE = {
    [1] = 0,
    [2] = 240,
    [3] = 640,
    [4] = 1160,
    [5] = 1760,
    [6] = 2440,
    [7] = 3200,
    [8] = 4000,
    [9] = 4900,
    [10] = 5900,
    [11] = 7000,
    [12] = 8200,
    [13] = 9500,
    [14] = 10900,
    [15] = 12400,
    [16] = 14000,
    [17] = 15700,
    [18] = 17500,
    [19] = 19400,
    [20] = 21400,
    [21] = 23600,
    [22] = 26000,
    [23] = 28600,
    [24] = 31400,
    [25] = 34400,
    [26] = 38400,
    [27] = 43400,
    [28] = 49400,
    [29] = 56400,
    [30] = 63900,
    [31] = 71900,
    [32] = 80400,
    [33] = 89400,
    [34] = 98900,
    [35] = 108900
}
____exports.EVO_MAP_ENTITIES = {
    BASE_TRIGGER_PREFIX = "evo_base_trigger_",
    BASE_SPAWN_PREFIX = "evo_base_spawn_",
    INCUBATOR_ZONE = "evo_incubator_zone",
    BIOMASS_SPAWN_PREFIX = "evo_biomass_spawn_",
    CHOKEPOINT_TRIGGER_PREFIX = "evo_chokepoint_trigger_",
    WATER_TRIGGER_PREFIX = "evo_water_trigger_",
    CAMP_SWARM_PREFIX = "evo_camp_swarm_",
    CAMP_GOLIATH_PREFIX = "evo_camp_goliath_",
    BOSS_SPAWN_PREFIX = "evo_boss_spawn_",
    DUEL_ARENA_CENTER = "evo_duel_arena_center",
    DUEL_SPAWN_A = "evo_duel_spawn_a",
    DUEL_SPAWN_B = "evo_duel_spawn_b"
}
function ____exports.calculateEscalationMultiplier(self, elapsedTimeSeconds)
    if elapsedTimeSeconds <= ____exports.EVO_CONSTANTS.ESCALATION_START_TIME then
        return 1
    end
    local escalationWindow = ____exports.EVO_CONSTANTS.MATCH_TIME_LIMIT - ____exports.EVO_CONSTANTS.ESCALATION_START_TIME
    local progress = math.min(1, (elapsedTimeSeconds - ____exports.EVO_CONSTANTS.ESCALATION_START_TIME) / escalationWindow)
    return 1 + progress
end
function ____exports.calculateComebackScoreMultiplier(self, teamScore, leaderScore)
    local deficit = math.max(0, leaderScore - teamScore)
    if deficit <= 100 then
        return ____exports.EVO_CONSTANTS.COMEBACK_SCORE_MULT_MIN
    end
    local raw = 1 + (deficit - 100) / 250
    return math.min(
        ____exports.EVO_CONSTANTS.COMEBACK_SCORE_MULT_MAX,
        math.max(____exports.EVO_CONSTANTS.COMEBACK_SCORE_MULT_MIN, raw)
    )
end
function ____exports.calculateStreakKillGold(self, victimKillStreak, victimLevel)
    local baseKillGold = 120 + victimLevel * 10
    if victimKillStreak < 3 then
        return baseKillGold
    end
    local streakBonus = math.min(800, (victimKillStreak - 2) * 80)
    return baseKillGold + streakBonus
end
function ____exports.calculateComebackKillXp(self, killerLevel, victimLevel)
    local baseKillXp = 100 + victimLevel * 35
    local levelDiff = math.max(0, victimLevel - killerLevel)
    local comebackBonus = levelDiff * 60
    return baseKillXp + comebackBonus
end
return ____exports
