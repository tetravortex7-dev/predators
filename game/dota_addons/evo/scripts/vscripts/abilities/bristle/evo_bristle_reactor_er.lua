local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 10,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 20,["28"] = 21,["30"] = 24,["31"] = 25,["32"] = 24,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 28,["38"] = 30,["39"] = 26,["40"] = 32,["41"] = 33,["42"] = 32,["43"] = 35,["44"] = 36,["47"] = 37,["48"] = 38,["51"] = 40,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 41,["56"] = 42,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 44,["61"] = 44,["62"] = 44,["63"] = 44,["64"] = 45,["65"] = 47,["66"] = 48,["67"] = 49,["69"] = 52,["70"] = 52,["71"] = 52,["72"] = 52,["73"] = 52,["74"] = 52,["75"] = 52,["76"] = 52,["77"] = 52,["78"] = 52,["79"] = 52,["80"] = 63,["82"] = 64,["83"] = 64,["85"] = 65,["89"] = 35,["90"] = 25,["91"] = 24,["92"] = 25,["94"] = 25,["95"] = 70,["96"] = 71,["97"] = 70,["98"] = 71,["99"] = 72,["100"] = 73,["101"] = 72,["102"] = 75,["103"] = 76,["104"] = 75,["105"] = 78,["106"] = 79,["107"] = 78,["108"] = 81,["109"] = 82,["112"] = 83,["113"] = 81,["114"] = 85,["115"] = 86,["118"] = 87,["119"] = 88,["120"] = 89,["123"] = 90,["124"] = 90,["125"] = 90,["126"] = 90,["127"] = 90,["128"] = 90,["129"] = 90,["130"] = 90,["131"] = 90,["132"] = 90,["133"] = 90,["134"] = 101,["135"] = 102,["136"] = 103,["137"] = 104,["138"] = 104,["141"] = 106,["142"] = 107,["143"] = 108,["144"] = 109,["145"] = 110,["148"] = 85,["149"] = 114,["150"] = 115,["151"] = 115,["152"] = 115,["153"] = 115,["154"] = 114,["155"] = 120,["156"] = 121,["157"] = 120,["158"] = 123,["159"] = 124,["162"] = 125,["163"] = 126,["164"] = 127,["167"] = 128,["168"] = 129,["171"] = 131,["172"] = 132,["173"] = 133,["174"] = 133,["175"] = 133,["176"] = 133,["177"] = 133,["178"] = 133,["179"] = 133,["180"] = 140,["181"] = 140,["182"] = 140,["183"] = 140,["184"] = 140,["185"] = 140,["186"] = 140,["187"] = 123,["188"] = 71,["189"] = 70,["190"] = 71,["192"] = 71,["193"] = 144,["194"] = 145,["195"] = 144,["196"] = 145,["197"] = 146,["198"] = 147,["199"] = 146,["200"] = 149,["201"] = 150,["202"] = 149,["203"] = 152,["204"] = 153,["205"] = 152,["206"] = 155,["207"] = 156,["208"] = 155,["209"] = 158,["210"] = 159,["211"] = 158,["212"] = 161,["213"] = 162,["214"] = 162,["216"] = 163,["217"] = 164,["218"] = 164,["220"] = 165,["221"] = 165,["222"] = 165,["223"] = 165,["224"] = 166,["225"] = 167,["226"] = 168,["228"] = 170,["230"] = 172,["231"] = 161,["232"] = 145,["233"] = 144,["234"] = 145,["236"] = 145,["237"] = 176,["238"] = 177,["239"] = 176,["240"] = 177,["241"] = 178,["242"] = 179,["243"] = 178,["244"] = 181,["245"] = 182,["246"] = 181,["247"] = 184,["248"] = 185,["249"] = 184,["250"] = 187,["251"] = 188,["252"] = 187,["253"] = 190,["254"] = 191,["255"] = 191,["256"] = 191,["257"] = 191,["258"] = 190,["259"] = 196,["260"] = 197,["261"] = 196,["262"] = 199,["263"] = 200,["264"] = 199,["265"] = 177,["266"] = 176,["267"] = 177,["269"] = 177,["270"] = 204,["271"] = 205,["272"] = 204,["273"] = 205,["274"] = 206,["275"] = 207,["276"] = 206,["277"] = 209,["278"] = 210,["279"] = 209,["280"] = 212,["281"] = 213,["282"] = 212,["283"] = 215,["284"] = 216,["285"] = 215,["286"] = 218,["287"] = 219,["288"] = 219,["289"] = 219,["290"] = 219,["291"] = 219,["292"] = 218,["293"] = 225,["294"] = 226,["295"] = 225,["296"] = 228,["297"] = 229,["298"] = 228,["299"] = 231,["300"] = 232,["301"] = 231,["302"] = 205,["303"] = 204,["304"] = 205,["306"] = 205,["307"] = 236,["308"] = 237,["309"] = 236,["310"] = 237,["311"] = 238,["312"] = 239,["315"] = 240,["316"] = 241,["319"] = 242,["320"] = 243,["321"] = 244,["322"] = 245,["323"] = 245,["324"] = 245,["325"] = 245,["326"] = 245,["327"] = 245,["328"] = 245,["329"] = 245,["330"] = 245,["331"] = 238,["332"] = 237,["333"] = 236,["334"] = 237,["336"] = 237,["337"] = 257,["338"] = 258,["339"] = 257,["340"] = 258,["342"] = 258,["343"] = 259,["344"] = 257,["345"] = 261,["346"] = 262,["347"] = 261,["348"] = 264,["349"] = 265,["350"] = 264,["351"] = 267,["352"] = 268,["355"] = 269,["356"] = 270,["357"] = 271,["358"] = 272,["359"] = 273,["360"] = 274,["361"] = 279,["362"] = 279,["363"] = 279,["364"] = 279,["365"] = 279,["366"] = 280,["367"] = 280,["368"] = 280,["369"] = 280,["370"] = 280,["371"] = 281,["373"] = 283,["374"] = 284,["375"] = 267,["376"] = 286,["377"] = 287,["380"] = 288,["381"] = 289,["382"] = 290,["384"] = 286,["385"] = 293,["386"] = 294,["389"] = 295,["390"] = 293,["391"] = 297,["392"] = 298,["393"] = 299,["394"] = 300,["395"] = 301,["398"] = 303,["399"] = 304,["400"] = 305,["401"] = 305,["402"] = 305,["403"] = 305,["404"] = 305,["405"] = 305,["406"] = 305,["407"] = 305,["408"] = 305,["409"] = 305,["410"] = 305,["411"] = 316,["413"] = 317,["414"] = 317,["416"] = 318,["417"] = 318,["418"] = 318,["419"] = 318,["420"] = 318,["421"] = 318,["422"] = 318,["423"] = 319,["424"] = 319,["425"] = 319,["426"] = 319,["427"] = 319,["428"] = 319,["429"] = 319,["430"] = 326,["431"] = 326,["432"] = 326,["433"] = 326,["434"] = 326,["435"] = 327,["436"] = 328,["437"] = 329,["438"] = 330,["439"] = 331,["440"] = 331,["441"] = 331,["442"] = 331,["443"] = 331,["444"] = 336,["449"] = 297,["450"] = 258,["451"] = 257,["452"] = 258,["454"] = 258});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_bristle_shared = require("abilities.bristle.evo_bristle_shared")
local activeReactorZones = ____evo_bristle_shared.activeReactorZones
local applyReactorCatalystStacks = ____evo_bristle_shared.applyReactorCatalystStacks
local getAllAttributesSum = ____evo_bristle_shared.getAllAttributesSum
local SCRIPT_PATH = "abilities/bristle/evo_bristle_reactor_er"
local REACTOR_ER_MODS = {
    "modifier_evo_bristle_react_e_passive",
    "modifier_evo_bristle_react_e_shield",
    "modifier_evo_bristle_react_e_cloud",
    "modifier_evo_bristle_react_e_stats",
    "modifier_evo_bristle_react_r_thinker"
}
for ____, modName in ipairs(REACTOR_ER_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_bristle_react_e = __TS__Class()
local evo_bristle_react_e = ____exports.evo_bristle_react_e
evo_bristle_react_e.name = "evo_bristle_react_e"
__TS__ClassExtends(evo_bristle_react_e, BaseAbility)
function evo_bristle_react_e.prototype.GetBehavior(self)
    if self:GetLevel() >= 2 then
        return 4 + 2048
    end
    return 2
end
function evo_bristle_react_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_bristle_react_e_passive"
end
function evo_bristle_react_e.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) or self:GetLevel() < 2 then
        return
    end
    local adr = caster:FindModifierByName("modifier_evo_bristle_adrenaline_stack")
    local stacks = math.max(
        1,
        adr and adr:GetStackCount() or 1
    )
    local shieldPool = math.floor((65 + getAllAttributesSum(nil, caster) * 0.15) * stacks)
    caster:Purge(
        false,
        true,
        false,
        false,
        false
    )
    caster:EmitSound("Hero_Alchemist.ChemicalRage.Cast")
    local sMod = caster:AddNewModifier(caster, self, "modifier_evo_bristle_react_e_shield", {duration = 4})
    if sMod ~= nil then
        sMod:SetStackCount(shieldPool)
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
        nil,
        350,
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
            enemy:AddNewModifier(caster, self, "modifier_evo_bristle_react_e_cloud", {duration = 2.5})
        end
        ::__continue11::
    end
end
evo_bristle_react_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_e")},
    evo_bristle_react_e
)
____exports.evo_bristle_react_e = evo_bristle_react_e
____exports.modifier_evo_bristle_react_e_passive = __TS__Class()
local modifier_evo_bristle_react_e_passive = ____exports.modifier_evo_bristle_react_e_passive
modifier_evo_bristle_react_e_passive.name = "modifier_evo_bristle_react_e_passive"
__TS__ClassExtends(modifier_evo_bristle_react_e_passive, BaseModifier)
function modifier_evo_bristle_react_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_react_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_react_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_bristle_react_e_passive.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.5)
end
function modifier_evo_bristle_react_e_passive.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:GetLevel() < 3 then
        return
    end
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        700,
        2,
        1,
        0,
        0,
        false
    )
    local totalStacks = 0
    for ____, e in ipairs(enemies) do
        local c = e:FindModifierByName("modifier_evo_bristle_react_catalyst")
        if c then
            totalStacks = totalStacks + c:GetStackCount()
        end
    end
    local statBonus = math.min(24, totalStacks * 2)
    if statBonus > 0 then
        local m = parent:AddNewModifier(parent, ab, "modifier_evo_bristle_react_e_stats", {duration = 1})
        if m ~= nil then
            m:SetStackCount(statBonus)
        end
    end
end
function modifier_evo_bristle_react_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_bristle_react_e_passive.prototype.GetModifierAttackRangeBonus(self)
    return 125
end
function modifier_evo_bristle_react_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    local baseOnHit = ab:GetSpecialValueFor("on_hit_damage")
    local dmg = baseOnHit + getAllAttributesSum(nil, parent) * 0.1
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ab,
        damage = dmg,
        damage_type = 2
    })
    applyReactorCatalystStacks(
        nil,
        parent,
        target,
        ab,
        1
    )
end
modifier_evo_bristle_react_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_e_passive")},
    modifier_evo_bristle_react_e_passive
)
____exports.modifier_evo_bristle_react_e_passive = modifier_evo_bristle_react_e_passive
____exports.modifier_evo_bristle_react_e_shield = __TS__Class()
local modifier_evo_bristle_react_e_shield = ____exports.modifier_evo_bristle_react_e_shield
modifier_evo_bristle_react_e_shield.name = "modifier_evo_bristle_react_e_shield"
__TS__ClassExtends(modifier_evo_bristle_react_e_shield, BaseModifier)
function modifier_evo_bristle_react_e_shield.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_e_shield.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_react_e_shield.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_e_shield.prototype.GetTexture(self)
    return "alchemist_chemical_rage"
end
function modifier_evo_bristle_react_e_shield.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")}
end
function modifier_evo_bristle_react_e_shield.prototype.GetModifierTotal_ConstantBlock(self, event)
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
        self:Destroy()
    else
        self:SetStackCount(rem)
    end
    return blocked
end
modifier_evo_bristle_react_e_shield = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_e_shield")},
    modifier_evo_bristle_react_e_shield
)
____exports.modifier_evo_bristle_react_e_shield = modifier_evo_bristle_react_e_shield
____exports.modifier_evo_bristle_react_e_cloud = __TS__Class()
local modifier_evo_bristle_react_e_cloud = ____exports.modifier_evo_bristle_react_e_cloud
modifier_evo_bristle_react_e_cloud.name = "modifier_evo_bristle_react_e_cloud"
__TS__ClassExtends(modifier_evo_bristle_react_e_cloud, BaseModifier)
function modifier_evo_bristle_react_e_cloud.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_e_cloud.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_react_e_cloud.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_e_cloud.prototype.GetTexture(self)
    return "alchemist_acid_spray"
end
function modifier_evo_bristle_react_e_cloud.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MISS_PERCENTAGE")
    }
end
function modifier_evo_bristle_react_e_cloud.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
function modifier_evo_bristle_react_e_cloud.prototype.GetModifierMiss_Percentage(self)
    return 30
end
modifier_evo_bristle_react_e_cloud = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_e_cloud")},
    modifier_evo_bristle_react_e_cloud
)
____exports.modifier_evo_bristle_react_e_cloud = modifier_evo_bristle_react_e_cloud
____exports.modifier_evo_bristle_react_e_stats = __TS__Class()
local modifier_evo_bristle_react_e_stats = ____exports.modifier_evo_bristle_react_e_stats
modifier_evo_bristle_react_e_stats.name = "modifier_evo_bristle_react_e_stats"
__TS__ClassExtends(modifier_evo_bristle_react_e_stats, BaseModifier)
function modifier_evo_bristle_react_e_stats.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_e_stats.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_react_e_stats.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_react_e_stats.prototype.GetTexture(self)
    return "alchemist_chemical_rage"
end
function modifier_evo_bristle_react_e_stats.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function modifier_evo_bristle_react_e_stats.prototype.GetModifierBonusStats_Strength(self)
    return self:GetStackCount()
end
function modifier_evo_bristle_react_e_stats.prototype.GetModifierBonusStats_Agility(self)
    return self:GetStackCount()
end
function modifier_evo_bristle_react_e_stats.prototype.GetModifierBonusStats_Intellect(self)
    return self:GetStackCount()
end
modifier_evo_bristle_react_e_stats = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_e_stats")},
    modifier_evo_bristle_react_e_stats
)
____exports.modifier_evo_bristle_react_e_stats = modifier_evo_bristle_react_e_stats
____exports.evo_bristle_react_r = __TS__Class()
local evo_bristle_react_r = ____exports.evo_bristle_react_r
evo_bristle_react_r.name = "evo_bristle_react_r"
__TS__ClassExtends(evo_bristle_react_r, BaseAbility)
function evo_bristle_react_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Alchemist.AcidSpray")
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_bristle_react_r_thinker",
        {duration = dur},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_bristle_react_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_r")},
    evo_bristle_react_r
)
____exports.evo_bristle_react_r = evo_bristle_react_r
____exports.modifier_evo_bristle_react_r_thinker = __TS__Class()
local modifier_evo_bristle_react_r_thinker = ____exports.modifier_evo_bristle_react_r_thinker
modifier_evo_bristle_react_r_thinker.name = "modifier_evo_bristle_react_r_thinker"
__TS__ClassExtends(modifier_evo_bristle_react_r_thinker, BaseModifier)
function modifier_evo_bristle_react_r_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 500
end
function modifier_evo_bristle_react_r_thinker.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_react_r_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_react_r_thinker.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local ab = self:GetAbility()
    self.radius = ab and ab:GetSpecialValueFor("radius") or 500
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        activeReactorZones:add(parent)
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", 8, nil)
        ParticleManager:SetParticleControl(
            pfx,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            pfx,
            1,
            Vector(self.radius, 1, 1)
        )
        ParticleManager:ReleaseParticleIndex(pfx)
    end
    self:triggerPulse()
    self:StartIntervalThink(1.1)
end
function modifier_evo_bristle_react_r_thinker.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent ~= nil then
        activeReactorZones:delete(parent)
    end
end
function modifier_evo_bristle_react_r_thinker.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    self:triggerPulse()
end
function modifier_evo_bristle_react_r_thinker.prototype.triggerPulse(self)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not caster or caster:IsNull() or not parent or parent:IsNull() or not ab then
        return
    end
    local origin = parent:GetAbsOrigin()
    local pulseDmg = 75 + getAllAttributesSum(nil, caster) * 0.24
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        self.radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue73
            end
            applyReactorCatalystStacks(
                nil,
                caster,
                enemy,
                ab,
                1
            )
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = pulseDmg,
                damage_type = 2
            })
            local toCenter = Vector(
                origin.x - enemy:GetAbsOrigin().x,
                origin.y - enemy:GetAbsOrigin().y,
                0
            )
            local d = toCenter:Length2D()
            if d > 60 then
                local dir = toCenter:Normalized()
                local pull = math.min(100, d - 50)
                local pulled = Vector(
                    enemy:GetAbsOrigin().x + dir.x * pull,
                    enemy:GetAbsOrigin().y + dir.y * pull,
                    enemy:GetAbsOrigin().z
                )
                FindClearSpaceForUnit(enemy, pulled, true)
            end
        end
        ::__continue73::
    end
end
modifier_evo_bristle_react_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_r_thinker")},
    modifier_evo_bristle_react_r_thinker
)
____exports.modifier_evo_bristle_react_r_thinker = modifier_evo_bristle_react_r_thinker
return ____exports
