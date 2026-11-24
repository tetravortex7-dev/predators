local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 6,["6"] = 7,["7"] = 8,["8"] = 9,["11"] = 10,["14"] = 6,["15"] = 13,["16"] = 14,["17"] = 15,["18"] = 16,["21"] = 17,["24"] = 19,["25"] = 19,["26"] = 20,["29"] = 22,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["36"] = 13,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27});
function OnStartTouch(event)
    local unit = event.activator
    local trigger = event.caller
    if not unit or unit:IsNull() or not IsValidEntity(unit) then
        return
    end
    if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
        return
    end
end
function OnEndTouch(event)
    local unit = event.activator
    local trigger = event.caller
    if not unit or unit:IsNull() or not IsValidEntity(unit) then
        return
    end
    if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
        return
    end
    local ____opt_0 = GameRules.EvoAddon
    local duelManager = ____opt_0 and ____opt_0.duelManager
    if not duelManager or not duelManager:isActiveDuelist(unit) then
        return
    end
    if unit:IsBaseNPC() and unit:IsAlive() then
        FindClearSpaceForUnit(
            unit,
            duelManager:getArenaCenter(),
            true
        )
    end
end
__TS__ObjectAssign(
    getfenv(),
    {OnStartTouch = OnStartTouch, OnEndTouch = OnEndTouch}
)
