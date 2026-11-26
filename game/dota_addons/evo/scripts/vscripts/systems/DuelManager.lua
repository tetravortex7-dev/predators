local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 12,["20"] = 13,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["27"] = 22,["28"] = 28,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 32,["33"] = 33,["34"] = 34,["35"] = 35,["36"] = 38,["37"] = 38,["38"] = 38,["39"] = 71,["40"] = 71,["41"] = 72,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["49"] = 48,["50"] = 49,["51"] = 50,["52"] = 51,["53"] = 52,["54"] = 54,["55"] = 55,["56"] = 56,["57"] = 57,["58"] = 60,["59"] = 61,["60"] = 62,["61"] = 63,["62"] = 64,["63"] = 65,["64"] = 68,["65"] = 70,["66"] = 75,["67"] = 76,["68"] = 77,["69"] = 78,["70"] = 79,["71"] = 81,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 81,["76"] = 82,["77"] = 82,["78"] = 82,["79"] = 82,["80"] = 82,["81"] = 84,["82"] = 84,["83"] = 84,["84"] = 85,["85"] = 84,["86"] = 84,["87"] = 87,["88"] = 87,["89"] = 87,["90"] = 88,["91"] = 88,["92"] = 88,["93"] = 88,["94"] = 88,["95"] = 88,["96"] = 88,["97"] = 88,["98"] = 87,["99"] = 87,["100"] = 98,["101"] = 98,["102"] = 98,["103"] = 99,["104"] = 98,["105"] = 98,["106"] = 101,["107"] = 101,["108"] = 101,["109"] = 101,["110"] = 101,["111"] = 101,["112"] = 101,["113"] = 101,["114"] = 101,["115"] = 102,["116"] = 103,["118"] = 101,["119"] = 101,["120"] = 107,["121"] = 75,["122"] = 110,["123"] = 111,["124"] = 110,["125"] = 114,["126"] = 115,["127"] = 114,["128"] = 118,["129"] = 119,["130"] = 120,["131"] = 121,["132"] = 122,["133"] = 124,["134"] = 124,["135"] = 124,["136"] = 124,["137"] = 124,["139"] = 118,["140"] = 132,["141"] = 133,["142"] = 133,["144"] = 134,["145"] = 136,["146"] = 137,["147"] = 138,["149"] = 140,["150"] = 141,["151"] = 142,["152"] = 143,["154"] = 145,["156"] = 147,["158"] = 149,["159"] = 150,["160"] = 154,["161"] = 155,["163"] = 157,["165"] = 159,["167"] = 162,["168"] = 163,["169"] = 164,["170"] = 165,["171"] = 166,["173"] = 168,["174"] = 169,["176"] = 171,["179"] = 175,["180"] = 132,["181"] = 178,["182"] = 179,["183"] = 180,["184"] = 184,["187"] = 186,["188"] = 187,["189"] = 188,["191"] = 191,["194"] = 194,["195"] = 195,["196"] = 178,["197"] = 198,["198"] = 199,["199"] = 201,["200"] = 205,["201"] = 206,["202"] = 207,["203"] = 208,["204"] = 209,["205"] = 210,["209"] = 215,["210"] = 215,["211"] = 215,["212"] = 215,["213"] = 220,["214"] = 221,["215"] = 222,["216"] = 223,["217"] = 225,["218"] = 226,["219"] = 227,["222"] = 231,["223"] = 232,["224"] = 233,["225"] = 234,["226"] = 235,["227"] = 198,["228"] = 238,["229"] = 239,["230"] = 240,["231"] = 240,["233"] = 241,["234"] = 242,["235"] = 242,["237"] = 243,["238"] = 244,["239"] = 244,["241"] = 246,["242"] = 247,["243"] = 248,["244"] = 249,["245"] = 249,["246"] = 249,["247"] = 249,["248"] = 249,["249"] = 249,["250"] = 249,["251"] = 249,["252"] = 250,["253"] = 251,["254"] = 251,["255"] = 251,["256"] = 251,["257"] = 251,["258"] = 251,["259"] = 251,["260"] = 258,["261"] = 259,["262"] = 260,["263"] = 261,["264"] = 261,["265"] = 261,["266"] = 261,["267"] = 262,["268"] = 238,["269"] = 265,["270"] = 266,["273"] = 268,["274"] = 269,["275"] = 270,["276"] = 271,["277"] = 272,["278"] = 274,["279"] = 275,["280"] = 276,["282"] = 278,["283"] = 280,["284"] = 282,["285"] = 283,["286"] = 289,["287"] = 290,["288"] = 292,["289"] = 292,["290"] = 292,["291"] = 292,["292"] = 265,["293"] = 299,["294"] = 300,["295"] = 301,["296"] = 302,["297"] = 303,["299"] = 305,["303"] = 310,["304"] = 311,["305"] = 311,["306"] = 311,["307"] = 311,["308"] = 311,["309"] = 311,["310"] = 311,["311"] = 312,["312"] = 313,["313"] = 314,["314"] = 315,["315"] = 316,["316"] = 317,["317"] = 318,["318"] = 318,["319"] = 318,["320"] = 318,["323"] = 326,["324"] = 327,["325"] = 328,["327"] = 330,["328"] = 331,["329"] = 332,["333"] = 337,["334"] = 338,["335"] = 339,["336"] = 340,["337"] = 341,["338"] = 342,["341"] = 346,["342"] = 347,["343"] = 348,["344"] = 348,["345"] = 348,["346"] = 348,["347"] = 348,["348"] = 348,["349"] = 348,["350"] = 348,["351"] = 348,["352"] = 348,["353"] = 354,["354"] = 354,["355"] = 354,["356"] = 354,["357"] = 354,["358"] = 354,["359"] = 354,["360"] = 361,["361"] = 362,["362"] = 299,["363"] = 365,["364"] = 366,["365"] = 367,["366"] = 368,["367"] = 369,["368"] = 370,["369"] = 371,["370"] = 372,["371"] = 373,["372"] = 374,["373"] = 365,["374"] = 377,["375"] = 378,["376"] = 379,["377"] = 380,["378"] = 381,["379"] = 382,["382"] = 386,["383"] = 388,["384"] = 388,["385"] = 388,["386"] = 388,["387"] = 388,["388"] = 388,["389"] = 388,["390"] = 388,["391"] = 389,["392"] = 389,["393"] = 389,["394"] = 389,["395"] = 389,["396"] = 389,["397"] = 389,["398"] = 389,["399"] = 391,["400"] = 392,["401"] = 393,["402"] = 394,["403"] = 394,["404"] = 394,["405"] = 394,["406"] = 377,["407"] = 397,["408"] = 398,["411"] = 400,["412"] = 401,["415"] = 403,["416"] = 409,["417"] = 410,["418"] = 411,["419"] = 412,["421"] = 397,["422"] = 416,["423"] = 419,["424"] = 419,["426"] = 421,["429"] = 423,["430"] = 424,["431"] = 425,["432"] = 426,["433"] = 427,["434"] = 429,["435"] = 430,["437"] = 432,["438"] = 434,["439"] = 435,["440"] = 436,["441"] = 437,["443"] = 439,["444"] = 441,["445"] = 441,["446"] = 441,["447"] = 441,["448"] = 441,["449"] = 441,["450"] = 441,["451"] = 441,["452"] = 441,["453"] = 441,["454"] = 441,["455"] = 441,["456"] = 441,["457"] = 453,["458"] = 459,["459"] = 461,["460"] = 462,["461"] = 463,["462"] = 463,["463"] = 463,["464"] = 463,["466"] = 465,["468"] = 468,["469"] = 469,["471"] = 471,["473"] = 416,["474"] = 475,["475"] = 476,["476"] = 477,["479"] = 478,["480"] = 475,["481"] = 481,["482"] = 482,["483"] = 482,["484"] = 482,["485"] = 482,["486"] = 482,["487"] = 482,["488"] = 482,["489"] = 482,["490"] = 482,["491"] = 482,["492"] = 482,["493"] = 482,["494"] = 482,["495"] = 481});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____duel_arena = require("systems.duel.duel_arena")
local broadcastDuelEvent = ____duel_arena.broadcastDuelEvent
local notifyPreDuelCountdown = ____duel_arena.notifyPreDuelCountdown
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local resolveAndRecordPvpOutcome = ____duel_arena.resolveAndRecordPvpOutcome
local restoreDuelistAfterDuel = ____duel_arena.restoreDuelistAfterDuel
local syncDuelNetState = ____duel_arena.syncDuelNetState
local ____duel_boss = require("systems.duel.duel_boss")
local ensureDevTestBot = ____duel_boss.ensureDevTestBot
local evaluateActiveDuelKill = ____duel_boss.evaluateActiveDuelKill
local evaluateDuelTimeoutOutcome = ____duel_boss.evaluateDuelTimeoutOutcome
local launchDevSparringFallback = ____duel_boss.launchDevSparringFallback
local prepareBossChallengers = ____duel_boss.prepareBossChallengers
local processDuelBetPlacement = ____duel_boss.processDuelBetPlacement
local ____duel_types = require("systems.duel.duel_types")
local DUEL_BET_WINDOW_SECONDS = ____duel_types.DUEL_BET_WINDOW_SECONDS
local debugDuelChat = ____duel_types.debugDuelChat
local discoverArenaLocations = ____duel_types.discoverArenaLocations
local generateDuelPairs = ____duel_types.generateDuelPairs
local getTeamPlayerIds = ____duel_types.getTeamPlayerIds
local hasMultiPlayerTeams = ____duel_types.hasMultiPlayerTeams
local pickWeightedBossDuelTeam = ____duel_types.pickWeightedBossDuelTeam
local settleBets = ____duel_types.settleBets
local settleBossDuelBets = ____duel_types.settleBossDuelBets
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
        function(_, event)
            self:onDuelApply(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_duel_bet",
        function(_, event)
            processDuelBetPlacement(nil, {
                event = event,
                active = self.active,
                betsOpen = self.betsOpen,
                activeBossDuel = self.activeBossDuel,
                currentPair = self.currentPair,
                activeBets = self.activeBets
            })
        end
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
function DuelManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        self.nextDuelTime = GameRules:GetDOTATime(false, false) + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
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
        local secondsLeft = math.ceil(self.nextDuelTime - now)
        if now >= self.nextDuelTime then
            self.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
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
        self.preselectedPairs = generateDuelPairs(nil, self.applicants)
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
        local team = pickWeightedBossDuelTeam(nil, self.applicants)
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
        function(____, pair) return PlayerResource:IsValidPlayerID(pair.playerA) and PlayerResource:IsValidPlayerID(pair.playerB) end
    )
    local ____pairs = #preselected > 0 and preselected or generateDuelPairs(nil, self.applicants)
    self.preselectedPairs = {}
    self.preselectedForRound = 0
    self.lastCountdownTickSec = -1
    if #____pairs == 0 then
        debugDuelChat(nil, "[Evo] Duel skipped: not enough teams.")
        self:syncDuelState()
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self.pendingPairs = ____pairs
    self.applicants:clear()
    self:beginNextPair()
end
function DuelManager.prototype.startBossArenaDuel(self, challengingTeam)
    local bossInfo = self.bossManager:getStrongestAliveBoss()
    if not bossInfo then
        return false
    end
    local challengers = getTeamPlayerIds(nil, challengingTeam)
    if #challengers == 0 then
        return false
    end
    local bossReturnPos = self.bossManager:prepareBossForArena(bossInfo.bossId, self.spawnB, self.spawnA)
    if not bossReturnPos then
        return false
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self:beginActiveStage(true, EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS)
    prepareBossChallengers(
        nil,
        challengers,
        self.spawnA,
        self.spawnB,
        self.snapshots,
        self.activeDuelistEntIndexes
    )
    self.activeDuelistEntIndexes:add(bossInfo.unit:entindex())
    self.activeBossDuel = {
        bossId = bossInfo.bossId,
        bossEntIndex = bossInfo.unit:entindex(),
        bossReturnPos = bossReturnPos,
        challengingTeam = challengingTeam,
        challengerIds = challengers
    }
    self.eventBus:emit("duel_started", {roundIndex = self.roundIndex, isTiebreaker = false})
    broadcastDuelEvent(nil, "started")
    self:syncDuelState()
    debugDuelChat(
        nil,
        ((((("[Evo] BOSS ARENA! Team " .. tostring(challengingTeam)) .. " vs ") .. bossInfo.bossId) .. " (Lv.") .. tostring(bossInfo.level)) .. ")"
    )
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
    settleBossDuelBets(nil, self.activeBets, teamWon)
    for ____, pid in ipairs(bossDuel.challengerIds) do
        restoreDuelistAfterDuel(nil, pid, teamWon, self.snapshots)
    end
    self.snapshots:clear()
    self.bossManager:returnBossFromArena(bossDuel.bossId, bossDuel.bossReturnPos, not teamWon)
    local leadWinner = teamWon and bossDuel.challengerIds[1] or nil
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = leadWinner, loserId = nil, isTiebreaker = false})
    broadcastDuelEvent(nil, "finished", leadWinner)
    self:syncDuelState()
    debugDuelChat(
        nil,
        teamWon and ((("[Evo] Team " .. tostring(bossDuel.challengingTeam)) .. " defeated ") .. bossDuel.bossId) .. " in the Boss Arena!" or ("[Evo] " .. bossDuel.bossId) .. " crushed the challengers and entered COURAGE mode!"
    )
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
        local delay = math.max(
            6,
            math.min(
                30,
                tonumber(args[2]) or 8
            )
        )
        local hasBot = ensureDevTestBot(nil, playerId)
        self.preselectedPairs = {}
        self.preselectedForRound = 0
        self.lastCountdownTickSec = -1
        self.nextDuelTime = GameRules:GetDOTATime(false, false) + delay
        self:syncDuelState()
        debugDuelChat(
            nil,
            hasBot and ("[Evo] Test duel countdown set to " .. tostring(delay)) .. "s vs NoobBot!" or "[Evo] Failed to spawn test bot!"
        )
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
        {
            playerA = playerId,
            playerB = -1,
            teamA = PlayerResource:GetTeam(playerId),
            teamB = 10
        }
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
    self.active = false
    self.betsOpen = false
    self.currentPair = nil
    self.activeDuelistEntIndexes:clear()
    if self.sparringDummy and not self.sparringDummy:IsNull() and IsValidEntity(self.sparringDummy) then
        UTIL_Remove(self.sparringDummy)
    end
    self.sparringDummy = nil
    local totalBetPayout = settleBets(nil, self.activeBets, winnerId)
    if pair then
        restoreDuelistAfterDuel(nil, pair.playerA, winnerId == pair.playerA, self.snapshots)
        restoreDuelistAfterDuel(nil, pair.playerB, winnerId == pair.playerB, self.snapshots)
    end
    self.snapshots:clear()
    local ____resolveAndRecordPvpOutcome_result_0 = resolveAndRecordPvpOutcome(nil, {
        winnerId = winnerId,
        loserId = loserId,
        pair = pair,
        isTiebreaker = self.isTiebreaker,
        roundIndex = self.roundIndex,
        reason = reason,
        totalBetPayout = totalBetPayout,
        duelWins = self.duelWinsByPlayer,
        duelLosses = self.duelLossesByPlayer
    })
    local validWinner = ____resolveAndRecordPvpOutcome_result_0.validWinner
    local validLoser = ____resolveAndRecordPvpOutcome_result_0.validLoser
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = validWinner, loserId = validLoser, isTiebreaker = self.isTiebreaker})
    broadcastDuelEvent(nil, "finished", validWinner)
    if validWinner ~= nil then
        local winnerName = PlayerResource:GetPlayerName(validWinner)
        debugDuelChat(
            nil,
            ("[Evo] Duel winner: " .. (winnerName or "Player " .. tostring(validWinner + 1))) .. "!"
        )
    else
        debugDuelChat(nil, "[Evo] Duel ended in a draw!")
    end
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
