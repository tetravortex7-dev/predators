local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 7,["15"] = 7,["16"] = 7,["18"] = 8,["19"] = 9,["20"] = 7,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["27"] = 16,["28"] = 16,["29"] = 16,["30"] = 16,["31"] = 16,["32"] = 11,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 27,["38"] = 28,["39"] = 28,["41"] = 29,["42"] = 30,["43"] = 31,["48"] = 35,["49"] = 37,["50"] = 42,["51"] = 43,["54"] = 47,["55"] = 23,["56"] = 50,["57"] = 51,["58"] = 52,["60"] = 54,["61"] = 55,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 57,["66"] = 57,["67"] = 59,["68"] = 60,["70"] = 62,["71"] = 50});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_BODIES_CATALOG = ____bodies_catalog.EVO_BODIES_CATALOG
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local INITIAL_DELAY_SECONDS = 0.8
local STEP_INTERVAL_SECONDS = 1.2
____exports.LazyPrecacheManager = __TS__Class()
local LazyPrecacheManager = ____exports.LazyPrecacheManager
LazyPrecacheManager.name = "LazyPrecacheManager"
function LazyPrecacheManager.prototype.____constructor(self)
    self.queue = {}
    self.cursor = 0
end
function LazyPrecacheManager.prototype.init(self)
    self.queue = self:collectUniqueHeroUnits()
    self.cursor = 0
    if #self.queue == 0 then
        return
    end
    GameRules:GetGameModeEntity():SetContextThink(
        "EvoLazyPrecacheThink",
        function() return self:onThink() end,
        INITIAL_DELAY_SECONDS
    )
end
function LazyPrecacheManager.prototype.collectUniqueHeroUnits(self)
    local seen = __TS__New(Set)
    local result = {}
    for ____, body in ipairs(EVO_BODIES_CATALOG) do
        do
            if body.tierIndex == 0 then
                goto __continue7
            end
            if body.heroClass and #body.heroClass > 0 and not seen:has(body.heroClass) then
                seen:add(body.heroClass)
                result[#result + 1] = body.heroClass
            end
        end
        ::__continue7::
    end
    for ____, boss in ipairs(EVO_BOSSES_CATALOG) do
        if boss.ownerHeroName and #boss.ownerHeroName > 0 and boss.ownerHeroName ~= boss.unitName and not seen:has(boss.ownerHeroName) then
            seen:add(boss.ownerHeroName)
            result[#result + 1] = boss.ownerHeroName
        end
    end
    return result
end
function LazyPrecacheManager.prototype.onThink(self)
    if self.cursor >= #self.queue then
        return nil
    end
    local unitName = self.queue[self.cursor + 1]
    self.cursor = self.cursor + 1
    PrecacheUnitByNameAsync(
        unitName,
        function()
        end
    )
    if self.cursor >= #self.queue then
        return nil
    end
    return STEP_INTERVAL_SECONDS
end
return ____exports
