local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 5,["16"] = 7,["17"] = 8,["18"] = 7,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 9,["23"] = 8,["24"] = 7,["25"] = 8,["27"] = 8,["28"] = 14,["29"] = 15,["30"] = 14,["31"] = 15,["32"] = 16,["33"] = 17,["34"] = 16,["35"] = 19,["36"] = 20,["37"] = 19,["38"] = 22,["39"] = 23,["40"] = 22,["41"] = 25,["42"] = 26,["43"] = 25,["44"] = 28,["45"] = 29,["46"] = 28,["47"] = 31,["48"] = 32,["51"] = 33,["52"] = 34,["55"] = 35,["58"] = 36,["59"] = 37,["62"] = 38,["65"] = 40,["66"] = 41,["67"] = 42,["68"] = 44,["69"] = 45,["70"] = 46,["71"] = 47,["72"] = 49,["73"] = 50,["74"] = 51,["75"] = 51,["76"] = 51,["77"] = 51,["78"] = 51,["79"] = 51,["80"] = 51,["82"] = 59,["84"] = 31,["85"] = 15,["86"] = 14,["87"] = 15,["89"] = 15});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bosses/evo_elasmyr_bash"
LinkLuaModifier("modifier_evo_elasmyr_bash", SCRIPT_PATH, 0)
____exports.evo_elasmyr_bash = __TS__Class()
local evo_elasmyr_bash = ____exports.evo_elasmyr_bash
evo_elasmyr_bash.name = "evo_elasmyr_bash"
__TS__ClassExtends(evo_elasmyr_bash, BaseAbility)
function evo_elasmyr_bash.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_elasmyr_bash"
end
evo_elasmyr_bash = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_elasmyr_bash")},
    evo_elasmyr_bash
)
____exports.evo_elasmyr_bash = evo_elasmyr_bash
____exports.modifier_evo_elasmyr_bash = __TS__Class()
local modifier_evo_elasmyr_bash = ____exports.modifier_evo_elasmyr_bash
modifier_evo_elasmyr_bash.name = "modifier_evo_elasmyr_bash"
__TS__ClassExtends(modifier_evo_elasmyr_bash, BaseModifier)
function modifier_evo_elasmyr_bash.prototype.IsHidden(self)
    return self:GetStackCount() <= 0
end
function modifier_evo_elasmyr_bash.prototype.IsDebuff(self)
    return false
end
function modifier_evo_elasmyr_bash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_elasmyr_bash.prototype.GetTexture(self)
    return "slardar_bash"
end
function modifier_evo_elasmyr_bash.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_elasmyr_bash.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() or target:IsOther() then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    local ability = self:GetAbility()
    local attackCount = ability and ability:GetSpecialValueFor("attack_count") or 4
    local nextStacks = self:GetStackCount() + 1
    if nextStacks >= attackCount then
        self:SetStackCount(0)
        local bonusDamage = ability and ability:GetSpecialValueFor("bonus_damage") or 50
        local bashDuration = ability and ability:GetSpecialValueFor("bash_duration") or 0.7
        target:EmitSound("Hero_Slardar.Bash")
        target:AddNewModifier(parent, ability, "modifier_stunned", {duration = bashDuration})
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ability,
            damage = bonusDamage,
            damage_type = 1
        })
    else
        self:SetStackCount(nextStacks)
    end
end
modifier_evo_elasmyr_bash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_elasmyr_bash")},
    modifier_evo_elasmyr_bash
)
____exports.modifier_evo_elasmyr_bash = modifier_evo_elasmyr_bash
return ____exports
