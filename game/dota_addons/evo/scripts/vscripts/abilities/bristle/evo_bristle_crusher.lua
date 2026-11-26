local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 12,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 22,["28"] = 23,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["40"] = 26,["41"] = 35,["42"] = 36,["43"] = 35,["44"] = 36,["45"] = 37,["46"] = 38,["49"] = 39,["50"] = 40,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 37,["58"] = 36,["59"] = 35,["60"] = 36,["62"] = 36,["63"] = 49,["64"] = 50,["65"] = 49,["66"] = 50,["68"] = 50,["69"] = 51,["70"] = 49,["71"] = 53,["72"] = 54,["73"] = 53,["74"] = 56,["75"] = 57,["76"] = 56,["77"] = 59,["78"] = 60,["79"] = 59,["80"] = 62,["81"] = 63,["82"] = 62,["83"] = 65,["84"] = 66,["85"] = 65,["86"] = 68,["87"] = 69,["88"] = 68,["89"] = 71,["90"] = 72,["91"] = 71,["92"] = 76,["93"] = 77,["94"] = 77,["95"] = 77,["96"] = 77,["97"] = 76,["98"] = 82,["99"] = 83,["100"] = 84,["101"] = 82,["102"] = 86,["103"] = 87,["106"] = 88,["107"] = 89,["108"] = 90,["111"] = 91,["112"] = 92,["115"] = 94,["116"] = 95,["117"] = 96,["118"] = 97,["119"] = 98,["120"] = 99,["121"] = 100,["122"] = 102,["123"] = 103,["124"] = 105,["125"] = 106,["126"] = 106,["127"] = 106,["128"] = 106,["129"] = 106,["130"] = 107,["131"] = 107,["132"] = 107,["133"] = 107,["134"] = 107,["135"] = 107,["136"] = 107,["137"] = 107,["138"] = 107,["139"] = 107,["140"] = 107,["141"] = 119,["143"] = 120,["144"] = 120,["146"] = 121,["147"] = 121,["148"] = 121,["149"] = 121,["150"] = 121,["151"] = 122,["152"] = 123,["153"] = 123,["154"] = 123,["155"] = 123,["156"] = 123,["157"] = 123,["158"] = 123,["159"] = 130,["160"] = 130,["161"] = 130,["162"] = 130,["163"] = 130,["164"] = 130,["165"] = 130,["166"] = 131,["167"] = 132,["173"] = 137,["174"] = 138,["175"] = 139,["177"] = 142,["178"] = 86,["179"] = 50,["180"] = 49,["181"] = 50,["183"] = 50,["184"] = 146,["185"] = 147,["186"] = 146,["187"] = 147,["188"] = 148,["189"] = 149,["190"] = 148,["191"] = 151,["192"] = 152,["193"] = 151,["194"] = 154,["195"] = 155,["196"] = 154,["197"] = 157,["198"] = 158,["199"] = 157,["200"] = 160,["201"] = 161,["202"] = 160,["203"] = 163,["204"] = 164,["205"] = 163,["206"] = 147,["207"] = 146,["208"] = 147,["210"] = 147,["211"] = 168,["212"] = 169,["213"] = 168,["214"] = 169,["215"] = 170,["216"] = 171,["219"] = 172,["220"] = 173,["223"] = 175,["224"] = 176,["225"] = 178,["226"] = 179,["227"] = 179,["228"] = 181,["229"] = 182,["230"] = 183,["232"] = 185,["233"] = 179,["234"] = 179,["235"] = 179,["237"] = 170,["238"] = 191,["239"] = 192,["240"] = 193,["241"] = 194,["242"] = 195,["243"] = 196,["244"] = 197,["245"] = 199,["246"] = 200,["247"] = 205,["248"] = 207,["249"] = 207,["250"] = 207,["251"] = 207,["252"] = 207,["253"] = 207,["254"] = 207,["255"] = 207,["256"] = 207,["257"] = 207,["258"] = 207,["259"] = 218,["261"] = 219,["262"] = 219,["264"] = 220,["265"] = 221,["266"] = 221,["267"] = 221,["268"] = 221,["269"] = 221,["270"] = 221,["271"] = 221,["272"] = 228,["273"] = 229,["274"] = 229,["275"] = 229,["276"] = 229,["277"] = 229,["278"] = 229,["279"] = 229,["280"] = 229,["281"] = 229,["282"] = 229,["284"] = 231,["285"] = 231,["286"] = 231,["287"] = 231,["288"] = 231,["289"] = 231,["290"] = 231,["294"] = 191,["295"] = 169,["296"] = 168,["297"] = 169,["299"] = 169,["300"] = 236,["301"] = 237,["302"] = 236,["303"] = 237,["304"] = 238,["305"] = 239,["306"] = 238,["307"] = 241,["308"] = 242,["309"] = 241,["310"] = 244,["311"] = 245,["312"] = 244,["313"] = 247,["314"] = 248,["315"] = 247,["316"] = 250,["317"] = 251,["318"] = 251,["319"] = 251,["320"] = 251,["321"] = 250,["322"] = 256,["323"] = 257,["324"] = 258,["325"] = 259,["326"] = 259,["327"] = 259,["329"] = 259,["331"] = 259,["332"] = 260,["333"] = 261,["334"] = 262,["335"] = 262,["337"] = 263,["338"] = 256,["339"] = 265,["340"] = 266,["341"] = 266,["343"] = 267,["344"] = 268,["345"] = 268,["346"] = 268,["348"] = 268,["350"] = 268,["351"] = 269,["352"] = 270,["353"] = 271,["354"] = 265,["355"] = 237,["356"] = 236,["357"] = 237,["359"] = 237,["360"] = 275,["361"] = 276,["362"] = 275,["363"] = 276,["364"] = 277,["365"] = 278,["366"] = 277,["367"] = 276,["368"] = 275,["369"] = 276,["371"] = 276,["372"] = 282,["373"] = 283,["374"] = 282,["375"] = 283,["377"] = 283,["378"] = 284,["379"] = 285,["380"] = 282,["381"] = 287,["382"] = 288,["383"] = 287,["384"] = 290,["385"] = 291,["386"] = 290,["387"] = 293,["388"] = 294,["389"] = 293,["390"] = 296,["391"] = 297,["392"] = 298,["393"] = 296,["394"] = 300,["395"] = 301,["396"] = 301,["397"] = 301,["398"] = 301,["399"] = 301,["400"] = 301,["401"] = 300,["402"] = 308,["403"] = 309,["404"] = 310,["405"] = 311,["406"] = 311,["408"] = 312,["409"] = 312,["411"] = 313,["412"] = 314,["413"] = 314,["415"] = 315,["416"] = 315,["417"] = 315,["418"] = 315,["419"] = 316,["420"] = 308,["421"] = 318,["422"] = 319,["425"] = 320,["426"] = 321,["427"] = 322,["430"] = 323,["433"] = 325,["434"] = 326,["435"] = 327,["436"] = 327,["437"] = 327,["438"] = 327,["439"] = 327,["440"] = 327,["441"] = 327,["442"] = 328,["444"] = 330,["445"] = 331,["446"] = 332,["448"] = 334,["449"] = 318,["450"] = 336,["451"] = 337,["454"] = 338,["455"] = 339,["456"] = 340,["459"] = 341,["460"] = 342,["463"] = 344,["464"] = 345,["465"] = 346,["466"] = 346,["467"] = 346,["468"] = 346,["469"] = 346,["470"] = 346,["471"] = 346,["472"] = 346,["473"] = 346,["474"] = 346,["475"] = 346,["476"] = 357,["478"] = 358,["479"] = 358,["481"] = 359,["482"] = 359,["483"] = 359,["484"] = 359,["485"] = 359,["486"] = 359,["487"] = 359,["491"] = 368,["492"] = 369,["493"] = 370,["494"] = 371,["496"] = 373,["498"] = 375,["499"] = 376,["500"] = 376,["502"] = 377,["503"] = 377,["505"] = 378,["506"] = 379,["507"] = 380,["508"] = 380,["509"] = 380,["510"] = 380,["511"] = 380,["512"] = 380,["513"] = 380,["514"] = 380,["515"] = 380,["516"] = 380,["517"] = 380,["518"] = 391,["519"] = 392,["521"] = 393,["522"] = 393,["524"] = 394,["525"] = 394,["526"] = 394,["527"] = 394,["528"] = 394,["529"] = 394,["530"] = 394,["531"] = 401,["532"] = 401,["533"] = 401,["534"] = 401,["535"] = 401,["536"] = 401,["537"] = 401,["543"] = 406,["544"] = 407,["545"] = 408,["546"] = 409,["547"] = 410,["548"] = 410,["549"] = 410,["550"] = 410,["551"] = 410,["552"] = 410,["553"] = 410,["556"] = 336,["557"] = 420,["558"] = 421,["561"] = 422,["562"] = 423,["565"] = 424,["566"] = 425,["569"] = 426,["570"] = 427,["571"] = 428,["572"] = 429,["573"] = 430,["574"] = 431,["577"] = 420,["578"] = 283,["579"] = 282,["580"] = 283,["582"] = 283,["583"] = 437,["584"] = 438,["585"] = 437,["586"] = 438,["587"] = 439,["588"] = 440,["591"] = 441,["592"] = 442,["595"] = 444,["596"] = 445,["597"] = 446,["598"] = 447,["599"] = 439,["600"] = 438,["601"] = 437,["602"] = 438,["604"] = 438,["605"] = 451,["606"] = 452,["607"] = 451,["608"] = 452,["610"] = 452,["611"] = 453,["612"] = 451,["613"] = 455,["614"] = 456,["615"] = 455,["616"] = 458,["617"] = 459,["618"] = 458,["619"] = 461,["620"] = 462,["621"] = 461,["622"] = 464,["623"] = 465,["624"] = 464,["625"] = 467,["626"] = 468,["627"] = 469,["630"] = 470,["631"] = 471,["632"] = 472,["634"] = 474,["635"] = 467,["636"] = 476,["637"] = 477,["640"] = 478,["641"] = 479,["642"] = 480,["644"] = 476,["645"] = 483,["646"] = 484,["647"] = 484,["648"] = 484,["649"] = 484,["650"] = 483,["651"] = 489,["652"] = 490,["653"] = 489,["654"] = 492,["655"] = 493,["656"] = 492,["657"] = 452,["658"] = 451,["659"] = 452,["661"] = 452});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_bristle_shared = require("abilities.bristle.evo_bristle_shared")
local grantBristleAdrenalineStacks = ____evo_bristle_shared.grantBristleAdrenalineStacks
local SCRIPT_PATH = "abilities/bristle/evo_bristle_crusher"
local CRUSH_MODS = {
    "modifier_evo_bristle_crush_q_rush",
    "modifier_evo_bristle_crush_q_slow",
    "modifier_evo_bristle_crush_w_sunder",
    "modifier_evo_bristle_crush_e_passive",
    "modifier_evo_bristle_crush_r_frenzy"
}
for ____, modName in ipairs(CRUSH_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
local function applySunderStacks(self, caster, target, ability, count)
    local ex = target:FindModifierByName("modifier_evo_bristle_crush_w_sunder")
    local next = math.min(
        4,
        (ex and ex:GetStackCount() or 0) + count
    )
    local mod = target:AddNewModifier(caster, ability, "modifier_evo_bristle_crush_w_sunder", {duration = 4})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
____exports.evo_bristle_crush_q = __TS__Class()
local evo_bristle_crush_q = ____exports.evo_bristle_crush_q
evo_bristle_crush_q.name = "evo_bristle_crush_q"
__TS__ClassExtends(evo_bristle_crush_q, BaseAbility)
function evo_bristle_crush_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Spirit_Breaker.ChargeOfDarkness")
    grantBristleAdrenalineStacks(nil, caster, 2)
    caster:AddNewModifier(caster, self, "modifier_evo_bristle_crush_q_rush", {duration = dur})
end
evo_bristle_crush_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_crush_q")},
    evo_bristle_crush_q
)
____exports.evo_bristle_crush_q = evo_bristle_crush_q
____exports.modifier_evo_bristle_crush_q_rush = __TS__Class()
local modifier_evo_bristle_crush_q_rush = ____exports.modifier_evo_bristle_crush_q_rush
modifier_evo_bristle_crush_q_rush.name = "modifier_evo_bristle_crush_q_rush"
__TS__ClassExtends(modifier_evo_bristle_crush_q_rush, BaseModifier)
function modifier_evo_bristle_crush_q_rush.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.usedStrike = false
end
function modifier_evo_bristle_crush_q_rush.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_crush_q_rush.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_crush_q_rush.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_crush_q_rush.prototype.GetTexture(self)
    return "spirit_breaker_charge_of_darkness"
end
function modifier_evo_bristle_crush_q_rush.prototype.OnCreated(self)
    self.usedStrike = false
end
function modifier_evo_bristle_crush_q_rush.prototype.OnRefresh(self)
    self.usedStrike = false
end
function modifier_evo_bristle_crush_q_rush.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_bristle_crush_q_rush.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_bristle_crush_q_rush.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ab = self:GetAbility()
    return ab and ab:GetSpecialValueFor("bonus_ms_pct") or 28
end
function modifier_evo_bristle_crush_q_rush.prototype.OnAttackLanded(self, event)
    if not IsServer() or self.usedStrike then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    self.usedStrike = true
    local level = ab:GetLevel()
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local strPct = ab:GetSpecialValueFor("str_pct") / 100
    local stunDur = ab:GetSpecialValueFor("stun_duration")
    local str = parent:IsRealHero() and parent:GetStrength() or 0
    local dmg = baseDmg + str * strPct
    target:EmitSound("Hero_Earthshaker.Totem.Attack")
    target:AddNewModifier(parent, ab, "modifier_stunned", {duration = stunDur})
    local origin = parent:GetAbsOrigin()
    local dir = Vector(
        target:GetAbsOrigin().x - origin.x,
        target:GetAbsOrigin().y - origin.y,
        0
    ):Normalized()
    local nearby = FindUnitsInRadius(
        parent:GetTeamNumber(),
        origin,
        nil,
        275,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(nearby) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue22
            end
            local toEnemy = Vector(
                enemy:GetAbsOrigin().x - origin.x,
                enemy:GetAbsOrigin().y - origin.y,
                0
            )
            if enemy == target or toEnemy:Length2D() > 0 and dir.x * toEnemy:Normalized().x + dir.y * toEnemy:Normalized().y >= 0.35 then
                ApplyDamage({
                    victim = enemy,
                    attacker = parent,
                    ability = ab,
                    damage = dmg,
                    damage_type = 1
                })
                applySunderStacks(
                    nil,
                    parent,
                    enemy,
                    ab,
                    2
                )
                if level >= 2 then
                    enemy:AddNewModifier(parent, ab, "modifier_evo_bristle_crush_q_slow", {duration = 2})
                end
            end
        end
        ::__continue22::
    end
    if level >= 2 then
        local baseHeal = level >= 3 and 100 or 60
        parent:Heal(baseHeal + str * 0.25, ab)
    end
    self:Destroy()
end
modifier_evo_bristle_crush_q_rush = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_crush_q_rush")},
    modifier_evo_bristle_crush_q_rush
)
____exports.modifier_evo_bristle_crush_q_rush = modifier_evo_bristle_crush_q_rush
____exports.modifier_evo_bristle_crush_q_slow = __TS__Class()
local modifier_evo_bristle_crush_q_slow = ____exports.modifier_evo_bristle_crush_q_slow
modifier_evo_bristle_crush_q_slow.name = "modifier_evo_bristle_crush_q_slow"
__TS__ClassExtends(modifier_evo_bristle_crush_q_slow, BaseModifier)
function modifier_evo_bristle_crush_q_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_crush_q_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_crush_q_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_crush_q_slow.prototype.GetTexture(self)
    return "spirit_breaker_charge_of_darkness"
end
function modifier_evo_bristle_crush_q_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_bristle_crush_q_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
modifier_evo_bristle_crush_q_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_crush_q_slow")},
    modifier_evo_bristle_crush_q_slow
)
____exports.modifier_evo_bristle_crush_q_slow = modifier_evo_bristle_crush_q_slow
____exports.evo_bristle_crush_w = __TS__Class()
local evo_bristle_crush_w = ____exports.evo_bristle_crush_w
evo_bristle_crush_w.name = "evo_bristle_crush_w"
__TS__ClassExtends(evo_bristle_crush_w, BaseAbility)
function evo_bristle_crush_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    grantBristleAdrenalineStacks(nil, caster, 1)
    self:performSweep(caster, 1)
    if self:GetLevel() >= 3 then
        caster:SetContextThink(
            DoUniqueString("crush_w_echo"),
            function()
                if caster and not caster:IsNull() and IsValidEntity(caster) and caster:IsAlive() and not self:IsNull() then
                    self:performSweep(caster, 0.65)
                end
                return nil
            end,
            0.35
        )
    end
end
function evo_bristle_crush_w.prototype.performSweep(self, caster, scaleFactor)
    local level = self:GetLevel()
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local strPct = self:GetSpecialValueFor("str_pct") / 100
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local dmgBase = (baseDmg + str * strPct) * scaleFactor
    caster:EmitSound("Hero_Axe.CounterHelix")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_axe/axe_counterhelix.vpcf", 1, caster)
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
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
                goto __continue41
            end
            local dmg = isEvoCreepUnit(nil, enemy) and dmgBase * 1.35 or dmgBase
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = dmg,
                damage_type = 1
            })
            if level >= 2 then
                caster:PerformAttack(
                    enemy,
                    true,
                    true,
                    true,
                    false,
                    false,
                    false,
                    false
                )
            end
            applySunderStacks(
                nil,
                caster,
                enemy,
                self,
                1
            )
        end
        ::__continue41::
    end
end
evo_bristle_crush_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_crush_w")},
    evo_bristle_crush_w
)
____exports.evo_bristle_crush_w = evo_bristle_crush_w
____exports.modifier_evo_bristle_crush_w_sunder = __TS__Class()
local modifier_evo_bristle_crush_w_sunder = ____exports.modifier_evo_bristle_crush_w_sunder
modifier_evo_bristle_crush_w_sunder.name = "modifier_evo_bristle_crush_w_sunder"
__TS__ClassExtends(modifier_evo_bristle_crush_w_sunder, BaseModifier)
function modifier_evo_bristle_crush_w_sunder.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_crush_w_sunder.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_crush_w_sunder.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_crush_w_sunder.prototype.GetTexture(self)
    return "slardar_amplify_damage"
end
function modifier_evo_bristle_crush_w_sunder.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")
    }
end
function modifier_evo_bristle_crush_w_sunder.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ____temp_0
    if caster and not caster:IsNull() then
        ____temp_0 = caster:FindAbilityByName("evo_bristle_crush_w")
    else
        ____temp_0 = nil
    end
    local wAb = ____temp_0
    local lvl = wAb and not wAb:IsNull() and wAb:GetLevel() or 1
    local perStack = lvl >= 3 and 18 or (lvl >= 2 and 14 or 10)
    if not parent or parent:IsNull() then
        return 0
    end
    return -perStack * self:GetStackCount()
end
function modifier_evo_bristle_crush_w_sunder.prototype.GetModifierIncomingDamage_Percentage(self, event)
    if event.damage_type ~= 1 then
        return 0
    end
    local caster = self:GetCaster()
    local ____temp_1
    if caster and not caster:IsNull() then
        ____temp_1 = caster:FindAbilityByName("evo_bristle_crush_w")
    else
        ____temp_1 = nil
    end
    local wAb = ____temp_1
    local lvl = wAb and not wAb:IsNull() and wAb:GetLevel() or 1
    local perStack = lvl >= 3 and 9 or (lvl >= 2 and 7 or 5)
    return perStack * self:GetStackCount()
end
modifier_evo_bristle_crush_w_sunder = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_crush_w_sunder")},
    modifier_evo_bristle_crush_w_sunder
)
____exports.modifier_evo_bristle_crush_w_sunder = modifier_evo_bristle_crush_w_sunder
____exports.evo_bristle_crush_e = __TS__Class()
local evo_bristle_crush_e = ____exports.evo_bristle_crush_e
evo_bristle_crush_e.name = "evo_bristle_crush_e"
__TS__ClassExtends(evo_bristle_crush_e, BaseAbility)
function evo_bristle_crush_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_bristle_crush_e_passive"
end
evo_bristle_crush_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_crush_e")},
    evo_bristle_crush_e
)
____exports.evo_bristle_crush_e = evo_bristle_crush_e
____exports.modifier_evo_bristle_crush_e_passive = __TS__Class()
local modifier_evo_bristle_crush_e_passive = ____exports.modifier_evo_bristle_crush_e_passive
modifier_evo_bristle_crush_e_passive.name = "modifier_evo_bristle_crush_e_passive"
__TS__ClassExtends(modifier_evo_bristle_crush_e_passive, BaseModifier)
function modifier_evo_bristle_crush_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.heroHitCount = 0
    self.creepHitCount = 0
end
function modifier_evo_bristle_crush_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_crush_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_crush_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_bristle_crush_e_passive.prototype.OnCreated(self)
    self.heroHitCount = 0
    self.creepHitCount = 0
end
function modifier_evo_bristle_crush_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING")
    }
end
function modifier_evo_bristle_crush_e_passive.prototype.GetModifierStatusResistanceStacking(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or ab:GetLevel() < 3 then
        return 0
    end
    if parent:PassivesDisabled() then
        return 0
    end
    local hpPct = parent:GetHealthPercent()
    if hpPct >= 100 then
        return 0
    end
    local ratio = math.min(
        1,
        math.max(0, (100 - hpPct) / 65)
    )
    return math.floor(35 * ratio + 0.5)
end
function modifier_evo_bristle_crush_e_passive.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    if event.damage_type ~= 1 or event.damage <= 0 then
        return
    end
    local lifesteal = ab:GetSpecialValueFor("lifesteal_pct") / 100
    if ab:GetLevel() >= 3 then
        local ratio = math.min(
            1,
            math.max(
                0,
                (100 - parent:GetHealthPercent()) / 65
            )
        )
        lifesteal = lifesteal + 0.45 * ratio
    end
    local victim = event.unit
    if isEvoCreepUnit(nil, victim) then
        lifesteal = lifesteal * 0.5
    end
    parent:Heal(event.damage * lifesteal, ab)
end
function modifier_evo_bristle_crush_e_passive.prototype.OnAttackLanded(self, event)
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
    local cleavePct = ab:GetSpecialValueFor("cleave_pct") / 100
    local cleaveDmg = event.damage * cleavePct
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        target:GetAbsOrigin(),
        nil,
        275,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() or enemy == target then
                goto __continue74
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = cleaveDmg,
                damage_type = 1
            })
        end
        ::__continue74::
    end
    local level = ab:GetLevel()
    if level >= 2 then
        if target:IsHero() then
            self.heroHitCount = self.heroHitCount + 1
        else
            self.creepHitCount = self.creepHitCount + 1
        end
        if self.heroHitCount >= 4 or self.creepHitCount >= 6 then
            if self.heroHitCount >= 4 then
                self.heroHitCount = 0
            end
            if self.creepHitCount >= 6 then
                self.creepHitCount = 0
            end
            local str = parent:IsRealHero() and parent:GetStrength() or 0
            local spikeDmg = 55 + str * 0.3
            local aoe = FindUnitsInRadius(
                parent:GetTeamNumber(),
                parent:GetAbsOrigin(),
                nil,
                300,
                2,
                1 + 18,
                0,
                0,
                false
            )
            parent:EmitSound("Hero_Bristleback.QuillSpray.Cast")
            for ____, enemy in ipairs(aoe) do
                do
                    if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                        goto __continue83
                    end
                    ApplyDamage({
                        victim = enemy,
                        attacker = parent,
                        ability = ab,
                        damage = spikeDmg,
                        damage_type = 1
                    })
                    applySunderStacks(
                        nil,
                        parent,
                        enemy,
                        ab,
                        1
                    )
                end
                ::__continue83::
            end
        end
    end
    if parent:HasModifier("modifier_evo_bristle_crush_r_frenzy") then
        local sunder = target:FindModifierByName("modifier_evo_bristle_crush_w_sunder")
        if sunder and sunder:GetStackCount() >= 4 then
            local str = parent:IsRealHero() and parent:GetStrength() or 0
            ApplyDamage({
                victim = target,
                attacker = parent,
                ability = ab,
                damage = 45 + str * 0.25,
                damage_type = 4
            })
        end
    end
end
function modifier_evo_bristle_crush_e_passive.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local victim = event.unit
    if not victim or victim:IsNull() or not victim:IsHero() then
        return
    end
    local qAb = parent:FindAbilityByName("evo_bristle_crush_q")
    if qAb and not qAb:IsNull() and qAb:GetLevel() >= 3 then
        local rem = qAb:GetCooldownTimeRemaining()
        if rem > 0 then
            qAb:EndCooldown()
            qAb:StartCooldown(math.max(0.1, rem * 0.3))
        end
    end
end
modifier_evo_bristle_crush_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_crush_e_passive")},
    modifier_evo_bristle_crush_e_passive
)
____exports.modifier_evo_bristle_crush_e_passive = modifier_evo_bristle_crush_e_passive
____exports.evo_bristle_crush_r = __TS__Class()
local evo_bristle_crush_r = ____exports.evo_bristle_crush_r
evo_bristle_crush_r.name = "evo_bristle_crush_r"
__TS__ClassExtends(evo_bristle_crush_r, BaseAbility)
function evo_bristle_crush_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Bristleback.Warpath.Cast")
    grantBristleAdrenalineStacks(nil, caster, 10)
    caster:AddNewModifier(caster, self, "modifier_evo_bristle_crush_r_frenzy", {duration = dur})
end
evo_bristle_crush_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_crush_r")},
    evo_bristle_crush_r
)
____exports.evo_bristle_crush_r = evo_bristle_crush_r
____exports.modifier_evo_bristle_crush_r_frenzy = __TS__Class()
local modifier_evo_bristle_crush_r_frenzy = ____exports.modifier_evo_bristle_crush_r_frenzy
modifier_evo_bristle_crush_r_frenzy.name = "modifier_evo_bristle_crush_r_frenzy"
__TS__ClassExtends(modifier_evo_bristle_crush_r_frenzy, BaseModifier)
function modifier_evo_bristle_crush_r_frenzy.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusStr = 0
end
function modifier_evo_bristle_crush_r_frenzy.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_crush_r_frenzy.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_crush_r_frenzy.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_crush_r_frenzy.prototype.GetTexture(self)
    return "bristleback_warpath"
end
function modifier_evo_bristle_crush_r_frenzy.prototype.OnCreated(self)
    self.bonusStr = 0
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() and parent:IsRealHero() then
        self.bonusStr = math.floor(parent:GetStrength() * 0.25 + 0.5)
    end
    self:StartIntervalThink(0.5)
end
function modifier_evo_bristle_crush_r_frenzy.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() and IsValidEntity(parent) and parent:IsAlive() then
        grantBristleAdrenalineStacks(nil, parent, 1)
    end
end
function modifier_evo_bristle_crush_r_frenzy.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS")
    }
end
function modifier_evo_bristle_crush_r_frenzy.prototype.GetModifierBonusStats_Strength(self)
    return self.bonusStr
end
function modifier_evo_bristle_crush_r_frenzy.prototype.GetModifierAttackRangeBonus(self)
    return 225
end
modifier_evo_bristle_crush_r_frenzy = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_crush_r_frenzy")},
    modifier_evo_bristle_crush_r_frenzy
)
____exports.modifier_evo_bristle_crush_r_frenzy = modifier_evo_bristle_crush_r_frenzy
return ____exports
