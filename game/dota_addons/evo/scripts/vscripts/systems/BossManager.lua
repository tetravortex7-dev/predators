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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 6,["25"] = 7,["26"] = 8,["27"] = 9,["28"] = 10,["29"] = 11,["30"] = 13,["31"] = 15,["32"] = 16,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 20,["37"] = 21,["38"] = 23,["39"] = 24,["40"] = 25,["41"] = 26,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 39,["46"] = 39,["47"] = 30,["48"] = 31,["49"] = 32,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 37,["55"] = 39,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 47,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 50,["76"] = 50,["77"] = 50,["78"] = 51,["79"] = 52,["80"] = 52,["82"] = 50,["83"] = 50,["84"] = 56,["85"] = 56,["86"] = 56,["87"] = 56,["88"] = 56,["89"] = 57,["90"] = 58,["92"] = 56,["93"] = 56,["94"] = 62,["95"] = 62,["96"] = 62,["97"] = 62,["98"] = 62,["99"] = 62,["100"] = 62,["101"] = 63,["102"] = 64,["104"] = 62,["105"] = 62,["106"] = 41,["107"] = 69,["108"] = 70,["109"] = 71,["110"] = 72,["112"] = 69,["113"] = 76,["114"] = 77,["115"] = 78,["117"] = 79,["118"] = 80,["119"] = 80,["121"] = 81,["122"] = 82,["127"] = 85,["128"] = 76,["129"] = 88,["130"] = 89,["131"] = 90,["132"] = 90,["134"] = 91,["135"] = 92,["136"] = 92,["138"] = 94,["139"] = 95,["140"] = 96,["141"] = 98,["142"] = 99,["143"] = 99,["144"] = 99,["145"] = 99,["146"] = 99,["147"] = 99,["148"] = 99,["149"] = 100,["150"] = 101,["152"] = 103,["153"] = 103,["154"] = 104,["155"] = 105,["156"] = 106,["158"] = 103,["162"] = 109,["163"] = 109,["164"] = 110,["165"] = 111,["166"] = 112,["168"] = 109,["171"] = 116,["172"] = 117,["173"] = 118,["174"] = 119,["175"] = 120,["176"] = 88,["177"] = 123,["178"] = 124,["179"] = 125,["182"] = 126,["183"] = 127,["186"] = 129,["187"] = 130,["188"] = 132,["189"] = 133,["190"] = 138,["192"] = 123,["193"] = 142,["194"] = 143,["195"] = 146,["196"] = 146,["197"] = 146,["199"] = 148,["200"] = 148,["202"] = 149,["203"] = 150,["204"] = 151,["205"] = 151,["207"] = 153,["208"] = 154,["209"] = 155,["210"] = 156,["211"] = 158,["212"] = 158,["213"] = 158,["214"] = 158,["215"] = 158,["216"] = 158,["217"] = 158,["218"] = 158,["219"] = 158,["220"] = 158,["221"] = 158,["222"] = 158,["223"] = 158,["224"] = 158,["225"] = 172,["227"] = 175,["228"] = 176,["232"] = 148,["235"] = 180,["236"] = 181,["237"] = 182,["238"] = 182,["239"] = 182,["240"] = 182,["241"] = 182,["243"] = 142,["244"] = 190,["245"] = 191,["246"] = 192,["247"] = 192,["249"] = 193,["250"] = 194,["251"] = 194,["253"] = 195,["254"] = 196,["255"] = 196,["256"] = 196,["257"] = 196,["258"] = 197,["259"] = 190,["260"] = 200,["261"] = 201,["262"] = 202,["263"] = 205,["264"] = 210,["265"] = 211,["266"] = 212,["267"] = 213,["270"] = 217,["271"] = 217,["272"] = 217,["273"] = 217,["274"] = 217,["275"] = 217,["276"] = 217,["277"] = 224,["278"] = 225,["281"] = 226,["282"] = 217,["283"] = 217,["284"] = 200,["285"] = 231,["286"] = 237,["287"] = 238,["288"] = 239,["289"] = 240,["290"] = 241,["291"] = 242,["292"] = 243,["293"] = 244,["294"] = 245,["295"] = 246,["296"] = 246,["297"] = 246,["298"] = 246,["299"] = 246,["300"] = 246,["301"] = 247,["302"] = 247,["303"] = 247,["304"] = 247,["305"] = 249,["306"] = 250,["307"] = 251,["308"] = 251,["309"] = 251,["310"] = 251,["312"] = 256,["314"] = 259,["315"] = 260,["316"] = 261,["318"] = 263,["319"] = 264,["320"] = 265,["321"] = 266,["322"] = 267,["324"] = 269,["326"] = 272,["327"] = 273,["329"] = 276,["330"] = 277,["332"] = 280,["333"] = 281,["334"] = 282,["335"] = 282,["336"] = 282,["337"] = 282,["338"] = 282,["340"] = 231,["341"] = 290,["342"] = 296,["343"] = 296,["344"] = 296,["345"] = 296,["346"] = 296,["347"] = 296,["348"] = 296,["349"] = 303,["350"] = 290,["351"] = 313,["352"] = 314,["353"] = 316,["355"] = 317,["356"] = 318,["357"] = 319,["358"] = 320,["360"] = 322,["362"] = 325,["363"] = 331,["364"] = 332,["366"] = 335,["367"] = 335,["368"] = 335,["369"] = 335,["370"] = 336,["371"] = 336,["372"] = 336,["373"] = 336,["374"] = 336,["375"] = 336,["376"] = 336,["377"] = 336,["378"] = 336,["382"] = 346,["383"] = 313,["384"] = 349,["385"] = 350,["388"] = 351,["389"] = 352,["390"] = 354,["391"] = 355,["392"] = 356,["394"] = 359,["395"] = 360,["396"] = 361,["398"] = 349,["399"] = 365,["400"] = 366,["401"] = 367,["402"] = 369,["403"] = 370,["404"] = 371,["405"] = 372,["406"] = 373,["407"] = 374,["408"] = 375,["409"] = 376,["411"] = 378,["412"] = 378,["413"] = 378,["414"] = 378,["415"] = 379,["416"] = 379,["417"] = 379,["418"] = 379,["419"] = 380,["424"] = 386,["425"] = 387,["428"] = 388,["429"] = 390,["430"] = 391,["433"] = 393,["434"] = 394,["435"] = 399,["436"] = 401,["437"] = 402,["438"] = 403,["439"] = 404,["440"] = 405,["441"] = 406,["442"] = 407,["443"] = 408,["444"] = 409,["448"] = 414,["449"] = 415,["451"] = 417,["452"] = 418,["453"] = 419,["454"] = 420,["455"] = 422,["456"] = 423,["457"] = 424,["459"] = 365,["460"] = 432,["461"] = 433,["462"] = 434,["463"] = 435,["464"] = 436,["468"] = 440,["469"] = 441,["470"] = 441,["471"] = 441,["472"] = 441,["473"] = 441,["474"] = 441,["475"] = 441,["476"] = 442,["477"] = 443,["478"] = 444,["479"] = 445,["483"] = 449,["484"] = 432});
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
    unit:RemoveModifierByName("modifier_evo_world_pause")
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
        runtime.level,
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
