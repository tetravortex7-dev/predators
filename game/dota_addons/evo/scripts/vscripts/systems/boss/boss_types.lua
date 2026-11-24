local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 31,["14"] = 32,["15"] = 33,["16"] = 34,["17"] = 35,["18"] = 36,["19"] = 37,["20"] = 39,["21"] = 40,["22"] = 41,["23"] = 42,["24"] = 43,["25"] = 44,["26"] = 45,["27"] = 47,["28"] = 47,["29"] = 47,["30"] = 47,["31"] = 47,["32"] = 47,["33"] = 47,["34"] = 47,["35"] = 56,["36"] = 56,["37"] = 56,["38"] = 56,["39"] = 56,["40"] = 56,["41"] = 56,["42"] = 56,["43"] = 65,["44"] = 66,["45"] = 67,["46"] = 68,["47"] = 65,["48"] = 71,["49"] = 72,["50"] = 73,["51"] = 73,["52"] = 73,["53"] = 73,["54"] = 74,["55"] = 71,["56"] = 77,["57"] = 78,["58"] = 78,["60"] = 79,["61"] = 80,["62"] = 77,["63"] = 83,["64"] = 86,["65"] = 86,["67"] = 88,["68"] = 89,["69"] = 90,["72"] = 93,["73"] = 83,["74"] = 96,["75"] = 100,["76"] = 101,["78"] = 103,["79"] = 103,["80"] = 103,["81"] = 103,["82"] = 103,["83"] = 103,["84"] = 96,["85"] = 106,["86"] = 107,["87"] = 108,["88"] = 108,["89"] = 108,["90"] = 108,["91"] = 108,["92"] = 108,["93"] = 108,["95"] = 106,["96"] = 112,["97"] = 117,["98"] = 118,["99"] = 119,["100"] = 121,["101"] = 122,["102"] = 123,["105"] = 127,["106"] = 128,["107"] = 129,["110"] = 133,["112"] = 134,["113"] = 134,["115"] = 135,["116"] = 136,["117"] = 137,["118"] = 138,["119"] = 139,["120"] = 139,["121"] = 139,["122"] = 139,["127"] = 146,["128"] = 147,["129"] = 147,["130"] = 148,["131"] = 148,["132"] = 148,["133"] = 147,["134"] = 149,["135"] = 149,["136"] = 149,["137"] = 147,["138"] = 150,["139"] = 150,["140"] = 150,["141"] = 147,["142"] = 151,["143"] = 151,["144"] = 151,["145"] = 147,["146"] = 147,["148"] = 155,["149"] = 156,["150"] = 157,["151"] = 158,["155"] = 162,["156"] = 163,["157"] = 163,["158"] = 163,["159"] = 163,["160"] = 163,["162"] = 166,["163"] = 112});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
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
local PLAYER_TEAMS = {
    2,
    3,
    6,
    7,
    8,
    9
}
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
    for ____, team in ipairs(PLAYER_TEAMS) do
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
