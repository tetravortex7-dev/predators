local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 18,["23"] = 18,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 16,["29"] = 18,["30"] = 20,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 22,["40"] = 22,["41"] = 24,["42"] = 20,["43"] = 27,["44"] = 28,["45"] = 27,["46"] = 31,["47"] = 32,["48"] = 31,["49"] = 35,["50"] = 36,["51"] = 37,["52"] = 38,["53"] = 39,["54"] = 40,["55"] = 40,["56"] = 40,["57"] = 40,["58"] = 40,["60"] = 35,["61"] = 48,["62"] = 49,["63"] = 50,["65"] = 53,["66"] = 55,["67"] = 57,["68"] = 61,["69"] = 62,["72"] = 69,["73"] = 70,["74"] = 71,["76"] = 73,["77"] = 74,["78"] = 75,["79"] = 76,["80"] = 77,["83"] = 81,["84"] = 48,["85"] = 84,["86"] = 85,["87"] = 86,["88"] = 84,["89"] = 89,["90"] = 90,["93"] = 91,["94"] = 92,["95"] = 94,["96"] = 100,["97"] = 89,["98"] = 103,["99"] = 104,["100"] = 104,["101"] = 104,["102"] = 104,["103"] = 105,["104"] = 108,["105"] = 111,["106"] = 112,["107"] = 113,["108"] = 114,["109"] = 114,["110"] = 116,["111"] = 121,["113"] = 103,["114"] = 132,["115"] = 133,["118"] = 134,["119"] = 135,["122"] = 136,["125"] = 137,["128"] = 139,["129"] = 139,["130"] = 139,["131"] = 139,["132"] = 140,["133"] = 132,["134"] = 143,["135"] = 144,["136"] = 145,["138"] = 148,["139"] = 149,["140"] = 150,["141"] = 151,["143"] = 153,["144"] = 154,["146"] = 157,["147"] = 158,["148"] = 161,["149"] = 164,["150"] = 165,["152"] = 169,["153"] = 173,["154"] = 174,["156"] = 177,["157"] = 179,["158"] = 185,["159"] = 186,["161"] = 188,["163"] = 191,["164"] = 191,["165"] = 192,["166"] = 193,["167"] = 194,["169"] = 197,["170"] = 143,["171"] = 200,["173"] = 201,["174"] = 201,["176"] = 202,["177"] = 203,["178"] = 203,["180"] = 204,["181"] = 205,["182"] = 205,["184"] = 206,["187"] = 201,["190"] = 200,["191"] = 210,["192"] = 211,["193"] = 211,["194"] = 211,["196"] = 211,["197"] = 215,["198"] = 216,["199"] = 217,["200"] = 218,["201"] = 219,["202"] = 220,["203"] = 221,["204"] = 210});
local ____exports = {}
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local calculateEscalationMultiplier = ____game_constants.calculateEscalationMultiplier
local calculateTargetTeamScore = ____game_constants.calculateTargetTeamScore
local ____fountain_combat_guard = require("lib.fountain_combat_guard")
local markFountainCombatLock = ____fountain_combat_guard.markFountainCombatLock
____exports.PhaseManager = __TS__Class()
local PhaseManager = ____exports.PhaseManager
PhaseManager.name = "PhaseManager"
function PhaseManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.currentPhase = "INCUBATOR"
    self.started = false
    self.announcedBosses = {}
    self.unlockedTimedTiers = __TS__New(Set, {0})
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
        end
    elseif self.currentPhase == "SURFACE" then
        local escalation = calculateEscalationMultiplier(nil, elapsed)
        if math.abs(escalation - self.lastSyncedEscalation) >= 0.05 then
            self.lastSyncedEscalation = escalation
            self:syncMatchState(elapsed)
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
    if self.currentPhase == "INCUBATOR" then
        if attacker ~= victim and (attacker:HasModifier("modifier_evo_peace_time") or victim:HasModifier("modifier_evo_peace_time")) and PlayerResource:IsValidPlayerID(attacker:GetPlayerOwnerID()) and PlayerResource:IsValidPlayerID(victim:GetPlayerOwnerID()) then
            event.damage = 0
            return false
        end
        return true
    end
    local ____opt_1 = GameRules.EvoAddon
    local duelMgr = ____opt_1 and ____opt_1.duelManager
    local onArena = duelMgr ~= nil and (duelMgr:isActiveDuelist(attacker) or duelMgr:isActiveDuelist(victim))
    if not onArena and event.damage > 0 then
        markFountainCombatLock(nil, attacker, victim, EVO_CONSTANTS.FOUNTAIN_COMBAT_LOCK_SECONDS)
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
                    goto __continue41
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue41
                end
                hero:RemoveModifierByName("modifier_evo_peace_time")
            end
            ::__continue41::
            i = i + 1
        end
    end
end
function PhaseManager.prototype.syncMatchState(self, elapsed)
    local ____temp_3 = CustomNetTables:GetTableValue("match_state", "state")
    if ____temp_3 == nil then
        ____temp_3 = {}
    end
    local existing = ____temp_3
    existing.phase = self.currentPhase
    existing.elapsed_time = math.floor(elapsed)
    existing.phase_end_time = self.currentPhase == "INCUBATOR" and EVO_CONSTANTS.PHASE1_END_TIME or 0
    existing.target_score = calculateTargetTeamScore(nil)
    existing.escalation_mult = calculateEscalationMultiplier(nil, elapsed)
    existing.announced_bosses = self.announcedBosses
    CustomNetTables:SetTableValue("match_state", "state", existing)
end
return ____exports
