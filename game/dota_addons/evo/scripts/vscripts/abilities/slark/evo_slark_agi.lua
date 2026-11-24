local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 24,["30"] = 25,["32"] = 28,["33"] = 29,["34"] = 30,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 36,["41"] = 37,["42"] = 38,["43"] = 39,["44"] = 40,["45"] = 41,["46"] = 42,["48"] = 45,["49"] = 46,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 50,["54"] = 51,["57"] = 28,["58"] = 56,["59"] = 57,["60"] = 56,["61"] = 57,["62"] = 58,["63"] = 59,["66"] = 60,["67"] = 61,["70"] = 63,["71"] = 64,["72"] = 65,["73"] = 67,["74"] = 68,["75"] = 58,["76"] = 57,["77"] = 56,["78"] = 57,["80"] = 57,["81"] = 77,["82"] = 78,["83"] = 77,["84"] = 78,["86"] = 78,["87"] = 79,["88"] = 80,["89"] = 81,["90"] = 82,["91"] = 83,["92"] = 84,["93"] = 77,["94"] = 86,["95"] = 87,["96"] = 86,["97"] = 89,["98"] = 90,["99"] = 89,["100"] = 92,["101"] = 93,["102"] = 93,["103"] = 93,["104"] = 93,["105"] = 92,["106"] = 98,["107"] = 99,["110"] = 100,["111"] = 101,["112"] = 102,["113"] = 103,["114"] = 103,["115"] = 103,["116"] = 103,["117"] = 104,["118"] = 105,["119"] = 106,["120"] = 107,["121"] = 98,["122"] = 109,["123"] = 110,["126"] = 111,["127"] = 112,["128"] = 113,["131"] = 116,["132"] = 117,["133"] = 118,["134"] = 119,["135"] = 120,["136"] = 121,["137"] = 122,["138"] = 123,["139"] = 125,["140"] = 125,["141"] = 125,["142"] = 125,["143"] = 125,["144"] = 125,["145"] = 125,["146"] = 125,["147"] = 125,["148"] = 125,["149"] = 125,["150"] = 136,["151"] = 137,["152"] = 138,["153"] = 139,["157"] = 109,["158"] = 144,["159"] = 145,["160"] = 146,["161"] = 147,["164"] = 149,["165"] = 150,["166"] = 151,["167"] = 152,["168"] = 153,["169"] = 155,["170"] = 156,["171"] = 156,["172"] = 156,["173"] = 156,["174"] = 156,["175"] = 156,["176"] = 156,["177"] = 164,["178"] = 165,["179"] = 171,["180"] = 172,["181"] = 173,["182"] = 173,["183"] = 173,["184"] = 173,["185"] = 173,["186"] = 173,["187"] = 173,["188"] = 173,["189"] = 173,["190"] = 173,["192"] = 175,["193"] = 144,["194"] = 177,["195"] = 178,["198"] = 179,["199"] = 180,["202"] = 181,["203"] = 181,["204"] = 181,["205"] = 181,["206"] = 181,["207"] = 183,["210"] = 184,["211"] = 185,["214"] = 186,["215"] = 187,["216"] = 188,["217"] = 189,["218"] = 189,["219"] = 189,["220"] = 189,["221"] = 189,["222"] = 189,["223"] = 189,["224"] = 189,["225"] = 189,["226"] = 189,["227"] = 189,["228"] = 200,["230"] = 201,["231"] = 201,["233"] = 202,["234"] = 202,["235"] = 202,["236"] = 202,["237"] = 202,["238"] = 202,["239"] = 202,["243"] = 177,["244"] = 78,["245"] = 77,["246"] = 78,["248"] = 78,["249"] = 213,["250"] = 214,["251"] = 213,["252"] = 214,["254"] = 214,["255"] = 215,["256"] = 216,["257"] = 217,["258"] = 213,["259"] = 219,["260"] = 220,["261"] = 219,["262"] = 222,["263"] = 223,["264"] = 222,["265"] = 225,["266"] = 226,["267"] = 225,["268"] = 228,["269"] = 229,["270"] = 228,["271"] = 231,["272"] = 232,["275"] = 233,["276"] = 234,["277"] = 235,["278"] = 236,["279"] = 237,["280"] = 238,["281"] = 239,["282"] = 231,["283"] = 241,["284"] = 242,["287"] = 243,["288"] = 244,["291"] = 245,["292"] = 246,["293"] = 247,["294"] = 248,["295"] = 249,["296"] = 250,["297"] = 251,["298"] = 252,["299"] = 252,["300"] = 252,["301"] = 252,["302"] = 252,["303"] = 252,["304"] = 252,["305"] = 252,["306"] = 253,["308"] = 241,["309"] = 256,["310"] = 257,["311"] = 256,["312"] = 261,["313"] = 262,["314"] = 261,["315"] = 264,["316"] = 265,["319"] = 266,["320"] = 267,["321"] = 268,["322"] = 269,["325"] = 270,["328"] = 271,["329"] = 272,["330"] = 264,["331"] = 214,["332"] = 213,["333"] = 214,["335"] = 214,["336"] = 276,["337"] = 277,["338"] = 276,["339"] = 277,["340"] = 278,["341"] = 279,["344"] = 280,["345"] = 281,["348"] = 282,["349"] = 283,["350"] = 284,["351"] = 278,["352"] = 277,["353"] = 276,["354"] = 277,["356"] = 277,["357"] = 288,["358"] = 289,["359"] = 288,["360"] = 289,["361"] = 290,["362"] = 291,["363"] = 290,["364"] = 293,["365"] = 294,["366"] = 293,["367"] = 296,["368"] = 297,["369"] = 296,["370"] = 299,["371"] = 300,["372"] = 299,["373"] = 302,["374"] = 303,["377"] = 304,["378"] = 305,["379"] = 306,["382"] = 307,["383"] = 308,["384"] = 302,["385"] = 289,["386"] = 288,["387"] = 289,["389"] = 289,["390"] = 312,["391"] = 313,["392"] = 312,["393"] = 313,["395"] = 313,["396"] = 314,["397"] = 312,["398"] = 316,["399"] = 317,["400"] = 316,["401"] = 319,["402"] = 320,["403"] = 319,["404"] = 322,["405"] = 323,["408"] = 324,["409"] = 325,["410"] = 326,["411"] = 322,["412"] = 328,["413"] = 329,["416"] = 330,["417"] = 331,["418"] = 332,["421"] = 334,["422"] = 334,["423"] = 334,["424"] = 334,["425"] = 334,["426"] = 334,["427"] = 334,["428"] = 336,["429"] = 337,["430"] = 338,["431"] = 339,["432"] = 340,["433"] = 342,["434"] = 343,["435"] = 344,["437"] = 347,["438"] = 352,["439"] = 352,["440"] = 352,["441"] = 352,["442"] = 352,["443"] = 353,["444"] = 355,["445"] = 355,["446"] = 355,["447"] = 355,["448"] = 355,["449"] = 355,["450"] = 355,["451"] = 355,["452"] = 355,["453"] = 355,["454"] = 355,["455"] = 366,["457"] = 367,["458"] = 367,["460"] = 368,["461"] = 368,["462"] = 368,["463"] = 368,["464"] = 368,["465"] = 368,["466"] = 368,["467"] = 375,["468"] = 376,["473"] = 328,["474"] = 380,["475"] = 381,["478"] = 382,["479"] = 383,["480"] = 384,["483"] = 385,["484"] = 386,["485"] = 387,["486"] = 388,["487"] = 389,["490"] = 380,["491"] = 313,["492"] = 312,["493"] = 313,["495"] = 313,["496"] = 395,["497"] = 396,["498"] = 395,["499"] = 396,["500"] = 397,["501"] = 398,["502"] = 397,["503"] = 400,["504"] = 401,["505"] = 400,["506"] = 403,["507"] = 404,["508"] = 403,["509"] = 406,["510"] = 407,["511"] = 406,["512"] = 409,["513"] = 410,["514"] = 409,["515"] = 414,["516"] = 415,["517"] = 415,["518"] = 415,["519"] = 415,["520"] = 415,["521"] = 414,["522"] = 421,["523"] = 422,["524"] = 421,["525"] = 424,["526"] = 425,["527"] = 425,["528"] = 425,["529"] = 425,["530"] = 424,["531"] = 427,["532"] = 428,["533"] = 427,["534"] = 396,["535"] = 395,["536"] = 396,["538"] = 396,["539"] = 432,["540"] = 433,["541"] = 432,["542"] = 433,["543"] = 434,["544"] = 435,["545"] = 434,["546"] = 433,["547"] = 432,["548"] = 433,["550"] = 433,["551"] = 439,["552"] = 440,["553"] = 439,["554"] = 440,["556"] = 440,["557"] = 441,["558"] = 439,["559"] = 444,["560"] = 445,["561"] = 444,["562"] = 447,["563"] = 448,["564"] = 447,["565"] = 450,["566"] = 451,["567"] = 450,["568"] = 453,["569"] = 454,["570"] = 453,["571"] = 456,["572"] = 457,["573"] = 456,["574"] = 459,["575"] = 460,["578"] = 461,["579"] = 462,["580"] = 463,["583"] = 464,["586"] = 465,["587"] = 466,["590"] = 468,["591"] = 469,["592"] = 470,["593"] = 472,["594"] = 473,["595"] = 474,["596"] = 475,["597"] = 476,["599"] = 478,["600"] = 479,["602"] = 481,["603"] = 482,["604"] = 483,["605"] = 484,["606"] = 484,["607"] = 484,["608"] = 484,["609"] = 484,["610"] = 484,["611"] = 484,["612"] = 491,["613"] = 492,["616"] = 496,["617"] = 497,["618"] = 498,["619"] = 499,["620"] = 500,["621"] = 501,["625"] = 459,["626"] = 440,["627"] = 439,["628"] = 440,["630"] = 440,["631"] = 508,["632"] = 509,["633"] = 508,["634"] = 509,["635"] = 510,["636"] = 511,["637"] = 510,["638"] = 513,["639"] = 514,["640"] = 513,["641"] = 516,["642"] = 517,["643"] = 516,["644"] = 519,["645"] = 520,["646"] = 519,["647"] = 522,["648"] = 523,["649"] = 523,["650"] = 523,["651"] = 523,["652"] = 522,["653"] = 528,["654"] = 529,["655"] = 528,["656"] = 531,["657"] = 532,["658"] = 533,["659"] = 534,["661"] = 536,["662"] = 531,["663"] = 509,["664"] = 508,["665"] = 509,["667"] = 509,["668"] = 540,["669"] = 541,["670"] = 540,["671"] = 541,["672"] = 542,["673"] = 543,["674"] = 542,["675"] = 545,["676"] = 546,["677"] = 545,["678"] = 548,["679"] = 549,["680"] = 548,["681"] = 551,["682"] = 552,["683"] = 551,["684"] = 554,["685"] = 555,["686"] = 555,["687"] = 555,["688"] = 555,["689"] = 555,["690"] = 554,["691"] = 561,["692"] = 562,["693"] = 561,["694"] = 564,["695"] = 565,["696"] = 564,["697"] = 567,["698"] = 568,["699"] = 567,["700"] = 541,["701"] = 540,["702"] = 541,["704"] = 541,["705"] = 572,["706"] = 573,["707"] = 572,["708"] = 573,["709"] = 574,["710"] = 575,["713"] = 576,["714"] = 577,["717"] = 578,["718"] = 579,["719"] = 580,["720"] = 574,["721"] = 573,["722"] = 572,["723"] = 573,["725"] = 573,["726"] = 584,["727"] = 585,["728"] = 584,["729"] = 585,["730"] = 588,["731"] = 589,["732"] = 588,["733"] = 591,["734"] = 592,["735"] = 591,["736"] = 594,["737"] = 595,["738"] = 594,["739"] = 597,["740"] = 598,["741"] = 597,["742"] = 600,["743"] = 601,["746"] = 602,["747"] = 603,["748"] = 604,["750"] = 600,["751"] = 611,["752"] = 612,["755"] = 613,["756"] = 614,["757"] = 615,["758"] = 616,["760"] = 611,["761"] = 619,["762"] = 620,["763"] = 620,["764"] = 620,["765"] = 620,["766"] = 620,["767"] = 619,["768"] = 626,["769"] = 627,["770"] = 627,["771"] = 627,["772"] = 627,["773"] = 627,["774"] = 627,["775"] = 626,["776"] = 634,["777"] = 635,["778"] = 634,["779"] = 637,["780"] = 638,["781"] = 637,["782"] = 640,["783"] = 641,["784"] = 640,["785"] = 643,["786"] = 644,["787"] = 643,["788"] = 585,["789"] = 584,["790"] = 585,["792"] = 585});
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
for ____, modName in ipairs(SLARK_AGI_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
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
                goto __continue31
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = baseDmg + agi * agiPct,
                damage_type = 1
            })
        end
        ::__continue31::
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
                goto __continue68
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
        ::__continue68::
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
