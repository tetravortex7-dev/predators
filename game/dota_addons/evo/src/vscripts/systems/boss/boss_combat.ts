import {
    tryCastDefensiveItem,
    tryCastFarmAbilities,
    tryCastHeroCombatKit,
    tryUseMobilityItem,
} from "./boss_abilities";
import { consumeRuneForBoss, tryMaintainBossHealth } from "./boss_progression";
import { isCampSizeAllowedAtTime } from "../../data/game_constants";
import {
    ActiveBossRuntime,
    BOSS_TEAM,
    BossSpawnPoint,
    PatrolWaypoint,
    RECOVER_HP_THRESHOLD,
    RETREAT_HP_THRESHOLD,
    distance2D,
    isHeroProtectedByFountain,
    isNearAnyFountain,
} from "./boss_types";

export function pickSmartWaypoint(
    currentPos: Vector,
    matchTime: number,
    patrolWaypoints: readonly PatrolWaypoint[]
): Vector {
    const preferred = patrolWaypoints.filter((w) => isCampSizeAllowedAtTime(w.campSize, matchTime));
    const pool = preferred.length > 0 ? preferred : patrolWaypoints;

    if (pool.length === 1) {
        return pool[0].position;
    }

    let best = pool[RandomInt(0, pool.length - 1)].position;
    for (let attempt = 0; attempt < 6; attempt++) {
        const candidate = pool[RandomInt(0, pool.length - 1)].position;
        const dist = distance2D(currentPos, candidate);
        if (dist >= 900 && dist <= 4500) {
            best = candidate;
            break;
        }
    }
    return best;
}

function pickRetreatPosition(
    currentPos: Vector,
    matchTime: number,
    bossSpawnPoints: readonly BossSpawnPoint[],
    patrolWaypoints: readonly PatrolWaypoint[]
): Vector {
    const allowedWaypoints = patrolWaypoints.filter((wp) => isCampSizeAllowedAtTime(wp.campSize, matchTime));
    const waypointPool = allowedWaypoints.length > 0 ? allowedWaypoints : patrolWaypoints;
    const allowedSpawns = bossSpawnPoints.filter(
        (sp) => sp.campSize === undefined || isCampSizeAllowedAtTime(sp.campSize, matchTime)
    );
    const fallbackSpawn = (allowedSpawns[0] ?? bossSpawnPoints[0])?.position ?? Vector(0, 0, 128);

    let best = fallbackSpawn;
    let bestDist = -1;
    for (const wp of waypointPool) {
        const dist = distance2D(currentPos, wp.position);
        if (dist >= 1200 && dist <= 2600 && dist > bestDist) {
            bestDist = dist;
            best = wp.position;
        }
    }
    return best;
}

export function pickRandomBossSpawnOrigin(
    runtime: ActiveBossRuntime,
    bossSpawnPoints: readonly BossSpawnPoint[],
    fountainPositions: readonly Vector[]
): Vector {
    const now = GameRules.GetDOTATime(false, false);
    const timeAllowed = bossSpawnPoints.filter(
        (pt) => pt.campSize === undefined || isCampSizeAllowedAtTime(pt.campSize, now)
    );
    const unlockedPool = timeAllowed.length > 0 ? timeAllowed : bossSpawnPoints;
    const safePool = unlockedPool.filter((pt) => !isNearAnyFountain(pt.position, fountainPositions, 1600));
    const basePool = safePool.length > 0 ? safePool : unlockedPool;
    if (basePool.length === 0) {
        return Vector(0, 0, 128);
    }

    const nonRepeat = runtime.lastSpawnPosition
        ? basePool.filter((pt) => distance2D(pt.position, runtime.lastSpawnPosition!) > 400)
        : basePool;
    const candidates = nonRepeat.length > 0 ? nonRepeat : basePool;

    const awayFromHeroes = candidates.filter((pt) => {
        const nearby = FindUnitsInRadius(
            BOSS_TEAM,
            pt.position,
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
    const chosen = finalPool[RandomInt(0, finalPool.length - 1)].position;
    runtime.lastSpawnPosition = chosen;
    return chosen;
}

function selectPriorityHeroTarget(
    origin: Vector,
    unit: CDOTA_BaseNPC,
    heroes: CDOTA_BaseNPC[]
): CDOTA_BaseNPC | undefined {
    if (heroes.length === 0) return undefined;

    let best: CDOTA_BaseNPC | undefined;
    let bestScore = -999999;
    for (const hero of heroes) {
        const dist = distance2D(origin, hero.GetAbsOrigin());
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

function selectPriorityCreepTarget(origin: Vector, creeps: CDOTA_BaseNPC[]): CDOTA_BaseNPC | undefined {
    if (creeps.length === 0) return undefined;

    let best = creeps[0];
    let bestScore = -999999;
    for (const creep of creeps) {
        const dist = distance2D(origin, creep.GetAbsOrigin());
        const finishBonus = creep.GetHealthPercent() <= 35 ? 250 : 0;
        const score = finishBonus - dist;
        if (score > bestScore) {
            bestScore = score;
            best = creep;
        }
    }
    return best;
}

function findNearbyRune(origin: Vector, radius: number): CBaseEntity | undefined {
    const runes = Entities.FindAllByClassnameWithin("dota_item_rune", origin, radius) as CBaseEntity[];
    let closest: CBaseEntity | undefined;
    let closestDist = radius + 1;
    for (const ent of runes) {
        if (!ent || ent.IsNull() || !IsValidEntity(ent)) continue;
        const dist = distance2D(origin, ent.GetAbsOrigin());
        if (dist < closestDist) {
            closestDist = dist;
            closest = ent;
        }
    }
    return closest;
}

function issueAttackMoveOrder(unit: CDOTA_BaseNPC, position: Vector): void {
    ExecuteOrderFromTable({
        UnitIndex: unit.entindex(),
        OrderType: UnitOrder.ATTACK_MOVE,
        Position: position,
        Queue: false,
    });
}

export function tickBossRoamingAI(
    runtime: ActiveBossRuntime,
    unit: CDOTA_BaseNPC,
    now: number,
    fountainPositions: readonly Vector[],
    bossSpawnPoints: readonly BossSpawnPoint[],
    patrolWaypoints: readonly PatrolWaypoint[]
): void {
    if (unit.IsChanneling() || unit.IsStunned() || unit.IsHexed()) return;

    const activeAbility = unit.GetCurrentActiveAbility();
    if (activeAbility && !activeAbility.IsNull() && activeAbility.IsInAbilityPhase()) {
        return;
    }

    const origin = unit.GetAbsOrigin();
    const hpRatio = unit.GetHealthPercent() / 100;
    const attackRange = unit.Script_GetAttackRange();

    tryMaintainBossHealth(runtime, unit, hpRatio, now);

    if (isNearAnyFountain(origin, fountainPositions, 1450)) {
        const safeWaypoint = pickSmartWaypoint(origin, now, patrolWaypoints);
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
            runtime.retreatPosition = pickRetreatPosition(origin, now, bossSpawnPoints, patrolWaypoints);
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
            !isHeroProtectedByFountain(h, fountainPositions)
    );

    if (runtime.retreating) {
        const threat = nearbyHeroes[0];
        if (threat && unit.CanEntityBeSeenByMyTeam(threat)) {
            const dist = distance2D(origin, threat.GetAbsOrigin());
            if (!unit.IsSilenced() && dist <= 650) {
                if (tryCastDefensiveItem(unit, nearbyHeroes.length, dist)) {
                    return;
                }
            }
        }

        if (!runtime.retreatPosition || distance2D(origin, runtime.retreatPosition) <= 220) {
            runtime.retreatPosition = pickRetreatPosition(origin, now, bossSpawnPoints, patrolWaypoints);
            runtime.lastMoveOrderTime = -999;
        }

        if (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.5) {
            runtime.lastMoveOrderTime = now;
            runtime.lastAttackTargetIndex = undefined;
            tryUseMobilityItem(unit);
            ExecuteOrderFromTable({
                UnitIndex: unit.entindex(),
                OrderType: UnitOrder.MOVE_TO_POSITION,
                Position: runtime.retreatPosition,
                Queue: false,
            });
        }
        return;
    }

    const targetHero = selectPriorityHeroTarget(origin, unit, nearbyHeroes);
    if (targetHero) {
        const canSee = unit.CanEntityBeSeenByMyTeam(targetHero);
        const heroPos = targetHero.GetAbsOrigin();
        const dist = distance2D(origin, heroPos);

        if (canSee) {
            if (!unit.IsSilenced() && !unit.IsAttacking() && dist <= 900) {
                if (tryCastHeroCombatKit(unit, runtime.definition, targetHero, nearbyHeroes.length, runtime.inCourage)) {
                    runtime.lastMoveOrderTime = now;
                    return;
                }
            }
            if (dist > attackRange + 120) {
                tryUseMobilityItem(unit);
            }
            if (!unit.IsAttacking() && (dist > attackRange + 80 || !unit.IsMoving())) {
                if (now - runtime.lastMoveOrderTime >= 1.2 || !unit.IsMoving()) {
                    runtime.lastMoveOrderTime = now;
                    issueAttackMoveOrder(unit, heroPos);
                }
            }
        } else if (!unit.IsAttacking() && (!unit.IsMoving() || now - runtime.lastMoveOrderTime >= 1.5)) {
            runtime.lastMoveOrderTime = now;
            tryUseMobilityItem(unit);
            issueAttackMoveOrder(unit, heroPos);
        }
        return;
    }

    const nearbyRune = findNearbyRune(origin, 650);
    if (nearbyRune) {
        const runeDist = distance2D(origin, nearbyRune.GetAbsOrigin());
        if (runeDist <= 140) {
            consumeRuneForBoss(runtime, unit, nearbyRune);
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

    const targetCreep = selectPriorityCreepTarget(origin, nearbyCreeps);
    if (targetCreep) {
        const creepPos = targetCreep.GetAbsOrigin();
        const dist = distance2D(origin, creepPos);
        if (!unit.IsSilenced() && !unit.IsAttacking() && dist <= 420) {
            if (tryCastFarmAbilities(unit, runtime.definition, targetCreep, nearbyCreeps)) {
                runtime.lastMoveOrderTime = now;
                return;
            }
        }
        if (!unit.IsAttacking() && !unit.IsMoving()) {
            runtime.lastMoveOrderTime = now;
            issueAttackMoveOrder(unit, creepPos);
        }
        return;
    }

    if (!runtime.targetWaypoint || distance2D(origin, runtime.targetWaypoint) <= 280) {
        runtime.targetWaypoint = pickSmartWaypoint(origin, now, patrolWaypoints);
        runtime.lastMoveOrderTime = -999;
    }

    if (!unit.IsAttacking() && !unit.IsMoving()) {
        runtime.lastMoveOrderTime = now;
        tryUseMobilityItem(unit);
        issueAttackMoveOrder(unit, runtime.targetWaypoint);
    }
}
