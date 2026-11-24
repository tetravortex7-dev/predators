local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 14,["11"] = 14,["12"] = 14,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 23,["19"] = 24,["20"] = 26,["21"] = 26,["22"] = 26,["23"] = 31,["24"] = 31,["25"] = 27,["26"] = 28,["27"] = 29,["28"] = 31,["29"] = 33,["30"] = 34,["31"] = 34,["32"] = 34,["33"] = 34,["34"] = 34,["35"] = 33,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["45"] = 37,["46"] = 48,["47"] = 49,["48"] = 50,["49"] = 51,["51"] = 53,["52"] = 53,["54"] = 54,["55"] = 55,["56"] = 55,["58"] = 57,["59"] = 58,["60"] = 58,["62"] = 60,["63"] = 61,["64"] = 61,["66"] = 63,["67"] = 64,["68"] = 65,["72"] = 53,["75"] = 69,["76"] = 69,["77"] = 69,["78"] = 70,["79"] = 71,["80"] = 72,["81"] = 73,["83"] = 76,["84"] = 78,["86"] = 79,["87"] = 79,["89"] = 80,["90"] = 80,["92"] = 82,["93"] = 84,["94"] = 84,["95"] = 84,["96"] = 85,["97"] = 85,["99"] = 87,["100"] = 88,["101"] = 89,["102"] = 90,["103"] = 91,["104"] = 92,["105"] = 94,["106"] = 95,["107"] = 103,["108"] = 106,["109"] = 107,["110"] = 107,["111"] = 107,["112"] = 107,["113"] = 107,["114"] = 107,["115"] = 107,["116"] = 107,["117"] = 107,["118"] = 107,["119"] = 117,["124"] = 121,["125"] = 122,["128"] = 126,["129"] = 48,["130"] = 129,["131"] = 130,["133"] = 131,["134"] = 131,["135"] = 132,["136"] = 133,["137"] = 134,["139"] = 131,["142"] = 137,["143"] = 129,["144"] = 140,["145"] = 141,["146"] = 142,["147"] = 144,["148"] = 144,["149"] = 144,["150"] = 145,["151"] = 146,["153"] = 151,["154"] = 152,["157"] = 156,["158"] = 157,["159"] = 157,["160"] = 157,["161"] = 157,["162"] = 157,["163"] = 140});
local ____exports = {}
local PLAYABLE_TEAMS = {
    2,
    3,
    6,
    7,
    8,
    9
}
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
                if not __TS__ArrayIncludes(PLAYABLE_TEAMS, team) then
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
