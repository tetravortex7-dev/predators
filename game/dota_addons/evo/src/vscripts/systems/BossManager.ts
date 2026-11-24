import { EventBus } from "../core/EventBus";
import {
    BossAbilityRule,
    BossDefinition,
    BossItemStep,
    EVO_BOSSES_CATALOG,
    getBossDefinition,
} from "../data/bosses_catalog";
import { EVO_CONSTANTS, EVO_MAP_ENTITIES, EVO_XP_PER_LEVEL_TABLE } from "../data/game_constants";
import { HeroAppearance, HeroAppearancePreset } from "../lib/HeroAppearance";

interface PatrolWaypoint {
    position: Vector;
    campSize: string;
}

interface ActiveBossRuntime {
    definition: BossDefinition;
    unit?: CDOTA_BaseNPC;
    entIndex?: EntityIndex;
    level: number;
    xp: number;
    gold: number;
    itemBuild: readonly BossItemStep[];
    nextItemIndex: number;
    lastHealBuyTime: number;
    spawnTime: number;
    respawnAtTime?: number;
    lastSpawnPosition?: Vector;
    inCourage: boolean;
    retreating: boolean;
    retreatPosition?: Vector;
    targetWaypoint?: Vector;
    lastMoveOrderTime: number;
    lastAttackTargetIndex?: EntityIndex;
    lastAttackOrderTime: number;
}

const BOSS_TEAM = DotaTeam.CUSTOM_5;
const BOSS_AI_TICK_SECONDS = 0.5;
const BOSS_PASSIVE_XP_PER_SEC = 10;
const BOSS_PASSIVE_GOLD_PER_SEC = 12;
const BOSS_CREEP_XP_MULTIPLIER = 1.25;
const BOSS_HERO_KILL_XP = 600;
const BOSS_HERO_KILL_GOLD = 350;

const DEFAULT_FARM_MANA_RESERVE = 0.45;
const RETREAT_HP_THRESHOLD = 0.35;
const RECOVER_HP_THRESHOLD = 0.7;
const HEAL_POTION_HP_THRESHOLD = 0.65;
const HEAL_POTION_COST = 100;
const COMBINED_POTION_COST = 350;
const HEAL_POTION_BUY_COOLDOWN = 16;

const IGNORED_BOSS_ABILITIES: ReadonlySet<string> = new Set([
    "generic_hidden",
    "ability_capture",
    "ability_lamp_use",
    "twin_gate_portal_warp",
    "abyssal_underlord_portal_warp",
    "ability_pluck_famango",
]);

export class BossManager {
    private readonly bosses: Map<string, ActiveBossRuntime> = new Map();
    private readonly entIndexToBossId: Map<EntityIndex, string> = new Map();
    private patrolWaypoints: PatrolWaypoint[] = [];
    private bossSpawnPoints: Vector[] = [];
    private fountainPositions: Vector[] = [];
    private activeBossIds: string[] = [];
    private thinkerStarted = false;
    private devSpawned = false;

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        this.discoverWaypoints();

        ListenToGameEvent("game_rules_state_change", () => this.onGameStateChange(), undefined);
        ListenToGameEvent("entity_killed", (event) => this.onEntityKilled(event), undefined);

        this.eventBus.on("boss_event", ({ bossId, event }) => {
            if (event === "announced" && !this.activeBossIds.includes(bossId)) {
                this.activeBossIds.push(bossId);
            }
        });

        this.eventBus.on("phase_changed", ({ newPhase }) => {
            if (newPhase === "SURFACE") {
                this.spawnMatchBosses();
            }
        });

        this.eventBus.on("dev_command", ({ command, args }) => {
            if (command === "-evo_boss") {
                this.onDevBossCommand(args);
            }
        });
    }

    private onGameStateChange(): void {
        if (GameRules.State_Get() === GameState.GAME_IN_PROGRESS && IsInToolsMode() && !this.devSpawned) {
            this.devSpawned = true;
            this.spawnMatchBosses();
        }
    }

    public getStrongestAliveBoss(): { bossId: string; unit: CDOTA_BaseNPC; level: number } | undefined {
        let best: { bossId: string; unit: CDOTA_BaseNPC; level: number } | undefined;
        for (const runtime of this.bosses.values()) {
            const unit = runtime.unit;
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) continue;
            if (!best || runtime.level > best.level) {
                best = { bossId: runtime.definition.id, unit, level: runtime.level };
            }
        }
        return best;
    }

    public prepareBossForArena(bossId: string, spawnPos: Vector, lookTarget: Vector): Vector | undefined {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return undefined;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return undefined;

        const returnPos = unit.GetAbsOrigin();
        runtime.retreating = false;
        runtime.retreatPosition = undefined;

        unit.RemoveModifierByName("modifier_evo_world_pause");
        unit.Purge(false, true, false, true, true);
        unit.SetHealth(unit.GetMaxHealth());
        unit.SetMana(unit.GetMaxMana());

        for (let i = 0; i < unit.GetAbilityCount(); i++) {
            const ability = unit.GetAbilityByIndex(i);
            if (ability && !ability.IsNull()) {
                ability.EndCooldown();
            }
        }
        for (let slot = 0; slot < 9; slot++) {
            const item = unit.GetItemInSlot(slot);
            if (item && !item.IsNull()) {
                item.EndCooldown();
            }
        }

        FindClearSpaceForUnit(unit, spawnPos, true);
        unit.Stop();
        const dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0).Normalized();
        unit.SetForwardVector(dir);
        return returnPos;
    }

    public returnBossFromArena(bossId: string, returnPos: Vector, bossWon: boolean): void {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return;

        FindClearSpaceForUnit(unit, returnPos, true);
        unit.Stop();

        if (bossWon) {
            this.grantBossProgress(
                runtime,
                EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_XP,
                EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_GOLD
            );
            this.triggerCourage(runtime);
        }
    }

    public spawnMatchBosses(): void {
        const idsToSpawn =
            this.activeBossIds.length > 0
                ? this.activeBossIds
                : EVO_BOSSES_CATALOG.slice(0, EVO_CONSTANTS.BOSS_COUNT_PER_MATCH).map((b) => b.id);

        for (let i = 0; i < idsToSpawn.length; i++) {
            const bossId = idsToSpawn[i];
            const def = getBossDefinition(bossId);
            if (!def) continue;

            let runtime = this.bosses.get(bossId);
            if (!runtime) {
                const builds = def.itemBuilds;
                const chosenBuild =
                    builds.length > 0 ? builds[RandomInt(0, builds.length - 1)] : [];
                runtime = {
                    definition: def,
                    level: 1,
                    xp: 0,
                    gold: 0,
                    itemBuild: chosenBuild,
                    nextItemIndex: 0,
                    lastHealBuyTime: -999,
                    spawnTime: GameRules.GetDOTATime(false, false),
                    inCourage: false,
                    retreating: false,
                    lastMoveOrderTime: -999,
                    lastAttackOrderTime: -999,
                };
                this.bosses.set(bossId, runtime);
            }

            if (!runtime.unit || runtime.unit.IsNull() || !IsValidEntity(runtime.unit) || !runtime.unit.IsAlive()) {
                this.spawnBossUnit(runtime, i);
            }
        }

        if (!this.thinkerStarted) {
            this.thinkerStarted = true;
            GameRules.GetGameModeEntity().SetContextThink(
                "EvoBossManagerThink",
                () => this.onThink(),
                BOSS_AI_TICK_SECONDS
            );
        }
    }

    private discoverWaypoints(): void {
        for (const fountain of Entities.FindAllByClassname("ent_dota_fountain")) {
            if (fountain && !fountain.IsNull() && IsValidEntity(fountain)) {
                this.fountainPositions.push(fountain.GetAbsOrigin());
            }
        }

        for (const ent of Entities.FindAllByName(`${EVO_MAP_ENTITIES.BOSS_SPAWN_PREFIX}*`)) {
            if (ent && !ent.IsNull() && IsValidEntity(ent)) {
                this.bossSpawnPoints.push(ent.GetAbsOrigin());
            }
        }

        for (const trigger of Entities.FindAllByClassname("trigger_multiple")) {
            if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) continue;
            const name = trigger.GetName();
            if (name.startsWith("neutralcamp_")) {
                const parts = name.split("_");
                const campSize = parts[1] ?? "small";
                this.patrolWaypoints.push({
                    position: trigger.GetAbsOrigin(),
                    campSize,
                });
            }
        }

        if (this.patrolWaypoints.length === 0) {
            this.patrolWaypoints.push(
                { position: Vector(-2500, 2500, 128), campSize: "small" },
                { position: Vector(2500, 2500, 128), campSize: "small" },
                { position: Vector(-2500, -2500, 128), campSize: "medium" },
                { position: Vector(2500, -2500, 128), campSize: "medium" }
            );
        }

        if (this.bossSpawnPoints.length < 4) {
            for (const wp of this.patrolWaypoints) {
                if (!this.isNearAnyFountain(wp.position, 1600)) {
                    this.bossSpawnPoints.push(wp.position);
                }
            }
        }
        if (this.bossSpawnPoints.length === 0) {
            this.bossSpawnPoints.push(Vector(-1800, 1800, 128), Vector(1800, -1800, 128));
        }
    }

    private pickRandomBossSpawnOrigin(runtime: ActiveBossRuntime): Vector {
        const safePool = this.bossSpawnPoints.filter((pos) => !this.isNearAnyFountain(pos, 1600));
        const basePool = safePool.length > 0 ? safePool : this.bossSpawnPoints;
        if (basePool.length === 0) {
            return Vector(0, 0, 128);
        }

        const nonRepeat = runtime.lastSpawnPosition
            ? basePool.filter((pos) => this.distance2D(pos, runtime.lastSpawnPosition!) > 400)
            : basePool;
        const candidates = nonRepeat.length > 0 ? nonRepeat : basePool;

        const awayFromHeroes = candidates.filter((pos) => {
            const nearby = FindUnitsInRadius(
                BOSS_TEAM,
                pos,
                undefined,
                1100,
                UnitTargetTeam.ENEMY,
                UnitTargetType.HERO,
                UnitTargetFlags.NONE,
                FindOrder.ANY,
                false
            );
            return nearby.length === 0;
        });

        const finalPool = awayFromHeroes.length > 0 ? awayFromHeroes : candidates;
        const chosen = finalPool[RandomInt(0, finalPool.length - 1)];
        runtime.lastSpawnPosition = chosen;
        return chosen;
    }

    private spawnBossUnit(runtime: ActiveBossRuntime, _slotIndex: number): void {
        const spawnOrigin = this.pickRandomBossSpawnOrigin(runtime);
        const now = GameRules.GetDOTATime(false, false);

        if (
            runtime.unit &&
            !runtime.unit.IsNull() &&
            IsValidEntity(runtime.unit) &&
            runtime.unit.IsHero()
        ) {
            const existingHero = runtime.unit;
            existingHero.RespawnHero(false, false);
            FindClearSpaceForUnit(existingHero, spawnOrigin, true);
            this.finalizeSpawnedBoss(runtime, existingHero, now, false);
            return;
        }

        CreateUnitByNameAsync(
            runtime.definition.unitName,
            spawnOrigin,
            true,
            undefined,
            undefined,
            BOSS_TEAM,
            (unit) => {
                if (!unit || unit.IsNull() || !IsValidEntity(unit)) return;
                this.finalizeSpawnedBoss(runtime, unit, now, true);
            }
        );
    }

    public setBossWearables(bossId: string, preset: HeroAppearancePreset): boolean {
        const runtime = this.bosses.get(bossId);
        if (!runtime) return false;
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit)) return false;
        const scale = this.computeBossScale(runtime.definition, runtime.level);
        HeroAppearance.applyPreset(unit, { ...preset, scale });
        return true;
    }

    private computeBossScale(def: BossDefinition, level: number): number {
        const denom = Math.max(1, EVO_CONSTANTS.BOSS_MAX_LEVEL - 1);
        const t = Math.min(1, Math.max(0, (level - 1) / denom));
        return def.modelScaleMin + (def.modelScaleMax - def.modelScaleMin) * t;
    }

    private getBossRequiredXp(level: number): number {
        if (level <= 1) return 0;
        const n = level - 1;
        return Math.floor(n * 280 + n * n * 4.5);
    }

    private finalizeSpawnedBoss(
        runtime: ActiveBossRuntime,
        unit: CDOTA_BaseNPC,
        now: number,
        isFreshSpawn: boolean
    ): void {
        runtime.unit = unit;
        runtime.entIndex = unit.entindex();
        runtime.spawnTime = now;
        runtime.respawnAtTime = undefined;
        runtime.retreating = false;
        runtime.retreatPosition = undefined;
        runtime.lastMoveOrderTime = -999;
        runtime.lastAttackTargetIndex = undefined;
        runtime.lastAttackOrderTime = -999;
        runtime.targetWaypoint = this.pickSmartWaypoint(unit.GetAbsOrigin(), runtime.level);
        this.entIndexToBossId.set(unit.entindex(), runtime.definition.id);

        const targetScale = this.computeBossScale(runtime.definition, runtime.level);
        if (runtime.definition.appearance) {
            HeroAppearance.applyPreset(unit, {
                ...runtime.definition.appearance,
                scale: targetScale,
            });
        } else {
            unit.SetModelScale(targetScale);
        }

        if (unit.IsHero()) {
            while (unit.GetLevel() < runtime.level) {
                unit.HeroLevelUp(false);
            }
            this.upgradeBossHeroAbilities(unit, runtime.definition);
        } else if (unit.IsCreature()) {
            const delta = runtime.level - unit.GetLevel();
            if (delta > 0) {
                unit.CreatureLevelUp(delta);
            }
            this.syncBossAbilitiesLevel(unit, runtime.level);
        }

        if (isFreshSpawn) {
            this.equipPurchasedItems(unit, runtime);
        }

        if (runtime.inCourage) {
            unit.AddNewModifier(unit, undefined, "modifier_evo_boss_courage", {});
        }

        this.eventBus.emit("boss_event", {
            bossId: runtime.definition.id,
            level: runtime.level,
            event: "spawned",
        });
        CustomGameEventManager.Send_ServerToAllClients(
            "evo_boss_announcement" as never,
            {
                boss_id: runtime.definition.id,
                level: runtime.level,
                event: "spawned",
            } as never
        );
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] Third-Party Boss spawned: ${runtime.definition.id} (Lv.${runtime.level})`,
                0,
                0
            );
        }
    }

    private isNearAnyFountain(pos: Vector, radius: number = 1600): boolean {
        for (const fPos of this.fountainPositions) {
            if (this.distance2D(pos, fPos) <= radius) {
                return true;
            }
        }
        return false;
    }

    private revealBossOnMinimap(origin: Vector): void {
        const playerTeams: DotaTeam[] = [
            DotaTeam.GOODGUYS,
            DotaTeam.BADGUYS,
            DotaTeam.CUSTOM_1,
            DotaTeam.CUSTOM_2,
            DotaTeam.CUSTOM_3,
            DotaTeam.CUSTOM_4,
        ];
        for (const team of playerTeams) {
            AddFOWViewer(team, origin, 220, BOSS_AI_TICK_SECONDS + 0.15, false);
        }
    }

    private isHeroProtectedByFountain(hero: CDOTA_BaseNPC): boolean {
        if (hero.HasModifier("modifier_fountain_buff_lua") || hero.HasModifier("modifier_fountain_aura_buff")) {
            return true;
        }
        return this.isNearAnyFountain(hero.GetAbsOrigin(), 1600);
    }

    private onThink(): number {
        const now = GameRules.GetDOTATime(false, false);

        let slot = 0;
        for (const runtime of this.bosses.values()) {
            const unit = runtime.unit;
            if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) {
                if (runtime.respawnAtTime !== undefined && now >= runtime.respawnAtTime) {
                    this.spawnBossUnit(runtime, slot);
                }
                slot += 1;
                continue;
            }

            this.grantBossProgress(
                runtime,
                BOSS_PASSIVE_XP_PER_SEC * BOSS_AI_TICK_SECONDS,
                BOSS_PASSIVE_GOLD_PER_SEC * BOSS_AI_TICK_SECONDS
            );

            if (!runtime.inCourage && now - runtime.spawnTime >= EVO_CONSTANTS.BOSS_COURAGE_TIME_SECONDS) {
                this.triggerCourage(runtime);
            }

            this.revealBossOnMinimap(unit.GetAbsOrigin());
            this.tickBossRoamingAI(runtime, unit, now);
            slot += 1;
        }

        return BOSS_AI_TICK_SECONDS;
    }

    private grantBossProgress(runtime: ActiveBossRuntime, xpDelta: number, goldDelta: number): void {
        const unit = runtime.unit;
        if (!unit || unit.IsNull() || !IsValidEntity(unit) || !unit.IsAlive()) return;

        runtime.xp += xpDelta;
        runtime.gold += goldDelta;

        if (unit.IsHero()) {
            const nativeLevel = unit.GetLevel();
            if (nativeLevel > runtime.level) {
                runtime.level = nativeLevel;
            }
        }

        let leveledUp = false;
        while (runtime.level < EVO_CONSTANTS.BOSS_MAX_LEVEL) {
            const nextLevel = runtime.level + 1;
            const requiredXp = this.getBossRequiredXp(nextLevel);
            if (runtime.xp < requiredXp) break;

            runtime.level = nextLevel;
            leveledUp = true;
            if (unit.IsHero()) {
                while (unit.GetLevel() < runtime.level) {
                    unit.HeroLevelUp(false);
                }
            } else if (unit.IsCreature()) {
                unit.CreatureLevelUp(1);
            }
        }

        if (leveledUp) {
            unit.SetModelScale(this.computeBossScale(runtime.definition, runtime.level));
        }

        if (unit.IsHero()) {
            if (unit.GetAbilityPoints() > 0) {
                this.upgradeBossHeroAbilities(unit, runtime.definition);
            }
        } else {
            this.syncBossAbilitiesLevel(unit, runtime.level);
        }

        while (runtime.nextItemIndex < runtime.itemBuild.length) {
            const nextStep = runtime.itemBuild[runtime.nextItemIndex];
            if (runtime.gold < nextStep.goldCost) break;

            runtime.gold -= nextStep.goldCost;
            runtime.nextItemIndex += 1;
            unit.AddItemByName(nextStep.itemName);
            if (IsInToolsMode()) {
                GameRules.SendCustomMessage(
                    `[Evo] ${runtime.definition.id} (Lv.${runtime.level}) bought ${nextStep.itemName}`,
                    0,
                    0
                );
            }
        }
    }

    private upgradeBossHeroAbilities(hero: CDOTA_BaseNPC_Hero, definition: BossDefinition): void {
        const skipped = new Set<string>();
        let safety = 40;
        while (hero.GetAbilityPoints() > 0 && safety > 0) {
            safety -= 1;
            const pointsBefore = hero.GetAbilityPoints();
            const chosen = this.pickNextAbilityToUpgrade(hero, definition, skipped);
            if (!chosen) break;

            hero.UpgradeAbility(chosen);
            if (hero.GetAbilityPoints() >= pointsBefore) {
                skipped.add(chosen.GetAbilityName());
            }
        }
    }

    private pickNextAbilityToUpgrade(
        hero: CDOTA_BaseNPC_Hero,
        definition: BossDefinition,
        skipped: ReadonlySet<string>
    ): CDOTABaseAbility | undefined {
        const abilityCount = hero.GetAbilityCount();

        for (let i = 0; i < abilityCount; i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (!this.canUpgradeBossAbility(hero, ability, skipped)) continue;
            if (ability.GetAbilityType() === AbilityTypes.ULTIMATE) {
                return ability;
            }
        }

        for (const preferredName of definition.abilityUpgradeOrder) {
            const ability = hero.FindAbilityByName(preferredName);
            if (this.canUpgradeBossAbility(hero, ability, skipped) && ability.GetLevel() === 0) {
                return ability;
            }
        }

        for (const preferredName of definition.abilityUpgradeOrder) {
            const ability = hero.FindAbilityByName(preferredName);
            if (this.canUpgradeBossAbility(hero, ability, skipped)) {
                return ability;
            }
        }

        for (let i = 0; i < abilityCount; i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (!this.canUpgradeBossAbility(hero, ability, skipped)) continue;
            const name = ability.GetAbilityName();
            if (name.startsWith("special_bonus_") || ability.IsAttributeBonus()) continue;
            return ability;
        }

        for (let i = 0; i < abilityCount; i++) {
            const ability = hero.GetAbilityByIndex(i);
            if (!this.canUpgradeBossAbility(hero, ability, skipped)) continue;
            if (ability.GetAbilityName().startsWith("special_bonus_")) {
                return ability;
            }
        }

        return undefined;
    }

    private canUpgradeBossAbility(
        hero: CDOTA_BaseNPC_Hero,
        ability: CDOTABaseAbility | undefined,
        skipped: ReadonlySet<string>
    ): ability is CDOTABaseAbility {
        if (!ability || ability.IsNull()) return false;
        const name = ability.GetAbilityName();
        if (skipped.has(name) || IGNORED_BOSS_ABILITIES.has(name)) return false;
        if (ability.IsHidden()) return false;
        if (ability.GetLevel() >= ability.GetMaxLevel()) return false;
        if (hero.GetLevel() < ability.GetHeroLevelRequiredToUpgrade()) return false;
        const learnResult = ability.CanAbilityBeUpgraded() as unknown;
        if (learnResult === false || (typeof learnResult === "number" && learnResult !== 0)) {
            return false;
        }
        return true;
    }

    private triggerCourage(runtime: ActiveBossRuntime): void {
        if (runtime.inCourage) return;
        runtime.inCourage = true;
        runtime.retreating = false;

        const unit = runtime.unit;
        if (unit && !unit.IsNull() && IsValidEntity(unit) && unit.IsAlive()) {
            unit.AddNewModifier(unit, undefined, "modifier_evo_boss_courage", {});
        }

        this.eventBus.emit("boss_event", {
            bossId: runtime.definition.id,
            level: runtime.level,
            event: "courage",
        });
        CustomGameEventManager.Send_ServerToAllClients(
            "evo_boss_announcement" as never,
            {
                boss_id: runtime.definition.id,
                level: runtime.level,
                event: "courage",
            } as never
        );
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] ${runtime.definition.id} entered COURAGE mode!`,
                0,
                0
            );
        }
    }

    private tickBossRoamingAI(runtime: ActiveBossRuntime, unit: CDOTA_BaseNPC, now: number): void {
        if (unit.IsChanneling() || unit.IsStunned() || unit.IsHexed()) return;

        const activeAbility = unit.GetCurrentActiveAbility();
        if (activeAbility && !activeAbility.IsNull() && activeAbility.IsInAbilityPhase()) {
            return;
        }

        const origin = unit.GetAbsOrigin();
        const hpRatio = unit.GetHealthPercent() / 100;
        const attackRange = unit.Script_GetAttackRange();

        this.tryMaintainBossHealth(runtime, unit, hpRatio, now);

        if (this.isNearAnyFountain(origin, 1450)) {
            const safeWaypoint = this.pickSmartWaypoint(origin, runtime.level);
            runtime.targetWaypoint = safeWaypoint;
            if (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.0) {
                runtime.lastMoveOrderTime = now;
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.MOVE_TO_POSITION,
                    Position: safeWaypoint,
                    Queue: false,
                });
            }
            return;
        }

        if (!runtime.inCourage) {
            if (!runtime.retreating && hpRatio <= RETREAT_HP_THRESHOLD) {
                runtime.retreating = true;
                runtime.retreatPosition = this.pickRetreatPosition(origin);
                runtime.lastMoveOrderTime = -999;
            } else if (runtime.retreating && hpRatio >= RECOVER_HP_THRESHOLD) {
                runtime.retreating = false;
                runtime.retreatPosition = undefined;
                runtime.lastMoveOrderTime = -999;
            }
        }

        const heroSearchRadius = runtime.inCourage ? FIND_UNITS_EVERYWHERE : 800;
        const nearbyHeroes = FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            undefined,
            heroSearchRadius,
            UnitTargetTeam.ENEMY,
            UnitTargetType.HERO,
            UnitTargetFlags.NO_INVIS,
            FindOrder.CLOSEST,
            false
        ).filter(
            (h) =>
                h &&
                !h.IsNull() &&
                IsValidEntity(h) &&
                h.IsAlive() &&
                !this.isHeroProtectedByFountain(h)
        );

        if (runtime.retreating) {
            const threat = nearbyHeroes[0];
            if (threat && unit.CanEntityBeSeenByMyTeam(threat)) {
                const dist = this.distance2D(origin, threat.GetAbsOrigin());
                if (!unit.IsSilenced() && dist <= 650) {
                    if (this.tryCastDefensiveItem(unit, nearbyHeroes.length, dist)) {
                        return;
                    }
                }
            }

            if (!runtime.retreatPosition || this.distance2D(origin, runtime.retreatPosition) <= 220) {
                runtime.retreatPosition = this.pickRetreatPosition(origin);
                runtime.lastMoveOrderTime = -999;
            }

            if (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.5) {
                runtime.lastMoveOrderTime = now;
                runtime.lastAttackTargetIndex = undefined;
                this.tryUseMobilityItem(unit);
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.MOVE_TO_POSITION,
                    Position: runtime.retreatPosition,
                    Queue: false,
                });
            }
            return;
        }

        const targetHero = this.selectPriorityHeroTarget(origin, unit, nearbyHeroes);
        if (targetHero) {
            const canSee = unit.CanEntityBeSeenByMyTeam(targetHero);
            const heroPos = targetHero.GetAbsOrigin();
            const dist = this.distance2D(origin, heroPos);

            if (canSee) {
                if (!unit.IsSilenced() && !unit.IsAttacking() && dist <= 900) {
                    if (
                        this.tryCastHeroCombatKit(
                            unit,
                            runtime.definition,
                            targetHero,
                            nearbyHeroes.length,
                            runtime.inCourage
                        )
                    ) {
                        runtime.lastMoveOrderTime = now;
                        return;
                    }
                }

                if (dist > attackRange + 120) {
                    this.tryUseMobilityItem(unit);
                }

                if (!unit.IsAttacking() && (dist > attackRange + 80 || !unit.IsMoving())) {
                    if (now - runtime.lastMoveOrderTime >= 1.2 || !unit.IsMoving()) {
                        runtime.lastMoveOrderTime = now;
                        ExecuteOrderFromTable({
                            UnitIndex: unit.entindex(),
                            OrderType: UnitOrder.ATTACK_MOVE,
                            Position: heroPos,
                            Queue: false,
                        });
                    }
                }
            } else if (!unit.IsAttacking() && (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.5)) {
                runtime.lastMoveOrderTime = now;
                this.tryUseMobilityItem(unit);
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.ATTACK_MOVE,
                    Position: heroPos,
                    Queue: false,
                });
            }
            return;
        }

        const nearbyRune = this.findNearbyRune(origin, 650);
        if (nearbyRune) {
            const runeDist = this.distance2D(origin, nearbyRune.GetAbsOrigin());
            if (runeDist <= 140) {
                this.consumeRuneForBoss(runtime, unit, nearbyRune);
                return;
            }
            if (!unit.IsAttacking() && (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.2)) {
                runtime.lastMoveOrderTime = now;
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.PICKUP_RUNE,
                    TargetIndex: nearbyRune.entindex(),
                    Queue: false,
                });
            }
            return;
        }

        const nearbyCreeps = FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            undefined,
            750,
            UnitTargetTeam.ENEMY,
            UnitTargetType.BASIC,
            UnitTargetFlags.FOW_VISIBLE,
            FindOrder.CLOSEST,
            false
        ).filter((c) => c && !c.IsNull() && IsValidEntity(c) && c.IsAlive());

        const targetCreep = this.selectPriorityCreepTarget(origin, nearbyCreeps);
        if (targetCreep) {
            const creepPos = targetCreep.GetAbsOrigin();
            const dist = this.distance2D(origin, creepPos);
            if (!unit.IsSilenced() && !unit.IsAttacking() && dist <= 420) {
                if (this.tryCastFarmAbilities(unit, runtime.definition, targetCreep, nearbyCreeps)) {
                    runtime.lastMoveOrderTime = now;
                    return;
                }
            }

            if (!unit.IsAttacking() && !unit.IsMoving()) {
                runtime.lastMoveOrderTime = now;
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.ATTACK_MOVE,
                    Position: creepPos,
                    Queue: false,
                });
            }
            return;
        }

        if (!runtime.targetWaypoint || this.distance2D(origin, runtime.targetWaypoint) <= 280) {
            runtime.targetWaypoint = this.pickSmartWaypoint(origin, runtime.level);
            runtime.lastMoveOrderTime = -999;
        }

        if (!unit.IsAttacking() && !unit.IsMoving()) {
            runtime.lastMoveOrderTime = now;
            this.tryUseMobilityItem(unit);
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.ATTACK_MOVE,
                Position: runtime.targetWaypoint,
                Queue: false,
            });
        }
    }

    private selectPriorityHeroTarget(
        origin: Vector,
        unit: CDOTA_BaseNPC,
        heroes: CDOTA_BaseNPC[]
    ): CDOTA_BaseNPC | undefined {
        if (heroes.length === 0) return undefined;

        let best: CDOTA_BaseNPC | undefined;
        let bestScore = -999999;
        for (const hero of heroes) {
            const dist = this.distance2D(origin, hero.GetAbsOrigin());
            const visibleBonus = unit.CanEntityBeSeenByMyTeam(hero) ? 400 : 0;
            const lowHpBonus = (100 - hero.GetHealthPercent()) * 6;
            const score = visibleBonus + lowHpBonus - dist * 0.5;
            if (score > bestScore) {
                bestScore = score;
                best = hero;
            }
        }
        return best;
    }

    private selectPriorityCreepTarget(origin: Vector, creeps: CDOTA_BaseNPC[]): CDOTA_BaseNPC | undefined {
        if (creeps.length === 0) return undefined;

        let best = creeps[0];
        let bestScore = -999999;
        for (const creep of creeps) {
            const dist = this.distance2D(origin, creep.GetAbsOrigin());
            const finishBonus = creep.GetHealthPercent() <= 35 ? 250 : 0;
            const score = finishBonus - dist;
            if (score > bestScore) {
                bestScore = score;
                best = creep;
            }
        }
        return best;
    }

    private tryUseMobilityItem(unit: CDOTA_BaseNPC): void {
        const phase = unit.FindItemInInventory("item_phase_boots");
        if (phase && phase.IsFullyCastable()) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_NO_TARGET,
                AbilityIndex: phase.entindex(),
                Queue: false,
            });
        }
    }

    private tryCastDefensiveItem(unit: CDOTA_BaseNPC, enemyHeroCount: number, dist: number): boolean {
        const hpRatio = unit.GetHealthPercent() / 100;

        if (hpRatio <= 0.85 || enemyHeroCount >= 2) {
            const bkb = unit.FindItemInInventory("item_black_king_bar");
            if (bkb && bkb.IsFullyCastable() && dist <= 700) {
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.CAST_NO_TARGET,
                    AbilityIndex: bkb.entindex(),
                    Queue: false,
                });
                return true;
            }
        }

        if (hpRatio <= 0.9 && dist <= 550) {
            const bladeMail = unit.FindItemInInventory("item_blade_mail");
            if (bladeMail && bladeMail.IsFullyCastable()) {
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.CAST_NO_TARGET,
                    AbilityIndex: bladeMail.entindex(),
                    Queue: false,
                });
                return true;
            }
        }

        if (dist <= 750) {
            const shiva = unit.FindItemInInventory("item_shivas_guard");
            if (shiva && shiva.IsFullyCastable()) {
                ExecuteOrderFromTable({
                    UnitIndex: unit.entindex(),
                    OrderType: UnitOrder.CAST_NO_TARGET,
                    AbilityIndex: shiva.entindex(),
                    Queue: false,
                });
                return true;
            }
        }

        return false;
    }

    private tryCastHeroCombatKit(
        unit: CDOTA_BaseNPC,
        definition: BossDefinition,
        target: CDOTA_BaseNPC,
        nearbyHeroCount: number,
        inCourage: boolean
    ): boolean {
        const dist = this.distance2D(unit.GetAbsOrigin(), target.GetAbsOrigin());

        const abyssal = unit.FindItemInInventory("item_abyssal_blade");
        if (abyssal && abyssal.IsFullyCastable() && dist <= 300) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_TARGET,
                TargetIndex: target.entindex(),
                AbilityIndex: abyssal.entindex(),
                Queue: false,
            });
            return true;
        }

        if (this.tryCastDefensiveItem(unit, nearbyHeroCount, dist)) {
            return true;
        }

        return this.tryCastBossHeroAbilities(unit, definition, target, nearbyHeroCount, inCourage);
    }

    private tryCastBossHeroAbilities(
        unit: CDOTA_BaseNPC,
        definition: BossDefinition,
        target: CDOTA_BaseNPC,
        nearbyHeroCount: number,
        inCourage: boolean
    ): boolean {
        const origin = unit.GetAbsOrigin();
        const dist = this.distance2D(origin, target.GetAbsOrigin());
        const hpRatio = unit.GetHealthPercent() / 100;

        for (let i = 0; i < unit.GetAbilityCount(); i++) {
            const ability = unit.GetAbilityByIndex(i);
            if (!this.isCastableCombatAbility(ability)) continue;

            const name = ability.GetAbilityName();
            const rule = this.findAbilityRule(definition, name);
            const isUltimate =
                ability.GetAbilityType() === AbilityTypes.ULTIMATE || rule?.usage === "ULTIMATE_COMBAT";

            if (isUltimate) {
                const worthUltimate =
                    inCourage ||
                    nearbyHeroCount >= 2 ||
                    hpRatio <= 0.75 ||
                    target.GetHealthPercent() <= 70;
                if (!worthUltimate) continue;
            }

            if (this.castAbilityAtTarget(unit, ability, target, dist, rule?.maxCastDistance)) {
                return true;
            }
        }

        return false;
    }

    private tryCastFarmAbilities(
        unit: CDOTA_BaseNPC,
        definition: BossDefinition,
        targetCreep: CDOTA_BaseNPC,
        nearbyCreeps: CDOTA_BaseNPC[]
    ): boolean {
        const origin = unit.GetAbsOrigin();
        const dist = this.distance2D(origin, targetCreep.GetAbsOrigin());
        const maxMana = Math.max(1, unit.GetMaxMana());
        const currentMana = unit.GetMana();
        const reservedUltMana = this.getReadyUltimateManaCost(unit);

        for (const rule of definition.abilityRules) {
            if (rule.usage !== "FARM_AND_HERO") continue;

            const ability = unit.FindAbilityByName(rule.abilityName);
            if (!this.isCastableCombatAbility(ability)) continue;

            const manaCost = ability.GetManaCost(ability.GetLevel() - 1);
            const manaAfterCast = currentMana - manaCost;
            const minReserveRatio = rule.minManaRatioForFarm ?? DEFAULT_FARM_MANA_RESERVE;

            if (manaAfterCast / maxMana < minReserveRatio) continue;
            if (reservedUltMana > 0 && manaAfterCast < reservedUltMana) continue;

            const closeCreeps = nearbyCreeps.filter(
                (c) => this.distance2D(origin, c.GetAbsOrigin()) <= (rule.maxCastDistance ?? 380)
            );
            const minTargets = rule.minFarmTargets ?? 2;
            if (closeCreeps.length < minTargets) continue;

            let fullHpCount = 0;
            let totalHpPct = 0;
            for (const c of closeCreeps) {
                const hpPct = c.GetHealthPercent();
                totalHpPct += hpPct;
                if (hpPct >= 85) {
                    fullHpCount += 1;
                }
            }
            const avgHpPct = totalHpPct / closeCreeps.length;
            if (fullHpCount < minTargets || avgHpPct < 80) continue;

            if (this.castAbilityAtTarget(unit, ability, targetCreep, dist, rule.maxCastDistance)) {
                return true;
            }
        }

        return false;
    }

    private getReadyUltimateManaCost(unit: CDOTA_BaseNPC): number {
        for (let i = 0; i < unit.GetAbilityCount(); i++) {
            const ability = unit.GetAbilityByIndex(i);
            if (!ability || ability.IsNull() || ability.GetLevel() <= 0) continue;
            if (ability.GetAbilityType() !== AbilityTypes.ULTIMATE) continue;
            if (ability.GetCooldownTimeRemaining() <= 10) {
                return ability.GetManaCost(ability.GetLevel() - 1);
            }
        }
        return 0;
    }

    private isCastableCombatAbility(ability: CDOTABaseAbility | undefined): ability is CDOTABaseAbility {
        if (!ability || ability.IsNull() || ability.GetLevel() <= 0) return false;
        const name = ability.GetAbilityName();
        if (IGNORED_BOSS_ABILITIES.has(name) || name.startsWith("special_bonus_")) return false;
        if (ability.IsHidden() || ability.IsPassive() || ability.IsToggle() || ability.IsAttributeBonus()) {
            return false;
        }
        return ability.IsFullyCastable();
    }

    private findAbilityRule(definition: BossDefinition, abilityName: string): BossAbilityRule | undefined {
        for (const rule of definition.abilityRules) {
            if (rule.abilityName === abilityName) {
                return rule;
            }
        }
        return undefined;
    }

    private castAbilityAtTarget(
        unit: CDOTA_BaseNPC,
        ability: CDOTABaseAbility,
        target: CDOTA_BaseNPC,
        dist: number,
        customMaxDistance?: number
    ): boolean {
        const origin = unit.GetAbsOrigin();
        const behavior = ability.GetBehaviorInt();

        if ((behavior & AbilityBehavior.NO_TARGET) !== 0) {
            const isUltimate = ability.GetAbilityType() === AbilityTypes.ULTIMATE;
            const maxRange = customMaxDistance ?? (isUltimate ? 800 : 380);
            if (dist > maxRange) return false;
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_NO_TARGET,
                AbilityIndex: ability.entindex(),
                Queue: false,
            });
            return true;
        }

        if ((behavior & AbilityBehavior.UNIT_TARGET) !== 0) {
            const castRange = customMaxDistance ?? Math.max(300, ability.GetCastRange(origin, target));
            if (dist > castRange) return false;
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_TARGET,
                TargetIndex: target.entindex(),
                AbilityIndex: ability.entindex(),
                Queue: false,
            });
            return true;
        }

        if ((behavior & AbilityBehavior.POINT) !== 0) {
            const castRange = customMaxDistance ?? Math.max(300, ability.GetCastRange(origin, target));
            if (dist > castRange) return false;
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_POSITION,
                Position: target.GetAbsOrigin(),
                AbilityIndex: ability.entindex(),
                Queue: false,
            });
            return true;
        }

        return false;
    }

    private onEntityKilled(event: GameEventProvidedProperties & EntityKilledEvent): void {
        const killedIndex = event.entindex_killed;
        const killerIndex = event.entindex_attacker;

        if (killerIndex !== undefined) {
            const killerBossId = this.entIndexToBossId.get(killerIndex);
            if (killerBossId !== undefined) {
                const killerBoss = this.bosses.get(killerBossId);
                const victim = EntIndexToHScript(killedIndex);
                if (killerBoss && victim && !victim.IsNull() && IsValidEntity(victim) && victim.IsBaseNPC()) {
                    if (victim.IsRealHero()) {
                        this.grantBossProgress(killerBoss, BOSS_HERO_KILL_XP, BOSS_HERO_KILL_GOLD);
                    } else {
                        const creepXp = Math.max(15, Math.floor(victim.GetDeathXP() * BOSS_CREEP_XP_MULTIPLIER));
                        const creepGold = Math.max(15, victim.GetGoldBounty());
                        this.grantBossProgress(killerBoss, creepXp, creepGold);
                    }
                }
            }
        }

        const deadBossId = this.entIndexToBossId.get(killedIndex);
        if (deadBossId === undefined) return;
        this.entIndexToBossId.delete(killedIndex);

        const runtime = this.bosses.get(deadBossId);
        if (!runtime) return;

        const deadUnit = EntIndexToHScript(killedIndex);
        const dropOrigin =
            deadUnit && !deadUnit.IsNull() && IsValidEntity(deadUnit)
                ? deadUnit.GetAbsOrigin()
                : Vector(0, 0, 128);

        this.dropBossCore(runtime.definition, dropOrigin);

        let killerTeam: DotaTeam | undefined;
        let killerPlayerId: PlayerID | undefined;
        if (killerIndex !== undefined) {
            const attacker = EntIndexToHScript(killerIndex);
            if (attacker && !attacker.IsNull() && IsValidEntity(attacker) && attacker.IsBaseNPC()) {
                killerTeam = attacker.GetTeamNumber();
                const ownerId = attacker.GetPlayerOwnerID();
                if (PlayerResource.IsValidPlayerID(ownerId)) {
                    killerPlayerId = ownerId;
                }
            }
        }

        if (!deadUnit || deadUnit.IsNull() || !IsValidEntity(deadUnit) || !deadUnit.IsBaseNPC() || !deadUnit.IsHero()) {
            runtime.unit = undefined;
        }
        runtime.entIndex = undefined;
        runtime.retreating = false;
        runtime.retreatPosition = undefined;
        runtime.respawnAtTime = GameRules.GetDOTATime(false, false) + EVO_CONSTANTS.BOSS_RESPAWN_SECONDS;

        this.eventBus.emit("boss_event", {
            bossId: runtime.definition.id,
            level: runtime.level,
            event: "killed",
            killerTeam,
            killerPlayerId,
        });
        CustomGameEventManager.Send_ServerToAllClients(
            "evo_boss_announcement" as never,
            {
                boss_id: runtime.definition.id,
                level: runtime.level,
                event: "killed",
            } as never
        );
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(
                `[Evo] Boss ${runtime.definition.id} slain! Aghanim's Shard dropped!`,
                0,
                0
            );
        }
    }

    private dropBossCore(_definition: BossDefinition, origin: Vector): void {
        const item = CreateItem("item_aghanims_shard_roshan", undefined, undefined);
        if (!item) return;

        item.SetPurchaseTime(0);
        CreateItemOnPositionSync(origin, item);
        const destination = Vector(
            origin.x + RandomFloat(-140, 140),
            origin.y + RandomFloat(-140, 140),
            origin.z
        );
        item.LaunchLoot(false, 280, 0.7, destination, undefined);
    }

    private syncBossAbilitiesLevel(unit: CDOTA_BaseNPC, bossLevel: number): void {
        const targetAbilityLevel = Math.min(15, Math.max(1, Math.floor((bossLevel - 1) / 10) + 1));
        for (let i = 0; i < unit.GetAbilityCount(); i++) {
            const ability = unit.GetAbilityByIndex(i);
            if (!ability || ability.IsNull()) continue;
            const capped = Math.min(ability.GetMaxLevel(), targetAbilityLevel);
            if (ability.GetLevel() < capped) {
                ability.SetLevel(capped);
            }
        }
    }

    private equipPurchasedItems(unit: CDOTA_BaseNPC, runtime: ActiveBossRuntime): void {
        for (let i = 0; i < runtime.nextItemIndex; i++) {
            const step = runtime.itemBuild[i];
            if (step !== undefined) {
                unit.AddItemByName(step.itemName);
            }
        }
    }

    private tryMaintainBossHealth(
        runtime: ActiveBossRuntime,
        unit: CDOTA_BaseNPC,
        hpRatio: number,
        now: number
    ): void {
        if (hpRatio > HEAL_POTION_HP_THRESHOLD) return;
        if (
            unit.HasModifier("modifier_heal_potion_active") ||
            unit.HasModifier("modifier_combined_potion_active") ||
            unit.HasModifier("modifier_flask_healing")
        ) {
            return;
        }

        const existing =
            unit.FindItemInInventory("item_combined_potion") ??
            unit.FindItemInInventory("item_heal_potion") ??
            unit.FindItemInInventory("item_flask");

        if (existing && !existing.IsNull() && existing.IsFullyCastable()) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_TARGET,
                TargetIndex: unit.entindex(),
                AbilityIndex: existing.entindex(),
                Queue: false,
            });
            return;
        }

        if (now - runtime.lastHealBuyTime < HEAL_POTION_BUY_COOLDOWN) return;
        if (!this.hasFreeInventorySlot(unit)) return;

        const maxMana = unit.GetMaxMana();
        const lowMana = maxMana > 0 && unit.GetMana() / maxMana < 0.55;
        let potionName: string | undefined;
        let potionCost = 0;

        if (lowMana && runtime.gold >= COMBINED_POTION_COST) {
            potionName = "item_combined_potion";
            potionCost = COMBINED_POTION_COST;
        } else if (runtime.gold >= HEAL_POTION_COST) {
            potionName = "item_heal_potion";
            potionCost = HEAL_POTION_COST;
        }

        if (!potionName) return;

        runtime.gold -= potionCost;
        runtime.lastHealBuyTime = now;
        const bought = unit.AddItemByName(potionName);
        if (bought && !bought.IsNull()) {
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.CAST_TARGET,
                TargetIndex: unit.entindex(),
                AbilityIndex: bought.entindex(),
                Queue: false,
            });
        }
    }

    private hasFreeInventorySlot(unit: CDOTA_BaseNPC): boolean {
        for (let slot = 0; slot < 6; slot++) {
            const item = unit.GetItemInSlot(slot);
            if (!item || item.IsNull()) return true;
        }
        return false;
    }

    private pickSmartWaypoint(currentPos: Vector, bossLevel: number): Vector {
        const allowedSizes = this.getAllowedCampSizes(bossLevel);
        const preferred = this.patrolWaypoints.filter((w) => allowedSizes.has(w.campSize));
        const pool = preferred.length > 0 ? preferred : this.patrolWaypoints;

        if (pool.length === 1) {
            return pool[0].position;
        }

        let best = pool[RandomInt(0, pool.length - 1)].position;
        for (let attempt = 0; attempt < 6; attempt++) {
            const candidate = pool[RandomInt(0, pool.length - 1)].position;
            const dist = this.distance2D(currentPos, candidate);
            if (dist >= 900 && dist <= 4500) {
                best = candidate;
                break;
            }
        }
        return best;
    }

    private pickRetreatPosition(currentPos: Vector): Vector {
        let best = this.bossSpawnPoints[0] ?? Vector(0, 0, 128);
        let bestDist = -1;
        for (const wp of this.patrolWaypoints) {
            const dist = this.distance2D(currentPos, wp.position);
            if (dist >= 1200 && dist <= 2600 && dist > bestDist) {
                bestDist = dist;
                best = wp.position;
            }
        }
        return best;
    }

    private getAllowedCampSizes(bossLevel: number): ReadonlySet<string> {
        if (bossLevel <= 15) {
            return new Set(["small", "medium"]);
        }
        if (bossLevel <= 40) {
            return new Set(["small", "medium", "hard"]);
        }
        return new Set(["small", "medium", "hard", "strong", "random"]);
    }

    private issueAttackOrderIfNeeded(
        runtime: ActiveBossRuntime,
        unit: CDOTA_BaseNPC,
        target: CDOTA_BaseNPC,
        now: number
    ): void {
        if (unit.IsAttacking()) {
            return;
        }
        const targetIndex = target.entindex();
        const currentAggro = unit.GetAggroTarget();
        if (
            currentAggro &&
            !currentAggro.IsNull() &&
            IsValidEntity(currentAggro) &&
            currentAggro.IsAlive() &&
            currentAggro.GetTeamNumber() !== BOSS_TEAM &&
            currentAggro.entindex() === targetIndex
        ) {
            return;
        }
        if (runtime.lastAttackTargetIndex === targetIndex && now - runtime.lastAttackOrderTime < 2.0) {
            return;
        }
        runtime.lastAttackTargetIndex = targetIndex;
        runtime.lastAttackOrderTime = now;
        ExecuteOrderFromTable({
            UnitIndex: unit.entindex(),
            OrderType: UnitOrder.ATTACK_TARGET,
            TargetIndex: targetIndex,
            Queue: false,
        });
    }

    private findNearbyRune(origin: Vector, radius: number): CBaseEntity | undefined {
        const runes = Entities.FindAllByClassnameWithin("dota_item_rune", origin, radius) as CBaseEntity[];
        let closest: CBaseEntity | undefined;
        let closestDist = radius + 1;
        for (const ent of runes) {
            if (!ent || ent.IsNull() || !IsValidEntity(ent)) continue;
            const dist = this.distance2D(origin, ent.GetAbsOrigin());
            if (dist < closestDist) {
                closestDist = dist;
                closest = ent;
            }
        }
        return closest;
    }

    private consumeRuneForBoss(
        runtime: ActiveBossRuntime,
        unit: CDOTA_BaseNPC,
        rune: CBaseEntity
    ): void {
        if (!rune || rune.IsNull() || !IsValidEntity(rune)) return;
        const runeApi = rune as unknown as { GetRuneType?: () => RuneType };
        const runeType = runeApi.GetRuneType !== undefined ? runeApi.GetRuneType() : RuneType.BOUNTY;

        if (runeType === RuneType.BOUNTY) {
            this.grantBossProgress(runtime, 200, 220);
        } else if (runeType === RuneType.DOUBLEDAMAGE) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_doubledamage", { duration: 45 });
        } else if (runeType === RuneType.HASTE) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_haste", { duration: 22 });
        } else if (runeType === RuneType.REGENERATION) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_regen", { duration: 30 });
        } else if (runeType === RuneType.ARCANE) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_arcane", { duration: 50 });
        } else if (runeType === RuneType.INVISIBILITY) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_invis", { duration: 45 });
        } else if (runeType === RuneType.SHIELD) {
            unit.AddNewModifier(unit, undefined, "modifier_rune_shield", { duration: 75 });
        } else {
            this.grantBossProgress(runtime, 150, 150);
        }

        unit.EmitSound("General.RunePickUp");
        UTIL_Remove(rune);
    }

    private distance2D(a: Vector, b: Vector): number {
        const dx = a.x - b.x;
        const dy = a.y - b.y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    private onDevBossCommand(args: string[]): void {
        const sub = (args[0] ?? "").toLowerCase();
        if (sub === "courage") {
            for (const runtime of this.bosses.values()) {
                this.triggerCourage(runtime);
            }
            return;
        }
        if (sub === "lvl") {
            const targetLvl = Math.min(EVO_CONSTANTS.BOSS_MAX_LEVEL, Math.max(1, tonumber(args[1]) ?? 50));
            const targetXp = this.getBossRequiredXp(targetLvl);
            for (const runtime of this.bosses.values()) {
                const neededXp = Math.max(0, targetXp - runtime.xp);
                this.grantBossProgress(runtime, neededXp, 5000);
            }
            return;
        }
        this.spawnMatchBosses();
    }
}
