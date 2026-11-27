local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 18,["23"] = 20,["24"] = 21,["25"] = 23,["26"] = 24,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 26,["31"] = 25,["32"] = 24,["33"] = 23,["34"] = 24,["36"] = 24,["37"] = 30,["38"] = 31,["39"] = 30,["40"] = 31,["41"] = 31,["42"] = 30,["43"] = 31,["45"] = 31,["46"] = 33,["47"] = 34,["48"] = 33,["49"] = 34,["50"] = 34,["51"] = 33,["52"] = 34,["54"] = 34,["55"] = 36,["56"] = 37,["57"] = 36,["58"] = 37,["59"] = 38,["60"] = 39,["61"] = 38,["62"] = 41,["63"] = 42,["64"] = 41,["65"] = 44,["66"] = 45,["67"] = 44,["68"] = 47,["69"] = 48,["70"] = 47,["71"] = 50,["72"] = 51,["73"] = 50,["74"] = 53,["75"] = 54,["76"] = 53,["77"] = 56,["78"] = 57,["81"] = 58,["82"] = 59,["83"] = 60,["86"] = 61,["87"] = 61,["88"] = 61,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["93"] = 56,["94"] = 37,["95"] = 36,["96"] = 37,["98"] = 37,["99"] = 65,["100"] = 66,["101"] = 65,["102"] = 66,["103"] = 67,["104"] = 68,["105"] = 68,["106"] = 68,["107"] = 68,["108"] = 67,["109"] = 70,["110"] = 71,["113"] = 72,["114"] = 73,["115"] = 74,["116"] = 75,["117"] = 76,["118"] = 80,["119"] = 81,["121"] = 70,["122"] = 66,["123"] = 65,["124"] = 66,["126"] = 66,["127"] = 86,["128"] = 87,["129"] = 86,["130"] = 87,["132"] = 87,["133"] = 88,["134"] = 89,["135"] = 90,["136"] = 91,["137"] = 86,["138"] = 93,["139"] = 94,["140"] = 93,["141"] = 96,["142"] = 97,["143"] = 96,["144"] = 99,["145"] = 100,["146"] = 99,["147"] = 102,["148"] = 103,["149"] = 102,["150"] = 105,["151"] = 106,["152"] = 107,["153"] = 108,["154"] = 109,["155"] = 110,["156"] = 111,["157"] = 112,["158"] = 113,["159"] = 114,["160"] = 115,["162"] = 118,["163"] = 119,["165"] = 105,["166"] = 122,["167"] = 123,["168"] = 122,["169"] = 125,["170"] = 126,["171"] = 127,["172"] = 128,["174"] = 132,["175"] = 125,["176"] = 134,["177"] = 135,["178"] = 135,["179"] = 135,["180"] = 135,["181"] = 135,["182"] = 135,["183"] = 135,["184"] = 134,["185"] = 143,["186"] = 144,["187"] = 143,["188"] = 146,["189"] = 147,["190"] = 146,["191"] = 149,["192"] = 150,["193"] = 149,["194"] = 152,["195"] = 153,["196"] = 152,["197"] = 155,["198"] = 156,["201"] = 157,["202"] = 158,["203"] = 159,["204"] = 160,["207"] = 161,["210"] = 162,["213"] = 164,["214"] = 165,["215"] = 170,["216"] = 172,["217"] = 173,["218"] = 174,["219"] = 175,["220"] = 175,["221"] = 175,["222"] = 175,["223"] = 175,["224"] = 175,["226"] = 176,["227"] = 176,["229"] = 177,["230"] = 177,["231"] = 177,["232"] = 177,["233"] = 177,["234"] = 177,["235"] = 177,["239"] = 185,["240"] = 185,["241"] = 185,["242"] = 185,["243"] = 186,["244"] = 187,["245"] = 188,["248"] = 192,["249"] = 193,["250"] = 194,["251"] = 194,["252"] = 194,["253"] = 194,["254"] = 194,["255"] = 194,["256"] = 197,["257"] = 198,["258"] = 199,["259"] = 200,["260"] = 201,["261"] = 202,["262"] = 203,["263"] = 204,["264"] = 204,["269"] = 209,["270"] = 210,["271"] = 211,["272"] = 212,["275"] = 155,["276"] = 87,["277"] = 86,["278"] = 87,["280"] = 87,["281"] = 218,["282"] = 219,["283"] = 218,["284"] = 219,["285"] = 219,["286"] = 218,["287"] = 219,["289"] = 219,["290"] = 221,["291"] = 222,["292"] = 221,["293"] = 222,["294"] = 222,["295"] = 221,["296"] = 222,["298"] = 222});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local findMirrorQAbility = ____evo_spectre_shared.findMirrorQAbility
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreInt = ____evo_spectre_shared.getSpectreInt
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
local triggerAstralInversionReflect = ____evo_spectre_shared.triggerAstralInversionReflect
local SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror"
LinkLuaModifier("modifier_evo_spectre_mirror_inversion", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_w_buff", SCRIPT_PATH, 0)
____exports.evo_spectre_mirror_inversion = __TS__Class()
local evo_spectre_mirror_inversion = ____exports.evo_spectre_mirror_inversion
evo_spectre_mirror_inversion.name = "evo_spectre_mirror_inversion"
__TS__ClassExtends(evo_spectre_mirror_inversion, BaseAbility)
function evo_spectre_mirror_inversion.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_spectre_mirror_inversion"
end
evo_spectre_mirror_inversion = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion")},
    evo_spectre_mirror_inversion
)
____exports.evo_spectre_mirror_inversion = evo_spectre_mirror_inversion
____exports.evo_spectre_mirror_inversion_t3 = __TS__Class()
local evo_spectre_mirror_inversion_t3 = ____exports.evo_spectre_mirror_inversion_t3
evo_spectre_mirror_inversion_t3.name = "evo_spectre_mirror_inversion_t3"
__TS__ClassExtends(evo_spectre_mirror_inversion_t3, ____exports.evo_spectre_mirror_inversion)
evo_spectre_mirror_inversion_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion_t3")},
    evo_spectre_mirror_inversion_t3
)
____exports.evo_spectre_mirror_inversion_t3 = evo_spectre_mirror_inversion_t3
____exports.evo_spectre_mirror_inversion_t4 = __TS__Class()
local evo_spectre_mirror_inversion_t4 = ____exports.evo_spectre_mirror_inversion_t4
evo_spectre_mirror_inversion_t4.name = "evo_spectre_mirror_inversion_t4"
__TS__ClassExtends(evo_spectre_mirror_inversion_t4, ____exports.evo_spectre_mirror_inversion)
evo_spectre_mirror_inversion_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion_t4")},
    evo_spectre_mirror_inversion_t4
)
____exports.evo_spectre_mirror_inversion_t4 = evo_spectre_mirror_inversion_t4
____exports.modifier_evo_spectre_mirror_inversion = __TS__Class()
local modifier_evo_spectre_mirror_inversion = ____exports.modifier_evo_spectre_mirror_inversion
modifier_evo_spectre_mirror_inversion.name = "modifier_evo_spectre_mirror_inversion"
__TS__ClassExtends(modifier_evo_spectre_mirror_inversion, BaseModifier)
function modifier_evo_spectre_mirror_inversion.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.GetTexture(self)
    return "evo_spectre_mirror_inversion"
end
function modifier_evo_spectre_mirror_inversion.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")}
end
function modifier_evo_spectre_mirror_inversion.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or parent:PassivesDisabled() then
        return
    end
    triggerAstralInversionReflect(
        nil,
        parent,
        parent,
        ab,
        event
    )
end
modifier_evo_spectre_mirror_inversion = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_inversion")},
    modifier_evo_spectre_mirror_inversion
)
____exports.modifier_evo_spectre_mirror_inversion = modifier_evo_spectre_mirror_inversion
____exports.evo_spectre_mirror_w = __TS__Class()
local evo_spectre_mirror_w = ____exports.evo_spectre_mirror_w
evo_spectre_mirror_w.name = "evo_spectre_mirror_w"
__TS__ClassExtends(evo_spectre_mirror_w, BaseAbility)
function evo_spectre_mirror_w.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_mirror_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("duration")
    local charges = getSpectreTier(nil, caster) >= 4 and 4 or self:GetSpecialValueFor("charges")
    caster:EmitSound("Hero_ObsidianDestroyer.ArcaneOrb.Impact")
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_w_buff", {duration = dur, charges = charges})
    if mod ~= nil then
        mod:SetStackCount(charges)
    end
end
evo_spectre_mirror_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_w")},
    evo_spectre_mirror_w
)
____exports.evo_spectre_mirror_w = evo_spectre_mirror_w
____exports.modifier_evo_spectre_mirror_w_buff = __TS__Class()
local modifier_evo_spectre_mirror_w_buff = ____exports.modifier_evo_spectre_mirror_w_buff
modifier_evo_spectre_mirror_w_buff.name = "modifier_evo_spectre_mirror_w_buff"
__TS__ClassExtends(modifier_evo_spectre_mirror_w_buff, BaseModifier)
function modifier_evo_spectre_mirror_w_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusAs = 50
    self.bonusRange = 125
    self.bonusDmg = 40
    self.hitSequence = 0
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetTexture(self)
    return "evo_spectre_mirror_w"
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnCreated(self, params)
    self.bonusAs = 50
    self.bonusRange = 125
    self.bonusDmg = 40
    self.hitSequence = 0
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if ab and not ab:IsNull() and parent and not parent:IsNull() then
        self.bonusAs = ab:GetSpecialValueFor("bonus_as")
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
        self.bonusDmg = ab:GetSpecialValueFor("bonus_dmg") + getSpectreInt(nil, parent) * ab:GetSpecialValueFor("int_pct") / 100
    end
    if IsServer() and params and params.charges ~= nil then
        self:SetStackCount(params.charges)
    end
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_spectre_mirror_w_buff.prototype.CheckState(self)
    local parent = self:GetParent()
    if parent and not parent:IsNull() and getSpectreTier(nil, parent) >= 3 then
        return {[dotaModifierState(nil, "MODIFIER_STATE_CANNOT_MISS")] = true}
    end
    return {}
end
function modifier_evo_spectre_mirror_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_OVERRIDE_ATTACK_MAGICAL"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonusAs
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierAttackRangeBonus(self)
    return self.bonusRange
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetOverrideAttackMagical(self)
    return 1
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierProcAttack_BonusDamage_Magical(self)
    return self.bonusDmg
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    local tier = getSpectreTier(nil, parent)
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_arcane_orb_hit.vpcf", 1, target)
    ParticleManager:ReleaseParticleIndex(pfx)
    if tier >= 3 then
        local cleaveRadius = ab:GetSpecialValueFor("cleave_radius")
        local cleaveDmg = (event.damage + self.bonusDmg) * ab:GetSpecialValueFor("cleave_pct") / 100
        for ____, other in ipairs(findSpectreEnemies(
            nil,
            parent,
            target:GetAbsOrigin(),
            cleaveRadius
        )) do
            do
                if not other or other:IsNull() or not other:IsAlive() or other == target then
                    goto __continue37
                end
                ApplyDamage({
                    victim = other,
                    attacker = parent,
                    ability = ab,
                    damage = cleaveDmg,
                    damage_type = 2
                })
            end
            ::__continue37::
        end
        local steal = math.min(
            target:GetMana(),
            ab:GetSpecialValueFor("mana_steal")
        )
        if steal > 0 then
            target:Script_ReduceMana(steal, ab)
            parent:GiveMana(steal)
        end
    end
    self.hitSequence = self.hitSequence + 1
    if tier >= 4 and self.hitSequence % 4 == 0 then
        target:AddNewModifier(
            parent,
            ab,
            "modifier_stunned",
            {duration = ab:GetSpecialValueFor("stun_duration")}
        )
        local qAb = findMirrorQAbility(nil, parent)
        local reduce = ab:GetSpecialValueFor("q_cd_reduce")
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
    if not parent:HasModifier("modifier_evo_spectre_mirror_r_aura") then
        self:DecrementStackCount()
        if self:GetStackCount() <= 0 then
            self:Destroy()
        end
    end
end
modifier_evo_spectre_mirror_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_w_buff")},
    modifier_evo_spectre_mirror_w_buff
)
____exports.modifier_evo_spectre_mirror_w_buff = modifier_evo_spectre_mirror_w_buff
____exports.evo_spectre_mirror_w_t3 = __TS__Class()
local evo_spectre_mirror_w_t3 = ____exports.evo_spectre_mirror_w_t3
evo_spectre_mirror_w_t3.name = "evo_spectre_mirror_w_t3"
__TS__ClassExtends(evo_spectre_mirror_w_t3, ____exports.evo_spectre_mirror_w)
evo_spectre_mirror_w_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_w_t3")},
    evo_spectre_mirror_w_t3
)
____exports.evo_spectre_mirror_w_t3 = evo_spectre_mirror_w_t3
____exports.evo_spectre_mirror_w_t4 = __TS__Class()
local evo_spectre_mirror_w_t4 = ____exports.evo_spectre_mirror_w_t4
evo_spectre_mirror_w_t4.name = "evo_spectre_mirror_w_t4"
__TS__ClassExtends(evo_spectre_mirror_w_t4, ____exports.evo_spectre_mirror_w)
evo_spectre_mirror_w_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_w_t4")},
    evo_spectre_mirror_w_t4
)
____exports.evo_spectre_mirror_w_t4 = evo_spectre_mirror_w_t4
return ____exports
