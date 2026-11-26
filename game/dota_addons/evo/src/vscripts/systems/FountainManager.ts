import { EventBus } from "../core/EventBus";
import { EVO_CONSTANTS, EVO_MAP_ENTITIES, EVO_PLAYABLE_TEAMS } from "../data/game_constants";
import { clearFountainCombatLock } from "../lib/fountain_combat_guard";
import { focusPlayerCamera } from "../lib/unit_helpers";

interface FountainTeleportPayload {
    PlayerID: PlayerID;
}

const PARTICLE_BLINK_START = "particles/items_fx/blink_dagger_start.vpcf";
const PARTICLE_BLINK_END = "particles/items_fx/blink_dagger_end.vpcf";

export class FountainManager {
    private basePositions: Vector[] = [];
    private baseDirections: Vector[] = [];
    private allFountainPositions: Vector[] = [];
    private teleportTargets: Vector[] = [];

    private readonly playerBaseIndex: Map<PlayerID, number> = new Map();
    private readonly baseCounts: [number, number] = [0, 0];
    private readonly initialSpawnDone: Set<PlayerID> = new Set();
    private readonly pendingRespawn: Set<PlayerID> = new Set();
    private readonly lastTeleportTime: Map<PlayerID, number> = new Map();

    private started = false;
    private matchEnded = false;
    private lastSyncedSignature = "";

    constructor(
        private readonly eventBus: EventBus,
        private readonly isActiveDuelist: (unit: CBaseEntity) => boolean
    ) {}

    public init(): void {
        this.initFountains();
        this.discoverTeleportTargets();

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("npc_spawned", (event) => this.onNpcSpawned(event), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        CustomGameEventManager.RegisterListener("evo_fountain_teleport", (_, event) => {
            this.onTeleportRequest(event as unknown as FountainTeleportPayload);
        });

        this.eventBus.on("match_ended", () => {
            this.matchEnded = true;
            this.syncFountainHudState(true);
        });

        this.eventBus.on("dev_command", ({ playerId, command }) => {
            if (command === "-evo_tp") {
                this.teleportFromFountain(playerId, true);
            }
        });
    }

    private onGameStateChange(): void {
        const state = GameRules.State_Get();
        if (state === GameState.PRE_GAME || state === GameState.GAME_IN_PROGRESS) {
            if (this.basePositions.length === 0) {
                this.initFountains();
                this.discoverTeleportTargets();
            }
            this.assignAllPlayersToBases();
        }
        if (state === GameState.GAME_IN_PROGRESS && !this.started) {
            this.started = true;
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoFountainHudThink",
                () => this.onThink(),
                0.25
            );
        }
    }

    private onThink(): number | undefined {
        if (this.matchEnded) return undefined;
        this.syncFountainHudState(false);
        return 0.25;
    }

    private initFountains(): void {
        const fountains: CDOTA_BaseNPC[] = [];
        for (const ent of Entities.FindAllByClassname("ent_dota_fountain")) {
            if (!ent || ent.IsNull() || !IsValidEntity(ent) || !ent.IsBaseNPC()) continue;
            ent.SetAttackCapability(UnitAttackCapability.NO_ATTACK);
            ent.SetTeam(DotaTeam.NOTEAM);

            const atkAbility = ent.FindAbilityByName("fountain_attack_lua");
            if (atkAbility && !atkAbility.IsNull()) {
                ent.RemoveAbilityByHandle(atkAbility);
            }
            ent.RemoveModifierByName("modifier_fountain_attack_lua");
            ent.RemoveModifierByName("modifier_fountain_aura");
            ent.AddNewModifier(ent, undefined, "modifier_fountain_aura_lua", {});
            fountains.push(ent);
        }

        this.allFountainPositions = fountains.map((f) => f.GetAbsOrigin());
        const chosen = this.selectTwoBaseFountains(fountains);
        this.basePositions = chosen.map((f) => f.GetAbsOrigin());

        const mapCenter = this.computeCentroid(this.basePositions);
        this.baseDirections = this.basePositions.map((pos) => {
            const dx = mapCenter.x - pos.x;
            const dy = mapCenter.y - pos.y;
            const len = Math.sqrt(dx * dx + dy * dy);
            if (len < 1) return Vector(1, 0, 0);
            return Vector(dx / len, dy / len, 0);
        });
    }

    private selectTwoBaseFountains(fountains: readonly CDOTA_BaseNPC[]): CDOTA_BaseNPC[] {
        if (fountains.length <= 2) return [...fountains];
        let bestA = fountains[0];
        let bestB = fountains[1];
        let maxDistSq = -1;
        for (let i = 0; i < fountains.length; i++) {
            const a = fountains[i].GetAbsOrigin();
            for (let j = i + 1; j < fountains.length; j++) {
                const b = fountains[j].GetAbsOrigin();
                const dx = a.x - b.x;
                const dy = a.y - b.y;
                const dSq = dx * dx + dy * dy;
                if (dSq > maxDistSq) {
                    maxDistSq = dSq;
                    bestA = fountains[i];
                    bestB = fountains[j];
                }
            }
        }
        return [bestA, bestB];
    }

    private discoverTeleportTargets(): void {
        this.teleportTargets = [];
        const duelEnt =
            Entities.FindByName(undefined, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) ??
            Entities.FindByName(undefined, "duel_1") ??
            Entities.FindByName(undefined, "duel_trigger");
        const duelCenter =
            duelEnt && !duelEnt.IsNull() && IsValidEntity(duelEnt) ? duelEnt.GetAbsOrigin() : undefined;

        for (const trigger of Entities.FindAllByClassname("trigger_multiple")) {
            if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) continue;
            if (!trigger.GetName().startsWith("neutralcamp_")) continue;
            const pos = GetGroundPosition(trigger.GetAbsOrigin(), undefined);
            if (this.isSafeTeleportPoint(pos, duelCenter)) {
                this.teleportTargets.push(pos);
            }
        }

        for (const ent of Entities.FindAllByName("dota_rune_spawner_*")) {
            if (!ent || ent.IsNull() || !IsValidEntity(ent)) continue;
            const pos = GetGroundPosition(ent.GetAbsOrigin(), undefined);
            if (this.isSafeTeleportPoint(pos, duelCenter)) {
                this.teleportTargets.push(pos);
            }
        }

        if (this.teleportTargets.length === 0) {
            const centroid = this.computeCentroid(this.allFountainPositions);
            for (let i = 0; i < 8; i++) {
                const angle = (i / 8) * Math.PI * 2;
                const probe = GetGroundPosition(
                    Vector(centroid.x + Math.cos(angle) * 900, centroid.y + Math.sin(angle) * 900, centroid.z),
                    undefined
                );
                if (this.isSafeTeleportPoint(probe, duelCenter)) {
                    this.teleportTargets.push(probe);
                }
            }
        }
    }

    private isSafeTeleportPoint(pos: Vector, duelCenter: Vector | undefined): boolean {
        if (!GridNav.IsTraversable(pos) || GridNav.IsBlocked(pos)) return false;
        for (const fPos of this.allFountainPositions) {
            const dx = pos.x - fPos.x;
            const dy = pos.y - fPos.y;
            if (dx * dx + dy * dy < 1400 * 1400) return false;
        }
        if (duelCenter !== undefined) {
            const dx = pos.x - duelCenter.x;
            const dy = pos.y - duelCenter.y;
            if (dx * dx + dy * dy < 900 * 900) return false;
        }
        return true;
    }

    private assignAllPlayersToBases(): void {
        if (this.basePositions.length === 0) return;

        const unassigned: PlayerID[] = [];
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const pid = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(pid)) continue;
            if (!EVO_PLAYABLE_TEAMS.includes(PlayerResource.GetTeam(pid))) continue;
            if (!this.playerBaseIndex.has(pid)) {
                unassigned.push(pid);
            }
        }

        for (let i = unassigned.length - 1; i > 0; i--) {
            const j = RandomInt(0, i);
            const tmp = unassigned[i];
            unassigned[i] = unassigned[j];
            unassigned[j] = tmp;
        }

        for (const pid of unassigned) {
            this.assignPlayerBase(pid);
        }
    }

    private assignPlayerBase(playerId: PlayerID): number {
        const existing = this.playerBaseIndex.get(playerId);
        if (existing !== undefined) return existing;

        if (this.basePositions.length <= 1) {
            this.playerBaseIndex.set(playerId, 0);
            this.baseCounts[0] += 1;
            return 0;
        }

        let chosen = 0;
        if (this.baseCounts[0] < this.baseCounts[1]) {
            chosen = 0;
        } else if (this.baseCounts[1] < this.baseCounts[0]) {
            chosen = 1;
        } else {
            chosen = RandomInt(0, 1);
        }

        this.playerBaseIndex.set(playerId, chosen);
        this.baseCounts[chosen] += 1;
        return chosen;
    }

    private getHomeSpawnPosition(playerId: PlayerID): Vector {
        if (this.basePositions.length === 0) {
            return Vector(0, 0, 128);
        }
        const baseIdx = this.assignPlayerBase(playerId);
        const fountainPos = this.basePositions[baseIdx] ?? this.basePositions[0];
        const dir = this.baseDirections[baseIdx] ?? Vector(1, 0, 0);
        const angle = RandomFloat(0, Math.PI * 2);
        const raw = Vector(
            fountainPos.x + dir.x * 180 + Math.cos(angle) * 90,
            fountainPos.y + dir.y * 180 + Math.sin(angle) * 90,
            fountainPos.z
        );
        return GetGroundPosition(raw, undefined);
    }

    private onNpcSpawned(event: GameEventProvidedProperties & NpcSpawnedEvent): void {
        const unit = EntIndexToHScript(event.entindex);
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsBaseNPC()) return;
        if (!unit.IsRealHero()) return;

        const playerId = unit.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        if (!EVO_PLAYABLE_TEAMS.includes(PlayerResource.GetTeam(playerId))) return;

        const hero = unit as CDOTA_BaseNPC_Hero;
        const homePos = this.getHomeSpawnPosition(playerId);
        hero.SetRespawnPosition(homePos);

        const isInitial = !this.initialSpawnDone.has(playerId);
        const isDeathRespawn = this.pendingRespawn.delete(playerId);
        if (isInitial || isDeathRespawn) {
            this.initialSpawnDone.add(playerId);
            FindClearSpaceForUnit(hero, homePos, true);
            hero.Stop();
            this.focusCameraBriefly(playerId, hero);
        }

        this.syncFountainHudState(false);
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const victim = EntIndexToHScript(event.entindex_killed);
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) return;
        if (!victim.IsRealHero() || victim.IsReincarnating()) return;
        if (this.isActiveDuelist(victim)) return;

        const playerId = victim.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;
        clearFountainCombatLock(playerId);
        this.pendingRespawn.add(playerId);
        this.syncFountainHudState(false);
    }

    private onTeleportRequest(event: FountainTeleportPayload): void {
        this.teleportFromFountain(event.PlayerID, false);
    }

    private teleportFromFountain(playerId: PlayerID, bypassFountainCheck: boolean): void {
        if (this.matchEnded || !PlayerResource.IsValidPlayerID(playerId)) return;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;
        if (this.isActiveDuelist(hero)) return;
        if (!bypassFountainCheck && !hero.HasModifier("modifier_fountain_buff_lua")) return;

        const now = GameRules.GetDOTATime(false, false);
        const lastTp = this.lastTeleportTime.get(playerId) ?? -999;
        if (!bypassFountainCheck && now - lastTp < EVO_CONSTANTS.FOUNTAIN_TELEPORT_COOLDOWN) return;

        const targetPos = this.pickRandomSafeDestination(hero.GetTeamNumber());
        this.lastTeleportTime.set(playerId, now);

        const startPfx = ParticleManager.CreateParticle(
            PARTICLE_BLINK_START,
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(startPfx, 0, hero.GetAbsOrigin());
        ParticleManager.ReleaseParticleIndex(startPfx);

        hero.RemoveModifierByName("modifier_fountain_buff_lua");
        FindClearSpaceForUnit(hero, targetPos, true);
        hero.Stop();

        const endPfx = ParticleManager.CreateParticle(
            PARTICLE_BLINK_END,
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(endPfx, 0, hero.GetAbsOrigin());
        ParticleManager.ReleaseParticleIndex(endPfx);

        this.focusCameraBriefly(playerId, hero);
        this.syncFountainHudState(true);
    }

    private pickRandomSafeDestination(myTeam: DotaTeam): Vector {
        if (this.teleportTargets.length === 0) {
            return Vector(0, 0, 128);
        }

        const enemyPositions: Vector[] = [];
        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const pid = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(pid)) continue;
            if (PlayerResource.GetTeam(pid) === myTeam) continue;
            const enemy = PlayerResource.GetSelectedHeroEntity(pid);
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            enemyPositions.push(enemy.GetAbsOrigin());
        }

        const minEnemyDistSq = 850 * 850;
        const safe = this.teleportTargets.filter((spot) => {
            for (const ePos of enemyPositions) {
                const dx = spot.x - ePos.x;
                const dy = spot.y - ePos.y;
                if (dx * dx + dy * dy < minEnemyDistSq) return false;
            }
            return true;
        });

        const pool = safe.length > 0 ? safe : this.teleportTargets;
        return pool[RandomInt(0, pool.length - 1)];
    }

    private focusCameraBriefly(playerId: PlayerID, hero: CDOTA_BaseNPC_Hero): void {
        focusPlayerCamera(playerId, hero, hero.GetAbsOrigin());
    }

    private computeCentroid(points: readonly Vector[]): Vector {
        if (points.length === 0) return Vector(0, 0, 128);
        let sx = 0;
        let sy = 0;
        let sz = 0;
        for (const p of points) {
            sx += p.x;
            sy += p.y;
            sz += p.z;
        }
        return Vector(sx / points.length, sy / points.length, sz / points.length);
    }

    private syncFountainHudState(force: boolean): void {
        const payload: Record<string, { on_fountain: boolean; base_index: number }> = {};
        const sigParts: string[] = [];

        for (let i = 0; i < DOTA_MAX_TEAM_PLAYERS; i++) {
            const pid = i as PlayerID;
            if (!PlayerResource.IsValidPlayerID(pid)) continue;
            const hero = PlayerResource.GetSelectedHeroEntity(pid);
            const onFountain =
                !this.matchEnded &&
                hero !== undefined &&
                !hero.IsNull() &&
                IsValidEntity(hero) &&
                hero.IsAlive() &&
                hero.HasModifier("modifier_fountain_buff_lua");
            const baseIdx = this.playerBaseIndex.get(pid) ?? 0;
            payload[tostring(pid)] = {
                on_fountain: onFountain,
                base_index: baseIdx,
            };
            sigParts.push(`${pid}:${onFountain ? 1 : 0}:${baseIdx}`);
        }

        const sig = sigParts.join(";");
        if (!force && sig === this.lastSyncedSignature) return;
        this.lastSyncedSignature = sig;

        CustomNetTables.SetTableValue("match_state" as never, "fountains", payload as never);
    }
}
