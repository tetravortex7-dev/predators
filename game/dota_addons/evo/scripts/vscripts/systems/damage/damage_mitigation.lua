local ____lualib = require("lualib_bundle")
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 8,["9"] = 8,["11"] = 9,["12"] = 9,["14"] = 10,["15"] = 10,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 12,["22"] = 3,["23"] = 15,["24"] = 16,["25"] = 17,["27"] = 19,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["33"] = 22,["34"] = 23,["36"] = 25,["37"] = 26,["38"] = 26,["40"] = 27,["41"] = 27,["43"] = 28,["44"] = 28,["46"] = 29,["47"] = 15,["48"] = 32,["49"] = 33,["50"] = 34,["51"] = 35,["52"] = 32,["53"] = 38,["54"] = 42,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 44,["60"] = 38,["61"] = 47,["62"] = 52,["63"] = 53,["64"] = 53,["65"] = 53,["66"] = 53,["68"] = 55,["69"] = 56,["71"] = 58,["72"] = 47,["73"] = 61,["74"] = 66,["75"] = 66,["77"] = 67,["78"] = 67,["79"] = 67,["80"] = 67,["81"] = 61,["82"] = 70,["83"] = 74,["84"] = 74,["85"] = 74,["87"] = 74,["88"] = 75,["90"] = 77,["91"] = 77,["92"] = 77,["94"] = 77,["95"] = 78,["97"] = 80,["98"] = 81,["100"] = 84,["101"] = 85,["102"] = 87,["103"] = 88,["104"] = 89,["105"] = 90,["106"] = 91,["107"] = 92,["108"] = 93,["110"] = 95,["111"] = 99,["112"] = 103,["113"] = 104,["114"] = 105,["115"] = 110,["116"] = 115,["119"] = 119,["120"] = 120,["121"] = 121,["122"] = 122,["123"] = 123,["125"] = 125,["126"] = 126,["127"] = 131,["128"] = 136,["132"] = 141,["133"] = 142,["135"] = 145,["136"] = 70});
local ____exports = {}
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
    if rule.creepMultiplier ~= nil and ctx.victim:IsCreep() then
        nextDamage = nextDamage * math.max(0, rule.creepMultiplier)
    end
    return math.max(0, nextDamage)
end
return ____exports
