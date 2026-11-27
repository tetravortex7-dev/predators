local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 10,["15"] = 15,["16"] = 16,["17"] = 16,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["28"] = 24,["29"] = 28,["31"] = 31,["32"] = 40,["34"] = 43,["35"] = 56,["37"] = 58,["38"] = 15,["39"] = 61,["40"] = 62,["41"] = 63,["42"] = 63,["44"] = 64,["45"] = 64,["47"] = 65,["48"] = 61,["49"] = 68,["50"] = 69,["51"] = 70,["52"] = 71,["53"] = 71,["56"] = 73,["57"] = 68,["58"] = 76,["59"] = 77,["60"] = 78,["61"] = 79,["62"] = 79,["65"] = 81,["66"] = 76,["67"] = 84,["68"] = 85,["69"] = 86,["70"] = 87,["71"] = 87,["74"] = 89,["75"] = 84,["76"] = 92,["77"] = 93,["78"] = 94,["79"] = 95,["80"] = 95,["83"] = 97,["84"] = 92,["85"] = 100,["86"] = 101,["87"] = 106,["88"] = 107,["89"] = 107,["92"] = 109,["93"] = 100,["94"] = 112,["95"] = 113,["96"] = 114,["97"] = 115,["98"] = 115,["101"] = 117,["102"] = 112,["103"] = 120,["104"] = 121,["105"] = 122,["106"] = 123,["107"] = 123,["110"] = 125,["111"] = 120,["112"] = 128,["113"] = 129,["114"] = 130,["116"] = 132,["117"] = 134,["118"] = 138,["120"] = 141,["121"] = 145,["123"] = 147,["124"] = 148,["126"] = 150,["127"] = 128,["128"] = 153,["129"] = 154,["130"] = 153,["131"] = 157,["132"] = 158,["133"] = 157,["134"] = 161,["135"] = 162,["136"] = 161,["137"] = 165,["138"] = 166,["139"] = 166,["141"] = 167,["142"] = 168,["143"] = 168,["144"] = 168,["145"] = 168,["146"] = 168,["147"] = 165,["148"] = 171,["149"] = 176,["150"] = 176,["151"] = 176,["152"] = 176,["153"] = 176,["154"] = 176,["155"] = 176,["156"] = 176,["157"] = 176,["158"] = 176,["159"] = 176,["160"] = 171,["161"] = 189,["162"] = 191,["163"] = 192,["164"] = 193,["165"] = 194,["166"] = 194,["167"] = 194,["168"] = 194,["169"] = 197,["170"] = 198,["171"] = 191,["172"] = 201,["173"] = 202,["174"] = 203,["175"] = 204,["176"] = 205,["177"] = 206,["180"] = 209,["181"] = 210,["182"] = 210,["183"] = 210,["184"] = 210,["185"] = 201,["186"] = 213,["187"] = 214,["188"] = 215,["189"] = 216,["190"] = 217,["191"] = 218,["192"] = 219,["193"] = 220,["194"] = 221,["197"] = 224,["198"] = 213,["199"] = 227,["200"] = 237,["203"] = 238,["204"] = 239,["206"] = 240,["207"] = 240,["209"] = 241,["210"] = 242,["211"] = 242,["213"] = 243,["214"] = 245,["215"] = 246,["216"] = 247,["217"] = 248,["218"] = 248,["219"] = 248,["220"] = 248,["222"] = 250,["223"] = 251,["224"] = 251,["226"] = 253,["227"] = 253,["228"] = 253,["229"] = 253,["230"] = 253,["231"] = 253,["232"] = 253,["233"] = 253,["237"] = 227,["238"] = 264,["239"] = 265,["240"] = 266,["241"] = 267,["242"] = 268,["243"] = 269,["244"] = 269,["245"] = 269,["246"] = 270,["247"] = 270,["248"] = 269,["249"] = 271,["250"] = 271,["251"] = 271,["252"] = 264,["253"] = 275,["254"] = 276,["255"] = 277,["256"] = 277,["258"] = 278,["259"] = 279,["260"] = 280,["261"] = 280,["262"] = 279,["263"] = 282,["264"] = 275,["265"] = 285,["266"] = 286,["269"] = 287,["270"] = 288,["273"] = 289,["274"] = 290,["277"] = 291,["278"] = 291,["279"] = 291,["280"] = 291,["281"] = 292,["282"] = 293,["284"] = 285,["285"] = 297,["286"] = 298,["289"] = 299,["290"] = 300,["293"] = 301,["294"] = 302,["295"] = 297,["296"] = 305,["297"] = 313,["298"] = 314,["299"] = 314,["300"] = 314,["301"] = 314,["302"] = 314,["303"] = 314,["304"] = 314,["305"] = 321,["306"] = 305,["307"] = 324,["308"] = 330,["309"] = 330,["311"] = 331,["312"] = 331,["314"] = 332,["315"] = 332,["317"] = 334,["318"] = 335,["319"] = 335,["321"] = 336,["322"] = 336,["324"] = 338,["325"] = 339,["326"] = 339,["328"] = 341,["329"] = 342,["330"] = 343,["331"] = 344,["332"] = 345,["335"] = 348,["336"] = 349,["337"] = 350,["338"] = 351,["339"] = 351,["341"] = 353,["342"] = 353,["343"] = 353,["344"] = 353,["345"] = 353,["346"] = 353,["347"] = 353,["348"] = 353,["349"] = 361,["350"] = 324,["351"] = 364,["352"] = 366,["353"] = 367,["356"] = 368,["357"] = 369,["358"] = 370,["359"] = 371,["362"] = 372,["363"] = 374,["364"] = 375,["365"] = 376,["366"] = 377,["367"] = 378,["368"] = 379,["369"] = 380,["372"] = 384,["373"] = 388,["374"] = 389,["375"] = 390,["376"] = 391,["377"] = 392,["378"] = 366});
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
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_dispersion_t3") or hasAbilitySafe(nil, unit, "evo_spectre_phantom_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_inversion_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_e_t3") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q_t3") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_e_t3") then
        return 3
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_w") or hasAbilitySafe(nil, unit, "evo_spectre_phantom_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_phantom_w_t4") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q_t3") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q_t4") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_inversion") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_inversion_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_inversion_t4") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_w") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_mirror_w_t4") then
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
function ____exports.findPhantomEAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_phantom_e_t3", "evo_spectre_phantom_e"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findPhantomDAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_phantom_d_t4", "evo_spectre_phantom_d"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findBastionQAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_bastion_q_t4", "evo_spectre_bastion_q_t3", "evo_spectre_bastion_q"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findBastionEAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_bastion_e_t4", "evo_spectre_bastion_e_t3", "evo_spectre_bastion_e"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findMirrorInversionAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_mirror_inversion_t4", "evo_spectre_mirror_inversion_t3", "evo_spectre_mirror_inversion"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findMirrorQAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_mirror_q_t4", "evo_spectre_mirror_q_t3", "evo_spectre_mirror_q"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.findMirrorWAbility(self, unit)
    for ____, name in ipairs({"evo_spectre_mirror_w_t4", "evo_spectre_mirror_w_t3", "evo_spectre_mirror_w"}) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.detectSpectreBranchAndTier(self, unit)
    if not unit or unit:IsNull() then
        return {branch = "T1", tier = 1}
    end
    local tier = ____exports.getSpectreTier(nil, unit)
    if hasAbilitySafe(nil, unit, "evo_spectre_phantom_w") or hasAbilitySafe(nil, unit, "evo_spectre_phantom_w_t3") or hasAbilitySafe(nil, unit, "evo_spectre_phantom_w_t4") then
        return {branch = "PHANTOM", tier = tier}
    end
    if hasAbilitySafe(nil, unit, "evo_spectre_bastion_q") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q_t3") or hasAbilitySafe(nil, unit, "evo_spectre_bastion_q_t4") then
        return {branch = "BASTION", tier = tier}
    end
    if ____exports.findMirrorInversionAbility(nil, unit) ~= nil or ____exports.findMirrorWAbility(nil, unit) ~= nil then
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
                goto __continue63
            end
            local eIdx = enemy:GetEntityIndex()
            if hitTracker:has(eIdx) then
                goto __continue63
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
                goto __continue63
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
        ::__continue63::
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
    local eAb = ____exports.findBastionEAbility(nil, unit)
    if not eAb or eAb:IsNull() or eAb:GetLevel() <= 0 then
        return 0
    end
    local baseMax = eAb:GetSpecialValueFor("max_shield") + ____exports.getSpectreStr(nil, unit) * eAb:GetSpecialValueFor("max_str_pct") / 100
    local mult = unit:HasModifier("modifier_item_aghanims_shard") and math.max(
        1,
        eAb:GetSpecialValueFor("shard_shield_mult") or 1.75
    ) or 1
    return math.floor(baseMax * mult)
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
    local eAb = ____exports.findBastionEAbility(nil, unit)
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
    local reflectPct = inversionAb:GetSpecialValueFor("reflect_pct")
    if victim:HasModifier("modifier_evo_spectre_mirror_q_phase") then
        local qAb = ____exports.findMirrorQAbility(nil, spectre)
        if qAb and not qAb:IsNull() and qAb:GetLevel() > 0 then
            reflectPct = reflectPct + qAb:GetSpecialValueFor("trail_reflect_pct")
        end
    end
    local flatDmg = inversionAb:GetSpecialValueFor("flat_dmg")
    local intPct = inversionAb:GetSpecialValueFor("int_pct")
    local reflectDmg = rawPhys * (reflectPct / 100) + flatDmg + ____exports.getSpectreInt(nil, spectre) * intPct / 100
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
    return true
end
local bastionLastBlockFxTime = {}
function ____exports.spawnBastionBlockFx(self, victim, attacker, blocked)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or blocked <= 0 then
        return
    end
    local now = GameRules:GetGameTime()
    local id = victim:entindex()
    local prev = bastionLastBlockFxTime[id]
    if prev ~= nil and now - prev < 0.18 then
        return
    end
    bastionLastBlockFxTime[id] = now
    local victimPos = victim:GetAbsOrigin()
    local dir = victim:GetForwardVector()
    if attacker and not attacker:IsNull() and IsValidEntity(attacker) then
        local diff = attacker:GetAbsOrigin() - victimPos
        local flat = Vector(diff.x, diff.y, 0)
        if flat:Length2D() > 1 then
            dir = flat:Normalized()
        end
    end
    local fxPath = blocked >= 35 and "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf" or "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf"
    local pfx = ParticleManager:CreateParticle(fxPath, 0, victim)
    ParticleManager:SetParticleControl(pfx, 0, victimPos)
    ParticleManager:SetParticleControlForward(pfx, 0, dir)
    ParticleManager:ReleaseParticleIndex(pfx)
    victim:EmitSound("Hero_Mars.Shield.BlockSmall")
end
return ____exports
