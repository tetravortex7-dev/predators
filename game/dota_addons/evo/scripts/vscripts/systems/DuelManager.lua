local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 18,["24"] = 20,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 32,["32"] = 33,["33"] = 36,["34"] = 36,["35"] = 36,["36"] = 66,["37"] = 66,["38"] = 67,["39"] = 37,["40"] = 38,["41"] = 39,["42"] = 41,["43"] = 42,["44"] = 43,["45"] = 44,["46"] = 46,["47"] = 47,["48"] = 48,["49"] = 49,["50"] = 50,["51"] = 52,["52"] = 55,["53"] = 56,["54"] = 57,["55"] = 58,["56"] = 59,["57"] = 63,["58"] = 65,["59"] = 70,["60"] = 71,["61"] = 72,["62"] = 73,["63"] = 74,["64"] = 76,["65"] = 76,["66"] = 76,["67"] = 76,["68"] = 76,["69"] = 77,["70"] = 77,["71"] = 77,["72"] = 77,["73"] = 77,["74"] = 79,["75"] = 79,["76"] = 79,["77"] = 80,["78"] = 79,["79"] = 79,["80"] = 82,["81"] = 82,["82"] = 82,["83"] = 83,["84"] = 83,["85"] = 83,["86"] = 83,["87"] = 83,["88"] = 83,["89"] = 83,["90"] = 83,["91"] = 82,["92"] = 82,["93"] = 93,["94"] = 93,["95"] = 93,["96"] = 93,["97"] = 93,["98"] = 94,["99"] = 93,["100"] = 93,["101"] = 96,["102"] = 96,["103"] = 96,["104"] = 97,["105"] = 98,["106"] = 96,["107"] = 96,["108"] = 100,["109"] = 100,["110"] = 100,["111"] = 100,["112"] = 100,["113"] = 100,["114"] = 100,["115"] = 100,["116"] = 100,["117"] = 101,["118"] = 102,["120"] = 100,["121"] = 100,["122"] = 106,["123"] = 70,["124"] = 109,["125"] = 110,["126"] = 109,["127"] = 113,["128"] = 114,["129"] = 113,["130"] = 117,["131"] = 118,["132"] = 119,["133"] = 120,["134"] = 121,["135"] = 123,["136"] = 123,["137"] = 123,["138"] = 123,["139"] = 123,["141"] = 117,["142"] = 131,["143"] = 132,["144"] = 132,["146"] = 133,["147"] = 135,["148"] = 136,["149"] = 137,["151"] = 139,["152"] = 140,["153"] = 141,["154"] = 142,["156"] = 144,["158"] = 146,["160"] = 148,["161"] = 149,["163"] = 151,["165"] = 153,["167"] = 156,["168"] = 157,["169"] = 158,["171"] = 161,["172"] = 131,["173"] = 164,["174"] = 165,["175"] = 167,["176"] = 170,["177"] = 171,["178"] = 172,["182"] = 177,["183"] = 178,["184"] = 179,["187"] = 183,["188"] = 184,["189"] = 185,["190"] = 186,["191"] = 187,["192"] = 164,["193"] = 190,["194"] = 191,["195"] = 192,["196"] = 192,["198"] = 194,["199"] = 195,["200"] = 195,["202"] = 197,["203"] = 198,["204"] = 198,["206"] = 200,["207"] = 201,["208"] = 202,["209"] = 204,["210"] = 204,["211"] = 204,["212"] = 204,["213"] = 204,["214"] = 204,["215"] = 204,["216"] = 204,["217"] = 211,["218"] = 212,["219"] = 212,["220"] = 212,["221"] = 212,["222"] = 212,["223"] = 212,["224"] = 212,["225"] = 220,["226"] = 221,["227"] = 222,["228"] = 223,["229"] = 225,["230"] = 225,["231"] = 225,["232"] = 225,["233"] = 228,["234"] = 190,["235"] = 231,["236"] = 232,["239"] = 234,["240"] = 235,["241"] = 236,["242"] = 237,["243"] = 238,["244"] = 240,["245"] = 241,["246"] = 242,["248"] = 244,["249"] = 246,["250"] = 247,["251"] = 249,["252"] = 250,["253"] = 256,["254"] = 257,["255"] = 259,["256"] = 259,["257"] = 259,["258"] = 259,["259"] = 231,["260"] = 266,["261"] = 267,["264"] = 269,["265"] = 270,["266"] = 271,["267"] = 272,["268"] = 273,["269"] = 274,["270"] = 276,["271"] = 277,["272"] = 266,["273"] = 280,["274"] = 281,["277"] = 282,["278"] = 283,["279"] = 284,["280"] = 285,["281"] = 286,["284"] = 290,["285"] = 291,["286"] = 292,["287"] = 280,["288"] = 295,["289"] = 296,["290"] = 297,["291"] = 298,["292"] = 299,["294"] = 301,["298"] = 306,["299"] = 307,["300"] = 308,["302"] = 310,["303"] = 311,["304"] = 312,["308"] = 317,["309"] = 318,["310"] = 319,["311"] = 320,["312"] = 321,["313"] = 322,["316"] = 326,["317"] = 327,["320"] = 329,["321"] = 330,["322"] = 331,["323"] = 331,["324"] = 331,["325"] = 331,["326"] = 331,["327"] = 331,["328"] = 331,["329"] = 331,["330"] = 331,["331"] = 331,["332"] = 337,["333"] = 337,["334"] = 337,["335"] = 337,["336"] = 337,["337"] = 337,["338"] = 337,["339"] = 337,["340"] = 338,["341"] = 340,["342"] = 341,["343"] = 342,["344"] = 343,["345"] = 295,["346"] = 346,["347"] = 347,["348"] = 348,["349"] = 349,["350"] = 350,["351"] = 351,["352"] = 352,["353"] = 353,["354"] = 354,["355"] = 355,["356"] = 346,["357"] = 358,["358"] = 359,["359"] = 360,["360"] = 361,["361"] = 362,["362"] = 363,["363"] = 364,["366"] = 368,["367"] = 370,["368"] = 370,["369"] = 370,["370"] = 370,["371"] = 370,["372"] = 370,["373"] = 370,["374"] = 370,["375"] = 371,["376"] = 371,["377"] = 371,["378"] = 371,["379"] = 371,["380"] = 371,["381"] = 371,["382"] = 371,["383"] = 372,["384"] = 374,["385"] = 375,["386"] = 376,["387"] = 377,["388"] = 377,["389"] = 377,["390"] = 377,["391"] = 358,["392"] = 380,["393"] = 381,["396"] = 383,["397"] = 384,["400"] = 386,["401"] = 392,["402"] = 393,["403"] = 394,["404"] = 395,["406"] = 380,["407"] = 399,["408"] = 400,["411"] = 402,["412"] = 403,["413"] = 404,["414"] = 405,["415"] = 406,["416"] = 408,["417"] = 409,["419"] = 411,["420"] = 413,["421"] = 414,["422"] = 415,["423"] = 416,["425"] = 418,["426"] = 420,["427"] = 422,["428"] = 425,["429"] = 431,["430"] = 433,["431"] = 434,["432"] = 435,["433"] = 435,["434"] = 435,["435"] = 435,["437"] = 437,["439"] = 440,["440"] = 441,["441"] = 442,["442"] = 443,["443"] = 444,["444"] = 445,["445"] = 446,["449"] = 450,["452"] = 454,["453"] = 455,["455"] = 457,["456"] = 458,["458"] = 399,["459"] = 462,["460"] = 463,["461"] = 464,["462"] = 465,["463"] = 466,["464"] = 468,["465"] = 469,["466"] = 462,["467"] = 472,["468"] = 473,["469"] = 474,["472"] = 475,["473"] = 472,["474"] = 478,["475"] = 479,["476"] = 479,["477"] = 479,["478"] = 479,["479"] = 479,["480"] = 479,["481"] = 479,["482"] = 479,["483"] = 479,["484"] = 479,["485"] = 479,["486"] = 478});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____duel_arena = require("systems.duel.duel_arena")
local applyWorldPause = ____duel_arena.applyWorldPause
local broadcastDuelEvent = ____duel_arena.broadcastDuelEvent
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local releaseWorldPause = ____duel_arena.releaseWorldPause
local restoreDuelistAfterDuel = ____duel_arena.restoreDuelistAfterDuel
local syncDuelNetState = ____duel_arena.syncDuelNetState
local ____duel_boss = require("systems.duel.duel_boss")
local evaluateActiveDuelKill = ____duel_boss.evaluateActiveDuelKill
local prepareBossChallengers = ____duel_boss.prepareBossChallengers
local processDuelBetPlacement = ____duel_boss.processDuelBetPlacement
local spawnDevSparringDummy = ____duel_boss.spawnDevSparringDummy
local ____duel_types = require("systems.duel.duel_types")
local DUEL_BET_WINDOW_SECONDS = ____duel_types.DUEL_BET_WINDOW_SECONDS
local debugDuelChat = ____duel_types.debugDuelChat
local discoverArenaLocations = ____duel_types.discoverArenaLocations
local generateDuelPairs = ____duel_types.generateDuelPairs
local getTeamPlayerIds = ____duel_types.getTeamPlayerIds
local pickWeightedBossDuelTeam = ____duel_types.pickWeightedBossDuelTeam
local pickWeightedChampion = ____duel_types.pickWeightedChampion
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
    self.activeDuelistEntIndexes = __TS__New(Set)
    self.snapshots = __TS__New(Map)
    self.applicants = __TS__New(Set)
    self.activeBets = __TS__New(Map)
    self.pausedEntIndexes = __TS__New(Set)
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
        "tiebreaker_requested",
        function(____, ____bindingPattern0)
            local tiedTeams
            tiedTeams = ____bindingPattern0.tiedTeams
            self:startTiebreaker(tiedTeams)
        end
    )
    self.eventBus:on(
        "match_ended",
        function()
            self.matchEnded = true
            releaseWorldPause(nil, self.pausedEntIndexes)
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
            self:finishCurrentDuel(nil, nil)
        else
            self:syncDuelState()
        end
        return 1
    end
    if not self.isTiebreaker and self.roundIndex < EVO_CONSTANTS.DUEL_MAX_ROUNDS and now >= self.nextDuelTime then
        self.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
        self:startRegularDuelSeries()
    end
    return 1
end
function DuelManager.prototype.startRegularDuelSeries(self)
    local nextRound = self.roundIndex + 1
    if nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS == 0 and self.bossManager:getStrongestAliveBoss() ~= nil then
        local team = pickWeightedBossDuelTeam(nil, self.applicants)
        if team ~= nil and self:startBossArenaDuel(team) then
            self.applicants:clear()
            return
        end
    end
    local ____pairs = generateDuelPairs(nil, self.applicants)
    if #____pairs == 0 then
        debugDuelChat(nil, "[Evo] Duel skipped: not enough teams.")
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
    applyWorldPause(nil, self.activeDuelistEntIndexes, self.pausedEntIndexes)
    self.eventBus:emit("duel_started", {roundIndex = self.roundIndex, isTiebreaker = false})
    broadcastDuelEvent(nil, "started")
    self:syncDuelState()
    debugDuelChat(
        nil,
        ((((((("[Evo] BOSS ARENA! Team " .. tostring(challengingTeam)) .. " vs ") .. bossInfo.bossId) .. " (Lv.") .. tostring(bossInfo.level)) .. ") — ") .. tostring(EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS)) .. "s!"
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
    releaseWorldPause(nil, self.pausedEntIndexes)
    local leadWinner = teamWon and bossDuel.challengerIds[1] or nil
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = leadWinner, loserId = nil, isTiebreaker = false})
    broadcastDuelEvent(nil, "finished", leadWinner)
    self:syncDuelState()
    debugDuelChat(
        nil,
        teamWon and ((("[Evo] Team " .. tostring(bossDuel.challengingTeam)) .. " defeated ") .. bossDuel.bossId) .. " in the Boss Arena!" or ("[Evo] " .. bossDuel.bossId) .. " crushed the challengers and entered COURAGE mode!"
    )
end
function DuelManager.prototype.startTiebreaker(self, tiedTeams)
    if self.matchEnded or #tiedTeams < 2 then
        return
    end
    self.isTiebreaker = true
    self.tiebreakerTeams = {tiedTeams[1], tiedTeams[2]}
    self.tiebreakerWins:clear()
    self.tiebreakerWins:set(tiedTeams[1], 0)
    self.tiebreakerWins:set(tiedTeams[2], 0)
    self.pendingPairs = {}
    debugDuelChat(nil, "[Evo] TIEBREAKER Bo3 started!")
    self:queueNextTiebreakerPair()
end
function DuelManager.prototype.queueNextTiebreakerPair(self)
    if not self.tiebreakerTeams then
        return
    end
    local teamA, teamB = unpack(self.tiebreakerTeams)
    local playerA = pickWeightedChampion(nil, teamA, self.applicants)
    local playerB = pickWeightedChampion(nil, teamB, self.applicants)
    if playerA == nil or playerB == nil then
        self:finishTiebreaker(playerA ~= nil and teamA or teamB)
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.pendingPairs = {{playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}}
    self:beginNextPair()
end
function DuelManager.prototype.triggerDevDuel(self, playerId, args)
    local sub = string.lower(args[1] or "")
    if self.active then
        if self.activeBossDuel then
            self:finalizeBossDuel(false)
        else
            self:finishCurrentDuel(playerId, nil)
        end
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
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
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
    prepareDuelistSnapshot(
        nil,
        playerId,
        self.spawnA,
        self.spawnB,
        self.snapshots,
        self.activeDuelistEntIndexes
    )
    self.sparringDummy = spawnDevSparringDummy(nil, hero, self.spawnB, self.activeDuelistEntIndexes)
    applyWorldPause(nil, self.activeDuelistEntIndexes, self.pausedEntIndexes)
    broadcastDuelEvent(nil, "started")
    self:syncDuelState()
    debugDuelChat(nil, "[Evo] Dev solo duel started on arena!")
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
        releaseWorldPause(nil, self.pausedEntIndexes)
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
    applyWorldPause(nil, self.activeDuelistEntIndexes, self.pausedEntIndexes)
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
        self:finishCurrentDuel(outcome.winnerId, outcome.loserId)
    end
end
function DuelManager.prototype.finishCurrentDuel(self, winnerId, loserId)
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
    settleBets(nil, self.activeBets, winnerId)
    if pair then
        restoreDuelistAfterDuel(nil, pair.playerA, winnerId == pair.playerA, self.snapshots)
        restoreDuelistAfterDuel(nil, pair.playerB, winnerId == pair.playerB, self.snapshots)
    end
    self.snapshots:clear()
    local validWinner = winnerId ~= nil and PlayerResource:IsValidPlayerID(winnerId) and winnerId or nil
    local validLoser = loserId ~= nil and PlayerResource:IsValidPlayerID(loserId) and loserId or nil
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
    if self.isTiebreaker and self.tiebreakerTeams then
        if validWinner ~= nil then
            local winTeam = PlayerResource:GetTeam(validWinner)
            local newWins = (self.tiebreakerWins:get(winTeam) or 0) + 1
            self.tiebreakerWins:set(winTeam, newWins)
            if newWins >= 2 then
                self:finishTiebreaker(winTeam)
                return
            end
        end
        self:queueNextTiebreakerPair()
        return
    end
    if #self.pendingPairs > 0 then
        self:beginNextPair()
    else
        releaseWorldPause(nil, self.pausedEntIndexes)
        self:syncDuelState()
    end
end
function DuelManager.prototype.finishTiebreaker(self, winnerTeam)
    self.isTiebreaker = false
    self.tiebreakerTeams = nil
    releaseWorldPause(nil, self.pausedEntIndexes)
    self:syncDuelState()
    self.eventBus:emit("match_ended", {winnerTeam = winnerTeam, reason = "tiebreaker"})
    GameRules:SetGameWinner(winnerTeam)
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
        tiebreakerWins = self.tiebreakerWins
    })
end
return ____exports
