local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 2,["18"] = 2,["19"] = 3,["20"] = 3,["21"] = 4,["22"] = 4,["23"] = 15,["24"] = 16,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 35,["29"] = 35,["30"] = 36,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 24,["36"] = 25,["37"] = 26,["38"] = 27,["39"] = 28,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 34,["44"] = 39,["45"] = 40,["46"] = 41,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 44,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 45,["61"] = 45,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 48,["66"] = 47,["67"] = 47,["68"] = 51,["69"] = 51,["70"] = 51,["71"] = 52,["72"] = 53,["73"] = 51,["74"] = 51,["75"] = 56,["76"] = 56,["77"] = 56,["78"] = 56,["79"] = 56,["80"] = 56,["81"] = 56,["82"] = 57,["83"] = 58,["85"] = 56,["86"] = 56,["87"] = 39,["88"] = 63,["89"] = 64,["90"] = 65,["91"] = 66,["92"] = 67,["93"] = 68,["95"] = 70,["96"] = 71,["97"] = 72,["98"] = 73,["99"] = 73,["100"] = 73,["101"] = 73,["102"] = 73,["105"] = 63,["106"] = 82,["107"] = 83,["108"] = 83,["110"] = 84,["111"] = 85,["112"] = 82,["113"] = 88,["114"] = 89,["115"] = 90,["117"] = 91,["118"] = 91,["120"] = 92,["121"] = 93,["122"] = 95,["123"] = 96,["124"] = 97,["126"] = 99,["127"] = 100,["128"] = 101,["129"] = 102,["133"] = 105,["134"] = 105,["135"] = 105,["136"] = 105,["137"] = 106,["138"] = 107,["139"] = 107,["140"] = 107,["141"] = 107,["142"] = 109,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 111,["147"] = 112,["148"] = 113,["149"] = 114,["150"] = 114,["152"] = 115,["153"] = 110,["154"] = 110,["155"] = 88,["156"] = 119,["157"] = 120,["158"] = 120,["160"] = 121,["161"] = 122,["162"] = 123,["164"] = 124,["165"] = 124,["166"] = 125,["168"] = 126,["169"] = 126,["170"] = 127,["171"] = 128,["172"] = 129,["173"] = 130,["174"] = 131,["175"] = 132,["176"] = 133,["177"] = 134,["179"] = 126,["182"] = 124,["185"] = 138,["186"] = 119,["187"] = 141,["188"] = 142,["189"] = 143,["190"] = 147,["191"] = 150,["193"] = 151,["194"] = 151,["196"] = 152,["197"] = 153,["198"] = 153,["200"] = 154,["201"] = 154,["202"] = 154,["203"] = 154,["204"] = 155,["205"] = 156,["206"] = 157,["207"] = 158,["208"] = 158,["213"] = 162,["215"] = 163,["216"] = 163,["218"] = 164,["219"] = 164,["220"] = 164,["221"] = 164,["222"] = 165,["223"] = 166,["224"] = 166,["229"] = 170,["230"] = 171,["232"] = 172,["233"] = 172,["234"] = 173,["235"] = 174,["236"] = 175,["237"] = 175,["238"] = 175,["239"] = 175,["240"] = 174,["241"] = 174,["242"] = 174,["243"] = 178,["244"] = 179,["245"] = 179,["247"] = 172,["251"] = 141,["252"] = 185,["253"] = 186,["254"] = 186,["256"] = 187,["257"] = 188,["258"] = 189,["259"] = 190,["260"] = 190,["263"] = 192,["264"] = 193,["265"] = 194,["266"] = 195,["267"] = 195,["270"] = 197,["271"] = 185,["272"] = 200,["273"] = 201,["276"] = 203,["278"] = 204,["279"] = 204,["281"] = 205,["282"] = 206,["283"] = 206,["285"] = 207,["286"] = 207,["287"] = 207,["288"] = 207,["289"] = 207,["291"] = 208,["292"] = 209,["296"] = 204,["300"] = 213,["301"] = 213,["302"] = 214,["303"] = 215,["304"] = 216,["305"] = 217,["306"] = 213,["309"] = 220,["310"] = 221,["312"] = 200,["313"] = 225,["314"] = 226,["315"] = 227,["316"] = 227,["318"] = 229,["319"] = 230,["320"] = 231,["321"] = 231,["322"] = 232,["324"] = 235,["325"] = 236,["326"] = 237,["327"] = 238,["328"] = 239,["330"] = 241,["332"] = 244,["333"] = 245,["334"] = 245,["335"] = 246,["336"] = 225,["337"] = 249,["338"] = 250,["339"] = 251,["341"] = 253,["342"] = 254,["343"] = 255,["344"] = 256,["345"] = 257,["346"] = 257,["347"] = 257,["348"] = 257,["349"] = 257,["350"] = 262,["351"] = 249,["352"] = 265,["353"] = 266,["354"] = 267,["357"] = 268,["360"] = 270,["361"] = 271,["364"] = 272,["365"] = 272,["366"] = 272,["367"] = 272,["370"] = 274,["371"] = 275,["372"] = 276,["373"] = 278,["374"] = 279,["375"] = 280,["376"] = 281,["377"] = 282,["378"] = 283,["379"] = 284,["381"] = 287,["382"] = 265,["383"] = 290,["384"] = 291,["385"] = 292,["388"] = 293,["391"] = 294,["394"] = 296,["395"] = 297,["398"] = 298,["399"] = 299,["400"] = 300,["401"] = 290,["402"] = 303,["403"] = 304,["404"] = 303,["405"] = 307,["406"] = 308,["409"] = 309,["410"] = 310,["413"] = 311,["416"] = 312,["419"] = 314,["420"] = 315,["421"] = 316,["424"] = 318,["425"] = 319,["426"] = 321,["427"] = 326,["428"] = 326,["429"] = 326,["430"] = 326,["431"] = 326,["432"] = 327,["433"] = 329,["434"] = 330,["435"] = 331,["436"] = 333,["437"] = 338,["438"] = 338,["439"] = 338,["440"] = 338,["441"] = 338,["442"] = 339,["443"] = 341,["444"] = 342,["445"] = 307,["446"] = 345,["447"] = 346,["448"] = 347,["450"] = 350,["451"] = 351,["452"] = 351,["453"] = 351,["454"] = 351,["455"] = 354,["456"] = 356,["458"] = 357,["459"] = 357,["461"] = 358,["462"] = 359,["463"] = 359,["465"] = 360,["466"] = 360,["468"] = 361,["469"] = 362,["470"] = 362,["472"] = 363,["475"] = 357,["478"] = 366,["479"] = 367,["480"] = 367,["481"] = 367,["482"] = 368,["483"] = 369,["484"] = 370,["485"] = 371,["486"] = 371,["489"] = 373,["490"] = 367,["491"] = 367,["492"] = 376,["493"] = 377,["494"] = 345,["495"] = 380,["496"] = 381,["497"] = 381,["498"] = 381,["499"] = 381,["500"] = 381,["501"] = 381,["502"] = 380,["503"] = 384,["504"] = 385,["505"] = 385,["507"] = 386,["508"] = 387,["509"] = 388,["510"] = 389,["511"] = 390,["512"] = 391,["513"] = 392,["515"] = 394,["516"] = 384,["517"] = 397,["518"] = 398,["519"] = 399,["521"] = 401,["522"] = 401,["524"] = 402,["525"] = 403,["526"] = 403,["528"] = 404,["529"] = 405,["530"] = 412,["531"] = 413,["532"] = 417,["535"] = 401,["538"] = 420,["539"] = 421,["542"] = 422,["543"] = 424,["544"] = 397});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local isCampSizeAllowedAtTime = ____game_constants.isCampSizeAllowedAtTime
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
        if not self.started then
            self.started = true
            GameRules:GetGameModeEntity():SetContextThink(
                "EvoFountainHudThink",
                function() return self:onThink() end,
                0.25
            )
        end
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
            local name = trigger:GetName()
            if not __TS__StringStartsWith(name, "neutralcamp_") then
                goto __continue33
            end
            local pos = GetGroundPosition(
                trigger:GetAbsOrigin(),
                nil
            )
            if self:isSafeTeleportPoint(pos, duelCenter) then
                local parts = __TS__StringSplit(name, "_")
                local campSize = parts[2] or "small"
                local ____self_teleportTargets_0 = self.teleportTargets
                ____self_teleportTargets_0[#____self_teleportTargets_0 + 1] = {position = pos, campSize = campSize}
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
                ____self_teleportTargets_1[#____self_teleportTargets_1 + 1] = {position = pos}
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
                    ____self_teleportTargets_2[#____self_teleportTargets_2 + 1] = {position = probe}
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
    local now = GameRules:GetDOTATime(false, false)
    local timeAllowed = __TS__ArrayFilter(
        self.teleportTargets,
        function(____, spot) return spot.campSize == nil or isCampSizeAllowedAtTime(nil, spot.campSize, now) end
    )
    local eligible = #timeAllowed > 0 and timeAllowed or self.teleportTargets
    local enemyPositions = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue90
                end
                if PlayerResource:GetTeam(pid) == myTeam then
                    goto __continue90
                end
                local enemy = PlayerResource:GetSelectedHeroEntity(pid)
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                    goto __continue90
                end
                enemyPositions[#enemyPositions + 1] = enemy:GetAbsOrigin()
            end
            ::__continue90::
            i = i + 1
        end
    end
    local minEnemyDistSq = 850 * 850
    local safe = __TS__ArrayFilter(
        eligible,
        function(____, spot)
            for ____, ePos in ipairs(enemyPositions) do
                local dx = spot.position.x - ePos.x
                local dy = spot.position.y - ePos.y
                if dx * dx + dy * dy < minEnemyDistSq then
                    return false
                end
            end
            return true
        end
    )
    local pool = #safe > 0 and safe or eligible
    return pool[RandomInt(0, #pool - 1) + 1].position
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
                    goto __continue104
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                local onFountain = not self.matchEnded and hero ~= nil and not hero:IsNull() and IsValidEntity(hero) and hero:IsAlive() and hero:HasModifier("modifier_fountain_buff_lua")
                local baseIdx = self.playerBaseIndex:get(pid) or 0
                payload[tostring(pid)] = {on_fountain = onFountain, base_index = baseIdx}
                sigParts[#sigParts + 1] = (((tostring(pid) .. ":") .. tostring(onFountain and 1 or 0)) .. ":") .. tostring(baseIdx)
            end
            ::__continue104::
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
