local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 8,["7"] = 9,["8"] = 10,["9"] = 8,["10"] = 13,["11"] = 14,["12"] = 14,["14"] = 15,["15"] = 16,["16"] = 17,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["23"] = 22,["24"] = 27,["26"] = 29,["27"] = 30,["28"] = 31,["29"] = 31,["30"] = 31,["31"] = 31,["32"] = 31,["33"] = 31,["34"] = 31,["36"] = 33,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["48"] = 44,["49"] = 49,["51"] = 51,["52"] = 13,["53"] = 54,["54"] = 55,["55"] = 55,["57"] = 56,["58"] = 57,["59"] = 57,["61"] = 58,["62"] = 58,["64"] = 59,["65"] = 54,["66"] = 62,["67"] = 63,["68"] = 64,["70"] = 66,["71"] = 67,["72"] = 68,["74"] = 70,["75"] = 71,["77"] = 73,["78"] = 74,["80"] = 76,["81"] = 77,["83"] = 79,["84"] = 62,["85"] = 82,["86"] = 83,["87"] = 82,["88"] = 86,["89"] = 87,["90"] = 86,["91"] = 90,["92"] = 91,["93"] = 90,["94"] = 94,["95"] = 95,["96"] = 95,["98"] = 96,["99"] = 97,["100"] = 97,["101"] = 97,["102"] = 97,["103"] = 97,["104"] = 94,["105"] = 100,["106"] = 101,["107"] = 101,["109"] = 102,["110"] = 103,["111"] = 100,["112"] = 106,["113"] = 107,["114"] = 106,["115"] = 110,["116"] = 111,["117"] = 112,["118"] = 110,["119"] = 115,["120"] = 116,["121"] = 116,["122"] = 116,["123"] = 116,["124"] = 116,["125"] = 116,["126"] = 116,["127"] = 123,["128"] = 124,["129"] = 124,["132"] = 126,["133"] = 115,["134"] = 129,["135"] = 130,["136"] = 131,["137"] = 131,["139"] = 132,["140"] = 133,["141"] = 134,["142"] = 135,["143"] = 135,["144"] = 135,["145"] = 135,["146"] = 136,["147"] = 137,["148"] = 129,["149"] = 140,["150"] = 146,["151"] = 147,["154"] = 148,["155"] = 151,["156"] = 152,["157"] = 152,["158"] = 152,["159"] = 152,["160"] = 153,["161"] = 154,["164"] = 140,["165"] = 159,["166"] = 165,["167"] = 166,["170"] = 167,["171"] = 170,["172"] = 171,["173"] = 171,["174"] = 171,["175"] = 171,["176"] = 172,["177"] = 173,["180"] = 159,["181"] = 178,["182"] = 182,["183"] = 182,["185"] = 184,["186"] = 185,["187"] = 185,["188"] = 185,["189"] = 185,["190"] = 185,["191"] = 185,["192"] = 185,["193"] = 185,["194"] = 185,["195"] = 185,["196"] = 185,["197"] = 185,["198"] = 185,["199"] = 185,["200"] = 178,["201"] = 198,["202"] = 203,["203"] = 203,["205"] = 204,["206"] = 204,["208"] = 206,["209"] = 206,["210"] = 206,["211"] = 206,["212"] = 206,["213"] = 206,["214"] = 206,["215"] = 206,["216"] = 206,["217"] = 206,["218"] = 198});
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
    local cicadaChitin = unit:FindAbilityByName("evo_nyx_cicada_chitin")
    if cicadaChitin and not cicadaChitin:IsNull() then
        return math.min(
            4,
            math.max(
                2,
                cicadaChitin:GetLevel() + 1
            )
        )
    end
    for ____, branchChitin in ipairs({"evo_nyx_scarab_chitin", "evo_nyx_mantis_chitin", "evo_nyx_archon_chitin"}) do
        local ab = unit:FindAbilityByName(branchChitin)
        if ab and not ab:IsNull() then
            return math.min(
                4,
                math.max(
                    3,
                    ab:GetLevel() + 2
                )
            )
        end
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
        "evo_nyx_scarab_chitin",
        "evo_nyx_mantis_chitin",
        "evo_nyx_archon_chitin",
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
