local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 4,["20"] = 4,["21"] = 10,["22"] = 11,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 30,["27"] = 30,["28"] = 31,["29"] = 14,["30"] = 15,["31"] = 16,["32"] = 17,["33"] = 19,["34"] = 20,["35"] = 21,["36"] = 22,["37"] = 23,["38"] = 25,["39"] = 26,["40"] = 27,["41"] = 29,["42"] = 34,["43"] = 35,["44"] = 36,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 39,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 40,["56"] = 40,["57"] = 40,["58"] = 40,["59"] = 40,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 43,["64"] = 42,["65"] = 42,["66"] = 46,["67"] = 46,["68"] = 46,["69"] = 47,["70"] = 48,["71"] = 46,["72"] = 46,["73"] = 51,["74"] = 51,["75"] = 51,["76"] = 51,["77"] = 51,["78"] = 51,["79"] = 51,["80"] = 52,["81"] = 53,["83"] = 51,["84"] = 51,["85"] = 34,["86"] = 58,["87"] = 59,["88"] = 60,["89"] = 61,["90"] = 62,["91"] = 63,["93"] = 65,["95"] = 67,["96"] = 68,["97"] = 69,["98"] = 69,["99"] = 69,["100"] = 69,["101"] = 69,["103"] = 58,["104"] = 77,["105"] = 78,["106"] = 78,["108"] = 79,["109"] = 80,["110"] = 77,["111"] = 83,["112"] = 84,["113"] = 85,["115"] = 86,["116"] = 86,["118"] = 87,["119"] = 88,["120"] = 90,["121"] = 91,["122"] = 92,["124"] = 94,["125"] = 95,["126"] = 96,["127"] = 97,["131"] = 100,["132"] = 100,["133"] = 100,["134"] = 100,["135"] = 101,["136"] = 102,["137"] = 102,["138"] = 102,["139"] = 102,["140"] = 104,["141"] = 105,["142"] = 105,["143"] = 105,["144"] = 106,["145"] = 107,["146"] = 108,["147"] = 109,["148"] = 109,["150"] = 110,["151"] = 105,["152"] = 105,["153"] = 83,["154"] = 114,["155"] = 115,["156"] = 115,["158"] = 116,["159"] = 117,["160"] = 118,["162"] = 119,["163"] = 119,["164"] = 120,["166"] = 121,["167"] = 121,["168"] = 122,["169"] = 123,["170"] = 124,["171"] = 125,["172"] = 126,["173"] = 127,["174"] = 128,["175"] = 129,["177"] = 121,["180"] = 119,["183"] = 133,["184"] = 114,["185"] = 136,["186"] = 137,["187"] = 138,["188"] = 142,["189"] = 145,["191"] = 146,["192"] = 146,["194"] = 147,["195"] = 147,["196"] = 147,["197"] = 147,["198"] = 147,["200"] = 148,["201"] = 148,["202"] = 148,["203"] = 148,["204"] = 149,["205"] = 150,["206"] = 150,["211"] = 154,["213"] = 155,["214"] = 155,["216"] = 156,["217"] = 156,["218"] = 156,["219"] = 156,["220"] = 157,["221"] = 158,["222"] = 158,["227"] = 162,["228"] = 163,["230"] = 164,["231"] = 164,["232"] = 165,["233"] = 166,["234"] = 167,["235"] = 167,["236"] = 167,["237"] = 167,["238"] = 166,["239"] = 166,["240"] = 166,["241"] = 170,["242"] = 171,["243"] = 171,["245"] = 164,["249"] = 136,["250"] = 177,["251"] = 178,["252"] = 178,["254"] = 179,["255"] = 180,["256"] = 181,["257"] = 182,["258"] = 182,["261"] = 184,["262"] = 185,["263"] = 186,["264"] = 187,["265"] = 187,["268"] = 189,["269"] = 177,["270"] = 192,["271"] = 193,["274"] = 195,["276"] = 196,["277"] = 196,["279"] = 197,["280"] = 198,["281"] = 198,["283"] = 199,["284"] = 199,["285"] = 199,["286"] = 199,["287"] = 199,["289"] = 200,["290"] = 201,["294"] = 196,["298"] = 205,["299"] = 205,["300"] = 206,["301"] = 207,["302"] = 208,["303"] = 209,["304"] = 205,["307"] = 212,["308"] = 213,["310"] = 192,["311"] = 217,["312"] = 218,["313"] = 219,["314"] = 219,["316"] = 221,["317"] = 222,["318"] = 223,["319"] = 223,["320"] = 224,["322"] = 227,["323"] = 228,["324"] = 229,["325"] = 230,["326"] = 231,["328"] = 233,["330"] = 236,["331"] = 237,["332"] = 237,["333"] = 238,["334"] = 217,["335"] = 241,["336"] = 242,["337"] = 243,["339"] = 245,["340"] = 246,["341"] = 247,["342"] = 248,["343"] = 249,["344"] = 249,["345"] = 249,["346"] = 249,["347"] = 249,["348"] = 254,["349"] = 241,["350"] = 257,["351"] = 258,["352"] = 259,["355"] = 260,["358"] = 262,["359"] = 263,["362"] = 264,["363"] = 264,["364"] = 264,["365"] = 264,["368"] = 266,["369"] = 267,["370"] = 268,["371"] = 270,["372"] = 271,["373"] = 272,["374"] = 273,["375"] = 274,["376"] = 275,["377"] = 276,["379"] = 279,["380"] = 257,["381"] = 282,["382"] = 283,["383"] = 284,["386"] = 285,["389"] = 286,["392"] = 288,["393"] = 289,["396"] = 290,["397"] = 291,["398"] = 292,["399"] = 282,["400"] = 295,["401"] = 296,["402"] = 295,["403"] = 299,["404"] = 300,["407"] = 301,["408"] = 302,["411"] = 303,["414"] = 304,["417"] = 306,["418"] = 307,["419"] = 308,["422"] = 310,["423"] = 311,["424"] = 313,["425"] = 318,["426"] = 318,["427"] = 318,["428"] = 318,["429"] = 318,["430"] = 319,["431"] = 321,["432"] = 322,["433"] = 323,["434"] = 325,["435"] = 330,["436"] = 330,["437"] = 330,["438"] = 330,["439"] = 330,["440"] = 331,["441"] = 333,["442"] = 334,["443"] = 299,["444"] = 337,["445"] = 338,["446"] = 339,["448"] = 342,["450"] = 343,["451"] = 343,["453"] = 344,["454"] = 345,["455"] = 345,["457"] = 346,["458"] = 346,["460"] = 347,["461"] = 348,["462"] = 348,["464"] = 349,["467"] = 343,["470"] = 352,["471"] = 353,["472"] = 353,["473"] = 353,["474"] = 354,["475"] = 355,["476"] = 356,["477"] = 357,["478"] = 357,["481"] = 359,["482"] = 353,["483"] = 353,["484"] = 362,["485"] = 363,["486"] = 337,["487"] = 366,["488"] = 367,["489"] = 367,["490"] = 367,["491"] = 367,["492"] = 367,["493"] = 367,["494"] = 366,["495"] = 370,["496"] = 371,["497"] = 371,["499"] = 372,["500"] = 373,["501"] = 374,["502"] = 375,["503"] = 376,["504"] = 377,["505"] = 378,["507"] = 380,["508"] = 370,["509"] = 383,["510"] = 384,["511"] = 385,["513"] = 387,["514"] = 387,["516"] = 388,["517"] = 389,["518"] = 389,["520"] = 390,["521"] = 391,["522"] = 398,["523"] = 399,["524"] = 403,["527"] = 387,["530"] = 406,["531"] = 407,["534"] = 408,["535"] = 410,["536"] = 383});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local ____fountain_combat_guard = require("lib.fountain_combat_guard")
local clearFountainCombatLock = ____fountain_combat_guard.clearFountainCombatLock
local ____unit_helpers = require("lib.unit_helpers")
local focusPlayerCamera = ____unit_helpers.focusPlayerCamera
local PARTICLE_BLINK_START = "particles/items_fx/blink_dagger_start.vpcf"
local PARTICLE_BLINK_END = "particles/items_fx/blink_dagger_end.vpcf"
____exports.FountainManager = __TS__Class()
local FountainManager = ____exports.FountainManager
FountainManager.name = "FountainManager"
function FountainManager.prototype.____constructor(self, eventBus, isActiveDuelist)
    self.eventBus = eventBus
    self.isActiveDuelist = isActiveDuelist
    self.basePositions = {}
    self.baseDirections = {}
    self.allFountainPositions = {}
    self.teleportTargets = {}
    self.playerBaseIndex = __TS__New(Map)
    self.baseCounts = {0, 0}
    self.initialSpawnDone = __TS__New(Set)
    self.pendingRespawn = __TS__New(Set)
    self.lastTeleportTime = __TS__New(Map)
    self.started = false
    self.matchEnded = false
    self.lastSyncedSignature = ""
end
function FountainManager.prototype.init(self)
    self:initFountains()
    self:discoverTeleportTargets()
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
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:onEntityKilled(event) end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "evo_fountain_teleport",
        function(_, event)
            self:onTeleportRequest(event)
        end
    )
    self.eventBus:on(
        "match_ended",
        function()
            self.matchEnded = true
            self:syncFountainHudState(true)
        end
    )
    self.eventBus:on(
        "dev_command",
        function(____, ____bindingPattern0)
            local command
            local playerId
            playerId = ____bindingPattern0.playerId
            command = ____bindingPattern0.command
            if command == "-evo_tp" then
                self:teleportFromFountain(playerId, true)
            end
        end
    )
end
function FountainManager.prototype.onGameStateChange(self)
    local state = GameRules:State_Get()
    if state == 8 or state == 10 then
        if #self.basePositions == 0 then
            self:initFountains()
            self:discoverTeleportTargets()
        end
        self:assignAllPlayersToBases()
    end
    if state == 10 and not self.started then
        self.started = true
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoFountainHudThink",
            function() return self:onThink() end,
            0.25
        )
    end
end
function FountainManager.prototype.onThink(self)
    if self.matchEnded then
        return nil
    end
    self:syncFountainHudState(false)
    return 0.25
end
function FountainManager.prototype.initFountains(self)
    local fountains = {}
    for ____, ent in ipairs(Entities:FindAllByClassname("ent_dota_fountain")) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) or not ent:IsBaseNPC() then
                goto __continue19
            end
            ent:SetAttackCapability(0)
            ent:SetTeam(5)
            local atkAbility = ent:FindAbilityByName("fountain_attack_lua")
            if atkAbility and not atkAbility:IsNull() then
                ent:RemoveAbilityByHandle(atkAbility)
            end
            ent:RemoveModifierByName("modifier_fountain_attack_lua")
            ent:RemoveModifierByName("modifier_fountain_aura")
            ent:AddNewModifier(ent, nil, "modifier_fountain_aura_lua", {})
            fountains[#fountains + 1] = ent
        end
        ::__continue19::
    end
    self.allFountainPositions = __TS__ArrayMap(
        fountains,
        function(____, f) return f:GetAbsOrigin() end
    )
    local chosen = self:selectTwoBaseFountains(fountains)
    self.basePositions = __TS__ArrayMap(
        chosen,
        function(____, f) return f:GetAbsOrigin() end
    )
    local mapCenter = self:computeCentroid(self.basePositions)
    self.baseDirections = __TS__ArrayMap(
        self.basePositions,
        function(____, pos)
            local dx = mapCenter.x - pos.x
            local dy = mapCenter.y - pos.y
            local len = math.sqrt(dx * dx + dy * dy)
            if len < 1 then
                return Vector(1, 0, 0)
            end
            return Vector(dx / len, dy / len, 0)
        end
    )
end
function FountainManager.prototype.selectTwoBaseFountains(self, fountains)
    if #fountains <= 2 then
        return {unpack(fountains)}
    end
    local bestA = fountains[1]
    local bestB = fountains[2]
    local maxDistSq = -1
    do
        local i = 0
        while i < #fountains do
            local a = fountains[i + 1]:GetAbsOrigin()
            do
                local j = i + 1
                while j < #fountains do
                    local b = fountains[j + 1]:GetAbsOrigin()
                    local dx = a.x - b.x
                    local dy = a.y - b.y
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
    return {bestA, bestB}
end
function FountainManager.prototype.discoverTeleportTargets(self)
    self.teleportTargets = {}
    local duelEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) or Entities:FindByName(nil, "duel_1") or Entities:FindByName(nil, "duel_trigger")
    local duelCenter = duelEnt and not duelEnt:IsNull() and IsValidEntity(duelEnt) and duelEnt:GetAbsOrigin() or nil
    for ____, trigger in ipairs(Entities:FindAllByClassname("trigger_multiple")) do
        do
            if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
                goto __continue33
            end
            if not __TS__StringStartsWith(
                trigger:GetName(),
                "neutralcamp_"
            ) then
                goto __continue33
            end
            local pos = GetGroundPosition(
                trigger:GetAbsOrigin(),
                nil
            )
            if self:isSafeTeleportPoint(pos, duelCenter) then
                local ____self_teleportTargets_0 = self.teleportTargets
                ____self_teleportTargets_0[#____self_teleportTargets_0 + 1] = pos
            end
        end
        ::__continue33::
    end
    for ____, ent in ipairs(Entities:FindAllByName("dota_rune_spawner_*")) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue38
            end
            local pos = GetGroundPosition(
                ent:GetAbsOrigin(),
                nil
            )
            if self:isSafeTeleportPoint(pos, duelCenter) then
                local ____self_teleportTargets_1 = self.teleportTargets
                ____self_teleportTargets_1[#____self_teleportTargets_1 + 1] = pos
            end
        end
        ::__continue38::
    end
    if #self.teleportTargets == 0 then
        local centroid = self:computeCentroid(self.allFountainPositions)
        do
            local i = 0
            while i < 8 do
                local angle = i / 8 * math.pi * 2
                local probe = GetGroundPosition(
                    Vector(
                        centroid.x + math.cos(angle) * 900,
                        centroid.y + math.sin(angle) * 900,
                        centroid.z
                    ),
                    nil
                )
                if self:isSafeTeleportPoint(probe, duelCenter) then
                    local ____self_teleportTargets_2 = self.teleportTargets
                    ____self_teleportTargets_2[#____self_teleportTargets_2 + 1] = probe
                end
                i = i + 1
            end
        end
    end
end
function FountainManager.prototype.isSafeTeleportPoint(self, pos, duelCenter)
    if not GridNav:IsTraversable(pos) or GridNav:IsBlocked(pos) then
        return false
    end
    for ____, fPos in ipairs(self.allFountainPositions) do
        local dx = pos.x - fPos.x
        local dy = pos.y - fPos.y
        if dx * dx + dy * dy < 1400 * 1400 then
            return false
        end
    end
    if duelCenter ~= nil then
        local dx = pos.x - duelCenter.x
        local dy = pos.y - duelCenter.y
        if dx * dx + dy * dy < 900 * 900 then
            return false
        end
    end
    return true
end
function FountainManager.prototype.assignAllPlayersToBases(self)
    if #self.basePositions == 0 then
        return
    end
    local unassigned = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue54
                end
                if not __TS__ArrayIncludes(
                    EVO_PLAYABLE_TEAMS,
                    PlayerResource:GetTeam(pid)
                ) then
                    goto __continue54
                end
                if not self.playerBaseIndex:has(pid) then
                    unassigned[#unassigned + 1] = pid
                end
            end
            ::__continue54::
            i = i + 1
        end
    end
    do
        local i = #unassigned - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local tmp = unassigned[i + 1]
            unassigned[i + 1] = unassigned[j + 1]
            unassigned[j + 1] = tmp
            i = i - 1
        end
    end
    for ____, pid in ipairs(unassigned) do
        self:assignPlayerBase(pid)
    end
end
function FountainManager.prototype.assignPlayerBase(self, playerId)
    local existing = self.playerBaseIndex:get(playerId)
    if existing ~= nil then
        return existing
    end
    if #self.basePositions <= 1 then
        self.playerBaseIndex:set(playerId, 0)
        local ____self_baseCounts_3, ____1_4 = self.baseCounts, 1
        ____self_baseCounts_3[____1_4] = ____self_baseCounts_3[____1_4] + 1
        return 0
    end
    local chosen = 0
    if self.baseCounts[1] < self.baseCounts[2] then
        chosen = 0
    elseif self.baseCounts[2] < self.baseCounts[1] then
        chosen = 1
    else
        chosen = RandomInt(0, 1)
    end
    self.playerBaseIndex:set(playerId, chosen)
    local ____self_baseCounts_5, ____temp_6 = self.baseCounts, chosen + 1
    ____self_baseCounts_5[____temp_6] = ____self_baseCounts_5[____temp_6] + 1
    return chosen
end
function FountainManager.prototype.getHomeSpawnPosition(self, playerId)
    if #self.basePositions == 0 then
        return Vector(0, 0, 128)
    end
    local baseIdx = self:assignPlayerBase(playerId)
    local fountainPos = self.basePositions[baseIdx + 1] or self.basePositions[1]
    local dir = self.baseDirections[baseIdx + 1] or Vector(1, 0, 0)
    local angle = RandomFloat(0, math.pi * 2)
    local raw = Vector(
        fountainPos.x + dir.x * 180 + math.cos(angle) * 90,
        fountainPos.y + dir.y * 180 + math.sin(angle) * 90,
        fountainPos.z
    )
    return GetGroundPosition(raw, nil)
end
function FountainManager.prototype.onNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsBaseNPC() then
        return
    end
    if not unit:IsRealHero() then
        return
    end
    local playerId = unit:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    if not __TS__ArrayIncludes(
        EVO_PLAYABLE_TEAMS,
        PlayerResource:GetTeam(playerId)
    ) then
        return
    end
    local hero = unit
    local homePos = self:getHomeSpawnPosition(playerId)
    hero:SetRespawnPosition(homePos)
    local isInitial = not self.initialSpawnDone:has(playerId)
    local isDeathRespawn = self.pendingRespawn:delete(playerId)
    if isInitial or isDeathRespawn then
        self.initialSpawnDone:add(playerId)
        FindClearSpaceForUnit(hero, homePos, true)
        hero:Stop()
        self:focusCameraBriefly(playerId, hero)
    end
    self:syncFountainHudState(false)
end
function FountainManager.prototype.onEntityKilled(self, event)
    local victim = EntIndexToHScript(event.entindex_killed)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return
    end
    if not victim:IsRealHero() or victim:IsReincarnating() then
        return
    end
    if self:isActiveDuelist(victim) then
        return
    end
    local playerId = victim:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    clearFountainCombatLock(nil, playerId)
    self.pendingRespawn:add(playerId)
    self:syncFountainHudState(false)
end
function FountainManager.prototype.onTeleportRequest(self, event)
    self:teleportFromFountain(event.PlayerID, false)
end
function FountainManager.prototype.teleportFromFountain(self, playerId, bypassFountainCheck)
    if self.matchEnded or not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    if self:isActiveDuelist(hero) then
        return
    end
    if not bypassFountainCheck and not hero:HasModifier("modifier_fountain_buff_lua") then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    local lastTp = self.lastTeleportTime:get(playerId) or -999
    if not bypassFountainCheck and now - lastTp < EVO_CONSTANTS.FOUNTAIN_TELEPORT_COOLDOWN then
        return
    end
    local targetPos = self:pickRandomSafeDestination(hero:GetTeamNumber())
    self.lastTeleportTime:set(playerId, now)
    local startPfx = ParticleManager:CreateParticle(PARTICLE_BLINK_START, 8, nil)
    ParticleManager:SetParticleControl(
        startPfx,
        0,
        hero:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(startPfx)
    hero:RemoveModifierByName("modifier_fountain_buff_lua")
    FindClearSpaceForUnit(hero, targetPos, true)
    hero:Stop()
    local endPfx = ParticleManager:CreateParticle(PARTICLE_BLINK_END, 8, nil)
    ParticleManager:SetParticleControl(
        endPfx,
        0,
        hero:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(endPfx)
    self:focusCameraBriefly(playerId, hero)
    self:syncFountainHudState(true)
end
function FountainManager.prototype.pickRandomSafeDestination(self, myTeam)
    if #self.teleportTargets == 0 then
        return Vector(0, 0, 128)
    end
    local enemyPositions = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue89
                end
                if PlayerResource:GetTeam(pid) == myTeam then
                    goto __continue89
                end
                local enemy = PlayerResource:GetSelectedHeroEntity(pid)
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                    goto __continue89
                end
                enemyPositions[#enemyPositions + 1] = enemy:GetAbsOrigin()
            end
            ::__continue89::
            i = i + 1
        end
    end
    local minEnemyDistSq = 850 * 850
    local safe = __TS__ArrayFilter(
        self.teleportTargets,
        function(____, spot)
            for ____, ePos in ipairs(enemyPositions) do
                local dx = spot.x - ePos.x
                local dy = spot.y - ePos.y
                if dx * dx + dy * dy < minEnemyDistSq then
                    return false
                end
            end
            return true
        end
    )
    local pool = #safe > 0 and safe or self.teleportTargets
    return pool[RandomInt(0, #pool - 1) + 1]
end
function FountainManager.prototype.focusCameraBriefly(self, playerId, hero)
    focusPlayerCamera(
        nil,
        playerId,
        hero,
        hero:GetAbsOrigin()
    )
end
function FountainManager.prototype.computeCentroid(self, points)
    if #points == 0 then
        return Vector(0, 0, 128)
    end
    local sx = 0
    local sy = 0
    local sz = 0
    for ____, p in ipairs(points) do
        sx = sx + p.x
        sy = sy + p.y
        sz = sz + p.z
    end
    return Vector(sx / #points, sy / #points, sz / #points)
end
function FountainManager.prototype.syncFountainHudState(self, force)
    local payload = {}
    local sigParts = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue103
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                local onFountain = not self.matchEnded and hero ~= nil and not hero:IsNull() and IsValidEntity(hero) and hero:IsAlive() and hero:HasModifier("modifier_fountain_buff_lua")
                local baseIdx = self.playerBaseIndex:get(pid) or 0
                payload[tostring(pid)] = {on_fountain = onFountain, base_index = baseIdx}
                sigParts[#sigParts + 1] = (((tostring(pid) .. ":") .. tostring(onFountain and 1 or 0)) .. ":") .. tostring(baseIdx)
            end
            ::__continue103::
            i = i + 1
        end
    end
    local sig = table.concat(sigParts, ";")
    if not force and sig == self.lastSyncedSignature then
        return
    end
    self.lastSyncedSignature = sig
    CustomNetTables:SetTableValue("match_state", "fountains", payload)
end
return ____exports
