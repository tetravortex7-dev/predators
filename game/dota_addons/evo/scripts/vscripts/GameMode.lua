local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 10,["27"] = 10,["28"] = 11,["29"] = 11,["30"] = 12,["31"] = 12,["32"] = 13,["33"] = 13,["34"] = 14,["35"] = 14,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 16,["40"] = 17,["41"] = 17,["42"] = 18,["43"] = 18,["44"] = 19,["45"] = 19,["46"] = 20,["47"] = 20,["48"] = 22,["49"] = 22,["50"] = 22,["52"] = 43,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 47,["57"] = 52,["58"] = 53,["59"] = 54,["60"] = 55,["61"] = 56,["62"] = 57,["63"] = 58,["64"] = 59,["65"] = 60,["66"] = 61,["67"] = 61,["68"] = 61,["69"] = 61,["70"] = 61,["71"] = 64,["72"] = 65,["73"] = 66,["74"] = 68,["75"] = 69,["76"] = 70,["77"] = 72,["78"] = 42,["79"] = 75,["80"] = 76,["81"] = 78,["82"] = 79,["83"] = 80,["84"] = 81,["85"] = 84,["86"] = 89,["87"] = 91,["88"] = 92,["89"] = 93,["90"] = 94,["91"] = 95,["92"] = 96,["93"] = 97,["94"] = 98,["95"] = 99,["96"] = 100,["97"] = 101,["98"] = 102,["99"] = 103,["100"] = 104,["101"] = 105,["102"] = 106,["103"] = 107,["104"] = 108,["105"] = 109,["106"] = 111,["107"] = 112,["108"] = 113,["109"] = 115,["110"] = 116,["111"] = 117,["113"] = 75,["114"] = 121,["115"] = 122,["116"] = 123,["118"] = 125,["119"] = 125,["120"] = 126,["121"] = 127,["122"] = 125,["125"] = 121,["126"] = 131,["127"] = 132,["128"] = 137,["129"] = 138,["130"] = 143,["131"] = 148,["132"] = 153,["133"] = 158,["134"] = 164,["135"] = 165,["136"] = 166,["137"] = 167,["138"] = 168,["139"] = 169,["140"] = 170,["141"] = 171,["142"] = 172,["143"] = 173,["144"] = 174,["145"] = 175,["146"] = 176,["147"] = 177,["148"] = 178,["149"] = 179,["150"] = 180,["151"] = 181,["152"] = 131});
local ____exports = {}
local ____EventBus = require("core.EventBus")
local EventBus = ____EventBus.EventBus
local ____LazyPrecacheManager = require("core.LazyPrecacheManager")
local LazyPrecacheManager = ____LazyPrecacheManager.LazyPrecacheManager
local ____LevelingManager = require("core.LevelingManager")
local LevelingManager = ____LevelingManager.LevelingManager
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local ____DevCheats = require("dev.DevCheats")
local DevCheats = ____DevCheats.DevCheats
local ____modifier_evo_mutation_runtime = require("modifiers.modifier_evo_mutation_runtime")
local linkMutationModifiers = ____modifier_evo_mutation_runtime.linkMutationModifiers
local ____BossManager = require("systems.BossManager")
local BossManager = ____BossManager.BossManager
local ____DamageFilterManager = require("systems.DamageFilterManager")
local DamageFilterManager = ____DamageFilterManager.DamageFilterManager
local ____DuelManager = require("systems.DuelManager")
local DuelManager = ____DuelManager.DuelManager
local ____EvolutionManager = require("systems.EvolutionManager")
local EvolutionManager = ____EvolutionManager.EvolutionManager
local ____FountainManager = require("systems.FountainManager")
local FountainManager = ____FountainManager.FountainManager
local ____MatchScoreManager = require("systems.MatchScoreManager")
local MatchScoreManager = ____MatchScoreManager.MatchScoreManager
local ____NeutralCampsManager = require("systems.NeutralCampsManager")
local NeutralCampsManager = ____NeutralCampsManager.NeutralCampsManager
local ____OrderFilterManager = require("systems.OrderFilterManager")
local OrderFilterManager = ____OrderFilterManager.OrderFilterManager
local ____PassiveGoldManager = require("systems.PassiveGoldManager")
local PassiveGoldManager = ____PassiveGoldManager.PassiveGoldManager
local ____PhaseManager = require("systems.PhaseManager")
local PhaseManager = ____PhaseManager.PhaseManager
local ____RuneManager = require("systems.RuneManager")
local RuneManager = ____RuneManager.RuneManager
local ____SharedTeamIntel = require("systems.SharedTeamIntel")
local SharedTeamIntel = ____SharedTeamIntel.SharedTeamIntel
local ____SpellShopManager = require("systems.SpellShopManager")
local SpellShopManager = ____SpellShopManager.SpellShopManager
local ____TalentTreeManager = require("systems.TalentTreeManager")
local TalentTreeManager = ____TalentTreeManager.TalentTreeManager
____exports.EvoGameMode = __TS__Class()
local EvoGameMode = ____exports.EvoGameMode
EvoGameMode.name = "EvoGameMode"
function EvoGameMode.prototype.____constructor(self)
    self.eventBus = __TS__New(EventBus)
    self.lazyPrecacheManager = __TS__New(LazyPrecacheManager)
    self.levelingManager = __TS__New(LevelingManager, self.eventBus)
    self.spellShopManager = __TS__New(SpellShopManager, self.eventBus)
    self.evolutionManager = __TS__New(EvolutionManager, self.eventBus, self.spellShopManager, self.lazyPrecacheManager)
    self.damageFilterManager = __TS__New(DamageFilterManager)
    self.orderFilterManager = __TS__New(OrderFilterManager)
    self.passiveGoldManager = __TS__New(PassiveGoldManager, self.eventBus)
    self.phaseManager = __TS__New(PhaseManager, self.eventBus)
    self.neutralCampsManager = __TS__New(NeutralCampsManager, self.eventBus)
    self.runeManager = __TS__New(RuneManager)
    self.bossManager = __TS__New(BossManager, self.eventBus)
    self.matchScoreManager = __TS__New(MatchScoreManager, self.eventBus)
    self.duelManager = __TS__New(DuelManager, self.eventBus, self.bossManager)
    self.fountainManager = __TS__New(
        FountainManager,
        self.eventBus,
        function(____, unit) return self.duelManager:isActiveDuelist(unit) end
    )
    self.sharedTeamIntel = __TS__New(SharedTeamIntel, self.evolutionManager)
    self.talentTreeManager = __TS__New(TalentTreeManager, self.eventBus)
    self.devCheats = __TS__New(DevCheats, self.eventBus, self.levelingManager)
    self:configureGameRules()
    self:configureTeams(EVO_CONSTANTS.DEFAULT_TEAM_COUNT, EVO_CONSTANTS.DEFAULT_PLAYERS_PER_TEAM)
    self:initManagers()
    print("[Evo] GameMode initialized.")
end
function EvoGameMode.prototype.configureGameRules(self)
    local gameMode = GameRules:GetGameModeEntity()
    GameRules:SetHeroSelectionTime(0)
    GameRules:SetStrategyTime(0)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(IsInToolsMode() and EVO_CONSTANTS.PRE_GAME_TIME_DEV or EVO_CONSTANTS.PRE_GAME_TIME_PROD)
    GameRules:SetCustomGameSetupAutoLaunchDelay(IsInToolsMode() and EVO_CONSTANTS.CUSTOM_GAME_SETUP_DELAY_DEV or EVO_CONSTANTS.CUSTOM_GAME_SETUP_DELAY_PROD)
    gameMode:SetCustomGameForceHero(EVO_CONSTANTS.BASE_HERO_NAME)
    GameRules:SetGoldPerTick(0)
    GameRules:SetGoldTickTime(EVO_CONSTANTS.GOLD_TICK_TIME)
    GameRules:SetStartingGold(EVO_CONSTANTS.STARTING_GOLD)
    GameRules:SetUseUniversalShopMode(false)
    gameMode:SetFreeCourierModeEnabled(false)
    gameMode:SetNeutralStashEnabled(false)
    gameMode:SetNeutralItemHideUndiscoveredEnabled(true)
    gameMode:SetAllowNeutralItemDrops(false)
    gameMode:SetUseDefaultDOTARuneSpawnLogic(false)
    gameMode:SetRuneEnabled(0, true)
    gameMode:SetRuneEnabled(1, true)
    gameMode:SetRuneEnabled(2, true)
    gameMode:SetRuneEnabled(3, true)
    gameMode:SetRuneEnabled(4, true)
    gameMode:SetRuneEnabled(5, true)
    gameMode:SetRuneEnabled(6, true)
    gameMode:SetRuneEnabled(7, false)
    gameMode:SetRuneEnabled(8, false)
    gameMode:SetRuneEnabled(9, true)
    gameMode:SetBuybackEnabled(true)
    gameMode:SetCustomScanCooldown(EVO_CONSTANTS.SCAN_COOLDOWN_SECONDS)
    gameMode:SetCustomScanMaxCharges(EVO_CONSTANTS.SCAN_MAX_CHARGES)
    if IsInToolsMode() then
        gameMode:SetFogOfWarDisabled(true)
        gameMode:SetUnseenFogOfWarEnabled(false)
    end
end
function EvoGameMode.prototype.configureTeams(self, teamCount, playersPerTeam)
    GameRules:SetCustomGameTeamMaxPlayers(10, 0)
    GameRules:SetCustomGameTeamMaxPlayers(13, 0)
    do
        local i = 0
        while i < #EVO_PLAYABLE_TEAMS do
            local slots = i < teamCount and playersPerTeam or 0
            GameRules:SetCustomGameTeamMaxPlayers(EVO_PLAYABLE_TEAMS[i + 1], slots)
            i = i + 1
        end
    end
end
function EvoGameMode.prototype.initManagers(self)
    LinkLuaModifier("modifier_evo_peace_time", "modifiers/modifier_evo_peace_time", 0)
    linkMutationModifiers(nil)
    LinkLuaModifier("modifier_evo_boss_courage", "modifiers/modifier_evo_boss_courage", 0)
    LinkLuaModifier("modifier_evo_world_pause", "modifiers/modifier_evo_world_pause", 0)
    LinkLuaModifier("modifier_fountain_aura_lua", "modifiers/modifier_fountain_aura_lua", 0)
    LinkLuaModifier("modifier_fountain_buff_lua", "modifiers/modifier_fountain_buff_lua", 0)
    LinkLuaModifier("modifier_evo_hero_tier", "modifiers/modifier_evo_hero_tier", 0)
    self.lazyPrecacheManager:init()
    self.levelingManager:init()
    self.spellShopManager:init()
    self.evolutionManager:init()
    self.damageFilterManager:init()
    self.orderFilterManager:init()
    self.passiveGoldManager:init()
    self.phaseManager:init()
    self.damageFilterManager:registerGuard(function(____, event) return self.phaseManager:filterDamage(event) end)
    self.neutralCampsManager:init()
    self.runeManager:init()
    self.bossManager:init()
    self.matchScoreManager:init()
    self.duelManager:init()
    self.fountainManager:init()
    self.sharedTeamIntel:init()
    self.talentTreeManager:init()
    self.devCheats:init()
end
return ____exports
