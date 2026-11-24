import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS, EVO_MAP_ENTITIES } from "../data/game_constants";
import { BossManager } from "./BossManager";

interface PreDuelSnapshot {
    position: Vector;
    health: number;
    mana: number;
    wasAlive: boolean;
    abilityCooldowns: Map<string, number>;
    itemCooldowns: Map<number, number>;
    peaceTimeRemaining: number;
}

interface DuelPair {
    playerA: PlayerID;
    playerB: PlayerID;
    teamA: DotaTeam;
    teamB: DotaTeam;
}

interface ActiveBossDuel {
    bossId: string;
    bossEntIndex: EntityIndex;
    bossReturnPos: Vector;
    challengingTeam: DotaTeam;
    challengerIds: PlayerID[];
    lootEndTime?: number;
}

interface DuelBet {
    bettorId: PlayerID;
    backedTarget: number;
    goldAmount: number;
}

interface DuelApplyPayload {
    PlayerID: PlayerID;
}

interface DuelBetPayload {
    PlayerID: PlayerID;
    backed_player_id?: number;
    gold_amount?: number;
}

const PLAYABLE_TEAMS: readonly DotaTeam[] = [
    DotaTeam.GOODGUYS,
    DotaTeam.BADGUYS,
    DotaTeam.CUSTOM_1,
    DotaTeam.CUSTOM_2,
    DotaTeam.CUSTOM_3,
    DotaTeam.CUSTOM_4,
];

const DUEL_BET_WINDOW_SECONDS = 8;
const BOSS_DUEL_BET_TEAM = 1;
const BOSS_DUEL_BET_BOSS = -2;

export class DuelManager {
    private spawnA: Vector = Vector(-500, 0, 128);
    private spawnB: Vector = Vector(500, 0, 128);
    private arenaCenter: Vector = Vector(0, 0, 128);

    private started = false;
    private matchEnded = false;
    private roundIndex = 0;
    private nextDuelTime: number = EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;

    private active = false;
    private isTiebreaker = false;
    private betsOpen = false;
    private duelEndTime = 0;
    private betCloseTime = 0;

    private pendingPairs: DuelPair[] = [];
    private currentPair?: DuelPair;
    private activeBossDuel?: ActiveBossDuel;
    private readonly activeDuelistEntIndexes: Set<EntityIndex> = new Set();
    private readonly snapshots: Map<PlayerID, PreDuelSnapshot> = new Map();
    private readonly applicants: Set<PlayerID> = new Set();
    private readonly activeBets: Map<PlayerID, DuelBet> = new Map();
    private readonly pausedEntIndexes: Set<EntityIndex> = new Set();

    private sparringDummy?: CDOTA_BaseNPC;
    private tiebreakerTeams: [DotaTeam, DotaTeam] | undefined;
    private tiebreakerWins: Map<DotaTeam, number> = new Map();

    constructor(
        private readonly eventBus: EventBus,
        private readonly bossManager: BossManager
    ) {}

    public init(): void {
        this.discoverArenaLocations();

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        CustomGameEventManager.RegisterListener("evo_duel_apply", (_, event) => {
            this.onDuelApply(event as unknown as DuelApplyPayload);
        });
        CustomGameEventManager.RegisterListener("evo_duel_bet", (_, event) => {
            this.onDuelBet(event as unknown as DuelBetPayload);
        });

        this.eventBus.on("tiebreaker_requested", ({ tiedTeams }) => {
            this.startTiebreaker(tiedTeams);
        });

        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
            this.releaseWorldPause();
        });

        this.eventBus.on("dev_command", ({ playerId, command, args }) => {
            if (command === "-evo_duel") {
                this.triggerDevDuel(playerId, args);
            }
        });

        this.syncDuelState();
    }

    public isActiveDuelist(entity: CBaseEntity): boolean {
        return this.active && this.activeDuelistEntIndexes.has(entity.entindex());
    }

    public getArenaCenter(): Vector {
        return this.arenaCenter;
    }

    private discoverArenaLocations(): void {
        const spawnAEnt =
            Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_SPAWN_A) ??
            Entities.FindByName(undefined, "duel_1_teleport_2");
        const spawnBEnt =
            Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_SPAWN_B) ??
            Entities.FindByName(undefined, "duel_1_teleport_3");
        const centerEnt =
            Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) ??
            Entities.FindByName(undefined, "duel_1");

        if (centerEnt && !centerEnt.IsNull() && IsValidEntity(centerEnt)) {
            this.arenaCenter = centerEnt.GetAbsOrigin();
        }
        if (spawnAEnt && !spawnAEnt.IsNull() && IsValidEntity(spawnAEnt)) {
            this.spawnA = spawnAEnt.GetAbsOrigin();
        } else {
            this.spawnA = Vector(this.arenaCenter.x - 450, this.arenaCenter.y, this.arenaCenter.z);
        }
        if (spawnBEnt && !spawnBEnt.IsNull() && IsValidEntity(spawnBEnt)) {
            this.spawnB = spawnBEnt.GetAbsOrigin();
        } else {
            this.spawnB = Vector(this.arenaCenter.x + 450, this.arenaCenter.y, this.arenaCenter.z);
        }
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            this.nextDuelTime = GameRules.GetDOTATime(false, false) + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
            this.syncDuelState();

            GameRules.GetGameModeEntity().SetContextThink(
                "EvoDuelManagerThink",
                () => this.onThink(),
                1.0
            );
        }
    }

    private onThink(): number | undefined {
        if (this.matchEnded) return undefined;
        const now = GameRules.GetDOTATime(false, false);

        if (this.active) {
            if (this.betsOpen && now >= this.betCloseTime) {
                this.betsOpen = false;
            }
            if (this.activeBossDuel) {
                if (this.activeBossDuel.lootEndTime !== undefined) {
                    if (now >= this.activeBossDuel.lootEndTime) {
                        this.finalizeBossDuel(true);
                    } else {
                        this.syncDuelState();
                    }
                    return 1.0;
                }
                if (now >= this.duelEndTime) {
                    this.finalizeBossDuel(false);
                } else {
                    this.syncDuelState();
                }
                return 1.0;
            }
            if (now >= this.duelEndTime) {
                this.finishCurrentDuel(undefined, undefined);
            } else {
                this.syncDuelState();
            }
            return 1.0;
        }

        if (!this.isTiebreaker && this.roundIndex < EVO_CONSTANTS.DUEL_MAX_ROUNDS && now >= this.nextDuelTime) {
            this.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS;
            this.startRegularDuelSeries();
        }

        return 1.0;
    }

    private startRegularDuelSeries(): void {
        const nextRound = this.roundIndex + 1;
        if (
            nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS === 0 &&
            this.bossManager.getStrongestAliveBoss() !== undefined
        ) {
            const team = this.pickWeightedBossDuelTeam();
            if (team !== undefined && this.startBossArenaDuel(team)) {
                this.applicants.clear();
                return;
            }
        }

        const pairs = this.generateDuelPairs();
        if (pairs.length === 0) {
            this.debugChat("[Evo] Duel skipped: not enough teams.");
            return;
        }

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.pendingPairs = pairs;
        this.applicants.clear();

        this.beginNextPair();
    }

    private startBossArenaDuel(challengingTeam: DotaTeam): boolean {
        const bossInfo = this.bossManager.getStrongestAliveBoss();
        if (!bossInfo) return false;

        const challengers = this.getTeamPlayerIds(challengingTeam);
        if (challengers.length === 0) return false;

        const bossReturnPos = this.bossManager.prepareBossForArena(bossInfo.bossId, this.spawnB, this.spawnA);
        if (!bossReturnPos) return false;

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.active = true;
        this.betsOpen = true;
        this.currentPair = undefined;
        this.activeBets.clear();
        this.activeDuelistEntIndexes.clear();
        this.snapshots.clear();

        const now = GameRules.GetDOTATime(false, false);
        this.betCloseTime = now + DUEL_BET_WINDOW_SECONDS;
        this.duelEndTime = now + EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS;

        const perpDir = Vector(-(this.spawnB.y - this.spawnA.y), this.spawnB.x - this.spawnA.x, 0).Normalized();
        for (let i = 0; i < challengers.length; i++) {
            const offset = (i - (challengers.length - 1) / 2) * 140;
            const spawnPos = Vector(
                this.spawnA.x + perpDir.x * offset,
                this.spawnA.y + perpDir.y * offset,
                this.spawnA.z
            );
            this.prepareDuelist(challengers[i], spawnPos, this.spawnB);
        }

        this.activeDuelistEntIndexes.add(bossInfo.unit.entindex());
        this.activeBossDuel = {
            bossId: bossInfo.bossId,
            bossEntIndex: bossInfo.unit.entindex(),
            bossReturnPos,
            challengingTeam,
            challengerIds: challengers,
        };

        this.applyWorldPause();

        this.eventBus.emit("duel_started", {
            roundIndex: this.roundIndex,
            isTiebreaker: false,
        });
        this.broadcastDuelEvent("started");
        this.syncDuelState();

        this.debugChat(
            `[Evo] BOSS ARENA! Team ${challengingTeam} vs ${bossInfo.bossId} (Lv.${bossInfo.level}) — ${EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS}s!`
        );
        return true;
    }

    private finalizeBossDuel(teamWon: boolean): void {
        if (!this.active || !this.activeBossDuel) return;

        const bossDuel = this.activeBossDuel;
        this.active = false;
        this.betsOpen = false;
        this.activeBossDuel = undefined;
        this.activeDuelistEntIndexes.clear();

        this.settleBossDuelBets(teamWon);

        for (const pid of bossDuel.challengerIds) {
            this.restoreDuelistAfterDuel(pid, teamWon);
        }
        this.snapshots.clear();

        this.bossManager.returnBossFromArena(bossDuel.bossId, bossDuel.bossReturnPos, !teamWon);
        this.releaseWorldPause();

        const leadWinner = teamWon ? bossDuel.challengerIds[0] : undefined;
        this.eventBus.emit("duel_finished", {
            roundIndex: this.roundIndex,
            winnerId: leadWinner,
            loserId: undefined,
            isTiebreaker: false,
        });
        this.broadcastDuelEvent("finished", leadWinner);
        this.syncDuelState();

        if (teamWon) {
            this.debugChat(`[Evo] Team ${bossDuel.challengingTeam} defeated ${bossDuel.bossId} in the Boss Arena!`);
        } else {
            this.debugChat(`[Evo] ${bossDuel.bossId} crushed the challengers and entered COURAGE mode!`);
        }
    }

    private pickWeightedBossDuelTeam(): DotaTeam | undefined {
        const activeTeams: DotaTeam[] = [];
        for (const team of PLAYABLE_TEAMS) {
            if (this.getTeamPlayerIds(team).length > 0) {
                activeTeams.push(team);
            }
        }
        if (activeTeams.length === 0) return undefined;

        let totalWeight = 0;
        const weights: number[] = [];
        for (const team of activeTeams) {
            let teamWeight = 1.0;
            for (const pid of this.getTeamPlayerIds(team)) {
                if (this.applicants.has(pid)) {
                    teamWeight += EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER;
                }
            }
            weights.push(teamWeight);
            totalWeight += teamWeight;
        }

        let roll = RandomFloat(0, totalWeight);
        for (let i = 0; i < activeTeams.length; i++) {
            roll -= weights[i];
            if (roll <= 0) {
                return activeTeams[i];
            }
        }
        return activeTeams[activeTeams.length - 1];
    }

    private startTiebreaker(tiedTeams: DotaTeam[]): void {
        if (this.matchEnded || tiedTeams.length < 2) return;

        this.isTiebreaker = true;
        this.tiebreakerTeams = [tiedTeams[0], tiedTeams[1]];
        this.tiebreakerWins.clear();
        this.tiebreakerWins.set(tiedTeams[0], 0);
        this.tiebreakerWins.set(tiedTeams[1], 0);
        this.pendingPairs = [];

        this.debugChat("[Evo] TIEBREAKER Bo3 started!");
        this.queueNextTiebreakerPair();
    }

    private queueNextTiebreakerPair(): void {
        if (!this.tiebreakerTeams) return;
        const [teamA, teamB] = this.tiebreakerTeams;
        const playerA = this.pickWeightedChampion(teamA);
        const playerB = this.pickWeightedChampion(teamB);
        if (playerA === undefined || playerB === undefined) {
            const fallbackWinner = playerA !== undefined ? teamA : teamB;
            this.finishTiebreaker(fallbackWinner);
            return;
        }

        this.roundIndex += 1;
        this.pendingPairs = [{ playerA, playerB, teamA, teamB }];
        this.beginNextPair();
    }

    private triggerDevDuel(playerId: PlayerID, args: string[]): void {
        const sub = (args[0] ?? "").toLowerCase();
        if (sub === "boss") {
            if (this.active) {
                if (this.activeBossDuel) {
                    this.finalizeBossDuel(false);
                } else {
                    this.finishCurrentDuel(playerId, undefined);
                }
                return;
            }
            if (this.bossManager.getStrongestAliveBoss() === undefined) {
                this.bossManager.spawnMatchBosses();
            }
            const team = PlayerResource.GetTeam(playerId);
            if (!this.startBossArenaDuel(team)) {
                this.debugChat("[Evo] Waiting for boss spawn — run -evo_duel boss again in 1s.");
            }
            return;
        }

        if (this.active) {
            if (this.activeBossDuel) {
                this.finalizeBossDuel(false);
            } else {
                this.finishCurrentDuel(playerId, undefined);
            }
            return;
        }

        const pairs = this.generateDuelPairs();
        if (pairs.length > 0) {
            this.roundIndex += 1;
            this.isTiebreaker = false;
            this.pendingPairs = pairs;
            this.beginNextPair();
            return;
        }

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        this.roundIndex += 1;
        this.isTiebreaker = false;
        this.currentPair = {
            playerA: playerId,
            playerB: -1 as PlayerID,
            teamA: PlayerResource.GetTeam(playerId),
            teamB: DotaTeam.CUSTOM_5,
        };
        this.active = true;
        this.betsOpen = false;
        const now = GameRules.GetDOTATime(false, false);
        this.duelEndTime = now + EVO_CONSTANTS.DUEL_DURATION_SECONDS;

        this.activeDuelistEntIndexes.clear();
        this.snapshots.clear();
        this.prepareDuelist(playerId, this.spawnA, this.spawnB);

        this.sparringDummy = CreateUnitByName(
            "npc_dota_hero_tidehunter",
            this.spawnB,
            true,
            undefined,
            undefined,
            DotaTeam.CUSTOM_5
        );
        if (this.sparringDummy && !this.sparringDummy.IsNull()) {
            this.activeDuelistEntIndexes.add(this.sparringDummy.entindex());
            if (this.sparringDummy.IsHero()) {
                while (this.sparringDummy.GetLevel() < hero.GetLevel()) {
                    this.sparringDummy.HeroLevelUp(false);
                }
            }
            ExecuteOrderFromTable({
                UnitIndex: this.sparringDummy.entindex(),
                OrderType: UnitOrder.ATTACK_TARGET,
                TargetIndex: hero.entindex(),
                Queue: false,
            });
        }

        this.applyWorldPause();
        this.broadcastDuelEvent("started");
        this.syncDuelState();
        this.debugChat("[Evo] Dev solo duel started on arena!");
    }

    private generateDuelPairs(): DuelPair[] {
        const activeTeams: DotaTeam[] = [];
        for (const team of PLAYABLE_TEAMS) {
            if (this.getTeamPlayerIds(team).length > 0) {
                activeTeams.push(team);
            }
        }

        if (activeTeams.length < 2) return [];

        const shuffled = [...activeTeams];
        for (let i = shuffled.length - 1; i > 0; i--) {
            const j = RandomInt(0, i);
            const tmp = shuffled[i];
            shuffled[i] = shuffled[j];
            shuffled[j] = tmp;
        }

        const teamPairs: Array<[DotaTeam, DotaTeam]> = [];
        if (shuffled.length === 2) {
            teamPairs.push([shuffled[0], shuffled[1]]);
        } else if (shuffled.length === 3) {
            teamPairs.push([shuffled[0], shuffled[1]]);
            teamPairs.push([shuffled[1], shuffled[2]]);
            teamPairs.push([shuffled[2], shuffled[0]]);
        } else {
            teamPairs.push([shuffled[0], shuffled[1]]);
            teamPairs.push([shuffled[2], shuffled[3]]);
        }

        const result: DuelPair[] = [];
        for (const [teamA, teamB] of teamPairs) {
            const playerA = this.pickWeightedChampion(teamA);
            const playerB = this.pickWeightedChampion(teamB);
            if (playerA !== undefined && playerB !== undefined) {
                result.push({ playerA, playerB, teamA, teamB });
            }
        }
        return result;
    }

    private pickWeightedChampion(team: DotaTeam): PlayerID | undefined {
        const candidates = this.getTeamPlayerIds(team);
        if (candidates.length === 0) return undefined;

        let totalWeight = 0;
        const weights: number[] = [];
        for (const pid of candidates) {
            const w = this.applicants.has(pid) ? EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER : 1.0;
            weights.push(w);
            totalWeight += w;
        }

        let roll = RandomFloat(0, totalWeight);
        for (let i = 0; i < candidates.length; i++) {
            roll -= weights[i];
            if (roll <= 0) {
                return candidates[i];
            }
        }
        return candidates[candidates.length - 1];
    }

    private beginNextPair(): void {
        const nextPair = this.pendingPairs.shift();
        if (!nextPair) {
            this.active = false;
            this.currentPair = undefined;
            this.releaseWorldPause();
            this.syncDuelState();
            return;
        }

        this.currentPair = nextPair;
        this.active = true;
        this.betsOpen = true;
        this.activeBets.clear();
        this.activeDuelistEntIndexes.clear();
        this.snapshots.clear();

        const now = GameRules.GetDOTATime(false, false);
        this.betCloseTime = now + DUEL_BET_WINDOW_SECONDS;
        this.duelEndTime = now + EVO_CONSTANTS.DUEL_DURATION_SECONDS;

        this.prepareDuelist(nextPair.playerA, this.spawnA, this.spawnB);
        this.prepareDuelist(nextPair.playerB, this.spawnB, this.spawnA);
        this.applyWorldPause();

        this.eventBus.emit("duel_started", {
            roundIndex: this.roundIndex,
            isTiebreaker: this.isTiebreaker,
        });
        this.broadcastDuelEvent("started");
        this.syncDuelState();

        this.debugChat(`[Evo] Duel Round #${this.roundIndex} started! (${EVO_CONSTANTS.DUEL_DURATION_SECONDS}s)`);
    }

    private prepareDuelist(playerId: PlayerID, spawnPos: Vector, lookTarget: Vector): void {
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        const peaceMod = hero.FindModifierByName("modifier_evo_peace_time");
        const peaceRemaining = peaceMod ? Math.max(0, peaceMod.GetRemainingTime()) : 0;

        const abilityCooldowns = new Map<string, number>();
        for (let i = 0; i < hero.GetAbilityCount(); i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (!ability || ability.IsNull()) continue;
            const cd = ability.GetCooldownTimeRemaining();
            if (cd > 0) {
                abilityCooldowns.set(ability.GetAbilityName(), cd);
            }
        }

        const itemCooldowns = new Map<number, number>();
        for (let slot = 0; slot < 9; slot++) {
            const item = hero.GetItemInSlot(slot);
            if (!item || item.IsNull()) continue;
            const cd = item.GetCooldownTimeRemaining();
            if (cd > 0) {
                itemCooldowns.set(slot, cd);
            }
        }

        this.snapshots.set(playerId, {
            position: hero.GetAbsOrigin(),
            health: hero.GetHealth(),
            mana: hero.GetMana(),
            wasAlive: hero.IsAlive(),
            abilityCooldowns,
            itemCooldowns,
            peaceTimeRemaining: peaceRemaining,
        });

        if (!hero.IsAlive()) {
            hero.RespawnHero(false, false);
        }

        hero.RemoveModifierByName("modifier_evo_peace_time");
        hero.RemoveModifierByName("modifier_evo_world_pause");
        hero.Purge(false, true, false, true, true);
        hero.SetHealth(hero.GetMaxHealth());
        hero.SetMana(hero.GetMaxMana());

        for (let i = 0; i < hero.GetAbilityCount(); i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (ability && !ability.IsNull()) {
                ability.EndCooldown();
            }
        }
        for (let slot = 0; slot < 9; slot++) {
            const item = hero.GetItemInSlot(slot);
            if (item && !item.IsNull()) {
                item.EndCooldown();
            }
        }

        FindClearSpaceForUnit(hero, spawnPos, true);
        hero.Stop();
        const dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0).Normalized();
        hero.SetForwardVector(dir);

        this.activeDuelistEntIndexes.add(hero.entindex());
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        if (!this.active) return;

        const killedIndex = event.entindex_killed;
        if (!this.activeDuelistEntIndexes.has(killedIndex)) return;

        const victim = EntIndexToHScript(killedIndex);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (victim.IsReincarnating()) return;

        if (this.activeBossDuel) {
            if (killedIndex === this.activeBossDuel.bossEntIndex) {
                const now = GameRules.GetDOTATime(false, false);
                this.activeBossDuel.lootEndTime = now + EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS;
                this.debugChat(
                    `[Evo] Boss slain! Grab the Boss Core (${EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS}s)...`
                );
                return;
            }

            const anyChallengerAlive = this.activeBossDuel.challengerIds.some((pid) => {
                const h = PlayerResource.GetSelectedHeroEntity(pid);
                return h !== undefined && !h.IsNull() && IsValidEntity(h) && (h.IsAlive() || h.IsReincarnating());
            });
            if (!anyChallengerAlive) {
                this.finalizeBossDuel(false);
            }
            return;
        }

        if (!this.currentPair) return;

        if (this.sparringDummy && !this.sparringDummy.IsNull() && killedIndex === this.sparringDummy.entindex()) {
            this.finishCurrentDuel(this.currentPair.playerA, undefined);
            return;
        }

        const victimPlayerId = victim.GetPlayerOwnerID();
        if (victimPlayerId === this.currentPair.playerA) {
            this.finishCurrentDuel(this.currentPair.playerB, this.currentPair.playerA);
        } else if (victimPlayerId === this.currentPair.playerB) {
            this.finishCurrentDuel(this.currentPair.playerA, this.currentPair.playerB);
        }
    }

    private finishCurrentDuel(winnerId: PlayerID | undefined, loserId: PlayerID | undefined): void {
        if (!this.active) return;

        const pair = this.currentPair;
        this.active = false;
        this.betsOpen = false;
        this.currentPair = undefined;
        this.activeDuelistEntIndexes.clear();

        if (this.sparringDummy && !this.sparringDummy.IsNull() && IsValidEntity(this.sparringDummy)) {
            UTIL_Remove(this.sparringDummy);
        }
        this.sparringDummy = undefined;

        this.settleBets(winnerId);

        if (pair) {
            this.restoreDuelistAfterDuel(pair.playerA, winnerId === pair.playerA);
            this.restoreDuelistAfterDuel(pair.playerB, winnerId === pair.playerB);
        }

        this.snapshots.clear();

        const validWinner =
            winnerId !== undefined && PlayerResource.IsValidPlayerID(winnerId) ? winnerId : undefined;
        const validLoser =
            loserId !== undefined && PlayerResource.IsValidPlayerID(loserId) ? loserId : undefined;

        this.eventBus.emit("duel_finished", {
            roundIndex: this.roundIndex,
            winnerId: validWinner,
            loserId: validLoser,
            isTiebreaker: this.isTiebreaker,
        });
        this.broadcastDuelEvent("finished", validWinner);

        if (validWinner !== undefined) {
            const winnerName = PlayerResource.GetPlayerName(validWinner);
            this.debugChat(`[Evo] Duel winner: ${winnerName || `Player ${validWinner + 1}`}!`);
        } else {
            this.debugChat("[Evo] Duel ended in a draw!");
        }

        if (this.isTiebreaker && this.tiebreakerTeams) {
            if (validWinner !== undefined) {
                const winTeam = PlayerResource.GetTeam(validWinner);
                const newWins = (this.tiebreakerWins.get(winTeam) ?? 0) + 1;
                this.tiebreakerWins.set(winTeam, newWins);
                if (newWins >= 2) {
                    this.finishTiebreaker(winTeam);
                    return;
                }
            }
            this.queueNextTiebreakerPair();
            return;
        }

        if (this.pendingPairs.length > 0) {
            this.beginNextPair();
        } else {
            this.releaseWorldPause();
            this.syncDuelState();
        }
    }

    private finishTiebreaker(winnerTeam: DotaTeam): void {
        this.isTiebreaker = false;
        this.tiebreakerTeams = undefined;
        this.releaseWorldPause();
        this.syncDuelState();

        this.eventBus.emit("match_ended", {
            winnerTeam,
            reason: "tiebreaker",
        });
        GameRules.SetGameWinner(winnerTeam);
    }

    private restoreDuelistAfterDuel(playerId: PlayerID, isWinner: boolean): void {
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        const snapshot = this.snapshots.get(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !snapshot) return;

        if (!hero.IsAlive()) {
            hero.RespawnHero(false, false);
        }

        FindClearSpaceForUnit(hero, snapshot.position, true);
        hero.Stop();

        if (isWinner) {
            hero.Purge(false, true, false, true, true);
            hero.SetHealth(Math.max(1, Math.min(hero.GetMaxHealth(), snapshot.health)));
            hero.SetMana(Math.max(0, Math.min(hero.GetMaxMana(), snapshot.mana)));

            for (let i = 0; i < hero.GetAbilityCount(); i++) {
                const ability = hero.GetAbilityByIndex(i);
                if (!ability || ability.IsNull()) continue;
                ability.EndCooldown();
                const savedCd = snapshot.abilityCooldowns.get(ability.GetAbilityName());
                if (savedCd !== undefined && savedCd > 0) {
                    ability.StartCooldown(savedCd);
                }
            }

            for (let slot = 0; slot < 9; slot++) {
                const item = hero.GetItemInSlot(slot);
                if (!item || item.IsNull()) continue;
                item.EndCooldown();
                const savedCd = snapshot.itemCooldowns.get(slot);
                if (savedCd !== undefined && savedCd > 0) {
                    item.StartCooldown(savedCd);
                }
            }
        }

        if (snapshot.peaceTimeRemaining > 0) {
            hero.AddNewModifier(hero, undefined, "modifier_evo_peace_time", {
                duration: snapshot.peaceTimeRemaining,
            });
        }
    }

    private applyWorldPause(): void {
        this.releaseWorldPause();

        const allUnits = FindUnitsInRadius(
            DotaTeam.GOODGUYS,
            Vector(0, 0, 0),
            undefined,
            FIND_UNITS_EVERYWHERE,
            UnitTargetTeam.BOTH,
            UnitTargetType.HERO | UnitTargetType.BASIC,
            UnitTargetFlags.INVULNERABLE | UnitTargetFlags.MAGIC_IMMUNE_ENEMIES,
            FindOrder.ANY,
            false
        );

        for (const unit of allUnits) {
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) continue;
            if (this.activeDuelistEntIndexes.has(unit.entindex())) continue;
            unit.AddNewModifier(unit, undefined, "modifier_evo_world_pause", {});
            this.pausedEntIndexes.add(unit.entindex());
        }

        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const pid = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(pid)) continue;
            const hero = PlayerResource.GetSelectedHeroEntity(pid);
            if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) continue;
            if (this.activeDuelistEntIndexes.has(hero.entindex())) continue;
            hero.AddNewModifier(hero, undefined, "modifier_evo_world_pause", {});
            this.pausedEntIndexes.add(hero.entindex());
        }
    }

    private releaseWorldPause(): void {
        for (const entIndex of this.pausedEntIndexes) {
            const ent = EntIndexToHScript(entIndex);
            if (ent && !ent.IsNull() && IsValidEntity(ent) && ent.IsBaseNPC()) {
                ent.RemoveModifierByName("modifier_evo_world_pause");
            }
        }
        this.pausedEntIndexes.clear();
    }

    private onDuelApply(event: DuelApplyPayload): void {
        const playerId = event.PlayerID;
        if (this.matchEnded || !PlayerResource.IsValidPlayerID(playerId)) return;
        this.applicants.add(playerId);
    }

    private onDuelBet(event: DuelBetPayload): void {
        const bettorId = event.PlayerID;
        if (!this.active || !this.betsOpen) return;
        if (!PlayerResource.IsValidPlayerID(bettorId)) return;
        if (this.activeBets.has(bettorId)) return;

        const backedTarget = tonumber(event.backed_player_id);
        if (backedTarget === undefined) return;

        if (this.activeBossDuel) {
            if (PlayerResource.GetTeam(bettorId) === this.activeBossDuel.challengingTeam) return;
            if (backedTarget !== BOSS_DUEL_BET_TEAM && backedTarget !== BOSS_DUEL_BET_BOSS) return;
        } else if (this.currentPair) {
            if (bettorId === this.currentPair.playerA || bettorId === this.currentPair.playerB) return;
            if (backedTarget !== this.currentPair.playerA && backedTarget !== this.currentPair.playerB) return;
        } else {
            return;
        }

        const amount = Math.floor(tonumber(event.gold_amount) ?? 0);
        if (amount < 10) return;

        const currentGold = PlayerResource.GetGold(bettorId);
        if (currentGold < amount) return;

        PlayerResource.SpendGold(bettorId, amount, ModifyGoldReason.UNSPECIFIED);
        this.activeBets.set(bettorId, {
            bettorId,
            backedTarget,
            goldAmount: amount,
        });
    }

    private settleBets(winnerId: PlayerID | undefined): void {
        for (const bet of this.activeBets.values()) {
            if (!PlayerResource.IsValidPlayerID(bet.bettorId)) continue;
            if (winnerId === undefined) {
                PlayerResource.ModifyGold(bet.bettorId, bet.goldAmount, false, ModifyGoldReason.UNSPECIFIED);
            } else if (bet.backedTarget === winnerId) {
                const payout = Math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER);
                PlayerResource.ModifyGold(bet.bettorId, payout, false, ModifyGoldReason.UNSPECIFIED);
            }
        }
        this.activeBets.clear();
    }

    private settleBossDuelBets(teamWon: boolean): void {
        const winningSide = teamWon ? BOSS_DUEL_BET_TEAM : BOSS_DUEL_BET_BOSS;
        for (const bet of this.activeBets.values()) {
            if (!PlayerResource.IsValidPlayerID(bet.bettorId)) continue;
            if (bet.backedTarget === winningSide) {
                const payout = Math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER);
                PlayerResource.ModifyGold(bet.bettorId, payout, false, ModifyGoldReason.UNSPECIFIED);
            }
        }
        this.activeBets.clear();
    }

    private getTeamPlayerIds(team: DotaTeam): PlayerID[] {
        const result: PlayerID[] = [];
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const pid = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(pid)) continue;
            if (PlayerResource.GetTeam(pid) !== team) continue;
            const hero = PlayerResource.GetSelectedHeroEntity(pid);
            if (!hero || hero.IsNull() || !IsValidEntity(hero)) continue;
            result.push(pid);
        }
        return result;
    }

    private broadcastDuelEvent(eventName: "announced" | "started" | "finished", winnerId?: PlayerID): void {
        CustomGameEventManager.Send_ServerToAllClients(
            "evo_duel_event" as never,
            {
                event: eventName,
                winner_id: winnerId,
            } as never
        );
    }

    private syncDuelState(): void {
        const now = GameRules.GetDOTATime(false, false);
        const remaining = this.active
            ? Math.max(
                  0,
                  Math.ceil((this.activeBossDuel?.lootEndTime ?? this.duelEndTime) - now)
              )
            : 0;
        const nextIn = !this.active ? Math.max(0, Math.ceil(this.nextDuelTime - now)) : 0;

        const tiebreakerPayload: Record<string, number> = {};
        for (const [team, wins] of this.tiebreakerWins.entries()) {
            tiebreakerPayload[tostring(team)] = wins;
        }

        CustomNetTables.SetTableValue(
            "duel_state" as never,
            "state",
            {
                active: this.active,
                round_index: this.roundIndex,
                time_remaining: remaining,
                next_duel_in: nextIn,
                bets_open: this.betsOpen,
                is_tiebreaker: this.isTiebreaker,
                is_boss_duel: this.activeBossDuel !== undefined,
                boss_id: this.activeBossDuel?.bossId ?? "",
                challenging_team: this.activeBossDuel?.challengingTeam ?? -1,
                player_a: this.currentPair ? this.currentPair.playerA : -1,
                player_b: this.currentPair ? this.currentPair.playerB : -1,
                tiebreaker_scores: tiebreakerPayload,
            } as never
        );
    }

    private debugChat(message: string): void {
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(message, 0, 0);
        }
    }
}
