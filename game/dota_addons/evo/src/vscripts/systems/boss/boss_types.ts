import { BossDefinition, BossItemStep } from "../../data/bosses_catalog";
import { EVO_CONSTANTS, EVO_MAP_ENTITIES } from "../../data/game_constants";

export interface PatrolWaypoint {
    position: Vector;
    campSize: string;
}

export interface ActiveBossRuntime {
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

export const BOSS_TEAM = DotaTeam.CUSTOM_5;
export const BOSS_AI_TICK_SECONDS = 0.5;
export const BOSS_PASSIVE_XP_PER_SEC = 10;
export const BOSS_PASSIVE_GOLD_PER_SEC = 12;
export const BOSS_CREEP_XP_MULTIPLIER = 1.25;
export const BOSS_HERO_KILL_XP = 600;
export const BOSS_HERO_KILL_GOLD = 350;

export const DEFAULT_FARM_MANA_RESERVE = 0.45;
export const RETREAT_HP_THRESHOLD = 0.35;
export const RECOVER_HP_THRESHOLD = 0.7;
export const HEAL_POTION_HP_THRESHOLD = 0.65;
export const HEAL_POTION_COST = 100;
export const COMBINED_POTION_COST = 350;
export const HEAL_POTION_BUY_COOLDOWN = 16;

export const IGNORED_BOSS_ABILITIES: ReadonlySet<string> = new Set([
    "generic_hidden",
    "ability_capture",
    "ability_lamp_use",
    "twin_gate_portal_warp",
    "abyssal_underlord_portal_warp",
    "ability_pluck_famango",
]);

const PLAYER_TEAMS: readonly DotaTeam[] = [
    DotaTeam.GOODGUYS,
    DotaTeam.BADGUYS,
    DotaTeam.CUSTOM_1,
    DotaTeam.CUSTOM_2,
    DotaTeam.CUSTOM_3,
    DotaTeam.CUSTOM_4,
];

export function distance2D(a: Vector, b: Vector): number {
    const dx = a.x - b.x;
    const dy = a.y - b.y;
    return Math.sqrt(dx * dx + dy * dy);
}

export function computeBossScale(def: BossDefinition, level: number): number {
    const denom = Math.max(1, EVO_CONSTANTS.BOSS_MAX_LEVEL - 1);
    const t = Math.min(1, Math.max(0, (level - 1) / denom));
    return def.modelScaleMin + (def.modelScaleMax - def.modelScaleMin) * t;
}

export function getBossRequiredXp(level: number): number {
    if (level <= 1) return 0;
    const n = level - 1;
    return Math.floor(n * 280 + n * n * 4.5);
}

export function isNearAnyFountain(
    pos: Vector,
    fountainPositions: readonly Vector[],
    radius: number = 1600
): boolean {
    for (const fPos of fountainPositions) {
        if (distance2D(pos, fPos) <= radius) {
            return true;
        }
    }
    return false;
}

export function isHeroProtectedByFountain(
    hero: CDOTA_BaseNPC,
    fountainPositions: readonly Vector[]
): boolean {
    if (hero.HasModifier("modifier_fountain_buff_lua") || hero.HasModifier("modifier_fountain_aura_buff")) {
        return true;
    }
    return isNearAnyFountain(hero.GetAbsOrigin(), fountainPositions, 1600);
}

export function revealBossOnMinimap(origin: Vector): void {
    for (const team of PLAYER_TEAMS) {
        AddFOWViewer(team, origin, 220, BOSS_AI_TICK_SECONDS + 0.15, false);
    }
}

export function discoverBossMapPositions(): {
    fountainPositions: Vector[];
    bossSpawnPoints: Vector[];
    patrolWaypoints: PatrolWaypoint[];
} {
    const fountainPositions: Vector[] = [];
    const bossSpawnPoints: Vector[] = [];
    const patrolWaypoints: PatrolWaypoint[] = [];

    for (const fountain of Entities.FindAllByClassname("ent_dota_fountain")) {
        if (fountain && !fountain.IsNull() && IsValidEntity(fountain)) {
            fountainPositions.push(fountain.GetAbsOrigin());
        }
    }

    for (const ent of Entities.FindAllByName(`${EVO_MAP_ENTITIES.BOSS_SPAWN_PREFIX}*`)) {
        if (ent && !ent.IsNull() && IsValidEntity(ent)) {
            bossSpawnPoints.push(ent.GetAbsOrigin());
        }
    }

    for (const trigger of Entities.FindAllByClassname("trigger_multiple")) {
        if (!trigger || trigger.IsNull() || !IsValidEntity(trigger)) continue;
        const name = trigger.GetName();
        if (name.startsWith("neutralcamp_")) {
            const parts = name.split("_");
            const campSize = parts[1] ?? "small";
            patrolWaypoints.push({
                position: trigger.GetAbsOrigin(),
                campSize,
            });
        }
    }

    if (patrolWaypoints.length === 0) {
        patrolWaypoints.push(
            { position: Vector(-2500, 2500, 128), campSize: "small" },
            { position: Vector(2500, 2500, 128), campSize: "small" },
            { position: Vector(-2500, -2500, 128), campSize: "medium" },
            { position: Vector(2500, -2500, 128), campSize: "medium" }
        );
    }

    if (bossSpawnPoints.length < 4) {
        for (const wp of patrolWaypoints) {
            if (!isNearAnyFountain(wp.position, fountainPositions, 1600)) {
                bossSpawnPoints.push(wp.position);
            }
        }
    }
    if (bossSpawnPoints.length === 0) {
        bossSpawnPoints.push(Vector(-1800, 1800, 128), Vector(1800, -1800, 128));
    }

    return { fountainPositions, bossSpawnPoints, patrolWaypoints };
}
