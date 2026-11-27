local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 10,["14"] = 15,["15"] = 16,["16"] = 16,["18"] = 17,["19"] = 18,["20"] = 19,["21"] = 20,["22"] = 20,["23"] = 20,["24"] = 20,["27"] = 24,["28"] = 28,["30"] = 30,["31"] = 35,["32"] = 36,["35"] = 40,["36"] = 44,["38"] = 46,["39"] = 15,["40"] = 49,["41"] = 50,["42"] = 51,["43"] = 51,["45"] = 52,["46"] = 52,["48"] = 53,["49"] = 49,["50"] = 56,["51"] = 57,["52"] = 58,["54"] = 60,["55"] = 61,["56"] = 62,["58"] = 64,["59"] = 65,["61"] = 67,["62"] = 68,["64"] = 70,["65"] = 56,["66"] = 73,["67"] = 74,["68"] = 73,["69"] = 77,["70"] = 78,["71"] = 77,["72"] = 81,["73"] = 82,["74"] = 82,["76"] = 83,["77"] = 84,["78"] = 84,["79"] = 84,["80"] = 84,["81"] = 84,["82"] = 81,["83"] = 87,["84"] = 88,["85"] = 88,["87"] = 89,["88"] = 90,["89"] = 87,["90"] = 93,["91"] = 94,["92"] = 94,["93"] = 94,["94"] = 94,["95"] = 94,["96"] = 94,["97"] = 94,["98"] = 94,["99"] = 94,["100"] = 94,["101"] = 94,["102"] = 93,["103"] = 107,["104"] = 108,["105"] = 108,["106"] = 108,["107"] = 108,["108"] = 108,["109"] = 108,["110"] = 108,["111"] = 108,["112"] = 108,["113"] = 108,["114"] = 108,["115"] = 107,["116"] = 121,["117"] = 129,["118"] = 130,["119"] = 130,["120"] = 130,["121"] = 130,["122"] = 130,["123"] = 130,["124"] = 130,["125"] = 121,["126"] = 139,["127"] = 141,["128"] = 142,["129"] = 143,["130"] = 144,["131"] = 144,["132"] = 144,["133"] = 144,["134"] = 145,["135"] = 146,["136"] = 141,["137"] = 149,["138"] = 155,["139"] = 156,["140"] = 157,["141"] = 158,["142"] = 159,["143"] = 160,["147"] = 164,["148"] = 165,["149"] = 165,["150"] = 165,["151"] = 165,["152"] = 149,["153"] = 168,["154"] = 173,["155"] = 174,["156"] = 175,["157"] = 176,["158"] = 177,["159"] = 178,["160"] = 179,["161"] = 180,["162"] = 181,["163"] = 181,["164"] = 181,["165"] = 181,["166"] = 183,["167"] = 183,["168"] = 183,["169"] = 183,["170"] = 183,["171"] = 183,["172"] = 183,["173"] = 183,["174"] = 184,["175"] = 184,["177"] = 186,["178"] = 186,["179"] = 186,["180"] = 186,["181"] = 187,["182"] = 188,["183"] = 189,["184"] = 190,["185"] = 191,["186"] = 192,["187"] = 193,["188"] = 194,["190"] = 197,["191"] = 197,["192"] = 197,["193"] = 197,["194"] = 197,["195"] = 197,["196"] = 197,["197"] = 198,["198"] = 198,["199"] = 198,["200"] = 198,["201"] = 198,["202"] = 198,["203"] = 199,["204"] = 199,["205"] = 199,["206"] = 199,["207"] = 199,["208"] = 199,["209"] = 203,["210"] = 168,["211"] = 206,["212"] = 207,["213"] = 207,["214"] = 207,["215"] = 207,["216"] = 207,["217"] = 207,["218"] = 207,["219"] = 207,["220"] = 207,["221"] = 207,["222"] = 207,["223"] = 207,["224"] = 219,["225"] = 220,["226"] = 220,["229"] = 222,["230"] = 206,["231"] = 225,["232"] = 230,["233"] = 231,["236"] = 232,["237"] = 233,["238"] = 235,["239"] = 236,["240"] = 237,["241"] = 241,["242"] = 242,["243"] = 244,["244"] = 249,["245"] = 250,["246"] = 252,["248"] = 253,["249"] = 253,["251"] = 254,["252"] = 254,["253"] = 254,["254"] = 254,["255"] = 254,["256"] = 254,["257"] = 254,["258"] = 261,["262"] = 264,["263"] = 265,["264"] = 266,["265"] = 267,["266"] = 268,["267"] = 272,["270"] = 276,["271"] = 277,["272"] = 278,["273"] = 282,["274"] = 283,["276"] = 284,["277"] = 284,["279"] = 285,["280"] = 286,["285"] = 225,["286"] = 291,["287"] = 296,["288"] = 297,["289"] = 298,["290"] = 301,["291"] = 302,["292"] = 302,["293"] = 302,["294"] = 302,["295"] = 303,["297"] = 291,["298"] = 307,["299"] = 312,["300"] = 307,["301"] = 315,["302"] = 320,["303"] = 315});
local ____exports = {}
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local function hasAbilitySafe(self, unit, name)
    local ab = unit:FindAbilityByName(name)
    return ab ~= nil and not ab:IsNull()
end
function ____exports.getVenoTier(self, unit)
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
    if hasAbilitySafe(nil, unit, "evo_veno_needle_r") or hasAbilitySafe(nil, unit, "evo_veno_hive_r") or hasAbilitySafe(nil, unit, "evo_veno_symbiont_r") then
        return 4
    end
    for ____, innateName in ipairs({"evo_veno_needle_glands_t3", "evo_veno_hive_glands_t3", "evo_veno_symbiont_glands_t3"}) do
        if hasAbilitySafe(nil, unit, innateName) then
            return 3
        end
    end
    if hasAbilitySafe(nil, unit, "evo_veno_needle_q") or hasAbilitySafe(nil, unit, "evo_veno_hive_q") or hasAbilitySafe(nil, unit, "evo_veno_symbiont_q") then
        return 2
    end
    return 1
end
function ____exports.getVenoBranchMaxLevel(self, unit)
    local tier = ____exports.getVenoTier(nil, unit)
    if tier <= 1 then
        return 3
    end
    if tier == 2 then
        return 4
    end
    return 5
end
function ____exports.detectVenoBranchAndTier(self, unit)
    if not unit or unit:IsNull() then
        return {branch = "T1", tier = 1}
    end
    local tier = ____exports.getVenoTier(nil, unit)
    if hasAbilitySafe(nil, unit, "evo_veno_needle_q") then
        return {branch = "NEEDLE", tier = tier}
    end
    if hasAbilitySafe(nil, unit, "evo_veno_hive_q") then
        return {branch = "HIVE", tier = tier}
    end
    if hasAbilitySafe(nil, unit, "evo_veno_symbiont_q") then
        return {branch = "SYMBIONT", tier = tier}
    end
    return {branch = "T1", tier = tier}
end
function ____exports.getVenoAgi(self, unit)
    return unit:IsRealHero() and unit:GetAgility() or 0
end
function ____exports.getVenoInt(self, unit)
    return unit:IsRealHero() and unit:GetIntellect(false) or 0
end
function ____exports.getVenoHighestAttr(self, unit)
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
function ____exports.getVenoAllAttrSum(self, unit)
    if not unit:IsRealHero() then
        return 0
    end
    local hero = unit
    return hero:GetStrength() + hero:GetAgility() + hero:GetIntellect(false)
end
function ____exports.findVenoEnemies(self, caster, origin, radius)
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
function ____exports.findVenoAllies(self, caster, origin, radius)
    return FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        radius,
        1,
        1,
        0,
        0,
        false
    )
end
function ____exports.applyVenoCreepDamage(self, attacker, victim, ability, damage, damageType, creepMult)
    local finalDmg = isEvoCreepUnit(nil, victim) and damage * creepMult or damage
    ApplyDamage({
        victim = victim,
        attacker = attacker,
        ability = ability,
        damage = finalDmg,
        damage_type = damageType
    })
end
local turretsByOwner = __TS__New(Map)
function ____exports.getVenoActiveTurrets(self, owner)
    local idx = owner:GetEntityIndex()
    local list = turretsByOwner:get(idx) or ({})
    local alive = __TS__ArrayFilter(
        list,
        function(____, u) return u and not u:IsNull() and IsValidEntity(u) and u:IsAlive() end
    )
    turretsByOwner:set(idx, alive)
    return alive
end
function ____exports.registerVenoTurret(self, owner, turret, maxTurrets, bypassCap)
    local alive = ____exports.getVenoActiveTurrets(nil, owner)
    if not bypassCap then
        while #alive >= maxTurrets do
            local oldest = table.remove(alive, 1)
            if oldest and not oldest:IsNull() and IsValidEntity(oldest) then
                oldest:ForceKill(false)
            end
        end
    end
    alive[#alive + 1] = turret
    turretsByOwner:set(
        owner:GetEntityIndex(),
        alive
    )
end
function ____exports.spawnVenoBioTurret(self, owner, pos, bypassCap)
    local wAb = owner:FindAbilityByName("evo_veno_hive_w")
    local lvl = wAb and not wAb:IsNull() and wAb:GetLevel() or 0
    local tier = ____exports.getVenoTier(nil, owner)
    local dur = wAb and lvl > 0 and wAb:GetSpecialValueFor("duration") or 18
    local maxTurrets = wAb and lvl > 0 and wAb:GetSpecialValueFor("max_turrets") or 4
    local baseHp = wAb and lvl > 0 and wAb:GetSpecialValueFor("base_hp") or 180
    local hpPct = wAb and lvl > 0 and wAb:GetSpecialValueFor("hp_int_pct") or 80
    local range = wAb and lvl > 0 and wAb:GetSpecialValueFor("turret_range") or 550
    local hp = math.max(
        120,
        math.floor(baseHp + ____exports.getVenoInt(nil, owner) * hpPct / 100 + 0.5)
    )
    local unit = CreateUnitByName(
        "evo_veno_turret",
        pos,
        true,
        owner,
        owner,
        owner:GetTeamNumber()
    )
    if not unit or unit:IsNull() then
        return nil
    end
    unit:SetControllableByPlayer(
        owner:GetPlayerOwnerID(),
        false
    )
    unit:SetBaseMaxHealth(hp)
    unit:SetMaxHealth(hp)
    unit:SetHealth(hp)
    unit:SetBaseDamageMin(28)
    unit:SetBaseDamageMax(28)
    if tier >= 4 then
        local mr = wAb and lvl > 0 and wAb:GetSpecialValueFor("turret_mr") or 50
        unit:SetBaseMagicalResistanceValue(mr)
    end
    ____exports.registerVenoTurret(
        nil,
        owner,
        unit,
        maxTurrets,
        bypassCap
    )
    unit:AddNewModifier(
        owner,
        wAb and not wAb:IsNull() and wAb or nil,
        "modifier_kill",
        {duration = dur}
    )
    unit:AddNewModifier(
        owner,
        wAb and not wAb:IsNull() and wAb or nil,
        "modifier_evo_veno_hive_turret",
        {duration = dur, range = range}
    )
    return unit
end
function ____exports.findVenoInnateAbility(self, unit)
    for ____, name in ipairs({
        "evo_veno_needle_glands_t4",
        "evo_veno_needle_glands_t3",
        "evo_veno_needle_glands",
        "evo_veno_hive_glands_t4",
        "evo_veno_hive_glands_t3",
        "evo_veno_hive_glands",
        "evo_veno_symbiont_glands_t4",
        "evo_veno_symbiont_glands_t3",
        "evo_veno_symbiont_glands",
        "evo_veno_glands"
    }) do
        local ab = unit:FindAbilityByName(name)
        if ab and not ab:IsNull() then
            return ab
        end
    end
    return nil
end
function ____exports.triggerVenoSporePulse(self, owner, primaryTarget, scaleFactor)
    local ab = ____exports.findVenoInnateAbility(nil, owner)
    if not ab or ab:IsNull() or owner:PassivesDisabled() then
        return
    end
    local info = ____exports.detectVenoBranchAndTier(nil, owner)
    local origin = primaryTarget:GetAbsOrigin()
    local radius = ab:GetSpecialValueFor("pulse_radius")
    local baseDmg = ab:GetSpecialValueFor("pulse_base_dmg")
    local statDmg = info.branch == "SYMBIONT" and ____exports.getVenoAllAttrSum(nil, owner) * ab:GetSpecialValueFor("pulse_all_pct") / 100 or ____exports.getVenoHighestAttr(nil, owner) * ab:GetSpecialValueFor("pulse_attr_pct") / 100
    local dmg = (baseDmg + statDmg) * scaleFactor
    local slowDur = ab:GetSpecialValueFor("slow_duration")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_venomancer/venomancer_venomous_gale_impact.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(____exports.findVenoEnemies(nil, owner, origin, radius)) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue44
            end
            ApplyDamage({
                victim = enemy,
                attacker = owner,
                ability = ab,
                damage = dmg,
                damage_type = 2
            })
            enemy:AddNewModifier(owner, ab, "modifier_evo_veno_glands_slow", {duration = slowDur})
        end
        ::__continue44::
    end
    if info.branch == "NEEDLE" and info.tier >= 3 then
        local shred = ab:GetSpecialValueFor("armor_shred")
        local shredDur = ab:GetSpecialValueFor("shred_duration")
        if shred > 0 then
            primaryTarget:AddNewModifier(owner, ab, "modifier_evo_veno_glands_shred", {duration = shredDur, shred = shred})
            primaryTarget:AddNewModifier(owner, ab, "modifier_evo_veno_needle_mark", {duration = shredDur})
        end
    end
    if info.branch == "SYMBIONT" and info.tier >= 3 then
        local healRadius = ab:GetSpecialValueFor("heal_radius")
        local healAmt = (ab:GetSpecialValueFor("heal_base") + ____exports.getVenoAllAttrSum(nil, owner) * ab:GetSpecialValueFor("heal_all_pct") / 100) * scaleFactor
        local buffDur = ab:GetSpecialValueFor("ally_buff_duration")
        for ____, ally in ipairs(____exports.findVenoAllies(nil, owner, origin, healRadius)) do
            do
                if not ally or ally:IsNull() or not ally:IsAlive() then
                    goto __continue50
                end
                ally:Heal(healAmt, ab)
                ally:AddNewModifier(owner, ab, "modifier_evo_veno_symbiont_glands_buff", {duration = buffDur})
            end
            ::__continue50::
        end
    end
end
function ____exports.applyVenoChitinShard(self, caster, target, ability)
    local tier = ____exports.getVenoTier(nil, caster)
    local maxStacks = tier >= 4 and 6 or (tier >= 3 and 5 or 4)
    local mod = target:AddNewModifier(caster, ability, "modifier_evo_veno_chitin_shard", {duration = 4.5})
    if mod ~= nil then
        local next = math.min(
            maxStacks,
            mod:GetStackCount() + 1
        )
        mod:SetStackCount(next)
    end
end
function ____exports.applyVenoSporeInfection(self, caster, target, ability)
    target:AddNewModifier(caster, ability, "modifier_evo_veno_spore_infection", {duration = 5})
end
function ____exports.applyVenoSymbiontPollen(self, caster, target, ability)
    target:AddNewModifier(caster, ability, "modifier_evo_veno_symbiont_pollen", {duration = 4.5})
end
return ____exports
