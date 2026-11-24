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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 3,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 15,["23"] = 22,["24"] = 29,["25"] = 35,["26"] = 41,["27"] = 41,["28"] = 41,["29"] = 48,["30"] = 48,["31"] = 42,["32"] = 43,["33"] = 44,["34"] = 45,["35"] = 46,["36"] = 48,["37"] = 50,["38"] = 51,["39"] = 52,["40"] = 53,["41"] = 54,["42"] = 55,["43"] = 57,["44"] = 57,["45"] = 57,["46"] = 57,["47"] = 57,["48"] = 58,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 58,["53"] = 59,["54"] = 59,["55"] = 59,["56"] = 59,["57"] = 59,["58"] = 50,["59"] = 62,["60"] = 63,["61"] = 64,["62"] = 65,["64"] = 72,["65"] = 73,["67"] = 62,["68"] = 77,["69"] = 78,["70"] = 79,["73"] = 80,["74"] = 81,["75"] = 77,["76"] = 84,["77"] = 85,["78"] = 86,["80"] = 87,["81"] = 87,["83"] = 88,["84"] = 89,["85"] = 89,["87"] = 91,["88"] = 92,["89"] = 93,["90"] = 95,["91"] = 95,["95"] = 102,["96"] = 84,["97"] = 105,["98"] = 106,["99"] = 107,["100"] = 108,["101"] = 109,["102"] = 109,["103"] = 109,["104"] = 109,["105"] = 109,["107"] = 105,["108"] = 117,["109"] = 118,["110"] = 119,["111"] = 117,["112"] = 122,["113"] = 123,["114"] = 125,["116"] = 126,["117"] = 126,["119"] = 128,["120"] = 128,["121"] = 128,["122"] = 129,["123"] = 130,["124"] = 128,["125"] = 128,["126"] = 140,["127"] = 143,["128"] = 144,["129"] = 144,["131"] = 146,["132"] = 147,["133"] = 148,["135"] = 151,["136"] = 152,["137"] = 152,["139"] = 154,["140"] = 155,["141"] = 155,["143"] = 157,["144"] = 158,["145"] = 158,["147"] = 160,["148"] = 161,["149"] = 162,["150"] = 162,["152"] = 164,["153"] = 165,["154"] = 166,["155"] = 168,["156"] = 168,["157"] = 168,["158"] = 169,["160"] = 170,["161"] = 170,["162"] = 171,["165"] = 172,["166"] = 170,["169"] = 174,["173"] = 177,["174"] = 178,["175"] = 179,["176"] = 180,["177"] = 181,["181"] = 185,["182"] = 185,["183"] = 186,["184"] = 187,["185"] = 188,["186"] = 188,["187"] = 188,["188"] = 188,["189"] = 188,["190"] = 189,["191"] = 191,["192"] = 191,["193"] = 191,["194"] = 191,["195"] = 191,["196"] = 191,["197"] = 191,["198"] = 198,["199"] = 199,["202"] = 200,["203"] = 201,["204"] = 201,["205"] = 202,["206"] = 203,["207"] = 204,["208"] = 205,["209"] = 206,["212"] = 209,["213"] = 210,["215"] = 191,["216"] = 191,["217"] = 185,["223"] = 122,["224"] = 218,["225"] = 219,["226"] = 220,["227"] = 221,["228"] = 222,["229"] = 223,["231"] = 225,["233"] = 228,["234"] = 229,["235"] = 230,["236"] = 231,["237"] = 232,["238"] = 233,["241"] = 218,["242"] = 238,["243"] = 239,["246"] = 240,["247"] = 241,["250"] = 242,["253"] = 244,["254"] = 247,["255"] = 249,["256"] = 249,["257"] = 250,["259"] = 251,["261"] = 248,["262"] = 253,["263"] = 253,["264"] = 254,["266"] = 255,["268"] = 252,["269"] = 256,["271"] = 238,["272"] = 260,["273"] = 261,["274"] = 262,["275"] = 263,["278"] = 264,["279"] = 266,["282"] = 267,["283"] = 268,["286"] = 270,["287"] = 271,["290"] = 273,["291"] = 274,["292"] = 260,["293"] = 280,["294"] = 281,["295"] = 282,["296"] = 283,["297"] = 283,["298"] = 283,["299"] = 283,["300"] = 280});
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
