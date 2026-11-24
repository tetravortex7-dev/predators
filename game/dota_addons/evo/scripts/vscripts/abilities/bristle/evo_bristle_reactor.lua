local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 11,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 24,["31"] = 25,["33"] = 28,["34"] = 29,["35"] = 31,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 41,["41"] = 41,["42"] = 41,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["48"] = 31,["49"] = 48,["50"] = 49,["51"] = 48,["52"] = 49,["53"] = 50,["54"] = 51,["57"] = 52,["58"] = 53,["61"] = 55,["62"] = 56,["63"] = 57,["64"] = 58,["65"] = 59,["66"] = 61,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 62,["75"] = 62,["76"] = 62,["77"] = 62,["78"] = 73,["80"] = 74,["81"] = 74,["83"] = 75,["84"] = 75,["85"] = 75,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 75,["90"] = 82,["91"] = 82,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["100"] = 85,["101"] = 85,["102"] = 85,["103"] = 85,["104"] = 85,["105"] = 85,["106"] = 85,["107"] = 85,["108"] = 85,["109"] = 50,["110"] = 49,["111"] = 48,["112"] = 49,["114"] = 49,["115"] = 97,["116"] = 98,["117"] = 97,["118"] = 98,["119"] = 99,["120"] = 100,["121"] = 99,["122"] = 102,["123"] = 103,["124"] = 102,["125"] = 105,["126"] = 106,["127"] = 105,["128"] = 108,["129"] = 109,["130"] = 108,["131"] = 111,["132"] = 112,["133"] = 112,["134"] = 112,["135"] = 112,["136"] = 112,["137"] = 111,["138"] = 118,["139"] = 119,["140"] = 120,["141"] = 118,["142"] = 122,["143"] = 123,["144"] = 124,["145"] = 125,["146"] = 122,["147"] = 127,["148"] = 128,["149"] = 127,["150"] = 130,["151"] = 131,["152"] = 130,["153"] = 98,["154"] = 97,["155"] = 98,["157"] = 98,["158"] = 135,["159"] = 136,["160"] = 135,["161"] = 136,["162"] = 137,["163"] = 138,["164"] = 137,["165"] = 140,["166"] = 141,["167"] = 140,["168"] = 143,["169"] = 144,["172"] = 145,["173"] = 146,["174"] = 147,["175"] = 148,["176"] = 153,["177"] = 153,["178"] = 153,["179"] = 153,["180"] = 153,["181"] = 154,["182"] = 154,["183"] = 154,["184"] = 154,["185"] = 154,["186"] = 155,["188"] = 157,["189"] = 143,["190"] = 159,["191"] = 160,["194"] = 161,["195"] = 162,["196"] = 163,["198"] = 159,["199"] = 166,["200"] = 167,["201"] = 168,["202"] = 166,["203"] = 170,["204"] = 171,["205"] = 170,["206"] = 173,["207"] = 174,["208"] = 173,["209"] = 176,["210"] = 177,["211"] = 176,["212"] = 179,["213"] = 180,["214"] = 179,["215"] = 182,["216"] = 183,["219"] = 184,["220"] = 185,["221"] = 186,["222"] = 187,["225"] = 189,["226"] = 190,["227"] = 190,["228"] = 190,["229"] = 190,["230"] = 190,["231"] = 190,["232"] = 190,["233"] = 190,["234"] = 190,["235"] = 190,["236"] = 190,["237"] = 201,["239"] = 202,["240"] = 202,["242"] = 203,["243"] = 203,["244"] = 203,["245"] = 203,["246"] = 203,["247"] = 203,["248"] = 203,["252"] = 182,["253"] = 136,["254"] = 135,["255"] = 136,["257"] = 136,["258"] = 214,["259"] = 215,["260"] = 214,["261"] = 215,["262"] = 216,["263"] = 217,["266"] = 218,["267"] = 219,["270"] = 221,["271"] = 222,["272"] = 223,["273"] = 224,["274"] = 225,["275"] = 226,["276"] = 227,["277"] = 228,["278"] = 230,["279"] = 231,["280"] = 232,["281"] = 233,["282"] = 235,["283"] = 236,["284"] = 236,["285"] = 236,["286"] = 236,["287"] = 236,["288"] = 236,["289"] = 236,["290"] = 236,["291"] = 236,["292"] = 236,["293"] = 236,["294"] = 248,["295"] = 249,["296"] = 250,["298"] = 251,["299"] = 251,["301"] = 252,["302"] = 252,["303"] = 252,["304"] = 252,["305"] = 252,["306"] = 253,["307"] = 254,["308"] = 254,["310"] = 256,["311"] = 257,["312"] = 257,["313"] = 257,["314"] = 257,["315"] = 257,["316"] = 257,["317"] = 257,["318"] = 265,["319"] = 266,["320"] = 267,["325"] = 271,["326"] = 272,["327"] = 273,["329"] = 274,["330"] = 275,["331"] = 276,["333"] = 278,["334"] = 279,["335"] = 280,["336"] = 281,["337"] = 281,["338"] = 281,["339"] = 281,["340"] = 281,["341"] = 281,["342"] = 281,["343"] = 281,["344"] = 281,["345"] = 281,["346"] = 281,["347"] = 292,["349"] = 293,["350"] = 293,["352"] = 294,["353"] = 294,["354"] = 294,["355"] = 294,["356"] = 294,["357"] = 294,["358"] = 294,["362"] = 302,["363"] = 303,["368"] = 307,["370"] = 308,["371"] = 309,["372"] = 310,["374"] = 312,["375"] = 315,["376"] = 315,["377"] = 315,["378"] = 315,["379"] = 315,["380"] = 316,["381"] = 317,["386"] = 321,["387"] = 322,["389"] = 216,["390"] = 215,["391"] = 214,["392"] = 215,["394"] = 215,["395"] = 327,["396"] = 328,["397"] = 327,["398"] = 328,["399"] = 329,["400"] = 330,["401"] = 329,["402"] = 332,["403"] = 333,["404"] = 332,["405"] = 335,["406"] = 336,["407"] = 335,["408"] = 338,["409"] = 339,["410"] = 338,["411"] = 341,["412"] = 342,["413"] = 342,["414"] = 342,["415"] = 342,["416"] = 341,["417"] = 347,["418"] = 348,["419"] = 347,["420"] = 350,["421"] = 351,["422"] = 350,["423"] = 328,["424"] = 327,["425"] = 328,["427"] = 328,["428"] = 355,["429"] = 356,["430"] = 355,["431"] = 356,["432"] = 357,["433"] = 358,["434"] = 359,["436"] = 361,["437"] = 357,["438"] = 363,["439"] = 364,["440"] = 363,["441"] = 366,["442"] = 367,["445"] = 368,["446"] = 369,["449"] = 371,["450"] = 372,["451"] = 372,["452"] = 372,["453"] = 372,["454"] = 373,["455"] = 375,["456"] = 375,["457"] = 375,["458"] = 375,["459"] = 375,["460"] = 375,["461"] = 375,["462"] = 376,["463"] = 378,["464"] = 379,["465"] = 380,["467"] = 383,["468"] = 383,["469"] = 383,["470"] = 383,["471"] = 383,["472"] = 383,["473"] = 383,["474"] = 383,["475"] = 383,["476"] = 383,["477"] = 383,["478"] = 394,["480"] = 395,["481"] = 395,["483"] = 396,["487"] = 366,["488"] = 356,["489"] = 355,["490"] = 356,["492"] = 356,["493"] = 401,["494"] = 402,["495"] = 401,["496"] = 402,["497"] = 403,["498"] = 404,["499"] = 403,["500"] = 406,["501"] = 407,["502"] = 406,["503"] = 409,["504"] = 410,["505"] = 409,["506"] = 412,["507"] = 413,["510"] = 414,["511"] = 412,["512"] = 416,["513"] = 417,["516"] = 418,["517"] = 419,["518"] = 420,["521"] = 421,["522"] = 421,["523"] = 421,["524"] = 421,["525"] = 421,["526"] = 421,["527"] = 421,["528"] = 421,["529"] = 421,["530"] = 421,["531"] = 421,["532"] = 432,["533"] = 433,["534"] = 434,["535"] = 435,["536"] = 435,["539"] = 437,["540"] = 438,["541"] = 439,["542"] = 440,["543"] = 441,["546"] = 416,["547"] = 445,["548"] = 446,["549"] = 446,["550"] = 446,["551"] = 446,["552"] = 445,["553"] = 451,["554"] = 452,["555"] = 451,["556"] = 454,["557"] = 455,["560"] = 456,["561"] = 457,["562"] = 458,["565"] = 459,["566"] = 460,["569"] = 462,["570"] = 463,["571"] = 464,["572"] = 464,["573"] = 464,["574"] = 464,["575"] = 464,["576"] = 464,["577"] = 464,["578"] = 471,["579"] = 471,["580"] = 471,["581"] = 471,["582"] = 471,["583"] = 471,["584"] = 471,["585"] = 454,["586"] = 402,["587"] = 401,["588"] = 402,["590"] = 402,["591"] = 475,["592"] = 476,["593"] = 475,["594"] = 476,["595"] = 477,["596"] = 478,["597"] = 477,["598"] = 480,["599"] = 481,["600"] = 480,["601"] = 483,["602"] = 484,["603"] = 483,["604"] = 486,["605"] = 487,["606"] = 486,["607"] = 489,["608"] = 490,["609"] = 489,["610"] = 492,["611"] = 493,["612"] = 493,["614"] = 494,["615"] = 495,["616"] = 495,["618"] = 496,["619"] = 496,["620"] = 496,["621"] = 496,["622"] = 497,["623"] = 498,["624"] = 499,["626"] = 501,["628"] = 503,["629"] = 492,["630"] = 476,["631"] = 475,["632"] = 476,["634"] = 476,["635"] = 507,["636"] = 508,["637"] = 507,["638"] = 508,["639"] = 509,["640"] = 510,["641"] = 509,["642"] = 512,["643"] = 513,["644"] = 512,["645"] = 515,["646"] = 516,["647"] = 515,["648"] = 518,["649"] = 519,["650"] = 518,["651"] = 521,["652"] = 522,["653"] = 522,["654"] = 522,["655"] = 522,["656"] = 521,["657"] = 527,["658"] = 528,["659"] = 527,["660"] = 530,["661"] = 531,["662"] = 530,["663"] = 508,["664"] = 507,["665"] = 508,["667"] = 508,["668"] = 535,["669"] = 536,["670"] = 535,["671"] = 536,["672"] = 537,["673"] = 538,["674"] = 537,["675"] = 540,["676"] = 541,["677"] = 540,["678"] = 543,["679"] = 544,["680"] = 543,["681"] = 546,["682"] = 547,["683"] = 546,["684"] = 549,["685"] = 550,["686"] = 550,["687"] = 550,["688"] = 550,["689"] = 550,["690"] = 549,["691"] = 556,["692"] = 557,["693"] = 556,["694"] = 559,["695"] = 560,["696"] = 559,["697"] = 562,["698"] = 563,["699"] = 562,["700"] = 536,["701"] = 535,["702"] = 536,["704"] = 536,["705"] = 567,["706"] = 568,["707"] = 567,["708"] = 568,["709"] = 569,["710"] = 570,["713"] = 571,["714"] = 572,["717"] = 573,["718"] = 574,["719"] = 575,["720"] = 576,["721"] = 576,["722"] = 576,["723"] = 576,["724"] = 576,["725"] = 576,["726"] = 576,["727"] = 576,["728"] = 576,["729"] = 569,["730"] = 568,["731"] = 567,["732"] = 568,["734"] = 568,["735"] = 588,["736"] = 589,["737"] = 588,["738"] = 589,["740"] = 589,["741"] = 590,["742"] = 588,["743"] = 592,["744"] = 593,["745"] = 592,["746"] = 595,["747"] = 596,["748"] = 595,["749"] = 598,["750"] = 599,["753"] = 600,["754"] = 601,["755"] = 602,["756"] = 603,["757"] = 604,["758"] = 605,["759"] = 610,["760"] = 610,["761"] = 610,["762"] = 610,["763"] = 610,["764"] = 611,["765"] = 611,["766"] = 611,["767"] = 611,["768"] = 611,["769"] = 612,["771"] = 614,["772"] = 615,["773"] = 598,["774"] = 617,["775"] = 618,["778"] = 619,["779"] = 620,["780"] = 621,["782"] = 617,["783"] = 624,["784"] = 625,["787"] = 626,["788"] = 624,["789"] = 628,["790"] = 629,["791"] = 630,["792"] = 631,["793"] = 632,["796"] = 634,["797"] = 635,["798"] = 636,["799"] = 636,["800"] = 636,["801"] = 636,["802"] = 636,["803"] = 636,["804"] = 636,["805"] = 636,["806"] = 636,["807"] = 636,["808"] = 636,["809"] = 647,["811"] = 648,["812"] = 648,["814"] = 649,["815"] = 649,["816"] = 649,["817"] = 649,["818"] = 649,["819"] = 649,["820"] = 649,["821"] = 650,["822"] = 650,["823"] = 650,["824"] = 650,["825"] = 650,["826"] = 650,["827"] = 650,["828"] = 657,["829"] = 657,["830"] = 657,["831"] = 657,["832"] = 657,["833"] = 658,["834"] = 659,["835"] = 660,["836"] = 661,["837"] = 662,["838"] = 662,["839"] = 662,["840"] = 662,["841"] = 662,["842"] = 667,["847"] = 628,["848"] = 589,["849"] = 588,["850"] = 589,["852"] = 589});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_bristle_shared = require("abilities.bristle.evo_bristle_shared")
local getAllAttributesSum = ____evo_bristle_shared.getAllAttributesSum
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
for ____, modName in ipairs(REACTOR_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
local activePuddles = __TS__New(Set)
local activeReactorZones = __TS__New(Set)
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
    local dmgBase = baseDmg + getAllAttributesSum(nil, caster) * attrPct
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
                goto __continue9
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
        ::__continue9::
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
    local dot = 25 + getAllAttributesSum(nil, caster) * 0.08
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
                goto __continue37
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dot,
                damage_type = 2
            })
        end
        ::__continue37::
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
    local attrSum = getAllAttributesSum(nil, caster)
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
                goto __continue43
            end
            local toEnemy = Vector(
                enemy:GetAbsOrigin().x - origin.x,
                enemy:GetAbsOrigin().y - origin.y,
                0
            )
            local inCone = isFullCircle or toEnemy:Length2D() > 0 and dir.x * toEnemy:Normalized().x + dir.y * toEnemy:Normalized().y >= 0.4
            if not inCone then
                goto __continue43
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
        ::__continue43::
    end
    local puddleBlastBase = level >= 3 and 180 or (level >= 2 and 130 or 80)
    local puddleBlast = puddleBlastBase + attrSum * 0.25
    for ____, puddle in ipairs({__TS__Spread(activePuddles)}) do
        do
            if not puddle or puddle:IsNull() or not IsValidEntity(puddle) then
                activePuddles:delete(puddle)
                goto __continue48
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
                            goto __continue51
                        end
                        ApplyDamage({
                            victim = v,
                            attacker = caster,
                            ability = self,
                            damage = puddleBlast,
                            damage_type = 2
                        })
                    end
                    ::__continue51::
                end
                puddle:RemoveModifierByName("modifier_evo_bristle_react_q_puddle")
                activePuddles:delete(puddle)
            end
        end
        ::__continue48::
    end
    for ____, zone in ipairs({__TS__Spread(activeReactorZones)}) do
        do
            if not zone or zone:IsNull() or not IsValidEntity(zone) then
                activeReactorZones:delete(zone)
                goto __continue55
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
        ::__continue55::
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
                goto __continue74
            end
            enemy:AddNewModifier(caster, self, "modifier_evo_bristle_react_e_cloud", {duration = 2.5})
        end
        ::__continue74::
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
                goto __continue136
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
        ::__continue136::
    end
end
modifier_evo_bristle_react_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_r_thinker")},
    modifier_evo_bristle_react_r_thinker
)
____exports.modifier_evo_bristle_react_r_thinker = modifier_evo_bristle_react_r_thinker
return ____exports
