local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 17,["17"] = 17,["18"] = 17,["19"] = 22,["20"] = 22,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 22,["25"] = 24,["26"] = 25,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 25,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 29,["46"] = 30,["47"] = 31,["48"] = 33,["49"] = 28,["50"] = 28,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 36,["58"] = 36,["59"] = 36,["60"] = 36,["61"] = 36,["62"] = 37,["65"] = 38,["66"] = 38,["67"] = 38,["68"] = 38,["69"] = 39,["70"] = 43,["71"] = 36,["72"] = 36,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 46,["79"] = 46,["80"] = 46,["81"] = 46,["82"] = 47,["83"] = 46,["84"] = 46,["85"] = 50,["86"] = 50,["87"] = 50,["88"] = 50,["89"] = 50,["90"] = 50,["91"] = 50,["92"] = 51,["95"] = 52,["96"] = 53,["97"] = 54,["98"] = 57,["99"] = 58,["100"] = 59,["102"] = 50,["103"] = 50,["104"] = 63,["105"] = 63,["106"] = 63,["107"] = 64,["108"] = 63,["109"] = 63,["110"] = 67,["111"] = 67,["112"] = 67,["113"] = 68,["114"] = 67,["115"] = 67,["116"] = 71,["117"] = 71,["118"] = 71,["119"] = 71,["120"] = 71,["121"] = 71,["122"] = 71,["123"] = 71,["124"] = 71,["125"] = 72,["128"] = 73,["129"] = 74,["130"] = 75,["131"] = 71,["132"] = 71,["133"] = 24,["134"] = 79,["135"] = 80,["136"] = 79,["137"] = 83,["138"] = 84,["139"] = 83,["140"] = 87,["141"] = 88,["142"] = 88,["144"] = 89,["145"] = 89,["147"] = 91,["148"] = 92,["149"] = 93,["150"] = 94,["151"] = 95,["152"] = 96,["153"] = 96,["154"] = 96,["155"] = 96,["156"] = 96,["157"] = 97,["158"] = 97,["159"] = 97,["160"] = 97,["162"] = 100,["163"] = 101,["164"] = 102,["165"] = 104,["166"] = 105,["167"] = 106,["168"] = 106,["169"] = 106,["170"] = 106,["172"] = 109,["173"] = 116,["174"] = 118,["175"] = 119,["176"] = 120,["178"] = 122,["179"] = 87,["180"] = 125,["181"] = 126,["182"] = 127,["183"] = 128,["184"] = 129,["186"] = 125,["187"] = 133,["188"] = 134,["191"] = 135,["192"] = 136,["195"] = 137,["198"] = 139,["199"] = 140,["202"] = 142,["203"] = 143,["204"] = 145,["207"] = 146,["208"] = 147,["211"] = 149,["212"] = 150,["215"] = 152,["216"] = 153,["217"] = 154,["219"] = 133,["220"] = 158,["221"] = 159,["224"] = 160,["225"] = 162,["226"] = 166,["227"] = 158,["228"] = 169,["230"] = 170,["231"] = 170,["233"] = 171,["234"] = 172,["235"] = 172,["237"] = 173,["238"] = 174,["239"] = 175,["241"] = 177,["242"] = 178,["246"] = 170,["249"] = 169,["250"] = 183,["251"] = 184,["252"] = 185,["253"] = 186,["254"] = 187,["257"] = 190,["258"] = 183,["259"] = 193,["260"] = 194,["261"] = 195,["262"] = 196,["263"] = 197,["266"] = 200,["267"] = 193,["268"] = 203,["269"] = 204,["270"] = 203,["271"] = 207,["272"] = 208,["273"] = 209,["274"] = 210,["275"] = 211,["276"] = 213,["277"] = 214,["278"] = 216,["279"] = 217,["280"] = 218,["281"] = 220,["283"] = 222,["284"] = 222,["286"] = 223,["287"] = 224,["288"] = 224,["290"] = 225,["291"] = 225,["293"] = 226,["294"] = 227,["295"] = 228,["298"] = 222,["301"] = 231,["303"] = 239,["304"] = 239,["305"] = 239,["306"] = 242,["307"] = 242,["308"] = 242,["309"] = 242,["310"] = 242,["311"] = 239,["312"] = 239,["313"] = 207});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local calculateComebackScoreMultiplier = ____game_constants.calculateComebackScoreMultiplier
local calculateEscalationMultiplier = ____game_constants.calculateEscalationMultiplier
local calculateTargetTeamScore = ____game_constants.calculateTargetTeamScore
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
            local awarded = self:addScore(team, EVO_CONSTANTS.SCORE_DUEL_WIN, "duel_win", winnerId)
            local existing = CustomNetTables:GetTableValue("duel_state", "last_result")
            if existing then
                existing.score_reward = awarded
                CustomNetTables:SetTableValue("duel_state", "last_result", existing)
            end
        end
    )
    self.eventBus:on(
        "phase_changed",
        function()
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
        return 0
    end
    if not self:isPlayableTeam(team) then
        return 0
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
    local targetScore = calculateTargetTeamScore(nil)
    if newTeamScore >= targetScore then
        self:declareWinner(team, "score_limit")
    end
    return effectiveDelta
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
                    goto __continue40
                end
                local team = PlayerResource:GetTeam(playerId)
                if self:isPlayableTeam(team) and not self.teamScores:has(team) then
                    self.teamScores:set(team, 0)
                end
                if not self.playerScores:has(playerId) then
                    self.playerScores:set(playerId, 0)
                end
            end
            ::__continue40::
            i = i + 1
        end
    end
end
function MatchScoreManager.prototype.getActiveTeams(self)
    local result = {}
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
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
    return __TS__ArrayIncludes(EVO_PLAYABLE_TEAMS, team)
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
                        goto __continue55
                    end
                    if PlayerResource:GetTeam(pid) ~= team then
                        goto __continue55
                    end
                    local pScore = self:getPlayerScore(pid)
                    teamPlayers[tostring(pid)] = pScore
                    playerScoresPayload[tostring(pid)] = pScore
                end
                ::__continue55::
                i = i + 1
            end
        end
        teamsPayload[tostring(team)] = {team_id = team, score = teamScore, comeback_mult = comeback, players = teamPlayers}
    end
    CustomNetTables:SetTableValue(
        "match_state",
        "scores",
        {
            target_score = calculateTargetTeamScore(nil),
            escalation_mult = escalation,
            teams = teamsPayload,
            player_scores = playerScoresPayload
        }
    )
end
return ____exports
