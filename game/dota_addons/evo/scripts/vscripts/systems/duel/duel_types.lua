local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 45,["13"] = 46,["14"] = 47,["15"] = 49,["16"] = 50,["17"] = 51,["19"] = 49,["20"] = 55,["21"] = 60,["22"] = 61,["23"] = 64,["24"] = 67,["25"] = 71,["26"] = 72,["28"] = 74,["29"] = 78,["30"] = 83,["31"] = 55,["32"] = 86,["33"] = 87,["35"] = 88,["36"] = 88,["38"] = 89,["39"] = 90,["40"] = 90,["42"] = 91,["43"] = 91,["45"] = 92,["46"] = 93,["47"] = 93,["49"] = 94,["52"] = 88,["55"] = 96,["56"] = 86,["57"] = 99,["58"] = 100,["59"] = 101,["60"] = 101,["62"] = 103,["63"] = 104,["64"] = 105,["65"] = 106,["66"] = 107,["67"] = 108,["69"] = 111,["71"] = 112,["72"] = 112,["73"] = 113,["74"] = 114,["75"] = 115,["77"] = 112,["80"] = 118,["81"] = 99,["82"] = 121,["83"] = 122,["84"] = 123,["85"] = 124,["86"] = 125,["89"] = 128,["90"] = 128,["92"] = 130,["93"] = 131,["94"] = 132,["95"] = 133,["96"] = 134,["97"] = 135,["98"] = 136,["101"] = 139,["102"] = 140,["104"] = 143,["106"] = 144,["107"] = 144,["108"] = 145,["109"] = 146,["110"] = 147,["112"] = 144,["115"] = 150,["116"] = 121,["117"] = 153,["118"] = 154,["119"] = 155,["120"] = 156,["123"] = 159,["124"] = 153,["125"] = 162,["126"] = 166,["127"] = 166,["129"] = 168,["130"] = 169,["131"] = 170,["132"] = 171,["133"] = 172,["134"] = 173,["135"] = 174,["138"] = 177,["139"] = 178,["141"] = 181,["143"] = 182,["144"] = 182,["145"] = 183,["146"] = 184,["147"] = 185,["149"] = 182,["152"] = 188,["153"] = 162,["154"] = 191,["155"] = 192,["156"] = 193,["157"] = 194,["158"] = 195,["161"] = 199,["162"] = 199,["164"] = 201,["165"] = 202,["166"] = 202,["168"] = 204,["169"] = 204,["170"] = 204,["171"] = 204,["172"] = 205,["173"] = 206,["174"] = 206,["176"] = 208,["177"] = 209,["178"] = 210,["179"] = 210,["181"] = 212,["182"] = 191,["183"] = 215,["184"] = 216,["185"] = 217,["187"] = 218,["188"] = 218,["190"] = 219,["191"] = 220,["192"] = 221,["193"] = 222,["194"] = 223,["195"] = 224,["200"] = 227,["201"] = 228,["202"] = 215,["203"] = 231,["204"] = 232,["205"] = 233,["207"] = 234,["208"] = 234,["210"] = 235,["211"] = 236,["212"] = 237,["217"] = 240,["218"] = 231});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
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
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
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
function ____exports.hasMultiPlayerTeams(self)
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team) >= 2 then
            return true
        end
    end
    return false
end
local function pickWeightedTeam(self, teams, applicants)
    if #teams == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, team in ipairs(teams) do
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
        while i < #teams do
            roll = roll - weights[i + 1]
            if roll <= 0 then
                return teams[i + 1]
            end
            i = i + 1
        end
    end
    return teams[#teams]
end
function ____exports.generateDuelPairs(self, applicants)
    local activeTeams = {}
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams < 2 then
        return {}
    end
    local teamA = pickWeightedTeam(nil, activeTeams, applicants)
    if teamA == nil then
        return {}
    end
    local remainingTeams = __TS__ArrayFilter(
        activeTeams,
        function(____, team) return team ~= teamA end
    )
    local teamB = pickWeightedTeam(nil, remainingTeams, applicants)
    if teamB == nil then
        return {}
    end
    local playerA = ____exports.pickWeightedChampion(nil, teamA, applicants)
    local playerB = ____exports.pickWeightedChampion(nil, teamB, applicants)
    if playerA == nil or playerB == nil then
        return {}
    end
    return {{playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}}
end
function ____exports.settleBets(self, activeBets, winnerId)
    local totalPayout = 0
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue52
            end
            if winnerId == nil then
                PlayerResource:ModifyGold(bet.bettorId, bet.goldAmount, false, 0)
            elseif bet.backedTarget == winnerId then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
                totalPayout = totalPayout + payout
            end
        end
        ::__continue52::
    end
    activeBets:clear()
    return totalPayout
end
function ____exports.settleBossDuelBets(self, activeBets, teamWon)
    local winningSide = teamWon and ____exports.BOSS_DUEL_BET_TEAM or ____exports.BOSS_DUEL_BET_BOSS
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue58
            end
            if bet.backedTarget == winningSide then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue58::
    end
    activeBets:clear()
end
return ____exports
