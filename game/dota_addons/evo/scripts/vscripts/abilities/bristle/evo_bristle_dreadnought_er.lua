local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 11,["21"] = 13,["22"] = 20,["23"] = 21,["25"] = 24,["26"] = 25,["27"] = 24,["28"] = 25,["29"] = 26,["30"] = 27,["31"] = 28,["33"] = 30,["34"] = 26,["35"] = 32,["36"] = 33,["37"] = 32,["38"] = 35,["39"] = 36,["42"] = 37,["43"] = 38,["46"] = 40,["47"] = 41,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 49,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 52,["62"] = 52,["63"] = 52,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 63,["69"] = 64,["70"] = 64,["72"] = 65,["73"] = 66,["74"] = 66,["75"] = 68,["76"] = 69,["77"] = 70,["79"] = 72,["80"] = 66,["81"] = 66,["82"] = 66,["86"] = 35,["87"] = 25,["88"] = 24,["89"] = 25,["91"] = 25,["92"] = 80,["93"] = 81,["94"] = 80,["95"] = 81,["96"] = 82,["97"] = 83,["98"] = 82,["99"] = 85,["100"] = 86,["101"] = 85,["102"] = 88,["103"] = 89,["104"] = 88,["105"] = 91,["106"] = 92,["107"] = 92,["108"] = 92,["109"] = 92,["110"] = 91,["111"] = 97,["112"] = 98,["113"] = 99,["114"] = 100,["115"] = 100,["117"] = 101,["118"] = 97,["119"] = 103,["120"] = 104,["123"] = 105,["124"] = 106,["125"] = 107,["128"] = 108,["131"] = 109,["134"] = 111,["135"] = 112,["138"] = 113,["141"] = 115,["142"] = 116,["143"] = 117,["144"] = 118,["145"] = 119,["146"] = 120,["147"] = 120,["148"] = 120,["149"] = 120,["150"] = 120,["151"] = 120,["152"] = 120,["153"] = 120,["156"] = 131,["157"] = 132,["159"] = 103,["160"] = 81,["161"] = 80,["162"] = 81,["164"] = 81,["165"] = 137,["166"] = 138,["167"] = 137,["168"] = 138,["169"] = 139,["170"] = 140,["171"] = 139,["172"] = 142,["173"] = 143,["174"] = 142,["175"] = 145,["176"] = 146,["177"] = 145,["178"] = 148,["179"] = 149,["180"] = 148,["181"] = 151,["182"] = 152,["183"] = 151,["184"] = 154,["185"] = 155,["186"] = 155,["188"] = 156,["189"] = 157,["190"] = 157,["192"] = 158,["193"] = 158,["194"] = 158,["195"] = 158,["196"] = 159,["197"] = 160,["198"] = 161,["200"] = 163,["202"] = 165,["203"] = 154,["204"] = 138,["205"] = 137,["206"] = 138,["208"] = 138,["209"] = 169,["210"] = 170,["211"] = 169,["212"] = 170,["213"] = 171,["214"] = 172,["215"] = 171,["216"] = 174,["217"] = 175,["218"] = 174,["219"] = 177,["220"] = 178,["221"] = 177,["222"] = 180,["223"] = 181,["224"] = 180,["225"] = 183,["226"] = 184,["227"] = 183,["228"] = 186,["229"] = 187,["230"] = 186,["231"] = 170,["232"] = 169,["233"] = 170,["235"] = 170,["236"] = 191,["237"] = 192,["238"] = 191,["239"] = 192,["240"] = 193,["241"] = 194,["244"] = 195,["245"] = 196,["248"] = 198,["249"] = 199,["250"] = 199,["251"] = 199,["252"] = 199,["253"] = 199,["254"] = 199,["255"] = 199,["256"] = 200,["257"] = 201,["258"] = 202,["259"] = 193,["260"] = 192,["261"] = 191,["262"] = 192,["264"] = 192,["265"] = 206,["266"] = 207,["267"] = 206,["268"] = 207,["270"] = 207,["271"] = 208,["272"] = 209,["273"] = 206,["274"] = 211,["275"] = 212,["276"] = 211,["277"] = 214,["278"] = 215,["279"] = 214,["280"] = 217,["281"] = 218,["282"] = 217,["283"] = 220,["284"] = 221,["285"] = 220,["286"] = 223,["287"] = 224,["290"] = 225,["291"] = 226,["292"] = 227,["293"] = 223,["294"] = 229,["295"] = 230,["298"] = 231,["299"] = 232,["300"] = 233,["303"] = 234,["304"] = 236,["305"] = 237,["306"] = 238,["307"] = 239,["308"] = 240,["311"] = 244,["312"] = 245,["313"] = 246,["314"] = 246,["315"] = 246,["316"] = 246,["317"] = 246,["318"] = 246,["319"] = 246,["320"] = 246,["321"] = 246,["322"] = 246,["323"] = 246,["324"] = 257,["326"] = 258,["327"] = 258,["329"] = 259,["330"] = 260,["331"] = 261,["332"] = 261,["334"] = 262,["335"] = 263,["336"] = 263,["337"] = 263,["338"] = 263,["339"] = 263,["340"] = 263,["341"] = 263,["342"] = 270,["346"] = 229,["347"] = 273,["348"] = 274,["349"] = 274,["350"] = 274,["351"] = 274,["352"] = 273,["353"] = 279,["354"] = 280,["355"] = 279,["356"] = 282,["357"] = 283,["358"] = 282,["359"] = 207,["360"] = 206,["361"] = 207,["363"] = 207});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_bristle_shared = require("abilities.bristle.evo_bristle_shared")
local fireDreadnoughtQuillFan = ____evo_bristle_shared.fireDreadnoughtQuillFan
local grantBristleAdrenalineStacks = ____evo_bristle_shared.grantBristleAdrenalineStacks
local SCRIPT_PATH = "abilities/bristle/evo_bristle_dreadnought_er"
local DREAD_ER_MODS = {"modifier_evo_bristle_dread_e_passive", "modifier_evo_bristle_dread_e_active", "modifier_evo_bristle_dread_e_slow", "modifier_evo_bristle_dread_r_ram"}
for ____, modName in ipairs(DREAD_ER_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_bristle_dread_e = __TS__Class()
local evo_bristle_dread_e = ____exports.evo_bristle_dread_e
evo_bristle_dread_e.name = "evo_bristle_dread_e"
__TS__ClassExtends(evo_bristle_dread_e, BaseAbility)
function evo_bristle_dread_e.prototype.GetBehavior(self)
    if self:GetLevel() >= 2 then
        return 4 + 2048
    end
    return 2
end
function evo_bristle_dread_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_bristle_dread_e_passive"
end
function evo_bristle_dread_e.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) or self:GetLevel() < 2 then
        return
    end
    local dur = self:GetSpecialValueFor("active_duration")
    local tauntDur = self:GetLevel() >= 3 and 1.7 or 1.3
    local baseShield = self:GetLevel() >= 3 and 220 or 140
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local shieldPool = math.floor(baseShield + str * 0.45)
    caster:EmitSound("Hero_Axe.Berserkers_Call")
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_bristle_dread_e_active", {duration = dur})
    if mod ~= nil then
        mod:SetStackCount(shieldPool)
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
        nil,
        375,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue11
            end
            enemy:SetForceAttackTarget(caster)
            enemy:SetContextThink(
                DoUniqueString("dread_taunt"),
                function()
                    if enemy and not enemy:IsNull() and IsValidEntity(enemy) then
                        enemy:SetForceAttackTarget(nil)
                    end
                    return nil
                end,
                tauntDur
            )
        end
        ::__continue11::
    end
end
evo_bristle_dread_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_dread_e")},
    evo_bristle_dread_e
)
____exports.evo_bristle_dread_e = evo_bristle_dread_e
____exports.modifier_evo_bristle_dread_e_passive = __TS__Class()
local modifier_evo_bristle_dread_e_passive = ____exports.modifier_evo_bristle_dread_e_passive
modifier_evo_bristle_dread_e_passive.name = "modifier_evo_bristle_dread_e_passive"
__TS__ClassExtends(modifier_evo_bristle_dread_e_passive, BaseModifier)
function modifier_evo_bristle_dread_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_dread_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_dread_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_bristle_dread_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_bristle_dread_e_passive.prototype.GetModifierPhysicalArmorBonus(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or parent:PassivesDisabled() then
        return 0
    end
    return ab:GetSpecialValueFor("bonus_armor")
end
function modifier_evo_bristle_dread_e_passive.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.unit ~= parent or parent:PassivesDisabled() then
        return
    end
    if event.damage_type ~= 1 then
        return
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or attacker == parent then
        return
    end
    if attacker:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local dist = (parent:GetAbsOrigin() - attacker:GetAbsOrigin()):Length2D()
    if dist <= 450 then
        local pct = ab:GetSpecialValueFor("reflect_pct") / 100
        local ret = event.original_damage * pct
        if ret > 1 then
            ApplyDamage({
                victim = attacker,
                attacker = parent,
                ability = ab,
                damage = ret,
                damage_type = 1,
                damage_flags = 16 + 1024
            })
        end
    end
    if ab:GetLevel() >= 3 and parent:HasModifier("modifier_evo_bristle_dread_e_active") then
        attacker:AddNewModifier(parent, ab, "modifier_evo_bristle_dread_e_slow", {duration = 2})
    end
end
modifier_evo_bristle_dread_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_e_passive")},
    modifier_evo_bristle_dread_e_passive
)
____exports.modifier_evo_bristle_dread_e_passive = modifier_evo_bristle_dread_e_passive
____exports.modifier_evo_bristle_dread_e_active = __TS__Class()
local modifier_evo_bristle_dread_e_active = ____exports.modifier_evo_bristle_dread_e_active
modifier_evo_bristle_dread_e_active.name = "modifier_evo_bristle_dread_e_active"
__TS__ClassExtends(modifier_evo_bristle_dread_e_active, BaseModifier)
function modifier_evo_bristle_dread_e_active.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_e_active.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_dread_e_active.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_e_active.prototype.GetTexture(self)
    return "bristleback_bristleback"
end
function modifier_evo_bristle_dread_e_active.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")}
end
function modifier_evo_bristle_dread_e_active.prototype.GetModifierTotal_ConstantBlock(self, event)
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
    if rem <= 0 then
        self:SetStackCount(0)
    else
        self:SetStackCount(rem)
    end
    return blocked
end
modifier_evo_bristle_dread_e_active = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_e_active")},
    modifier_evo_bristle_dread_e_active
)
____exports.modifier_evo_bristle_dread_e_active = modifier_evo_bristle_dread_e_active
____exports.modifier_evo_bristle_dread_e_slow = __TS__Class()
local modifier_evo_bristle_dread_e_slow = ____exports.modifier_evo_bristle_dread_e_slow
modifier_evo_bristle_dread_e_slow.name = "modifier_evo_bristle_dread_e_slow"
__TS__ClassExtends(modifier_evo_bristle_dread_e_slow, BaseModifier)
function modifier_evo_bristle_dread_e_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_e_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_dread_e_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_e_slow.prototype.GetTexture(self)
    return "bristleback_bristleback"
end
function modifier_evo_bristle_dread_e_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_bristle_dread_e_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
modifier_evo_bristle_dread_e_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_e_slow")},
    modifier_evo_bristle_dread_e_slow
)
____exports.modifier_evo_bristle_dread_e_slow = modifier_evo_bristle_dread_e_slow
____exports.evo_bristle_dread_r = __TS__Class()
local evo_bristle_dread_r = ____exports.evo_bristle_dread_r
evo_bristle_dread_r.name = "evo_bristle_dread_r"
__TS__ClassExtends(evo_bristle_dread_r, BaseAbility)
function evo_bristle_dread_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:Purge(
        false,
        true,
        false,
        true,
        true
    )
    caster:EmitSound("Hero_Bristleback.Warpath.Cast")
    grantBristleAdrenalineStacks(nil, caster, 2)
    caster:AddNewModifier(caster, self, "modifier_evo_bristle_dread_r_ram", {duration = dur})
end
evo_bristle_dread_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_dread_r")},
    evo_bristle_dread_r
)
____exports.evo_bristle_dread_r = evo_bristle_dread_r
____exports.modifier_evo_bristle_dread_r_ram = __TS__Class()
local modifier_evo_bristle_dread_r_ram = ____exports.modifier_evo_bristle_dread_r_ram
modifier_evo_bristle_dread_r_ram.name = "modifier_evo_bristle_dread_r_ram"
__TS__ClassExtends(modifier_evo_bristle_dread_r_ram, BaseModifier)
function modifier_evo_bristle_dread_r_ram.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastQuillTime = -999
    self.hitCooldownByEnt = __TS__New(Map)
end
function modifier_evo_bristle_dread_r_ram.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_r_ram.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_dread_r_ram.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_dread_r_ram.prototype.GetTexture(self)
    return "bristleback_warpath"
end
function modifier_evo_bristle_dread_r_ram.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.lastQuillTime = -999
    self.hitCooldownByEnt = __TS__New(Map)
    self:StartIntervalThink(0.1)
end
function modifier_evo_bristle_dread_r_ram.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now - self.lastQuillTime >= 0.8 then
        self.lastQuillTime = now
        local wAb = parent:FindAbilityByName("evo_bristle_dread_w")
        if wAb and not wAb:IsNull() and wAb:GetLevel() > 0 then
            fireDreadnoughtQuillFan(nil, parent, wAb)
        end
    end
    local str = parent:IsRealHero() and parent:GetStrength() or 0
    local ramDmg = 90 + str * 0.45
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        200,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue62
            end
            local eid = enemy:entindex()
            local last = self.hitCooldownByEnt:get(eid) or -999
            if now - last < 2.5 then
                goto __continue62
            end
            self.hitCooldownByEnt:set(eid, now)
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = ramDmg,
                damage_type = 1
            })
            enemy:AddNewModifier(parent, ab, "modifier_stunned", {duration = 0.5})
        end
        ::__continue62::
    end
end
function modifier_evo_bristle_dread_r_ram.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_UNSLOWABLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true
    }
end
function modifier_evo_bristle_dread_r_ram.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_bristle_dread_r_ram.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 30
end
modifier_evo_bristle_dread_r_ram = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_r_ram")},
    modifier_evo_bristle_dread_r_ram
)
____exports.modifier_evo_bristle_dread_r_ram = modifier_evo_bristle_dread_r_ram
return ____exports
