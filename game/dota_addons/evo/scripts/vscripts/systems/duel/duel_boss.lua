local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 7,["18"] = 8,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 18,["23"] = 25,["25"] = 26,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 33,["30"] = 33,["31"] = 33,["32"] = 33,["33"] = 33,["34"] = 33,["35"] = 33,["36"] = 33,["37"] = 26,["40"] = 18,["41"] = 43,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 48,["47"] = 48,["48"] = 48,["49"] = 48,["50"] = 56,["51"] = 57,["52"] = 58,["53"] = 59,["54"] = 60,["57"] = 63,["58"] = 63,["59"] = 63,["60"] = 63,["61"] = 63,["62"] = 63,["63"] = 69,["65"] = 71,["66"] = 43,["67"] = 74,["68"] = 82,["69"] = 83,["72"] = 84,["75"] = 85,["78"] = 87,["79"] = 88,["82"] = 90,["83"] = 91,["86"] = 92,["89"] = 93,["90"] = 94,["93"] = 95,["99"] = 100,["100"] = 101,["103"] = 103,["104"] = 104,["107"] = 106,["108"] = 107,["109"] = 74,["110"] = 119,["111"] = 125,["112"] = 126,["113"] = 127,["115"] = 129,["116"] = 129,["118"] = 131,["119"] = 132,["120"] = 133,["121"] = 134,["122"] = 135,["123"] = 135,["124"] = 135,["125"] = 135,["126"] = 138,["128"] = 140,["129"] = 140,["130"] = 140,["131"] = 141,["132"] = 142,["133"] = 140,["134"] = 140,["135"] = 144,["137"] = 147,["138"] = 147,["140"] = 150,["141"] = 154,["143"] = 157,["144"] = 158,["145"] = 159,["147"] = 165,["148"] = 166,["150"] = 173,["151"] = 119,["152"] = 176,["153"] = 177,["154"] = 178,["156"] = 180,["157"] = 180,["158"] = 180,["159"] = 180,["160"] = 176,["161"] = 183,["162"] = 187,["163"] = 188,["164"] = 189,["166"] = 192,["167"] = 192,["168"] = 193,["170"] = 194,["172"] = 192,["173"] = 196,["174"] = 196,["175"] = 197,["177"] = 198,["179"] = 195,["180"] = 200,["181"] = 201,["182"] = 203,["183"] = 204,["185"] = 207,["186"] = 208,["187"] = 208,["188"] = 208,["189"] = 208,["191"] = 214,["192"] = 214,["193"] = 214,["194"] = 214,["195"] = 183,["196"] = 220,["197"] = 221,["198"] = 222,["200"] = 223,["201"] = 223,["203"] = 224,["204"] = 225,["209"] = 229,["210"] = 229,["211"] = 229,["212"] = 229,["213"] = 230,["214"] = 230,["215"] = 230,["216"] = 230,["217"] = 230,["218"] = 230,["219"] = 230,["220"] = 237,["221"] = 220,["222"] = 240,["223"] = 241,["224"] = 241,["225"] = 241,["226"] = 241,["227"] = 241,["228"] = 241,["229"] = 240,["230"] = 249,["231"] = 256,["232"] = 257,["233"] = 257,["235"] = 258,["236"] = 258,["237"] = 258,["238"] = 258,["239"] = 258,["240"] = 258,["241"] = 258,["242"] = 258,["243"] = 265,["244"] = 249,["245"] = 268,["246"] = 272,["247"] = 272,["248"] = 272,["249"] = 272,["250"] = 272,["251"] = 272,["252"] = 272,["253"] = 273,["254"] = 274,["255"] = 274,["256"] = 274,["257"] = 274,["258"] = 279,["259"] = 279,["260"] = 279,["261"] = 279,["262"] = 279,["263"] = 268,["264"] = 286,["265"] = 298,["266"] = 299,["267"] = 299,["269"] = 300,["270"] = 301,["271"] = 301,["273"] = 302,["274"] = 303,["275"] = 303,["277"] = 305,["278"] = 306,["279"] = 307,["280"] = 307,["281"] = 307,["282"] = 307,["283"] = 307,["284"] = 307,["285"] = 307,["286"] = 307,["287"] = 314,["288"] = 315,["289"] = 316,["290"] = 317,["291"] = 317,["292"] = 317,["293"] = 317,["294"] = 318,["295"] = 318,["296"] = 318,["297"] = 318,["298"] = 318,["299"] = 318,["300"] = 318,["301"] = 286,["302"] = 327,["303"] = 336,["304"] = 337,["305"] = 338,["307"] = 340,["308"] = 341,["309"] = 346,["310"] = 347,["311"] = 353,["312"] = 354,["313"] = 354,["314"] = 354,["315"] = 354,["316"] = 327});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local ____duel_arena = require("systems.duel.duel_arena")
local broadcastDuelEvent = ____duel_arena.broadcastDuelEvent
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local restoreDuelistAfterDuel = ____duel_arena.restoreDuelistAfterDuel
local ____duel_types = require("systems.duel.duel_types")
local BOSS_DUEL_BET_BOSS = ____duel_types.BOSS_DUEL_BET_BOSS
local BOSS_DUEL_BET_TEAM = ____duel_types.BOSS_DUEL_BET_TEAM
local debugDuelChat = ____duel_types.debugDuelChat
local getTeamPlayerIds = ____duel_types.getTeamPlayerIds
local settleBossDuelBets = ____duel_types.settleBossDuelBets
function ____exports.prepareBossChallengers(self, challengers, spawnA, spawnB, snapshots, activeDuelistEntIndexes)
    local perpDir = Vector(-(spawnB.y - spawnA.y), spawnB.x - spawnA.x, 0):Normalized()
    do
        local i = 0
        while i < #challengers do
            local offset = (i - (#challengers - 1) / 2) * 140
            local spawnPos = Vector(spawnA.x + perpDir.x * offset, spawnA.y + perpDir.y * offset, spawnA.z)
            prepareDuelistSnapshot(
                nil,
                challengers[i + 1],
                spawnPos,
                spawnB,
                snapshots,
                activeDuelistEntIndexes
            )
            i = i + 1
        end
    end
end
function ____exports.spawnDevSparringDummy(self, hero, spawnPos, activeDuelistEntIndexes)
    local dummy = CreateUnitByName(
        "npc_dota_hero_tidehunter",
        spawnPos,
        true,
        nil,
        nil,
        10
    )
    if dummy and not dummy:IsNull() then
        activeDuelistEntIndexes:add(dummy:entindex())
        if dummy:IsHero() then
            while dummy:GetLevel() < hero:GetLevel() do
                dummy:HeroLevelUp(false)
            end
        end
        ExecuteOrderFromTable({
            UnitIndex = dummy:entindex(),
            OrderType = 4,
            TargetIndex = hero:entindex(),
            Queue = false
        })
        return dummy
    end
    return nil
end
function ____exports.processDuelBetPlacement(self, params)
    local bettorId = params.event.PlayerID
    if not params.active or not params.betsOpen then
        return
    end
    if not PlayerResource:IsValidPlayerID(bettorId) then
        return
    end
    if params.activeBets:has(bettorId) then
        return
    end
    local backedTarget = tonumber(params.event.backed_player_id)
    if backedTarget == nil then
        return
    end
    if params.activeBossDuel then
        if PlayerResource:GetTeam(bettorId) == params.activeBossDuel.challengingTeam then
            return
        end
        if backedTarget ~= BOSS_DUEL_BET_TEAM and backedTarget ~= BOSS_DUEL_BET_BOSS then
            return
        end
    elseif params.currentPair then
        if bettorId == params.currentPair.playerA or bettorId == params.currentPair.playerB then
            return
        end
        if backedTarget ~= params.currentPair.playerA and backedTarget ~= params.currentPair.playerB then
            return
        end
    else
        return
    end
    local amount = math.floor(tonumber(params.event.gold_amount) or 0)
    if amount < 10 then
        return
    end
    local currentGold = PlayerResource:GetGold(bettorId)
    if currentGold < amount then
        return
    end
    PlayerResource:SpendGold(bettorId, amount, 0)
    params.activeBets:set(bettorId, {bettorId = bettorId, backedTarget = backedTarget, goldAmount = amount})
end
function ____exports.evaluateActiveDuelKill(self, params)
    local victim = EntIndexToHScript(params.killedIndex)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return {kind = "none"}
    end
    if victim:IsReincarnating() then
        return {kind = "none"}
    end
    if params.activeBossDuel then
        if params.killedIndex == params.activeBossDuel.bossEntIndex then
            local now = GameRules:GetDOTATime(false, false)
            params.activeBossDuel.lootEndTime = now + EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS
            debugDuelChat(
                nil,
                ("[Evo] Boss slain! Grab the Boss Core (" .. tostring(EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS)) .. "s)..."
            )
            return {kind = "none"}
        end
        local anyAlive = __TS__ArraySome(
            params.activeBossDuel.challengerIds,
            function(____, pid)
                local h = PlayerResource:GetSelectedHeroEntity(pid)
                return h ~= nil and not h:IsNull() and IsValidEntity(h) and (h:IsAlive() or h:IsReincarnating())
            end
        )
        return anyAlive and ({kind = "none"}) or ({kind = "boss_duel_end", teamWon = false})
    end
    if not params.currentPair then
        return {kind = "none"}
    end
    if params.sparringDummy and not params.sparringDummy:IsNull() and params.killedIndex == params.sparringDummy:entindex() then
        return {kind = "pvp_duel_end", winnerId = params.currentPair.playerA}
    end
    local victimPlayerId = victim:GetPlayerOwnerID()
    if victimPlayerId == params.currentPair.playerA then
        return {kind = "pvp_duel_end", winnerId = params.currentPair.playerB, loserId = params.currentPair.playerA}
    end
    if victimPlayerId == params.currentPair.playerB then
        return {kind = "pvp_duel_end", winnerId = params.currentPair.playerA, loserId = params.currentPair.playerB}
    end
    return {kind = "none"}
end
local function getUnitHpPercentExact(self, unit)
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return 0
    end
    return unit:GetHealth() / math.max(
        1,
        unit:GetMaxHealth()
    ) * 100
end
function ____exports.evaluateDuelTimeoutOutcome(self, params)
    local pair = params.currentPair
    if not pair then
        return {winnerId = nil, loserId = nil}
    end
    local ____PlayerResource_IsValidPlayerID_result_0
    if PlayerResource:IsValidPlayerID(pair.playerA) then
        ____PlayerResource_IsValidPlayerID_result_0 = PlayerResource:GetSelectedHeroEntity(pair.playerA)
    else
        ____PlayerResource_IsValidPlayerID_result_0 = nil
    end
    local heroA = ____PlayerResource_IsValidPlayerID_result_0
    local ____temp_1
    if pair.playerB >= 0 and PlayerResource:IsValidPlayerID(pair.playerB) then
        ____temp_1 = PlayerResource:GetSelectedHeroEntity(pair.playerB)
    else
        ____temp_1 = params.sparringDummy
    end
    local heroB = ____temp_1
    local pctA = getUnitHpPercentExact(nil, heroA)
    local pctB = getUnitHpPercentExact(nil, heroB)
    if math.abs(pctA - pctB) < 0.01 then
        return {winnerId = nil, loserId = nil}
    end
    if pctA > pctB then
        return {
            winnerId = PlayerResource:IsValidPlayerID(pair.playerA) and pair.playerA or nil,
            loserId = pair.playerB >= 0 and PlayerResource:IsValidPlayerID(pair.playerB) and pair.playerB or nil
        }
    end
    return {
        winnerId = pair.playerB >= 0 and PlayerResource:IsValidPlayerID(pair.playerB) and pair.playerB or nil,
        loserId = PlayerResource:IsValidPlayerID(pair.playerA) and pair.playerA or nil
    }
end
function ____exports.ensureDevTestBot(self, callerId)
    local myTeam = PlayerResource:GetTeam(callerId)
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        do
            if team == myTeam then
                goto __continue39
            end
            if #getTeamPlayerIds(nil, team) > 0 then
                return true
            end
        end
        ::__continue39::
    end
    local botTeam = __TS__ArrayFind(
        EVO_PLAYABLE_TEAMS,
        function(____, team) return team ~= myTeam end
    ) or 3
    local botHero = GameRules:AddBotPlayerWithEntityScript(
        EVO_CONSTANTS.BASE_HERO_NAME,
        "NoobBot",
        botTeam,
        "",
        false
    )
    return botHero ~= nil and not botHero:IsNull()
end
function ____exports.createDevSparringPair(self, playerId)
    return {
        playerA = playerId,
        playerB = -1,
        teamA = PlayerResource:GetTeam(playerId),
        teamB = 10
    }
end
function ____exports.launchDevSparringFallback(self, params)
    local hero = PlayerResource:GetSelectedHeroEntity(params.playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return nil
    end
    prepareDuelistSnapshot(
        nil,
        params.playerId,
        params.spawnA,
        params.spawnB,
        params.snapshots,
        params.activeDuelistEntIndexes
    )
    return ____exports.spawnDevSparringDummy(nil, hero, params.spawnB, params.activeDuelistEntIndexes)
end
function ____exports.prepareDevTestCountdown(self, callerId, rawDelay)
    local delay = math.max(
        6,
        math.min(
            30,
            tonumber(rawDelay) or 8
        )
    )
    local hasBot = ____exports.ensureDevTestBot(nil, callerId)
    debugDuelChat(
        nil,
        hasBot and ("[Evo] Test duel countdown set to " .. tostring(delay)) .. "s vs NoobBot!" or "[Evo] Failed to spawn test bot!"
    )
    return {
        delay = delay,
        nextDuelTime = GameRules:GetDOTATime(false, false) + delay,
        hasBot = hasBot
    }
end
function ____exports.launchBossArenaDuelState(self, params)
    local bossInfo = params.bossManager:getStrongestAliveBoss()
    if not bossInfo then
        return nil
    end
    local challengers = getTeamPlayerIds(nil, params.challengingTeam)
    if #challengers == 0 then
        return nil
    end
    local bossReturnPos = params.bossManager:prepareBossForArena(bossInfo.bossId, params.spawnB, params.spawnA)
    if not bossReturnPos then
        return nil
    end
    params:onRecordDuelists(challengers)
    params:onBeginStage()
    ____exports.prepareBossChallengers(
        nil,
        challengers,
        params.spawnA,
        params.spawnB,
        params.snapshots,
        params.activeDuelistEntIndexes
    )
    params.activeDuelistEntIndexes:add(bossInfo.unit:entindex())
    params.eventBus:emit("duel_started", {roundIndex = params.roundIndex, isTiebreaker = false})
    broadcastDuelEvent(nil, "started")
    debugDuelChat(
        nil,
        ((((("[Evo] BOSS ARENA! Team " .. tostring(params.challengingTeam)) .. " vs ") .. bossInfo.bossId) .. " (Lv.") .. tostring(bossInfo.level)) .. ")"
    )
    return {
        bossId = bossInfo.bossId,
        bossEntIndex = bossInfo.unit:entindex(),
        bossReturnPos = bossReturnPos,
        challengingTeam = params.challengingTeam,
        challengerIds = challengers
    }
end
function ____exports.completeBossArenaDuelState(self, params)
    settleBossDuelBets(nil, params.activeBets, params.teamWon)
    for ____, pid in ipairs(params.bossDuel.challengerIds) do
        restoreDuelistAfterDuel(nil, pid, params.teamWon, params.snapshots)
    end
    params.snapshots:clear()
    params.bossManager:returnBossFromArena(params.bossDuel.bossId, params.bossDuel.bossReturnPos, not params.teamWon)
    local leadWinner = params.teamWon and params.bossDuel.challengerIds[1] or nil
    params.eventBus:emit("duel_finished", {roundIndex = params.roundIndex, winnerId = leadWinner, loserId = nil, isTiebreaker = false})
    broadcastDuelEvent(nil, "finished", leadWinner)
    debugDuelChat(
        nil,
        params.teamWon and ((("[Evo] Team " .. tostring(params.bossDuel.challengingTeam)) .. " defeated ") .. params.bossDuel.bossId) .. " in the Boss Arena!" or ("[Evo] " .. params.bossDuel.bossId) .. " crushed the challengers and entered COURAGE mode!"
    )
end
return ____exports
