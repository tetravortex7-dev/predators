local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 8,["18"] = 9,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 21,["29"] = 23,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 33,["35"] = 34,["36"] = 35,["37"] = 36,["38"] = 37,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 75,["43"] = 75,["44"] = 75,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 45,["49"] = 46,["50"] = 47,["51"] = 48,["52"] = 51,["53"] = 52,["54"] = 53,["55"] = 54,["56"] = 55,["57"] = 57,["58"] = 58,["59"] = 59,["60"] = 60,["61"] = 63,["62"] = 64,["63"] = 65,["64"] = 66,["65"] = 67,["66"] = 68,["67"] = 69,["68"] = 70,["69"] = 73,["70"] = 75,["71"] = 77,["72"] = 78,["73"] = 79,["74"] = 80,["75"] = 81,["76"] = 83,["77"] = 83,["78"] = 83,["79"] = 83,["80"] = 83,["81"] = 84,["82"] = 84,["83"] = 84,["84"] = 84,["85"] = 84,["86"] = 86,["87"] = 86,["88"] = 86,["89"] = 86,["90"] = 89,["91"] = 89,["92"] = 89,["93"] = 90,["94"] = 90,["95"] = 90,["96"] = 90,["97"] = 90,["98"] = 90,["99"] = 89,["100"] = 89,["101"] = 100,["102"] = 100,["103"] = 100,["104"] = 101,["105"] = 100,["106"] = 100,["107"] = 103,["108"] = 103,["109"] = 103,["110"] = 103,["111"] = 103,["112"] = 103,["113"] = 103,["114"] = 103,["115"] = 103,["116"] = 104,["117"] = 104,["119"] = 103,["120"] = 103,["121"] = 107,["122"] = 77,["123"] = 110,["124"] = 111,["125"] = 110,["126"] = 114,["127"] = 115,["128"] = 114,["129"] = 118,["130"] = 119,["131"] = 120,["132"] = 120,["133"] = 120,["134"] = 120,["135"] = 118,["136"] = 123,["137"] = 124,["138"] = 125,["139"] = 126,["140"] = 127,["141"] = 129,["142"] = 129,["143"] = 129,["144"] = 129,["145"] = 129,["147"] = 123,["148"] = 137,["149"] = 138,["150"] = 138,["152"] = 139,["153"] = 141,["154"] = 142,["155"] = 143,["157"] = 145,["158"] = 146,["159"] = 147,["160"] = 148,["162"] = 150,["164"] = 152,["166"] = 154,["167"] = 155,["168"] = 159,["169"] = 160,["171"] = 162,["173"] = 164,["175"] = 167,["176"] = 168,["177"] = 169,["178"] = 169,["179"] = 169,["180"] = 169,["181"] = 169,["182"] = 173,["183"] = 173,["184"] = 173,["185"] = 169,["186"] = 169,["187"] = 175,["188"] = 176,["189"] = 177,["192"] = 180,["193"] = 181,["194"] = 182,["195"] = 183,["197"] = 185,["198"] = 186,["200"] = 188,["203"] = 192,["204"] = 137,["205"] = 195,["206"] = 196,["207"] = 197,["208"] = 201,["211"] = 203,["212"] = 204,["213"] = 205,["215"] = 212,["218"] = 215,["219"] = 216,["220"] = 195,["221"] = 219,["222"] = 220,["223"] = 222,["224"] = 226,["225"] = 227,["226"] = 228,["227"] = 229,["228"] = 230,["229"] = 231,["233"] = 236,["234"] = 236,["235"] = 236,["236"] = 236,["237"] = 243,["238"] = 247,["239"] = 248,["240"] = 249,["241"] = 251,["242"] = 252,["243"] = 253,["246"] = 257,["247"] = 258,["248"] = 259,["249"] = 260,["250"] = 261,["251"] = 219,["252"] = 264,["253"] = 265,["254"] = 266,["255"] = 267,["256"] = 268,["258"] = 264,["259"] = 272,["260"] = 273,["261"] = 274,["262"] = 274,["263"] = 274,["264"] = 274,["265"] = 274,["266"] = 274,["267"] = 274,["268"] = 274,["269"] = 274,["270"] = 274,["271"] = 274,["272"] = 283,["273"] = 284,["274"] = 285,["275"] = 286,["276"] = 274,["277"] = 274,["278"] = 274,["279"] = 274,["280"] = 290,["281"] = 290,["283"] = 291,["284"] = 292,["285"] = 293,["286"] = 272,["287"] = 296,["288"] = 297,["291"] = 298,["292"] = 299,["293"] = 300,["294"] = 301,["295"] = 302,["296"] = 303,["297"] = 303,["298"] = 303,["299"] = 303,["300"] = 303,["301"] = 303,["302"] = 303,["303"] = 303,["304"] = 303,["305"] = 312,["306"] = 296,["307"] = 315,["308"] = 316,["309"] = 317,["310"] = 318,["311"] = 315,["312"] = 321,["313"] = 322,["314"] = 323,["315"] = 324,["316"] = 325,["318"] = 327,["322"] = 332,["323"] = 333,["324"] = 334,["325"] = 335,["326"] = 336,["327"] = 337,["330"] = 341,["331"] = 342,["332"] = 343,["334"] = 345,["335"] = 346,["336"] = 347,["340"] = 352,["341"] = 353,["342"] = 354,["343"] = 355,["344"] = 356,["345"] = 357,["348"] = 361,["349"] = 362,["350"] = 363,["351"] = 363,["352"] = 363,["353"] = 363,["354"] = 363,["355"] = 364,["356"] = 364,["357"] = 364,["358"] = 364,["359"] = 364,["360"] = 364,["361"] = 364,["362"] = 371,["363"] = 372,["364"] = 321,["365"] = 375,["366"] = 376,["367"] = 377,["368"] = 378,["369"] = 379,["370"] = 380,["371"] = 381,["372"] = 382,["373"] = 383,["374"] = 384,["375"] = 375,["376"] = 387,["377"] = 388,["378"] = 389,["379"] = 390,["380"] = 391,["381"] = 392,["384"] = 396,["385"] = 398,["386"] = 400,["387"] = 400,["388"] = 400,["389"] = 400,["390"] = 400,["391"] = 400,["392"] = 400,["393"] = 400,["394"] = 401,["395"] = 401,["396"] = 401,["397"] = 401,["398"] = 401,["399"] = 401,["400"] = 401,["401"] = 401,["402"] = 403,["403"] = 404,["404"] = 405,["405"] = 406,["406"] = 406,["407"] = 406,["408"] = 406,["409"] = 387,["410"] = 409,["411"] = 410,["414"] = 412,["415"] = 413,["418"] = 415,["419"] = 421,["420"] = 422,["421"] = 423,["422"] = 424,["424"] = 409,["425"] = 428,["426"] = 431,["427"] = 431,["429"] = 433,["432"] = 435,["433"] = 436,["434"] = 437,["435"] = 438,["436"] = 439,["437"] = 440,["438"] = 441,["439"] = 443,["440"] = 443,["441"] = 443,["442"] = 443,["443"] = 443,["444"] = 443,["445"] = 443,["446"] = 443,["447"] = 443,["448"] = 443,["449"] = 443,["450"] = 443,["451"] = 443,["452"] = 443,["453"] = 443,["454"] = 457,["455"] = 464,["456"] = 465,["458"] = 467,["460"] = 428,["461"] = 471,["462"] = 472,["463"] = 473,["466"] = 474,["467"] = 471,["468"] = 477,["469"] = 478,["470"] = 478,["471"] = 478,["472"] = 478,["473"] = 478,["474"] = 478,["475"] = 478,["476"] = 478,["477"] = 478,["478"] = 478,["479"] = 478,["480"] = 478,["481"] = 478,["482"] = 477});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local getDuelIntervalSeconds = ____game_constants.getDuelIntervalSeconds
local ____duel_arena = require("systems.duel.duel_arena")
local broadcastDuelEvent = ____duel_arena.broadcastDuelEvent
local finalizePvpDuelOutcome = ____duel_arena.finalizePvpDuelOutcome
local notifyPreDuelCountdown = ____duel_arena.notifyPreDuelCountdown
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local syncDuelNetState = ____duel_arena.syncDuelNetState
local ____duel_boss = require("systems.duel.duel_boss")
local completeBossArenaDuelState = ____duel_boss.completeBossArenaDuelState
local createDevSparringPair = ____duel_boss.createDevSparringPair
local evaluateActiveDuelKill = ____duel_boss.evaluateActiveDuelKill
local evaluateDuelTimeoutOutcome = ____duel_boss.evaluateDuelTimeoutOutcome
local launchBossArenaDuelState = ____duel_boss.launchBossArenaDuelState
local launchDevSparringFallback = ____duel_boss.launchDevSparringFallback
local prepareDevTestCountdown = ____duel_boss.prepareDevTestCountdown
local processDuelBetPlacement = ____duel_boss.processDuelBetPlacement
local ____duel_types = require("systems.duel.duel_types")
local DUEL_BET_WINDOW_SECONDS = ____duel_types.DUEL_BET_WINDOW_SECONDS
local debugDuelChat = ____duel_types.debugDuelChat
local discoverArenaLocations = ____duel_types.discoverArenaLocations
local generateDuelPairs = ____duel_types.generateDuelPairs
local getActiveDuelPlayerCount = ____duel_types.getActiveDuelPlayerCount
local hasMultiPlayerTeams = ____duel_types.hasMultiPlayerTeams
local isActiveConnectedPlayer = ____duel_types.isActiveConnectedPlayer
local pickWeightedBossDuelTeam = ____duel_types.pickWeightedBossDuelTeam
local resolveAdaptiveWaitDeadline = ____duel_types.resolveAdaptiveWaitDeadline
local resolveSkippedDuelCooldown = ____duel_types.resolveSkippedDuelCooldown
____exports.DuelManager = __TS__Class()
local DuelManager = ____exports.DuelManager
DuelManager.name = "DuelManager"
function DuelManager.prototype.____constructor(self, eventBus, bossManager)
    self.eventBus = eventBus
    self.bossManager = bossManager
    self.spawnA = Vector(-500, 0, 128)
    self.spawnB = Vector(500, 0, 128)
    self.arenaCenter = Vector(0, 0, 128)
    self.started = false
    self.matchEnded = false
    self.roundIndex = 0
    self.nextDuelTime = EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
    self.active = false
    self.isTiebreaker = false
    self.betsOpen = false
    self.duelEndTime = 0
    self.betCloseTime = 0
    self.pendingPairs = {}
    self.preselectedPairs = {}
    self.preselectedForRound = 0
    self.lastCountdownTickSec = -1
    self.lastDuelistIds = __TS__New(Set)
    self.skippedPriorityIds = __TS__New(Set)
    self.activeDuelistEntIndexes = __TS__New(Set)
    self.snapshots = __TS__New(Map)
    self.applicants = __TS__New(Set)
    self.activeBets = __TS__New(Map)
    self.duelWinsByPlayer = __TS__New(Map)
    self.duelLossesByPlayer = __TS__New(Map)
    self.tiebreakerWins = __TS__New(Map)
end
function DuelManager.prototype.init(self)
    local locs = discoverArenaLocations(nil)
    self.arenaCenter = locs.arenaCenter
    self.spawnA = locs.spawnA
    self.spawnB = locs.spawnB
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
    CustomGameEventManager:RegisterListener(
        "evo_duel_apply",
        function(_, event) return self:onDuelApply(event) end
    )
    CustomGameEventManager:RegisterListener(
        "evo_duel_bet",
        function(_, event) return processDuelBetPlacement(nil, {
            event = event,
            active = self.active,
            betsOpen = self.betsOpen,
            activeBossDuel = self.activeBossDuel,
            currentPair = self.currentPair,
            activeBets = self.activeBets
        }) end
    )
    self.eventBus:on(
        "match_ended",
        function()
            self.matchEnded = true
        end
    )
    self.eventBus:on(
        "dev_command",
        function(____, ____bindingPattern0)
            local args
            local command
            local playerId
            playerId = ____bindingPattern0.playerId
            command = ____bindingPattern0.command
            args = ____bindingPattern0.args
            if command == "-evo_duel" then
                self:triggerDevDuel(playerId, args)
            end
        end
    )
    self:syncDuelState()
end
function DuelManager.prototype.isActiveDuelist(self, entity)
    return self.active and self.activeDuelistEntIndexes:has(entity:entindex())
end
function DuelManager.prototype.getArenaCenter(self)
    return self.arenaCenter
end
function DuelManager.prototype.scheduleNextDuelCycle(self, now)
    self.waitCycleStartTime = now
    self.nextDuelTime = now + getDuelIntervalSeconds(
        nil,
        getActiveDuelPlayerCount(nil)
    )
end
function DuelManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        self:scheduleNextDuelCycle(GameRules:GetDOTATime(false, false))
        self:syncDuelState()
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoDuelManagerThink",
            function() return self:onThink() end,
            1
        )
    end
end
function DuelManager.prototype.onThink(self)
    if self.matchEnded then
        return nil
    end
    local now = GameRules:GetDOTATime(false, false)
    if self.active then
        if self.betsOpen and now >= self.betCloseTime then
            self.betsOpen = false
        end
        if self.activeBossDuel then
            local deadline = self.activeBossDuel.lootEndTime or self.duelEndTime
            if now >= deadline then
                self:finalizeBossDuel(self.activeBossDuel.lootEndTime ~= nil)
            else
                self:syncDuelState()
            end
            return 1
        end
        if now >= self.duelEndTime then
            local outcome = evaluateDuelTimeoutOutcome(nil, {currentPair = self.currentPair, sparringDummy = self.sparringDummy})
            local endReason = outcome.winnerId ~= nil and "hp" or "draw"
            self:finishCurrentDuel(outcome.winnerId, outcome.loserId, endReason)
        else
            self:syncDuelState()
        end
        return 1
    end
    if not self.isTiebreaker then
        if self.waitCycleStartTime ~= nil then
            local sync = resolveAdaptiveWaitDeadline(
                nil,
                self.waitCycleStartTime,
                self.nextDuelTime,
                now,
                getDuelIntervalSeconds(
                    nil,
                    getActiveDuelPlayerCount(nil)
                )
            )
            if sync.changed then
                self.nextDuelTime = sync.nextDeadline
                self:resetPreselection()
            end
        end
        local secondsLeft = math.ceil(self.nextDuelTime - now)
        if now >= self.nextDuelTime then
            self:scheduleNextDuelCycle(now)
            self:startRegularDuelSeries()
        else
            if secondsLeft <= EVO_CONSTANTS.DUEL_COUNTDOWN_SECONDS and secondsLeft >= 1 then
                self:tickPreDuelCountdown(secondsLeft)
            end
            self:syncDuelState()
        end
    end
    return 1
end
function DuelManager.prototype.tickPreDuelCountdown(self, secondsLeft)
    local upcomingRound = self.roundIndex + 1
    local willBeBossDuel = hasMultiPlayerTeams(nil) and upcomingRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS == 0 and self.bossManager:getStrongestAliveBoss() ~= nil
    if willBeBossDuel then
        return
    end
    if self.preselectedForRound ~= upcomingRound then
        self.preselectedForRound = upcomingRound
        self.preselectedPairs = generateDuelPairs(nil, self.applicants, self.lastDuelistIds, self.skippedPriorityIds)
    end
    if #self.preselectedPairs == 0 or secondsLeft == self.lastCountdownTickSec then
        return
    end
    self.lastCountdownTickSec = secondsLeft
    notifyPreDuelCountdown(nil, self.preselectedPairs[1], secondsLeft)
end
function DuelManager.prototype.startRegularDuelSeries(self)
    local nextRound = self.roundIndex + 1
    if hasMultiPlayerTeams(nil) and nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS == 0 and self.bossManager:getStrongestAliveBoss() ~= nil then
        local team = pickWeightedBossDuelTeam(nil, self.applicants, self.lastDuelistIds)
        if team ~= nil and self:startBossArenaDuel(team) then
            self.preselectedPairs = {}
            self.preselectedForRound = 0
            self.lastCountdownTickSec = -1
            self.applicants:clear()
            return
        end
    end
    local preselected = __TS__ArrayFilter(
        self.preselectedPairs,
        function(____, pair) return isActiveConnectedPlayer(nil, pair.playerA) and isActiveConnectedPlayer(nil, pair.playerB) and not self.lastDuelistIds:has(pair.playerA) and not self.lastDuelistIds:has(pair.playerB) end
    )
    local ____pairs = #preselected > 0 and preselected or generateDuelPairs(nil, self.applicants, self.lastDuelistIds, self.skippedPriorityIds)
    self.preselectedPairs = {}
    self.preselectedForRound = 0
    self.lastCountdownTickSec = -1
    if #____pairs == 0 then
        resolveSkippedDuelCooldown(nil, self.lastDuelistIds, self.skippedPriorityIds)
        self:syncDuelState()
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self.pendingPairs = ____pairs
    self.applicants:clear()
    self:beginNextPair()
end
function DuelManager.prototype.recordDuelists(self, ids)
    self.lastDuelistIds:clear()
    for ____, pid in ipairs(ids) do
        self.lastDuelistIds:add(pid)
        self.skippedPriorityIds:delete(pid)
    end
end
function DuelManager.prototype.startBossArenaDuel(self, challengingTeam)
    local nextRound = self.roundIndex + 1
    local bossDuel = launchBossArenaDuelState(
        nil,
        {
            challengingTeam = challengingTeam,
            bossManager = self.bossManager,
            spawnA = self.spawnA,
            spawnB = self.spawnB,
            roundIndex = nextRound,
            snapshots = self.snapshots,
            activeDuelistEntIndexes = self.activeDuelistEntIndexes,
            eventBus = self.eventBus,
            onBeginStage = function()
                self.roundIndex = nextRound
                self.isTiebreaker = false
                self:beginActiveStage(true, EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS)
            end,
            onRecordDuelists = function(____, ids) return self:recordDuelists(ids) end
        }
    )
    if not bossDuel then
        return false
    end
    self.activeBossDuel = bossDuel
    self:syncDuelState()
    return true
end
function DuelManager.prototype.finalizeBossDuel(self, teamWon)
    if not self.active or not self.activeBossDuel then
        return
    end
    local bossDuel = self.activeBossDuel
    self.active = false
    self.betsOpen = false
    self.activeBossDuel = nil
    self.activeDuelistEntIndexes:clear()
    completeBossArenaDuelState(nil, {
        bossDuel = bossDuel,
        teamWon = teamWon,
        roundIndex = self.roundIndex,
        activeBets = self.activeBets,
        snapshots = self.snapshots,
        bossManager = self.bossManager,
        eventBus = self.eventBus
    })
    self:syncDuelState()
end
function DuelManager.prototype.resetPreselection(self)
    self.preselectedPairs = {}
    self.preselectedForRound = 0
    self.lastCountdownTickSec = -1
end
function DuelManager.prototype.triggerDevDuel(self, playerId, args)
    local sub = string.lower(args[1] or "")
    if self.active then
        if self.activeBossDuel then
            self:finalizeBossDuel(false)
        else
            self:finishCurrentDuel(playerId, nil, "kill")
        end
        return
    end
    if sub == "test" then
        local res = prepareDevTestCountdown(nil, playerId, args[2])
        self:resetPreselection()
        self.waitCycleStartTime = nil
        self.nextDuelTime = res.nextDuelTime
        self:syncDuelState()
        return
    end
    if sub == "boss" then
        if self.bossManager:getStrongestAliveBoss() == nil then
            self.bossManager:spawnMatchBosses()
        end
        local team = PlayerResource:GetTeam(playerId)
        if not self:startBossArenaDuel(team) then
            debugDuelChat(nil, "[Evo] Waiting for boss spawn — run -evo_duel boss again in 1s.")
        end
        return
    end
    local ____pairs = generateDuelPairs(nil, self.applicants)
    if #____pairs > 0 then
        self.roundIndex = self.roundIndex + 1
        self.isTiebreaker = false
        self.pendingPairs = ____pairs
        self:beginNextPair()
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self:beginActiveStage(
        false,
        EVO_CONSTANTS.DUEL_DURATION_SECONDS,
        createDevSparringPair(nil, playerId)
    )
    self.sparringDummy = launchDevSparringFallback(nil, {
        playerId = playerId,
        spawnA = self.spawnA,
        spawnB = self.spawnB,
        snapshots = self.snapshots,
        activeDuelistEntIndexes = self.activeDuelistEntIndexes
    })
    broadcastDuelEvent(nil, "started")
    self:syncDuelState()
end
function DuelManager.prototype.beginActiveStage(self, betsOpen, durationSeconds, pair)
    self.currentPair = pair
    self.active = true
    self.betsOpen = betsOpen
    self.activeBets:clear()
    self.activeDuelistEntIndexes:clear()
    self.snapshots:clear()
    local now = GameRules:GetDOTATime(false, false)
    self.betCloseTime = now + DUEL_BET_WINDOW_SECONDS
    self.duelEndTime = now + durationSeconds
end
function DuelManager.prototype.beginNextPair(self)
    local nextPair = table.remove(self.pendingPairs, 1)
    if not nextPair then
        self.active = false
        self.currentPair = nil
        self:syncDuelState()
        return
    end
    self:recordDuelists({nextPair.playerA, nextPair.playerB})
    self:beginActiveStage(true, EVO_CONSTANTS.DUEL_DURATION_SECONDS, nextPair)
    prepareDuelistSnapshot(
        nil,
        nextPair.playerA,
        self.spawnA,
        self.spawnB,
        self.snapshots,
        self.activeDuelistEntIndexes
    )
    prepareDuelistSnapshot(
        nil,
        nextPair.playerB,
        self.spawnB,
        self.spawnA,
        self.snapshots,
        self.activeDuelistEntIndexes
    )
    self.eventBus:emit("duel_started", {roundIndex = self.roundIndex, isTiebreaker = self.isTiebreaker})
    broadcastDuelEvent(nil, "started")
    self:syncDuelState()
    debugDuelChat(
        nil,
        ((("[Evo] Duel Round #" .. tostring(self.roundIndex)) .. " started! (") .. tostring(EVO_CONSTANTS.DUEL_DURATION_SECONDS)) .. "s)"
    )
end
function DuelManager.prototype.onEntityKilled(self, event)
    if not self.active then
        return
    end
    local killedIndex = event.entindex_killed
    if not self.activeDuelistEntIndexes:has(killedIndex) then
        return
    end
    local outcome = evaluateActiveDuelKill(nil, {killedIndex = killedIndex, activeBossDuel = self.activeBossDuel, currentPair = self.currentPair, sparringDummy = self.sparringDummy})
    if outcome.kind == "boss_duel_end" then
        self:finalizeBossDuel(outcome.teamWon)
    elseif outcome.kind == "pvp_duel_end" then
        self:finishCurrentDuel(outcome.winnerId, outcome.loserId, "kill")
    end
end
function DuelManager.prototype.finishCurrentDuel(self, winnerId, loserId, reason)
    if reason == nil then
        reason = "kill"
    end
    if not self.active then
        return
    end
    local pair = self.currentPair
    local dummy = self.sparringDummy
    self.active = false
    self.betsOpen = false
    self.currentPair = nil
    self.sparringDummy = nil
    self.activeDuelistEntIndexes:clear()
    local ____finalizePvpDuelOutcome_result_0 = finalizePvpDuelOutcome(nil, {
        winnerId = winnerId,
        loserId = loserId,
        pair = pair,
        sparringDummy = dummy,
        activeBets = self.activeBets,
        snapshots = self.snapshots,
        isTiebreaker = self.isTiebreaker,
        roundIndex = self.roundIndex,
        reason = reason,
        duelWins = self.duelWinsByPlayer,
        duelLosses = self.duelLossesByPlayer
    })
    local validWinner = ____finalizePvpDuelOutcome_result_0.validWinner
    local validLoser = ____finalizePvpDuelOutcome_result_0.validLoser
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = validWinner, loserId = validLoser, isTiebreaker = self.isTiebreaker})
    if #self.pendingPairs > 0 then
        self:beginNextPair()
    else
        self:syncDuelState()
    end
end
function DuelManager.prototype.onDuelApply(self, event)
    local playerId = event.PlayerID
    if self.matchEnded or not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    self.applicants:add(playerId)
end
function DuelManager.prototype.syncDuelState(self)
    syncDuelNetState(nil, {
        active = self.active,
        roundIndex = self.roundIndex,
        nextDuelTime = self.nextDuelTime,
        duelEndTime = self.duelEndTime,
        betsOpen = self.betsOpen,
        isTiebreaker = self.isTiebreaker,
        activeBossDuel = self.activeBossDuel,
        currentPair = self.currentPair,
        tiebreakerWins = self.tiebreakerWins,
        duelWins = self.duelWinsByPlayer,
        duelLosses = self.duelLossesByPlayer
    })
end
return ____exports
