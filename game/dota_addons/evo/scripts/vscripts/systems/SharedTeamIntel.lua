local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 15,["13"] = 16,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 23,["18"] = 23,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 23,["23"] = 25,["24"] = 26,["25"] = 26,["26"] = 26,["27"] = 26,["28"] = 26,["29"] = 25,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["39"] = 29,["40"] = 40,["41"] = 41,["42"] = 42,["43"] = 43,["45"] = 45,["46"] = 45,["48"] = 46,["49"] = 47,["50"] = 47,["52"] = 49,["53"] = 50,["54"] = 50,["56"] = 52,["57"] = 53,["58"] = 53,["60"] = 55,["61"] = 56,["62"] = 57,["66"] = 45,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 62,["73"] = 63,["74"] = 64,["75"] = 65,["77"] = 68,["78"] = 70,["80"] = 71,["81"] = 71,["83"] = 72,["84"] = 72,["86"] = 74,["87"] = 76,["88"] = 76,["89"] = 76,["90"] = 77,["91"] = 77,["93"] = 79,["94"] = 80,["95"] = 81,["96"] = 82,["97"] = 83,["98"] = 84,["99"] = 86,["100"] = 87,["101"] = 95,["102"] = 98,["103"] = 99,["104"] = 99,["105"] = 99,["106"] = 99,["107"] = 99,["108"] = 99,["109"] = 99,["110"] = 99,["111"] = 99,["112"] = 99,["113"] = 109,["118"] = 113,["119"] = 114,["122"] = 118,["123"] = 40,["124"] = 121,["125"] = 122,["127"] = 123,["128"] = 123,["129"] = 124,["130"] = 125,["131"] = 126,["133"] = 123,["136"] = 129,["137"] = 121,["138"] = 132,["139"] = 133,["140"] = 134,["141"] = 136,["142"] = 136,["143"] = 136,["144"] = 137,["145"] = 138,["147"] = 143,["148"] = 144,["151"] = 148,["152"] = 149,["153"] = 149,["154"] = 149,["155"] = 149,["156"] = 149,["157"] = 132});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local INTEL_TICK_SECONDS = 1
local LAST_SEEN_REFRESH_SECONDS = 5
____exports.SharedTeamIntel = __TS__Class()
local SharedTeamIntel = ____exports.SharedTeamIntel
SharedTeamIntel.name = "SharedTeamIntel"
function SharedTeamIntel.prototype.____constructor(self, evolutionManager)
    self.evolutionManager = evolutionManager
    self.dossiersByTeam = __TS__New(Map)
    self.lastSignatureByTeam = __TS__New(Map)
    self.started = false
end
function SharedTeamIntel.prototype.init(self)
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
end
function SharedTeamIntel.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoSharedTeamIntelThink",
            function() return self:onThink() end,
            INTEL_TICK_SECONDS
        )
    end
end
function SharedTeamIntel.prototype.onThink(self)
    local now = math.floor(GameRules:GetDOTATime(false, false))
    local teamObservers = __TS__New(Map)
    local allHeroes = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue9
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue9
                end
                local team = PlayerResource:GetTeam(playerId)
                if not __TS__ArrayIncludes(EVO_PLAYABLE_TEAMS, team) then
                    goto __continue9
                end
                allHeroes[#allHeroes + 1] = {playerId = playerId, team = team, hero = hero}
                if not teamObservers:has(team) then
                    teamObservers:set(team, hero)
                end
            end
            ::__continue9::
            i = i + 1
        end
    end
    for ____, ____value in __TS__Iterator(teamObservers:entries()) do
        local observerTeam = ____value[1]
        local observerHero = ____value[2]
        local teamDossier = self.dossiersByTeam:get(observerTeam)
        if not teamDossier then
            teamDossier = __TS__New(Map)
            self.dossiersByTeam:set(observerTeam, teamDossier)
        end
        local changed = false
        for ____, target in ipairs(allHeroes) do
            do
                if target.team == observerTeam then
                    goto __continue16
                end
                if not target.hero:IsAlive() then
                    goto __continue16
                end
                local canSee = observerHero:CanEntityBeSeenByMyTeam(target.hero) or IsLocationVisible(
                    observerTeam,
                    target.hero:GetAbsOrigin()
                ) and not target.hero:IsInvisible()
                if not canSee then
                    goto __continue16
                end
                local body = self.evolutionManager:getPlayerBody(target.playerId)
                local bodyId = body and body.id or "evo_body_t1_amoeba"
                local tierIndex = self.evolutionManager:getPlayerTierIndex(target.playerId)
                local level = target.hero:GetLevel()
                local items = self:collectHeroItems(target.hero)
                local mutations = self.evolutionManager:getPlayerMutations(target.playerId)
                local previous = teamDossier:get(target.playerId)
                local coreChanged = not previous or previous.body_id ~= bodyId or previous.tier_index ~= tierIndex or previous.level ~= level or table.concat(previous.items, ",") ~= table.concat(items, ",") or table.concat(previous.mutations, ",") ~= table.concat(mutations, ",")
                local timeRefreshed = not previous or now - previous.last_seen_time >= LAST_SEEN_REFRESH_SECONDS
                if coreChanged or timeRefreshed then
                    teamDossier:set(target.playerId, {
                        player_id = target.playerId,
                        team_id = target.team,
                        body_id = bodyId,
                        tier_index = tierIndex,
                        level = level,
                        items = items,
                        mutations = mutations,
                        last_seen_time = now
                    })
                    changed = true
                end
            end
            ::__continue16::
        end
        if changed then
            self:syncTeamDossier(observerTeam, teamDossier)
        end
    end
    return INTEL_TICK_SECONDS
end
function SharedTeamIntel.prototype.collectHeroItems(self, hero)
    local items = {}
    do
        local slot = 0
        while slot < 6 do
            local item = hero:GetItemInSlot(slot)
            if item and not item:IsNull() then
                items[#items + 1] = item:GetAbilityName()
            end
            slot = slot + 1
        end
    end
    return items
end
function SharedTeamIntel.prototype.syncTeamDossier(self, team, dossier)
    local payload = {}
    local signatureParts = {}
    for ____, ____value in __TS__Iterator(dossier:entries()) do
        local enemyId = ____value[1]
        local entry = ____value[2]
        payload[tostring(enemyId)] = entry
        signatureParts[#signatureParts + 1] = (((((((((tostring(enemyId) .. ":") .. entry.body_id) .. ":") .. tostring(entry.level)) .. ":") .. table.concat(entry.items, "|")) .. ":") .. table.concat(entry.mutations, "|")) .. ":") .. tostring(entry.last_seen_time)
    end
    local signature = table.concat(signatureParts, ";")
    if self.lastSignatureByTeam:get(team) == signature then
        return
    end
    self.lastSignatureByTeam:set(team, signature)
    CustomNetTables:SetTableValue(
        "enemy_dossier",
        tostring(team),
        payload
    )
end
return ____exports
