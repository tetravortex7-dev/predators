local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 9,["11"] = 9,["13"] = 10,["14"] = 10,["16"] = 11,["17"] = 11,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 13,["24"] = 4,["25"] = 16,["26"] = 17,["27"] = 18,["29"] = 20,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["35"] = 23,["36"] = 24,["38"] = 26,["39"] = 27,["40"] = 27,["42"] = 28,["43"] = 28,["45"] = 29,["46"] = 29,["48"] = 30,["49"] = 16,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 33,["55"] = 39,["56"] = 43,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 44,["61"] = 45,["62"] = 39,["63"] = 48,["64"] = 53,["65"] = 54,["66"] = 54,["67"] = 54,["68"] = 54,["70"] = 56,["71"] = 57,["73"] = 59,["74"] = 48,["75"] = 62,["76"] = 67,["77"] = 67,["79"] = 68,["80"] = 68,["81"] = 68,["82"] = 68,["83"] = 62,["84"] = 71,["85"] = 75,["86"] = 75,["87"] = 75,["89"] = 75,["90"] = 76,["92"] = 78,["93"] = 78,["94"] = 78,["96"] = 78,["97"] = 79,["99"] = 81,["100"] = 82,["102"] = 85,["103"] = 86,["104"] = 88,["105"] = 89,["106"] = 90,["107"] = 91,["108"] = 92,["109"] = 93,["110"] = 94,["112"] = 96,["113"] = 100,["114"] = 104,["115"] = 105,["116"] = 106,["117"] = 111,["118"] = 116,["121"] = 120,["122"] = 121,["123"] = 122,["124"] = 123,["125"] = 124,["127"] = 126,["128"] = 127,["129"] = 132,["130"] = 137,["134"] = 142,["135"] = 143,["137"] = 146,["138"] = 71});
local ____exports = {}
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
function ____exports.resolveLevelValue(self, value, level, fallback)
    if value == nil then
        return fallback
    end
    if type(value) == "number" then
        return value
    end
    if #value == 0 then
        return fallback
    end
    local idx = math.max(
        0,
        math.min(#value - 1, level - 1)
    )
    return value[idx + 1] or fallback
end
function ____exports.readUnitStat(self, unit, stat)
    if stat == "MAX_HP" then
        return unit:GetMaxHealth()
    end
    if stat == "MISSING_HP" then
        return math.max(
            0,
            unit:GetMaxHealth() - unit:GetHealth()
        )
    end
    if not unit:IsHero() then
        return 0
    end
    local hero = unit
    if stat == "STR" then
        return hero:GetStrength()
    end
    if stat == "AGI" then
        return hero:GetAgility()
    end
    if stat == "INT" then
        return hero:GetIntellect(false)
    end
    return hero:GetStrength() + hero:GetAgility() + hero:GetIntellect(false)
end
function ____exports.computePhysicalArmorFactor(self, armor)
    local denom = 1 + 0.06 * math.abs(armor)
    local reduction = 0.06 * armor / denom
    return math.max(0, 1 - reduction)
end
function ____exports.computeMagicalResistFactor(self, victim, inflictor)
    local magArmor = victim:Script_GetMagicalArmorValue(inflictor or victim)
    local clamped = math.min(
        1,
        math.max(-2, magArmor)
    )
    return math.max(0, 1 - clamped)
end
function ____exports.computeResistanceMultiplier(self, victim, damageType, inflictor)
    if damageType == 1 then
        return ____exports.computePhysicalArmorFactor(
            nil,
            victim:GetPhysicalArmorValue(false)
        )
    end
    if damageType == 2 then
        return ____exports.computeMagicalResistFactor(nil, victim, inflictor)
    end
    return 1
end
function ____exports.computeSpellAmpMultiplier(self, attacker, inflictor, applySpellAmp)
    if not inflictor or not applySpellAmp then
        return 1
    end
    return math.max(
        0,
        1 + attacker:GetSpellAmplification(false)
    )
end
function ____exports.computeModifiedDamage(self, ctx, rule)
    local ____rule_ignoreIfBaseDamageZero_0 = rule.ignoreIfBaseDamageZero
    if ____rule_ignoreIfBaseDamageZero_0 == nil then
        ____rule_ignoreIfBaseDamageZero_0 = true
    end
    if ____rule_ignoreIfBaseDamageZero_0 and ctx.damage <= 0 then
        return ctx.damage
    end
    local ____rule_ignoreIllusions_1 = rule.ignoreIllusions
    if ____rule_ignoreIllusions_1 == nil then
        ____rule_ignoreIllusions_1 = true
    end
    if ____rule_ignoreIllusions_1 and ctx.attacker:IsIllusion() then
        return ctx.damage
    end
    if rule.allowedDamageTypes and not __TS__ArrayIncludes(rule.allowedDamageTypes, ctx.damageType) then
        return ctx.damage
    end
    local nextDamage = ctx.damage
    local statVal = rule.stat and ____exports.readUnitStat(nil, ctx.attacker, rule.stat) or 0
    if rule.mode == "STAT_PCT_MULT" then
        local pct = ____exports.resolveLevelValue(nil, rule.pctPerPoint, ctx.level, 0)
        local factor = math.max(0, 1 + statVal * pct / 100)
        nextDamage = nextDamage * factor
    elseif rule.mode == "MULTIPLIER" then
        local mult = ____exports.resolveLevelValue(nil, rule.multiplier, ctx.level, 1)
        nextDamage = nextDamage * math.max(0, mult)
    else
        local flat = (rule.mode == "FLAT_BONUS" or rule.mode == "HYBRID_STAT") and ____exports.resolveLevelValue(nil, rule.flatBonus, ctx.level, 0) or 0
        local ratio = (rule.mode == "FLAT_STAT" or rule.mode == "HYBRID_STAT") and ____exports.resolveLevelValue(nil, rule.statRatio, ctx.level, 0) or 0
        local rawBonus = flat + statVal * ratio
        if rawBonus ~= 0 then
            local spellAmp = ____exports.computeSpellAmpMultiplier(nil, ctx.attacker, ctx.inflictor, rule.applySpellAmp ~= false)
            local resistFactor = ____exports.computeResistanceMultiplier(nil, ctx.victim, ctx.damageType, ctx.inflictor)
            nextDamage = nextDamage + rawBonus * spellAmp * resistFactor
        end
    end
    if rule.customModify then
        local custom = rule:customModify(__TS__ObjectAssign({}, ctx, {damage = nextDamage}))
        if custom then
            if custom.multiplier ~= nil then
                nextDamage = nextDamage * math.max(0, custom.multiplier)
            end
            if custom.rawBonus ~= nil and custom.rawBonus ~= 0 then
                local spellAmp = ____exports.computeSpellAmpMultiplier(nil, ctx.attacker, ctx.inflictor, rule.applySpellAmp ~= false)
                local resistFactor = ____exports.computeResistanceMultiplier(nil, ctx.victim, ctx.damageType, ctx.inflictor)
                nextDamage = nextDamage + custom.rawBonus * spellAmp * resistFactor
            end
        end
    end
    if rule.creepMultiplier ~= nil and isEvoCreepUnit(nil, ctx.victim) then
        nextDamage = nextDamage * math.max(0, rule.creepMultiplier)
    end
    return math.max(0, nextDamage)
end
return ____exports
