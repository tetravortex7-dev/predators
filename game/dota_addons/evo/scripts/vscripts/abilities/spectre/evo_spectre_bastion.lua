local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 17,["23"] = 19,["24"] = 21,["25"] = 23,["26"] = 24,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 25,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["40"] = 38,["41"] = 28,["42"] = 40,["43"] = 41,["46"] = 42,["47"] = 43,["48"] = 44,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 52,["55"] = 53,["56"] = 54,["57"] = 54,["58"] = 54,["59"] = 54,["60"] = 54,["61"] = 54,["62"] = 54,["64"] = 57,["65"] = 61,["66"] = 62,["67"] = 63,["69"] = 66,["70"] = 67,["71"] = 68,["72"] = 72,["73"] = 73,["74"] = 74,["77"] = 40,["78"] = 24,["79"] = 23,["80"] = 24,["82"] = 24,["83"] = 80,["84"] = 81,["85"] = 80,["86"] = 81,["88"] = 81,["89"] = 82,["90"] = 83,["91"] = 80,["92"] = 85,["93"] = 86,["94"] = 85,["95"] = 88,["96"] = 89,["97"] = 88,["98"] = 91,["99"] = 92,["100"] = 91,["101"] = 94,["102"] = 95,["103"] = 94,["104"] = 97,["105"] = 98,["106"] = 99,["107"] = 100,["108"] = 101,["109"] = 102,["110"] = 103,["111"] = 104,["112"] = 105,["114"] = 109,["117"] = 110,["118"] = 111,["119"] = 112,["120"] = 117,["121"] = 117,["122"] = 117,["123"] = 117,["124"] = 117,["125"] = 118,["126"] = 118,["127"] = 118,["128"] = 118,["129"] = 118,["130"] = 118,["131"] = 118,["132"] = 118,["133"] = 97,["134"] = 120,["135"] = 121,["136"] = 122,["137"] = 120,["138"] = 124,["139"] = 125,["142"] = 126,["143"] = 127,["144"] = 128,["145"] = 129,["148"] = 131,["149"] = 132,["150"] = 133,["151"] = 134,["154"] = 137,["155"] = 138,["157"] = 140,["160"] = 142,["161"] = 143,["162"] = 144,["163"] = 146,["164"] = 147,["165"] = 152,["166"] = 153,["167"] = 155,["169"] = 156,["170"] = 156,["172"] = 157,["173"] = 157,["174"] = 157,["175"] = 157,["176"] = 157,["177"] = 157,["178"] = 157,["179"] = 164,["183"] = 124,["184"] = 167,["185"] = 168,["186"] = 167,["187"] = 170,["188"] = 171,["189"] = 171,["191"] = 172,["192"] = 173,["193"] = 173,["195"] = 174,["196"] = 174,["197"] = 174,["198"] = 174,["199"] = 175,["200"] = 176,["201"] = 177,["202"] = 178,["204"] = 180,["205"] = 170,["206"] = 81,["207"] = 80,["208"] = 81,["210"] = 81,["211"] = 184,["212"] = 185,["213"] = 184,["214"] = 185,["215"] = 186,["216"] = 187,["217"] = 187,["218"] = 187,["219"] = 187,["220"] = 186,["221"] = 189,["222"] = 190,["223"] = 189,["224"] = 192,["225"] = 193,["228"] = 194,["229"] = 195,["230"] = 196,["231"] = 197,["232"] = 198,["233"] = 199,["234"] = 201,["235"] = 202,["236"] = 205,["237"] = 206,["238"] = 206,["239"] = 206,["240"] = 206,["241"] = 207,["242"] = 208,["244"] = 210,["245"] = 211,["246"] = 212,["247"] = 213,["249"] = 216,["250"] = 217,["251"] = 218,["252"] = 219,["253"] = 224,["254"] = 225,["255"] = 227,["256"] = 228,["257"] = 229,["259"] = 230,["260"] = 230,["262"] = 231,["263"] = 231,["265"] = 232,["266"] = 232,["267"] = 232,["268"] = 232,["269"] = 232,["270"] = 232,["271"] = 232,["272"] = 232,["273"] = 232,["274"] = 233,["275"] = 234,["276"] = 235,["277"] = 236,["278"] = 237,["279"] = 238,["280"] = 239,["281"] = 239,["282"] = 239,["283"] = 239,["284"] = 240,["290"] = 245,["291"] = 246,["292"] = 247,["293"] = 248,["294"] = 249,["296"] = 252,["297"] = 253,["298"] = 254,["299"] = 255,["300"] = 256,["301"] = 257,["302"] = 258,["303"] = 259,["304"] = 260,["305"] = 260,["310"] = 192,["311"] = 185,["312"] = 184,["313"] = 185,["315"] = 185});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local addBastionPassiveShield = ____evo_spectre_shared.addBastionPassiveShield
local applySpectreCreepDamage = ____evo_spectre_shared.applySpectreCreepDamage
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreStr = ____evo_spectre_shared.getSpectreStr
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
local triggerBastionBreakMs = ____evo_spectre_shared.triggerBastionBreakMs
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_bastion"
LinkLuaModifier("modifier_evo_spectre_bastion_q_shield", SCRIPT_PATH, 0)
____exports.evo_spectre_bastion_q = __TS__Class()
local evo_spectre_bastion_q = ____exports.evo_spectre_bastion_q
evo_spectre_bastion_q.name = "evo_spectre_bastion_q"
__TS__ClassExtends(evo_spectre_bastion_q, BaseAbility)
function evo_spectre_bastion_q.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_bastion_q.prototype.GetBehavior(self)
    local caster = self:GetCaster()
    if caster and not caster:IsNull() and getSpectreTier(nil, caster) >= 4 then
        return 8 + 134217728 + 2097152 + 1048576
    end
    return 8 + 134217728
end
function evo_spectre_bastion_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget() or caster
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    local tier = getSpectreTier(nil, caster)
    local dur = self:GetSpecialValueFor("duration")
    local fullShield = math.ceil(self:GetSpecialValueFor("base_shield") + getSpectreStr(nil, caster) * self:GetSpecialValueFor("str_pct") / 100)
    caster:EmitSound("Hero_Abaddon.AphoticShield.Cast")
    if tier >= 3 then
        target:Purge(
            false,
            true,
            false,
            true,
            true
        )
    end
    local mod = target:AddNewModifier(caster, self, "modifier_evo_spectre_bastion_q_shield", {duration = dur, capacity = fullShield})
    if mod then
        mod.maxCapacity = fullShield
        mod:SetStackCount(fullShield)
    end
    if tier >= 4 and target ~= caster and caster:IsAlive() then
        local copyShield = math.ceil(fullShield * self:GetSpecialValueFor("self_copy_pct") / 100)
        local selfMod = caster:AddNewModifier(caster, self, "modifier_evo_spectre_bastion_q_shield", {duration = dur, capacity = copyShield})
        if selfMod then
            selfMod.maxCapacity = copyShield
            selfMod:SetStackCount(copyShield)
        end
    end
end
evo_spectre_bastion_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_bastion_q")},
    evo_spectre_bastion_q
)
____exports.evo_spectre_bastion_q = evo_spectre_bastion_q
____exports.modifier_evo_spectre_bastion_q_shield = __TS__Class()
local modifier_evo_spectre_bastion_q_shield = ____exports.modifier_evo_spectre_bastion_q_shield
modifier_evo_spectre_bastion_q_shield.name = "modifier_evo_spectre_bastion_q_shield"
__TS__ClassExtends(modifier_evo_spectre_bastion_q_shield, BaseModifier)
function modifier_evo_spectre_bastion_q_shield.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.maxCapacity = 160
    self.suppressedBlast = false
end
function modifier_evo_spectre_bastion_q_shield.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_bastion_q_shield.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_bastion_q_shield.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_bastion_q_shield.prototype.GetTexture(self)
    return "abaddon_aphotic_shield"
end
function modifier_evo_spectre_bastion_q_shield.prototype.OnCreated(self, params)
    self.maxCapacity = 160
    self.suppressedBlast = false
    local ab = self:GetAbility()
    if params and params.capacity ~= nil then
        self.maxCapacity = params.capacity
    elseif ab and not ab:IsNull() then
        local caster = self:GetCaster() or self:GetParent()
        self.maxCapacity = math.ceil(ab:GetSpecialValueFor("base_shield") + getSpectreStr(nil, caster) * ab:GetSpecialValueFor("str_pct") / 100)
    end
    if not IsServer() then
        return
    end
    self:SetStackCount(self.maxCapacity)
    local parent = self:GetParent()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield.vpcf", 5, parent)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(75, 75, 75)
    )
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_evo_spectre_bastion_q_shield.prototype.OnRefresh(self, params)
    self.suppressedBlast = false
    self:OnCreated(params)
end
function modifier_evo_spectre_bastion_q_shield.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    if getSpectreTier(nil, caster) >= 3 and parent:IsAlive() then
        local heal = math.ceil(self.maxCapacity * ab:GetSpecialValueFor("heal_pct") / 100)
        if heal > 0 then
            parent:Heal(heal, ab)
        end
    end
    if parent == caster then
        triggerBastionBreakMs(nil, caster)
    end
    if self.suppressedBlast then
        return
    end
    local radius = ab:GetSpecialValueFor("blast_radius")
    local slowDur = ab:GetSpecialValueFor("slow_duration")
    local origin = parent:GetAbsOrigin()
    parent:EmitSound("Hero_Abaddon.AphoticShield.Destroy")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findSpectreEnemies(nil, caster, origin, radius)) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue28
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = self.maxCapacity,
                damage_type = 2
            })
            enemy:AddNewModifier(caster, ab, "modifier_evo_spectre_bastion_slow", {duration = slowDur})
        end
        ::__continue28::
    end
end
function modifier_evo_spectre_bastion_q_shield.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")}
end
function modifier_evo_spectre_bastion_q_shield.prototype.GetModifierTotal_ConstantBlock(self, event)
    if not IsServer() then
        return 0
    end
    local pool = self:GetStackCount()
    if pool <= 0 or event.damage <= 0 then
        return 0
    end
    local blocked = math.min(
        pool,
        math.ceil(event.damage)
    )
    local rem = pool - blocked
    self:SetStackCount(math.max(0, rem))
    if rem <= 0 then
        self:Destroy()
    end
    return blocked
end
modifier_evo_spectre_bastion_q_shield = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_bastion_q_shield")},
    modifier_evo_spectre_bastion_q_shield
)
____exports.modifier_evo_spectre_bastion_q_shield = modifier_evo_spectre_bastion_q_shield
____exports.evo_spectre_bastion_w = __TS__Class()
local evo_spectre_bastion_w = ____exports.evo_spectre_bastion_w
evo_spectre_bastion_w.name = "evo_spectre_bastion_w"
__TS__ClassExtends(evo_spectre_bastion_w, BaseAbility)
function evo_spectre_bastion_w.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_bastion_w.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function evo_spectre_bastion_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local tier = getSpectreTier(nil, caster)
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage") + getSpectreStr(nil, caster) * self:GetSpecialValueFor("str_pct") / 100
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local stunDur = self:GetSpecialValueFor("stun_duration")
    local detonated = 0
    local qMod = caster:FindModifierByName("modifier_evo_spectre_bastion_q_shield")
    if qMod and not qMod:IsNull() then
        detonated = detonated + math.max(
            0,
            qMod:GetStackCount()
        )
        qMod.suppressedBlast = true
        qMod:Destroy()
    end
    local eMod = caster:FindModifierByName("modifier_evo_spectre_bastion_e_passive")
    if eMod and not eMod:IsNull() and eMod:GetStackCount() > 0 then
        detonated = detonated + eMod:GetStackCount()
        eMod:SetStackCount(0)
    end
    local totalHeroDmg = baseDmg + detonated
    local origin = caster:GetAbsOrigin()
    caster:EmitSound("Hero_Abaddon.AphoticShield.Destroy")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:ReleaseParticleIndex(pfx)
    local heroHitCount = 0
    local pullDist = self:GetSpecialValueFor("pull_distance")
    for ____, enemy in ipairs(findSpectreEnemies(nil, caster, origin, radius)) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue42
            end
            if enemy:IsRealHero() then
                heroHitCount = heroHitCount + 1
            end
            applySpectreCreepDamage(
                nil,
                caster,
                enemy,
                self,
                totalHeroDmg,
                2,
                creepMult
            )
            enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = stunDur})
            if tier >= 4 then
                local delta = origin - enemy:GetAbsOrigin()
                local dist = delta:Length2D()
                if dist > 60 then
                    local step = math.min(pullDist, dist - 50)
                    local nextPos = GetGroundPosition(
                        enemy:GetAbsOrigin() + delta:Normalized() * step,
                        enemy
                    )
                    FindClearSpaceForUnit(enemy, nextPos, false)
                end
            end
        end
        ::__continue42::
    end
    if detonated > 0 then
        local refund = detonated * self:GetSpecialValueFor("refund_pct") / 100
        addBastionPassiveShield(nil, caster, refund)
    elseif tier >= 3 then
        caster:AddNewModifier(caster, self, "modifier_evo_spectre_bastion_e_surge", {duration = 2.5})
    end
    if tier >= 4 and heroHitCount > 0 then
        local qAb = caster:FindAbilityByName("evo_spectre_bastion_q")
        local reduce = self:GetSpecialValueFor("q_cd_reduce")
        if qAb and not qAb:IsNull() and reduce > 0 then
            local rem = qAb:GetCooldownTimeRemaining()
            if rem > 0 then
                qAb:EndCooldown()
                local next = rem - reduce
                if next > 0.05 then
                    qAb:StartCooldown(next)
                end
            end
        end
    end
end
evo_spectre_bastion_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_bastion_w")},
    evo_spectre_bastion_w
)
____exports.evo_spectre_bastion_w = evo_spectre_bastion_w
return ____exports
