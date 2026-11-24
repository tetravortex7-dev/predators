import { EventBus } from "./core/EventBus";
import { LazyPrecacheManager } from "./core/LazyPrecacheManager";
import { LevelingManager } from "./core/LevelingManager";
import { EVO_CONSTANTS } from "./data/game_constants";
import { DevCheats } from "./dev/DevCheats";
import { BossManager } from "./systems/BossManager";
import { DuelManager } from "./systems/DuelManager";
import { EvolutionManager } from "./systems/EvolutionManager";
import { MatchScoreManager } from "./systems/MatchScoreManager";
import { NeutralCampsManager } from "./systems/NeutralCampsManager";
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
    public readonly phaseManager: PhaseManager;
    public readonly neutralCampsManager: NeutralCampsManager;
    public readonly runeManager: RuneManager;
    public readonly bossManager: BossManager;
    public readonly matchScoreManager: MatchScoreManager;
    public readonly duelManager: DuelManager;
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
        this.phaseManager = new PhaseManager(this.eventBus);
        this.neutralCampsManager = new NeutralCampsManager(this.eventBus);
        this.runeManager = new RuneManager();
        this.bossManager = new BossManager(this.eventBus);
        this.matchScoreManager = new MatchScoreManager(this.eventBus);
        this.duelManager = new DuelManager(this.eventBus, this.bossManager);
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
        GameRules.SetPreGameTime(5);
        GameRules.SetCustomGameSetupAutoLaunchDelay(IsInToolsMode() ? 2 : 10);
        gameMode.SetCustomGameForceHero(EVO_CONSTANTS.BASE_HERO_NAME);

        GameRules.SetGoldPerTick(0);
        GameRules.SetGoldTickTime(1);
        GameRules.SetStartingGold(0);
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

        if (IsInToolsMode()) {
            gameMode.SetFogOfWarDisabled(true);
            gameMode.SetUnseenFogOfWarEnabled(false);
        }
    }

    public configureTeams(teamCount: 3 | 4, playersPerTeam: number): void {
        GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.CUSTOM_5, 0);
        const customSpawnTeams = this.detectCustomSpawnTeams();
        const customTeams: DotaTeam[] = [
            DotaTeam.CUSTOM_1,
            DotaTeam.CUSTOM_2,
            DotaTeam.CUSTOM_3,
            DotaTeam.CUSTOM_4,
        ];

        const hasAllCustomSpawns = customTeams
            .slice(0, teamCount)
            .every((team) => customSpawnTeams.has(team));

        if (hasAllCustomSpawns) {
            GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.GOODGUYS, 0);
            GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.BADGUYS, 0);
            for (let i = 0; i < customTeams.length; i++) {
                const slots = i < teamCount ? playersPerTeam : 0;
                GameRules.SetCustomGameTeamMaxPlayers(customTeams[i], slots);
            }
            return;
        }

        GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.GOODGUYS, playersPerTeam);
        GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.BADGUYS, playersPerTeam);
        for (const team of customTeams) {
            GameRules.SetCustomGameTeamMaxPlayers(team, customSpawnTeams.has(team) ? playersPerTeam : 0);
        }
    }

    private detectCustomSpawnTeams(): Set<DotaTeam> {
        const found = new Set<DotaTeam>();
        for (const entity of Entities.FindAllByClassname("info_player_start_dota")) {
            if (entity && !entity.IsNull() && IsValidEntity(entity)) {
                found.add(entity.GetTeamNumber());
            }
        }
        return found;
    }

    private initManagers(): void {
        LinkLuaModifier(
            "modifier_evo_peace_time",
            "modifiers/modifier_evo_peace_time",
            LuaModifierMotionType.NONE
        );
        LinkLuaModifier(
            "modifier_evo_mutation_runtime",
            "modifiers/modifier_evo_mutation_runtime",
            LuaModifierMotionType.NONE
        );
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

        this.initFountains();
        this.lazyPrecacheManager.init();
        this.levelingManager.init();
        this.spellShopManager.init();
        this.evolutionManager.init();
        this.phaseManager.init();
        this.neutralCampsManager.init();
        this.runeManager.init();
        this.bossManager.init();
        this.matchScoreManager.init();
        this.duelManager.init();
        this.sharedTeamIntel.init();
        this.talentTreeManager.init();
        this.devCheats.init();
    }

    private initFountains(): void {
        const fountains = Entities.FindAllByClassname("ent_dota_fountain");
        for (const fountain of fountains) {
            if (!fountain || fountain.IsNull() || !IsValidEntity(fountain) || !fountain.IsBaseNPC()) continue;
            fountain.AddNewModifier(fountain, undefined, "modifier_fountain_aura_lua", {});
            fountain.RemoveModifierByName("modifier_fountain_aura");
        }
    }
}
