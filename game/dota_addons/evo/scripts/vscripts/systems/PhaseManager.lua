local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 17,["18"] = 17,["19"] = 17,["20"] = 25,["21"] = 25,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 25,["29"] = 27,["30"] = 28,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 33,["50"] = 34,["51"] = 31,["52"] = 31,["53"] = 37,["54"] = 27,["55"] = 40,["56"] = 41,["57"] = 40,["58"] = 44,["59"] = 45,["60"] = 44,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 53,["72"] = 48,["73"] = 61,["74"] = 62,["75"] = 63,["77"] = 66,["78"] = 68,["79"] = 70,["80"] = 74,["81"] = 75,["84"] = 82,["85"] = 83,["86"] = 84,["88"] = 86,["90"] = 88,["91"] = 89,["92"] = 90,["93"] = 91,["94"] = 92,["96"] = 94,["97"] = 95,["100"] = 99,["101"] = 61,["102"] = 102,["103"] = 103,["104"] = 104,["105"] = 102,["106"] = 107,["107"] = 108,["110"] = 109,["111"] = 110,["112"] = 112,["113"] = 118,["114"] = 107,["115"] = 121,["116"] = 122,["117"] = 122,["118"] = 122,["119"] = 122,["120"] = 123,["121"] = 126,["122"] = 129,["123"] = 130,["124"] = 131,["125"] = 132,["126"] = 132,["127"] = 134,["128"] = 139,["130"] = 121,["131"] = 150,["133"] = 151,["134"] = 151,["136"] = 152,["137"] = 153,["138"] = 153,["140"] = 155,["141"] = 156,["142"] = 156,["144"] = 158,["145"] = 159,["146"] = 160,["147"] = 161,["148"] = 162,["149"] = 163,["150"] = 164,["151"] = 165,["154"] = 168,["155"] = 170,["156"] = 171,["157"] = 172,["158"] = 173,["159"] = 173,["160"] = 173,["161"] = 173,["162"] = 173,["165"] = 178,["166"] = 181,["167"] = 182,["168"] = 183,["169"] = 183,["170"] = 183,["171"] = 183,["172"] = 183,["177"] = 151,["180"] = 150,["181"] = 189,["182"] = 190,["185"] = 191,["186"] = 192,["189"] = 193,["192"] = 194,["195"] = 196,["196"] = 196,["197"] = 196,["198"] = 196,["199"] = 197,["200"] = 189,["201"] = 200,["202"] = 201,["203"] = 202,["205"] = 205,["206"] = 206,["207"] = 207,["208"] = 208,["210"] = 210,["211"] = 211,["213"] = 214,["214"] = 215,["215"] = 218,["216"] = 221,["217"] = 222,["219"] = 226,["220"] = 230,["221"] = 231,["223"] = 234,["224"] = 234,["226"] = 237,["227"] = 242,["228"] = 243,["230"] = 246,["231"] = 200,["232"] = 249,["234"] = 250,["235"] = 250,["237"] = 251,["238"] = 252,["239"] = 252,["241"] = 253,["242"] = 254,["243"] = 254,["245"] = 255,["248"] = 250,["251"] = 249,["252"] = 259,["253"] = 260,["254"] = 261,["255"] = 262,["256"] = 268,["258"] = 270,["259"] = 259,["260"] = 273,["261"] = 274,["262"] = 274,["263"] = 274,["265"] = 274,["266"] = 278,["267"] = 279,["268"] = 280,["269"] = 281,["270"] = 282,["271"] = 283,["272"] = 273});
local ____exports = {}
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local calculateEscalationMultiplier = ____game_constants.calculateEscalationMultiplier
____exports.PhaseManager = __TS__Class()
local PhaseManager = ____exports.PhaseManager
PhaseManager.name = "PhaseManager"
function PhaseManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.currentPhase = "INCUBATOR"
    self.started = false
    self.announcedBosses = {}
    self.unlockedTimedTiers = __TS__New(Set, {0})
    self.playerActivity = __TS__New(Map)
    self.lastSyncedEscalation = 1
end
function PhaseManager.prototype.init(self)
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:onNpcSpawned(event) end,
        nil
    )
    self.eventBus:on(
        "biomass_collected",
        function(____, ____bindingPattern0)
            local playerId
            playerId = ____bindingPattern0.playerId
            local activity = self:getOrCreateActivity(
                playerId,
                GameRules:GetDOTATime(false, false)
            )
            activity.lastFeedTime = GameRules:GetDOTATime(false, false)
            activity.starvationWarned = false
        end
    )
    self:syncMatchState(0)
end
function PhaseManager.prototype.getCurrentPhase(self)
    return self.currentPhase
end
function PhaseManager.prototype.getAnnouncedBosses(self)
    return self.announcedBosses
end
function PhaseManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        self:announceMatchBosses()
        self:syncMatchState(0)
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoPhaseManagerThink",
            function() return self:onThink() end,
            1
        )
    end
end
function PhaseManager.prototype.onThink(self)
    if self.currentPhase == "ENDED" then
        return nil
    end
    local elapsed = GameRules:GetDOTATime(false, false)
    for ____, tier in ipairs(EVO_TIERS) do
        if tier.unlockTimeSeconds ~= nil and not self.unlockedTimedTiers:has(tier.tierIndex) and elapsed >= tier.unlockTimeSeconds then
            self.unlockedTimedTiers:add(tier.tierIndex)
            self.eventBus:emit("phase_tier_unlocked", {tierIndex = tier.tierIndex, elapsedTime = elapsed})
        end
    end
    if self.currentPhase == "INCUBATOR" then
        if elapsed >= EVO_CONSTANTS.PHASE1_END_TIME then
            self:transitionToSurface(elapsed)
        else
            self:tickPlayerActivity(elapsed)
        end
    elseif self.currentPhase == "SURFACE" then
        local escalation = calculateEscalationMultiplier(nil, elapsed)
        if math.abs(escalation - self.lastSyncedEscalation) >= 0.05 then
            self.lastSyncedEscalation = escalation
            self:syncMatchState(elapsed)
        end
        if elapsed >= EVO_CONSTANTS.MATCH_TIME_LIMIT then
            self:transitionToPhase("TIEBREAKER", elapsed)
        end
    end
    return 1
end
function PhaseManager.prototype.transitionToSurface(self, elapsed)
    self:clearPeaceTimeModifiers()
    self:transitionToPhase("SURFACE", elapsed)
end
function PhaseManager.prototype.transitionToPhase(self, newPhase, elapsed)
    if self.currentPhase == newPhase then
        return
    end
    local previousPhase = self.currentPhase
    self.currentPhase = newPhase
    self.eventBus:emit("phase_changed", {previousPhase = previousPhase, newPhase = newPhase, elapsedTime = elapsed})
    self:syncMatchState(elapsed)
end
function PhaseManager.prototype.announceMatchBosses(self)
    local pool = __TS__ArrayMap(
        EVO_BOSSES_CATALOG,
        function(____, boss) return boss.id end
    )
    self.announcedBosses = {}
    while #self.announcedBosses < EVO_CONSTANTS.BOSS_COUNT_PER_MATCH and #pool > 0 do
        local idx = RandomInt(0, #pool - 1)
        local bossId = pool[idx + 1]
        __TS__ArraySplice(pool, idx, 1)
        local ____self_announcedBosses_0 = self.announcedBosses
        ____self_announcedBosses_0[#____self_announcedBosses_0 + 1] = bossId
        self.eventBus:emit("boss_event", {bossId = bossId, level = 1, event = "announced"})
        CustomGameEventManager:Send_ServerToAllClients("evo_boss_announcement", {boss_id = bossId, level = 1, event = "announced"})
    end
end
function PhaseManager.prototype.tickPlayerActivity(self, elapsed)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue30
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
                    goto __continue30
                end
                local activity = self:getOrCreateActivity(playerId, elapsed)
                local pos = hero:GetAbsOrigin()
                if activity.lastPosition then
                    local dx = pos.x - activity.lastPosition.x
                    local dy = pos.y - activity.lastPosition.y
                    if dx * dx + dy * dy > 25 then
                        activity.lastMoveTime = elapsed
                        activity.afkWarned = false
                    end
                end
                activity.lastPosition = pos
                if not activity.afkWarned and elapsed - activity.lastMoveTime >= EVO_CONSTANTS.AFK_TIMEOUT_SECONDS then
                    activity.afkWarned = true
                    if IsInToolsMode() then
                        GameRules:SendCustomMessage(
                            ("[Evo] Player " .. tostring(playerId)) .. " AFK detected in Incubator.",
                            0,
                            0
                        )
                    end
                end
                if not activity.starvationWarned and elapsed - activity.lastFeedTime >= EVO_CONSTANTS.STARVATION_TIMEOUT_SECONDS then
                    activity.starvationWarned = true
                    if IsInToolsMode() then
                        GameRules:SendCustomMessage(
                            ("[Evo] Player " .. tostring(playerId)) .. " starvation detected.",
                            0,
                            0
                        )
                    end
                end
            end
            ::__continue30::
            i = i + 1
        end
    end
end
function PhaseManager.prototype.onNpcSpawned(self, event)
    if self.currentPhase ~= "INCUBATOR" then
        return
    end
    local unit = EntIndexToHScript(event.entindex)
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsBaseNPC() then
        return
    end
    if not unit:IsRealHero() then
        return
    end
    if not PlayerResource:IsValidPlayerID(unit:GetPlayerOwnerID()) then
        return
    end
    local remaining = math.max(
        1,
        EVO_CONSTANTS.PHASE1_END_TIME - GameRules:GetDOTATime(false, false)
    )
    unit:AddNewModifier(unit, nil, "modifier_evo_peace_time", {duration = remaining})
end
function PhaseManager.prototype.filterDamage(self, event)
    if event.entindex_attacker_const == nil or event.entindex_victim_const == nil then
        return true
    end
    local attacker = EntIndexToHScript(event.entindex_attacker_const)
    local victim = EntIndexToHScript(event.entindex_victim_const)
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsBaseNPC() then
        return true
    end
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return true
    end
    local attackerTeam = attacker:GetTeamNumber()
    local victimTeam = victim:GetTeamNumber()
    if attacker:GetClassname() == "ent_dota_fountain" and (victimTeam == 4 or victimTeam == 10) then
        event.damage = 0
        return true
    end
    if attackerTeam ~= 4 and attackerTeam ~= victimTeam and (attacker:HasModifier("modifier_fountain_buff_lua") or victim:HasModifier("modifier_fountain_buff_lua")) then
        event.damage = 0
        return true
    end
    if self.currentPhase ~= "INCUBATOR" then
        return true
    end
    if attacker ~= victim and (attacker:HasModifier("modifier_evo_peace_time") or victim:HasModifier("modifier_evo_peace_time")) and PlayerResource:IsValidPlayerID(attacker:GetPlayerOwnerID()) and PlayerResource:IsValidPlayerID(victim:GetPlayerOwnerID()) then
        event.damage = 0
        return false
    end
    return true
end
function PhaseManager.prototype.clearPeaceTimeModifiers(self)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue53
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue53
                end
                hero:RemoveModifierByName("modifier_evo_peace_time")
            end
            ::__continue53::
            i = i + 1
        end
    end
end
function PhaseManager.prototype.getOrCreateActivity(self, playerId, elapsed)
    local activity = self.playerActivity:get(playerId)
    if not activity then
        activity = {lastMoveTime = elapsed, lastFeedTime = elapsed, afkWarned = false, starvationWarned = false}
        self.playerActivity:set(playerId, activity)
    end
    return activity
end
function PhaseManager.prototype.syncMatchState(self, elapsed)
    local ____temp_1 = CustomNetTables:GetTableValue("match_state", "state")
    if ____temp_1 == nil then
        ____temp_1 = {}
    end
    local existing = ____temp_1
    existing.phase = self.currentPhase
    existing.elapsed_time = math.floor(elapsed)
    existing.target_score = EVO_CONSTANTS.TARGET_TEAM_SCORE
    existing.escalation_mult = calculateEscalationMultiplier(nil, elapsed)
    existing.announced_bosses = self.announcedBosses
    CustomNetTables:SetTableValue("match_state", "state", existing)
end
return ____exports
