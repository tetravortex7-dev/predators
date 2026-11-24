local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 45,["11"] = 45,["12"] = 45,["13"] = 45,["14"] = 45,["15"] = 45,["16"] = 45,["17"] = 45,["18"] = 54,["19"] = 55,["20"] = 56,["21"] = 58,["22"] = 59,["23"] = 60,["25"] = 58,["26"] = 64,["27"] = 69,["28"] = 70,["29"] = 73,["30"] = 76,["31"] = 80,["32"] = 81,["34"] = 83,["35"] = 87,["36"] = 92,["37"] = 64,["38"] = 95,["39"] = 96,["41"] = 97,["42"] = 97,["44"] = 98,["45"] = 99,["46"] = 99,["48"] = 100,["49"] = 100,["51"] = 101,["52"] = 102,["53"] = 102,["55"] = 103,["58"] = 97,["61"] = 105,["62"] = 95,["63"] = 108,["64"] = 109,["65"] = 110,["66"] = 110,["68"] = 112,["69"] = 113,["70"] = 114,["71"] = 115,["72"] = 116,["73"] = 117,["75"] = 120,["77"] = 121,["78"] = 121,["79"] = 122,["80"] = 123,["81"] = 124,["83"] = 121,["86"] = 127,["87"] = 108,["88"] = 130,["89"] = 131,["90"] = 132,["91"] = 133,["92"] = 134,["95"] = 137,["96"] = 137,["98"] = 139,["99"] = 140,["100"] = 141,["101"] = 142,["102"] = 143,["103"] = 144,["104"] = 145,["107"] = 148,["108"] = 149,["110"] = 152,["112"] = 153,["113"] = 153,["114"] = 154,["115"] = 155,["116"] = 156,["118"] = 153,["121"] = 159,["122"] = 130,["123"] = 162,["124"] = 163,["125"] = 164,["126"] = 165,["127"] = 166,["130"] = 170,["131"] = 170,["133"] = 172,["135"] = 173,["136"] = 173,["137"] = 174,["138"] = 175,["139"] = 176,["140"] = 177,["141"] = 173,["144"] = 180,["145"] = 181,["146"] = 182,["147"] = 183,["148"] = 184,["149"] = 185,["150"] = 186,["152"] = 188,["153"] = 189,["155"] = 192,["156"] = 193,["157"] = 193,["158"] = 193,["159"] = 194,["160"] = 195,["161"] = 196,["162"] = 197,["165"] = 200,["166"] = 162,["167"] = 203,["168"] = 204,["170"] = 205,["171"] = 205,["173"] = 206,["174"] = 207,["175"] = 208,["176"] = 209,["177"] = 210,["182"] = 213,["183"] = 203,["184"] = 216,["185"] = 217,["186"] = 218,["188"] = 219,["189"] = 219,["191"] = 220,["192"] = 221,["193"] = 222,["198"] = 225,["199"] = 216});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
____exports.PLAYABLE_TEAMS = {
    2,
    3,
    6,
    7,
    8,
    9
}
____exports.DUEL_BET_WINDOW_SECONDS = 8
____exports.BOSS_DUEL_BET_TEAM = 1
____exports.BOSS_DUEL_BET_BOSS = -2
function ____exports.debugDuelChat(self, message)
    if IsInToolsMode() then
        GameRules:SendCustomMessage(message, 0, 0)
    end
end
function ____exports.discoverArenaLocations(self)
    local arenaCenter = Vector(0, 0, 128)
    local spawnAEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_SPAWN_A) or Entities:FindByName(nil, "duel_1_teleport_2")
    local spawnBEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_SPAWN_B) or Entities:FindByName(nil, "duel_1_teleport_3")
    local centerEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) or Entities:FindByName(nil, "duel_1")
    if centerEnt and not centerEnt:IsNull() and IsValidEntity(centerEnt) then
        arenaCenter = centerEnt:GetAbsOrigin()
    end
    local spawnA = spawnAEnt and not spawnAEnt:IsNull() and IsValidEntity(spawnAEnt) and spawnAEnt:GetAbsOrigin() or Vector(arenaCenter.x - 450, arenaCenter.y, arenaCenter.z)
    local spawnB = spawnBEnt and not spawnBEnt:IsNull() and IsValidEntity(spawnBEnt) and spawnBEnt:GetAbsOrigin() or Vector(arenaCenter.x + 450, arenaCenter.y, arenaCenter.z)
    return {arenaCenter = arenaCenter, spawnA = spawnA, spawnB = spawnB}
end
function ____exports.getTeamPlayerIds(self, team)
    local result = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue7
                end
                if PlayerResource:GetTeam(pid) ~= team then
                    goto __continue7
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue7
                end
                result[#result + 1] = pid
            end
            ::__continue7::
            i = i + 1
        end
    end
    return result
end
function ____exports.pickWeightedChampion(self, team, applicants)
    local candidates = ____exports.getTeamPlayerIds(nil, team)
    if #candidates == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, pid in ipairs(candidates) do
        local w = applicants:has(pid) and EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER or 1
        weights[#weights + 1] = w
        totalWeight = totalWeight + w
    end
    local roll = RandomFloat(0, totalWeight)
    do
        local i = 0
        while i < #candidates do
            roll = roll - weights[i + 1]
            if roll <= 0 then
                return candidates[i + 1]
            end
            i = i + 1
        end
    end
    return candidates[#candidates]
end
function ____exports.pickWeightedBossDuelTeam(self, applicants)
    local activeTeams = {}
    for ____, team in ipairs(____exports.PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, team in ipairs(activeTeams) do
        local teamWeight = 1
        for ____, pid in ipairs(____exports.getTeamPlayerIds(nil, team)) do
            if applicants:has(pid) then
                teamWeight = teamWeight + EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER
            end
        end
        weights[#weights + 1] = teamWeight
        totalWeight = totalWeight + teamWeight
    end
    local roll = RandomFloat(0, totalWeight)
    do
        local i = 0
        while i < #activeTeams do
            roll = roll - weights[i + 1]
            if roll <= 0 then
                return activeTeams[i + 1]
            end
            i = i + 1
        end
    end
    return activeTeams[#activeTeams]
end
function ____exports.generateDuelPairs(self, applicants)
    local activeTeams = {}
    for ____, team in ipairs(____exports.PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams < 2 then
        return {}
    end
    local shuffled = {unpack(activeTeams)}
    do
        local i = #shuffled - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local tmp = shuffled[i + 1]
            shuffled[i + 1] = shuffled[j + 1]
            shuffled[j + 1] = tmp
            i = i - 1
        end
    end
    local teamPairs = {}
    if #shuffled == 2 then
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
    elseif #shuffled == 3 then
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
        teamPairs[#teamPairs + 1] = {shuffled[2], shuffled[3]}
        teamPairs[#teamPairs + 1] = {shuffled[3], shuffled[1]}
    else
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
        teamPairs[#teamPairs + 1] = {shuffled[3], shuffled[4]}
    end
    local result = {}
    for ____, ____value in ipairs(teamPairs) do
        local teamA = ____value[1]
        local teamB = ____value[2]
        local playerA = ____exports.pickWeightedChampion(nil, teamA, applicants)
        local playerB = ____exports.pickWeightedChampion(nil, teamB, applicants)
        if playerA ~= nil and playerB ~= nil then
            result[#result + 1] = {playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}
        end
    end
    return result
end
function ____exports.settleBets(self, activeBets, winnerId)
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue42
            end
            if winnerId == nil then
                PlayerResource:ModifyGold(bet.bettorId, bet.goldAmount, false, 0)
            elseif bet.backedTarget == winnerId then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue42::
    end
    activeBets:clear()
end
function ____exports.settleBossDuelBets(self, activeBets, teamWon)
    local winningSide = teamWon and ____exports.BOSS_DUEL_BET_TEAM or ____exports.BOSS_DUEL_BET_BOSS
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue48
            end
            if bet.backedTarget == winningSide then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue48::
    end
    activeBets:clear()
end
return ____exports
