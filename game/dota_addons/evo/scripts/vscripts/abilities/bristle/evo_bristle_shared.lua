local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 4,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 13,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["23"] = 4,["24"] = 21,["25"] = 22,["26"] = 22,["28"] = 23,["29"] = 24,["30"] = 21,["31"] = 27,["32"] = 28,["33"] = 29,["36"] = 30,["37"] = 31,["38"] = 32,["39"] = 33,["40"] = 34,["41"] = 35,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 39,["47"] = 27,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 52,["58"] = 54,["59"] = 55,["60"] = 60,["61"] = 62,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 74,["73"] = 75,["75"] = 76,["76"] = 76,["78"] = 77,["79"] = 78,["80"] = 79,["81"] = 80,["82"] = 81,["84"] = 83,["85"] = 83,["86"] = 83,["87"] = 83,["88"] = 83,["89"] = 83,["90"] = 83,["91"] = 83,["92"] = 92,["93"] = 93,["94"] = 94,["95"] = 95,["97"] = 98,["98"] = 99,["100"] = 102,["101"] = 103,["102"] = 104,["103"] = 105,["104"] = 106,["105"] = 107,["106"] = 108,["107"] = 110,["108"] = 110,["109"] = 110,["110"] = 109,["111"] = 116,["112"] = 116,["113"] = 116,["114"] = 116,["115"] = 116,["116"] = 121,["117"] = 122,["123"] = 43});
local ____exports = {}
local pushCooldownByEnt = __TS__New(Map)
____exports.activeReactorZones = __TS__New(Set)
function ____exports.applyReactorCatalystStacks(self, caster, target, ability, count)
    local eAb = caster:FindAbilityByName("evo_bristle_react_e")
    local lvl = eAb and not eAb:IsNull() and eAb:GetLevel() or ability:GetLevel()
    local maxStacks = lvl >= 3 and 6 or (lvl >= 2 and 5 or 4)
    local ex = target:FindModifierByName("modifier_evo_bristle_react_catalyst")
    local next = math.min(
        maxStacks,
        (ex and ex:GetStackCount() or 0) + count
    )
    local mod = target:AddNewModifier(caster, ability, "modifier_evo_bristle_react_catalyst", {duration = 5})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
function ____exports.getAllAttributesSum(self, unit)
    if not unit:IsRealHero() then
        return 0
    end
    local hero = unit
    return hero:GetStrength() + hero:GetAgility() + hero:GetIntellect(false)
end
function ____exports.grantBristleAdrenalineStacks(self, hero, count)
    local ab = hero:FindAbilityByName("evo_bristle_adrenaline")
    if not ab or ab:IsNull() then
        return
    end
    local dreadE = hero:FindAbilityByName("evo_bristle_dread_e")
    local baseMax = ab:GetSpecialValueFor("max_stacks")
    local maxStacks = dreadE and not dreadE:IsNull() and dreadE:GetLevel() >= 2 and 7 or baseMax
    local duration = ab:GetSpecialValueFor("stack_duration")
    local existing = hero:FindModifierByName("modifier_evo_bristle_adrenaline_stack")
    local current = existing and existing:GetStackCount() or 0
    local next = math.min(maxStacks, current + count)
    local mod = hero:AddNewModifier(hero, ab, "modifier_evo_bristle_adrenaline_stack", {duration = duration})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
function ____exports.fireDreadnoughtQuillFan(self, caster, ability)
    local level = ability:GetLevel()
    local radius = ability:GetSpecialValueFor("radius")
    local baseDmg = ability:GetSpecialValueFor("base_damage")
    local strPct = ability:GetSpecialValueFor("str_pct") / 100
    local perStackBonus = ability:GetSpecialValueFor("stack_damage")
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local rawBase = baseDmg + str * strPct
    local now = GameRules:GetDOTATime(false, false)
    caster:EmitSound("Hero_Bristleback.QuillSpray.Cast")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_bristleback/bristleback_quill_spray.vpcf", 1, caster)
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
        nil,
        radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    local casterOrigin = caster:GetAbsOrigin()
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue10
            end
            local ex = enemy:FindModifierByName("modifier_evo_bristle_dread_w_quill")
            local curStacks = ex and ex:GetStackCount() or 0
            local dmg = rawBase + curStacks * perStackBonus
            if enemy:IsCreep() then
                dmg = dmg * 1.3
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ability,
                damage = dmg,
                damage_type = 1,
                damage_flags = level >= 2 and 524288 or 0
            })
            local nextStacks = math.min(maxStacks, curStacks + 1)
            local mod = enemy:AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_quill", {duration = 5})
            if mod ~= nil then
                mod:SetStackCount(nextStacks)
            end
            if level >= 2 and nextStacks >= 3 then
                enemy:AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_dmg", {duration = 3})
            end
            if level >= 3 then
                local dist = (enemy:GetAbsOrigin() - casterOrigin):Length2D()
                local eid = enemy:entindex()
                local lastPush = pushCooldownByEnt:get(eid) or -999
                if dist <= 225 and now - lastPush >= 4 then
                    pushCooldownByEnt:set(eid, now)
                    local pushDir = dist > 1 and Vector(
                        enemy:GetAbsOrigin().x - casterOrigin.x,
                        enemy:GetAbsOrigin().y - casterOrigin.y,
                        0
                    ):Normalized() or caster:GetForwardVector()
                    local targetPos = Vector(
                        enemy:GetAbsOrigin().x + pushDir.x * 110,
                        enemy:GetAbsOrigin().y + pushDir.y * 110,
                        enemy:GetAbsOrigin().z
                    )
                    FindClearSpaceForUnit(enemy, targetPos, true)
                    enemy:Interrupt()
                end
            end
        end
        ::__continue10::
    end
end
return ____exports
