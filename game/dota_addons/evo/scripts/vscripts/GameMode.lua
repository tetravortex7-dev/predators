local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 9,["27"] = 9,["28"] = 10,["29"] = 10,["30"] = 11,["31"] = 11,["32"] = 12,["33"] = 12,["34"] = 13,["35"] = 13,["36"] = 14,["37"] = 14,["38"] = 15,["39"] = 15,["40"] = 17,["41"] = 17,["42"] = 17,["44"] = 34,["45"] = 35,["46"] = 36,["47"] = 37,["48"] = 38,["49"] = 43,["50"] = 44,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 48,["55"] = 49,["56"] = 50,["57"] = 51,["58"] = 53,["59"] = 54,["60"] = 55,["61"] = 57,["62"] = 33,["63"] = 60,["64"] = 61,["65"] = 63,["66"] = 64,["67"] = 65,["68"] = 66,["69"] = 67,["70"] = 68,["71"] = 70,["72"] = 71,["73"] = 72,["74"] = 73,["75"] = 74,["76"] = 75,["77"] = 76,["78"] = 77,["79"] = 78,["80"] = 79,["81"] = 80,["82"] = 81,["83"] = 82,["84"] = 83,["85"] = 84,["86"] = 85,["87"] = 86,["88"] = 87,["89"] = 88,["90"] = 90,["91"] = 92,["92"] = 93,["93"] = 94,["95"] = 60,["96"] = 98,["97"] = 99,["98"] = 100,["99"] = 101,["100"] = 108,["101"] = 108,["102"] = 108,["103"] = 108,["104"] = 112,["105"] = 113,["106"] = 114,["108"] = 115,["109"] = 115,["110"] = 116,["111"] = 117,["112"] = 115,["117"] = 122,["118"] = 123,["119"] = 124,["120"] = 125,["121"] = 125,["122"] = 125,["123"] = 125,["125"] = 98,["126"] = 129,["127"] = 130,["128"] = 131,["129"] = 132,["130"] = 133,["133"] = 136,["134"] = 129,["135"] = 139,["136"] = 140,["137"] = 145,["138"] = 150,["139"] = 155,["140"] = 160,["141"] = 165,["142"] = 171,["143"] = 172,["144"] = 173,["145"] = 174,["146"] = 175,["147"] = 176,["148"] = 177,["149"] = 178,["150"] = 179,["151"] = 180,["152"] = 181,["153"] = 182,["154"] = 183,["155"] = 184,["156"] = 139,["157"] = 187,["158"] = 188,["159"] = 189,["161"] = 190,["162"] = 190,["164"] = 191,["165"] = 192,["169"] = 187});
local ____exports = {}
local ____EventBus = require("core.EventBus")
local EventBus = ____EventBus.EventBus
local ____LazyPrecacheManager = require("core.LazyPrecacheManager")
local LazyPrecacheManager = ____LazyPrecacheManager.LazyPrecacheManager
local ____LevelingManager = require("core.LevelingManager")
local LevelingManager = ____LevelingManager.LevelingManager
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____DevCheats = require("dev.DevCheats")
local DevCheats = ____DevCheats.DevCheats
local ____BossManager = require("systems.BossManager")
local BossManager = ____BossManager.BossManager
local ____DuelManager = require("systems.DuelManager")
local DuelManager = ____DuelManager.DuelManager
local ____EvolutionManager = require("systems.EvolutionManager")
local EvolutionManager = ____EvolutionManager.EvolutionManager
local ____MatchScoreManager = require("systems.MatchScoreManager")
local MatchScoreManager = ____MatchScoreManager.MatchScoreManager
local ____NeutralCampsManager = require("systems.NeutralCampsManager")
local NeutralCampsManager = ____NeutralCampsManager.NeutralCampsManager
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
    self.phaseManager = __TS__New(PhaseManager, self.eventBus)
    self.neutralCampsManager = __TS__New(NeutralCampsManager, self.eventBus)
    self.runeManager = __TS__New(RuneManager)
    self.bossManager = __TS__New(BossManager, self.eventBus)
    self.matchScoreManager = __TS__New(MatchScoreManager, self.eventBus)
    self.duelManager = __TS__New(DuelManager, self.eventBus, self.bossManager)
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
    GameRules:SetPreGameTime(5)
    GameRules:SetCustomGameSetupAutoLaunchDelay(IsInToolsMode() and 2 or 10)
    gameMode:SetCustomGameForceHero(EVO_CONSTANTS.BASE_HERO_NAME)
    GameRules:SetGoldPerTick(0)
    GameRules:SetGoldTickTime(1)
    GameRules:SetStartingGold(0)
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
    if IsInToolsMode() then
        gameMode:SetFogOfWarDisabled(true)
        gameMode:SetUnseenFogOfWarEnabled(false)
    end
end
function EvoGameMode.prototype.configureTeams(self, teamCount, playersPerTeam)
    GameRules:SetCustomGameTeamMaxPlayers(10, 0)
    local customSpawnTeams = self:detectCustomSpawnTeams()
    local customTeams = {6, 7, 8, 9}
    local hasAllCustomSpawns = __TS__ArrayEvery(
        __TS__ArraySlice(customTeams, 0, teamCount),
        function(____, team) return customSpawnTeams:has(team) end
    )
    if hasAllCustomSpawns then
        GameRules:SetCustomGameTeamMaxPlayers(2, 0)
        GameRules:SetCustomGameTeamMaxPlayers(3, 0)
        do
            local i = 0
            while i < #customTeams do
                local slots = i < teamCount and playersPerTeam or 0
                GameRules:SetCustomGameTeamMaxPlayers(customTeams[i + 1], slots)
                i = i + 1
            end
        end
        return
    end
    GameRules:SetCustomGameTeamMaxPlayers(2, playersPerTeam)
    GameRules:SetCustomGameTeamMaxPlayers(3, playersPerTeam)
    for ____, team in ipairs(customTeams) do
        GameRules:SetCustomGameTeamMaxPlayers(
            team,
            customSpawnTeams:has(team) and playersPerTeam or 0
        )
    end
end
function EvoGameMode.prototype.detectCustomSpawnTeams(self)
    local found = __TS__New(Set)
    for ____, entity in ipairs(Entities:FindAllByClassname("info_player_start_dota")) do
        if entity and not entity:IsNull() and IsValidEntity(entity) then
            found:add(entity:GetTeamNumber())
        end
    end
    return found
end
function EvoGameMode.prototype.initManagers(self)
    LinkLuaModifier("modifier_evo_peace_time", "modifiers/modifier_evo_peace_time", 0)
    LinkLuaModifier("modifier_evo_mutation_runtime", "modifiers/modifier_evo_mutation_runtime", 0)
    LinkLuaModifier("modifier_evo_boss_courage", "modifiers/modifier_evo_boss_courage", 0)
    LinkLuaModifier("modifier_evo_world_pause", "modifiers/modifier_evo_world_pause", 0)
    LinkLuaModifier("modifier_fountain_aura_lua", "modifiers/modifier_fountain_aura_lua", 0)
    LinkLuaModifier("modifier_fountain_buff_lua", "modifiers/modifier_fountain_buff_lua", 0)
    self:initFountains()
    self.lazyPrecacheManager:init()
    self.levelingManager:init()
    self.spellShopManager:init()
    self.evolutionManager:init()
    self.phaseManager:init()
    self.neutralCampsManager:init()
    self.runeManager:init()
    self.bossManager:init()
    self.matchScoreManager:init()
    self.duelManager:init()
    self.sharedTeamIntel:init()
    self.talentTreeManager:init()
    self.devCheats:init()
end
function EvoGameMode.prototype.initFountains(self)
    local fountains = Entities:FindAllByClassname("ent_dota_fountain")
    for ____, fountain in ipairs(fountains) do
        do
            if not fountain or fountain:IsNull() or not IsValidEntity(fountain) or not fountain:IsBaseNPC() then
                goto __continue17
            end
            fountain:AddNewModifier(fountain, nil, "modifier_fountain_aura_lua", {})
            fountain:RemoveModifierByName("modifier_fountain_aura")
        end
        ::__continue17::
    end
end
return ____exports
