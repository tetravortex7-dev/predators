local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["31"] = 27,["32"] = 28,["33"] = 30,["34"] = 31,["35"] = 31,["37"] = 32,["38"] = 33,["39"] = 30,["40"] = 36,["41"] = 42,["42"] = 43,["43"] = 44,["44"] = 45,["45"] = 46,["46"] = 46,["47"] = 46,["48"] = 46,["49"] = 47,["50"] = 48,["51"] = 49,["53"] = 36,["54"] = 53,["55"] = 54,["56"] = 53,["57"] = 54,["58"] = 55,["59"] = 56,["62"] = 57,["63"] = 58,["66"] = 60,["67"] = 61,["68"] = 62,["69"] = 63,["70"] = 64,["71"] = 66,["72"] = 67,["73"] = 67,["74"] = 67,["75"] = 67,["76"] = 67,["77"] = 67,["78"] = 67,["79"] = 67,["80"] = 67,["81"] = 67,["82"] = 67,["83"] = 78,["85"] = 79,["86"] = 79,["88"] = 80,["89"] = 80,["90"] = 80,["91"] = 80,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 87,["96"] = 87,["97"] = 87,["98"] = 87,["99"] = 87,["100"] = 87,["101"] = 87,["105"] = 90,["106"] = 90,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 90,["113"] = 90,["114"] = 55,["115"] = 54,["116"] = 53,["117"] = 54,["119"] = 54,["120"] = 102,["121"] = 103,["122"] = 102,["123"] = 103,["124"] = 104,["125"] = 105,["126"] = 104,["127"] = 107,["128"] = 108,["129"] = 107,["130"] = 110,["131"] = 111,["132"] = 110,["133"] = 113,["134"] = 114,["135"] = 113,["136"] = 116,["137"] = 117,["138"] = 117,["139"] = 117,["140"] = 117,["141"] = 117,["142"] = 116,["143"] = 123,["144"] = 124,["145"] = 125,["146"] = 123,["147"] = 127,["148"] = 128,["149"] = 129,["150"] = 130,["151"] = 127,["152"] = 132,["153"] = 133,["154"] = 132,["155"] = 135,["156"] = 136,["157"] = 135,["158"] = 103,["159"] = 102,["160"] = 103,["162"] = 103,["163"] = 140,["164"] = 141,["165"] = 140,["166"] = 141,["167"] = 142,["168"] = 143,["169"] = 142,["170"] = 145,["171"] = 146,["172"] = 145,["173"] = 148,["174"] = 149,["177"] = 150,["178"] = 151,["179"] = 152,["180"] = 153,["181"] = 158,["182"] = 158,["183"] = 158,["184"] = 158,["185"] = 158,["186"] = 159,["187"] = 159,["188"] = 159,["189"] = 159,["190"] = 159,["191"] = 160,["193"] = 162,["194"] = 148,["195"] = 164,["196"] = 165,["199"] = 166,["200"] = 167,["201"] = 168,["203"] = 164,["204"] = 171,["205"] = 172,["206"] = 173,["207"] = 171,["208"] = 175,["209"] = 176,["210"] = 175,["211"] = 178,["212"] = 179,["213"] = 178,["214"] = 181,["215"] = 182,["216"] = 181,["217"] = 184,["218"] = 185,["219"] = 184,["220"] = 187,["221"] = 188,["224"] = 189,["225"] = 190,["226"] = 191,["227"] = 192,["230"] = 194,["231"] = 195,["232"] = 195,["233"] = 195,["234"] = 195,["235"] = 195,["236"] = 195,["237"] = 195,["238"] = 195,["239"] = 195,["240"] = 195,["241"] = 195,["242"] = 206,["244"] = 207,["245"] = 207,["247"] = 208,["248"] = 208,["249"] = 208,["250"] = 208,["251"] = 208,["252"] = 208,["253"] = 208,["257"] = 187,["258"] = 141,["259"] = 140,["260"] = 141,["262"] = 141,["263"] = 219,["264"] = 220,["265"] = 219,["266"] = 220,["267"] = 221,["268"] = 222,["271"] = 223,["272"] = 224,["275"] = 226,["276"] = 227,["277"] = 228,["278"] = 229,["279"] = 230,["280"] = 231,["281"] = 232,["282"] = 233,["283"] = 235,["284"] = 236,["285"] = 237,["286"] = 238,["287"] = 240,["288"] = 241,["289"] = 241,["290"] = 241,["291"] = 241,["292"] = 241,["293"] = 241,["294"] = 241,["295"] = 241,["296"] = 241,["297"] = 241,["298"] = 241,["299"] = 253,["300"] = 254,["301"] = 255,["303"] = 256,["304"] = 256,["306"] = 257,["307"] = 257,["308"] = 257,["309"] = 257,["310"] = 257,["311"] = 258,["312"] = 259,["313"] = 259,["315"] = 261,["316"] = 262,["317"] = 262,["318"] = 262,["319"] = 262,["320"] = 262,["321"] = 262,["322"] = 262,["323"] = 270,["324"] = 271,["325"] = 272,["330"] = 276,["331"] = 277,["332"] = 278,["334"] = 279,["335"] = 280,["336"] = 281,["338"] = 283,["339"] = 284,["340"] = 285,["341"] = 286,["342"] = 286,["343"] = 286,["344"] = 286,["345"] = 286,["346"] = 286,["347"] = 286,["348"] = 286,["349"] = 286,["350"] = 286,["351"] = 286,["352"] = 297,["354"] = 298,["355"] = 298,["357"] = 299,["358"] = 299,["359"] = 299,["360"] = 299,["361"] = 299,["362"] = 299,["363"] = 299,["367"] = 307,["368"] = 308,["373"] = 312,["375"] = 313,["376"] = 314,["377"] = 315,["379"] = 317,["380"] = 320,["381"] = 320,["382"] = 320,["383"] = 320,["384"] = 320,["385"] = 321,["386"] = 322,["391"] = 326,["392"] = 327,["394"] = 221,["395"] = 220,["396"] = 219,["397"] = 220,["399"] = 220,["400"] = 332,["401"] = 333,["402"] = 332,["403"] = 333,["404"] = 334,["405"] = 335,["406"] = 334,["407"] = 337,["408"] = 338,["409"] = 337,["410"] = 340,["411"] = 341,["412"] = 340,["413"] = 343,["414"] = 344,["415"] = 343,["416"] = 346,["417"] = 347,["418"] = 347,["419"] = 347,["420"] = 347,["421"] = 346,["422"] = 352,["423"] = 353,["424"] = 352,["425"] = 355,["426"] = 356,["427"] = 355,["428"] = 333,["429"] = 332,["430"] = 333,["432"] = 333,["433"] = 360,["434"] = 361,["435"] = 360,["436"] = 361,["437"] = 362,["438"] = 363,["439"] = 364,["441"] = 366,["442"] = 362,["443"] = 368,["444"] = 369,["445"] = 368,["446"] = 371,["447"] = 372,["450"] = 373,["451"] = 374,["454"] = 376,["455"] = 377,["456"] = 377,["457"] = 377,["458"] = 377,["459"] = 378,["460"] = 380,["461"] = 380,["462"] = 380,["463"] = 380,["464"] = 380,["465"] = 380,["466"] = 380,["467"] = 381,["468"] = 383,["469"] = 384,["470"] = 385,["472"] = 388,["473"] = 388,["474"] = 388,["475"] = 388,["476"] = 388,["477"] = 388,["478"] = 388,["479"] = 388,["480"] = 388,["481"] = 388,["482"] = 388,["483"] = 399,["485"] = 400,["486"] = 400,["488"] = 401,["492"] = 371,["493"] = 361,["494"] = 360,["495"] = 361,["497"] = 361,["498"] = 406,["499"] = 407,["500"] = 406,["501"] = 407,["502"] = 408,["503"] = 409,["504"] = 408,["505"] = 411,["506"] = 412,["507"] = 411,["508"] = 414,["509"] = 415,["510"] = 414,["511"] = 417,["512"] = 418,["515"] = 419,["516"] = 417,["517"] = 421,["518"] = 422,["521"] = 423,["522"] = 424,["523"] = 425,["526"] = 426,["527"] = 426,["528"] = 426,["529"] = 426,["530"] = 426,["531"] = 426,["532"] = 426,["533"] = 426,["534"] = 426,["535"] = 426,["536"] = 426,["537"] = 437,["538"] = 438,["539"] = 439,["540"] = 440,["541"] = 440,["544"] = 442,["545"] = 443,["546"] = 444,["547"] = 445,["548"] = 446,["551"] = 421,["552"] = 450,["553"] = 451,["554"] = 451,["555"] = 451,["556"] = 451,["557"] = 450,["558"] = 456,["559"] = 457,["560"] = 456,["561"] = 459,["562"] = 460,["565"] = 461,["566"] = 462,["567"] = 463,["570"] = 464,["571"] = 465,["574"] = 467,["575"] = 468,["576"] = 469,["577"] = 469,["578"] = 469,["579"] = 469,["580"] = 469,["581"] = 469,["582"] = 469,["583"] = 476,["584"] = 476,["585"] = 476,["586"] = 476,["587"] = 476,["588"] = 476,["589"] = 476,["590"] = 459,["591"] = 407,["592"] = 406,["593"] = 407,["595"] = 407,["596"] = 480,["597"] = 481,["598"] = 480,["599"] = 481,["600"] = 482,["601"] = 483,["602"] = 482,["603"] = 485,["604"] = 486,["605"] = 485,["606"] = 488,["607"] = 489,["608"] = 488,["609"] = 491,["610"] = 492,["611"] = 491,["612"] = 494,["613"] = 495,["614"] = 494,["615"] = 497,["616"] = 498,["617"] = 498,["619"] = 499,["620"] = 500,["621"] = 500,["623"] = 501,["624"] = 501,["625"] = 501,["626"] = 501,["627"] = 502,["628"] = 503,["629"] = 504,["631"] = 506,["633"] = 508,["634"] = 497,["635"] = 481,["636"] = 480,["637"] = 481,["639"] = 481,["640"] = 512,["641"] = 513,["642"] = 512,["643"] = 513,["644"] = 514,["645"] = 515,["646"] = 514,["647"] = 517,["648"] = 518,["649"] = 517,["650"] = 520,["651"] = 521,["652"] = 520,["653"] = 523,["654"] = 524,["655"] = 523,["656"] = 526,["657"] = 527,["658"] = 527,["659"] = 527,["660"] = 527,["661"] = 526,["662"] = 532,["663"] = 533,["664"] = 532,["665"] = 535,["666"] = 536,["667"] = 535,["668"] = 513,["669"] = 512,["670"] = 513,["672"] = 513,["673"] = 540,["674"] = 541,["675"] = 540,["676"] = 541,["677"] = 542,["678"] = 543,["679"] = 542,["680"] = 545,["681"] = 546,["682"] = 545,["683"] = 548,["684"] = 549,["685"] = 548,["686"] = 551,["687"] = 552,["688"] = 551,["689"] = 554,["690"] = 555,["691"] = 555,["692"] = 555,["693"] = 555,["694"] = 555,["695"] = 554,["696"] = 561,["697"] = 562,["698"] = 561,["699"] = 564,["700"] = 565,["701"] = 564,["702"] = 567,["703"] = 568,["704"] = 567,["705"] = 541,["706"] = 540,["707"] = 541,["709"] = 541,["710"] = 572,["711"] = 573,["712"] = 572,["713"] = 573,["714"] = 574,["715"] = 575,["718"] = 576,["719"] = 577,["722"] = 578,["723"] = 579,["724"] = 580,["725"] = 581,["726"] = 581,["727"] = 581,["728"] = 581,["729"] = 581,["730"] = 581,["731"] = 581,["732"] = 581,["733"] = 581,["734"] = 574,["735"] = 573,["736"] = 572,["737"] = 573,["739"] = 573,["740"] = 593,["741"] = 594,["742"] = 593,["743"] = 594,["745"] = 594,["746"] = 595,["747"] = 593,["748"] = 597,["749"] = 598,["750"] = 597,["751"] = 600,["752"] = 601,["753"] = 600,["754"] = 603,["755"] = 604,["758"] = 605,["759"] = 606,["760"] = 607,["761"] = 608,["762"] = 609,["763"] = 610,["764"] = 615,["765"] = 615,["766"] = 615,["767"] = 615,["768"] = 615,["769"] = 616,["770"] = 616,["771"] = 616,["772"] = 616,["773"] = 616,["774"] = 617,["776"] = 619,["777"] = 620,["778"] = 603,["779"] = 622,["780"] = 623,["783"] = 624,["784"] = 625,["785"] = 626,["787"] = 622,["788"] = 629,["789"] = 630,["792"] = 631,["793"] = 629,["794"] = 633,["795"] = 634,["796"] = 635,["797"] = 636,["798"] = 637,["801"] = 639,["802"] = 640,["803"] = 641,["804"] = 641,["805"] = 641,["806"] = 641,["807"] = 641,["808"] = 641,["809"] = 641,["810"] = 641,["811"] = 641,["812"] = 641,["813"] = 641,["814"] = 652,["816"] = 653,["817"] = 653,["819"] = 654,["820"] = 654,["821"] = 654,["822"] = 654,["823"] = 654,["824"] = 654,["825"] = 654,["826"] = 655,["827"] = 655,["828"] = 655,["829"] = 655,["830"] = 655,["831"] = 655,["832"] = 655,["833"] = 662,["834"] = 662,["835"] = 662,["836"] = 662,["837"] = 662,["838"] = 663,["839"] = 664,["840"] = 665,["841"] = 666,["842"] = 667,["843"] = 667,["844"] = 667,["845"] = 667,["846"] = 667,["847"] = 672,["852"] = 633,["853"] = 594,["854"] = 593,["855"] = 594,["857"] = 594});
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
for ____, modName in ipairs(REACTOR_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
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
                goto __continue11
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
        ::__continue11::
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
                goto __continue39
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dot,
                damage_type = 2
            })
        end
        ::__continue39::
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
                goto __continue45
            end
            local toEnemy = Vector(
                enemy:GetAbsOrigin().x - origin.x,
                enemy:GetAbsOrigin().y - origin.y,
                0
            )
            local inCone = isFullCircle or toEnemy:Length2D() > 0 and dir.x * toEnemy:Normalized().x + dir.y * toEnemy:Normalized().y >= 0.4
            if not inCone then
                goto __continue45
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
        ::__continue45::
    end
    local puddleBlastBase = level >= 3 and 180 or (level >= 2 and 130 or 80)
    local puddleBlast = puddleBlastBase + attrSum * 0.25
    for ____, puddle in ipairs({__TS__Spread(activePuddles)}) do
        do
            if not puddle or puddle:IsNull() or not IsValidEntity(puddle) then
                activePuddles:delete(puddle)
                goto __continue50
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
                            goto __continue53
                        end
                        ApplyDamage({
                            victim = v,
                            attacker = caster,
                            ability = self,
                            damage = puddleBlast,
                            damage_type = 2
                        })
                    end
                    ::__continue53::
                end
                puddle:RemoveModifierByName("modifier_evo_bristle_react_q_puddle")
                activePuddles:delete(puddle)
            end
        end
        ::__continue50::
    end
    for ____, zone in ipairs({__TS__Spread(activeReactorZones)}) do
        do
            if not zone or zone:IsNull() or not IsValidEntity(zone) then
                activeReactorZones:delete(zone)
                goto __continue57
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
        ::__continue57::
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
                goto __continue76
            end
            enemy:AddNewModifier(caster, self, "modifier_evo_bristle_react_e_cloud", {duration = 2.5})
        end
        ::__continue76::
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
                goto __continue138
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
        ::__continue138::
    end
end
modifier_evo_bristle_react_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_r_thinker")},
    modifier_evo_bristle_react_r_thinker
)
____exports.modifier_evo_bristle_react_r_thinker = modifier_evo_bristle_react_r_thinker
return ____exports
