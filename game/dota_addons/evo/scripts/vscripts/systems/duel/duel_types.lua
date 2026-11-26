local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySome = ____lualib.__TS__ArraySome
local Set = ____lualib.Set
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 45,["16"] = 46,["17"] = 47,["18"] = 49,["19"] = 50,["20"] = 51,["22"] = 49,["23"] = 55,["24"] = 60,["25"] = 61,["26"] = 64,["27"] = 67,["28"] = 71,["29"] = 72,["31"] = 74,["32"] = 78,["33"] = 83,["34"] = 55,["35"] = 86,["36"] = 87,["37"] = 87,["39"] = 88,["40"] = 89,["41"] = 90,["43"] = 92,["44"] = 86,["45"] = 95,["46"] = 96,["48"] = 97,["49"] = 97,["51"] = 98,["52"] = 99,["53"] = 99,["55"] = 100,["56"] = 100,["57"] = 100,["58"] = 100,["59"] = 101,["63"] = 97,["66"] = 104,["67"] = 95,["68"] = 107,["69"] = 111,["71"] = 112,["72"] = 112,["74"] = 113,["75"] = 114,["76"] = 114,["78"] = 115,["79"] = 115,["81"] = 116,["82"] = 116,["84"] = 117,["85"] = 118,["86"] = 118,["88"] = 119,["91"] = 112,["94"] = 121,["95"] = 107,["96"] = 124,["97"] = 125,["98"] = 126,["99"] = 127,["100"] = 128,["103"] = 131,["104"] = 124,["105"] = 134,["106"] = 140,["107"] = 141,["108"] = 141,["110"] = 143,["111"] = 145,["112"] = 145,["113"] = 144,["114"] = 147,["115"] = 149,["116"] = 150,["117"] = 151,["118"] = 152,["119"] = 153,["120"] = 154,["122"] = 157,["124"] = 158,["125"] = 158,["126"] = 159,["127"] = 160,["128"] = 161,["130"] = 158,["133"] = 164,["134"] = 134,["135"] = 167,["136"] = 171,["137"] = 172,["138"] = 173,["139"] = 174,["142"] = 177,["143"] = 177,["145"] = 179,["146"] = 180,["147"] = 181,["148"] = 182,["149"] = 183,["150"] = 184,["151"] = 185,["154"] = 188,["155"] = 189,["157"] = 192,["159"] = 193,["160"] = 193,["161"] = 194,["162"] = 195,["163"] = 196,["165"] = 193,["168"] = 199,["169"] = 167,["170"] = 202,["171"] = 203,["172"] = 204,["173"] = 205,["176"] = 208,["177"] = 202,["178"] = 211,["179"] = 216,["180"] = 216,["182"] = 218,["183"] = 219,["184"] = 220,["185"] = 221,["186"] = 222,["187"] = 223,["188"] = 224,["191"] = 227,["192"] = 228,["194"] = 231,["196"] = 232,["197"] = 232,["198"] = 233,["199"] = 234,["200"] = 235,["202"] = 232,["205"] = 238,["206"] = 211,["207"] = 241,["208"] = 246,["209"] = 247,["210"] = 248,["211"] = 249,["214"] = 253,["215"] = 253,["217"] = 255,["218"] = 257,["219"] = 257,["220"] = 258,["221"] = 258,["222"] = 257,["223"] = 256,["224"] = 262,["225"] = 262,["226"] = 263,["228"] = 264,["230"] = 261,["231"] = 265,["232"] = 265,["234"] = 267,["235"] = 267,["236"] = 267,["237"] = 267,["238"] = 268,["239"] = 269,["240"] = 269,["242"] = 271,["243"] = 271,["244"] = 271,["245"] = 271,["246"] = 271,["247"] = 271,["248"] = 271,["249"] = 272,["250"] = 273,["251"] = 273,["253"] = 275,["254"] = 241,["255"] = 278,["256"] = 282,["257"] = 283,["258"] = 284,["260"] = 287,["261"] = 288,["262"] = 289,["265"] = 292,["266"] = 293,["267"] = 294,["268"] = 295,["269"] = 278,["270"] = 298,["271"] = 304,["272"] = 305,["273"] = 306,["275"] = 308,["276"] = 308,["277"] = 308,["278"] = 308,["279"] = 298,["280"] = 314,["281"] = 315,["282"] = 316,["284"] = 317,["285"] = 317,["287"] = 318,["288"] = 319,["289"] = 320,["290"] = 321,["291"] = 322,["292"] = 323,["297"] = 326,["298"] = 327,["299"] = 314,["300"] = 330,["301"] = 331,["302"] = 332,["304"] = 333,["305"] = 333,["307"] = 334,["308"] = 335,["309"] = 336,["314"] = 339,["315"] = 330});
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
function ____exports.isActiveConnectedPlayer(self, playerId)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return false
    end
    local state = PlayerResource:GetConnectionState(playerId)
    if PlayerResource:IsFakeClient(playerId) then
        return state ~= 4
    end
    return state == 2
end
function ____exports.getActiveDuelPlayerCount(self)
    local count = 0
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not ____exports.isActiveConnectedPlayer(nil, pid) then
                    goto __continue10
                end
                if __TS__ArrayIncludes(
                    EVO_PLAYABLE_TEAMS,
                    PlayerResource:GetTeam(pid)
                ) then
                    count = count + 1
                end
            end
            ::__continue10::
            i = i + 1
        end
    end
    return count
end
function ____exports.getTeamPlayerIds(self, team, excludedIds)
    local result = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not ____exports.isActiveConnectedPlayer(nil, pid) then
                    goto __continue14
                end
                if PlayerResource:GetTeam(pid) ~= team then
                    goto __continue14
                end
                if excludedIds and excludedIds:has(pid) then
                    goto __continue14
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue14
                end
                result[#result + 1] = pid
            end
            ::__continue14::
            i = i + 1
        end
    end
    return result
end
function ____exports.getActiveTeamCount(self)
    local count = 0
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team) > 0 then
            count = count + 1
        end
    end
    return count
end
function ____exports.pickWeightedChampion(self, team, applicants, excludedIds, preferredIds)
    local allCandidates = ____exports.getTeamPlayerIds(nil, team, excludedIds)
    if #allCandidates == 0 then
        return nil
    end
    local preferred = preferredIds and preferredIds.size > 0 and __TS__ArrayFilter(
        allCandidates,
        function(____, pid) return preferredIds:has(pid) end
    ) or ({})
    local candidates = #preferred > 0 and preferred or allCandidates
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
function ____exports.pickWeightedBossDuelTeam(self, applicants, excludedIds)
    local activeTeams = {}
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team, excludedIds) > 0 then
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
        for ____, pid in ipairs(____exports.getTeamPlayerIds(nil, team, excludedIds)) do
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
local function pickWeightedTeam(self, teams, applicants, excludedIds)
    if #teams == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, team in ipairs(teams) do
        local teamWeight = 1
        for ____, pid in ipairs(____exports.getTeamPlayerIds(nil, team, excludedIds)) do
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
function ____exports.generateDuelPairs(self, applicants, excludedIds, priorityIds)
    local activeTeams = {}
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        if #____exports.getTeamPlayerIds(nil, team, excludedIds) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams < 2 then
        return {}
    end
    local priorityTeams = priorityIds and priorityIds.size > 0 and __TS__ArrayFilter(
        activeTeams,
        function(____, team) return __TS__ArraySome(
            ____exports.getTeamPlayerIds(nil, team, excludedIds),
            function(____, pid) return priorityIds:has(pid) end
        ) end
    ) or ({})
    local ____temp_0
    if #priorityTeams > 0 then
        ____temp_0 = pickWeightedTeam(nil, priorityTeams, applicants, excludedIds)
    else
        ____temp_0 = pickWeightedTeam(nil, activeTeams, applicants, excludedIds)
    end
    local teamA = ____temp_0
    if teamA == nil then
        return {}
    end
    local remainingTeams = __TS__ArrayFilter(
        activeTeams,
        function(____, team) return team ~= teamA end
    )
    local teamB = pickWeightedTeam(nil, remainingTeams, applicants, excludedIds)
    if teamB == nil then
        return {}
    end
    local playerA = ____exports.pickWeightedChampion(
        nil,
        teamA,
        applicants,
        excludedIds,
        priorityIds
    )
    local playerB = ____exports.pickWeightedChampion(nil, teamB, applicants, excludedIds)
    if playerA == nil or playerB == nil then
        return {}
    end
    return {{playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}}
end
function ____exports.resolveSkippedDuelCooldown(self, lastDuelistIds, skippedPriorityIds)
    if ____exports.getActiveTeamCount(nil) < 2 then
        ____exports.debugDuelChat(nil, "[Evo] Duel skipped: not enough active teams.")
        return false
    end
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        for ____, pid in ipairs(____exports.getTeamPlayerIds(nil, team, lastDuelistIds)) do
            skippedPriorityIds:add(pid)
        end
    end
    lastDuelistIds:clear()
    GameRules:SendCustomMessage("#evo_duel_skipped_rest", 0, 0)
    ____exports.debugDuelChat(nil, "[Evo] Duel skipped: rest cycle so no player fights twice in a row.")
    return true
end
function ____exports.resolveAdaptiveWaitDeadline(self, waitCycleStartTime, currentDeadline, now, intervalSeconds)
    local targetTime = waitCycleStartTime + intervalSeconds
    if math.abs(targetTime - currentDeadline) <= 1 then
        return {changed = false, nextDeadline = currentDeadline}
    end
    return {
        changed = true,
        nextDeadline = math.max(now + EVO_CONSTANTS.DUEL_COUNTDOWN_SECONDS + 2, targetTime)
    }
end
function ____exports.settleBets(self, activeBets, winnerId)
    local totalPayout = 0
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue75
            end
            if winnerId == nil then
                PlayerResource:ModifyGold(bet.bettorId, bet.goldAmount, false, 0)
            elseif bet.backedTarget == winnerId then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
                totalPayout = totalPayout + payout
            end
        end
        ::__continue75::
    end
    activeBets:clear()
    return totalPayout
end
function ____exports.settleBossDuelBets(self, activeBets, teamWon)
    local winningSide = teamWon and ____exports.BOSS_DUEL_BET_TEAM or ____exports.BOSS_DUEL_BET_BOSS
    for ____, bet in __TS__Iterator(activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue81
            end
            if bet.backedTarget == winningSide then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue81::
    end
    activeBets:clear()
end
return ____exports
