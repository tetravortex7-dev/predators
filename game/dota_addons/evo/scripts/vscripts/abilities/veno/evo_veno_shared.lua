local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 10,["14"] = 15,["15"] = 16,["16"] = 16,["18"] = 17,["19"] = 18,["20"] = 19,["21"] = 20,["22"] = 20,["23"] = 20,["24"] = 20,["27"] = 24,["28"] = 28,["30"] = 30,["31"] = 35,["32"] = 36,["33"] = 37,["34"] = 37,["35"] = 37,["36"] = 37,["37"] = 37,["38"] = 37,["39"] = 37,["42"] = 41,["43"] = 45,["45"] = 47,["46"] = 15,["47"] = 50,["48"] = 51,["49"] = 52,["50"] = 52,["52"] = 53,["53"] = 53,["55"] = 54,["56"] = 50,["57"] = 57,["58"] = 58,["59"] = 59,["61"] = 61,["62"] = 62,["63"] = 63,["65"] = 65,["66"] = 66,["68"] = 68,["69"] = 69,["71"] = 71,["72"] = 57,["73"] = 74,["74"] = 75,["75"] = 74,["76"] = 78,["77"] = 79,["78"] = 78,["79"] = 82,["80"] = 83,["81"] = 83,["83"] = 84,["84"] = 85,["85"] = 85,["86"] = 85,["87"] = 85,["88"] = 85,["89"] = 82,["90"] = 88,["91"] = 89,["92"] = 89,["94"] = 90,["95"] = 91,["96"] = 88,["97"] = 94,["98"] = 95,["99"] = 95,["100"] = 95,["101"] = 95,["102"] = 95,["103"] = 95,["104"] = 95,["105"] = 95,["106"] = 95,["107"] = 95,["108"] = 95,["109"] = 94,["110"] = 108,["111"] = 109,["112"] = 109,["113"] = 109,["114"] = 109,["115"] = 109,["116"] = 109,["117"] = 109,["118"] = 109,["119"] = 109,["120"] = 109,["121"] = 109,["122"] = 108,["123"] = 122,["124"] = 130,["125"] = 131,["126"] = 131,["127"] = 131,["128"] = 131,["129"] = 131,["130"] = 131,["131"] = 131,["132"] = 122,["133"] = 140,["134"] = 142,["135"] = 143,["136"] = 144,["137"] = 145,["138"] = 145,["139"] = 145,["140"] = 145,["141"] = 146,["142"] = 147,["143"] = 142,["144"] = 150,["145"] = 156,["146"] = 157,["147"] = 158,["148"] = 159,["149"] = 160,["150"] = 161,["154"] = 165,["155"] = 166,["156"] = 166,["157"] = 166,["158"] = 166,["159"] = 150,["160"] = 169,["161"] = 174,["162"] = 175,["163"] = 176,["164"] = 177,["165"] = 178,["166"] = 179,["167"] = 180,["168"] = 181,["169"] = 182,["170"] = 182,["171"] = 182,["172"] = 182,["173"] = 184,["174"] = 184,["175"] = 184,["176"] = 184,["177"] = 184,["178"] = 184,["179"] = 184,["180"] = 184,["181"] = 185,["182"] = 185,["184"] = 187,["185"] = 187,["186"] = 187,["187"] = 187,["188"] = 188,["189"] = 189,["190"] = 190,["191"] = 191,["192"] = 192,["193"] = 193,["194"] = 194,["195"] = 195,["197"] = 198,["198"] = 198,["199"] = 198,["200"] = 198,["201"] = 198,["202"] = 198,["203"] = 198,["204"] = 199,["205"] = 199,["206"] = 199,["207"] = 199,["208"] = 199,["209"] = 199,["210"] = 200,["211"] = 200,["212"] = 200,["213"] = 200,["214"] = 200,["215"] = 200,["216"] = 204,["217"] = 169,["218"] = 207,["219"] = 208,["220"] = 214,["221"] = 215,["222"] = 215,["225"] = 217,["226"] = 207,["227"] = 220,["228"] = 225,["229"] = 226,["232"] = 227,["233"] = 228,["234"] = 230,["235"] = 231,["236"] = 232,["237"] = 236,["238"] = 237,["239"] = 239,["240"] = 244,["241"] = 245,["242"] = 247,["244"] = 248,["245"] = 248,["247"] = 249,["248"] = 249,["249"] = 249,["250"] = 249,["251"] = 249,["252"] = 249,["253"] = 249,["254"] = 256,["258"] = 259,["259"] = 260,["260"] = 261,["261"] = 262,["262"] = 263,["263"] = 267,["266"] = 271,["267"] = 272,["268"] = 273,["269"] = 277,["270"] = 278,["272"] = 279,["273"] = 279,["275"] = 280,["276"] = 281,["281"] = 220,["282"] = 286,["283"] = 291,["284"] = 292,["285"] = 293,["286"] = 296,["287"] = 297,["288"] = 297,["289"] = 297,["290"] = 297,["291"] = 298,["293"] = 286,["294"] = 302,["295"] = 307,["296"] = 302,["297"] = 310,["298"] = 315,["299"] = 310});
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
    for ____, innateName in ipairs({"evo_veno_needle_glands", "evo_veno_hive_glands", "evo_veno_symbiont_glands"}) do
        local ab = unit:FindAbilityByName(innateName)
        if ab and not ab:IsNull() then
            return math.min(
                4,
                math.max(
                    2,
                    ab:GetLevel() + 1
                )
            )
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
    for ____, name in ipairs({"evo_veno_needle_glands", "evo_veno_hive_glands", "evo_veno_symbiont_glands", "evo_veno_glands"}) do
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
