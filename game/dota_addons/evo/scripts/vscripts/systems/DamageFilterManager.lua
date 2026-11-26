local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 5,["10"] = 6,["11"] = 8,["12"] = 8,["13"] = 12,["14"] = 12,["15"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 12,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 19,["26"] = 21,["27"] = 22,["28"] = 22,["29"] = 22,["30"] = 22,["31"] = 17,["32"] = 25,["33"] = 26,["34"] = 26,["35"] = 25,["36"] = 29,["37"] = 30,["38"] = 30,["39"] = 29,["40"] = 33,["41"] = 34,["42"] = 33,["43"] = 37,["44"] = 38,["45"] = 37,["46"] = 41,["47"] = 44,["48"] = 45,["50"] = 47,["51"] = 48,["52"] = 49,["54"] = 51,["55"] = 55,["56"] = 56,["58"] = 58,["59"] = 59,["60"] = 60,["61"] = 60,["62"] = 60,["64"] = 60,["66"] = 60,["67"] = 61,["68"] = 41,["69"] = 64,["70"] = 65,["71"] = 66,["72"] = 67,["75"] = 71,["76"] = 72,["78"] = 75,["79"] = 76,["80"] = 77,["81"] = 78,["83"] = 80,["84"] = 81,["86"] = 84,["87"] = 84,["88"] = 84,["89"] = 84,["90"] = 85,["91"] = 86,["93"] = 89,["94"] = 90,["95"] = 90,["96"] = 90,["97"] = 90,["98"] = 91,["99"] = 91,["100"] = 91,["101"] = 91,["102"] = 91,["103"] = 91,["104"] = 91,["105"] = 91,["106"] = 91,["107"] = 91,["108"] = 102,["109"] = 103,["110"] = 104,["112"] = 106,["113"] = 108,["114"] = 64});
local ____exports = {}
local ____damage_rules = require("data.damage_rules")
local getDamageRule = ____damage_rules.getDamageRule
local getGlobalDamagePostModifiers = ____damage_rules.getGlobalDamagePostModifiers
local ____damage_mitigation = require("systems.damage.damage_mitigation")
local computeModifiedDamage = ____damage_mitigation.computeModifiedDamage
____exports.DamageFilterManager = __TS__Class()
local DamageFilterManager = ____exports.DamageFilterManager
DamageFilterManager.name = "DamageFilterManager"
function DamageFilterManager.prototype.____constructor(self)
    self.guards = {}
    self.postModifiers = {}
    self.runtimeRules = __TS__New(Map)
end
function DamageFilterManager.prototype.init(self)
    for ____, hook in ipairs(getGlobalDamagePostModifiers(nil)) do
        local ____self_postModifiers_0 = self.postModifiers
        ____self_postModifiers_0[#____self_postModifiers_0 + 1] = hook
    end
    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetDamageFilter(
        function(____, event) return self:onDamageFilter(event) end,
        self
    )
end
function DamageFilterManager.prototype.registerGuard(self, guard)
    local ____self_guards_1 = self.guards
    ____self_guards_1[#____self_guards_1 + 1] = guard
end
function DamageFilterManager.prototype.registerPostModifier(self, hook)
    local ____self_postModifiers_2 = self.postModifiers
    ____self_postModifiers_2[#____self_postModifiers_2 + 1] = hook
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
    local ____temp_3
    if candidate.IsItem ~= nil then
        ____temp_3 = candidate:IsItem()
    else
        ____temp_3 = false
    end
    local isItem = ____temp_3
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
    local ____temp_4 = self:resolveInflictor(event.entindex_inflictor_const)
    local inflictor = ____temp_4.inflictor
    local abilityName = ____temp_4.abilityName
    local isItem = ____temp_4.isItem
    if not abilityName then
        return true
    end
    local rule = self.runtimeRules:get(abilityName) or getDamageRule(nil, abilityName)
    local level = inflictor and math.max(
        1,
        inflictor:GetLevel()
    ) or 1
    local ctx = {
        attacker = attacker,
        victim = victim,
        inflictor = inflictor,
        abilityName = abilityName,
        isItem = isItem,
        damageType = event.damagetype_const,
        damage = event.damage,
        level = level
    }
    local nextDamage = rule and computeModifiedDamage(nil, ctx, rule) or event.damage
    for ____, postMod in ipairs(self.postModifiers) do
        nextDamage = postMod(nil, ctx, nextDamage)
    end
    event.damage = math.max(0, nextDamage)
    return true
end
return ____exports
