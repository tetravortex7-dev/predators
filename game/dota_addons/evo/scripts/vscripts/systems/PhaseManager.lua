local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 17,["18"] = 17,["19"] = 17,["20"] = 25,["21"] = 25,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 25,["29"] = 27,["30"] = 28,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 29,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 36,["55"] = 37,["56"] = 34,["57"] = 34,["58"] = 40,["59"] = 27,["60"] = 43,["61"] = 44,["62"] = 43,["63"] = 47,["64"] = 48,["65"] = 47,["66"] = 51,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 55,["71"] = 56,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 56,["77"] = 51,["78"] = 64,["79"] = 65,["80"] = 66,["82"] = 69,["83"] = 71,["84"] = 73,["85"] = 77,["86"] = 78,["89"] = 85,["90"] = 86,["91"] = 87,["93"] = 89,["95"] = 91,["96"] = 92,["97"] = 93,["98"] = 94,["99"] = 95,["101"] = 97,["102"] = 98,["105"] = 102,["106"] = 64,["107"] = 105,["108"] = 106,["109"] = 107,["110"] = 105,["111"] = 110,["112"] = 111,["115"] = 112,["116"] = 113,["117"] = 115,["118"] = 121,["119"] = 110,["120"] = 124,["121"] = 125,["122"] = 125,["123"] = 125,["124"] = 125,["125"] = 126,["126"] = 129,["127"] = 132,["128"] = 133,["129"] = 134,["130"] = 135,["131"] = 135,["132"] = 137,["133"] = 142,["135"] = 124,["136"] = 153,["138"] = 154,["139"] = 154,["141"] = 155,["142"] = 156,["143"] = 156,["145"] = 158,["146"] = 159,["147"] = 159,["149"] = 161,["150"] = 162,["151"] = 163,["152"] = 164,["153"] = 165,["154"] = 166,["155"] = 167,["156"] = 168,["159"] = 171,["160"] = 173,["161"] = 174,["162"] = 175,["163"] = 176,["164"] = 176,["165"] = 176,["166"] = 176,["167"] = 176,["170"] = 181,["171"] = 184,["172"] = 185,["173"] = 186,["174"] = 186,["175"] = 186,["176"] = 186,["177"] = 186,["182"] = 154,["185"] = 153,["186"] = 192,["187"] = 193,["190"] = 194,["191"] = 195,["194"] = 196,["197"] = 197,["200"] = 199,["201"] = 199,["202"] = 199,["203"] = 199,["204"] = 200,["205"] = 192,["206"] = 203,["207"] = 204,["208"] = 205,["210"] = 208,["211"] = 209,["212"] = 210,["213"] = 211,["215"] = 213,["216"] = 214,["218"] = 217,["219"] = 218,["220"] = 221,["221"] = 224,["222"] = 225,["224"] = 229,["225"] = 233,["226"] = 234,["228"] = 237,["229"] = 237,["231"] = 240,["232"] = 245,["233"] = 246,["235"] = 249,["236"] = 203,["237"] = 252,["239"] = 253,["240"] = 253,["242"] = 254,["243"] = 255,["244"] = 255,["246"] = 256,["247"] = 257,["248"] = 257,["250"] = 258,["253"] = 253,["256"] = 252,["257"] = 262,["258"] = 263,["259"] = 264,["260"] = 265,["261"] = 271,["263"] = 273,["264"] = 262,["265"] = 276,["266"] = 277,["267"] = 277,["268"] = 277,["270"] = 277,["271"] = 281,["272"] = 282,["273"] = 283,["274"] = 284,["275"] = 285,["276"] = 286,["277"] = 276});
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
    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetDamageFilter(
        function(____, event) return self:onDamageFilter(event) end,
        self
    )
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
                    goto __continue31
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
                    goto __continue31
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
            ::__continue31::
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
function PhaseManager.prototype.onDamageFilter(self, event)
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
                    goto __continue54
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue54
                end
                hero:RemoveModifierByName("modifier_evo_peace_time")
            end
            ::__continue54::
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
