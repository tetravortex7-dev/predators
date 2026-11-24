local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 9,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 10,["20"] = 14,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 14,["28"] = 23,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 23,["35"] = 31,["36"] = 32,["39"] = 33,["40"] = 31,["41"] = 36,["42"] = 37,["45"] = 38,["46"] = 39,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 41,["57"] = 43,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["63"] = 43,["66"] = 36,["67"] = 51,["68"] = 52,["69"] = 51,["70"] = 55,["71"] = 56,["72"] = 55,["73"] = 59,["74"] = 60,["75"] = 59,["76"] = 9,["77"] = 8,["78"] = 9,["80"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_fountain_buff_lua = __TS__Class()
local modifier_fountain_buff_lua = ____exports.modifier_fountain_buff_lua
modifier_fountain_buff_lua.name = "modifier_fountain_buff_lua"
__TS__ClassExtends(modifier_fountain_buff_lua, BaseModifier)
function modifier_fountain_buff_lua.prototype.GetTexture(self)
    return "fountain_heal"
end
function modifier_fountain_buff_lua.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_ATTACK_IMMUNE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_UNTARGETABLE_ENEMY")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_LOW_ATTACK_PRIORITY")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_HEALTH_BAR_FOR_ENEMIES")] = true
    }
end
function modifier_fountain_buff_lua.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT")
    }
end
function modifier_fountain_buff_lua.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.5)
end
function modifier_fountain_buff_lua.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    parent:Purge(
        false,
        true,
        false,
        true,
        true
    )
    do
        local slot = 0
        while slot < 9 do
            local item = parent:GetItemInSlot(slot)
            if item and not item:IsNull() and item:GetAbilityName() == "item_bottle" then
                item:SetCurrentCharges(3)
            end
            slot = slot + 1
        end
    end
end
function modifier_fountain_buff_lua.prototype.GetModifierHealthRegenPercentage(self)
    return 20
end
function modifier_fountain_buff_lua.prototype.GetModifierTotalPercentageManaRegen(self)
    return 20
end
function modifier_fountain_buff_lua.prototype.GetModifierConstantManaRegen(self)
    return 30
end
modifier_fountain_buff_lua = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_fountain_buff_lua")},
    modifier_fountain_buff_lua
)
____exports.modifier_fountain_buff_lua = modifier_fountain_buff_lua
return ____exports
