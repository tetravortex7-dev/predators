local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 8,["20"] = 11,["23"] = 12,["27"] = 13,["31"] = 14,["35"] = 15,["37"] = 10,["38"] = 18,["39"] = 19,["40"] = 20,["41"] = 21,["44"] = 24,["45"] = 18,["46"] = 27,["47"] = 28,["48"] = 28,["49"] = 28,["50"] = 28,["51"] = 27});
local ____exports = {}
local ____starter = require("data.branches.starter")
local EVO_STARTER_BODIES = ____starter.EVO_STARTER_BODIES
local ____bristle = require("data.branches.bristle")
local EVO_BRANCH_BRISTLE_BODIES = ____bristle.EVO_BRANCH_BRISTLE_BODIES
local ____morph = require("data.branches.morph")
local EVO_BRANCH_MORPH_BODIES = ____morph.EVO_BRANCH_MORPH_BODIES
local ____nyx = require("data.branches.nyx")
local EVO_BRANCH_NYX_BODIES = ____nyx.EVO_BRANCH_NYX_BODIES
local ____slark = require("data.branches.slark")
local EVO_BRANCH_SLARK_BODIES = ____slark.EVO_BRANCH_SLARK_BODIES
____exports.EVO_DEFAULT_START_BODY_ID = "evo_body_t1_amoeba"
local ____array_0 = __TS__SparseArrayNew(unpack(EVO_STARTER_BODIES))
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_BRISTLE_BODIES)
)
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_MORPH_BODIES)
)
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_NYX_BODIES)
)
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_SLARK_BODIES)
)
____exports.EVO_BODIES_CATALOG = {__TS__SparseArraySpread(____array_0)}
function ____exports.getBodyDefinition(self, bodyId)
    for ____, body in ipairs(____exports.EVO_BODIES_CATALOG) do
        if body.id == bodyId then
            return body
        end
    end
    return nil
end
function ____exports.getBodiesForTier(self, tierIndex)
    return __TS__ArrayFilter(
        ____exports.EVO_BODIES_CATALOG,
        function(____, body) return body.tierIndex == tierIndex end
    )
end
return ____exports
