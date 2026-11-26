local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 12,["20"] = 13,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 18,["25"] = 20,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 26,["30"] = 27,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 28,["39"] = 31,["40"] = 32,["41"] = 31,["42"] = 34,["43"] = 35,["44"] = 34,["45"] = 37,["46"] = 38,["49"] = 39,["50"] = 40,["51"] = 41,["52"] = 44,["53"] = 50,["54"] = 51,["55"] = 53,["56"] = 54,["57"] = 56,["58"] = 57,["59"] = 62,["60"] = 63,["61"] = 63,["62"] = 63,["63"] = 63,["64"] = 63,["65"] = 64,["66"] = 66,["68"] = 67,["69"] = 67,["71"] = 68,["72"] = 68,["73"] = 68,["74"] = 68,["75"] = 68,["76"] = 68,["77"] = 68,["78"] = 75,["82"] = 77,["85"] = 81,["86"] = 81,["87"] = 81,["88"] = 81,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 85,["93"] = 86,["94"] = 90,["95"] = 92,["96"] = 93,["97"] = 95,["98"] = 96,["99"] = 97,["100"] = 98,["102"] = 99,["103"] = 99,["105"] = 100,["106"] = 100,["107"] = 100,["108"] = 100,["109"] = 100,["110"] = 100,["111"] = 100,["112"] = 100,["113"] = 108,["114"] = 108,["115"] = 108,["116"] = 108,["117"] = 108,["118"] = 108,["119"] = 108,["120"] = 108,["121"] = 108,["127"] = 37,["128"] = 27,["129"] = 26,["130"] = 27,["132"] = 27,["133"] = 115,["134"] = 116,["135"] = 115,["136"] = 116,["138"] = 116,["139"] = 117,["140"] = 115,["141"] = 119,["142"] = 120,["143"] = 119,["144"] = 122,["145"] = 123,["146"] = 122,["147"] = 125,["148"] = 126,["149"] = 127,["152"] = 128,["153"] = 125,["154"] = 130,["155"] = 131,["158"] = 132,["159"] = 133,["160"] = 134,["163"] = 135,["164"] = 136,["167"] = 139,["168"] = 140,["169"] = 141,["170"] = 141,["171"] = 141,["172"] = 141,["173"] = 130,["174"] = 145,["175"] = 146,["176"] = 146,["177"] = 146,["178"] = 146,["179"] = 145,["180"] = 151,["181"] = 152,["182"] = 153,["183"] = 154,["184"] = 154,["186"] = 155,["187"] = 151,["188"] = 157,["189"] = 158,["190"] = 158,["192"] = 159,["193"] = 160,["194"] = 161,["195"] = 161,["197"] = 162,["198"] = 162,["200"] = 164,["201"] = 165,["202"] = 166,["203"] = 167,["204"] = 168,["205"] = 169,["206"] = 170,["207"] = 171,["208"] = 172,["211"] = 175,["212"] = 175,["214"] = 176,["215"] = 177,["216"] = 178,["217"] = 179,["218"] = 179,["219"] = 179,["220"] = 179,["221"] = 179,["222"] = 179,["223"] = 179,["224"] = 179,["226"] = 188,["227"] = 157,["228"] = 116,["229"] = 115,["230"] = 116,["232"] = 116,["233"] = 192,["234"] = 193,["235"] = 192,["236"] = 193,["237"] = 194,["238"] = 195,["239"] = 194,["240"] = 197,["241"] = 198,["244"] = 199,["245"] = 200,["246"] = 200,["247"] = 200,["248"] = 200,["249"] = 201,["250"] = 202,["251"] = 204,["252"] = 205,["253"] = 205,["254"] = 205,["255"] = 205,["256"] = 205,["257"] = 205,["258"] = 205,["259"] = 205,["260"] = 206,["263"] = 207,["264"] = 208,["265"] = 209,["266"] = 210,["267"] = 211,["268"] = 213,["269"] = 213,["270"] = 213,["271"] = 213,["272"] = 214,["273"] = 197,["274"] = 193,["275"] = 192,["276"] = 193,["278"] = 193,["279"] = 218,["280"] = 219,["281"] = 218,["282"] = 219,["284"] = 219,["285"] = 220,["286"] = 221,["287"] = 218,["288"] = 223,["289"] = 224,["290"] = 223,["291"] = 226,["292"] = 227,["293"] = 226,["294"] = 229,["295"] = 230,["296"] = 229,["297"] = 232,["298"] = 233,["299"] = 232,["300"] = 235,["301"] = 236,["302"] = 235,["303"] = 238,["304"] = 239,["305"] = 238,["306"] = 241,["307"] = 242,["308"] = 241,["309"] = 244,["310"] = 245,["311"] = 244,["312"] = 247,["313"] = 248,["314"] = 247,["315"] = 250,["316"] = 251,["317"] = 250,["318"] = 253,["319"] = 254,["320"] = 255,["321"] = 256,["322"] = 257,["323"] = 258,["325"] = 260,["328"] = 261,["329"] = 261,["330"] = 261,["331"] = 261,["332"] = 261,["333"] = 266,["334"] = 266,["335"] = 266,["336"] = 266,["337"] = 266,["338"] = 266,["339"] = 266,["340"] = 266,["341"] = 267,["342"] = 253,["343"] = 269,["344"] = 270,["347"] = 271,["348"] = 272,["349"] = 273,["350"] = 274,["353"] = 276,["354"] = 277,["355"] = 278,["358"] = 279,["359"] = 281,["360"] = 282,["361"] = 283,["362"] = 285,["363"] = 290,["364"] = 291,["365"] = 291,["366"] = 291,["367"] = 291,["368"] = 291,["369"] = 292,["370"] = 294,["372"] = 295,["373"] = 295,["375"] = 296,["376"] = 296,["377"] = 296,["378"] = 296,["379"] = 296,["380"] = 296,["381"] = 296,["382"] = 303,["386"] = 269,["387"] = 219,["388"] = 218,["389"] = 219,["391"] = 219,["392"] = 308,["393"] = 309,["394"] = 308,["395"] = 309,["396"] = 310,["397"] = 311,["398"] = 310,["399"] = 313,["400"] = 314,["401"] = 313,["402"] = 309,["403"] = 308,["404"] = 309,["406"] = 309});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_veno_shared = require("abilities.veno.evo_veno_shared")
local applyVenoCreepDamage = ____evo_veno_shared.applyVenoCreepDamage
local applyVenoSporeInfection = ____evo_veno_shared.applyVenoSporeInfection
local findVenoEnemies = ____evo_veno_shared.findVenoEnemies
local getVenoActiveTurrets = ____evo_veno_shared.getVenoActiveTurrets
local getVenoBranchMaxLevel = ____evo_veno_shared.getVenoBranchMaxLevel
local getVenoInt = ____evo_veno_shared.getVenoInt
local getVenoTier = ____evo_veno_shared.getVenoTier
local spawnVenoBioTurret = ____evo_veno_shared.spawnVenoBioTurret
require("abilities.veno.evo_veno_debuffs")
local SCRIPT_PATH = "abilities/veno/evo_veno_hive_er"
LinkLuaModifier("modifier_evo_veno_hive_e_passive", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_hive_obelisk", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_hive_obelisk_link", SCRIPT_PATH, 0)
____exports.evo_veno_hive_e = __TS__Class()
local evo_veno_hive_e = ____exports.evo_veno_hive_e
evo_veno_hive_e.name = "evo_veno_hive_e"
__TS__ClassExtends(evo_veno_hive_e, BaseAbility)
function evo_veno_hive_e.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_hive_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_veno_hive_e_passive"
end
function evo_veno_hive_e.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("volley_radius")
end
function evo_veno_hive_e.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local tier = getVenoTier(nil, caster)
    local cursorTarget = self:GetCursorTarget()
    if tier >= 3 and cursorTarget and not cursorTarget:IsNull() and cursorTarget:GetTeamNumber() == caster:GetTeamNumber() and cursorTarget:HasModifier("modifier_evo_veno_hive_turret") then
        local blastRadius = self:GetSpecialValueFor("blast_radius")
        local blastDmg = self:GetSpecialValueFor("blast_dmg") + getVenoInt(nil, caster) * self:GetSpecialValueFor("blast_int_pct") / 100
        local stunDur = tier >= 4 and 1.4 or 1.1
        local origin = cursorTarget:GetAbsOrigin()
        cursorTarget:EmitSound("Hero_Venomancer.PoisonNova")
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf", 8, nil)
        ParticleManager:SetParticleControl(pfx, 0, origin)
        ParticleManager:SetParticleControl(
            pfx,
            1,
            Vector(blastRadius, 1, blastRadius)
        )
        ParticleManager:ReleaseParticleIndex(pfx)
        for ____, enemy in ipairs(findVenoEnemies(nil, caster, origin, blastRadius)) do
            do
                if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                    goto __continue8
                end
                ApplyDamage({
                    victim = enemy,
                    attacker = caster,
                    ability = self,
                    damage = blastDmg,
                    damage_type = 2
                })
                enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = stunDur})
            end
            ::__continue8::
        end
        cursorTarget:ForceKill(false)
        return
    end
    local pos = GetGroundPosition(
        self:GetCursorPosition(),
        caster
    )
    local volleyRadius = self:GetSpecialValueFor("volley_radius")
    local volleyMult = self:GetSpecialValueFor("volley_dmg_pct") / 100
    local asDur = self:GetSpecialValueFor("volley_as_dur")
    local wAb = caster:FindAbilityByName("evo_veno_hive_w")
    local perTurretBase = wAb and not wAb:IsNull() and wAb:GetLevel() > 0 and wAb:GetSpecialValueFor("base_damage") + getVenoInt(nil, caster) * wAb:GetSpecialValueFor("int_pct") / 100 or 28 + getVenoInt(nil, caster) * 0.25
    local creepMult = wAb and not wAb:IsNull() and wAb:GetSpecialValueFor("creep_mult") or 1.3
    local turrets = getVenoActiveTurrets(nil, caster)
    caster:EmitSound("Hero_Venomancer.Plague_Ward")
    for ____, turret in ipairs(turrets) do
        turret:AddNewModifier(caster, self, "modifier_evo_veno_hive_turret_frenzy", {duration = asDur})
        local enemies = findVenoEnemies(nil, caster, pos, volleyRadius)
        for ____, enemy in ipairs(enemies) do
            do
                if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                    goto __continue12
                end
                ProjectileManager:CreateTrackingProjectile({
                    Target = enemy,
                    Source = turret,
                    Ability = self,
                    EffectName = "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
                    iMoveSpeed = 1900,
                    bDodgeable = true
                })
                applyVenoCreepDamage(
                    nil,
                    caster,
                    enemy,
                    self,
                    perTurretBase * volleyMult,
                    2,
                    creepMult
                )
                break
            end
            ::__continue12::
        end
    end
end
evo_veno_hive_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_e")},
    evo_veno_hive_e
)
____exports.evo_veno_hive_e = evo_veno_hive_e
____exports.modifier_evo_veno_hive_e_passive = __TS__Class()
local modifier_evo_veno_hive_e_passive = ____exports.modifier_evo_veno_hive_e_passive
modifier_evo_veno_hive_e_passive.name = "modifier_evo_veno_hive_e_passive"
__TS__ClassExtends(modifier_evo_veno_hive_e_passive, BaseModifier)
function modifier_evo_veno_hive_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.nearTurret = false
end
function modifier_evo_veno_hive_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_veno_hive_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_hive_e_passive.prototype.OnCreated(self)
    self.nearTurret = false
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.25)
end
function modifier_evo_veno_hive_e_passive.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() then
        return
    end
    if getVenoTier(nil, parent) < 4 then
        self.nearTurret = false
        return
    end
    local range = ab:GetSpecialValueFor("transfer_range")
    local origin = parent:GetAbsOrigin()
    self.nearTurret = __TS__ArraySome(
        getVenoActiveTurrets(nil, parent),
        function(____, u) return (u:GetAbsOrigin() - origin):Length2D() <= range end
    )
end
function modifier_evo_veno_hive_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")
    }
end
function modifier_evo_veno_hive_e_passive.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or not self.nearTurret or parent:PassivesDisabled() then
        return 0
    end
    return ab:GetSpecialValueFor("near_ms_pct")
end
function modifier_evo_veno_hive_e_passive.prototype.GetModifierIncomingDamage_Percentage(self, event)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    if getVenoTier(nil, parent) < 4 or event.damage <= 0 then
        return 0
    end
    local range = ab:GetSpecialValueFor("transfer_range")
    local origin = parent:GetAbsOrigin()
    local nearest
    local bestDist = range + 1
    for ____, turret in ipairs(getVenoActiveTurrets(nil, parent)) do
        local d = (turret:GetAbsOrigin() - origin):Length2D()
        if d <= range and d < bestDist then
            bestDist = d
            nearest = turret
        end
    end
    if not nearest then
        return 0
    end
    local pct = ab:GetSpecialValueFor("transfer_pct")
    local redirect = event.damage * pct / 100
    if redirect > 0.5 then
        ApplyDamage({
            victim = nearest,
            attacker = event.attacker or parent,
            ability = ab,
            damage = redirect,
            damage_type = 4,
            damage_flags = 32
        })
    end
    return -pct
end
modifier_evo_veno_hive_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_hive_e_passive")},
    modifier_evo_veno_hive_e_passive
)
____exports.modifier_evo_veno_hive_e_passive = modifier_evo_veno_hive_e_passive
____exports.evo_veno_hive_r = __TS__Class()
local evo_veno_hive_r = ____exports.evo_veno_hive_r
evo_veno_hive_r.name = "evo_veno_hive_r"
__TS__ClassExtends(evo_veno_hive_r, BaseAbility)
function evo_veno_hive_r.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("pulse_radius")
end
function evo_veno_hive_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local pos = GetGroundPosition(
        self:GetCursorPosition(),
        caster
    )
    local dur = self:GetSpecialValueFor("duration")
    local hp = math.floor(self:GetSpecialValueFor("base_hp") + getVenoInt(nil, caster) * self:GetSpecialValueFor("hp_int_pct") / 100 + 0.5)
    caster:EmitSound("Hero_Venomancer.PoisonNova")
    local obelisk = CreateUnitByName(
        "evo_veno_obelisk",
        pos,
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    if not obelisk or obelisk:IsNull() then
        return
    end
    obelisk:SetBaseMaxHealth(hp)
    obelisk:SetMaxHealth(hp)
    obelisk:SetHealth(hp)
    obelisk:AddNewModifier(caster, self, "modifier_kill", {duration = dur})
    obelisk:AddNewModifier(caster, self, "modifier_evo_veno_hive_obelisk", {duration = dur})
    local offsetPos = GetGroundPosition(
        pos + Vector(120, 0, 0),
        caster
    )
    spawnVenoBioTurret(nil, caster, offsetPos, true)
end
evo_veno_hive_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_hive_r")},
    evo_veno_hive_r
)
____exports.evo_veno_hive_r = evo_veno_hive_r
____exports.modifier_evo_veno_hive_obelisk = __TS__Class()
local modifier_evo_veno_hive_obelisk = ____exports.modifier_evo_veno_hive_obelisk
modifier_evo_veno_hive_obelisk.name = "modifier_evo_veno_hive_obelisk"
__TS__ClassExtends(modifier_evo_veno_hive_obelisk, BaseModifier)
function modifier_evo_veno_hive_obelisk.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.pulseAccum = 0
    self.linkRadius = 700
end
function modifier_evo_veno_hive_obelisk.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_hive_obelisk.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_hive_obelisk.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_hive_obelisk.prototype.GetTexture(self)
    return "pugna_nether_ward"
end
function modifier_evo_veno_hive_obelisk.prototype.IsAura(self)
    return true
end
function modifier_evo_veno_hive_obelisk.prototype.GetModifierAura(self)
    return "modifier_evo_veno_hive_obelisk_link"
end
function modifier_evo_veno_hive_obelisk.prototype.GetAuraRadius(self)
    return self.linkRadius
end
function modifier_evo_veno_hive_obelisk.prototype.GetAuraSearchTeam(self)
    return 1
end
function modifier_evo_veno_hive_obelisk.prototype.GetAuraSearchType(self)
    return 55
end
function modifier_evo_veno_hive_obelisk.prototype.GetAuraEntityReject(self, entity)
    return not entity:HasModifier("modifier_evo_veno_hive_turret")
end
function modifier_evo_veno_hive_obelisk.prototype.OnCreated(self)
    self.pulseAccum = 0
    self.linkRadius = 700
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.linkRadius = ab:GetSpecialValueFor("link_radius")
    end
    if not IsServer() then
        return
    end
    local pfx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf",
        1,
        self:GetParent()
    )
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
    self:StartIntervalThink(0.1)
end
function modifier_evo_veno_hive_obelisk.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local obelisk = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not obelisk or obelisk:IsNull() or not obelisk:IsAlive() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    self.pulseAccum = self.pulseAccum + 0.1
    local interval = ab:GetSpecialValueFor("pulse_interval")
    if self.pulseAccum < interval then
        return
    end
    self.pulseAccum = self.pulseAccum - interval
    local radius = ab:GetSpecialValueFor("pulse_radius")
    local dmg = ab:GetSpecialValueFor("pulse_dmg") + getVenoInt(nil, caster) * ab:GetSpecialValueFor("pulse_int_pct") / 100
    local origin = obelisk:GetAbsOrigin()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(radius, 1, radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findVenoEnemies(nil, caster, origin, radius)) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue58
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dmg,
                damage_type = 2
            })
            applyVenoSporeInfection(nil, caster, enemy, ab)
        end
        ::__continue58::
    end
end
modifier_evo_veno_hive_obelisk = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_hive_obelisk")},
    modifier_evo_veno_hive_obelisk
)
____exports.modifier_evo_veno_hive_obelisk = modifier_evo_veno_hive_obelisk
____exports.modifier_evo_veno_hive_obelisk_link = __TS__Class()
local modifier_evo_veno_hive_obelisk_link = ____exports.modifier_evo_veno_hive_obelisk_link
modifier_evo_veno_hive_obelisk_link.name = "modifier_evo_veno_hive_obelisk_link"
__TS__ClassExtends(modifier_evo_veno_hive_obelisk_link, BaseModifier)
function modifier_evo_veno_hive_obelisk_link.prototype.IsHidden(self)
    return true
end
function modifier_evo_veno_hive_obelisk_link.prototype.IsPurgable(self)
    return false
end
modifier_evo_veno_hive_obelisk_link = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_hive_obelisk_link")},
    modifier_evo_veno_hive_obelisk_link
)
____exports.modifier_evo_veno_hive_obelisk_link = modifier_evo_veno_hive_obelisk_link
return ____exports
