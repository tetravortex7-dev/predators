local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 13,["19"] = 13,["20"] = 13,["22"] = 14,["23"] = 13,["24"] = 16,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 16,["30"] = 23,["31"] = 24,["32"] = 24,["33"] = 23,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["39"] = 33,["40"] = 34,["41"] = 35,["44"] = 39,["45"] = 27,["46"] = 42,["47"] = 43,["48"] = 44,["50"] = 47,["51"] = 48,["52"] = 50,["53"] = 51,["54"] = 55,["56"] = 56,["57"] = 55,["59"] = 55,["61"] = 58,["62"] = 55,["64"] = 55,["65"] = 60,["66"] = 61,["67"] = 62,["68"] = 63,["72"] = 68,["74"] = 69,["75"] = 70,["76"] = 71,["78"] = 73,["79"] = 74,["84"] = 78,["85"] = 42,["86"] = 81,["87"] = 86,["88"] = 87,["90"] = 89,["91"] = 90,["93"] = 93,["94"] = 94,["95"] = 95,["97"] = 98,["98"] = 99,["99"] = 100,["101"] = 103,["102"] = 81,["103"] = 106,["104"] = 107,["107"] = 108,["108"] = 109,["111"] = 110,["112"] = 106});
local ____exports = {}
local PROTECTED_ITEM_ORDERS = __TS__New(Set, {
    17,
    42,
    12,
    13,
    18,
    25,
    37
})
____exports.OrderFilterManager = __TS__Class()
local OrderFilterManager = ____exports.OrderFilterManager
OrderFilterManager.name = "OrderFilterManager"
function OrderFilterManager.prototype.____constructor(self)
    self.guards = {}
end
function OrderFilterManager.prototype.init(self)
    GameRules:GetGameModeEntity():SetExecuteOrderFilter(
        function(____, event) return self:filterOrder(event) end,
        self
    )
end
function OrderFilterManager.prototype.registerGuard(self, guard)
    local ____self_guards_0 = self.guards
    ____self_guards_0[#____self_guards_0 + 1] = guard
end
function OrderFilterManager.prototype.filterOrder(self, event)
    if self:isProtectedItemOrderBlocked(event) then
        self:notifyBlockedOrder(event.issuer_player_id_const)
        return false
    end
    for ____, guard in ipairs(self.guards) do
        if not guard(nil, event) then
            return false
        end
    end
    return true
end
function OrderFilterManager.prototype.isProtectedItemOrderBlocked(self, event)
    if not PROTECTED_ITEM_ORDERS:has(event.order_type) then
        return false
    end
    local issuerId = event.issuer_player_id_const
    local hasValidIssuer = PlayerResource:IsValidPlayerID(issuerId)
    if event.entindex_ability > 0 then
        local abilityOrItem = EntIndexToHScript(event.entindex_ability)
        local ____abilityOrItem_3 = abilityOrItem
        if ____abilityOrItem_3 then
            local ____opt_1 = abilityOrItem.IsNull
            ____abilityOrItem_3 = not (____opt_1 and ____opt_1(abilityOrItem))
        end
        local ____temp_6 = ____abilityOrItem_3 and IsValidEntity(abilityOrItem)
        if ____temp_6 then
            local ____opt_4 = abilityOrItem.IsItem
            ____temp_6 = ____opt_4 and ____opt_4(abilityOrItem)
        end
        if ____temp_6 then
            local item = abilityOrItem
            local purchaser = item:GetPurchaser()
            if self:isOwnerProtectedOrForeign(purchaser, issuerId, hasValidIssuer) then
                return true
            end
        end
    end
    for ____, unitEntIndex in ipairs(__TS__ObjectValues(event.units)) do
        do
            local unit = EntIndexToHScript(unitEntIndex)
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsBaseNPC() then
                goto __continue16
            end
            if self:isOwnerProtectedOrForeign(unit, issuerId, hasValidIssuer) then
                return true
            end
        end
        ::__continue16::
    end
    return false
end
function OrderFilterManager.prototype.isOwnerProtectedOrForeign(self, ownerUnit, issuerId, hasValidIssuer)
    if not ownerUnit or ownerUnit:IsNull() or not IsValidEntity(ownerUnit) then
        return false
    end
    if ownerUnit:IsHero() and ownerUnit:HasOwnerAbandoned() then
        return true
    end
    local ownerPlayerId = ownerUnit:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(ownerPlayerId) then
        return false
    end
    local state = PlayerResource:GetConnectionState(ownerPlayerId)
    if state == 4 or state == 3 then
        return true
    end
    return hasValidIssuer and issuerId ~= ownerPlayerId
end
function OrderFilterManager.prototype.notifyBlockedOrder(self, issuerId)
    if not PlayerResource:IsValidPlayerID(issuerId) then
        return
    end
    local player = PlayerResource:GetPlayer(issuerId)
    if not player or player:IsNull() then
        return
    end
    EmitSoundOnClient("General.CastFail_InvalidTarget_Hero", player)
end
return ____exports
