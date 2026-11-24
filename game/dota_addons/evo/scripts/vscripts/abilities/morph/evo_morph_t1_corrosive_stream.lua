local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 11,["16"] = 12,["18"] = 15,["19"] = 16,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 18,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 22,["34"] = 24,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 17,["46"] = 38,["47"] = 39,["48"] = 39,["50"] = 40,["51"] = 40,["53"] = 41,["54"] = 42,["55"] = 42,["57"] = 44,["58"] = 44,["60"] = 46,["61"] = 47,["62"] = 48,["63"] = 49,["64"] = 50,["65"] = 51,["66"] = 53,["67"] = 54,["68"] = 55,["69"] = 56,["70"] = 56,["71"] = 56,["72"] = 56,["73"] = 56,["75"] = 58,["76"] = 60,["77"] = 61,["78"] = 61,["79"] = 61,["80"] = 61,["81"] = 61,["82"] = 61,["83"] = 61,["84"] = 68,["85"] = 72,["86"] = 72,["87"] = 72,["88"] = 72,["89"] = 72,["90"] = 72,["91"] = 72,["92"] = 72,["93"] = 72,["94"] = 72,["95"] = 72,["96"] = 84,["97"] = 85,["98"] = 86,["100"] = 87,["103"] = 88,["104"] = 88,["106"] = 89,["107"] = 89,["109"] = 90,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 92,["116"] = 92,["117"] = 99,["121"] = 104,["122"] = 38,["123"] = 16,["124"] = 15,["125"] = 16,["127"] = 16,["128"] = 108,["129"] = 109,["130"] = 108,["131"] = 109,["132"] = 110,["133"] = 111,["134"] = 110,["135"] = 113,["136"] = 114,["137"] = 113,["138"] = 116,["139"] = 117,["140"] = 116,["141"] = 119,["142"] = 120,["143"] = 119,["144"] = 122,["145"] = 123,["146"] = 122,["147"] = 125,["148"] = 126,["149"] = 127,["150"] = 128,["151"] = 125,["152"] = 109,["153"] = 108,["154"] = 109,["156"] = 109});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_t1_corrosive_stream"
if IsServer() then
    LinkLuaModifier("modifier_evo_morph_t1_corrosive_armor", SCRIPT_PATH, 0)
end
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
                goto __continue13
            end
            if enemy == target then
                goto __continue13
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
        ::__continue13::
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
