local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 24,["23"] = 24,["24"] = 24,["25"] = 29,["26"] = 29,["27"] = 25,["28"] = 26,["29"] = 27,["30"] = 29,["31"] = 31,["32"] = 32,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 35,["43"] = 35,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 36,["52"] = 37,["53"] = 38,["54"] = 40,["55"] = 35,["56"] = 35,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 43,["61"] = 43,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 43,["68"] = 44,["71"] = 45,["72"] = 45,["73"] = 45,["74"] = 45,["75"] = 46,["76"] = 50,["77"] = 43,["78"] = 43,["79"] = 53,["80"] = 53,["81"] = 53,["82"] = 53,["83"] = 53,["84"] = 53,["85"] = 53,["86"] = 53,["87"] = 53,["88"] = 54,["89"] = 53,["90"] = 53,["91"] = 57,["92"] = 57,["93"] = 57,["94"] = 57,["95"] = 57,["96"] = 57,["97"] = 57,["98"] = 58,["101"] = 59,["102"] = 60,["103"] = 57,["104"] = 57,["105"] = 63,["106"] = 63,["107"] = 63,["108"] = 63,["109"] = 63,["110"] = 64,["111"] = 65,["113"] = 67,["114"] = 63,["115"] = 63,["116"] = 70,["117"] = 70,["118"] = 70,["119"] = 71,["120"] = 70,["121"] = 70,["122"] = 74,["123"] = 74,["124"] = 74,["125"] = 74,["126"] = 74,["127"] = 74,["128"] = 74,["129"] = 74,["130"] = 74,["131"] = 75,["134"] = 76,["135"] = 77,["136"] = 78,["137"] = 74,["138"] = 74,["139"] = 31,["140"] = 82,["141"] = 83,["142"] = 82,["143"] = 86,["144"] = 87,["145"] = 86,["146"] = 90,["147"] = 91,["150"] = 92,["153"] = 94,["154"] = 95,["155"] = 96,["156"] = 97,["157"] = 98,["158"] = 99,["159"] = 99,["160"] = 99,["161"] = 99,["162"] = 99,["163"] = 100,["164"] = 100,["165"] = 100,["166"] = 100,["168"] = 103,["169"] = 104,["170"] = 105,["171"] = 107,["172"] = 108,["173"] = 109,["174"] = 109,["175"] = 109,["176"] = 109,["178"] = 112,["179"] = 119,["180"] = 121,["181"] = 122,["183"] = 90,["184"] = 126,["185"] = 127,["186"] = 128,["187"] = 129,["188"] = 130,["190"] = 126,["191"] = 134,["192"] = 135,["195"] = 136,["196"] = 137,["199"] = 138,["202"] = 140,["203"] = 141,["206"] = 143,["207"] = 144,["208"] = 146,["211"] = 147,["212"] = 148,["215"] = 150,["216"] = 151,["219"] = 153,["220"] = 154,["221"] = 155,["223"] = 134,["224"] = 159,["225"] = 160,["226"] = 161,["227"] = 162,["230"] = 164,["231"] = 165,["232"] = 166,["233"] = 167,["234"] = 168,["235"] = 169,["236"] = 170,["237"] = 171,["238"] = 172,["241"] = 176,["242"] = 177,["245"] = 181,["246"] = 159,["247"] = 186,["248"] = 187,["251"] = 188,["252"] = 190,["253"] = 194,["254"] = 186,["255"] = 197,["257"] = 198,["258"] = 198,["260"] = 199,["261"] = 200,["262"] = 200,["264"] = 201,["265"] = 202,["266"] = 203,["268"] = 205,["269"] = 206,["273"] = 198,["276"] = 197,["277"] = 211,["278"] = 212,["279"] = 213,["280"] = 214,["281"] = 215,["284"] = 218,["285"] = 211,["286"] = 221,["287"] = 222,["288"] = 223,["289"] = 224,["290"] = 225,["293"] = 228,["294"] = 221,["295"] = 231,["296"] = 232,["297"] = 231,["298"] = 235,["299"] = 236,["300"] = 237,["301"] = 238,["302"] = 239,["303"] = 241,["304"] = 242,["305"] = 244,["306"] = 245,["307"] = 246,["308"] = 248,["310"] = 250,["311"] = 250,["313"] = 251,["314"] = 252,["315"] = 252,["317"] = 253,["318"] = 253,["320"] = 254,["321"] = 255,["322"] = 256,["325"] = 250,["328"] = 259,["330"] = 267,["331"] = 235});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local calculateComebackScoreMultiplier = ____game_constants.calculateComebackScoreMultiplier
local calculateEscalationMultiplier = ____game_constants.calculateEscalationMultiplier
local PLAYABLE_TEAMS = {
    2,
    3,
    6,
    7,
    8,
    9
}
____exports.MatchScoreManager = __TS__Class()
local MatchScoreManager = ____exports.MatchScoreManager
MatchScoreManager.name = "MatchScoreManager"
function MatchScoreManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.teamScores = __TS__New(Map)
    self.playerScores = __TS__New(Map)
    self.matchEnded = false
end
function MatchScoreManager.prototype.init(self)
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
        "biomass_collected",
        function(____, ____bindingPattern0)
            local amount
            local playerId
            playerId = ____bindingPattern0.playerId
            amount = ____bindingPattern0.amount
            if not PlayerResource:IsValidPlayerID(playerId) then
                return
            end
            local team = PlayerResource:GetTeam(playerId)
            local basePoints = amount >= 3 and EVO_CONSTANTS.SCORE_GOLIATH_CREEP or EVO_CONSTANTS.SCORE_FARM_CREEP
            self:addScore(team, basePoints, "farm", playerId)
        end
    )
    self.eventBus:on(
        "boss_event",
        function(____, ____bindingPattern0)
            local killerPlayerId
            local killerTeam
            local level
            local event
            event = ____bindingPattern0.event
            level = ____bindingPattern0.level
            killerTeam = ____bindingPattern0.killerTeam
            killerPlayerId = ____bindingPattern0.killerPlayerId
            if event ~= "killed" or killerTeam == nil then
                return
            end
            local progress = math.min(
                1,
                math.max(0, (level - 1) / (EVO_CONSTANTS.MAX_HERO_LEVEL - 1))
            )
            local basePoints = math.floor(EVO_CONSTANTS.SCORE_BOSS_MIN + progress * (EVO_CONSTANTS.SCORE_BOSS_MAX - EVO_CONSTANTS.SCORE_BOSS_MIN) + 0.5)
            self:addScore(killerTeam, basePoints, "boss_kill", killerPlayerId)
        end
    )
    self.eventBus:on(
        "boss_core_destroyed",
        function(____, ____bindingPattern0)
            local bonusScore
            local team
            local playerId
            playerId = ____bindingPattern0.playerId
            team = ____bindingPattern0.team
            bonusScore = ____bindingPattern0.bonusScore
            self:addScore(team, bonusScore, "boss_core_destroy", playerId)
        end
    )
    self.eventBus:on(
        "duel_finished",
        function(____, ____bindingPattern0)
            local isTiebreaker
            local winnerId
            winnerId = ____bindingPattern0.winnerId
            isTiebreaker = ____bindingPattern0.isTiebreaker
            if isTiebreaker or winnerId == nil or not PlayerResource:IsValidPlayerID(winnerId) then
                return
            end
            local team = PlayerResource:GetTeam(winnerId)
            self:addScore(team, EVO_CONSTANTS.SCORE_DUEL_WIN, "duel_win", winnerId)
        end
    )
    self.eventBus:on(
        "phase_changed",
        function(____, ____bindingPattern0)
            local newPhase
            newPhase = ____bindingPattern0.newPhase
            if newPhase == "TIEBREAKER" and not self.matchEnded then
                self:resolveTimeLimitEnd()
            end
            self:syncScoresNetTable()
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
            if command ~= "-evo_score" then
                return
            end
            local team = PlayerResource:GetTeam(playerId)
            local amount = tonumber(args[1]) or 100
            self:addScore(team, amount, "dev_command", playerId)
        end
    )
end
function MatchScoreManager.prototype.getTeamScore(self, team)
    return self.teamScores:get(team) or 0
end
function MatchScoreManager.prototype.getPlayerScore(self, playerId)
    return self.playerScores:get(playerId) or 0
end
function MatchScoreManager.prototype.addScore(self, team, baseDelta, reason, playerId)
    if self.matchEnded or baseDelta == 0 then
        return
    end
    if not self:isPlayableTeam(team) then
        return
    end
    local effectiveDelta = baseDelta
    if baseDelta > 0 then
        local elapsed = GameRules:GetDOTATime(false, false)
        local escalation = calculateEscalationMultiplier(nil, elapsed)
        local leaderScore = self:getLeaderScore()
        local comeback = calculateComebackScoreMultiplier(
            nil,
            self:getTeamScore(team),
            leaderScore
        )
        effectiveDelta = math.max(
            1,
            math.floor(baseDelta * escalation * comeback + 0.5)
        )
    end
    local prevTeamScore = self:getTeamScore(team)
    local newTeamScore = math.max(0, prevTeamScore + effectiveDelta)
    self.teamScores:set(team, newTeamScore)
    if playerId ~= nil and PlayerResource:IsValidPlayerID(playerId) then
        local prevPlayerScore = self:getPlayerScore(playerId)
        self.playerScores:set(
            playerId,
            math.max(0, prevPlayerScore + effectiveDelta)
        )
    end
    self.eventBus:emit("team_score_changed", {team = team, delta = effectiveDelta, newScore = newTeamScore, reason = reason})
    self:syncScoresNetTable()
    if newTeamScore >= EVO_CONSTANTS.TARGET_TEAM_SCORE then
        self:declareWinner(team, "score_limit")
    end
end
function MatchScoreManager.prototype.onGameStateChange(self)
    local state = GameRules:State_Get()
    if state == 8 or state == 10 then
        self:ensureActiveTeamsRegistered()
        self:syncScoresNetTable()
    end
end
function MatchScoreManager.prototype.onEntityKilled(self, event)
    if self.matchEnded then
        return
    end
    local victim = EntIndexToHScript(event.entindex_killed)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return
    end
    if not victim:IsRealHero() then
        return
    end
    local victimPlayerId = victim:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(victimPlayerId) then
        return
    end
    local victimTeam = victim:GetTeamNumber()
    self:addScore(victimTeam, EVO_CONSTANTS.SCORE_HERO_DEATH, "hero_death", victimPlayerId)
    if event.entindex_attacker == nil then
        return
    end
    local attacker = EntIndexToHScript(event.entindex_attacker)
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsBaseNPC() then
        return
    end
    local killerPlayerId = attacker:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(killerPlayerId) then
        return
    end
    local killerTeam = PlayerResource:GetTeam(killerPlayerId)
    if killerTeam ~= victimTeam then
        self:addScore(killerTeam, EVO_CONSTANTS.SCORE_HERO_KILL, "hero_kill", killerPlayerId)
    end
end
function MatchScoreManager.prototype.resolveTimeLimitEnd(self)
    self:ensureActiveTeamsRegistered()
    local activeTeams = self:getActiveTeams()
    if #activeTeams == 0 then
        return
    end
    local maxScore = -1
    local leaders = {}
    for ____, team in ipairs(activeTeams) do
        local score = self:getTeamScore(team)
        if score > maxScore then
            maxScore = score
            leaders = {team}
        elseif score == maxScore then
            leaders[#leaders + 1] = team
        end
    end
    if #leaders == 1 then
        self:declareWinner(leaders[1], "time_limit")
        return
    end
    self.eventBus:emit("tiebreaker_requested", {tiedTeams = leaders})
end
function MatchScoreManager.prototype.declareWinner(self, team, reason)
    if self.matchEnded then
        return
    end
    self.matchEnded = true
    self.eventBus:emit("match_ended", {winnerTeam = team, reason = reason})
    GameRules:SetGameWinner(team)
end
function MatchScoreManager.prototype.ensureActiveTeamsRegistered(self)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue47
                end
                local team = PlayerResource:GetTeam(playerId)
                if self:isPlayableTeam(team) and not self.teamScores:has(team) then
                    self.teamScores:set(team, 0)
                end
                if not self.playerScores:has(playerId) then
                    self.playerScores:set(playerId, 0)
                end
            end
            ::__continue47::
            i = i + 1
        end
    end
end
function MatchScoreManager.prototype.getActiveTeams(self)
    local result = {}
    for ____, team in ipairs(PLAYABLE_TEAMS) do
        if PlayerResource:GetPlayerCountForTeam(team) > 0 or self.teamScores:has(team) then
            result[#result + 1] = team
        end
    end
    return result
end
function MatchScoreManager.prototype.getLeaderScore(self)
    local leader = 0
    for ____, score in __TS__Iterator(self.teamScores:values()) do
        if score > leader then
            leader = score
        end
    end
    return leader
end
function MatchScoreManager.prototype.isPlayableTeam(self, team)
    return __TS__ArrayIncludes(PLAYABLE_TEAMS, team)
end
function MatchScoreManager.prototype.syncScoresNetTable(self)
    self:ensureActiveTeamsRegistered()
    local elapsed = GameRules:GetDOTATime(false, false)
    local escalation = math.floor(calculateEscalationMultiplier(nil, elapsed) * 100 + 0.5) / 100
    local leaderScore = self:getLeaderScore()
    local teamsPayload = {}
    local playerScoresPayload = {}
    for ____, team in ipairs(self:getActiveTeams()) do
        local teamScore = self:getTeamScore(team)
        local comeback = math.floor(calculateComebackScoreMultiplier(nil, teamScore, leaderScore) * 100 + 0.5) / 100
        local teamPlayers = {}
        do
            local i = 0
            while i < DOTA_MAX_TEAM_PLAYERS do
                do
                    local pid = i
                    if not PlayerResource:IsValidPlayerID(pid) then
                        goto __continue62
                    end
                    if PlayerResource:GetTeam(pid) ~= team then
                        goto __continue62
                    end
                    local pScore = self:getPlayerScore(pid)
                    teamPlayers[tostring(pid)] = pScore
                    playerScoresPayload[tostring(pid)] = pScore
                end
                ::__continue62::
                i = i + 1
            end
        end
        teamsPayload[tostring(team)] = {team_id = team, score = teamScore, comeback_mult = comeback, players = teamPlayers}
    end
    CustomNetTables:SetTableValue("match_state", "scores", {target_score = EVO_CONSTANTS.TARGET_TEAM_SCORE, escalation_mult = escalation, teams = teamsPayload, player_scores = playerScoresPayload})
end
return ____exports
