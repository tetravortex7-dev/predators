local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 8,["21"] = 9,["22"] = 5,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["41"] = 31,["42"] = 32,["44"] = 34,["45"] = 35,["46"] = 36,["48"] = 27,["49"] = 40,["50"] = 41,["53"] = 42,["54"] = 43,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 45,["61"] = 46,["62"] = 40,["63"] = 49,["64"] = 50,["65"] = 50,["66"] = 50,["67"] = 50,["68"] = 50,["69"] = 50,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 49,["74"] = 61,["75"] = 62,["76"] = 62,["78"] = 63,["79"] = 64,["81"] = 66,["82"] = 61,["83"] = 69,["84"] = 70,["85"] = 70,["87"] = 71,["88"] = 72,["90"] = 74,["91"] = 69,["92"] = 77,["93"] = 78,["94"] = 78,["96"] = 79,["97"] = 80,["99"] = 82,["100"] = 77,["101"] = 85,["102"] = 86,["103"] = 86,["105"] = 87,["106"] = 88,["108"] = 90,["109"] = 85,["110"] = 93,["111"] = 94,["112"] = 94,["114"] = 95,["115"] = 93,["116"] = 98,["117"] = 99,["120"] = 100,["121"] = 101,["124"] = 103,["125"] = 104,["126"] = 105,["129"] = 107,["130"] = 108,["131"] = 109,["132"] = 110,["133"] = 111,["135"] = 113,["136"] = 114,["137"] = 115,["139"] = 98,["140"] = 119,["141"] = 120,["144"] = 121,["147"] = 123,["148"] = 124,["151"] = 126,["152"] = 127,["153"] = 128,["156"] = 130,["157"] = 131,["158"] = 132,["159"] = 132,["160"] = 132,["161"] = 132,["162"] = 119,["163"] = 135,["164"] = 136,["165"] = 135,["166"] = 6,["167"] = 5,["168"] = 6,["170"] = 6});
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
    self.lastTriggerTime = -999
    self.triggerBuffUntil = 0
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
