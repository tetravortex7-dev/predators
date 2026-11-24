local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 8,["21"] = 9,["22"] = 5,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["39"] = 29,["40"] = 30,["42"] = 32,["43"] = 33,["44"] = 34,["46"] = 27,["47"] = 38,["48"] = 39,["51"] = 40,["52"] = 41,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 44,["60"] = 38,["61"] = 47,["62"] = 48,["63"] = 48,["64"] = 48,["65"] = 48,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 47,["72"] = 59,["73"] = 60,["74"] = 60,["76"] = 61,["77"] = 62,["79"] = 64,["80"] = 59,["81"] = 67,["82"] = 68,["83"] = 68,["85"] = 69,["86"] = 70,["88"] = 72,["89"] = 67,["90"] = 75,["91"] = 76,["92"] = 76,["94"] = 77,["95"] = 78,["97"] = 80,["98"] = 75,["99"] = 83,["100"] = 84,["101"] = 84,["103"] = 85,["104"] = 86,["106"] = 88,["107"] = 83,["108"] = 91,["109"] = 92,["110"] = 92,["112"] = 93,["113"] = 91,["114"] = 96,["115"] = 97,["118"] = 98,["119"] = 99,["122"] = 101,["123"] = 102,["124"] = 103,["127"] = 105,["128"] = 106,["129"] = 107,["130"] = 108,["131"] = 109,["133"] = 111,["134"] = 112,["135"] = 113,["137"] = 96,["138"] = 117,["139"] = 118,["142"] = 119,["145"] = 121,["146"] = 122,["149"] = 124,["150"] = 125,["151"] = 126,["154"] = 128,["155"] = 129,["156"] = 130,["157"] = 130,["158"] = 130,["159"] = 130,["160"] = 117,["161"] = 133,["162"] = 134,["163"] = 133,["164"] = 6,["165"] = 5,["166"] = 6,["168"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerModifier = ____dota_ts_adapter.registerModifier
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
____exports.modifier_evo_mutation_runtime = __TS__Class()
local modifier_evo_mutation_runtime = ____exports.modifier_evo_mutation_runtime
modifier_evo_mutation_runtime.name = "modifier_evo_mutation_runtime"
__TS__ClassExtends(modifier_evo_mutation_runtime, BaseModifier)
function modifier_evo_mutation_runtime.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastTriggerTime = -999
    self.triggerBuffUntil = 0
end
function modifier_evo_mutation_runtime.prototype.IsHidden(self)
    return false
end
function modifier_evo_mutation_runtime.prototype.IsPurgable(self)
    return false
end
function modifier_evo_mutation_runtime.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_mutation_runtime.prototype.GetAttributes(self)
    return 2 + 1
end
function modifier_evo_mutation_runtime.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    if params and params.mutation_id then
        self.mutationDef = getMutationDefinition(nil, params.mutation_id)
    end
    if self.mutationDef and self.mutationDef.triggerType == "INTERVAL" then
        local interval = self.mutationDef.intervalSeconds or 10
        self:StartIntervalThink(interval)
    end
end
function modifier_evo_mutation_runtime.prototype.OnIntervalThink(self)
    if not IsServer() or not self.mutationDef then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    parent:Heal(
        math.floor(parent:GetMaxHealth() * 0.04),
        nil
    )
    parent:GiveMana(math.floor(parent:GetMaxMana() * 0.04))
end
function modifier_evo_mutation_runtime.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EXTRA_HEALTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")
    }
end
function modifier_evo_mutation_runtime.prototype.GetModifierPreAttack_BonusDamage(self)
    if not self.mutationDef then
        return 0
    end
    if self.mutationDef.triggerType == "PASSIVE" or self:isTriggerActive() then
        return self.mutationDef.bonusDamage or 0
    end
    return 0
end
function modifier_evo_mutation_runtime.prototype.GetModifierPhysicalArmorBonus(self)
    if not self.mutationDef then
        return 0
    end
    if self.mutationDef.triggerType == "PASSIVE" or self:isTriggerActive() then
        return self.mutationDef.bonusArmor or 0
    end
    return 0
end
function modifier_evo_mutation_runtime.prototype.GetModifierMoveSpeedBonus_Constant(self)
    if not self.mutationDef then
        return 0
    end
    if self.mutationDef.triggerType == "PASSIVE" or self:isTriggerActive() then
        return self.mutationDef.bonusMoveSpeed or 0
    end
    return 0
end
function modifier_evo_mutation_runtime.prototype.GetModifierAttackSpeedBonus_Constant(self)
    if not self.mutationDef then
        return 0
    end
    if self.mutationDef.triggerType == "PASSIVE" or self:isTriggerActive() then
        return self.mutationDef.bonusAttackSpeed or 0
    end
    return 0
end
function modifier_evo_mutation_runtime.prototype.GetModifierExtraHealthBonus(self)
    if not self.mutationDef then
        return 0
    end
    return self.mutationDef.bonusHealth or 0
end
function modifier_evo_mutation_runtime.prototype.OnTakeDamage(self, event)
    if not IsServer() or not self.mutationDef then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or event.unit ~= parent then
        return
    end
    local now = GameRules:GetGameTime()
    local cooldown = self.mutationDef.cooldown or 5
    if now - self.lastTriggerTime < cooldown then
        return
    end
    if self.mutationDef.triggerType == "HP_BELOW_PERCENT" then
        local threshold = self.mutationDef.thresholdPercent or 35
        if parent:GetHealthPercent() <= threshold then
            self.lastTriggerTime = now
            self.triggerBuffUntil = now + 4
        end
    elseif self.mutationDef.triggerType == "ON_DAMAGE_TAKEN" and event.damage > 0 then
        self.lastTriggerTime = now
        self.triggerBuffUntil = now + 3
    end
end
function modifier_evo_mutation_runtime.prototype.OnDeath(self, event)
    if not IsServer() or not self.mutationDef then
        return
    end
    if self.mutationDef.triggerType ~= "ON_KILL" then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or event.attacker ~= parent then
        return
    end
    local now = GameRules:GetGameTime()
    local cooldown = self.mutationDef.cooldown or 5
    if now - self.lastTriggerTime < cooldown then
        return
    end
    self.lastTriggerTime = now
    self.triggerBuffUntil = now + 6
    parent:Heal(
        math.floor(parent:GetMaxHealth() * 0.1),
        nil
    )
end
function modifier_evo_mutation_runtime.prototype.isTriggerActive(self)
    return GameRules:GetGameTime() <= self.triggerBuffUntil
end
modifier_evo_mutation_runtime = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_mutation_runtime")},
    modifier_evo_mutation_runtime
)
____exports.modifier_evo_mutation_runtime = modifier_evo_mutation_runtime
return ____exports
