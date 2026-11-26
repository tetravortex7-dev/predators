local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 10,["24"] = 13,["27"] = 14,["31"] = 15,["35"] = 16,["39"] = 17,["43"] = 18,["47"] = 19,["49"] = 12,["50"] = 22,["51"] = 23,["52"] = 24,["53"] = 25,["56"] = 28,["57"] = 22,["58"] = 31,["59"] = 32,["60"] = 32,["61"] = 32,["62"] = 32,["63"] = 31});
local ____exports = {}
local ____starter = require("data.branches.starter")
local EVO_STARTER_BODIES = ____starter.EVO_STARTER_BODIES
local ____bristle = require("data.branches.bristle")
local EVO_BRANCH_BRISTLE_BODIES = ____bristle.EVO_BRANCH_BRISTLE_BODIES
local ____morph = require("data.branches.morph")
local EVO_BRANCH_MORPH_BODIES = ____morph.EVO_BRANCH_MORPH_BODIES
local ____nyx = require("data.branches.nyx")
local EVO_BRANCH_NYX_BODIES = ____nyx.EVO_BRANCH_NYX_BODIES
local ____nyx_2 = require("data.branches.nyx_2")
local EVO_BRANCH_NYX_BODIES_2 = ____nyx_2.EVO_BRANCH_NYX_BODIES_2
local ____slark = require("data.branches.slark")
local EVO_BRANCH_SLARK_BODIES = ____slark.EVO_BRANCH_SLARK_BODIES
local ____spectre = require("data.branches.spectre")
local EVO_BRANCH_SPECTRE_BODIES = ____spectre.EVO_BRANCH_SPECTRE_BODIES
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
    unpack(EVO_BRANCH_NYX_BODIES_2)
)
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_SLARK_BODIES)
)
__TS__SparseArrayPush(
    ____array_0,
    unpack(EVO_BRANCH_SPECTRE_BODIES)
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
