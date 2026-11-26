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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 6,["25"] = 7,["26"] = 8,["27"] = 9,["28"] = 10,["29"] = 11,["30"] = 13,["31"] = 15,["32"] = 16,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 20,["37"] = 21,["38"] = 23,["39"] = 24,["40"] = 25,["41"] = 26,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 39,["46"] = 39,["47"] = 30,["48"] = 31,["49"] = 32,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 37,["55"] = 39,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 47,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 50,["76"] = 50,["77"] = 50,["78"] = 51,["79"] = 52,["80"] = 52,["82"] = 50,["83"] = 50,["84"] = 56,["85"] = 56,["86"] = 56,["87"] = 56,["88"] = 56,["89"] = 57,["90"] = 58,["92"] = 56,["93"] = 56,["94"] = 62,["95"] = 62,["96"] = 62,["97"] = 62,["98"] = 62,["99"] = 62,["100"] = 62,["101"] = 63,["102"] = 64,["104"] = 62,["105"] = 62,["106"] = 41,["107"] = 69,["108"] = 70,["109"] = 71,["110"] = 72,["112"] = 69,["113"] = 76,["114"] = 77,["115"] = 78,["117"] = 79,["118"] = 80,["119"] = 80,["121"] = 81,["122"] = 82,["127"] = 85,["128"] = 76,["129"] = 88,["130"] = 89,["131"] = 90,["132"] = 90,["134"] = 91,["135"] = 92,["136"] = 92,["138"] = 94,["139"] = 95,["140"] = 96,["141"] = 98,["142"] = 98,["143"] = 98,["144"] = 98,["145"] = 98,["146"] = 98,["147"] = 98,["148"] = 99,["149"] = 100,["151"] = 102,["152"] = 102,["153"] = 103,["154"] = 104,["155"] = 105,["157"] = 102,["161"] = 108,["162"] = 108,["163"] = 109,["164"] = 110,["165"] = 111,["167"] = 108,["170"] = 115,["171"] = 116,["172"] = 117,["173"] = 118,["174"] = 119,["175"] = 88,["176"] = 122,["177"] = 123,["178"] = 124,["181"] = 125,["182"] = 126,["185"] = 128,["186"] = 129,["187"] = 131,["188"] = 132,["189"] = 137,["191"] = 122,["192"] = 141,["193"] = 142,["194"] = 145,["195"] = 145,["196"] = 145,["198"] = 147,["199"] = 147,["201"] = 148,["202"] = 149,["203"] = 150,["204"] = 150,["206"] = 152,["207"] = 153,["208"] = 154,["209"] = 155,["210"] = 157,["211"] = 157,["212"] = 157,["213"] = 157,["214"] = 157,["215"] = 157,["216"] = 157,["217"] = 157,["218"] = 157,["219"] = 157,["220"] = 157,["221"] = 157,["222"] = 157,["223"] = 157,["224"] = 171,["226"] = 174,["227"] = 175,["231"] = 147,["234"] = 179,["235"] = 180,["236"] = 181,["237"] = 181,["238"] = 181,["239"] = 181,["240"] = 181,["242"] = 141,["243"] = 189,["244"] = 190,["245"] = 191,["246"] = 191,["248"] = 192,["249"] = 193,["250"] = 193,["252"] = 194,["253"] = 195,["254"] = 195,["255"] = 195,["256"] = 195,["257"] = 196,["258"] = 189,["259"] = 199,["260"] = 200,["261"] = 201,["262"] = 204,["263"] = 209,["264"] = 210,["265"] = 211,["266"] = 212,["269"] = 216,["270"] = 216,["271"] = 216,["272"] = 216,["273"] = 216,["274"] = 216,["275"] = 216,["276"] = 223,["277"] = 224,["280"] = 225,["281"] = 216,["282"] = 216,["283"] = 199,["284"] = 230,["285"] = 236,["286"] = 237,["287"] = 238,["288"] = 239,["289"] = 240,["290"] = 241,["291"] = 242,["292"] = 243,["293"] = 244,["294"] = 245,["295"] = 245,["296"] = 245,["297"] = 245,["298"] = 245,["299"] = 245,["300"] = 246,["301"] = 246,["302"] = 246,["303"] = 246,["304"] = 248,["305"] = 249,["306"] = 250,["307"] = 250,["308"] = 250,["309"] = 250,["311"] = 255,["313"] = 258,["314"] = 259,["315"] = 260,["317"] = 262,["318"] = 263,["319"] = 264,["320"] = 265,["321"] = 266,["323"] = 268,["325"] = 271,["326"] = 272,["328"] = 275,["329"] = 276,["331"] = 279,["332"] = 280,["333"] = 281,["334"] = 281,["335"] = 281,["336"] = 281,["337"] = 281,["339"] = 230,["340"] = 289,["341"] = 295,["342"] = 295,["343"] = 295,["344"] = 295,["345"] = 295,["346"] = 295,["347"] = 295,["348"] = 302,["349"] = 289,["350"] = 312,["351"] = 313,["352"] = 315,["354"] = 316,["355"] = 317,["356"] = 318,["357"] = 319,["359"] = 321,["361"] = 324,["362"] = 330,["363"] = 331,["365"] = 334,["366"] = 334,["367"] = 334,["368"] = 334,["369"] = 335,["370"] = 335,["371"] = 335,["372"] = 335,["373"] = 335,["374"] = 335,["375"] = 335,["376"] = 335,["377"] = 335,["381"] = 345,["382"] = 312,["383"] = 348,["384"] = 349,["387"] = 350,["388"] = 351,["389"] = 353,["390"] = 354,["391"] = 355,["393"] = 358,["394"] = 359,["395"] = 360,["397"] = 348,["398"] = 364,["399"] = 365,["400"] = 366,["401"] = 368,["402"] = 369,["403"] = 370,["404"] = 371,["405"] = 372,["406"] = 373,["407"] = 374,["408"] = 375,["409"] = 376,["410"] = 377,["411"] = 378,["412"] = 378,["413"] = 380,["414"] = 380,["415"] = 380,["416"] = 380,["417"] = 380,["418"] = 380,["419"] = 378,["420"] = 378,["423"] = 390,["424"] = 390,["425"] = 390,["426"] = 390,["427"] = 391,["428"] = 391,["429"] = 391,["430"] = 391,["431"] = 392,["436"] = 398,["437"] = 399,["440"] = 400,["441"] = 402,["442"] = 403,["445"] = 405,["446"] = 406,["447"] = 411,["448"] = 413,["449"] = 414,["450"] = 415,["451"] = 416,["452"] = 417,["453"] = 418,["454"] = 419,["455"] = 420,["456"] = 421,["460"] = 426,["461"] = 427,["463"] = 429,["464"] = 430,["465"] = 431,["466"] = 432,["467"] = 434,["468"] = 435,["469"] = 436,["471"] = 364,["472"] = 444,["473"] = 445,["474"] = 446,["475"] = 447,["476"] = 448,["480"] = 452,["481"] = 453,["482"] = 453,["483"] = 453,["484"] = 453,["485"] = 453,["486"] = 453,["487"] = 453,["488"] = 454,["489"] = 455,["490"] = 456,["491"] = 457,["495"] = 461,["496"] = 444});
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
