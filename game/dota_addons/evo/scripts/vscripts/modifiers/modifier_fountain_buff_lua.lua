local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 9,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 10,["20"] = 14,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 14,["29"] = 24,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 24,["36"] = 32,["37"] = 33,["40"] = 34,["41"] = 32,["42"] = 37,["43"] = 38,["46"] = 39,["47"] = 40,["50"] = 42,["51"] = 42,["52"] = 43,["53"] = 44,["56"] = 48,["57"] = 49,["58"] = 50,["61"] = 53,["62"] = 54,["63"] = 55,["64"] = 56,["65"] = 57,["66"] = 58,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 62,["75"] = 62,["77"] = 64,["78"] = 64,["79"] = 65,["80"] = 66,["81"] = 67,["83"] = 64,["86"] = 37,["87"] = 72,["88"] = 73,["89"] = 72,["90"] = 76,["91"] = 77,["92"] = 76,["93"] = 80,["94"] = 81,["95"] = 80,["96"] = 9,["97"] = 8,["98"] = 9,["100"] = 9});
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
        [dotaModifierState(nil, "MODIFIER_STATE_INVULNERABLE")] = true,
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
    self:StartIntervalThink(0.2)
end
function modifier_fountain_buff_lua.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    local ____opt_0 = GameRules.EvoAddon
    local duelMgr = ____opt_0 and ____opt_0.duelManager
    if duelMgr and duelMgr:isActiveDuelist(parent) then
        self:Destroy()
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        self:Destroy()
        return
    end
    local pPos = parent:GetAbsOrigin()
    local cPos = caster:GetAbsOrigin()
    local dx = pPos.x - cPos.x
    local dy = pPos.y - cPos.y
    if dx * dx + dy * dy > 800 * 800 then
        self:Destroy()
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
