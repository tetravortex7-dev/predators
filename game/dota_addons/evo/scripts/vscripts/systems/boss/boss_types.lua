local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 31,["15"] = 32,["16"] = 33,["17"] = 34,["18"] = 35,["19"] = 36,["20"] = 37,["21"] = 39,["22"] = 40,["23"] = 41,["24"] = 42,["25"] = 43,["26"] = 44,["27"] = 45,["28"] = 47,["29"] = 47,["30"] = 47,["31"] = 47,["32"] = 47,["33"] = 47,["34"] = 47,["35"] = 47,["36"] = 56,["37"] = 57,["38"] = 58,["39"] = 59,["40"] = 56,["41"] = 62,["42"] = 63,["43"] = 64,["44"] = 64,["45"] = 64,["46"] = 64,["47"] = 65,["48"] = 62,["49"] = 68,["50"] = 69,["51"] = 69,["53"] = 70,["54"] = 71,["55"] = 68,["56"] = 74,["57"] = 77,["58"] = 77,["60"] = 79,["61"] = 80,["62"] = 81,["65"] = 84,["66"] = 74,["67"] = 87,["68"] = 91,["69"] = 92,["71"] = 94,["72"] = 94,["73"] = 94,["74"] = 94,["75"] = 94,["76"] = 94,["77"] = 87,["78"] = 97,["79"] = 98,["80"] = 99,["81"] = 99,["82"] = 99,["83"] = 99,["84"] = 99,["85"] = 99,["86"] = 99,["88"] = 97,["89"] = 103,["90"] = 108,["91"] = 109,["92"] = 110,["93"] = 112,["94"] = 113,["95"] = 114,["98"] = 118,["99"] = 119,["100"] = 120,["103"] = 124,["105"] = 125,["106"] = 125,["108"] = 126,["109"] = 127,["110"] = 128,["111"] = 129,["112"] = 130,["113"] = 130,["114"] = 130,["115"] = 130,["120"] = 137,["121"] = 138,["122"] = 138,["123"] = 139,["124"] = 139,["125"] = 139,["126"] = 138,["127"] = 140,["128"] = 140,["129"] = 140,["130"] = 138,["131"] = 141,["132"] = 141,["133"] = 141,["134"] = 138,["135"] = 142,["136"] = 142,["137"] = 142,["138"] = 138,["139"] = 138,["141"] = 146,["142"] = 147,["143"] = 148,["144"] = 149,["148"] = 153,["149"] = 154,["150"] = 154,["151"] = 154,["152"] = 154,["153"] = 154,["155"] = 157,["156"] = 103});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
____exports.BOSS_TEAM = 10
____exports.BOSS_AI_TICK_SECONDS = 0.5
____exports.BOSS_PASSIVE_XP_PER_SEC = 10
____exports.BOSS_PASSIVE_GOLD_PER_SEC = 12
____exports.BOSS_CREEP_XP_MULTIPLIER = 1.25
____exports.BOSS_HERO_KILL_XP = 600
____exports.BOSS_HERO_KILL_GOLD = 350
____exports.DEFAULT_FARM_MANA_RESERVE = 0.45
____exports.RETREAT_HP_THRESHOLD = 0.35
____exports.RECOVER_HP_THRESHOLD = 0.7
____exports.HEAL_POTION_HP_THRESHOLD = 0.65
____exports.HEAL_POTION_COST = 100
____exports.COMBINED_POTION_COST = 350
____exports.HEAL_POTION_BUY_COOLDOWN = 16
____exports.IGNORED_BOSS_ABILITIES = __TS__New(Set, {
    "generic_hidden",
    "ability_capture",
    "ability_lamp_use",
    "twin_gate_portal_warp",
    "abyssal_underlord_portal_warp",
    "ability_pluck_famango"
})
function ____exports.distance2D(self, a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
end
function ____exports.computeBossScale(self, def, level)
    local denom = math.max(1, EVO_CONSTANTS.BOSS_MAX_LEVEL - 1)
    local t = math.min(
        1,
        math.max(0, (level - 1) / denom)
    )
    return def.modelScaleMin + (def.modelScaleMax - def.modelScaleMin) * t
end
function ____exports.getBossRequiredXp(self, level)
    if level <= 1 then
        return 0
    end
    local n = level - 1
    return math.floor(n * 280 + n * n * 4.5)
end
function ____exports.isNearAnyFountain(self, pos, fountainPositions, radius)
    if radius == nil then
        radius = 1600
    end
    for ____, fPos in ipairs(fountainPositions) do
        if ____exports.distance2D(nil, pos, fPos) <= radius then
            return true
        end
    end
    return false
end
function ____exports.isHeroProtectedByFountain(self, hero, fountainPositions)
    if hero:HasModifier("modifier_fountain_buff_lua") or hero:HasModifier("modifier_fountain_aura_buff") then
        return true
    end
    return ____exports.isNearAnyFountain(
        nil,
        hero:GetAbsOrigin(),
        fountainPositions,
        1600
    )
end
function ____exports.revealBossOnMinimap(self, origin)
    for ____, team in ipairs(EVO_PLAYABLE_TEAMS) do
        AddFOWViewer(
            team,
            origin,
            220,
            ____exports.BOSS_AI_TICK_SECONDS + 0.15,
            false
        )
    end
end
function ____exports.discoverBossMapPositions(self)
    local fountainPositions = {}
    local bossSpawnPoints = {}
    local patrolWaypoints = {}
    for ____, fountain in ipairs(Entities:FindAllByClassname("ent_dota_fountain")) do
        if fountain and not fountain:IsNull() and IsValidEntity(fountain) then
            fountainPositions[#fountainPositions + 1] = fountain:GetAbsOrigin()
        end
    end
    for ____, ent in ipairs(Entities:FindAllByName(EVO_MAP_ENTITIES.BOSS_SPAWN_PREFIX .. "*")) do
        if ent and not ent:IsNull() and IsValidEntity(ent) then
            bossSpawnPoints[#bossSpawnPoints + 1] = ent:GetAbsOrigin()
        end
    end
    for ____, trigger in ipairs(Entities:FindAllByClassname("trigger_multiple")) do
        do
            if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
                goto __continue22
            end
            local name = trigger:GetName()
            if __TS__StringStartsWith(name, "neutralcamp_") then
                local parts = __TS__StringSplit(name, "_")
                local campSize = parts[2] or "small"
                patrolWaypoints[#patrolWaypoints + 1] = {
                    position = trigger:GetAbsOrigin(),
                    campSize = campSize
                }
            end
        end
        ::__continue22::
    end
    if #patrolWaypoints == 0 then
        __TS__ArrayPush(
            patrolWaypoints,
            {
                position = Vector(-2500, 2500, 128),
                campSize = "small"
            },
            {
                position = Vector(2500, 2500, 128),
                campSize = "small"
            },
            {
                position = Vector(-2500, -2500, 128),
                campSize = "medium"
            },
            {
                position = Vector(2500, -2500, 128),
                campSize = "medium"
            }
        )
    end
    if #bossSpawnPoints < 4 then
        for ____, wp in ipairs(patrolWaypoints) do
            if not ____exports.isNearAnyFountain(nil, wp.position, fountainPositions, 1600) then
                bossSpawnPoints[#bossSpawnPoints + 1] = wp.position
            end
        end
    end
    if #bossSpawnPoints == 0 then
        __TS__ArrayPush(
            bossSpawnPoints,
            Vector(-1800, 1800, 128),
            Vector(1800, -1800, 128)
        )
    end
    return {fountainPositions = fountainPositions, bossSpawnPoints = bossSpawnPoints, patrolWaypoints = patrolWaypoints}
end
return ____exports
