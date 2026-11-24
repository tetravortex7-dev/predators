local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 5,["14"] = 6,["15"] = 11,["16"] = 14,["17"] = 21,["19"] = 22,["20"] = 22,["21"] = 23,["22"] = 24,["23"] = 29,["24"] = 29,["25"] = 29,["26"] = 29,["27"] = 29,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 22,["34"] = 14,["35"] = 39,["36"] = 44,["37"] = 44,["38"] = 44,["39"] = 44,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 44,["44"] = 52,["45"] = 53,["46"] = 54,["47"] = 55,["48"] = 56,["51"] = 59,["52"] = 59,["53"] = 59,["54"] = 59,["55"] = 59,["56"] = 59,["57"] = 65,["59"] = 67,["60"] = 39,["61"] = 70,["62"] = 78,["63"] = 79,["66"] = 80,["69"] = 81,["72"] = 83,["73"] = 84,["76"] = 86,["77"] = 87,["80"] = 88,["83"] = 89,["84"] = 90,["87"] = 91,["93"] = 96,["94"] = 97,["97"] = 99,["98"] = 100,["101"] = 102,["102"] = 103,["103"] = 70,["104"] = 115,["105"] = 121,["106"] = 122,["107"] = 123,["109"] = 125,["110"] = 125,["112"] = 127,["113"] = 128,["114"] = 129,["115"] = 130,["116"] = 131,["117"] = 131,["118"] = 131,["119"] = 131,["120"] = 134,["122"] = 136,["123"] = 136,["124"] = 136,["125"] = 137,["126"] = 138,["127"] = 136,["128"] = 136,["129"] = 140,["131"] = 143,["132"] = 143,["134"] = 146,["135"] = 150,["137"] = 153,["138"] = 154,["139"] = 155,["141"] = 161,["142"] = 162,["144"] = 169,["145"] = 115});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____duel_arena = require("systems.duel.duel_arena")
local prepareDuelistSnapshot = ____duel_arena.prepareDuelistSnapshot
local ____duel_types = require("systems.duel.duel_types")
local BOSS_DUEL_BET_BOSS = ____duel_types.BOSS_DUEL_BET_BOSS
local BOSS_DUEL_BET_TEAM = ____duel_types.BOSS_DUEL_BET_TEAM
local debugDuelChat = ____duel_types.debugDuelChat
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
return ____exports
