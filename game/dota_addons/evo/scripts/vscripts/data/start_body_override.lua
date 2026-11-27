local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 6,["12"] = 7,["13"] = 8,["14"] = 9,["15"] = 10,["18"] = 13,["19"] = 5});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_DEFAULT_START_BODY_ID = ____bodies_catalog.EVO_DEFAULT_START_BODY_ID
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
function ____exports.getInitialStartBody(self)
    local overrideId = EVO_CONSTANTS.DEV_START_BODY_ID
    if IsInToolsMode() and #overrideId > 0 then
        local overrideBody = getBodyDefinition(nil, overrideId)
        if overrideBody then
            return overrideBody
        end
    end
    return getBodyDefinition(nil, EVO_DEFAULT_START_BODY_ID)
end
return ____exports
