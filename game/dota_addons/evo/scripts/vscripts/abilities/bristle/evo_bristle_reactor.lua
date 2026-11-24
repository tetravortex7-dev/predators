local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["30"] = 25,["33"] = 29,["34"] = 30,["35"] = 32,["36"] = 33,["37"] = 33,["39"] = 34,["40"] = 35,["41"] = 32,["42"] = 38,["43"] = 44,["44"] = 45,["45"] = 46,["46"] = 47,["47"] = 48,["48"] = 48,["49"] = 48,["50"] = 48,["51"] = 49,["52"] = 50,["53"] = 51,["55"] = 38,["56"] = 55,["57"] = 56,["58"] = 55,["59"] = 56,["60"] = 57,["61"] = 58,["64"] = 59,["65"] = 60,["68"] = 62,["69"] = 63,["70"] = 64,["71"] = 65,["72"] = 66,["73"] = 68,["74"] = 69,["75"] = 69,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 69,["80"] = 69,["81"] = 69,["82"] = 69,["83"] = 69,["84"] = 69,["85"] = 80,["87"] = 81,["88"] = 81,["90"] = 82,["91"] = 82,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["97"] = 89,["98"] = 89,["99"] = 89,["100"] = 89,["101"] = 89,["102"] = 89,["103"] = 89,["107"] = 92,["108"] = 92,["109"] = 92,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 92,["116"] = 57,["117"] = 56,["118"] = 55,["119"] = 56,["121"] = 56,["122"] = 104,["123"] = 105,["124"] = 104,["125"] = 105,["126"] = 106,["127"] = 107,["128"] = 106,["129"] = 109,["130"] = 110,["131"] = 109,["132"] = 112,["133"] = 113,["134"] = 112,["135"] = 115,["136"] = 116,["137"] = 115,["138"] = 118,["139"] = 119,["140"] = 119,["141"] = 119,["142"] = 119,["143"] = 119,["144"] = 118,["145"] = 125,["146"] = 126,["147"] = 127,["148"] = 125,["149"] = 129,["150"] = 130,["151"] = 131,["152"] = 132,["153"] = 129,["154"] = 134,["155"] = 135,["156"] = 134,["157"] = 137,["158"] = 138,["159"] = 137,["160"] = 105,["161"] = 104,["162"] = 105,["164"] = 105,["165"] = 142,["166"] = 143,["167"] = 142,["168"] = 143,["169"] = 144,["170"] = 145,["171"] = 144,["172"] = 147,["173"] = 148,["174"] = 147,["175"] = 150,["176"] = 151,["179"] = 152,["180"] = 153,["181"] = 154,["182"] = 155,["183"] = 160,["184"] = 160,["185"] = 160,["186"] = 160,["187"] = 160,["188"] = 161,["189"] = 161,["190"] = 161,["191"] = 161,["192"] = 161,["193"] = 162,["195"] = 164,["196"] = 150,["197"] = 166,["198"] = 167,["201"] = 168,["202"] = 169,["203"] = 170,["205"] = 166,["206"] = 173,["207"] = 174,["208"] = 175,["209"] = 173,["210"] = 177,["211"] = 178,["212"] = 177,["213"] = 180,["214"] = 181,["215"] = 180,["216"] = 183,["217"] = 184,["218"] = 183,["219"] = 186,["220"] = 187,["221"] = 186,["222"] = 189,["223"] = 190,["226"] = 191,["227"] = 192,["228"] = 193,["229"] = 194,["232"] = 196,["233"] = 197,["234"] = 197,["235"] = 197,["236"] = 197,["237"] = 197,["238"] = 197,["239"] = 197,["240"] = 197,["241"] = 197,["242"] = 197,["243"] = 197,["244"] = 208,["246"] = 209,["247"] = 209,["249"] = 210,["250"] = 210,["251"] = 210,["252"] = 210,["253"] = 210,["254"] = 210,["255"] = 210,["259"] = 189,["260"] = 143,["261"] = 142,["262"] = 143,["264"] = 143,["265"] = 221,["266"] = 222,["267"] = 221,["268"] = 222,["269"] = 223,["270"] = 224,["273"] = 225,["274"] = 226,["277"] = 228,["278"] = 229,["279"] = 230,["280"] = 231,["281"] = 232,["282"] = 233,["283"] = 234,["284"] = 235,["285"] = 237,["286"] = 238,["287"] = 239,["288"] = 240,["289"] = 242,["290"] = 243,["291"] = 243,["292"] = 243,["293"] = 243,["294"] = 243,["295"] = 243,["296"] = 243,["297"] = 243,["298"] = 243,["299"] = 243,["300"] = 243,["301"] = 255,["302"] = 256,["303"] = 257,["305"] = 258,["306"] = 258,["308"] = 259,["309"] = 259,["310"] = 259,["311"] = 259,["312"] = 259,["313"] = 260,["314"] = 261,["315"] = 261,["317"] = 263,["318"] = 264,["319"] = 264,["320"] = 264,["321"] = 264,["322"] = 264,["323"] = 264,["324"] = 264,["325"] = 272,["326"] = 273,["327"] = 274,["332"] = 278,["333"] = 279,["334"] = 280,["336"] = 281,["337"] = 282,["338"] = 283,["340"] = 285,["341"] = 286,["342"] = 287,["343"] = 288,["344"] = 288,["345"] = 288,["346"] = 288,["347"] = 288,["348"] = 288,["349"] = 288,["350"] = 288,["351"] = 288,["352"] = 288,["353"] = 288,["354"] = 299,["356"] = 300,["357"] = 300,["359"] = 301,["360"] = 301,["361"] = 301,["362"] = 301,["363"] = 301,["364"] = 301,["365"] = 301,["369"] = 309,["370"] = 310,["375"] = 314,["377"] = 315,["378"] = 316,["379"] = 317,["381"] = 319,["382"] = 322,["383"] = 322,["384"] = 322,["385"] = 322,["386"] = 322,["387"] = 323,["388"] = 324,["393"] = 328,["394"] = 329,["396"] = 223,["397"] = 222,["398"] = 221,["399"] = 222,["401"] = 222,["402"] = 334,["403"] = 335,["404"] = 334,["405"] = 335,["406"] = 336,["407"] = 337,["408"] = 336,["409"] = 339,["410"] = 340,["411"] = 339,["412"] = 342,["413"] = 343,["414"] = 342,["415"] = 345,["416"] = 346,["417"] = 345,["418"] = 348,["419"] = 349,["420"] = 349,["421"] = 349,["422"] = 349,["423"] = 348,["424"] = 354,["425"] = 355,["426"] = 354,["427"] = 357,["428"] = 358,["429"] = 357,["430"] = 335,["431"] = 334,["432"] = 335,["434"] = 335,["435"] = 362,["436"] = 363,["437"] = 362,["438"] = 363,["439"] = 364,["440"] = 365,["441"] = 366,["443"] = 368,["444"] = 364,["445"] = 370,["446"] = 371,["447"] = 370,["448"] = 373,["449"] = 374,["452"] = 375,["453"] = 376,["456"] = 378,["457"] = 379,["458"] = 379,["459"] = 379,["460"] = 379,["461"] = 380,["462"] = 382,["463"] = 382,["464"] = 382,["465"] = 382,["466"] = 382,["467"] = 382,["468"] = 382,["469"] = 383,["470"] = 385,["471"] = 386,["472"] = 387,["474"] = 390,["475"] = 390,["476"] = 390,["477"] = 390,["478"] = 390,["479"] = 390,["480"] = 390,["481"] = 390,["482"] = 390,["483"] = 390,["484"] = 390,["485"] = 401,["487"] = 402,["488"] = 402,["490"] = 403,["494"] = 373,["495"] = 363,["496"] = 362,["497"] = 363,["499"] = 363,["500"] = 408,["501"] = 409,["502"] = 408,["503"] = 409,["504"] = 410,["505"] = 411,["506"] = 410,["507"] = 413,["508"] = 414,["509"] = 413,["510"] = 416,["511"] = 417,["512"] = 416,["513"] = 419,["514"] = 420,["517"] = 421,["518"] = 419,["519"] = 423,["520"] = 424,["523"] = 425,["524"] = 426,["525"] = 427,["528"] = 428,["529"] = 428,["530"] = 428,["531"] = 428,["532"] = 428,["533"] = 428,["534"] = 428,["535"] = 428,["536"] = 428,["537"] = 428,["538"] = 428,["539"] = 439,["540"] = 440,["541"] = 441,["542"] = 442,["543"] = 442,["546"] = 444,["547"] = 445,["548"] = 446,["549"] = 447,["550"] = 448,["553"] = 423,["554"] = 452,["555"] = 453,["556"] = 453,["557"] = 453,["558"] = 453,["559"] = 452,["560"] = 458,["561"] = 459,["562"] = 458,["563"] = 461,["564"] = 462,["567"] = 463,["568"] = 464,["569"] = 465,["572"] = 466,["573"] = 467,["576"] = 469,["577"] = 470,["578"] = 471,["579"] = 471,["580"] = 471,["581"] = 471,["582"] = 471,["583"] = 471,["584"] = 471,["585"] = 478,["586"] = 478,["587"] = 478,["588"] = 478,["589"] = 478,["590"] = 478,["591"] = 478,["592"] = 461,["593"] = 409,["594"] = 408,["595"] = 409,["597"] = 409,["598"] = 482,["599"] = 483,["600"] = 482,["601"] = 483,["602"] = 484,["603"] = 485,["604"] = 484,["605"] = 487,["606"] = 488,["607"] = 487,["608"] = 490,["609"] = 491,["610"] = 490,["611"] = 493,["612"] = 494,["613"] = 493,["614"] = 496,["615"] = 497,["616"] = 496,["617"] = 499,["618"] = 500,["619"] = 500,["621"] = 501,["622"] = 502,["623"] = 502,["625"] = 503,["626"] = 503,["627"] = 503,["628"] = 503,["629"] = 504,["630"] = 505,["631"] = 506,["633"] = 508,["635"] = 510,["636"] = 499,["637"] = 483,["638"] = 482,["639"] = 483,["641"] = 483,["642"] = 514,["643"] = 515,["644"] = 514,["645"] = 515,["646"] = 516,["647"] = 517,["648"] = 516,["649"] = 519,["650"] = 520,["651"] = 519,["652"] = 522,["653"] = 523,["654"] = 522,["655"] = 525,["656"] = 526,["657"] = 525,["658"] = 528,["659"] = 529,["660"] = 529,["661"] = 529,["662"] = 529,["663"] = 528,["664"] = 534,["665"] = 535,["666"] = 534,["667"] = 537,["668"] = 538,["669"] = 537,["670"] = 515,["671"] = 514,["672"] = 515,["674"] = 515,["675"] = 542,["676"] = 543,["677"] = 542,["678"] = 543,["679"] = 544,["680"] = 545,["681"] = 544,["682"] = 547,["683"] = 548,["684"] = 547,["685"] = 550,["686"] = 551,["687"] = 550,["688"] = 553,["689"] = 554,["690"] = 553,["691"] = 556,["692"] = 557,["693"] = 557,["694"] = 557,["695"] = 557,["696"] = 557,["697"] = 556,["698"] = 563,["699"] = 564,["700"] = 563,["701"] = 566,["702"] = 567,["703"] = 566,["704"] = 569,["705"] = 570,["706"] = 569,["707"] = 543,["708"] = 542,["709"] = 543,["711"] = 543,["712"] = 574,["713"] = 575,["714"] = 574,["715"] = 575,["716"] = 576,["717"] = 577,["720"] = 578,["721"] = 579,["724"] = 580,["725"] = 581,["726"] = 582,["727"] = 583,["728"] = 583,["729"] = 583,["730"] = 583,["731"] = 583,["732"] = 583,["733"] = 583,["734"] = 583,["735"] = 583,["736"] = 576,["737"] = 575,["738"] = 574,["739"] = 575,["741"] = 575,["742"] = 595,["743"] = 596,["744"] = 595,["745"] = 596,["747"] = 596,["748"] = 597,["749"] = 595,["750"] = 599,["751"] = 600,["752"] = 599,["753"] = 602,["754"] = 603,["755"] = 602,["756"] = 605,["757"] = 606,["760"] = 607,["761"] = 608,["762"] = 609,["763"] = 610,["764"] = 611,["765"] = 612,["766"] = 617,["767"] = 617,["768"] = 617,["769"] = 617,["770"] = 617,["771"] = 618,["772"] = 618,["773"] = 618,["774"] = 618,["775"] = 618,["776"] = 619,["778"] = 621,["779"] = 622,["780"] = 605,["781"] = 624,["782"] = 625,["785"] = 626,["786"] = 627,["787"] = 628,["789"] = 624,["790"] = 631,["791"] = 632,["794"] = 633,["795"] = 631,["796"] = 635,["797"] = 636,["798"] = 637,["799"] = 638,["800"] = 639,["803"] = 641,["804"] = 642,["805"] = 643,["806"] = 643,["807"] = 643,["808"] = 643,["809"] = 643,["810"] = 643,["811"] = 643,["812"] = 643,["813"] = 643,["814"] = 643,["815"] = 643,["816"] = 654,["818"] = 655,["819"] = 655,["821"] = 656,["822"] = 656,["823"] = 656,["824"] = 656,["825"] = 656,["826"] = 656,["827"] = 656,["828"] = 657,["829"] = 657,["830"] = 657,["831"] = 657,["832"] = 657,["833"] = 657,["834"] = 657,["835"] = 664,["836"] = 664,["837"] = 664,["838"] = 664,["839"] = 664,["840"] = 665,["841"] = 666,["842"] = 667,["843"] = 668,["844"] = 669,["845"] = 669,["846"] = 669,["847"] = 669,["848"] = 669,["849"] = 674,["854"] = 635,["855"] = 596,["856"] = 595,["857"] = 596,["859"] = 596});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/bristle/evo_bristle_reactor"
local REACTOR_MODS = {
    "modifier_evo_bristle_react_catalyst",
    "modifier_evo_bristle_react_q_puddle",
    "modifier_evo_bristle_react_w_buff",
    "modifier_evo_bristle_react_e_passive",
    "modifier_evo_bristle_react_e_shield",
    "modifier_evo_bristle_react_e_cloud",
    "modifier_evo_bristle_react_e_stats",
    "modifier_evo_bristle_react_r_thinker"
}
if IsServer() then
    for ____, modName in ipairs(REACTOR_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
end
local activePuddles = __TS__New(Set)
local activeReactorZones = __TS__New(Set)
function ____exports.getAllAttributesSum(self, unit)
    if not unit:IsRealHero() then
        return 0
    end
    local hero = unit
    return hero:GetStrength() + hero:GetAgility() + hero:GetIntellect(false)
end
local function applyCatalystStacks(self, caster, target, ability, count)
    local eAb = caster:FindAbilityByName("evo_bristle_react_e")
    local lvl = eAb and not eAb:IsNull() and eAb:GetLevel() or ability:GetLevel()
    local maxStacks = lvl >= 3 and 6 or (lvl >= 2 and 5 or 4)
    local ex = target:FindModifierByName("modifier_evo_bristle_react_catalyst")
    local next = math.min(
        maxStacks,
        (ex and ex:GetStackCount() or 0) + count
    )
    local mod = target:AddNewModifier(caster, ability, "modifier_evo_bristle_react_catalyst", {duration = 5})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
____exports.evo_bristle_react_q = __TS__Class()
local evo_bristle_react_q = ____exports.evo_bristle_react_q
evo_bristle_react_q.name = "evo_bristle_react_q"
__TS__ClassExtends(evo_bristle_react_q, BaseAbility)
function evo_bristle_react_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local dmgBase = baseDmg + ____exports.getAllAttributesSum(nil, caster) * attrPct
    caster:EmitSound("Hero_Alchemist.AcidSpray")
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        pos,
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
                goto __continue12
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = enemy:IsCreep() and dmgBase * 1.3 or dmgBase,
                damage_type = 2
            })
            applyCatalystStacks(
                nil,
                caster,
                enemy,
                self,
                2
            )
        end
        ::__continue12::
    end
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_bristle_react_q_puddle",
        {duration = 4},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_bristle_react_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_q")},
    evo_bristle_react_q
)
____exports.evo_bristle_react_q = evo_bristle_react_q
____exports.modifier_evo_bristle_react_catalyst = __TS__Class()
local modifier_evo_bristle_react_catalyst = ____exports.modifier_evo_bristle_react_catalyst
modifier_evo_bristle_react_catalyst.name = "modifier_evo_bristle_react_catalyst"
__TS__ClassExtends(modifier_evo_bristle_react_catalyst, BaseModifier)
function modifier_evo_bristle_react_catalyst.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_catalyst.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_react_catalyst.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_catalyst.prototype.GetTexture(self)
    return "alchemist_acid_spray"
end
function modifier_evo_bristle_react_catalyst.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")
    }
end
function modifier_evo_bristle_react_catalyst.prototype.getLevel(self)
    local ab = self:GetAbility()
    return ab and ab:GetLevel() or 1
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierMagicalResistanceBonus(self)
    local lvl = self:getLevel()
    local per = lvl >= 3 and 6 or (lvl >= 2 and 5 or 4)
    return -per * self:GetStackCount()
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierPhysicalArmorBonus(self)
    return -1.5 * self:GetStackCount()
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -5 * self:GetStackCount()
end
modifier_evo_bristle_react_catalyst = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_catalyst")},
    modifier_evo_bristle_react_catalyst
)
____exports.modifier_evo_bristle_react_catalyst = modifier_evo_bristle_react_catalyst
____exports.modifier_evo_bristle_react_q_puddle = __TS__Class()
local modifier_evo_bristle_react_q_puddle = ____exports.modifier_evo_bristle_react_q_puddle
modifier_evo_bristle_react_q_puddle.name = "modifier_evo_bristle_react_q_puddle"
__TS__ClassExtends(modifier_evo_bristle_react_q_puddle, BaseModifier)
function modifier_evo_bristle_react_q_puddle.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_react_q_puddle.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_react_q_puddle.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        activePuddles:add(parent)
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", 8, nil)
        ParticleManager:SetParticleControl(
            pfx,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            pfx,
            1,
            Vector(260, 1, 1)
        )
        ParticleManager:ReleaseParticleIndex(pfx)
    end
    self:StartIntervalThink(1)
end
function modifier_evo_bristle_react_q_puddle.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent ~= nil then
        activePuddles:delete(parent)
    end
end
function modifier_evo_bristle_react_q_puddle.prototype.IsAura(self)
    local ab = self:GetAbility()
    return ab ~= nil and ab:GetLevel() >= 2
end
function modifier_evo_bristle_react_q_puddle.prototype.GetModifierAura(self)
    return "modifier_truesight"
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraRadius(self)
    return 260
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraSearchType(self)
    return 1 + 18
end
function modifier_evo_bristle_react_q_puddle.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not caster or caster:IsNull() or not parent or parent:IsNull() or not ab then
        return
    end
    local dot = 25 + ____exports.getAllAttributesSum(nil, caster) * 0.08
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        260,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue40
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dot,
                damage_type = 2
            })
        end
        ::__continue40::
    end
end
modifier_evo_bristle_react_q_puddle = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_q_puddle")},
    modifier_evo_bristle_react_q_puddle
)
____exports.modifier_evo_bristle_react_q_puddle = modifier_evo_bristle_react_q_puddle
____exports.evo_bristle_react_w = __TS__Class()
local evo_bristle_react_w = ____exports.evo_bristle_react_w
evo_bristle_react_w.name = "evo_bristle_react_w"
__TS__ClassExtends(evo_bristle_react_w, BaseAbility)
function evo_bristle_react_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local level = self:GetLevel()
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local range = self:GetSpecialValueFor("range")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local attrSum = ____exports.getAllAttributesSum(nil, caster)
    local dmg = baseDmg + attrSum * attrPct
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local dir = delta:Length2D() > 1 and delta:Normalized() or caster:GetForwardVector()
    local adrMod = caster:FindModifierByName("modifier_evo_bristle_adrenaline_stack")
    local isFullCircle = level >= 3 and adrMod ~= nil and adrMod:GetStackCount() >= 5
    caster:EmitSound("Hero_Bristleback.QuillSpray.Cast")
    local nearby = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        range,
        2,
        1 + 18,
        0,
        0,
        false
    )
    local hitAny = false
    local stunDur = level >= 3 and 0.8 or 0.6
    for ____, enemy in ipairs(nearby) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue46
            end
            local toEnemy = Vector(
                enemy:GetAbsOrigin().x - origin.x,
                enemy:GetAbsOrigin().y - origin.y,
                0
            )
            local inCone = isFullCircle or toEnemy:Length2D() > 0 and dir.x * toEnemy:Normalized().x + dir.y * toEnemy:Normalized().y >= 0.4
            if not inCone then
                goto __continue46
            end
            hitAny = true
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = dmg,
                damage_type = 1
            })
            local cat = enemy:FindModifierByName("modifier_evo_bristle_react_catalyst")
            if cat and cat:GetStackCount() >= 3 then
                enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = stunDur})
            end
        end
        ::__continue46::
    end
    local puddleBlastBase = level >= 3 and 180 or (level >= 2 and 130 or 80)
    local puddleBlast = puddleBlastBase + attrSum * 0.25
    for ____, puddle in ipairs({__TS__Spread(activePuddles)}) do
        do
            if not puddle or puddle:IsNull() or not IsValidEntity(puddle) then
                activePuddles:delete(puddle)
                goto __continue51
            end
            local pOrigin = puddle:GetAbsOrigin()
            local toPuddle = Vector(pOrigin.x - origin.x, pOrigin.y - origin.y, 0)
            if toPuddle:Length2D() <= range and (isFullCircle or dir.x * toPuddle:Normalized().x + dir.y * toPuddle:Normalized().y >= 0.35) then
                local victims = FindUnitsInRadius(
                    caster:GetTeamNumber(),
                    pOrigin,
                    nil,
                    260,
                    2,
                    1 + 18,
                    0,
                    0,
                    false
                )
                for ____, v in ipairs(victims) do
                    do
                        if not v or v:IsNull() or not IsValidEntity(v) or not v:IsAlive() then
                            goto __continue54
                        end
                        ApplyDamage({
                            victim = v,
                            attacker = caster,
                            ability = self,
                            damage = puddleBlast,
                            damage_type = 2
                        })
                    end
                    ::__continue54::
                end
                puddle:RemoveModifierByName("modifier_evo_bristle_react_q_puddle")
                activePuddles:delete(puddle)
            end
        end
        ::__continue51::
    end
    for ____, zone in ipairs({__TS__Spread(activeReactorZones)}) do
        do
            if not zone or zone:IsNull() or not IsValidEntity(zone) then
                activeReactorZones:delete(zone)
                goto __continue58
            end
            local zMod = zone:FindModifierByName("modifier_evo_bristle_react_r_thinker")
            local toZone = Vector(
                zone:GetAbsOrigin().x - origin.x,
                zone:GetAbsOrigin().y - origin.y,
                0
            )
            if zMod and toZone:Length2D() <= range + 250 then
                zMod:triggerPulse()
            end
        end
        ::__continue58::
    end
    if level >= 2 and hitAny then
        caster:AddNewModifier(caster, self, "modifier_evo_bristle_react_w_buff", {duration = 2.5})
    end
end
evo_bristle_react_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_w")},
    evo_bristle_react_w
)
____exports.evo_bristle_react_w = evo_bristle_react_w
____exports.modifier_evo_bristle_react_w_buff = __TS__Class()
local modifier_evo_bristle_react_w_buff = ____exports.modifier_evo_bristle_react_w_buff
modifier_evo_bristle_react_w_buff.name = "modifier_evo_bristle_react_w_buff"
__TS__ClassExtends(modifier_evo_bristle_react_w_buff, BaseModifier)
function modifier_evo_bristle_react_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_react_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_w_buff.prototype.GetTexture(self)
    return "bristleback_quill_spray"
end
function modifier_evo_bristle_react_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_bristle_react_w_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 15
end
function modifier_evo_bristle_react_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 25
end
modifier_evo_bristle_react_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_w_buff")},
    modifier_evo_bristle_react_w_buff
)
____exports.modifier_evo_bristle_react_w_buff = modifier_evo_bristle_react_w_buff
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
    local shieldPool = math.floor((65 + ____exports.getAllAttributesSum(nil, caster) * 0.15) * stacks)
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
                goto __continue77
            end
            enemy:AddNewModifier(caster, self, "modifier_evo_bristle_react_e_cloud", {duration = 2.5})
        end
        ::__continue77::
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
    local dmg = baseOnHit + ____exports.getAllAttributesSum(nil, parent) * 0.1
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ab,
        damage = dmg,
        damage_type = 2
    })
    applyCatalystStacks(
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
    local pulseDmg = 75 + ____exports.getAllAttributesSum(nil, caster) * 0.24
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
                goto __continue139
            end
            applyCatalystStacks(
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
        ::__continue139::
    end
end
modifier_evo_bristle_react_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_r_thinker")},
    modifier_evo_bristle_react_r_thinker
)
____exports.modifier_evo_bristle_react_r_thinker = modifier_evo_bristle_react_r_thinker
return ____exports
