local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 10,["15"] = 15,["16"] = 16,["17"] = 16,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["28"] = 24,["29"] = 28,["31"] = 31,["32"] = 34,["34"] = 37,["35"] = 41,["37"] = 43,["38"] = 15,["39"] = 46,["40"] = 47,["41"] = 48,["42"] = 48,["44"] = 49,["45"] = 49,["47"] = 50,["48"] = 46,["49"] = 53,["50"] = 54,["51"] = 55,["53"] = 57,["54"] = 58,["55"] = 59,["57"] = 61,["58"] = 62,["60"] = 64,["61"] = 65,["63"] = 67,["64"] = 53,["65"] = 70,["66"] = 71,["67"] = 70,["68"] = 74,["69"] = 75,["70"] = 74,["71"] = 78,["72"] = 79,["73"] = 78,["74"] = 82,["75"] = 83,["76"] = 83,["78"] = 84,["79"] = 85,["80"] = 85,["81"] = 85,["82"] = 85,["83"] = 85,["84"] = 82,["85"] = 88,["86"] = 93,["87"] = 93,["88"] = 93,["89"] = 93,["90"] = 93,["91"] = 93,["92"] = 93,["93"] = 93,["94"] = 93,["95"] = 93,["96"] = 93,["97"] = 88,["98"] = 106,["99"] = 108,["100"] = 109,["101"] = 110,["102"] = 111,["103"] = 111,["104"] = 111,["105"] = 111,["106"] = 114,["107"] = 115,["108"] = 108,["109"] = 118,["110"] = 119,["111"] = 120,["112"] = 121,["113"] = 122,["114"] = 123,["117"] = 126,["118"] = 127,["119"] = 127,["120"] = 127,["121"] = 127,["122"] = 118,["123"] = 130,["124"] = 131,["125"] = 132,["126"] = 133,["127"] = 134,["128"] = 135,["129"] = 136,["130"] = 137,["131"] = 138,["134"] = 141,["135"] = 130,["136"] = 144,["137"] = 154,["140"] = 155,["141"] = 156,["143"] = 157,["144"] = 157,["146"] = 158,["147"] = 159,["148"] = 159,["150"] = 160,["151"] = 162,["152"] = 163,["153"] = 164,["154"] = 165,["155"] = 165,["156"] = 165,["157"] = 165,["159"] = 167,["160"] = 168,["161"] = 168,["163"] = 170,["164"] = 170,["165"] = 170,["166"] = 170,["167"] = 170,["168"] = 170,["169"] = 170,["170"] = 170,["174"] = 144,["175"] = 181,["176"] = 182,["177"] = 183,["178"] = 184,["179"] = 185,["180"] = 186,["181"] = 186,["182"] = 186,["183"] = 187,["184"] = 187,["185"] = 186,["186"] = 188,["187"] = 188,["188"] = 188,["189"] = 181,["190"] = 192,["191"] = 193,["192"] = 194,["193"] = 194,["195"] = 195,["196"] = 192,["197"] = 198,["198"] = 199,["201"] = 200,["202"] = 201,["205"] = 202,["206"] = 203,["209"] = 204,["210"] = 204,["211"] = 204,["212"] = 204,["213"] = 205,["214"] = 206,["216"] = 198,["217"] = 210,["218"] = 211,["221"] = 212,["222"] = 213,["225"] = 214,["226"] = 215,["227"] = 210,["228"] = 218,["229"] = 226,["230"] = 227,["231"] = 227,["232"] = 227,["233"] = 227,["234"] = 227,["235"] = 227,["236"] = 227,["237"] = 234,["238"] = 218,["239"] = 237,["240"] = 243,["241"] = 243,["243"] = 244,["244"] = 244,["246"] = 245,["247"] = 245,["249"] = 247,["250"] = 248,["251"] = 248,["253"] = 249,["254"] = 249,["256"] = 251,["257"] = 252,["258"] = 252,["260"] = 254,["261"] = 255,["262"] = 256,["263"] = 257,["264"] = 258,["265"] = 258,["267"] = 260,["268"] = 260,["269"] = 260,["270"] = 260,["271"] = 260,["272"] = 260,["273"] = 260,["274"] = 260,["275"] = 269,["276"] = 270,["277"] = 271,["278"] = 272,["280"] = 276,["281"] = 277,["282"] = 278,["283"] = 279,["286"] = 282,["287"] = 237});
local ____exports = {}
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local function hasAbilitySafe(self, unit, name)
    local ab = unit:FindAbilityByName(name)
    return ab ~= nil and not ab:IsNull()
end
function ____exports.getSpectreTier(self, unit)
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
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_r") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_r") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_r") then
        return 4
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_dispersion_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_inversion_t3") then
        return 3
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_w") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_q") then
        return 2
    end
    return 1
end
function ____exports.getSpectreBranchMaxLevel(self, unit)
    local tier = ____exports.getSpectreTier(nil, unit)
    if tier <= 1 then
        return 3
    end
    if tier == 2 then
        return 4
    end
    return 5
end
function ____exports.detectSpectreBranchAndTier(self, unit)
    if not unit or unit:IsNull() then
        return {branch = "T1", tier = 1}
    end
    local tier = ____exports.getSpectreTier(nil, unit)
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_w") then
        return {branch = "PHANTOM", tier = tier}
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_bastion_q") then
        return {branch = "BASTION", tier = tier}
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_mirror_q") then
        return {branch = "MIRROR", tier = tier}
    end
    return {branch = "T1", tier = tier}
end
function ____exports.getSpectreStr(self, unit)
    return unit:IsRealHero() and unit:GetStrength() or 0
end
function ____exports.getSpectreAgi(self, unit)
    return unit:IsRealHero() and unit:GetAgility() or 0
end
function ____exports.getSpectreInt(self, unit)
    return unit:IsRealHero() and unit:GetIntellect(false) or 0
end
function ____exports.getSpectreHighestAttr(self, unit)
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
function ____exports.findSpectreEnemies(self, caster, origin, radius)
    return FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        radius,
        2,
        1 + 18,
        0,
        1,
        false
    )
end
local portalsByOwner = __TS__New(Map)
function ____exports.cleanupSpectrePortals(self, owner)
    local idx = owner:GetEntityIndex()
    local list = portalsByOwner:get(idx) or ({})
    local alive = __TS__ArrayFilter(
        list,
        function(____, u) return u and not u:IsNull() and IsValidEntity(u) and u:HasModifier("modifier_evo_spectre_portal_unit") end
    )
    portalsByOwner:set(idx, alive)
    return alive
end
function ____exports.registerSpectrePortal(self, owner, portal, maxCount)
    local alive = ____exports.cleanupSpectrePortals(nil, owner)
    while #alive >= maxCount do
        local oldest = table.remove(alive, 1)
        if oldest and not oldest:IsNull() and IsValidEntity(oldest) then
            UTIL_Remove(oldest)
        end
    end
    alive[#alive + 1] = portal
    portalsByOwner:set(
        owner:GetEntityIndex(),
        alive
    )
end
function ____exports.findNearestSpectrePortal(self, owner, point)
    local alive = ____exports.cleanupSpectrePortals(nil, owner)
    local best
    local bestDist = 1000000000000
    for ____, portal in ipairs(alive) do
        local dist = (portal:GetAbsOrigin() - point):Length2D()
        if dist < bestDist then
            bestDist = dist
            best = portal
        end
    end
    return best
end
function ____exports.applyDispersionAroundOrigin(self, victim, ability, origin, blockedDamage, damageType, minRadius, maxRadius, hitTracker)
    if blockedDamage <= 0.5 then
        return
    end
    local enemies = ____exports.findSpectreEnemies(nil, victim, origin, maxRadius)
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() or enemy == victim then
                goto __continue35
            end
            local eIdx = enemy:GetEntityIndex()
            if hitTracker:has(eIdx) then
                goto __continue35
            end
            hitTracker:add(eIdx)
            local dist = (enemy:GetAbsOrigin() - origin):Length2D()
            local factor = 1
            if dist > minRadius then
                factor = math.max(
                    0,
                    1 - (dist - minRadius) / math.max(1, maxRadius - minRadius)
                )
            end
            local reflected = blockedDamage * factor
            if reflected <= 0.5 then
                goto __continue35
            end
            ApplyDamage({
                victim = enemy,
                attacker = victim,
                ability = ability,
                damage = reflected,
                damage_type = damageType,
                damage_flags = 16 + 1024
            })
        end
        ::__continue35::
    end
end
function ____exports.getBastionTotalShields(self, unit)
    local qMod = unit:FindModifierByName("modifier_evo_spectre_bastion_q_shield")
    local rMod = unit:FindModifierByName("modifier_evo_spectre_bastion_r_shield")
    local eMod = unit:FindModifierByName("modifier_evo_spectre_bastion_e_passive")
    return (qMod and math.max(
        0,
        qMod:GetStackCount()
    ) or 0) + (rMod and math.max(
        0,
        rMod:GetStackCount()
    ) or 0) + (eMod and math.max(
        0,
        eMod:GetStackCount()
    ) or 0)
end
function ____exports.getBastionMaxPassiveShield(self, unit)
    local eAb = unit:FindAbilityByName("evo_spectre_bastion_e")
    if not eAb or eAb:IsNull() or eAb:GetLevel() <= 0 then
        return 0
    end
    return math.floor(eAb:GetSpecialValueFor("max_shield") + ____exports.getSpectreStr(nil, unit) * eAb:GetSpecialValueFor("max_str_pct") / 100)
end
function ____exports.addBastionPassiveShield(self, unit, amount)
    if amount <= 0 then
        return
    end
    local mod = unit:FindModifierByName("modifier_evo_spectre_bastion_e_passive")
    if not mod or mod:IsNull() then
        return
    end
    local cap = ____exports.getBastionMaxPassiveShield(nil, unit)
    if cap <= 0 then
        return
    end
    local next = math.min(
        cap,
        mod:GetStackCount() + math.floor(amount)
    )
    if next > mod:GetStackCount() then
        mod:SetStackCount(next)
    end
end
function ____exports.triggerBastionBreakMs(self, unit)
    if ____exports.getSpectreTier(nil, unit) < 3 then
        return
    end
    local eAb = unit:FindAbilityByName("evo_spectre_bastion_e")
    if not eAb or eAb:IsNull() or eAb:GetLevel() <= 0 then
        return
    end
    local dur = eAb:GetSpecialValueFor("break_ms_duration")
    unit:AddNewModifier(unit, eAb, "modifier_evo_spectre_bastion_break_ms", {duration = dur})
end
function ____exports.applySpectreCreepDamage(self, attacker, victim, ability, damage, damageType, creepMult)
    local finalDmg = isEvoCreepUnit(nil, victim) and damage * creepMult or damage
    ApplyDamage({
        victim = victim,
        attacker = attacker,
        ability = ability,
        damage = finalDmg,
        damage_type = damageType
    })
    return finalDmg
end
function ____exports.triggerAstralInversionReflect(self, victim, spectre, inversionAb, event)
    if event.unit ~= victim or event.damage_type ~= 1 then
        return false
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return false
    end
    if bit.band(event.damage_flags, 32) ~= 0 then
        return false
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsAlive() then
        return false
    end
    if attacker == victim or attacker:GetTeamNumber() == spectre:GetTeamNumber() then
        return false
    end
    local rawPhys = event.original_damage > 0 and event.original_damage or event.damage
    if rawPhys <= 0 then
        return false
    end
    local reflectPct = inversionAb:GetSpecialValueFor("reflect_pct") / 100
    local flatDmg = inversionAb:GetSpecialValueFor("flat_dmg")
    local intPct = inversionAb:GetSpecialValueFor("int_pct")
    local reflectDmg = rawPhys * reflectPct + flatDmg + ____exports.getSpectreInt(nil, spectre) * intPct / 100
    if reflectDmg <= 0.5 then
        return false
    end
    ApplyDamage({
        victim = attacker,
        attacker = spectre,
        ability = inversionAb,
        damage = reflectDmg,
        damage_type = 2,
        damage_flags = 16 + 1024
    })
    local tier = ____exports.getSpectreTier(nil, spectre)
    if tier >= 3 then
        local mrDur = inversionAb:GetSpecialValueFor("mr_shred_dur")
        attacker:AddNewModifier(spectre, inversionAb, "modifier_evo_spectre_mirror_inv_shred", {duration = mrDur})
    end
    if tier >= 4 and spectre:IsAlive() then
        local manaRestore = inversionAb:GetSpecialValueFor("mana_restore")
        if manaRestore > 0 then
            spectre:GiveMana(manaRestore)
        end
    end
    return true
end
return ____exports
