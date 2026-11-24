local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 4,["12"] = 5,["13"] = 6,["14"] = 3,["15"] = 9,["16"] = 10,["17"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["31"] = 9,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 32,["40"] = 33,["41"] = 34,["42"] = 36,["43"] = 37,["44"] = 42,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 56,["57"] = 57,["59"] = 58,["60"] = 58,["62"] = 59,["63"] = 60,["64"] = 61,["65"] = 62,["66"] = 63,["68"] = 65,["69"] = 65,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 74,["77"] = 75,["78"] = 76,["79"] = 77,["81"] = 80,["82"] = 81,["84"] = 84,["85"] = 85,["86"] = 86,["87"] = 87,["88"] = 88,["89"] = 89,["90"] = 90,["91"] = 92,["92"] = 92,["93"] = 92,["94"] = 91,["95"] = 98,["96"] = 98,["97"] = 98,["98"] = 98,["99"] = 98,["100"] = 103,["101"] = 104,["107"] = 25});
local ____exports = {}
local pushCooldownByEnt = __TS__New(Map)
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
                goto __continue8
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
        ::__continue8::
    end
end
return ____exports
