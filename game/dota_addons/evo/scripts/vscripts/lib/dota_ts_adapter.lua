local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["12"] = 1,["13"] = 4,["14"] = 4,["15"] = 4,["17"] = 4,["18"] = 7,["19"] = 7,["20"] = 7,["22"] = 7,["23"] = 10,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 20,["28"] = 21,["29"] = 22,["30"] = 23,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 29,["36"] = 34,["39"] = 37,["41"] = 39,["42"] = 14,["43"] = 42,["44"] = 43,["45"] = 42,["46"] = 46,["47"] = 47,["48"] = 46,["49"] = 50,["50"] = 51,["51"] = 52,["52"] = 51,["53"] = 50,["54"] = 56,["55"] = 57,["56"] = 58,["57"] = 57,["58"] = 56,["59"] = 62,["60"] = 63,["61"] = 64,["62"] = 63,["63"] = 62});
local ____exports = {}
____exports.BaseAbility = __TS__Class()
local BaseAbility = ____exports.BaseAbility
BaseAbility.name = "BaseAbility"
function BaseAbility.prototype.____constructor(self)
end
____exports.BaseModifier = __TS__Class()
local BaseModifier = ____exports.BaseModifier
BaseModifier.name = "BaseModifier"
function BaseModifier.prototype.____constructor(self)
end
____exports.BaseItem = __TS__Class()
local BaseItem = ____exports.BaseItem
BaseItem.name = "BaseItem"
function BaseItem.prototype.____constructor(self)
end
local LUA_G = _G
local function flattenPrototype(self, proto)
    local dst = proto
    local g = _G
    local visited = __TS__New(Set)
    local mt = g.getmetatable(proto)
    while mt ~= nil and not visited:has(mt) do
        visited:add(mt)
        local indexVal = g.rawget(mt, "__index")
        local base = type(indexVal) == "table" and indexVal ~= nil and indexVal or mt
        for key, value in pairs(base) do
            local k = key
            if k ~= "____constructor" and k ~= "__index" and k ~= "constructor" and g.rawget(dst, k) == nil then
                dst[k] = value
            end
        end
        mt = g.getmetatable(base)
    end
    return dst
end
function ____exports.dotaModifierFunction(self, name)
    return LUA_G[name]
end
function ____exports.dotaModifierState(self, name)
    return LUA_G[name]
end
function ____exports.registerAbility(self, name)
    return function(____, ability)
        _G[name] = flattenPrototype(nil, ability.prototype)
    end
end
function ____exports.registerModifier(self, name)
    return function(____, modifier)
        _G[name] = flattenPrototype(nil, modifier.prototype)
    end
end
function ____exports.registerItem(self, name)
    return function(____, item)
        _G[name] = flattenPrototype(nil, item.prototype)
    end
end
return ____exports
