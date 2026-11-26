local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 2,["9"] = 3,["10"] = 4,["12"] = 6,["13"] = 1,["14"] = 14,["15"] = 19,["18"] = 20,["19"] = 21,["22"] = 23,["23"] = 24,["24"] = 25,["25"] = 25,["26"] = 25,["27"] = 28,["28"] = 28,["29"] = 28,["30"] = 28,["31"] = 28,["32"] = 25,["33"] = 25,["34"] = 36,["35"] = 36,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 41,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 14});
local ____exports = {}
function ____exports.isEvoCreepUnit(self, unit)
    if not unit or unit:IsNull() or not IsValidEntity(unit) then
        return false
    end
    if unit:IsHero() or unit:IsConsideredHero() or unit:IsBuilding() or unit:IsOther() or unit:IsBoss() then
        return false
    end
    return unit:IsCreep() or unit:IsNeutralUnitType() or unit:IsCreature() or unit:GetTeamNumber() == 4
end
function ____exports.focusPlayerCamera(self, playerId, hero, position)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local player = PlayerResource:GetPlayer(playerId)
    if not player or player:IsNull() then
        return
    end
    PlayerResource:SetCameraTarget(playerId, hero)
    CenterCameraOnUnit(playerId, hero)
    CustomGameEventManager:Send_ServerToPlayer(
        player,
        "evo_focus_camera",
        {
            x = position.x,
            y = position.y,
            z = position.z,
            entindex = hero:entindex()
        }
    )
    GameRules:GetGameModeEntity():SetContextThink(
        DoUniqueString("EvoUnlockCam"),
        function()
            PlayerResource:SetCameraTarget(playerId, nil)
            CenterCameraOnUnit(playerId, nil)
            return nil
        end,
        0.25
    )
end
return ____exports
