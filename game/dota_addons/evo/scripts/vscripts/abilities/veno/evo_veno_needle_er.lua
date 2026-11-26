local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 16,["25"] = 18,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 27,["40"] = 30,["41"] = 31,["42"] = 30,["43"] = 26,["44"] = 25,["45"] = 26,["47"] = 26,["48"] = 35,["49"] = 36,["50"] = 35,["51"] = 36,["53"] = 36,["54"] = 37,["55"] = 35,["56"] = 38,["57"] = 39,["58"] = 38,["59"] = 41,["60"] = 42,["61"] = 41,["62"] = 44,["63"] = 45,["64"] = 44,["65"] = 47,["66"] = 48,["67"] = 47,["68"] = 50,["69"] = 51,["70"] = 52,["71"] = 53,["72"] = 54,["74"] = 50,["75"] = 57,["76"] = 58,["77"] = 57,["78"] = 60,["79"] = 61,["80"] = 60,["81"] = 63,["82"] = 64,["83"] = 64,["84"] = 64,["85"] = 64,["86"] = 63,["87"] = 36,["88"] = 35,["89"] = 36,["91"] = 36,["92"] = 68,["93"] = 69,["94"] = 68,["95"] = 69,["96"] = 70,["97"] = 71,["98"] = 70,["99"] = 73,["100"] = 74,["101"] = 73,["102"] = 76,["103"] = 77,["104"] = 76,["105"] = 79,["106"] = 80,["107"] = 79,["108"] = 82,["109"] = 83,["110"] = 82,["111"] = 69,["112"] = 68,["113"] = 69,["115"] = 69,["116"] = 89,["117"] = 90,["118"] = 89,["119"] = 90,["121"] = 90,["122"] = 91,["123"] = 92,["124"] = 93,["125"] = 89,["126"] = 95,["127"] = 96,["128"] = 95,["129"] = 98,["130"] = 99,["131"] = 98,["132"] = 101,["133"] = 102,["134"] = 103,["135"] = 104,["136"] = 105,["137"] = 106,["138"] = 107,["140"] = 101,["141"] = 110,["142"] = 111,["143"] = 112,["144"] = 113,["145"] = 114,["147"] = 110,["148"] = 117,["149"] = 118,["150"] = 118,["151"] = 118,["152"] = 118,["153"] = 117,["154"] = 123,["155"] = 124,["156"] = 125,["157"] = 125,["159"] = 126,["160"] = 123,["161"] = 128,["162"] = 129,["165"] = 130,["166"] = 131,["167"] = 132,["168"] = 133,["171"] = 134,["174"] = 135,["177"] = 136,["180"] = 138,["181"] = 142,["182"] = 143,["183"] = 146,["184"] = 146,["185"] = 146,["186"] = 146,["187"] = 146,["188"] = 146,["189"] = 146,["190"] = 153,["191"] = 154,["192"] = 154,["193"] = 154,["194"] = 154,["195"] = 154,["196"] = 154,["197"] = 157,["198"] = 158,["199"] = 158,["200"] = 158,["201"] = 158,["204"] = 162,["205"] = 163,["206"] = 164,["207"] = 165,["208"] = 166,["209"] = 167,["210"] = 168,["211"] = 169,["212"] = 170,["213"] = 171,["214"] = 172,["215"] = 173,["217"] = 175,["219"] = 178,["220"] = 179,["221"] = 180,["222"] = 181,["223"] = 182,["224"] = 182,["225"] = 182,["226"] = 182,["227"] = 182,["228"] = 182,["229"] = 182,["230"] = 182,["231"] = 182,["232"] = 185,["233"] = 186,["234"] = 187,["235"] = 188,["236"] = 189,["237"] = 189,["238"] = 189,["239"] = 189,["240"] = 189,["241"] = 189,["242"] = 189,["243"] = 189,["244"] = 197,["245"] = 197,["246"] = 197,["247"] = 197,["248"] = 197,["249"] = 197,["250"] = 197,["251"] = 204,["255"] = 128,["256"] = 90,["257"] = 89,["258"] = 90,["260"] = 90,["261"] = 211,["262"] = 212,["263"] = 211,["264"] = 212,["265"] = 213,["266"] = 214,["269"] = 215,["270"] = 216,["271"] = 217,["272"] = 218,["273"] = 213,["274"] = 212,["275"] = 211,["276"] = 212,["278"] = 212,["279"] = 222,["280"] = 223,["281"] = 222,["282"] = 223,["284"] = 223,["285"] = 224,["286"] = 225,["287"] = 226,["288"] = 222,["289"] = 228,["290"] = 229,["291"] = 228,["292"] = 231,["293"] = 232,["294"] = 231,["295"] = 234,["296"] = 235,["297"] = 234,["298"] = 237,["299"] = 238,["300"] = 237,["301"] = 240,["302"] = 241,["303"] = 242,["304"] = 243,["305"] = 244,["306"] = 245,["307"] = 246,["308"] = 247,["309"] = 248,["311"] = 240,["312"] = 251,["313"] = 252,["314"] = 251,["315"] = 256,["316"] = 257,["317"] = 257,["318"] = 257,["319"] = 257,["320"] = 257,["321"] = 256,["322"] = 263,["323"] = 264,["324"] = 263,["325"] = 266,["326"] = 267,["327"] = 266,["328"] = 269,["329"] = 270,["332"] = 271,["333"] = 272,["334"] = 273,["337"] = 275,["338"] = 276,["339"] = 276,["340"] = 276,["341"] = 276,["342"] = 276,["343"] = 276,["344"] = 277,["347"] = 279,["348"] = 280,["349"] = 281,["350"] = 282,["353"] = 285,["356"] = 287,["357"] = 288,["358"] = 289,["359"] = 289,["360"] = 289,["361"] = 289,["362"] = 289,["363"] = 289,["364"] = 289,["365"] = 289,["366"] = 297,["367"] = 297,["368"] = 297,["369"] = 297,["370"] = 297,["371"] = 297,["372"] = 297,["373"] = 304,["374"] = 305,["375"] = 269,["376"] = 223,["377"] = 222,["378"] = 223,["380"] = 223});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_veno_shared = require("abilities.veno.evo_veno_shared")
local applyVenoChitinShard = ____evo_veno_shared.applyVenoChitinShard
local findVenoEnemies = ____evo_veno_shared.findVenoEnemies
local getVenoAgi = ____evo_veno_shared.getVenoAgi
local getVenoBranchMaxLevel = ____evo_veno_shared.getVenoBranchMaxLevel
local getVenoTier = ____evo_veno_shared.getVenoTier
require("abilities.veno.evo_veno_debuffs")
local SCRIPT_PATH = "abilities/veno/evo_veno_needle_er"
LinkLuaModifier("modifier_evo_veno_needle_e_passive", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_needle_e_as", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_needle_e_root", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_needle_r", SCRIPT_PATH, 0)
____exports.evo_veno_needle_e = __TS__Class()
local evo_veno_needle_e = ____exports.evo_veno_needle_e
evo_veno_needle_e.name = "evo_veno_needle_e"
__TS__ClassExtends(evo_veno_needle_e, BaseAbility)
function evo_veno_needle_e.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_needle_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_veno_needle_e_passive"
end
evo_veno_needle_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_e")},
    evo_veno_needle_e
)
____exports.evo_veno_needle_e = evo_veno_needle_e
____exports.modifier_evo_veno_needle_e_as = __TS__Class()
local modifier_evo_veno_needle_e_as = ____exports.modifier_evo_veno_needle_e_as
modifier_evo_veno_needle_e_as.name = "modifier_evo_veno_needle_e_as"
__TS__ClassExtends(modifier_evo_veno_needle_e_as, BaseModifier)
function modifier_evo_veno_needle_e_as.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.asPerStack = 15
end
function modifier_evo_veno_needle_e_as.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_needle_e_as.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_needle_e_as.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_needle_e_as.prototype.GetTexture(self)
    return "viper_nethertoxin"
end
function modifier_evo_veno_needle_e_as.prototype.OnCreated(self)
    self.asPerStack = 15
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.asPerStack = ab:GetSpecialValueFor("as_per_stack")
    end
end
function modifier_evo_veno_needle_e_as.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_veno_needle_e_as.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")}
end
function modifier_evo_veno_needle_e_as.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.asPerStack * math.max(
        1,
        self:GetStackCount()
    )
end
modifier_evo_veno_needle_e_as = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_e_as")},
    modifier_evo_veno_needle_e_as
)
____exports.modifier_evo_veno_needle_e_as = modifier_evo_veno_needle_e_as
____exports.modifier_evo_veno_needle_e_root = __TS__Class()
local modifier_evo_veno_needle_e_root = ____exports.modifier_evo_veno_needle_e_root
modifier_evo_veno_needle_e_root.name = "modifier_evo_veno_needle_e_root"
__TS__ClassExtends(modifier_evo_veno_needle_e_root, BaseModifier)
function modifier_evo_veno_needle_e_root.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_needle_e_root.prototype.IsDebuff(self)
    return true
end
function modifier_evo_veno_needle_e_root.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_needle_e_root.prototype.GetTexture(self)
    return "viper_nethertoxin"
end
function modifier_evo_veno_needle_e_root.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_veno_needle_e_root = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_e_root")},
    modifier_evo_veno_needle_e_root
)
____exports.modifier_evo_veno_needle_e_root = modifier_evo_veno_needle_e_root
____exports.modifier_evo_veno_needle_e_passive = __TS__Class()
local modifier_evo_veno_needle_e_passive = ____exports.modifier_evo_veno_needle_e_passive
modifier_evo_veno_needle_e_passive.name = "modifier_evo_veno_needle_e_passive"
__TS__ClassExtends(modifier_evo_veno_needle_e_passive, BaseModifier)
function modifier_evo_veno_needle_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusRange = 75
    self.rootTracking = __TS__New(Map)
    self.splitGuard = false
end
function modifier_evo_veno_needle_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_veno_needle_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_needle_e_passive.prototype.OnCreated(self)
    self.bonusRange = 75
    self.rootTracking = __TS__New(Map)
    self.splitGuard = false
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
    end
end
function modifier_evo_veno_needle_e_passive.prototype.OnRefresh(self)
    self.bonusRange = 75
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
    end
end
function modifier_evo_veno_needle_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_veno_needle_e_passive.prototype.GetModifierAttackRangeBonus(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    return self.bonusRange
end
function modifier_evo_veno_needle_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    local isSlowed = target:HasModifier("modifier_evo_veno_needle_q_slow") or target:HasModifier("modifier_evo_veno_glands_slow") or target:HasModifier("modifier_evo_veno_chitin_shard")
    if isSlowed then
        local bonusDmg = ab:GetSpecialValueFor("slow_bonus_dmg") + getVenoAgi(nil, parent) * ab:GetSpecialValueFor("slow_agi_pct") / 100
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ab,
            damage = bonusDmg,
            damage_type = 1
        })
        local maxStacks = ab:GetSpecialValueFor("max_as_stacks")
        local asMod = parent:AddNewModifier(
            parent,
            ab,
            "modifier_evo_veno_needle_e_as",
            {duration = ab:GetSpecialValueFor("as_duration")}
        )
        if asMod ~= nil and asMod:GetStackCount() < maxStacks then
            asMod:SetStackCount(math.min(
                maxStacks,
                asMod:GetStackCount() + 1
            ))
        end
    end
    local tier = getVenoTier(nil, parent)
    if tier >= 3 and target:IsRealHero() then
        local eIdx = target:GetEntityIndex()
        local entry = self.rootTracking:get(eIdx) or ({hits = 0, lastRoot = -999})
        entry.hits = entry.hits + 1
        local now = GameRules:GetGameTime()
        local icd = ab:GetSpecialValueFor("root_icd")
        if entry.hits >= 4 and now - entry.lastRoot >= icd then
            entry.hits = 0
            entry.lastRoot = now
            local rootDur = tier >= 4 and 1.2 or 0.9
            target:AddNewModifier(parent, ab, "modifier_evo_veno_needle_e_root", {duration = rootDur})
        end
        self.rootTracking:set(eIdx, entry)
    end
    if tier >= 4 and not self.splitGuard then
        local chance = ab:GetSpecialValueFor("split_chance")
        if RandomFloat(0, 100) <= chance then
            local splitRadius = ab:GetSpecialValueFor("split_radius")
            local candidates = __TS__ArrayFilter(
                findVenoEnemies(
                    nil,
                    parent,
                    target:GetAbsOrigin(),
                    splitRadius
                ),
                function(____, u) return u and not u:IsNull() and u:IsAlive() and u ~= target end
            )
            if #candidates > 0 then
                local secondary = candidates[1]
                local splitDmg = event.damage * ab:GetSpecialValueFor("split_dmg_pct") / 100
                self.splitGuard = true
                ProjectileManager:CreateTrackingProjectile({
                    Target = secondary,
                    Source = parent,
                    Ability = ab,
                    EffectName = "particles/units/heroes/hero_venomancer/venomancer_base_attack.vpcf",
                    iMoveSpeed = 1200,
                    bDodgeable = true
                })
                ApplyDamage({
                    victim = secondary,
                    attacker = parent,
                    ability = ab,
                    damage = splitDmg,
                    damage_type = 1
                })
                self.splitGuard = false
            end
        end
    end
end
modifier_evo_veno_needle_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_e_passive")},
    modifier_evo_veno_needle_e_passive
)
____exports.modifier_evo_veno_needle_e_passive = modifier_evo_veno_needle_e_passive
____exports.evo_veno_needle_r = __TS__Class()
local evo_veno_needle_r = ____exports.evo_veno_needle_r
evo_veno_needle_r.name = "evo_veno_needle_r"
__TS__ClassExtends(evo_veno_needle_r, BaseAbility)
function evo_veno_needle_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Venomancer.PoisonNova")
    caster:AddNewModifier(caster, self, "modifier_evo_veno_needle_r", {duration = dur})
end
evo_veno_needle_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_needle_r")},
    evo_veno_needle_r
)
____exports.evo_veno_needle_r = evo_veno_needle_r
____exports.modifier_evo_veno_needle_r = __TS__Class()
local modifier_evo_veno_needle_r = ____exports.modifier_evo_veno_needle_r
modifier_evo_veno_needle_r.name = "modifier_evo_veno_needle_r"
__TS__ClassExtends(modifier_evo_veno_needle_r, BaseModifier)
function modifier_evo_veno_needle_r.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusRange = 175
    self.agiBonus = 0
    self.homingGuard = false
end
function modifier_evo_veno_needle_r.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_needle_r.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_needle_r.prototype.IsPurgable(self)
    return false
end
function modifier_evo_veno_needle_r.prototype.GetTexture(self)
    return "venomancer_noxious_plague"
end
function modifier_evo_veno_needle_r.prototype.OnCreated(self)
    self.bonusRange = 175
    self.agiBonus = 0
    self.homingGuard = false
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if ab and not ab:IsNull() and parent and not parent:IsNull() then
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
        self.agiBonus = math.floor(getVenoAgi(nil, parent) * ab:GetSpecialValueFor("agi_bonus_pct") / 100 + 0.5)
    end
end
function modifier_evo_veno_needle_r.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_CANNOT_MISS")] = true}
end
function modifier_evo_veno_needle_r.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_veno_needle_r.prototype.GetModifierAttackRangeBonus(self)
    return self.bonusRange
end
function modifier_evo_veno_needle_r.prototype.GetModifierBonusStats_Agility(self)
    return self.agiBonus
end
function modifier_evo_veno_needle_r.prototype.OnAttackLanded(self, event)
    if not IsServer() or self.homingGuard then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
        return
    end
    local homingRadius = ab:GetSpecialValueFor("homing_radius")
    local candidates = findVenoEnemies(
        nil,
        parent,
        parent:GetAbsOrigin(),
        homingRadius
    )
    if #candidates == 0 then
        return
    end
    local lowest = candidates[1]
    for ____, u in ipairs(candidates) do
        if u and not u:IsNull() and u:IsAlive() and u:GetHealth() < lowest:GetHealth() then
            lowest = u
        end
    end
    if not lowest or lowest:IsNull() or not lowest:IsAlive() then
        return
    end
    local dmg = parent:GetAverageTrueAttackDamage(lowest) * ab:GetSpecialValueFor("homing_dmg_pct") / 100
    self.homingGuard = true
    ProjectileManager:CreateTrackingProjectile({
        Target = lowest,
        Source = parent,
        Ability = ab,
        EffectName = "particles/units/heroes/hero_venomancer/venomancer_latent_poison_projectile.vpcf",
        iMoveSpeed = 1400,
        bDodgeable = true
    })
    ApplyDamage({
        victim = lowest,
        attacker = parent,
        ability = ab,
        damage = dmg,
        damage_type = 1
    })
    applyVenoChitinShard(nil, parent, lowest, ab)
    self.homingGuard = false
end
modifier_evo_veno_needle_r = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_needle_r")},
    modifier_evo_veno_needle_r
)
____exports.modifier_evo_veno_needle_r = modifier_evo_veno_needle_r
return ____exports
