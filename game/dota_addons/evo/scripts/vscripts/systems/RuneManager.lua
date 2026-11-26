local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 10,["10"] = 10,["11"] = 10,["12"] = 10,["13"] = 10,["14"] = 10,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 20,["19"] = 20,["20"] = 20,["22"] = 21,["23"] = 22,["24"] = 20,["25"] = 24,["26"] = 25,["27"] = 26,["28"] = 26,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 24,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 33,["38"] = 34,["39"] = 34,["41"] = 35,["42"] = 36,["43"] = 36,["45"] = 37,["46"] = 37,["47"] = 38,["51"] = 41,["53"] = 42,["54"] = 42,["56"] = 43,["57"] = 44,["58"] = 44,["60"] = 45,["61"] = 45,["62"] = 46,["66"] = 49,["67"] = 50,["68"] = 51,["69"] = 52,["70"] = 53,["71"] = 54,["72"] = 55,["73"] = 56,["74"] = 57,["75"] = 58,["76"] = 58,["77"] = 59,["78"] = 60,["80"] = 62,["85"] = 67,["87"] = 70,["88"] = 29,["89"] = 73,["90"] = 74,["91"] = 75,["92"] = 76,["93"] = 77,["94"] = 78,["97"] = 81,["98"] = 73,["99"] = 84,["100"] = 85,["101"] = 86,["102"] = 87,["103"] = 88,["105"] = 90,["106"] = 91,["107"] = 92,["109"] = 95,["110"] = 96,["111"] = 96,["112"] = 98,["113"] = 99,["114"] = 100,["115"] = 96,["116"] = 96,["117"] = 96,["118"] = 105,["119"] = 105,["120"] = 107,["121"] = 108,["122"] = 109,["123"] = 105,["124"] = 105,["125"] = 105,["127"] = 84,["128"] = 116,["129"] = 117,["131"] = 118,["132"] = 118,["134"] = 120,["135"] = 121,["136"] = 122,["137"] = 123,["139"] = 125,["141"] = 128,["142"] = 129,["143"] = 131,["144"] = 132,["145"] = 133,["150"] = 116,["151"] = 138,["152"] = 139,["153"] = 140,["156"] = 142,["157"] = 142,["158"] = 143,["159"] = 144,["160"] = 145,["162"] = 142,["165"] = 148,["166"] = 138});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local POWERUP_RUNE_POOL = {
    0,
    1,
    2,
    3,
    4,
    6,
    9
}
____exports.RuneManager = __TS__Class()
local RuneManager = ____exports.RuneManager
RuneManager.name = "RuneManager"
function RuneManager.prototype.____constructor(self)
    self.spots = {}
    self.started = false
end
function RuneManager.prototype.init(self)
    self:discoverRuneSpots()
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
end
function RuneManager.prototype.discoverRuneSpots(self)
    local bountyCount = 0
    local powerCount = 0
    for ____, ent in ipairs(Entities:FindAllByName("dota_rune_spawner_bounty")) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue6
            end
            local pos = ent:GetAbsOrigin()
            if self:hasSpotNear(pos) then
                goto __continue6
            end
            local ____self_spots_0 = self.spots
            ____self_spots_0[#____self_spots_0 + 1] = {origin = pos, kind = "bounty"}
            bountyCount = bountyCount + 1
        end
        ::__continue6::
    end
    for ____, ent in ipairs(Entities:FindAllByName("dota_rune_spawner_powerup")) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue10
            end
            local pos = ent:GetAbsOrigin()
            if self:hasSpotNear(pos) then
                goto __continue10
            end
            local ____self_spots_1 = self.spots
            ____self_spots_1[#____self_spots_1 + 1] = {origin = pos, kind = "powerup"}
            powerCount = powerCount + 1
        end
        ::__continue10::
    end
    local ent = Entities:First()
    while ent ~= nil do
        if not ent:IsNull() and IsValidEntity(ent) then
            local cls = string.lower(ent:GetClassname())
            local name = string.lower(ent:GetName())
            if __TS__StringIncludes(cls, "rune_spawner") or __TS__StringIncludes(name, "rune_spawner") then
                local pos = ent:GetAbsOrigin()
                if not self:hasSpotNear(pos) then
                    local isBounty = __TS__StringIncludes(cls, "bounty") or __TS__StringIncludes(name, "bounty")
                    local ____self_spots_2 = self.spots
                    ____self_spots_2[#____self_spots_2 + 1] = {origin = pos, kind = isBounty and "bounty" or "powerup"}
                    if isBounty then
                        bountyCount = bountyCount + 1
                    else
                        powerCount = powerCount + 1
                    end
                end
            end
        end
        ent = Entities:Next(ent)
    end
    print(((("[Evo] RuneManager discovered " .. tostring(bountyCount)) .. " bounty and ") .. tostring(powerCount)) .. " powerup rune spawner(s).")
end
function RuneManager.prototype.hasSpotNear(self, pos)
    for ____, spot in ipairs(self.spots) do
        local dx = spot.origin.x - pos.x
        local dy = spot.origin.y - pos.y
        if dx * dx + dy * dy < 64 * 64 then
            return true
        end
    end
    return false
end
function RuneManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        if #self.spots == 0 then
            self:discoverRuneSpots()
        end
        self:spawnRunesByKind("bounty")
        if IsInToolsMode() then
            self:spawnRunesByKind("powerup")
        end
        local mode = GameRules:GetGameModeEntity()
        mode:SetContextThink(
            "EvoBountyRuneThink",
            function()
                self:spawnRunesByKind("bounty")
                return EVO_CONSTANTS.BOUNTY_RUNE_INTERVAL_SECONDS
            end,
            EVO_CONSTANTS.BOUNTY_RUNE_INTERVAL_SECONDS
        )
        mode:SetContextThink(
            "EvoPowerRuneThink",
            function()
                self:spawnRunesByKind("powerup")
                return EVO_CONSTANTS.POWER_RUNE_INTERVAL_SECONDS
            end,
            EVO_CONSTANTS.POWER_RUNE_FIRST_SPAWN_SECONDS
        )
    end
end
function RuneManager.prototype.spawnRunesByKind(self, kind)
    for ____, spot in ipairs(self.spots) do
        do
            if spot.kind ~= kind then
                goto __continue31
            end
            if spot.activeRuneEntIndex ~= nil then
                local existing = EntIndexToHScript(spot.activeRuneEntIndex)
                if existing and not existing:IsNull() and IsValidEntity(existing) then
                    UTIL_Remove(existing)
                end
                spot.activeRuneEntIndex = nil
            end
            local runeType = kind == "bounty" and 5 or self:pickNextPowerupRune(spot.lastRuneType)
            spot.lastRuneType = runeType
            local rune = CreateRune(spot.origin, runeType)
            if rune and not rune:IsNull() and IsValidEntity(rune) then
                spot.activeRuneEntIndex = rune:entindex()
            end
        end
        ::__continue31::
    end
end
function RuneManager.prototype.pickNextPowerupRune(self, previous)
    if #POWERUP_RUNE_POOL <= 1 then
        return POWERUP_RUNE_POOL[1] or 1
    end
    do
        local attempt = 0
        while attempt < 6 do
            local candidate = POWERUP_RUNE_POOL[RandomInt(0, #POWERUP_RUNE_POOL - 1) + 1]
            if candidate ~= previous then
                return candidate
            end
            attempt = attempt + 1
        end
    end
    return POWERUP_RUNE_POOL[RandomInt(0, #POWERUP_RUNE_POOL - 1) + 1]
end
return ____exports
