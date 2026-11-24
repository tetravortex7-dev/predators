local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 24,["30"] = 25,["31"] = 26,["34"] = 30,["35"] = 31,["36"] = 32,["39"] = 34,["40"] = 35,["41"] = 36,["42"] = 38,["43"] = 39,["44"] = 40,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 44,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 52,["56"] = 53,["59"] = 30,["60"] = 58,["61"] = 59,["62"] = 58,["63"] = 59,["64"] = 60,["65"] = 61,["68"] = 62,["69"] = 63,["72"] = 65,["73"] = 66,["74"] = 67,["75"] = 69,["76"] = 70,["77"] = 60,["78"] = 59,["79"] = 58,["80"] = 59,["82"] = 59,["83"] = 79,["84"] = 80,["85"] = 79,["86"] = 80,["88"] = 80,["89"] = 81,["90"] = 82,["91"] = 83,["92"] = 84,["93"] = 85,["94"] = 86,["95"] = 79,["96"] = 88,["97"] = 89,["98"] = 88,["99"] = 91,["100"] = 92,["101"] = 91,["102"] = 94,["103"] = 95,["104"] = 95,["105"] = 95,["106"] = 95,["107"] = 94,["108"] = 100,["109"] = 101,["112"] = 102,["113"] = 103,["114"] = 104,["115"] = 105,["116"] = 105,["117"] = 105,["118"] = 105,["119"] = 106,["120"] = 107,["121"] = 108,["122"] = 109,["123"] = 100,["124"] = 111,["125"] = 112,["128"] = 113,["129"] = 114,["130"] = 115,["133"] = 118,["134"] = 119,["135"] = 120,["136"] = 121,["137"] = 122,["138"] = 123,["139"] = 124,["140"] = 125,["141"] = 127,["142"] = 127,["143"] = 127,["144"] = 127,["145"] = 127,["146"] = 127,["147"] = 127,["148"] = 127,["149"] = 127,["150"] = 127,["151"] = 127,["152"] = 138,["153"] = 139,["154"] = 140,["155"] = 141,["159"] = 111,["160"] = 146,["161"] = 147,["162"] = 148,["163"] = 149,["166"] = 151,["167"] = 152,["168"] = 153,["169"] = 154,["170"] = 155,["171"] = 157,["172"] = 158,["173"] = 158,["174"] = 158,["175"] = 158,["176"] = 158,["177"] = 158,["178"] = 158,["179"] = 166,["180"] = 167,["181"] = 173,["182"] = 174,["183"] = 175,["184"] = 175,["185"] = 175,["186"] = 175,["187"] = 175,["188"] = 175,["189"] = 175,["190"] = 175,["191"] = 175,["192"] = 175,["194"] = 177,["195"] = 146,["196"] = 179,["197"] = 180,["200"] = 181,["201"] = 182,["204"] = 183,["205"] = 183,["206"] = 183,["207"] = 183,["208"] = 183,["209"] = 185,["212"] = 186,["213"] = 187,["216"] = 188,["217"] = 189,["218"] = 190,["219"] = 191,["220"] = 191,["221"] = 191,["222"] = 191,["223"] = 191,["224"] = 191,["225"] = 191,["226"] = 191,["227"] = 191,["228"] = 191,["229"] = 191,["230"] = 202,["232"] = 203,["233"] = 203,["235"] = 204,["236"] = 204,["237"] = 204,["238"] = 204,["239"] = 204,["240"] = 204,["241"] = 204,["245"] = 179,["246"] = 80,["247"] = 79,["248"] = 80,["250"] = 80,["251"] = 215,["252"] = 216,["253"] = 215,["254"] = 216,["256"] = 216,["257"] = 217,["258"] = 218,["259"] = 219,["260"] = 215,["261"] = 221,["262"] = 222,["263"] = 221,["264"] = 224,["265"] = 225,["266"] = 224,["267"] = 227,["268"] = 228,["269"] = 227,["270"] = 230,["271"] = 231,["272"] = 230,["273"] = 233,["274"] = 234,["277"] = 235,["278"] = 236,["279"] = 237,["280"] = 238,["281"] = 239,["282"] = 240,["283"] = 241,["284"] = 233,["285"] = 243,["286"] = 244,["289"] = 245,["290"] = 246,["293"] = 247,["294"] = 248,["295"] = 249,["296"] = 250,["297"] = 251,["298"] = 252,["299"] = 253,["300"] = 254,["301"] = 254,["302"] = 254,["303"] = 254,["304"] = 254,["305"] = 254,["306"] = 254,["307"] = 254,["308"] = 255,["310"] = 243,["311"] = 258,["312"] = 259,["313"] = 258,["314"] = 263,["315"] = 264,["316"] = 263,["317"] = 266,["318"] = 267,["321"] = 268,["322"] = 269,["323"] = 270,["324"] = 271,["327"] = 272,["330"] = 273,["331"] = 274,["332"] = 266,["333"] = 216,["334"] = 215,["335"] = 216,["337"] = 216,["338"] = 278,["339"] = 279,["340"] = 278,["341"] = 279,["342"] = 280,["343"] = 281,["346"] = 282,["347"] = 283,["350"] = 284,["351"] = 285,["352"] = 286,["353"] = 280,["354"] = 279,["355"] = 278,["356"] = 279,["358"] = 279,["359"] = 290,["360"] = 291,["361"] = 290,["362"] = 291,["363"] = 292,["364"] = 293,["365"] = 292,["366"] = 295,["367"] = 296,["368"] = 295,["369"] = 298,["370"] = 299,["371"] = 298,["372"] = 301,["373"] = 302,["374"] = 301,["375"] = 304,["376"] = 305,["379"] = 306,["380"] = 307,["381"] = 308,["384"] = 309,["385"] = 310,["386"] = 304,["387"] = 291,["388"] = 290,["389"] = 291,["391"] = 291,["392"] = 314,["393"] = 315,["394"] = 314,["395"] = 315,["397"] = 315,["398"] = 316,["399"] = 314,["400"] = 318,["401"] = 319,["402"] = 318,["403"] = 321,["404"] = 322,["405"] = 321,["406"] = 324,["407"] = 325,["410"] = 326,["411"] = 327,["412"] = 328,["413"] = 324,["414"] = 330,["415"] = 331,["418"] = 332,["419"] = 333,["420"] = 334,["423"] = 336,["424"] = 336,["425"] = 336,["426"] = 336,["427"] = 336,["428"] = 336,["429"] = 336,["430"] = 338,["431"] = 339,["432"] = 340,["433"] = 341,["434"] = 342,["435"] = 344,["436"] = 345,["437"] = 346,["439"] = 349,["440"] = 354,["441"] = 354,["442"] = 354,["443"] = 354,["444"] = 354,["445"] = 355,["446"] = 357,["447"] = 357,["448"] = 357,["449"] = 357,["450"] = 357,["451"] = 357,["452"] = 357,["453"] = 357,["454"] = 357,["455"] = 357,["456"] = 357,["457"] = 368,["459"] = 369,["460"] = 369,["462"] = 370,["463"] = 370,["464"] = 370,["465"] = 370,["466"] = 370,["467"] = 370,["468"] = 370,["469"] = 377,["470"] = 378,["475"] = 330,["476"] = 382,["477"] = 383,["480"] = 384,["481"] = 385,["482"] = 386,["485"] = 387,["486"] = 388,["487"] = 389,["488"] = 390,["489"] = 391,["492"] = 382,["493"] = 315,["494"] = 314,["495"] = 315,["497"] = 315,["498"] = 397,["499"] = 398,["500"] = 397,["501"] = 398,["502"] = 399,["503"] = 400,["504"] = 399,["505"] = 402,["506"] = 403,["507"] = 402,["508"] = 405,["509"] = 406,["510"] = 405,["511"] = 408,["512"] = 409,["513"] = 408,["514"] = 411,["515"] = 412,["516"] = 411,["517"] = 416,["518"] = 417,["519"] = 417,["520"] = 417,["521"] = 417,["522"] = 417,["523"] = 416,["524"] = 423,["525"] = 424,["526"] = 423,["527"] = 426,["528"] = 427,["529"] = 427,["530"] = 427,["531"] = 427,["532"] = 426,["533"] = 429,["534"] = 430,["535"] = 429,["536"] = 398,["537"] = 397,["538"] = 398,["540"] = 398,["541"] = 434,["542"] = 435,["543"] = 434,["544"] = 435,["545"] = 436,["546"] = 437,["547"] = 436,["548"] = 435,["549"] = 434,["550"] = 435,["552"] = 435,["553"] = 441,["554"] = 442,["555"] = 441,["556"] = 442,["558"] = 442,["559"] = 443,["560"] = 441,["561"] = 446,["562"] = 447,["563"] = 446,["564"] = 449,["565"] = 450,["566"] = 449,["567"] = 452,["568"] = 453,["569"] = 452,["570"] = 455,["571"] = 456,["572"] = 455,["573"] = 458,["574"] = 459,["575"] = 458,["576"] = 461,["577"] = 462,["580"] = 463,["581"] = 464,["582"] = 465,["585"] = 466,["588"] = 467,["589"] = 468,["592"] = 470,["593"] = 471,["594"] = 472,["595"] = 474,["596"] = 475,["597"] = 476,["598"] = 477,["599"] = 478,["601"] = 480,["602"] = 481,["604"] = 483,["605"] = 484,["606"] = 485,["607"] = 486,["608"] = 486,["609"] = 486,["610"] = 486,["611"] = 486,["612"] = 486,["613"] = 486,["614"] = 493,["615"] = 494,["618"] = 498,["619"] = 499,["620"] = 500,["621"] = 501,["622"] = 502,["623"] = 503,["627"] = 461,["628"] = 442,["629"] = 441,["630"] = 442,["632"] = 442,["633"] = 510,["634"] = 511,["635"] = 510,["636"] = 511,["637"] = 512,["638"] = 513,["639"] = 512,["640"] = 515,["641"] = 516,["642"] = 515,["643"] = 518,["644"] = 519,["645"] = 518,["646"] = 521,["647"] = 522,["648"] = 521,["649"] = 524,["650"] = 525,["651"] = 525,["652"] = 525,["653"] = 525,["654"] = 524,["655"] = 530,["656"] = 531,["657"] = 530,["658"] = 533,["659"] = 534,["660"] = 535,["661"] = 536,["663"] = 538,["664"] = 533,["665"] = 511,["666"] = 510,["667"] = 511,["669"] = 511,["670"] = 542,["671"] = 543,["672"] = 542,["673"] = 543,["674"] = 544,["675"] = 545,["676"] = 544,["677"] = 547,["678"] = 548,["679"] = 547,["680"] = 550,["681"] = 551,["682"] = 550,["683"] = 553,["684"] = 554,["685"] = 553,["686"] = 556,["687"] = 557,["688"] = 557,["689"] = 557,["690"] = 557,["691"] = 557,["692"] = 556,["693"] = 563,["694"] = 564,["695"] = 563,["696"] = 566,["697"] = 567,["698"] = 566,["699"] = 569,["700"] = 570,["701"] = 569,["702"] = 543,["703"] = 542,["704"] = 543,["706"] = 543,["707"] = 574,["708"] = 575,["709"] = 574,["710"] = 575,["711"] = 576,["712"] = 577,["715"] = 578,["716"] = 579,["719"] = 580,["720"] = 581,["721"] = 582,["722"] = 576,["723"] = 575,["724"] = 574,["725"] = 575,["727"] = 575,["728"] = 586,["729"] = 587,["730"] = 586,["731"] = 587,["732"] = 590,["733"] = 591,["734"] = 590,["735"] = 593,["736"] = 594,["737"] = 593,["738"] = 596,["739"] = 597,["740"] = 596,["741"] = 599,["742"] = 600,["743"] = 599,["744"] = 602,["745"] = 603,["748"] = 604,["749"] = 605,["750"] = 606,["752"] = 602,["753"] = 613,["754"] = 614,["757"] = 615,["758"] = 616,["759"] = 617,["760"] = 618,["762"] = 613,["763"] = 621,["764"] = 622,["765"] = 622,["766"] = 622,["767"] = 622,["768"] = 622,["769"] = 621,["770"] = 628,["771"] = 629,["772"] = 629,["773"] = 629,["774"] = 629,["775"] = 629,["776"] = 629,["777"] = 628,["778"] = 636,["779"] = 637,["780"] = 636,["781"] = 639,["782"] = 640,["783"] = 639,["784"] = 642,["785"] = 643,["786"] = 642,["787"] = 645,["788"] = 646,["789"] = 645,["790"] = 587,["791"] = 586,["792"] = 587,["794"] = 587});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/slark/evo_slark_agi"
local SLARK_AGI_MODS = {
    "modifier_evo_slark_agi_q_leap",
    "modifier_evo_slark_agi_q_leash",
    "modifier_evo_slark_agi_w_charge",
    "modifier_evo_slark_agi_w_pulse",
    "modifier_evo_slark_agi_w_buff",
    "modifier_evo_slark_agi_e_passive",
    "modifier_evo_slark_agi_essence_buff",
    "modifier_evo_slark_agi_essence_debuff",
    "modifier_evo_slark_agi_r_shadow"
}
if IsServer() then
    for ____, modName in ipairs(SLARK_AGI_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
end
local function grantEssenceStack(self, caster, target, stacks)
    local eAb = caster:FindAbilityByName("evo_slark_agi_e")
    if not eAb or eAb:IsNull() or eAb:GetLevel() <= 0 then
        return
    end
    local isHero = target:IsHero()
    local dur = isHero and eAb:GetSpecialValueFor("hero_duration") or eAb:GetSpecialValueFor("creep_duration")
    local agiPerStack = isHero and eAb:GetSpecialValueFor("agi_per_stack") or 1
    local existing = caster:FindModifierByName("modifier_evo_slark_agi_essence_buff")
    local cur = existing and existing:GetStackCount() or 0
    local maxTotal = isHero and 120 or math.max(cur, 18)
    local next = math.min(maxTotal, cur + stacks * agiPerStack)
    local buff = caster:AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_buff", {duration = dur})
    if buff ~= nil then
        buff:SetStackCount(next)
    end
    if isHero then
        local debuffPerStack = eAb:GetSpecialValueFor("enemy_stat_loss")
        local exDebuff = target:FindModifierByName("modifier_evo_slark_agi_essence_debuff")
        local curDebuff = exDebuff and exDebuff:GetStackCount() or 0
        local debuff = target:AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_debuff", {duration = dur})
        if debuff ~= nil then
            debuff:SetStackCount(math.min(40, curDebuff + stacks * debuffPerStack))
        end
    end
end
____exports.evo_slark_agi_q = __TS__Class()
local evo_slark_agi_q = ____exports.evo_slark_agi_q
evo_slark_agi_q.name = "evo_slark_agi_q"
__TS__ClassExtends(evo_slark_agi_q, BaseAbility)
function evo_slark_agi_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dir = caster:GetForwardVector()
    local distance = self:GetSpecialValueFor("leap_distance")
    local duration = math.max(0.28, distance / 1750)
    caster:EmitSound("Hero_Slark.Pounce.Cast")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_q_leap", {duration = duration, dir_x = dir.x, dir_y = dir.y, distance = distance})
end
evo_slark_agi_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_q")},
    evo_slark_agi_q
)
____exports.evo_slark_agi_q = evo_slark_agi_q
____exports.modifier_evo_slark_agi_q_leap = __TS__Class()
local modifier_evo_slark_agi_q_leap = ____exports.modifier_evo_slark_agi_q_leap
modifier_evo_slark_agi_q_leap.name = "modifier_evo_slark_agi_q_leap"
__TS__ClassExtends(modifier_evo_slark_agi_q_leap, BaseModifier)
function modifier_evo_slark_agi_q_leap.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1750
    self.elapsed = 0
    self.totalDur = 0.4
    self.latched = false
end
function modifier_evo_slark_agi_q_leap.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_q_leap.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_q_leap.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_slark_agi_q_leap.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    local dist = params.distance or 650
    self.totalDur = math.max(
        0.2,
        self:GetDuration()
    )
    self.speed = dist / self.totalDur
    self.elapsed = 0
    self.latched = false
    self:StartIntervalThink(0.03)
end
function modifier_evo_slark_agi_q_leap.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        self:Destroy()
        return
    end
    self.elapsed = self.elapsed + 0.03
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    local groundZ = GetGroundHeight(nextPos, parent)
    local t = math.min(1, self.elapsed / self.totalDur)
    nextPos.z = groundZ + math.sin(t * math.pi) * 155
    parent:SetAbsOrigin(nextPos)
    local heroes = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        135,
        2,
        1,
        0,
        1,
        false
    )
    for ____, enemy in ipairs(heroes) do
        if enemy and not enemy:IsNull() and IsValidEntity(enemy) and enemy:IsAlive() then
            self:latchOnto(parent, enemy)
            self:Destroy()
            return
        end
    end
end
function modifier_evo_slark_agi_q_leap.prototype.latchOnto(self, caster, target)
    self.latched = true
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local level = ab:GetLevel()
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local leashDur = ab:GetSpecialValueFor("leash_duration")
    local agi = caster:IsRealHero() and caster:GetAgility() or 0
    caster:EmitSound("Hero_Slark.Pounce.Impact")
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = ab,
        damage = baseDmg + agi * agiPct,
        damage_type = 1
    })
    local anchor = target:GetAbsOrigin()
    target:AddNewModifier(caster, ab, "modifier_evo_slark_agi_q_leash", {duration = leashDur, anchor_x = anchor.x, anchor_y = anchor.y})
    if level >= 2 then
        grantEssenceStack(nil, caster, target, 2)
        caster:PerformAttack(
            target,
            true,
            true,
            true,
            false,
            false,
            false,
            false
        )
    end
    caster:MoveToTargetToAttack(target)
end
function modifier_evo_slark_agi_q_leap.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    FindClearSpaceForUnit(
        parent,
        parent:GetAbsOrigin(),
        true
    )
    if self.latched then
        return
    end
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local agi = parent:IsRealHero() and parent:GetAgility() or 0
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        225,
        2,
        1 + 18,
        0,
        1,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue32
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = baseDmg + agi * agiPct,
                damage_type = 1
            })
        end
        ::__continue32::
    end
end
modifier_evo_slark_agi_q_leap = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_q_leap")},
    modifier_evo_slark_agi_q_leap
)
____exports.modifier_evo_slark_agi_q_leap = modifier_evo_slark_agi_q_leap
____exports.modifier_evo_slark_agi_q_leash = __TS__Class()
local modifier_evo_slark_agi_q_leash = ____exports.modifier_evo_slark_agi_q_leash
modifier_evo_slark_agi_q_leash.name = "modifier_evo_slark_agi_q_leash"
__TS__ClassExtends(modifier_evo_slark_agi_q_leash, BaseModifier)
function modifier_evo_slark_agi_q_leash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.anchorX = 0
    self.anchorY = 0
    self.maxRadius = 350
end
function modifier_evo_slark_agi_q_leash.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_q_leash.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_agi_q_leash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_q_leash.prototype.GetTexture(self)
    return "slark_pounce"
end
function modifier_evo_slark_agi_q_leash.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local origin = parent and not parent:IsNull() and parent:GetAbsOrigin() or Vector(0, 0, 0)
    self.anchorX = params.anchor_x or origin.x
    self.anchorY = params.anchor_y or origin.y
    local ab = self:GetAbility()
    self.maxRadius = ab and ab:GetSpecialValueFor("leash_radius") or 350
    self:StartIntervalThink(0.05)
end
function modifier_evo_slark_agi_q_leash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    local pos = parent:GetAbsOrigin()
    local dx = pos.x - self.anchorX
    local dy = pos.y - self.anchorY
    local dist = math.sqrt(dx * dx + dy * dy)
    if dist > self.maxRadius then
        local nx = self.anchorX + dx / dist * self.maxRadius
        local ny = self.anchorY + dy / dist * self.maxRadius
        local clamped = Vector(
            nx,
            ny,
            GetGroundHeight(
                Vector(nx, ny, pos.z),
                parent
            )
        )
        parent:SetAbsOrigin(clamped)
    end
end
function modifier_evo_slark_agi_q_leash.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_TETHERED")] = true}
end
function modifier_evo_slark_agi_q_leash.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")}
end
function modifier_evo_slark_agi_q_leash.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not caster or caster:IsNull() or not ab then
        return
    end
    if event.unit ~= parent or ab:GetLevel() < 3 then
        return
    end
    ab:EndCooldown()
    caster:GiveMana(caster:GetMaxMana() * 0.25)
end
modifier_evo_slark_agi_q_leash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_q_leash")},
    modifier_evo_slark_agi_q_leash
)
____exports.modifier_evo_slark_agi_q_leash = modifier_evo_slark_agi_q_leash
____exports.evo_slark_agi_w = __TS__Class()
local evo_slark_agi_w = ____exports.evo_slark_agi_w
evo_slark_agi_w.name = "evo_slark_agi_w"
__TS__ClassExtends(evo_slark_agi_w, BaseAbility)
function evo_slark_agi_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local delay = self:GetSpecialValueFor("delay")
    caster:EmitSound("Hero_Slark.DarkPact.PreCast")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_w_charge", {duration = delay})
end
evo_slark_agi_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_w")},
    evo_slark_agi_w
)
____exports.evo_slark_agi_w = evo_slark_agi_w
____exports.modifier_evo_slark_agi_w_charge = __TS__Class()
local modifier_evo_slark_agi_w_charge = ____exports.modifier_evo_slark_agi_w_charge
modifier_evo_slark_agi_w_charge.name = "modifier_evo_slark_agi_w_charge"
__TS__ClassExtends(modifier_evo_slark_agi_w_charge, BaseModifier)
function modifier_evo_slark_agi_w_charge.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.GetTexture(self)
    return "slark_dark_pact"
end
function modifier_evo_slark_agi_w_charge.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    parent:EmitSound("Hero_Slark.DarkPact.Cast")
    parent:AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_pulse", {duration = 0.85})
end
modifier_evo_slark_agi_w_charge = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_charge")},
    modifier_evo_slark_agi_w_charge
)
____exports.modifier_evo_slark_agi_w_charge = modifier_evo_slark_agi_w_charge
____exports.modifier_evo_slark_agi_w_pulse = __TS__Class()
local modifier_evo_slark_agi_w_pulse = ____exports.modifier_evo_slark_agi_w_pulse
modifier_evo_slark_agi_w_pulse.name = "modifier_evo_slark_agi_w_pulse"
__TS__ClassExtends(modifier_evo_slark_agi_w_pulse, BaseModifier)
function modifier_evo_slark_agi_w_pulse.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitHeroIds = __TS__New(Set)
end
function modifier_evo_slark_agi_w_pulse.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_w_pulse.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_w_pulse.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.hitHeroIds = __TS__New(Set)
    self:OnIntervalThink()
    self:StartIntervalThink(0.2)
end
function modifier_evo_slark_agi_w_pulse.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    parent:Purge(
        false,
        true,
        false,
        true,
        true
    )
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local radius = ab:GetSpecialValueFor("radius")
    local agi = parent:IsRealHero() and parent:GetAgility() or 0
    local pulseDmg = (baseDmg + agi * agiPct) / 5
    local selfDmg = pulseDmg * 0.35
    if parent:GetHealth() > selfDmg + 1 then
        parent:SetHealth(parent:GetHealth() - selfDmg)
    end
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slark/slark_dark_pact_pulses.vpcf", 1, parent)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(radius, radius, radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
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
                goto __continue69
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = pulseDmg,
                damage_type = 2
            })
            if enemy:IsHero() then
                self.hitHeroIds:add(enemy:entindex())
            end
        end
        ::__continue69::
    end
end
function modifier_evo_slark_agi_w_pulse.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    if ab:GetLevel() >= 2 then
        local dur = ab:GetLevel() >= 3 and 4 or 2.5
        local mod = parent:AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_buff", {duration = dur})
        if mod ~= nil then
            mod:SetStackCount(ab:GetLevel() >= 3 and math.max(1, self.hitHeroIds.size) or 0)
        end
    end
end
modifier_evo_slark_agi_w_pulse = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_pulse")},
    modifier_evo_slark_agi_w_pulse
)
____exports.modifier_evo_slark_agi_w_pulse = modifier_evo_slark_agi_w_pulse
____exports.modifier_evo_slark_agi_w_buff = __TS__Class()
local modifier_evo_slark_agi_w_buff = ____exports.modifier_evo_slark_agi_w_buff
modifier_evo_slark_agi_w_buff.name = "modifier_evo_slark_agi_w_buff"
__TS__ClassExtends(modifier_evo_slark_agi_w_buff, BaseModifier)
function modifier_evo_slark_agi_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_slark_agi_w_buff.prototype.GetTexture(self)
    return "slark_dark_pact"
end
function modifier_evo_slark_agi_w_buff.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_slark_agi_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EVASION_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 20
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierEvasion_Constant(self)
    return math.min(
        50,
        self:GetStackCount() * 10
    )
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self:GetStackCount() * 20
end
modifier_evo_slark_agi_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_buff")},
    modifier_evo_slark_agi_w_buff
)
____exports.modifier_evo_slark_agi_w_buff = modifier_evo_slark_agi_w_buff
____exports.evo_slark_agi_e = __TS__Class()
local evo_slark_agi_e = ____exports.evo_slark_agi_e
evo_slark_agi_e.name = "evo_slark_agi_e"
__TS__ClassExtends(evo_slark_agi_e, BaseAbility)
function evo_slark_agi_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_slark_agi_e_passive"
end
evo_slark_agi_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_e")},
    evo_slark_agi_e
)
____exports.evo_slark_agi_e = evo_slark_agi_e
____exports.modifier_evo_slark_agi_e_passive = __TS__Class()
local modifier_evo_slark_agi_e_passive = ____exports.modifier_evo_slark_agi_e_passive
modifier_evo_slark_agi_e_passive.name = "modifier_evo_slark_agi_e_passive"
__TS__ClassExtends(modifier_evo_slark_agi_e_passive, BaseModifier)
function modifier_evo_slark_agi_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitCounter = 0
end
function modifier_evo_slark_agi_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_slark_agi_e_passive.prototype.OnCreated(self)
    self.hitCounter = 0
end
function modifier_evo_slark_agi_e_passive.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_slark_agi_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    local inShadow = parent:HasModifier("modifier_evo_slark_agi_r_shadow")
    local baseStacks = inShadow and 2 or 1
    grantEssenceStack(nil, parent, target, baseStacks)
    local level = ab:GetLevel()
    if level >= 2 and target:IsHero() then
        local tid = target:entindex()
        if self.lastTargetId == tid then
            self.hitCounter = self.hitCounter + 1
        else
            self.lastTargetId = tid
            self.hitCounter = 1
        end
        if self.hitCounter >= 4 then
            self.hitCounter = 0
            local agi = parent:IsRealHero() and parent:GetAgility() or 0
            ApplyDamage({
                victim = target,
                attacker = parent,
                ability = ab,
                damage = 70 + agi * 0.6,
                damage_type = 1
            })
            grantEssenceStack(nil, parent, target, 1)
            target:EmitSound("Hero_Slark.EssenceShift")
        end
    end
    if level >= 3 then
        local buff = parent:FindModifierByName("modifier_evo_slark_agi_essence_buff")
        if buff and buff:GetStackCount() >= 10 then
            local heal = event.damage * 0.15
            if heal > 0 then
                parent:Heal(heal, ab)
            end
        end
    end
end
modifier_evo_slark_agi_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_e_passive")},
    modifier_evo_slark_agi_e_passive
)
____exports.modifier_evo_slark_agi_e_passive = modifier_evo_slark_agi_e_passive
____exports.modifier_evo_slark_agi_essence_buff = __TS__Class()
local modifier_evo_slark_agi_essence_buff = ____exports.modifier_evo_slark_agi_essence_buff
modifier_evo_slark_agi_essence_buff.name = "modifier_evo_slark_agi_essence_buff"
__TS__ClassExtends(modifier_evo_slark_agi_essence_buff, BaseModifier)
function modifier_evo_slark_agi_essence_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_essence_buff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_agi_essence_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")
    }
end
function modifier_evo_slark_agi_essence_buff.prototype.GetModifierBonusStats_Agility(self)
    return self:GetStackCount()
end
function modifier_evo_slark_agi_essence_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ab = self:GetAbility()
    if ab and ab:GetLevel() >= 3 and self:GetStackCount() >= 10 then
        return 10
    end
    return 0
end
modifier_evo_slark_agi_essence_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_essence_buff")},
    modifier_evo_slark_agi_essence_buff
)
____exports.modifier_evo_slark_agi_essence_buff = modifier_evo_slark_agi_essence_buff
____exports.modifier_evo_slark_agi_essence_debuff = __TS__Class()
local modifier_evo_slark_agi_essence_debuff = ____exports.modifier_evo_slark_agi_essence_debuff
modifier_evo_slark_agi_essence_debuff.name = "modifier_evo_slark_agi_essence_debuff"
__TS__ClassExtends(modifier_evo_slark_agi_essence_debuff, BaseModifier)
function modifier_evo_slark_agi_essence_debuff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_essence_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_agi_essence_debuff.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_agi_essence_debuff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_INTELLECT_BONUS")
    }
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Strength(self)
    return -self:GetStackCount()
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Agility(self)
    return -self:GetStackCount()
end
function modifier_evo_slark_agi_essence_debuff.prototype.GetModifierBonusStats_Intellect(self)
    return -self:GetStackCount()
end
modifier_evo_slark_agi_essence_debuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_essence_debuff")},
    modifier_evo_slark_agi_essence_debuff
)
____exports.modifier_evo_slark_agi_essence_debuff = modifier_evo_slark_agi_essence_debuff
____exports.evo_slark_agi_r = __TS__Class()
local evo_slark_agi_r = ____exports.evo_slark_agi_r
evo_slark_agi_r.name = "evo_slark_agi_r"
__TS__ClassExtends(evo_slark_agi_r, BaseAbility)
function evo_slark_agi_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Slark.ShadowDance")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_r_shadow", {duration = dur})
end
evo_slark_agi_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_r")},
    evo_slark_agi_r
)
____exports.evo_slark_agi_r = evo_slark_agi_r
____exports.modifier_evo_slark_agi_r_shadow = __TS__Class()
local modifier_evo_slark_agi_r_shadow = ____exports.modifier_evo_slark_agi_r_shadow
modifier_evo_slark_agi_r_shadow.name = "modifier_evo_slark_agi_r_shadow"
__TS__ClassExtends(modifier_evo_slark_agi_r_shadow, BaseModifier)
function modifier_evo_slark_agi_r_shadow.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_r_shadow.prototype.GetTexture(self)
    return "slark_shadow_dance"
end
function modifier_evo_slark_agi_r_shadow.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slark/slark_shadow_dance.vpcf", 1, parent)
    end
end
function modifier_evo_slark_agi_r_shadow.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
end
function modifier_evo_slark_agi_r_shadow.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_INVISIBLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_TRUESIGHT_IMMUNE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_UNTARGETABLE_ENEMY")] = true
    }
end
function modifier_evo_slark_agi_r_shadow.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierInvisibilityLevel(self)
    return 2
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 30
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierHealthRegenPercentage(self)
    return 5
end
function modifier_evo_slark_agi_r_shadow.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 50
end
modifier_evo_slark_agi_r_shadow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_r_shadow")},
    modifier_evo_slark_agi_r_shadow
)
____exports.modifier_evo_slark_agi_r_shadow = modifier_evo_slark_agi_r_shadow
return ____exports
