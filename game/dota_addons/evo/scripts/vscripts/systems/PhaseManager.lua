local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 8,["18"] = 10,["19"] = 10,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 20,["24"] = 20,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 20,["32"] = 22,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 26,["44"] = 22,["45"] = 29,["46"] = 30,["47"] = 29,["48"] = 33,["49"] = 34,["50"] = 33,["51"] = 37,["52"] = 38,["53"] = 39,["54"] = 40,["55"] = 41,["56"] = 42,["57"] = 43,["58"] = 44,["59"] = 44,["60"] = 44,["61"] = 44,["62"] = 44,["64"] = 37,["65"] = 52,["66"] = 53,["67"] = 54,["69"] = 57,["70"] = 58,["71"] = 60,["72"] = 62,["73"] = 66,["74"] = 67,["77"] = 74,["78"] = 75,["79"] = 76,["81"] = 78,["82"] = 79,["83"] = 80,["84"] = 81,["85"] = 82,["88"] = 86,["89"] = 52,["90"] = 89,["91"] = 90,["92"] = 91,["93"] = 89,["94"] = 94,["95"] = 95,["98"] = 96,["99"] = 97,["100"] = 97,["101"] = 97,["102"] = 97,["103"] = 97,["104"] = 97,["105"] = 97,["107"] = 94,["108"] = 107,["109"] = 108,["110"] = 109,["112"] = 110,["113"] = 110,["115"] = 111,["119"] = 113,["120"] = 113,["122"] = 114,["123"] = 114,["125"] = 115,["126"] = 116,["127"] = 117,["129"] = 118,["130"] = 118,["132"] = 119,["133"] = 119,["134"] = 120,["135"] = 121,["136"] = 122,["137"] = 123,["138"] = 124,["139"] = 125,["140"] = 126,["142"] = 119,["145"] = 118,["148"] = 130,["149"] = 107,["150"] = 133,["151"] = 134,["154"] = 135,["155"] = 136,["156"] = 138,["157"] = 144,["158"] = 133,["159"] = 147,["160"] = 148,["161"] = 148,["162"] = 148,["163"] = 148,["164"] = 149,["165"] = 152,["166"] = 155,["167"] = 156,["168"] = 157,["169"] = 158,["170"] = 158,["171"] = 160,["172"] = 165,["174"] = 147,["175"] = 176,["176"] = 177,["179"] = 178,["180"] = 179,["183"] = 180,["186"] = 181,["189"] = 183,["190"] = 183,["191"] = 183,["192"] = 183,["193"] = 184,["194"] = 176,["195"] = 187,["196"] = 188,["197"] = 189,["199"] = 192,["200"] = 193,["201"] = 194,["202"] = 195,["204"] = 197,["205"] = 198,["207"] = 201,["208"] = 202,["209"] = 205,["210"] = 208,["211"] = 209,["213"] = 213,["214"] = 217,["215"] = 218,["217"] = 221,["218"] = 223,["219"] = 229,["220"] = 230,["222"] = 232,["224"] = 235,["225"] = 235,["226"] = 236,["227"] = 237,["228"] = 238,["230"] = 241,["231"] = 187,["232"] = 244,["234"] = 245,["235"] = 245,["237"] = 246,["238"] = 247,["239"] = 247,["241"] = 248,["242"] = 249,["243"] = 249,["245"] = 250,["248"] = 245,["251"] = 244,["252"] = 254,["253"] = 255,["254"] = 255,["255"] = 255,["257"] = 255,["258"] = 259,["259"] = 260,["260"] = 261,["261"] = 262,["262"] = 263,["263"] = 264,["264"] = 265,["265"] = 254});
local ____exports = {}
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
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
    self.centerFowOrigin = Vector(0, 0, 128)
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
        self.centerFowOrigin = self:resolveCenterFowOrigin()
        self:announceMatchBosses()
        self:syncMatchState(0)
        self:refreshCenterFowVision(0)
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
    self:refreshCenterFowVision(elapsed)
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
function PhaseManager.prototype.refreshCenterFowVision(self, elapsed)
    if elapsed >= EVO_CONSTANTS.CENTER_FOW_REVEAL_SECONDS then
        return
    end
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        AddFOWViewer(
            team,
            self.centerFowOrigin,
            EVO_CONSTANTS.CENTER_FOW_REVEAL_RADIUS,
            1.5,
            false
        )
    end
end
function PhaseManager.prototype.resolveCenterFowOrigin(self)
    local fountains = {}
    for ____, ent in ipairs(Entities:FindAllByClassname("ent_dota_fountain")) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue26
            end
            fountains[#fountains + 1] = ent:GetAbsOrigin()
        end
        ::__continue26::
    end
    if #fountains == 0 then
        return Vector(0, 0, 128)
    end
    if #fountains == 1 then
        return fountains[1]
    end
    local bestA = fountains[1]
    local bestB = fountains[2]
    local maxDistSq = -1
    do
        local i = 0
        while i < #fountains do
            do
                local j = i + 1
                while j < #fountains do
                    local dx = fountains[i + 1].x - fountains[j + 1].x
                    local dy = fountains[i + 1].y - fountains[j + 1].y
                    local dSq = dx * dx + dy * dy
                    if dSq > maxDistSq then
                        maxDistSq = dSq
                        bestA = fountains[i + 1]
                        bestB = fountains[j + 1]
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    return Vector((bestA.x + bestB.x) / 2, (bestA.y + bestB.y) / 2, 128)
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
