local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 11,["18"] = 12,["19"] = 15,["20"] = 22,["22"] = 23,["23"] = 23,["24"] = 24,["25"] = 25,["26"] = 30,["27"] = 30,["28"] = 30,["29"] = 30,["30"] = 30,["31"] = 30,["32"] = 30,["33"] = 30,["34"] = 23,["37"] = 15,["38"] = 40,["39"] = 45,["40"] = 45,["41"] = 45,["42"] = 45,["43"] = 45,["44"] = 45,["45"] = 45,["46"] = 45,["47"] = 53,["48"] = 54,["49"] = 55,["50"] = 56,["51"] = 57,["54"] = 60,["55"] = 60,["56"] = 60,["57"] = 60,["58"] = 60,["59"] = 60,["60"] = 66,["62"] = 68,["63"] = 40,["64"] = 71,["65"] = 79,["66"] = 80,["69"] = 81,["72"] = 82,["75"] = 84,["76"] = 85,["79"] = 87,["80"] = 88,["83"] = 89,["86"] = 90,["87"] = 91,["90"] = 92,["96"] = 97,["97"] = 98,["100"] = 100,["101"] = 101,["104"] = 103,["105"] = 104,["106"] = 71,["107"] = 116,["108"] = 122,["109"] = 123,["110"] = 124,["112"] = 126,["113"] = 126,["115"] = 128,["116"] = 129,["117"] = 130,["118"] = 131,["119"] = 132,["120"] = 132,["121"] = 132,["122"] = 132,["123"] = 135,["125"] = 137,["126"] = 137,["127"] = 137,["128"] = 138,["129"] = 139,["130"] = 137,["131"] = 137,["132"] = 141,["134"] = 144,["135"] = 144,["137"] = 147,["138"] = 151,["140"] = 154,["141"] = 155,["142"] = 156,["144"] = 162,["145"] = 163,["147"] = 170,["148"] = 116,["149"] = 173,["150"] = 174,["151"] = 175,["153"] = 177,["154"] = 177,["155"] = 177,["156"] = 177,["157"] = 173,["158"] = 180,["159"] = 184,["160"] = 185,["161"] = 186,["163"] = 189,["164"] = 189,["165"] = 190,["167"] = 191,["169"] = 189,["170"] = 193,["171"] = 193,["172"] = 194,["174"] = 195,["176"] = 192,["177"] = 197,["178"] = 198,["179"] = 200,["180"] = 201,["182"] = 204,["183"] = 205,["184"] = 205,["185"] = 205,["186"] = 205,["188"] = 211,["189"] = 211,["190"] = 211,["191"] = 211,["192"] = 180,["193"] = 217,["194"] = 218,["195"] = 219,["197"] = 220,["198"] = 220,["200"] = 221,["201"] = 222,["206"] = 226,["207"] = 226,["208"] = 226,["209"] = 226,["210"] = 227,["211"] = 227,["212"] = 227,["213"] = 227,["214"] = 227,["215"] = 227,["216"] = 227,["217"] = 234,["218"] = 217,["219"] = 237,["220"] = 244,["221"] = 245,["222"] = 245,["224"] = 246,["225"] = 246,["226"] = 246,["227"] = 246,["228"] = 246,["229"] = 246,["230"] = 246,["231"] = 246,["232"] = 253,["233"] = 237});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local ____duel_arena = require("systems.duel.duel_arena")
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local ____duel_types = require("systems.duel.duel_types")
local BOSS_DUEL_BET_BOSS = ____duel_types.BOSS_DUEL_BET_BOSS
local BOSS_DUEL_BET_TEAM = ____duel_types.BOSS_DUEL_BET_TEAM
local debugDuelChat = ____duel_types.debugDuelChat
local getTeamPlayerIds = ____duel_types.getTeamPlayerIds
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
return ____exports
