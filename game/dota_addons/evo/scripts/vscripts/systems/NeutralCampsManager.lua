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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 15,["21"] = 22,["22"] = 29,["23"] = 35,["24"] = 41,["25"] = 41,["26"] = 41,["27"] = 48,["28"] = 48,["29"] = 42,["30"] = 43,["31"] = 44,["32"] = 45,["33"] = 46,["34"] = 48,["35"] = 50,["36"] = 51,["37"] = 52,["38"] = 53,["39"] = 55,["40"] = 55,["41"] = 55,["42"] = 55,["43"] = 55,["44"] = 56,["45"] = 56,["46"] = 56,["47"] = 56,["48"] = 56,["49"] = 57,["50"] = 57,["51"] = 57,["52"] = 57,["53"] = 57,["54"] = 50,["55"] = 60,["56"] = 61,["57"] = 62,["58"] = 63,["60"] = 70,["61"] = 71,["63"] = 60,["64"] = 75,["65"] = 76,["66"] = 77,["69"] = 78,["70"] = 79,["71"] = 75,["72"] = 82,["73"] = 83,["74"] = 84,["76"] = 85,["77"] = 85,["79"] = 86,["80"] = 87,["81"] = 87,["83"] = 89,["84"] = 90,["85"] = 91,["86"] = 93,["87"] = 93,["91"] = 100,["92"] = 82,["93"] = 103,["94"] = 104,["95"] = 105,["96"] = 106,["97"] = 107,["98"] = 107,["99"] = 107,["100"] = 107,["101"] = 107,["103"] = 103,["104"] = 115,["105"] = 116,["106"] = 117,["107"] = 115,["108"] = 120,["109"] = 121,["110"] = 123,["112"] = 124,["113"] = 124,["115"] = 126,["116"] = 126,["117"] = 126,["118"] = 127,["119"] = 128,["120"] = 126,["121"] = 126,["122"] = 138,["123"] = 141,["124"] = 142,["125"] = 142,["127"] = 144,["128"] = 145,["129"] = 146,["131"] = 149,["132"] = 150,["133"] = 150,["135"] = 152,["136"] = 153,["137"] = 153,["139"] = 155,["140"] = 156,["141"] = 156,["143"] = 158,["144"] = 159,["145"] = 160,["146"] = 160,["148"] = 162,["149"] = 163,["150"] = 164,["151"] = 166,["152"] = 166,["153"] = 166,["154"] = 167,["156"] = 168,["157"] = 168,["158"] = 169,["161"] = 170,["162"] = 168,["165"] = 172,["169"] = 175,["170"] = 176,["171"] = 177,["172"] = 178,["173"] = 179,["177"] = 183,["178"] = 183,["179"] = 184,["180"] = 185,["181"] = 186,["182"] = 186,["183"] = 186,["184"] = 186,["185"] = 186,["186"] = 187,["187"] = 189,["188"] = 189,["189"] = 189,["190"] = 189,["191"] = 189,["192"] = 189,["193"] = 189,["194"] = 196,["195"] = 197,["198"] = 198,["199"] = 199,["200"] = 199,["201"] = 200,["202"] = 201,["203"] = 202,["204"] = 203,["205"] = 204,["208"] = 207,["209"] = 208,["211"] = 189,["212"] = 189,["213"] = 183,["219"] = 120,["220"] = 216,["221"] = 217,["222"] = 218,["223"] = 219,["224"] = 220,["225"] = 221,["227"] = 223,["229"] = 226,["230"] = 227,["231"] = 228,["232"] = 229,["233"] = 230,["234"] = 231,["237"] = 216,["238"] = 236,["239"] = 237,["242"] = 238,["243"] = 239,["246"] = 240,["249"] = 242,["250"] = 245,["251"] = 247,["252"] = 247,["253"] = 248,["255"] = 249,["257"] = 246,["258"] = 251,["259"] = 251,["260"] = 252,["262"] = 253,["264"] = 250,["265"] = 254,["267"] = 236,["268"] = 258,["269"] = 259,["270"] = 260,["271"] = 261,["274"] = 262,["275"] = 264,["278"] = 265,["279"] = 266,["282"] = 268,["283"] = 269,["286"] = 271,["287"] = 272,["288"] = 258,["289"] = 278,["290"] = 279,["291"] = 280,["292"] = 281,["293"] = 281,["294"] = 281,["295"] = 281,["296"] = 278});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____modifier_evo_creep_auras = require("modifiers.neutrals.modifier_evo_creep_auras")
local EVO_CREEP_AURA_MODIFIERS = ____modifier_evo_creep_auras.EVO_CREEP_AURA_MODIFIERS
local ____modifier_evo_creep_abilities = require("modifiers.neutrals.modifier_evo_creep_abilities")
local EVO_CREEP_ABILITY_MODIFIERS = ____modifier_evo_creep_abilities.EVO_CREEP_ABILITY_MODIFIERS
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
    local targetLevel = self:getNeutralLevel()
    for ____, camp in ipairs(self.camps) do
        do
            if not camp.trigger or camp.trigger:IsNull() or not IsValidEntity(camp.trigger) then
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
                size = self.sizeKeys[RandomInt(0, #self.sizeKeys - 1) + 1]
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
