local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 7,["17"] = 8,["18"] = 6,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 10,["26"] = 15,["27"] = 16,["28"] = 16,["29"] = 15,["30"] = 19,["31"] = 20,["32"] = 19,["33"] = 23,["34"] = 24,["35"] = 23,["36"] = 27,["37"] = 30,["38"] = 31,["40"] = 33,["41"] = 34,["42"] = 35,["44"] = 37,["45"] = 41,["46"] = 42,["48"] = 44,["49"] = 45,["50"] = 46,["51"] = 46,["52"] = 46,["54"] = 46,["56"] = 46,["57"] = 47,["58"] = 27,["59"] = 50,["60"] = 51,["61"] = 52,["62"] = 53,["65"] = 57,["66"] = 58,["68"] = 61,["69"] = 62,["70"] = 63,["71"] = 64,["73"] = 66,["74"] = 67,["76"] = 70,["77"] = 70,["78"] = 70,["79"] = 70,["80"] = 71,["81"] = 72,["83"] = 75,["84"] = 76,["85"] = 77,["87"] = 80,["88"] = 80,["89"] = 80,["90"] = 80,["91"] = 81,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["97"] = 82,["98"] = 82,["99"] = 82,["100"] = 81,["101"] = 95,["102"] = 50});
local ____exports = {}
local ____damage_rules = require("data.damage_rules")
local getDamageRule = ____damage_rules.getDamageRule
local ____damage_mitigation = require("systems.damage.damage_mitigation")
local computeModifiedDamage = ____damage_mitigation.computeModifiedDamage
____exports.DamageFilterManager = __TS__Class()
local DamageFilterManager = ____exports.DamageFilterManager
DamageFilterManager.name = "DamageFilterManager"
function DamageFilterManager.prototype.____constructor(self)
    self.guards = {}
    self.runtimeRules = __TS__New(Map)
end
function DamageFilterManager.prototype.init(self)
    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetDamageFilter(
        function(____, event) return self:onDamageFilter(event) end,
        self
    )
end
function DamageFilterManager.prototype.registerGuard(self, guard)
    local ____self_guards_0 = self.guards
    ____self_guards_0[#____self_guards_0 + 1] = guard
end
function DamageFilterManager.prototype.registerRule(self, inflictorName, rule)
    self.runtimeRules:set(inflictorName, rule)
end
function DamageFilterManager.prototype.unregisterRule(self, inflictorName)
    self.runtimeRules:delete(inflictorName)
end
function DamageFilterManager.prototype.resolveInflictor(self, inflictorIndex)
    if inflictorIndex == nil then
        return {isItem = false}
    end
    local scriptEnt = EntIndexToHScript(inflictorIndex)
    if not scriptEnt or scriptEnt:IsNull() or not IsValidEntity(scriptEnt) then
        return {isItem = false}
    end
    local candidate = scriptEnt
    if candidate.GetAbilityName == nil then
        return {isItem = false}
    end
    local inflictor = scriptEnt
    local abilityName = candidate:GetAbilityName()
    local ____temp_1
    if candidate.IsItem ~= nil then
        ____temp_1 = candidate:IsItem()
    else
        ____temp_1 = false
    end
    local isItem = ____temp_1
    return {inflictor = inflictor, abilityName = abilityName, isItem = isItem}
end
function DamageFilterManager.prototype.onDamageFilter(self, event)
    for ____, guard in ipairs(self.guards) do
        if not guard(nil, event) then
            return false
        end
    end
    if event.entindex_attacker_const == nil or event.entindex_victim_const == nil then
        return true
    end
    local attacker = EntIndexToHScript(event.entindex_attacker_const)
    local victim = EntIndexToHScript(event.entindex_victim_const)
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsBaseNPC() then
        return true
    end
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return true
    end
    local ____temp_2 = self:resolveInflictor(event.entindex_inflictor_const)
    local inflictor = ____temp_2.inflictor
    local abilityName = ____temp_2.abilityName
    local isItem = ____temp_2.isItem
    if not abilityName then
        return true
    end
    local rule = self.runtimeRules:get(abilityName) or getDamageRule(nil, abilityName)
    if not rule then
        return true
    end
    local level = inflictor and math.max(
        1,
        inflictor:GetLevel()
    ) or 1
    event.damage = computeModifiedDamage(nil, {
        attacker = attacker,
        victim = victim,
        inflictor = inflictor,
        abilityName = abilityName,
        isItem = isItem,
        damageType = event.damagetype_const,
        damage = event.damage,
        level = level
    }, rule)
    return true
end
return ____exports
