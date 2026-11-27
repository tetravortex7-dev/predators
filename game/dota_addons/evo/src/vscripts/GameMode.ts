import { EventBus } from "./core/EventBus";
import { LazyPrecacheManager } from "./core/LazyPrecacheManager";
import { LevelingManager } from "./core/LevelingManager";
import { EVO_CONSTANTS, EVO_PLAYABLE_TEAMS } from "./data/game_constants";
import { DevCheats } from "./dev/DevCheats";
import { linkMutationModifiers } from "./modifiers/modifier_evo_mutation_runtime";
import { BossManager } from "./systems/BossManager";
import { DamageFilterManager } from "./systems/DamageFilterManager";
import { DuelManager } from "./systems/DuelManager";
import { EvolutionManager } from "./systems/EvolutionManager";
import { FountainManager } from "./systems/FountainManager";
import { MatchScoreManager } from "./systems/MatchScoreManager";
import { NeutralCampsManager } from "./systems/NeutralCampsManager";
import { OrderFilterManager } from "./systems/OrderFilterManager";
import { PassiveGoldManager } from "./systems/PassiveGoldManager";
import { PhaseManager } from "./systems/PhaseManager";
import { RuneManager } from "./systems/RuneManager";
import { SharedTeamIntel } from "./systems/SharedTeamIntel";
import { SpellShopManager } from "./systems/SpellShopManager";
import { TalentTreeManager } from "./systems/TalentTreeManager";

export class EvoGameMode {
    public readonly eventBus: EventBus;
    public readonly lazyPrecacheManager: LazyPrecacheManager;
    public readonly levelingManager: LevelingManager;
    public readonly evolutionManager: EvolutionManager;
    public readonly spellShopManager: SpellShopManager;
    public readonly damageFilterManager: DamageFilterManager;
    public readonly orderFilterManager: OrderFilterManager;
    public readonly passiveGoldManager: PassiveGoldManager;
    public readonly phaseManager: PhaseManager;
    public readonly neutralCampsManager: NeutralCampsManager;
    public readonly runeManager: RuneManager;
    public readonly bossManager: BossManager;
    public readonly matchScoreManager: MatchScoreManager;
    public readonly duelManager: DuelManager;
    public readonly fountainManager: FountainManager;
    public readonly sharedTeamIntel: SharedTeamIntel;
    public readonly talentTreeManager: TalentTreeManager;
    public readonly devCheats: DevCheats;

    constructor() {
        this.eventBus = new EventBus();
        this.lazyPrecacheManager = new LazyPrecacheManager();
        this.levelingManager = new LevelingManager(this.eventBus);
        this.spellShopManager = new SpellShopManager(this.eventBus);
        this.evolutionManager = new EvolutionManager(
            this.eventBus,
            this.spellShopManager,
            this.lazyPrecacheManager
        );
        this.damageFilterManager = new DamageFilterManager();
        this.orderFilterManager = new OrderFilterManager();
        this.passiveGoldManager = new PassiveGoldManager(this.eventBus);
        this.phaseManager = new PhaseManager(this.eventBus);
        this.neutralCampsManager = new NeutralCampsManager(this.eventBus);
        this.runeManager = new RuneManager();
        this.bossManager = new BossManager(this.eventBus);
        this.matchScoreManager = new MatchScoreManager(this.eventBus);
        this.duelManager = new DuelManager(this.eventBus, this.bossManager);
        this.fountainManager = new FountainManager(this.eventBus, (unit) =>
            this.duelManager.isActiveDuelist(unit)
        );
        this.sharedTeamIntel = new SharedTeamIntel(this.evolutionManager);
        this.talentTreeManager = new TalentTreeManager(this.eventBus);
        this.devCheats = new DevCheats(this.eventBus, this.levelingManager);

        this.configureGameRules();
        this.configureTeams(EVO_CONSTANTS.DEFAULT_TEAM_COUNT, EVO_CONSTANTS.DEFAULT_PLAYERS_PER_TEAM);
        this.initManagers();

        print("[Evo] GameMode initialized.");
    }

    private configureGameRules(): void {
        const gameMode = GameRules.GetGameModeEntity();

        GameRules.SetHeroSelectionTime(0);
        GameRules.SetStrategyTime(0);
        GameRules.SetShowcaseTime(0);
        GameRules.SetPreGameTime(
            IsInToolsMode() ? EVO_CONSTANTS.PRE_GAME_TIME_DEV : EVO_CONSTANTS.PRE_GAME_TIME_PROD
        );
        GameRules.SetCustomGameSetupAutoLaunchDelay(
            IsInToolsMode()
                ? EVO_CONSTANTS.CUSTOM_GAME_SETUP_DELAY_DEV
                : EVO_CONSTANTS.CUSTOM_GAME_SETUP_DELAY_PROD
        );
        gameMode.SetCustomGameForceHero(EVO_CONSTANTS.BASE_HERO_NAME);

        GameRules.SetGoldPerTick(0);
        GameRules.SetGoldTickTime(EVO_CONSTANTS.GOLD_TICK_TIME);
        GameRules.SetStartingGold(EVO_CONSTANTS.STARTING_GOLD);
        GameRules.SetUseUniversalShopMode(false);
        gameMode.SetFreeCourierModeEnabled(false);
        gameMode.SetNeutralStashEnabled(false);
        gameMode.SetNeutralItemHideUndiscoveredEnabled(true);
        gameMode.SetAllowNeutralItemDrops(false);
        gameMode.SetUseDefaultDOTARuneSpawnLogic(false);
        gameMode.SetRuneEnabled(RuneType.DOUBLEDAMAGE, true);
        gameMode.SetRuneEnabled(RuneType.HASTE, true);
        gameMode.SetRuneEnabled(RuneType.ILLUSION, true);
        gameMode.SetRuneEnabled(RuneType.INVISIBILITY, true);
        gameMode.SetRuneEnabled(RuneType.REGENERATION, true);
        gameMode.SetRuneEnabled(RuneType.BOUNTY, true);
        gameMode.SetRuneEnabled(RuneType.ARCANE, true);
        gameMode.SetRuneEnabled(RuneType.WATER, false);
        gameMode.SetRuneEnabled(RuneType.XP, false);
        gameMode.SetRuneEnabled(RuneType.SHIELD, true);

        gameMode.SetBuybackEnabled(true);
        gameMode.SetCustomScanCooldown(EVO_CONSTANTS.SCAN_COOLDOWN_SECONDS);
        gameMode.SetCustomScanMaxCharges(EVO_CONSTANTS.SCAN_MAX_CHARGES);
    }

    public configureTeams(teamCount: number, playersPerTeam: number): void {
        GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.CUSTOM_5, 0);
        GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.CUSTOM_8, 0);

        for (let i = 0; i < EVO_PLAYABLE_TEAMS.length; i++) {
            const slots = i < teamCount ? playersPerTeam : 0;
            GameRules.SetCustomGameTeamMaxPlayers(EVO_PLAYABLE_TEAMS[i], slots);
        }
    }

    private initManagers(): void {
        LinkLuaModifier(
            "modifier_evo_peace_time",
            "modifiers/modifier_evo_peace_time",
            LuaModifierMotionType.NONE
        );
        linkMutationModifiers();
        LinkLuaModifier(
            "modifier_evo_boss_courage",
            "modifiers/modifier_evo_boss_courage",
            LuaModifierMotionType.NONE
        );
        LinkLuaModifier(
            "modifier_evo_world_pause",
            "modifiers/modifier_evo_world_pause",
            LuaModifierMotionType.NONE
        );
        LinkLuaModifier(
            "modifier_fountain_aura_lua",
            "modifiers/modifier_fountain_aura_lua",
            LuaModifierMotionType.NONE
        );
        LinkLuaModifier(
            "modifier_fountain_buff_lua",
            "modifiers/modifier_fountain_buff_lua",
            LuaModifierMotionType.NONE
        );
        LinkLuaModifier(
            "modifier_evo_hero_tier",
            "modifiers/modifier_evo_hero_tier",
            LuaModifierMotionType.NONE
        );

        this.lazyPrecacheManager.init();
        this.levelingManager.init();
        this.spellShopManager.init();
        this.evolutionManager.init();
        this.damageFilterManager.init();
        this.orderFilterManager.init();
        this.passiveGoldManager.init();
        this.phaseManager.init();
        this.damageFilterManager.registerGuard((event) => this.phaseManager.filterDamage(event));
        this.neutralCampsManager.init();
        this.runeManager.init();
        this.bossManager.init();
        this.matchScoreManager.init();
        this.duelManager.init();
        this.fountainManager.init();
        this.sharedTeamIntel.init();
        this.talentTreeManager.init();
        this.devCheats.init();
    }
}
