local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 10,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 19,["24"] = 20,["25"] = 21,["27"] = 23,["28"] = 24,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 19,["38"] = 29,["39"] = 34,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 35,["44"] = 36,["45"] = 38,["46"] = 39,["48"] = 42,["50"] = 43,["51"] = 43,["52"] = 44,["53"] = 45,["54"] = 46,["55"] = 47,["58"] = 43,["61"] = 51,["62"] = 29,["63"] = 54,["64"] = 59,["65"] = 60,["66"] = 61,["67"] = 62,["68"] = 63,["69"] = 64,["70"] = 65,["73"] = 68,["74"] = 54,["75"] = 71,["76"] = 76,["77"] = 76,["78"] = 76,["79"] = 76,["80"] = 77,["81"] = 78,["82"] = 79,["84"] = 82,["85"] = 83,["86"] = 83,["87"] = 82,["88"] = 85,["89"] = 87,["90"] = 87,["91"] = 87,["92"] = 88,["93"] = 88,["94"] = 88,["95"] = 88,["96"] = 88,["97"] = 88,["98"] = 88,["99"] = 88,["100"] = 88,["101"] = 88,["102"] = 88,["103"] = 99,["104"] = 87,["105"] = 87,["106"] = 102,["107"] = 103,["108"] = 104,["109"] = 105,["110"] = 71,["111"] = 108,["112"] = 113,["113"] = 113,["115"] = 115,["116"] = 116,["117"] = 117,["118"] = 118,["119"] = 118,["120"] = 118,["121"] = 118,["122"] = 118,["123"] = 119,["124"] = 120,["125"] = 121,["126"] = 122,["127"] = 123,["128"] = 124,["131"] = 127,["132"] = 108,["133"] = 130,["134"] = 131,["135"] = 131,["137"] = 133,["138"] = 134,["139"] = 135,["140"] = 136,["141"] = 136,["142"] = 136,["143"] = 136,["144"] = 136,["145"] = 137,["146"] = 138,["147"] = 139,["148"] = 140,["149"] = 141,["152"] = 144,["153"] = 130,["154"] = 147,["155"] = 148,["156"] = 149,["157"] = 150,["158"] = 151,["160"] = 152,["161"] = 152,["163"] = 153,["164"] = 153,["165"] = 153,["166"] = 153,["167"] = 153,["168"] = 154,["169"] = 155,["170"] = 156,["175"] = 159,["176"] = 147,["177"] = 162,["178"] = 163,["179"] = 163,["180"] = 163,["181"] = 163,["182"] = 163,["183"] = 163,["184"] = 162,["185"] = 171,["186"] = 179,["189"] = 181,["190"] = 182,["193"] = 186,["194"] = 187,["195"] = 188,["196"] = 190,["197"] = 190,["198"] = 190,["199"] = 190,["200"] = 190,["201"] = 190,["202"] = 190,["203"] = 192,["204"] = 193,["205"] = 194,["206"] = 195,["207"] = 196,["208"] = 197,["209"] = 197,["210"] = 197,["211"] = 197,["212"] = 197,["213"] = 197,["217"] = 207,["218"] = 208,["219"] = 209,["220"] = 210,["221"] = 211,["222"] = 212,["223"] = 213,["224"] = 214,["225"] = 215,["228"] = 219,["229"] = 220,["230"] = 220,["231"] = 220,["232"] = 220,["233"] = 220,["234"] = 220,["235"] = 220,["236"] = 220,["237"] = 220,["238"] = 220,["239"] = 220,["240"] = 220,["241"] = 220,["242"] = 220,["243"] = 239,["244"] = 240,["245"] = 241,["246"] = 242,["247"] = 242,["248"] = 242,["249"] = 242,["250"] = 242,["251"] = 243,["252"] = 244,["257"] = 250,["258"] = 251,["259"] = 252,["261"] = 255,["262"] = 256,["263"] = 257,["264"] = 258,["265"] = 259,["266"] = 259,["267"] = 259,["268"] = 259,["269"] = 259,["270"] = 259,["274"] = 269,["275"] = 270,["276"] = 271,["277"] = 272,["278"] = 273,["279"] = 275,["280"] = 276,["281"] = 277,["282"] = 277,["283"] = 277,["284"] = 277,["285"] = 277,["286"] = 277,["287"] = 277,["288"] = 277,["289"] = 278,["293"] = 282,["294"] = 283,["296"] = 285,["297"] = 286,["298"] = 287,["299"] = 288,["302"] = 291,["303"] = 292,["304"] = 293,["305"] = 294,["309"] = 299,["310"] = 300,["311"] = 301,["312"] = 301,["313"] = 301,["314"] = 301,["315"] = 301,["316"] = 302,["317"] = 303,["320"] = 306,["321"] = 307,["322"] = 308,["323"] = 308,["324"] = 308,["325"] = 308,["326"] = 308,["327"] = 308,["331"] = 318,["332"] = 318,["333"] = 318,["334"] = 318,["335"] = 318,["336"] = 318,["337"] = 318,["338"] = 318,["339"] = 318,["340"] = 318,["341"] = 318,["342"] = 318,["343"] = 318,["344"] = 318,["345"] = 330,["346"] = 331,["347"] = 332,["348"] = 333,["349"] = 334,["350"] = 335,["351"] = 335,["352"] = 335,["353"] = 335,["354"] = 335,["355"] = 335,["356"] = 335,["357"] = 336,["361"] = 340,["362"] = 341,["363"] = 342,["367"] = 347,["368"] = 348,["369"] = 349,["371"] = 352,["372"] = 353,["373"] = 354,["374"] = 355,["376"] = 171});
local ____exports = {}
local ____boss_abilities = require("systems.boss.boss_abilities")
local tryCastDefensiveItem = ____boss_abilities.tryCastDefensiveItem
local tryCastFarmAbilities = ____boss_abilities.tryCastFarmAbilities
local tryCastHeroCombatKit = ____boss_abilities.tryCastHeroCombatKit
local tryUseMobilityItem = ____boss_abilities.tryUseMobilityItem
local ____boss_progression = require("systems.boss.boss_progression")
local consumeRuneForBoss = ____boss_progression.consumeRuneForBoss
local tryMaintainBossHealth = ____boss_progression.tryMaintainBossHealth
local ____boss_types = require("systems.boss.boss_types")
local BOSS_TEAM = ____boss_types.BOSS_TEAM
local RECOVER_HP_THRESHOLD = ____boss_types.RECOVER_HP_THRESHOLD
local RETREAT_HP_THRESHOLD = ____boss_types.RETREAT_HP_THRESHOLD
local distance2D = ____boss_types.distance2D
local isHeroProtectedByFountain = ____boss_types.isHeroProtectedByFountain
local isNearAnyFountain = ____boss_types.isNearAnyFountain
local function getAllowedCampSizes(self, bossLevel)
    if bossLevel <= 15 then
        return __TS__New(Set, {"small", "medium"})
    end
    if bossLevel <= 40 then
        return __TS__New(Set, {"small", "medium", "hard"})
    end
    return __TS__New(Set, {
        "small",
        "medium",
        "hard",
        "strong",
        "random"
    })
end
function ____exports.pickSmartWaypoint(self, currentPos, bossLevel, patrolWaypoints)
    local allowedSizes = getAllowedCampSizes(nil, bossLevel)
    local preferred = __TS__ArrayFilter(
        patrolWaypoints,
        function(____, w) return allowedSizes:has(w.campSize) end
    )
    local pool = #preferred > 0 and preferred or patrolWaypoints
    if #pool == 1 then
        return pool[1].position
    end
    local best = pool[RandomInt(0, #pool - 1) + 1].position
    do
        local attempt = 0
        while attempt < 6 do
            local candidate = pool[RandomInt(0, #pool - 1) + 1].position
            local dist = distance2D(nil, currentPos, candidate)
            if dist >= 900 and dist <= 4500 then
                best = candidate
                break
            end
            attempt = attempt + 1
        end
    end
    return best
end
local function pickRetreatPosition(self, currentPos, bossSpawnPoints, patrolWaypoints)
    local best = bossSpawnPoints[1] or Vector(0, 0, 128)
    local bestDist = -1
    for ____, wp in ipairs(patrolWaypoints) do
        local dist = distance2D(nil, currentPos, wp.position)
        if dist >= 1200 and dist <= 2600 and dist > bestDist then
            bestDist = dist
            best = wp.position
        end
    end
    return best
end
function ____exports.pickRandomBossSpawnOrigin(self, runtime, bossSpawnPoints, fountainPositions)
    local safePool = __TS__ArrayFilter(
        bossSpawnPoints,
        function(____, pos) return not isNearAnyFountain(nil, pos, fountainPositions, 1600) end
    )
    local basePool = #safePool > 0 and safePool or bossSpawnPoints
    if #basePool == 0 then
        return Vector(0, 0, 128)
    end
    local nonRepeat = runtime.lastSpawnPosition and __TS__ArrayFilter(
        basePool,
        function(____, pos) return distance2D(nil, pos, runtime.lastSpawnPosition) > 400 end
    ) or basePool
    local candidates = #nonRepeat > 0 and nonRepeat or basePool
    local awayFromHeroes = __TS__ArrayFilter(
        candidates,
        function(____, pos)
            local nearby = FindUnitsInRadius(
                BOSS_TEAM,
                pos,
                nil,
                1100,
                2,
                1,
                0,
                0,
                false
            )
            return #nearby == 0
        end
    )
    local finalPool = #awayFromHeroes > 0 and awayFromHeroes or candidates
    local chosen = finalPool[RandomInt(0, #finalPool - 1) + 1]
    runtime.lastSpawnPosition = chosen
    return chosen
end
local function selectPriorityHeroTarget(self, origin, unit, heroes)
    if #heroes == 0 then
        return nil
    end
    local best
    local bestScore = -999999
    for ____, hero in ipairs(heroes) do
        local dist = distance2D(
            nil,
            origin,
            hero:GetAbsOrigin()
        )
        local visibleBonus = unit:CanEntityBeSeenByMyTeam(hero) and 400 or 0
        local lowHpBonus = (100 - hero:GetHealthPercent()) * 6
        local score = visibleBonus + lowHpBonus - dist * 0.5
        if score > bestScore then
            bestScore = score
            best = hero
        end
    end
    return best
end
local function selectPriorityCreepTarget(self, origin, creeps)
    if #creeps == 0 then
        return nil
    end
    local best = creeps[1]
    local bestScore = -999999
    for ____, creep in ipairs(creeps) do
        local dist = distance2D(
            nil,
            origin,
            creep:GetAbsOrigin()
        )
        local finishBonus = creep:GetHealthPercent() <= 35 and 250 or 0
        local score = finishBonus - dist
        if score > bestScore then
            bestScore = score
            best = creep
        end
    end
    return best
end
local function findNearbyRune(self, origin, radius)
    local runes = Entities:FindAllByClassnameWithin("dota_item_rune", origin, radius)
    local closest
    local closestDist = radius + 1
    for ____, ent in ipairs(runes) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue30
            end
            local dist = distance2D(
                nil,
                origin,
                ent:GetAbsOrigin()
            )
            if dist < closestDist then
                closestDist = dist
                closest = ent
            end
        end
        ::__continue30::
    end
    return closest
end
local function issueAttackMoveOrder(self, unit, position)
    ExecuteOrderFromTable({
        UnitIndex = unit:entindex(),
        OrderType = 3,
        Position = position,
        Queue = false
    })
end
function ____exports.tickBossRoamingAI(self, runtime, unit, now, fountainPositions, bossSpawnPoints, patrolWaypoints)
    if unit:IsChanneling() or unit:IsStunned() or unit:IsHexed() then
        return
    end
    local activeAbility = unit:GetCurrentActiveAbility()
    if activeAbility and not activeAbility:IsNull() and activeAbility:IsInAbilityPhase() then
        return
    end
    local origin = unit:GetAbsOrigin()
    local hpRatio = unit:GetHealthPercent() / 100
    local attackRange = unit:Script_GetAttackRange()
    tryMaintainBossHealth(
        nil,
        runtime,
        unit,
        hpRatio,
        now
    )
    if isNearAnyFountain(nil, origin, fountainPositions, 1450) then
        local safeWaypoint = ____exports.pickSmartWaypoint(nil, origin, runtime.level, patrolWaypoints)
        runtime.targetWaypoint = safeWaypoint
        if not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1 then
            runtime.lastMoveOrderTime = now
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 1,
                Position = safeWaypoint,
                Queue = false
            })
        end
        return
    end
    if not runtime.inCourage then
        if not runtime.retreating and hpRatio <= RETREAT_HP_THRESHOLD then
            runtime.retreating = true
            runtime.retreatPosition = pickRetreatPosition(nil, origin, bossSpawnPoints, patrolWaypoints)
            runtime.lastMoveOrderTime = -999
        elseif runtime.retreating and hpRatio >= RECOVER_HP_THRESHOLD then
            runtime.retreating = false
            runtime.retreatPosition = nil
            runtime.lastMoveOrderTime = -999
        end
    end
    local heroSearchRadius = runtime.inCourage and FIND_UNITS_EVERYWHERE or 800
    local nearbyHeroes = __TS__ArrayFilter(
        FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            nil,
            heroSearchRadius,
            2,
            1,
            256,
            1,
            false
        ),
        function(____, h) return h and not h:IsNull() and IsValidEntity(h) and h:IsAlive() and not isHeroProtectedByFountain(nil, h, fountainPositions) end
    )
    if runtime.retreating then
        local threat = nearbyHeroes[1]
        if threat and unit:CanEntityBeSeenByMyTeam(threat) then
            local dist = distance2D(
                nil,
                origin,
                threat:GetAbsOrigin()
            )
            if not unit:IsSilenced() and dist <= 650 then
                if tryCastDefensiveItem(nil, unit, #nearbyHeroes, dist) then
                    return
                end
            end
        end
        if not runtime.retreatPosition or distance2D(nil, origin, runtime.retreatPosition) <= 220 then
            runtime.retreatPosition = pickRetreatPosition(nil, origin, bossSpawnPoints, patrolWaypoints)
            runtime.lastMoveOrderTime = -999
        end
        if not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.5 then
            runtime.lastMoveOrderTime = now
            runtime.lastAttackTargetIndex = nil
            tryUseMobilityItem(nil, unit)
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 1,
                Position = runtime.retreatPosition,
                Queue = false
            })
        end
        return
    end
    local targetHero = selectPriorityHeroTarget(nil, origin, unit, nearbyHeroes)
    if targetHero then
        local canSee = unit:CanEntityBeSeenByMyTeam(targetHero)
        local heroPos = targetHero:GetAbsOrigin()
        local dist = distance2D(nil, origin, heroPos)
        if canSee then
            if not unit:IsSilenced() and not unit:IsAttacking() and dist <= 900 then
                if tryCastHeroCombatKit(
                    nil,
                    unit,
                    runtime.definition,
                    targetHero,
                    #nearbyHeroes,
                    runtime.inCourage
                ) then
                    runtime.lastMoveOrderTime = now
                    return
                end
            end
            if dist > attackRange + 120 then
                tryUseMobilityItem(nil, unit)
            end
            if not unit:IsAttacking() and (dist > attackRange + 80 or not unit:IsMoving()) then
                if now - runtime.lastMoveOrderTime >= 1.2 or not unit:IsMoving() then
                    runtime.lastMoveOrderTime = now
                    issueAttackMoveOrder(nil, unit, heroPos)
                end
            end
        elseif not unit:IsAttacking() and (not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.5) then
            runtime.lastMoveOrderTime = now
            tryUseMobilityItem(nil, unit)
            issueAttackMoveOrder(nil, unit, heroPos)
        end
        return
    end
    local nearbyRune = findNearbyRune(nil, origin, 650)
    if nearbyRune then
        local runeDist = distance2D(
            nil,
            origin,
            nearbyRune:GetAbsOrigin()
        )
        if runeDist <= 140 then
            consumeRuneForBoss(nil, runtime, unit, nearbyRune)
            return
        end
        if not unit:IsAttacking() and (not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.2) then
            runtime.lastMoveOrderTime = now
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 15,
                TargetIndex = nearbyRune:entindex(),
                Queue = false
            })
        end
        return
    end
    local nearbyCreeps = __TS__ArrayFilter(
        FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            nil,
            750,
            2,
            18,
            128,
            1,
            false
        ),
        function(____, c) return c and not c:IsNull() and IsValidEntity(c) and c:IsAlive() end
    )
    local targetCreep = selectPriorityCreepTarget(nil, origin, nearbyCreeps)
    if targetCreep then
        local creepPos = targetCreep:GetAbsOrigin()
        local dist = distance2D(nil, origin, creepPos)
        if not unit:IsSilenced() and not unit:IsAttacking() and dist <= 420 then
            if tryCastFarmAbilities(
                nil,
                unit,
                runtime.definition,
                targetCreep,
                nearbyCreeps
            ) then
                runtime.lastMoveOrderTime = now
                return
            end
        end
        if not unit:IsAttacking() and not unit:IsMoving() then
            runtime.lastMoveOrderTime = now
            issueAttackMoveOrder(nil, unit, creepPos)
        end
        return
    end
    if not runtime.targetWaypoint or distance2D(nil, origin, runtime.targetWaypoint) <= 280 then
        runtime.targetWaypoint = ____exports.pickSmartWaypoint(nil, origin, runtime.level, patrolWaypoints)
        runtime.lastMoveOrderTime = -999
    end
    if not unit:IsAttacking() and not unit:IsMoving() then
        runtime.lastMoveOrderTime = now
        tryUseMobilityItem(nil, unit)
        issueAttackMoveOrder(nil, unit, runtime.targetWaypoint)
    end
end
return ____exports
