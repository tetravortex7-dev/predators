local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 7,["16"] = 7,["17"] = 7,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 7,["25"] = 14,["26"] = 15,["27"] = 16,["28"] = 14,["29"] = 19,["30"] = 20,["33"] = 21,["36"] = 22,["37"] = 24,["38"] = 25,["39"] = 25,["40"] = 27,["41"] = 28,["42"] = 29,["44"] = 31,["45"] = 32,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 34,["53"] = 35,["55"] = 37,["56"] = 25,["57"] = 25,["58"] = 25,["59"] = 19,["60"] = 43,["61"] = 44,["62"] = 44,["63"] = 44,["64"] = 44,["66"] = 44,["67"] = 43,["68"] = 47,["69"] = 48,["70"] = 49,["73"] = 53,["74"] = 54,["75"] = 55,["76"] = 56,["78"] = 59,["79"] = 60,["80"] = 61,["83"] = 65,["84"] = 66,["85"] = 66,["86"] = 68,["87"] = 69,["88"] = 70,["89"] = 71,["90"] = 72,["92"] = 74,["93"] = 76,["94"] = 76,["95"] = 77,["97"] = 77,["99"] = 78,["100"] = 79,["102"] = 66,["103"] = 66,["104"] = 66,["105"] = 47,["106"] = 86,["107"] = 87,["108"] = 88,["109"] = 89,["110"] = 90,["111"] = 92,["113"] = 93,["114"] = 93,["116"] = 94,["117"] = 95,["118"] = 96,["123"] = 100,["124"] = 102,["125"] = 107,["126"] = 108,["129"] = 112,["130"] = 113,["131"] = 86,["132"] = 116,["133"] = 117,["136"] = 118,["137"] = 119,["138"] = 119,["139"] = 121,["140"] = 122,["141"] = 122,["143"] = 123,["144"] = 124,["145"] = 125,["146"] = 125,["147"] = 125,["148"] = 125,["149"] = 125,["150"] = 126,["151"] = 119,["152"] = 119,["153"] = 119,["154"] = 116});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_BODIES_CATALOG = ____bodies_catalog.EVO_BODIES_CATALOG
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local INITIAL_DELAY_SECONDS = 0.4
local STEP_INTERVAL_SECONDS = 0.9
____exports.LazyPrecacheManager = __TS__Class()
local LazyPrecacheManager = ____exports.LazyPrecacheManager
LazyPrecacheManager.name = "LazyPrecacheManager"
function LazyPrecacheManager.prototype.____constructor(self)
    self.heroUnits = {}
    self.bossUnits = {}
    self.readyByPlayer = __TS__New(Map)
    self.inFlightByPlayer = __TS__New(Map)
    self.startedPlayers = __TS__New(Set)
end
function LazyPrecacheManager.prototype.init(self)
    self:collectUnits()
    self:startBossPrecache()
end
function LazyPrecacheManager.prototype.precacheForPlayer(self, playerId)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    if self.startedPlayers:has(playerId) then
        return
    end
    self.startedPlayers:add(playerId)
    local cursor = 0
    GameRules:GetGameModeEntity():SetContextThink(
        "EvoLazyPrecacheP" .. tostring(playerId),
        function()
            if cursor >= #self.heroUnits then
                return nil
            end
            local unitName = self.heroUnits[cursor + 1]
            cursor = cursor + 1
            self:ensureHeroReady(
                playerId,
                unitName,
                function()
                end
            )
            if cursor >= #self.heroUnits then
                return nil
            end
            return STEP_INTERVAL_SECONDS
        end,
        INITIAL_DELAY_SECONDS
    )
end
function LazyPrecacheManager.prototype.isHeroReady(self, playerId, heroClass)
    local ____opt_0 = self.readyByPlayer:get(playerId)
    local ____temp_2 = ____opt_0 and ____opt_0:has(heroClass)
    if ____temp_2 == nil then
        ____temp_2 = false
    end
    return ____temp_2
end
function LazyPrecacheManager.prototype.ensureHeroReady(self, playerId, heroClass, onReady)
    if self:isHeroReady(playerId, heroClass) then
        onReady(nil)
        return
    end
    local inFlightMap = self.inFlightByPlayer:get(playerId)
    if not inFlightMap then
        inFlightMap = __TS__New(Map)
        self.inFlightByPlayer:set(playerId, inFlightMap)
    end
    local existingCallbacks = inFlightMap:get(heroClass)
    if existingCallbacks then
        existingCallbacks[#existingCallbacks + 1] = onReady
        return
    end
    inFlightMap:set(heroClass, {onReady})
    PrecacheUnitByNameAsync(
        heroClass,
        function()
            local readySet = self.readyByPlayer:get(playerId)
            if not readySet then
                readySet = __TS__New(Set)
                self.readyByPlayer:set(playerId, readySet)
            end
            readySet:add(heroClass)
            local ____opt_3 = self.inFlightByPlayer:get(playerId)
            local callbacks = ____opt_3 and ____opt_3:get(heroClass) or ({})
            local ____opt_5 = self.inFlightByPlayer:get(playerId)
            if ____opt_5 ~= nil then
                ____opt_5:delete(heroClass)
            end
            for ____, cb in ipairs(callbacks) do
                cb(nil)
            end
        end,
        playerId
    )
end
function LazyPrecacheManager.prototype.collectUnits(self)
    local seenHeroes = __TS__New(Set)
    local heroes = {}
    local seenBoss = __TS__New(Set)
    local bosses = {}
    for ____, body in ipairs(EVO_BODIES_CATALOG) do
        do
            if body.tierIndex == 0 then
                goto __continue21
            end
            if body.heroClass and #body.heroClass > 0 and not seenHeroes:has(body.heroClass) then
                seenHeroes:add(body.heroClass)
                heroes[#heroes + 1] = body.heroClass
            end
        end
        ::__continue21::
    end
    for ____, boss in ipairs(EVO_BOSSES_CATALOG) do
        if boss.ownerHeroName and #boss.ownerHeroName > 0 and boss.ownerHeroName ~= boss.unitName and not seenBoss:has(boss.ownerHeroName) then
            seenBoss:add(boss.ownerHeroName)
            bosses[#bosses + 1] = boss.ownerHeroName
        end
    end
    self.heroUnits = heroes
    self.bossUnits = bosses
end
function LazyPrecacheManager.prototype.startBossPrecache(self)
    if #self.bossUnits == 0 then
        return
    end
    local idx = 0
    GameRules:GetGameModeEntity():SetContextThink(
        "EvoLazyBossPrecache",
        function()
            if idx >= #self.bossUnits then
                return nil
            end
            local unitName = self.bossUnits[idx + 1]
            idx = idx + 1
            PrecacheUnitByNameAsync(
                unitName,
                function()
                end
            )
            return idx < #self.bossUnits and STEP_INTERVAL_SECONDS or nil
        end,
        2.5
    )
end
return ____exports
