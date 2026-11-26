local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 3,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 15,["23"] = 22,["24"] = 29,["25"] = 35,["26"] = 41,["27"] = 41,["28"] = 41,["29"] = 48,["30"] = 48,["31"] = 42,["32"] = 43,["33"] = 44,["34"] = 45,["35"] = 46,["36"] = 48,["37"] = 50,["38"] = 51,["39"] = 52,["40"] = 53,["41"] = 54,["42"] = 55,["43"] = 57,["44"] = 57,["45"] = 57,["46"] = 57,["47"] = 57,["48"] = 58,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 58,["53"] = 59,["54"] = 59,["55"] = 59,["56"] = 59,["57"] = 59,["58"] = 50,["59"] = 62,["60"] = 63,["61"] = 64,["62"] = 65,["64"] = 72,["65"] = 73,["67"] = 62,["68"] = 77,["69"] = 78,["70"] = 79,["73"] = 80,["74"] = 81,["75"] = 77,["76"] = 84,["77"] = 85,["78"] = 86,["80"] = 87,["81"] = 87,["83"] = 88,["84"] = 89,["85"] = 89,["87"] = 91,["88"] = 92,["89"] = 93,["90"] = 95,["91"] = 95,["95"] = 102,["96"] = 84,["97"] = 105,["98"] = 106,["99"] = 107,["100"] = 108,["101"] = 109,["102"] = 109,["103"] = 109,["104"] = 109,["105"] = 109,["107"] = 105,["108"] = 117,["109"] = 118,["110"] = 119,["111"] = 117,["112"] = 122,["113"] = 123,["114"] = 124,["115"] = 125,["116"] = 127,["118"] = 128,["119"] = 128,["121"] = 130,["122"] = 131,["124"] = 134,["125"] = 134,["126"] = 134,["127"] = 135,["128"] = 136,["129"] = 134,["130"] = 134,["131"] = 146,["132"] = 149,["133"] = 150,["134"] = 150,["136"] = 152,["137"] = 153,["138"] = 154,["139"] = 156,["140"] = 156,["141"] = 156,["142"] = 157,["143"] = 157,["145"] = 158,["147"] = 161,["148"] = 162,["149"] = 162,["151"] = 164,["152"] = 165,["153"] = 165,["155"] = 167,["156"] = 168,["157"] = 168,["159"] = 170,["160"] = 171,["161"] = 172,["162"] = 172,["164"] = 174,["165"] = 175,["166"] = 176,["167"] = 178,["168"] = 178,["169"] = 178,["170"] = 179,["172"] = 180,["173"] = 180,["174"] = 181,["177"] = 182,["178"] = 180,["181"] = 184,["185"] = 187,["186"] = 188,["187"] = 189,["188"] = 190,["189"] = 191,["193"] = 195,["194"] = 195,["195"] = 196,["196"] = 197,["197"] = 198,["198"] = 198,["199"] = 198,["200"] = 198,["201"] = 198,["202"] = 199,["203"] = 201,["204"] = 201,["205"] = 201,["206"] = 201,["207"] = 201,["208"] = 201,["209"] = 201,["210"] = 208,["211"] = 209,["214"] = 210,["215"] = 211,["216"] = 211,["217"] = 212,["218"] = 213,["219"] = 214,["220"] = 215,["221"] = 216,["224"] = 219,["225"] = 220,["227"] = 201,["228"] = 201,["229"] = 195,["235"] = 122,["236"] = 228,["237"] = 229,["238"] = 230,["239"] = 231,["240"] = 232,["241"] = 233,["243"] = 235,["245"] = 238,["246"] = 239,["247"] = 240,["248"] = 241,["249"] = 242,["250"] = 243,["253"] = 228,["254"] = 248,["255"] = 249,["258"] = 250,["259"] = 251,["262"] = 252,["265"] = 254,["266"] = 257,["267"] = 259,["268"] = 259,["269"] = 260,["271"] = 261,["273"] = 258,["274"] = 263,["275"] = 263,["276"] = 264,["278"] = 265,["280"] = 262,["281"] = 266,["283"] = 248,["284"] = 270,["285"] = 271,["286"] = 272,["287"] = 273,["290"] = 274,["291"] = 276,["294"] = 277,["295"] = 278,["298"] = 280,["299"] = 281,["302"] = 283,["303"] = 284,["304"] = 270,["305"] = 290,["306"] = 291,["307"] = 292,["308"] = 293,["309"] = 293,["310"] = 293,["311"] = 293,["312"] = 290});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____modifier_evo_creep_auras = require("modifiers.neutrals.modifier_evo_creep_auras")
local EVO_CREEP_AURA_MODIFIERS = ____modifier_evo_creep_auras.EVO_CREEP_AURA_MODIFIERS
local linkCreepAuraModifiers = ____modifier_evo_creep_auras.linkCreepAuraModifiers
local ____modifier_evo_creep_abilities = require("modifiers.neutrals.modifier_evo_creep_abilities")
local EVO_CREEP_ABILITY_MODIFIERS = ____modifier_evo_creep_abilities.EVO_CREEP_ABILITY_MODIFIERS
local linkCreepAbilityModifiers = ____modifier_evo_creep_abilities.linkCreepAbilityModifiers
local CAMP_BIOMASS_BY_SIZE = {small = 1, medium = 2, hard = 3, strong = 4}
local CAMP_TIER_BY_SIZE = {small = 0, medium = 1, hard = 2, strong = 3}
local AURA_CHANCE_BY_TIER = {[1] = 40, [2] = 65, [3] = 100}
local ABILITY_CHANCE_BY_TIER = {[1] = 30, [2] = 45, [3] = 70}
____exports.NeutralCampsManager = __TS__Class()
local NeutralCampsManager = ____exports.NeutralCampsManager
NeutralCampsManager.name = "NeutralCampsManager"
function NeutralCampsManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.camps = {}
    self.creepSizeByEntIndex = __TS__New(Map)
    self.campConfig = {}
    self.sizeKeys = {}
    self.started = false
end
function NeutralCampsManager.prototype.init(self)
    linkCreepAuraModifiers(nil)
    linkCreepAbilityModifiers(nil)
    self:initNeutralAiGlobals()
    self:loadCampConfig()
    self:discoverCampTriggers()
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
    ListenToGameEvent(
        "entity_hurt",
        function(event) return self:onEntityHurt(event) end,
        nil
    )
end
function NeutralCampsManager.prototype.initNeutralAiGlobals(self)
    local g = _G
    if g.AI_SPELLS == nil then
        g.AI_SPELLS = {never_use = {}, heal = {}, only_enemy = {}, buffs = {}}
    end
    if g.AI_UPDATE == nil then
        g.AI_UPDATE = 0.5
    end
end
function NeutralCampsManager.prototype.loadCampConfig(self)
    local raw = LoadKeyValues("scripts/npc/neutral_camps.txt")
    if not raw then
        return
    end
    self.campConfig = raw
    self.sizeKeys = __TS__ObjectKeys(raw)
end
function NeutralCampsManager.prototype.discoverCampTriggers(self)
    local triggers = Entities:FindAllByClassname("trigger_multiple")
    for ____, trigger in ipairs(triggers) do
        do
            if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
                goto __continue13
            end
            local name = trigger:GetName()
            if not __TS__StringStartsWith(name, "neutralcamp_") then
                goto __continue13
            end
            local parts = __TS__StringSplit(name, "_")
            local size = parts[2] or "small"
            local biome = parts[3] or "middle"
            local ____self_camps_0 = self.camps
            ____self_camps_0[#____self_camps_0 + 1] = {trigger = trigger, size = size, biome = biome, aliveCreepEntIndexes = {}}
        end
        ::__continue13::
    end
    print(("[Evo] NeutralCampsManager discovered " .. tostring(#self.camps)) .. " neutral camp trigger(s).")
end
function NeutralCampsManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        self:spawnAllCamps()
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoNeutralCampsThink",
            function() return self:onRespawnThink() end,
            EVO_CONSTANTS.NEUTRAL_CAMP_RESPAWN_SECONDS
        )
    end
end
function NeutralCampsManager.prototype.onRespawnThink(self)
    self:spawnAllCamps()
    return EVO_CONSTANTS.NEUTRAL_CAMP_RESPAWN_SECONDS
end
function NeutralCampsManager.prototype.spawnAllCamps(self)
    local matchTime = GameRules:GetDOTATime(false, false)
    local allowHardAndStrong = matchTime >= EVO_CONSTANTS.CAMP_HARD_SPAWN_UNLOCK_SECONDS
    local targetLevel = self:getNeutralLevel()
    for ____, camp in ipairs(self.camps) do
        do
            if not camp.trigger or camp.trigger:IsNull() or not IsValidEntity(camp.trigger) then
                goto __continue22
            end
            if not allowHardAndStrong and (camp.size == "hard" or camp.size == "strong") then
                goto __continue22
            end
            camp.aliveCreepEntIndexes = __TS__ArrayFilter(
                camp.aliveCreepEntIndexes,
                function(____, entIndex)
                    local ent = EntIndexToHScript(entIndex)
                    return ent ~= nil and not ent:IsNull() and IsValidEntity(ent) and ent:IsBaseNPC() and ent:IsAlive() and ent:GetTeamNumber() == 4
                end
            )
            local maxUnits = IsInToolsMode() and EVO_CONSTANTS.NEUTRAL_CAMP_MAX_UNITS_DEV or EVO_CONSTANTS.NEUTRAL_CAMP_MAX_UNITS
            local remainingSlots = maxUnits - #camp.aliveCreepEntIndexes
            if remainingSlots <= 0 then
                goto __continue22
            end
            local size = camp.size
            if __TS__StringIncludes(size, "random") and #self.sizeKeys > 0 then
                local candidateSizes = allowHardAndStrong and self.sizeKeys or __TS__ArrayFilter(
                    self.sizeKeys,
                    function(____, s) return s ~= "hard" and s ~= "strong" end
                )
                if #candidateSizes == 0 then
                    goto __continue22
                end
                size = candidateSizes[RandomInt(0, #candidateSizes - 1) + 1]
            end
            local sizeData = self.campConfig[size]
            if not sizeData then
                goto __continue22
            end
            local biomeData = sizeData[camp.biome]
            if not biomeData then
                goto __continue22
            end
            local packKeys = __TS__ObjectKeys(biomeData)
            if #packKeys == 0 then
                goto __continue22
            end
            local chosenKey = packKeys[RandomInt(0, #packKeys - 1) + 1]
            local pack = biomeData[chosenKey]
            if not pack then
                goto __continue22
            end
            local origin = camp.trigger:GetAbsOrigin()
            local tier = CAMP_TIER_BY_SIZE[size] or 0
            local spawnQueue = {}
            for ____, ____value in ipairs(__TS__ObjectEntries(pack)) do
                local creepName = ____value[1]
                local rawCount = ____value[2]
                local count = tonumber(rawCount) or 1
                do
                    local i = 0
                    while i < count do
                        if #spawnQueue >= remainingSlots then
                            break
                        end
                        spawnQueue[#spawnQueue + 1] = creepName
                        i = i + 1
                    end
                end
                if #spawnQueue >= remainingSlots then
                    break
                end
            end
            local auraLeaderIdx = -1
            if tier >= 1 and #spawnQueue > 0 then
                local auraChance = AURA_CHANCE_BY_TIER[tier] or 0
                if RandomInt(1, 100) <= auraChance then
                    auraLeaderIdx = RandomInt(0, #spawnQueue - 1)
                end
            end
            do
                local idx = 0
                while idx < #spawnQueue do
                    local creepName = spawnQueue[idx + 1]
                    local isAuraLeader = idx == auraLeaderIdx
                    local offset = Vector(
                        RandomFloat(-80, 80),
                        RandomFloat(-80, 80),
                        0
                    )
                    local spawnPos = Vector(origin.x + offset.x, origin.y + offset.y, origin.z)
                    CreateUnitByNameAsync(
                        creepName,
                        spawnPos,
                        true,
                        nil,
                        nil,
                        4,
                        function(unit)
                            if not unit or unit:IsNull() or not IsValidEntity(unit) then
                                return
                            end
                            local entIndex = unit:entindex()
                            local ____camp_aliveCreepEntIndexes_1 = camp.aliveCreepEntIndexes
                            ____camp_aliveCreepEntIndexes_1[#____camp_aliveCreepEntIndexes_1 + 1] = entIndex
                            self.creepSizeByEntIndex:set(entIndex, size)
                            if unit:IsCreature() then
                                local levelDelta = targetLevel - unit:GetLevel()
                                if levelDelta > 0 then
                                    unit:CreatureLevelUp(levelDelta)
                                end
                            end
                            if tier >= 1 then
                                self:applyTierEnhancements(unit, tier, isAuraLeader)
                            end
                        end
                    )
                    idx = idx + 1
                end
            end
        end
        ::__continue22::
    end
end
function NeutralCampsManager.prototype.applyTierEnhancements(self, unit, tier, isAuraLeader)
    if isAuraLeader and #EVO_CREEP_AURA_MODIFIERS > 0 then
        local auraName = EVO_CREEP_AURA_MODIFIERS[RandomInt(0, #EVO_CREEP_AURA_MODIFIERS - 1) + 1]
        local auraMod = unit:AddNewModifier(unit, nil, auraName, {})
        if auraMod ~= nil then
            auraMod:SetStackCount(tier)
        end
        unit:SetModelScale(unit:GetModelScale() * 1.15)
    end
    local abilityChance = ABILITY_CHANCE_BY_TIER[tier] or 0
    if #EVO_CREEP_ABILITY_MODIFIERS > 0 and RandomInt(1, 100) <= abilityChance then
        local abilityName = EVO_CREEP_ABILITY_MODIFIERS[RandomInt(0, #EVO_CREEP_ABILITY_MODIFIERS - 1) + 1]
        local abilityMod = unit:AddNewModifier(unit, nil, abilityName, {})
        if abilityMod ~= nil then
            abilityMod:SetStackCount(tier)
        end
    end
end
function NeutralCampsManager.prototype.onEntityHurt(self, event)
    if event.entindex_killed == nil then
        return
    end
    local victim = EntIndexToHScript(event.entindex_killed)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return
    end
    if victim:GetTeamNumber() ~= 4 then
        return
    end
    local aiHolder = victim
    if aiHolder.hAI ~= nil and aiHolder.hAI.OnTakeDamage ~= nil then
        local ____temp_2
        if event.entindex_attacker ~= nil then
            ____temp_2 = EntIndexToHScript(event.entindex_attacker)
        else
            ____temp_2 = nil
        end
        local attacker = ____temp_2
        local ____temp_3
        if event.entindex_inflictor ~= nil then
            ____temp_3 = EntIndexToHScript(event.entindex_inflictor)
        else
            ____temp_3 = nil
        end
        local ability = ____temp_3
        aiHolder.hAI:OnTakeDamage(attacker, event.damage, ability)
    end
end
function NeutralCampsManager.prototype.onEntityKilled(self, event)
    local victimIndex = event.entindex_killed
    local size = self.creepSizeByEntIndex:get(victimIndex)
    if size == nil then
        return
    end
    self.creepSizeByEntIndex:delete(victimIndex)
    if event.entindex_attacker == nil then
        return
    end
    local attacker = EntIndexToHScript(event.entindex_attacker)
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsBaseNPC() then
        return
    end
    local playerId = attacker:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local reward = CAMP_BIOMASS_BY_SIZE[size] or 1
    self.eventBus:emit("biomass_collected", {playerId = playerId, amount = reward})
end
function NeutralCampsManager.prototype.getNeutralLevel(self)
    local minutes = GameRules:GetDOTATime(false, false) / 60
    local stepped = math.floor(minutes - minutes % 3)
    return math.min(
        EVO_CONSTANTS.MAX_HERO_LEVEL,
        math.max(1, stepped)
    )
end
return ____exports
