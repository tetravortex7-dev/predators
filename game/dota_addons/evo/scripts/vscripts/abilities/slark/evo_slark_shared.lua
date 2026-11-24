local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["10"] = 5,["11"] = 6,["12"] = 7,["13"] = 9,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 24,["30"] = 1});
local ____exports = {}
function ____exports.grantSlarkAgiEssenceStack(self, caster, target, stacks)
    local eAb = caster:FindAbilityByName("evo_slark_agi_e")
    if not eAb or eAb:IsNull() or eAb:GetLevel() <= 0 then
        return
    end
    local isHero = target:IsHero()
    local dur = isHero and eAb:GetSpecialValueFor("hero_duration") or eAb:GetSpecialValueFor("creep_duration")
    local agiPerStack = isHero and eAb:GetSpecialValueFor("agi_per_stack") or 1
    local existing = caster:FindModifierByName("modifier_evo_slark_agi_essence_buff")
    local cur = existing and existing:GetStackCount() or 0
    local maxTotal = isHero and 120 or math.max(cur, 18)
    local next = math.min(maxTotal, cur + stacks * agiPerStack)
    local buff = caster:AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_buff", {duration = dur})
    if buff ~= nil then
        buff:SetStackCount(next)
    end
    if isHero then
        local debuffPerStack = eAb:GetSpecialValueFor("enemy_stat_loss")
        local exDebuff = target:FindModifierByName("modifier_evo_slark_agi_essence_debuff")
        local curDebuff = exDebuff and exDebuff:GetStackCount() or 0
        local debuff = target:AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_debuff", {duration = dur})
        if debuff ~= nil then
            debuff:SetStackCount(math.min(40, curDebuff + stacks * debuffPerStack))
        end
    end
end
return ____exports
