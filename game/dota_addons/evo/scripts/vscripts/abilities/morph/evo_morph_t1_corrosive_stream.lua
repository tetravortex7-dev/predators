local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 11,["16"] = 13,["17"] = 14,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 16,["24"] = 17,["25"] = 18,["26"] = 19,["29"] = 20,["32"] = 22,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 15,["44"] = 36,["45"] = 37,["46"] = 37,["48"] = 38,["49"] = 38,["51"] = 39,["52"] = 40,["53"] = 40,["55"] = 42,["56"] = 42,["58"] = 44,["59"] = 45,["60"] = 46,["61"] = 47,["62"] = 48,["63"] = 49,["64"] = 51,["65"] = 52,["66"] = 53,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 54,["73"] = 56,["74"] = 58,["75"] = 59,["76"] = 59,["77"] = 59,["78"] = 59,["79"] = 59,["80"] = 59,["81"] = 59,["82"] = 66,["83"] = 70,["84"] = 70,["85"] = 70,["86"] = 70,["87"] = 70,["88"] = 70,["89"] = 70,["90"] = 70,["91"] = 70,["92"] = 70,["93"] = 70,["94"] = 82,["95"] = 83,["96"] = 84,["98"] = 85,["101"] = 86,["102"] = 86,["104"] = 87,["105"] = 87,["107"] = 88,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 90,["113"] = 90,["114"] = 90,["115"] = 97,["119"] = 102,["120"] = 36,["121"] = 14,["122"] = 13,["123"] = 14,["125"] = 14,["126"] = 106,["127"] = 107,["128"] = 106,["129"] = 107,["130"] = 108,["131"] = 109,["132"] = 108,["133"] = 111,["134"] = 112,["135"] = 111,["136"] = 114,["137"] = 115,["138"] = 114,["139"] = 117,["140"] = 118,["141"] = 117,["142"] = 120,["143"] = 121,["144"] = 120,["145"] = 123,["146"] = 124,["147"] = 125,["148"] = 126,["149"] = 123,["150"] = 107,["151"] = 106,["152"] = 107,["154"] = 107});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_t1_corrosive_stream"
LinkLuaModifier("modifier_evo_morph_t1_corrosive_armor", SCRIPT_PATH, 0)
____exports.evo_morph_t1_corrosive_stream = __TS__Class()
local evo_morph_t1_corrosive_stream = ____exports.evo_morph_t1_corrosive_stream
evo_morph_t1_corrosive_stream.name = "evo_morph_t1_corrosive_stream"
__TS__ClassExtends(evo_morph_t1_corrosive_stream, BaseAbility)
function evo_morph_t1_corrosive_stream.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) then
        return
    end
    caster:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast")
    ProjectileManager:CreateTrackingProjectile({
        Target = target,
        Source = caster,
        Ability = self,
        EffectName = "particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf",
        iMoveSpeed = 1150,
        bDodgeable = true,
        bProvidesVision = false,
        iSourceAttachment = 1
    })
end
function evo_morph_t1_corrosive_stream.prototype.OnProjectileHit(self, target, _location)
    if not IsServer() then
        return true
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return true
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return true
    end
    if target:TriggerSpellAbsorb(self) then
        return true
    end
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_damage_pct") / 100
    local splashPct = self:GetSpecialValueFor("splash_pct") / 100
    local splashCount = self:GetSpecialValueFor("splash_targets")
    local splashRadius = self:GetSpecialValueFor("splash_radius")
    local armorDuration = self:GetSpecialValueFor("armor_duration")
    local highestAttr = 0
    if caster:IsRealHero() then
        local hero = caster
        highestAttr = math.max(
            hero:GetStrength(),
            hero:GetAgility(),
            hero:GetIntellect(false)
        )
    end
    local primaryDamage = baseDmg + highestAttr * attrPct
    target:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target")
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = primaryDamage,
        damage_type = 2
    })
    target:AddNewModifier(caster, self, "modifier_evo_morph_t1_corrosive_armor", {duration = armorDuration})
    local nearby = FindUnitsInRadius(
        caster:GetTeamNumber(),
        target:GetAbsOrigin(),
        nil,
        splashRadius,
        2,
        1 + 18,
        0,
        1,
        false
    )
    local splashed = 0
    local splashDamage = primaryDamage * splashPct
    for ____, enemy in ipairs(nearby) do
        do
            if splashed >= splashCount then
                break
            end
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue12
            end
            if enemy == target then
                goto __continue12
            end
            splashed = splashed + 1
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = splashDamage,
                damage_type = 2
            })
            enemy:AddNewModifier(caster, self, "modifier_evo_morph_t1_corrosive_armor", {duration = armorDuration})
        end
        ::__continue12::
    end
    return true
end
evo_morph_t1_corrosive_stream = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_t1_corrosive_stream")},
    evo_morph_t1_corrosive_stream
)
____exports.evo_morph_t1_corrosive_stream = evo_morph_t1_corrosive_stream
____exports.modifier_evo_morph_t1_corrosive_armor = __TS__Class()
local modifier_evo_morph_t1_corrosive_armor = ____exports.modifier_evo_morph_t1_corrosive_armor
modifier_evo_morph_t1_corrosive_armor.name = "modifier_evo_morph_t1_corrosive_armor"
__TS__ClassExtends(modifier_evo_morph_t1_corrosive_armor, BaseModifier)
function modifier_evo_morph_t1_corrosive_armor.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_t1_corrosive_armor.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_t1_corrosive_armor.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_t1_corrosive_armor.prototype.GetTexture(self)
    return "morphling_adaptive_strike_agi"
end
function modifier_evo_morph_t1_corrosive_armor.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_morph_t1_corrosive_armor.prototype.GetModifierPhysicalArmorBonus(self)
    local ability = self:GetAbility()
    local shred = ability and ability:GetSpecialValueFor("armor_reduction") or 2
    return -shred
end
modifier_evo_morph_t1_corrosive_armor = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_t1_corrosive_armor")},
    modifier_evo_morph_t1_corrosive_armor
)
____exports.modifier_evo_morph_t1_corrosive_armor = modifier_evo_morph_t1_corrosive_armor
return ____exports
