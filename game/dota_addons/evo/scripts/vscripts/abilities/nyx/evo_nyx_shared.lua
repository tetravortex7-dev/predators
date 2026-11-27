local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 8,["7"] = 9,["8"] = 10,["9"] = 8,["10"] = 13,["11"] = 14,["12"] = 14,["14"] = 15,["15"] = 16,["16"] = 17,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["23"] = 22,["24"] = 27,["26"] = 30,["27"] = 35,["29"] = 38,["30"] = 43,["32"] = 45,["33"] = 13,["34"] = 48,["35"] = 49,["36"] = 49,["38"] = 50,["39"] = 51,["40"] = 51,["42"] = 52,["43"] = 52,["45"] = 53,["46"] = 48,["47"] = 56,["48"] = 57,["49"] = 58,["51"] = 60,["52"] = 61,["53"] = 62,["55"] = 64,["56"] = 65,["58"] = 67,["59"] = 68,["61"] = 70,["62"] = 71,["64"] = 73,["65"] = 56,["66"] = 76,["67"] = 77,["68"] = 76,["69"] = 80,["70"] = 81,["71"] = 80,["72"] = 84,["73"] = 85,["74"] = 84,["75"] = 88,["76"] = 89,["77"] = 89,["79"] = 90,["80"] = 91,["81"] = 91,["82"] = 91,["83"] = 91,["84"] = 91,["85"] = 88,["86"] = 94,["87"] = 95,["88"] = 95,["90"] = 96,["91"] = 97,["92"] = 94,["93"] = 100,["94"] = 101,["95"] = 100,["96"] = 104,["97"] = 105,["98"] = 106,["99"] = 104,["100"] = 109,["101"] = 110,["102"] = 110,["103"] = 110,["104"] = 110,["105"] = 110,["106"] = 110,["107"] = 110,["108"] = 110,["109"] = 110,["110"] = 110,["111"] = 110,["112"] = 110,["113"] = 122,["114"] = 123,["115"] = 123,["118"] = 125,["119"] = 109,["120"] = 128,["121"] = 129,["122"] = 130,["123"] = 130,["125"] = 131,["126"] = 132,["127"] = 133,["128"] = 134,["129"] = 134,["130"] = 134,["131"] = 134,["132"] = 135,["133"] = 136,["134"] = 128,["135"] = 139,["136"] = 145,["137"] = 146,["140"] = 147,["141"] = 150,["142"] = 151,["143"] = 151,["144"] = 151,["145"] = 151,["146"] = 152,["147"] = 153,["150"] = 139,["151"] = 158,["152"] = 164,["153"] = 165,["156"] = 166,["157"] = 169,["158"] = 170,["159"] = 170,["160"] = 170,["161"] = 170,["162"] = 171,["163"] = 172,["166"] = 158,["167"] = 177,["168"] = 181,["169"] = 181,["171"] = 183,["172"] = 184,["173"] = 184,["174"] = 184,["175"] = 184,["176"] = 184,["177"] = 184,["178"] = 184,["179"] = 184,["180"] = 184,["181"] = 184,["182"] = 184,["183"] = 184,["184"] = 184,["185"] = 184,["186"] = 177,["187"] = 197,["188"] = 202,["189"] = 202,["191"] = 203,["192"] = 203,["194"] = 205,["195"] = 205,["196"] = 205,["197"] = 205,["198"] = 205,["199"] = 205,["200"] = 205,["201"] = 205,["202"] = 205,["203"] = 205,["204"] = 197});
local ____exports = {}
local function hasClientSafeAbility(self, unit, name)
    local ab = unit:FindAbilityByName(name)
    return ab ~= nil and not ab:IsNull()
end
function ____exports.getNyxTier(self, unit)
    if not unit or unit:IsNull() then
        return 1
    end
    if IsServer() then
        local tierMod = unit:FindModifierByName("modifier_evo_hero_tier")
        if tierMod then
            return math.max(
                1,
                tierMod:GetStackCount()
            )
        end
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_scarab_r") or hasClientSafeAbility(nil, unit, "evo_nyx_mantis_r") or hasClientSafeAbility(nil, unit, "evo_nyx_archon_r") or hasClientSafeAbility(nil, unit, "evo_nyx_cicada_r") then
        return 4
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_cicada_chitin_t3") or hasClientSafeAbility(nil, unit, "evo_nyx_scarab_chitin") or hasClientSafeAbility(nil, unit, "evo_nyx_mantis_chitin") or hasClientSafeAbility(nil, unit, "evo_nyx_archon_chitin") then
        return 3
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_scarab_q") or hasClientSafeAbility(nil, unit, "evo_nyx_mantis_q") or hasClientSafeAbility(nil, unit, "evo_nyx_archon_w") or hasClientSafeAbility(nil, unit, "evo_nyx_cicada_q") then
        return 2
    end
    return 1
end
function ____exports.getNyxBranchMaxLevel(self, unit)
    if not unit or unit:IsNull() then
        return 5
    end
    local tier = ____exports.getNyxTier(nil, unit)
    if tier <= 1 then
        return 3
    end
    if tier == 2 then
        return 4
    end
    return 5
end
function ____exports.detectNyxBranchAndTier(self, unit)
    if not unit or unit:IsNull() then
        return {branch = "T1", tier = 1}
    end
    local tier = ____exports.getNyxTier(nil, unit)
    if hasClientSafeAbility(nil, unit, "evo_nyx_scarab_q") then
        return {branch = "SCARAB", tier = tier}
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_mantis_q") then
        return {branch = "MANTIS", tier = tier}
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_archon_w") then
        return {branch = "ARCHON", tier = tier}
    end
    if hasClientSafeAbility(nil, unit, "evo_nyx_cicada_q") then
        return {branch = "CICADA", tier = tier}
    end
    return {branch = "T1", tier = tier}
end
function ____exports.getNyxStr(self, unit)
    return unit:IsRealHero() and unit:GetStrength() or 0
end
function ____exports.getNyxAgi(self, unit)
    return unit:IsRealHero() and unit:GetAgility() or 0
end
function ____exports.getNyxInt(self, unit)
    return unit:IsRealHero() and unit:GetIntellect(false) or 0
end
function ____exports.getNyxHighestAttr(self, unit)
    if not unit:IsRealHero() then
        return 0
    end
    local hero = unit
    return math.max(
        hero:GetStrength(),
        hero:GetAgility(),
        hero:GetIntellect(false)
    )
end
function ____exports.getNyxAllAttrSum(self, unit)
    if not unit:IsRealHero() then
        return 0
    end
    local hero = unit
    return hero:GetStrength() + hero:GetAgility() + hero:GetIntellect(false)
end
function ____exports.isNyxBurrowed(self, unit)
    return unit:HasModifier("modifier_evo_nyx_scarab_w")
end
function ____exports.getLivingChitinStacks(self, unit)
    local mod = unit:FindModifierByName("modifier_evo_nyx_living_chitin")
    return mod and mod:GetStackCount() or 0
end
function ____exports.findNyxInnateAbility(self, unit)
    for ____, name in ipairs({
        "evo_nyx_scarab_chitin_t4",
        "evo_nyx_scarab_chitin",
        "evo_nyx_mantis_chitin_t4",
        "evo_nyx_mantis_chitin",
        "evo_nyx_archon_chitin_t4",
        "evo_nyx_archon_chitin",
        "evo_nyx_cicada_chitin_t4",
        "evo_nyx_cicada_chitin_t3",
        "evo_nyx_cicada_chitin",
        "evo_nyx_living_chitin"
    }) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.addLivingChitinStacks(self, unit, delta)
    local mod = unit:FindModifierByName("modifier_evo_nyx_living_chitin")
    if not mod then
        return 0
    end
    local ability = mod:GetAbility() or ____exports.findNyxInnateAbility(nil, unit)
    local maxStacks = ability and not ability:IsNull() and ability:GetSpecialValueFor("max_stacks") or 3
    local prev = mod:GetStackCount()
    local next = math.max(
        0,
        math.min(maxStacks, prev + delta)
    )
    mod:SetStackCount(next)
    return next - prev
end
function ____exports.applyPsiResonance(self, caster, target, ability, tierLevel)
    local srcAbility = ability or ____exports.findNyxInnateAbility(nil, caster)
    if not srcAbility or srcAbility:IsNull() then
        return
    end
    local mod = target:AddNewModifier(caster, srcAbility, "modifier_evo_nyx_psi_resonance", {duration = 4.5})
    if mod ~= nil then
        local clamped = math.max(
            1,
            math.min(3, tierLevel)
        )
        if clamped >= mod:GetStackCount() then
            mod:SetStackCount(clamped)
        end
    end
end
function ____exports.applyAcousticDisruption(self, caster, target, ability, tierLevel)
    local srcAbility = ability or ____exports.findNyxInnateAbility(nil, caster)
    if not srcAbility or srcAbility:IsNull() then
        return
    end
    local mod = target:AddNewModifier(caster, srcAbility, "modifier_evo_nyx_acoustic_disruption", {duration = 4.5})
    if mod ~= nil then
        local clamped = math.max(
            1,
            math.min(3, tierLevel)
        )
        if clamped >= mod:GetStackCount() then
            mod:SetStackCount(clamped)
        end
    end
end
function ____exports.findEnemiesInRadius(self, caster, origin, radius, pierceSpellImmunity)
    if pierceSpellImmunity == nil then
        pierceSpellImmunity = false
    end
    local flags = pierceSpellImmunity and 16 or 0
    return __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            origin,
            nil,
            radius,
            2,
            1 + 18,
            flags,
            0,
            false
        ),
        function(____, e) return e and not e:IsNull() and IsValidEntity(e) and e:IsAlive() end
    )
end
function ____exports.knockbackUnitFrom(self, caster, target, center, distance, duration, height)
    if duration == nil then
        duration = 0.3
    end
    if height == nil then
        height = 60
    end
    target:AddNewModifier(caster, nil, "modifier_knockback", {
        center_x = center.x,
        center_y = center.y,
        center_z = center.z,
        duration = duration,
        knockback_duration = duration,
        knockback_distance = distance,
        knockback_height = height,
        should_stun = 0
    })
end
return ____exports
