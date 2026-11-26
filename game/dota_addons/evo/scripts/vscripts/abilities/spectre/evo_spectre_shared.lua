local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 10,["15"] = 15,["16"] = 16,["17"] = 16,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["28"] = 24,["29"] = 28,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["41"] = 34,["42"] = 35,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 36,["51"] = 39,["52"] = 43,["54"] = 45,["55"] = 15,["56"] = 48,["57"] = 49,["58"] = 50,["59"] = 50,["61"] = 51,["62"] = 51,["64"] = 52,["65"] = 48,["66"] = 55,["67"] = 56,["68"] = 57,["70"] = 59,["71"] = 60,["72"] = 61,["74"] = 63,["75"] = 64,["77"] = 66,["78"] = 67,["80"] = 69,["81"] = 55,["82"] = 72,["83"] = 73,["84"] = 72,["85"] = 76,["86"] = 77,["87"] = 76,["88"] = 80,["89"] = 81,["90"] = 80,["91"] = 84,["92"] = 85,["93"] = 85,["95"] = 86,["96"] = 87,["97"] = 87,["98"] = 87,["99"] = 87,["100"] = 87,["101"] = 84,["102"] = 90,["103"] = 95,["104"] = 95,["105"] = 95,["106"] = 95,["107"] = 95,["108"] = 95,["109"] = 95,["110"] = 95,["111"] = 95,["112"] = 95,["113"] = 95,["114"] = 90,["115"] = 108,["116"] = 110,["117"] = 111,["118"] = 112,["119"] = 113,["120"] = 113,["121"] = 113,["122"] = 113,["123"] = 114,["124"] = 115,["125"] = 110,["126"] = 118,["127"] = 119,["128"] = 120,["129"] = 121,["130"] = 122,["131"] = 123,["132"] = 124,["135"] = 127,["136"] = 128,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 118,["141"] = 131,["142"] = 132,["143"] = 133,["144"] = 134,["145"] = 135,["146"] = 136,["147"] = 137,["148"] = 138,["149"] = 139,["152"] = 142,["153"] = 131,["154"] = 145,["155"] = 155,["158"] = 156,["159"] = 157,["161"] = 158,["162"] = 158,["164"] = 159,["165"] = 160,["166"] = 160,["168"] = 161,["169"] = 163,["170"] = 164,["171"] = 165,["172"] = 166,["173"] = 166,["174"] = 166,["175"] = 166,["177"] = 168,["178"] = 169,["179"] = 169,["181"] = 171,["182"] = 171,["183"] = 171,["184"] = 171,["185"] = 171,["186"] = 171,["187"] = 171,["188"] = 171,["192"] = 145,["193"] = 182,["194"] = 183,["195"] = 184,["196"] = 185,["197"] = 186,["198"] = 187,["199"] = 187,["200"] = 187,["201"] = 188,["202"] = 188,["203"] = 187,["204"] = 189,["205"] = 189,["206"] = 189,["207"] = 182,["208"] = 193,["209"] = 194,["210"] = 195,["211"] = 195,["213"] = 196,["214"] = 193,["215"] = 199,["216"] = 200,["219"] = 201,["220"] = 202,["223"] = 203,["224"] = 204,["227"] = 205,["228"] = 205,["229"] = 205,["230"] = 205,["231"] = 206,["232"] = 207,["234"] = 199,["235"] = 211,["236"] = 212,["239"] = 213,["240"] = 214,["243"] = 215,["244"] = 216,["245"] = 211,["246"] = 219,["247"] = 227,["248"] = 228,["249"] = 228,["250"] = 228,["251"] = 228,["252"] = 228,["253"] = 228,["254"] = 228,["255"] = 235,["256"] = 219,["257"] = 238,["258"] = 244,["259"] = 244,["261"] = 245,["262"] = 245,["264"] = 246,["265"] = 246,["267"] = 248,["268"] = 249,["269"] = 249,["271"] = 250,["272"] = 250,["274"] = 252,["275"] = 253,["276"] = 253,["278"] = 255,["279"] = 256,["280"] = 257,["281"] = 258,["282"] = 259,["283"] = 259,["285"] = 261,["286"] = 261,["287"] = 261,["288"] = 261,["289"] = 261,["290"] = 261,["291"] = 261,["292"] = 261,["293"] = 270,["294"] = 271,["295"] = 272,["296"] = 273,["298"] = 277,["299"] = 278,["300"] = 279,["301"] = 280,["304"] = 283,["305"] = 238});
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
    local phantomDisp = unit:FindAbilityByName("evo_spectre_phantom_dispersion")
    if phantomDisp and not phantomDisp:IsNull() then
        return math.min(
            4,
            math.max(
                2,
                phantomDisp:GetLevel() + 1
            )
        )
    end
    local mirrorInv = unit:FindAbilityByName("evo_spectre_mirror_inversion")
    if mirrorInv and not mirrorInv:IsNull() then
        return math.min(
            4,
            math.max(
                2,
                mirrorInv:GetLevel() + 1
            )
        )
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_q") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_q") then
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
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_q") then
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
        function(____, u) return u and not u:IsNull() and IsValidEntity(u) and u:IsAlive() end
    )
    portalsByOwner:set(idx, alive)
    return alive
end
function ____exports.registerSpectrePortal(self, owner, portal, maxCount)
    local alive = ____exports.cleanupSpectrePortals(nil, owner)
    while #alive >= maxCount do
        local oldest = table.remove(alive, 1)
        if oldest and not oldest:IsNull() and IsValidEntity(oldest) then
            oldest:ForceKill(false)
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
                goto __continue36
            end
            local eIdx = enemy:GetEntityIndex()
            if hitTracker:has(eIdx) then
                goto __continue36
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
                goto __continue36
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
        ::__continue36::
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
