local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 4,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 7,["21"] = 10,["22"] = 12,["23"] = 13,["24"] = 12,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["30"] = 22,["31"] = 21,["32"] = 20,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 26,["38"] = 32,["39"] = 33,["40"] = 34,["41"] = 33,["42"] = 32});
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
function ____exports.dotaModifierFunction(self, name)
    return LUA_G[name]
end
function ____exports.dotaModifierState(self, name)
    return LUA_G[name]
end
function ____exports.registerAbility(self, name)
    return function(____, ability)
        _G[name] = ability.prototype
    end
end
function ____exports.registerModifier(self, name)
    return function(____, modifier)
        _G[name] = modifier.prototype
    end
end
function ____exports.registerItem(self, name)
    return function(____, item)
        _G[name] = item.prototype
    end
end
return ____exports
