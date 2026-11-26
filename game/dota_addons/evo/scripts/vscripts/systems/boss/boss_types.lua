local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 36,["15"] = 37,["16"] = 38,["17"] = 39,["18"] = 40,["19"] = 41,["20"] = 42,["21"] = 44,["22"] = 45,["23"] = 46,["24"] = 47,["25"] = 48,["26"] = 49,["27"] = 50,["28"] = 52,["29"] = 52,["30"] = 52,["31"] = 52,["32"] = 52,["33"] = 52,["34"] = 52,["35"] = 52,["36"] = 61,["37"] = 62,["38"] = 63,["39"] = 64,["40"] = 61,["41"] = 67,["42"] = 68,["43"] = 69,["44"] = 69,["45"] = 69,["46"] = 69,["47"] = 70,["48"] = 67,["49"] = 73,["50"] = 74,["51"] = 74,["53"] = 75,["54"] = 76,["55"] = 73,["56"] = 79,["57"] = 82,["58"] = 82,["60"] = 84,["61"] = 85,["62"] = 86,["65"] = 89,["66"] = 79,["67"] = 92,["68"] = 96,["69"] = 97,["71"] = 99,["72"] = 99,["73"] = 99,["74"] = 99,["75"] = 99,["76"] = 99,["77"] = 92,["78"] = 102,["79"] = 103,["80"] = 104,["81"] = 104,["82"] = 104,["83"] = 104,["84"] = 104,["85"] = 104,["86"] = 104,["88"] = 102,["89"] = 108,["90"] = 113,["91"] = 114,["92"] = 115,["93"] = 117,["94"] = 118,["95"] = 119,["98"] = 123,["99"] = 124,["100"] = 125,["103"] = 129,["105"] = 130,["106"] = 130,["108"] = 131,["109"] = 132,["110"] = 133,["111"] = 134,["112"] = 135,["113"] = 135,["114"] = 135,["115"] = 135,["120"] = 142,["121"] = 143,["122"] = 143,["123"] = 144,["124"] = 144,["125"] = 144,["126"] = 143,["127"] = 145,["128"] = 145,["129"] = 145,["130"] = 143,["131"] = 146,["132"] = 146,["133"] = 146,["134"] = 143,["135"] = 147,["136"] = 147,["137"] = 147,["138"] = 143,["139"] = 143,["141"] = 151,["142"] = 152,["143"] = 153,["144"] = 154,["148"] = 158,["149"] = 159,["150"] = 159,["151"] = 159,["152"] = 159,["153"] = 159,["155"] = 162,["156"] = 108});
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
            bossSpawnPoints[#bossSpawnPoints + 1] = {position = ent:GetAbsOrigin()}
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
                bossSpawnPoints[#bossSpawnPoints + 1] = {position = wp.position, campSize = wp.campSize}
            end
        end
    end
    if #bossSpawnPoints == 0 then
        __TS__ArrayPush(
            bossSpawnPoints,
            {position = Vector(-1800, 1800, 128)},
            {position = Vector(1800, -1800, 128)}
        )
    end
    return {fountainPositions = fountainPositions, bossSpawnPoints = bossSpawnPoints, patrolWaypoints = patrolWaypoints}
end
return ____exports
