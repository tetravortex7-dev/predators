local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 6,["25"] = 7,["26"] = 8,["27"] = 9,["28"] = 10,["29"] = 11,["30"] = 13,["31"] = 15,["32"] = 16,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 20,["37"] = 21,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 40,["46"] = 40,["47"] = 31,["48"] = 32,["49"] = 33,["50"] = 34,["51"] = 35,["52"] = 36,["53"] = 37,["54"] = 38,["55"] = 40,["56"] = 42,["57"] = 43,["58"] = 44,["59"] = 45,["60"] = 46,["61"] = 48,["62"] = 48,["63"] = 48,["64"] = 48,["65"] = 48,["66"] = 49,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 49,["71"] = 51,["72"] = 51,["73"] = 51,["74"] = 51,["75"] = 51,["76"] = 51,["77"] = 51,["78"] = 52,["79"] = 53,["80"] = 53,["82"] = 51,["83"] = 51,["84"] = 57,["85"] = 57,["86"] = 57,["87"] = 57,["88"] = 57,["89"] = 58,["90"] = 59,["92"] = 57,["93"] = 57,["94"] = 63,["95"] = 63,["96"] = 63,["97"] = 63,["98"] = 63,["99"] = 63,["100"] = 63,["101"] = 64,["102"] = 65,["104"] = 63,["105"] = 63,["106"] = 42,["107"] = 70,["108"] = 71,["109"] = 72,["110"] = 73,["112"] = 70,["113"] = 77,["114"] = 78,["115"] = 79,["117"] = 80,["118"] = 81,["119"] = 81,["121"] = 82,["122"] = 83,["127"] = 86,["128"] = 77,["129"] = 89,["130"] = 90,["131"] = 91,["132"] = 91,["134"] = 92,["135"] = 93,["136"] = 93,["138"] = 95,["139"] = 96,["140"] = 97,["141"] = 99,["142"] = 99,["143"] = 99,["144"] = 99,["145"] = 99,["146"] = 99,["147"] = 99,["148"] = 100,["149"] = 101,["151"] = 103,["152"] = 103,["153"] = 104,["154"] = 105,["155"] = 106,["157"] = 103,["161"] = 109,["162"] = 109,["163"] = 110,["164"] = 111,["165"] = 112,["167"] = 109,["170"] = 116,["171"] = 117,["172"] = 118,["173"] = 119,["174"] = 120,["175"] = 89,["176"] = 123,["177"] = 124,["178"] = 125,["181"] = 126,["182"] = 127,["185"] = 129,["186"] = 130,["187"] = 132,["188"] = 133,["189"] = 138,["191"] = 123,["192"] = 142,["193"] = 143,["194"] = 146,["195"] = 146,["196"] = 146,["198"] = 148,["199"] = 148,["201"] = 149,["202"] = 150,["203"] = 151,["204"] = 151,["206"] = 153,["207"] = 154,["208"] = 155,["209"] = 156,["210"] = 158,["211"] = 158,["212"] = 158,["213"] = 158,["214"] = 158,["215"] = 158,["216"] = 158,["217"] = 158,["218"] = 158,["219"] = 158,["220"] = 158,["221"] = 158,["222"] = 158,["223"] = 158,["224"] = 172,["226"] = 175,["227"] = 176,["231"] = 148,["234"] = 180,["235"] = 181,["236"] = 182,["237"] = 182,["238"] = 182,["239"] = 182,["240"] = 182,["242"] = 142,["243"] = 190,["244"] = 191,["245"] = 192,["246"] = 192,["248"] = 193,["249"] = 194,["250"] = 194,["252"] = 195,["253"] = 196,["254"] = 196,["255"] = 196,["256"] = 196,["257"] = 197,["258"] = 190,["259"] = 200,["260"] = 201,["261"] = 202,["262"] = 205,["263"] = 210,["264"] = 211,["265"] = 212,["266"] = 213,["269"] = 217,["270"] = 217,["271"] = 217,["272"] = 217,["273"] = 217,["274"] = 217,["275"] = 217,["276"] = 224,["277"] = 225,["280"] = 226,["281"] = 217,["282"] = 217,["283"] = 200,["284"] = 231,["285"] = 237,["286"] = 238,["287"] = 239,["288"] = 240,["289"] = 241,["290"] = 242,["291"] = 243,["292"] = 244,["293"] = 245,["294"] = 246,["295"] = 246,["296"] = 246,["297"] = 246,["298"] = 246,["299"] = 246,["300"] = 247,["301"] = 247,["302"] = 247,["303"] = 247,["304"] = 249,["305"] = 250,["306"] = 251,["307"] = 251,["308"] = 251,["309"] = 251,["311"] = 256,["313"] = 259,["314"] = 260,["315"] = 261,["317"] = 263,["318"] = 264,["319"] = 265,["320"] = 266,["321"] = 267,["323"] = 269,["325"] = 272,["326"] = 273,["328"] = 276,["329"] = 277,["331"] = 280,["332"] = 281,["333"] = 282,["334"] = 282,["335"] = 282,["336"] = 282,["337"] = 282,["339"] = 231,["340"] = 290,["341"] = 296,["342"] = 296,["343"] = 296,["344"] = 296,["345"] = 296,["346"] = 296,["347"] = 296,["348"] = 303,["349"] = 290,["350"] = 313,["351"] = 314,["352"] = 316,["354"] = 317,["355"] = 318,["356"] = 319,["357"] = 320,["359"] = 322,["361"] = 325,["362"] = 331,["363"] = 332,["365"] = 335,["366"] = 335,["367"] = 335,["368"] = 335,["369"] = 336,["370"] = 336,["371"] = 336,["372"] = 336,["373"] = 336,["374"] = 336,["375"] = 336,["376"] = 336,["377"] = 336,["381"] = 346,["382"] = 313,["383"] = 349,["384"] = 350,["387"] = 351,["388"] = 352,["389"] = 354,["390"] = 355,["391"] = 356,["393"] = 359,["394"] = 360,["395"] = 361,["397"] = 349,["398"] = 365,["399"] = 366,["400"] = 367,["401"] = 369,["402"] = 370,["403"] = 371,["404"] = 372,["405"] = 373,["406"] = 374,["407"] = 375,["408"] = 376,["409"] = 377,["410"] = 378,["411"] = 379,["412"] = 379,["413"] = 381,["414"] = 381,["415"] = 381,["416"] = 381,["417"] = 381,["418"] = 381,["419"] = 379,["420"] = 379,["423"] = 391,["424"] = 391,["425"] = 391,["426"] = 391,["427"] = 392,["428"] = 392,["429"] = 392,["430"] = 392,["431"] = 393,["436"] = 399,["437"] = 400,["440"] = 401,["441"] = 403,["442"] = 404,["445"] = 406,["446"] = 407,["447"] = 412,["448"] = 414,["449"] = 415,["450"] = 416,["451"] = 417,["452"] = 418,["453"] = 419,["454"] = 420,["455"] = 421,["456"] = 422,["460"] = 427,["461"] = 428,["463"] = 430,["464"] = 431,["465"] = 432,["466"] = 433,["467"] = 435,["468"] = 436,["469"] = 437,["471"] = 365,["472"] = 445,["473"] = 446,["474"] = 447,["475"] = 448,["476"] = 449,["480"] = 453,["481"] = 454,["482"] = 454,["483"] = 454,["484"] = 454,["485"] = 454,["486"] = 454,["487"] = 454,["488"] = 455,["489"] = 456,["490"] = 457,["491"] = 458,["495"] = 462,["496"] = 445});
local ____exports = {}
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local getBossDefinition = ____bosses_catalog.getBossDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local ____boss_combat = require("systems.boss.boss_combat")
local pickRandomBossSpawnOrigin = ____boss_combat.pickRandomBossSpawnOrigin
local pickSmartWaypoint = ____boss_combat.pickSmartWaypoint
local tickBossRoamingAI = ____boss_combat.tickBossRoamingAI
local ____boss_progression = require("systems.boss.boss_progression")
local dropBossCore = ____boss_progression.dropBossCore
local equipPurchasedItems = ____boss_progression.equipPurchasedItems
local grantBossProgress = ____boss_progression.grantBossProgress
local syncBossAbilitiesLevel = ____boss_progression.syncBossAbilitiesLevel
local upgradeBossHeroAbilities = ____boss_progression.upgradeBossHeroAbilities
local ____boss_types = require("systems.boss.boss_types")
local BOSS_AI_TICK_SECONDS = ____boss_types.BOSS_AI_TICK_SECONDS
local BOSS_CREEP_XP_MULTIPLIER = ____boss_types.BOSS_CREEP_XP_MULTIPLIER
local BOSS_HERO_KILL_GOLD = ____boss_types.BOSS_HERO_KILL_GOLD
local BOSS_HERO_KILL_XP = ____boss_types.BOSS_HERO_KILL_XP
local BOSS_PASSIVE_GOLD_PER_SEC = ____boss_types.BOSS_PASSIVE_GOLD_PER_SEC
local BOSS_PASSIVE_XP_PER_SEC = ____boss_types.BOSS_PASSIVE_XP_PER_SEC
local BOSS_TEAM = ____boss_types.BOSS_TEAM
local computeBossScale = ____boss_types.computeBossScale
local discoverBossMapPositions = ____boss_types.discoverBossMapPositions
local getBossRequiredXp = ____boss_types.getBossRequiredXp
local revealBossOnMinimap = ____boss_types.revealBossOnMinimap
____exports.BossManager = __TS__Class()
local BossManager = ____exports.BossManager
BossManager.name = "BossManager"
function BossManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.bosses = __TS__New(Map)
    self.entIndexToBossId = __TS__New(Map)
    self.patrolWaypoints = {}
    self.bossSpawnPoints = {}
    self.fountainPositions = {}
    self.activeBossIds = {}
    self.thinkerStarted = false
    self.devSpawned = false
end
function BossManager.prototype.init(self)
    local discovered = discoverBossMapPositions(nil)
    self.fountainPositions = discovered.fountainPositions
    self.bossSpawnPoints = discovered.bossSpawnPoints
    self.patrolWaypoints = discovered.patrolWaypoints
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:onEntityKilled(event) end,
        nil
    )
    self.eventBus:on(
        "boss_event",
        function(____, ____bindingPattern0)
            local event
            local bossId
            bossId = ____bindingPattern0.bossId
            event = ____bindingPattern0.event
            if event == "announced" and not __TS__ArrayIncludes(self.activeBossIds, bossId) then
                local ____self_activeBossIds_0 = self.activeBossIds
                ____self_activeBossIds_0[#____self_activeBossIds_0 + 1] = bossId
            end
        end
    )
    self.eventBus:on(
        "phase_changed",
        function(____, ____bindingPattern0)
            local newPhase
            newPhase = ____bindingPattern0.newPhase
            if newPhase == "SURFACE" then
                self:spawnMatchBosses()
            end
        end
    )
    self.eventBus:on(
        "dev_command",
        function(____, ____bindingPattern0)
            local args
            local command
            command = ____bindingPattern0.command
            args = ____bindingPattern0.args
            if command == "-evo_boss" then
                self:onDevBossCommand(args)
            end
        end
    )
end
function BossManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and IsInToolsMode() and not self.devSpawned then
        self.devSpawned = true
        self:spawnMatchBosses()
    end
end
function BossManager.prototype.getStrongestAliveBoss(self)
    local best
    for ____, runtime in __TS__Iterator(self.bosses:values()) do
        do
            local unit = runtime.unit
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
                goto __continue15
            end
            if not best or runtime.level > best.level then
                best = {bossId = runtime.definition.id, unit = unit, level = runtime.level}
            end
        end
        ::__continue15::
    end
    return best
end
function BossManager.prototype.prepareBossForArena(self, bossId, spawnPos, lookTarget)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return nil
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return nil
    end
    local returnPos = unit:GetAbsOrigin()
    runtime.retreating = false
    runtime.retreatPosition = nil
    unit:Purge(
        false,
        true,
        false,
        true,
        true
    )
    unit:SetHealth(unit:GetMaxHealth())
    unit:SetMana(unit:GetMaxMana())
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            local ability = unit:GetAbilityByIndex(i)
            if ability and not ability:IsNull() then
                ability:EndCooldown()
            end
            i = i + 1
        end
    end
    do
        local slot = 0
        while slot < 9 do
            local item = unit:GetItemInSlot(slot)
            if item and not item:IsNull() then
                item:EndCooldown()
            end
            slot = slot + 1
        end
    end
    FindClearSpaceForUnit(unit, spawnPos, true)
    unit:Stop()
    local dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0):Normalized()
    unit:SetForwardVector(dir)
    return returnPos
end
function BossManager.prototype.returnBossFromArena(self, bossId, returnPos, bossWon)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return
    end
    FindClearSpaceForUnit(unit, returnPos, true)
    unit:Stop()
    if bossWon then
        grantBossProgress(nil, runtime, EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_XP, EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_GOLD)
        self:triggerCourage(runtime)
    end
end
function BossManager.prototype.spawnMatchBosses(self)
    local idsToSpawn = #self.activeBossIds > 0 and self.activeBossIds or __TS__ArrayMap(
        __TS__ArraySlice(EVO_BOSSES_CATALOG, 0, EVO_CONSTANTS.BOSS_COUNT_PER_MATCH),
        function(____, b) return b.id end
    )
    do
        local i = 0
        while i < #idsToSpawn do
            do
                local bossId = idsToSpawn[i + 1]
                local def = getBossDefinition(nil, bossId)
                if not def then
                    goto __continue32
                end
                local runtime = self.bosses:get(bossId)
                if not runtime then
                    local builds = def.itemBuilds
                    local chosenBuild = #builds > 0 and builds[RandomInt(0, #builds - 1) + 1] or ({})
                    runtime = {
                        definition = def,
                        level = 1,
                        xp = 0,
                        gold = 0,
                        itemBuild = chosenBuild,
                        nextItemIndex = 0,
                        lastHealBuyTime = -999,
                        spawnTime = GameRules:GetDOTATime(false, false),
                        inCourage = false,
                        retreating = false,
                        lastMoveOrderTime = -999,
                        lastAttackOrderTime = -999
                    }
                    self.bosses:set(bossId, runtime)
                end
                if not runtime.unit or runtime.unit:IsNull() or not IsValidEntity(runtime.unit) or not runtime.unit:IsAlive() then
                    self:spawnBossUnit(runtime)
                end
            end
            ::__continue32::
            i = i + 1
        end
    end
    if not self.thinkerStarted then
        self.thinkerStarted = true
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoBossManagerThink",
            function() return self:onThink() end,
            BOSS_AI_TICK_SECONDS
        )
    end
end
function BossManager.prototype.setBossWearables(self, bossId, preset)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return false
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) then
        return false
    end
    local scale = computeBossScale(nil, runtime.definition, runtime.level)
    HeroAppearance:applyPreset(
        unit,
        __TS__ObjectAssign({}, preset, {scale = scale})
    )
    return true
end
function BossManager.prototype.spawnBossUnit(self, runtime)
    local spawnOrigin = pickRandomBossSpawnOrigin(nil, runtime, self.bossSpawnPoints, self.fountainPositions)
    local now = GameRules:GetDOTATime(false, false)
    if runtime.unit and not runtime.unit:IsNull() and IsValidEntity(runtime.unit) and runtime.unit:IsHero() then
        local existingHero = runtime.unit
        existingHero:RespawnHero(false, false)
        FindClearSpaceForUnit(existingHero, spawnOrigin, true)
        self:finalizeSpawnedBoss(runtime, existingHero, now, false)
        return
    end
    CreateUnitByNameAsync(
        runtime.definition.unitName,
        spawnOrigin,
        true,
        nil,
        nil,
        BOSS_TEAM,
        function(unit)
            if not unit or unit:IsNull() or not IsValidEntity(unit) then
                return
            end
            self:finalizeSpawnedBoss(runtime, unit, now, true)
        end
    )
end
function BossManager.prototype.finalizeSpawnedBoss(self, runtime, unit, now, isFreshSpawn)
    runtime.unit = unit
    runtime.entIndex = unit:entindex()
    runtime.spawnTime = now
    runtime.respawnAtTime = nil
    runtime.retreating = false
    runtime.retreatPosition = nil
    runtime.lastMoveOrderTime = -999
    runtime.lastAttackTargetIndex = nil
    runtime.lastAttackOrderTime = -999
    runtime.targetWaypoint = pickSmartWaypoint(
        nil,
        unit:GetAbsOrigin(),
        now,
        self.patrolWaypoints
    )
    self.entIndexToBossId:set(
        unit:entindex(),
        runtime.definition.id
    )
    local targetScale = computeBossScale(nil, runtime.definition, runtime.level)
    if runtime.definition.appearance then
        HeroAppearance:applyPreset(
            unit,
            __TS__ObjectAssign({}, runtime.definition.appearance, {scale = targetScale})
        )
    else
        unit:SetModelScale(targetScale)
    end
    if unit:IsHero() then
        while unit:GetLevel() < runtime.level do
            unit:HeroLevelUp(false)
        end
        upgradeBossHeroAbilities(nil, unit, runtime.definition)
    elseif unit:IsCreature() then
        local delta = runtime.level - unit:GetLevel()
        if delta > 0 then
            unit:CreatureLevelUp(delta)
        end
        syncBossAbilitiesLevel(nil, unit, runtime.level)
    end
    if isFreshSpawn then
        equipPurchasedItems(nil, unit, runtime)
    end
    if runtime.inCourage then
        unit:AddNewModifier(unit, nil, "modifier_evo_boss_courage", {})
    end
    self:emitBossAnnouncement(runtime, "spawned")
    if IsInToolsMode() then
        GameRules:SendCustomMessage(
            ((("[Evo] Third-Party Boss spawned: " .. runtime.definition.id) .. " (Lv.") .. tostring(runtime.level)) .. ")",
            0,
            0
        )
    end
end
function BossManager.prototype.emitBossAnnouncement(self, runtime, event, killerTeam, killerPlayerId)
    self.eventBus:emit("boss_event", {
        bossId = runtime.definition.id,
        level = runtime.level,
        event = event,
        killerTeam = killerTeam,
        killerPlayerId = killerPlayerId
    })
    CustomGameEventManager:Send_ServerToAllClients("evo_boss_announcement", {boss_id = runtime.definition.id, level = runtime.level, event = event})
end
function BossManager.prototype.onThink(self)
    local now = GameRules:GetDOTATime(false, false)
    for ____, runtime in __TS__Iterator(self.bosses:values()) do
        do
            local unit = runtime.unit
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
                if runtime.respawnAtTime ~= nil and now >= runtime.respawnAtTime then
                    self:spawnBossUnit(runtime)
                end
                goto __continue57
            end
            grantBossProgress(nil, runtime, BOSS_PASSIVE_XP_PER_SEC * BOSS_AI_TICK_SECONDS, BOSS_PASSIVE_GOLD_PER_SEC * BOSS_AI_TICK_SECONDS)
            if not runtime.inCourage and now - runtime.spawnTime >= EVO_CONSTANTS.BOSS_COURAGE_TIME_SECONDS then
                self:triggerCourage(runtime)
            end
            revealBossOnMinimap(
                nil,
                unit:GetAbsOrigin()
            )
            tickBossRoamingAI(
                nil,
                runtime,
                unit,
                now,
                self.fountainPositions,
                self.bossSpawnPoints,
                self.patrolWaypoints
            )
        end
        ::__continue57::
    end
    return BOSS_AI_TICK_SECONDS
end
function BossManager.prototype.triggerCourage(self, runtime)
    if runtime.inCourage then
        return
    end
    runtime.inCourage = true
    runtime.retreating = false
    local unit = runtime.unit
    if unit and not unit:IsNull() and IsValidEntity(unit) and unit:IsAlive() then
        unit:AddNewModifier(unit, nil, "modifier_evo_boss_courage", {})
    end
    self:emitBossAnnouncement(runtime, "courage")
    if IsInToolsMode() then
        GameRules:SendCustomMessage(("[Evo] " .. runtime.definition.id) .. " entered COURAGE mode!", 0, 0)
    end
end
function BossManager.prototype.onEntityKilled(self, event)
    local killedIndex = event.entindex_killed
    local killerIndex = event.entindex_attacker
    if killerIndex ~= nil then
        local killerBossId = self.entIndexToBossId:get(killerIndex)
        if killerBossId ~= nil then
            local killerBoss = self.bosses:get(killerBossId)
            local victim = EntIndexToHScript(killedIndex)
            if killerBoss and victim and not victim:IsNull() and IsValidEntity(victim) and victim:IsBaseNPC() then
                if victim:IsRealHero() then
                    grantBossProgress(nil, killerBoss, BOSS_HERO_KILL_XP, BOSS_HERO_KILL_GOLD)
                    local victimPid = victim:GetPlayerOwnerID()
                    if PlayerResource:IsValidPlayerID(victimPid) then
                        CustomGameEventManager:Send_ServerToAllClients(
                            "evo_boss_killed_hero",
                            {
                                boss_id = killerBossId,
                                boss_unit = killerBoss.definition.unitName,
                                victim_player_id = victimPid,
                                victim_hero = victim:GetUnitName(),
                                gold = BOSS_HERO_KILL_GOLD
                            }
                        )
                    end
                else
                    local creepXp = math.max(
                        15,
                        math.floor(victim:GetDeathXP() * BOSS_CREEP_XP_MULTIPLIER)
                    )
                    local creepGold = math.max(
                        15,
                        victim:GetGoldBounty()
                    )
                    grantBossProgress(nil, killerBoss, creepXp, creepGold)
                end
            end
        end
    end
    local deadBossId = self.entIndexToBossId:get(killedIndex)
    if deadBossId == nil then
        return
    end
    self.entIndexToBossId:delete(killedIndex)
    local runtime = self.bosses:get(deadBossId)
    if not runtime then
        return
    end
    local deadUnit = EntIndexToHScript(killedIndex)
    local dropOrigin = deadUnit and not deadUnit:IsNull() and IsValidEntity(deadUnit) and deadUnit:GetAbsOrigin() or Vector(0, 0, 128)
    dropBossCore(nil, runtime.definition, dropOrigin)
    local killerTeam
    local killerPlayerId
    if killerIndex ~= nil then
        local attacker = EntIndexToHScript(killerIndex)
        if attacker and not attacker:IsNull() and IsValidEntity(attacker) and attacker:IsBaseNPC() then
            killerTeam = attacker:GetTeamNumber()
            local ownerId = attacker:GetPlayerOwnerID()
            if PlayerResource:IsValidPlayerID(ownerId) then
                killerPlayerId = ownerId
            end
        end
    end
    if not deadUnit or deadUnit:IsNull() or not IsValidEntity(deadUnit) or not deadUnit:IsBaseNPC() or not deadUnit:IsHero() then
        runtime.unit = nil
    end
    runtime.entIndex = nil
    runtime.retreating = false
    runtime.retreatPosition = nil
    runtime.respawnAtTime = GameRules:GetDOTATime(false, false) + EVO_CONSTANTS.BOSS_RESPAWN_SECONDS
    self:emitBossAnnouncement(runtime, "killed", killerTeam, killerPlayerId)
    if IsInToolsMode() then
        GameRules:SendCustomMessage(("[Evo] Boss " .. runtime.definition.id) .. " slain! Aghanim's Shard dropped!", 0, 0)
    end
end
function BossManager.prototype.onDevBossCommand(self, args)
    local sub = string.lower(args[1] or "")
    if sub == "courage" then
        for ____, runtime in __TS__Iterator(self.bosses:values()) do
            self:triggerCourage(runtime)
        end
        return
    end
    if sub == "lvl" then
        local targetLvl = math.min(
            EVO_CONSTANTS.BOSS_MAX_LEVEL,
            math.max(
                1,
                tonumber(args[2]) or 50
            )
        )
        local targetXp = getBossRequiredXp(nil, targetLvl)
        for ____, runtime in __TS__Iterator(self.bosses:values()) do
            local neededXp = math.max(0, targetXp - runtime.xp)
            grantBossProgress(nil, runtime, neededXp, 5000)
        end
        return
    end
    self:spawnMatchBosses()
end
return ____exports
