local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 93,["11"] = 93,["12"] = 93,["14"] = 94,["15"] = 93,["16"] = 96,["17"] = 97,["18"] = 98,["19"] = 99,["20"] = 100,["22"] = 102,["23"] = 104,["24"] = 96,["25"] = 107,["26"] = 108,["27"] = 108,["28"] = 109,["29"] = 110,["30"] = 108,["31"] = 112,["32"] = 107,["33"] = 115,["34"] = 116,["35"] = 117,["38"] = 119,["39"] = 120,["40"] = 121,["42"] = 115,["43"] = 125,["44"] = 126,["45"] = 127,["48"] = 129,["49"] = 130,["50"] = 131,["52"] = 125,["53"] = 135,["54"] = 136,["55"] = 135});
local ____exports = {}
____exports.EventBus = __TS__Class()
local EventBus = ____exports.EventBus
EventBus.name = "EventBus"
function EventBus.prototype.____constructor(self)
    self.listeners = __TS__New(Map)
end
function EventBus.prototype.on(self, event, handler)
    local list = self.listeners:get(event)
    if not list then
        list = {}
        self.listeners:set(event, list)
    end
    list[#list + 1] = handler
    return function() return self:off(event, handler) end
end
function EventBus.prototype.once(self, event, handler)
    local wrapper
    wrapper = function(____, payload)
        self:off(event, wrapper)
        handler(nil, payload)
    end
    return self:on(event, wrapper)
end
function EventBus.prototype.off(self, event, handler)
    local list = self.listeners:get(event)
    if not list then
        return
    end
    local index = __TS__ArrayIndexOf(list, handler)
    if index ~= -1 then
        __TS__ArraySplice(list, index, 1)
    end
end
function EventBus.prototype.emit(self, event, payload)
    local list = self.listeners:get(event)
    if not list or #list == 0 then
        return
    end
    local snapshot = {unpack(list)}
    for ____, handler in ipairs(snapshot) do
        handler(nil, payload)
    end
end
function EventBus.prototype.clear(self)
    self.listeners:clear()
end
return ____exports
