local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 10,["17"] = 12,["18"] = 13,["19"] = 15,["20"] = 16,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["27"] = 19,["28"] = 20,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 27,["36"] = 28,["37"] = 33,["38"] = 34,["39"] = 36,["40"] = 38,["41"] = 38,["42"] = 38,["43"] = 38,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 50,["53"] = 51,["54"] = 51,["56"] = 52,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 60,["65"] = 61,["70"] = 17,["71"] = 16,["72"] = 15,["73"] = 16,["75"] = 16,["76"] = 69,["77"] = 70,["78"] = 69,["79"] = 70,["81"] = 70,["82"] = 71,["83"] = 69,["84"] = 73,["85"] = 74,["86"] = 73,["87"] = 76,["88"] = 77,["89"] = 76,["90"] = 79,["91"] = 80,["92"] = 79,["93"] = 82,["94"] = 83,["95"] = 82,["96"] = 85,["97"] = 86,["98"] = 87,["99"] = 85,["100"] = 89,["101"] = 90,["102"] = 89,["103"] = 92,["104"] = 93,["105"] = 92,["106"] = 95,["107"] = 96,["108"] = 95,["109"] = 70,["110"] = 69,["111"] = 70,["113"] = 70,["114"] = 100,["115"] = 101,["116"] = 100,["117"] = 101,["118"] = 102,["119"] = 103,["122"] = 104,["123"] = 105,["126"] = 107,["127"] = 108,["128"] = 109,["129"] = 102,["130"] = 101,["131"] = 100,["132"] = 101,["134"] = 101,["135"] = 113,["136"] = 114,["137"] = 113,["138"] = 114,["140"] = 114,["141"] = 115,["142"] = 116,["143"] = 117,["144"] = 118,["145"] = 119,["146"] = 113,["147"] = 121,["148"] = 122,["149"] = 121,["150"] = 124,["151"] = 125,["152"] = 124,["153"] = 127,["154"] = 128,["155"] = 127,["156"] = 130,["157"] = 131,["158"] = 130,["159"] = 133,["160"] = 134,["161"] = 133,["162"] = 136,["163"] = 137,["164"] = 136,["165"] = 139,["166"] = 140,["167"] = 141,["168"] = 142,["169"] = 143,["170"] = 144,["171"] = 145,["172"] = 146,["174"] = 148,["175"] = 149,["176"] = 150,["177"] = 151,["178"] = 152,["180"] = 139,["181"] = 155,["182"] = 156,["183"] = 155,["184"] = 158,["185"] = 159,["186"] = 159,["187"] = 159,["188"] = 159,["189"] = 159,["190"] = 159,["191"] = 158,["192"] = 166,["193"] = 167,["194"] = 166,["195"] = 169,["196"] = 170,["197"] = 169,["198"] = 172,["199"] = 173,["202"] = 174,["203"] = 175,["206"] = 176,["209"] = 178,["210"] = 179,["213"] = 180,["216"] = 182,["217"] = 182,["218"] = 182,["219"] = 182,["220"] = 182,["221"] = 182,["222"] = 182,["223"] = 172,["224"] = 190,["225"] = 191,["228"] = 192,["229"] = 193,["232"] = 194,["235"] = 195,["238"] = 197,["239"] = 197,["240"] = 197,["241"] = 197,["242"] = 198,["243"] = 200,["244"] = 205,["245"] = 190,["246"] = 114,["247"] = 113,["248"] = 114,["250"] = 114});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local SCRIPT_PATH = "abilities/wisp/evo_wisp_t0"
LinkLuaModifier("modifier_evo_wisp_pulse_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_wisp_surge", SCRIPT_PATH, 0)
____exports.evo_wisp_pulse = __TS__Class()
local evo_wisp_pulse = ____exports.evo_wisp_pulse
evo_wisp_pulse.name = "evo_wisp_pulse"
__TS__ClassExtends(evo_wisp_pulse, BaseAbility)
function evo_wisp_pulse.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local radius = self:GetSpecialValueFor("radius")
    local heroDamage = self:GetSpecialValueFor("damage")
    local creepDamage = self:GetSpecialValueFor("creep_damage")
    local slowDuration = self:GetSpecialValueFor("slow_duration")
    local origin = caster:GetAbsOrigin()
    local fx = ParticleManager:CreateParticle("particles/units/heroes/hero_wisp/wisp_guardian_explosion.vpcf", 8, nil)
    ParticleManager:SetParticleControl(fx, 0, origin)
    ParticleManager:ReleaseParticleIndex(fx)
    EmitSoundOn("Hero_Wisp.Spirits.Target", caster)
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue5
            end
            local dmg = isEvoCreepUnit(nil, enemy) and creepDamage or heroDamage
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = dmg,
                damage_type = 2
            })
            if enemy:IsAlive() then
                enemy:AddNewModifier(caster, self, "modifier_evo_wisp_pulse_slow", {duration = slowDuration})
            end
        end
        ::__continue5::
    end
end
evo_wisp_pulse = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_wisp_pulse")},
    evo_wisp_pulse
)
____exports.evo_wisp_pulse = evo_wisp_pulse
____exports.modifier_evo_wisp_pulse_slow = __TS__Class()
local modifier_evo_wisp_pulse_slow = ____exports.modifier_evo_wisp_pulse_slow
modifier_evo_wisp_pulse_slow.name = "modifier_evo_wisp_pulse_slow"
__TS__ClassExtends(modifier_evo_wisp_pulse_slow, BaseModifier)
function modifier_evo_wisp_pulse_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 20
end
function modifier_evo_wisp_pulse_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_wisp_pulse_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_wisp_pulse_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_wisp_pulse_slow.prototype.GetTexture(self)
    return "wisp_spirits"
end
function modifier_evo_wisp_pulse_slow.prototype.OnCreated(self)
    local ability = self:GetAbility()
    self.slowPct = ability and not ability:IsNull() and ability:GetSpecialValueFor("slow_pct") or 20
end
function modifier_evo_wisp_pulse_slow.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_wisp_pulse_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_wisp_pulse_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -(self.slowPct or 20)
end
modifier_evo_wisp_pulse_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_wisp_pulse_slow")},
    modifier_evo_wisp_pulse_slow
)
____exports.modifier_evo_wisp_pulse_slow = modifier_evo_wisp_pulse_slow
____exports.evo_wisp_surge = __TS__Class()
local evo_wisp_surge = ____exports.evo_wisp_surge
evo_wisp_surge.name = "evo_wisp_surge"
__TS__ClassExtends(evo_wisp_surge, BaseAbility)
function evo_wisp_surge.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local duration = self:GetSpecialValueFor("duration")
    caster:AddNewModifier(caster, self, "modifier_evo_wisp_surge", {duration = duration})
    EmitSoundOn("Hero_Wisp.Overcharge", caster)
end
evo_wisp_surge = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_wisp_surge")},
    evo_wisp_surge
)
____exports.evo_wisp_surge = evo_wisp_surge
____exports.modifier_evo_wisp_surge = __TS__Class()
local modifier_evo_wisp_surge = ____exports.modifier_evo_wisp_surge
modifier_evo_wisp_surge.name = "modifier_evo_wisp_surge"
__TS__ClassExtends(modifier_evo_wisp_surge, BaseModifier)
function modifier_evo_wisp_surge.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusMsPct = 25
    self.bonusAs = 70
    self.bonusCreepDmg = 25
    self.killHeal = 35
    self.killMana = 15
end
function modifier_evo_wisp_surge.prototype.IsHidden(self)
    return false
end
function modifier_evo_wisp_surge.prototype.IsDebuff(self)
    return false
end
function modifier_evo_wisp_surge.prototype.IsPurgable(self)
    return true
end
function modifier_evo_wisp_surge.prototype.GetTexture(self)
    return "wisp_overcharge"
end
function modifier_evo_wisp_surge.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_wisp/wisp_overcharge.vpcf"
end
function modifier_evo_wisp_surge.prototype.GetEffectAttachType(self)
    return 1
end
function modifier_evo_wisp_surge.prototype.OnCreated(self)
    local ability = self:GetAbility()
    if ability and not ability:IsNull() then
        self.bonusMsPct = ability:GetSpecialValueFor("bonus_ms_pct")
        self.bonusAs = ability:GetSpecialValueFor("bonus_attack_speed")
        self.bonusCreepDmg = ability:GetSpecialValueFor("bonus_creep_damage")
        self.killHeal = ability:GetSpecialValueFor("kill_heal")
        self.killMana = ability:GetSpecialValueFor("kill_mana")
    else
        self.bonusMsPct = 25
        self.bonusAs = 70
        self.bonusCreepDmg = 25
        self.killHeal = 35
        self.killMana = 15
    end
end
function modifier_evo_wisp_surge.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_wisp_surge.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")
    }
end
function modifier_evo_wisp_surge.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.bonusMsPct or 25
end
function modifier_evo_wisp_surge.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonusAs or 70
end
function modifier_evo_wisp_surge.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if not isEvoCreepUnit(nil, target) then
        return
    end
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = self:GetAbility(),
        damage = self.bonusCreepDmg or 25,
        damage_type = 2
    })
end
function modifier_evo_wisp_surge.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if event.attacker ~= parent or event.unit == parent then
        return
    end
    if not event.unit or event.unit:IsNull() then
        return
    end
    parent:Heal(
        self.killHeal or 35,
        self:GetAbility()
    )
    parent:GiveMana(self.killMana or 15)
    local fx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", 1, parent)
    ParticleManager:ReleaseParticleIndex(fx)
end
modifier_evo_wisp_surge = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_wisp_surge")},
    modifier_evo_wisp_surge
)
____exports.modifier_evo_wisp_surge = modifier_evo_wisp_surge
return ____exports
