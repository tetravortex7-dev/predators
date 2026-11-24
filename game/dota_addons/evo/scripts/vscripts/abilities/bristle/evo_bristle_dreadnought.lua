local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 11,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 13,["31"] = 13,["32"] = 25,["33"] = 26,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["43"] = 33,["44"] = 34,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 44,["55"] = 45,["56"] = 50,["57"] = 51,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 53,["65"] = 53,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 65,["71"] = 66,["72"] = 66,["74"] = 67,["75"] = 67,["76"] = 67,["77"] = 67,["78"] = 67,["79"] = 67,["80"] = 67,["81"] = 74,["82"] = 75,["83"] = 75,["84"] = 75,["85"] = 75,["86"] = 76,["87"] = 77,["88"] = 78,["90"] = 80,["91"] = 81,["96"] = 85,["97"] = 86,["98"] = 86,["99"] = 86,["100"] = 86,["101"] = 86,["102"] = 86,["103"] = 86,["104"] = 86,["105"] = 86,["107"] = 31,["108"] = 30,["109"] = 29,["110"] = 30,["112"] = 30,["113"] = 99,["114"] = 100,["115"] = 99,["116"] = 100,["117"] = 101,["118"] = 102,["119"] = 101,["120"] = 104,["121"] = 105,["122"] = 104,["123"] = 107,["124"] = 108,["125"] = 107,["126"] = 110,["127"] = 111,["128"] = 110,["129"] = 113,["130"] = 114,["131"] = 114,["132"] = 114,["133"] = 114,["134"] = 114,["135"] = 113,["136"] = 120,["137"] = 121,["138"] = 122,["139"] = 120,["140"] = 124,["141"] = 125,["142"] = 126,["143"] = 124,["144"] = 128,["145"] = 129,["146"] = 130,["147"] = 128,["148"] = 100,["149"] = 99,["150"] = 100,["152"] = 100,["153"] = 134,["154"] = 135,["155"] = 134,["156"] = 135,["157"] = 136,["158"] = 137,["159"] = 136,["160"] = 139,["161"] = 140,["162"] = 139,["163"] = 142,["164"] = 143,["165"] = 142,["166"] = 145,["167"] = 146,["168"] = 145,["169"] = 148,["170"] = 149,["171"] = 148,["172"] = 135,["173"] = 134,["174"] = 135,["176"] = 135,["177"] = 155,["178"] = 156,["179"] = 155,["180"] = 156,["181"] = 157,["182"] = 158,["183"] = 157,["184"] = 160,["185"] = 161,["186"] = 160,["187"] = 163,["188"] = 164,["191"] = 165,["192"] = 163,["193"] = 167,["194"] = 168,["197"] = 169,["198"] = 170,["199"] = 171,["200"] = 172,["203"] = 174,["204"] = 175,["205"] = 176,["206"] = 177,["207"] = 177,["208"] = 177,["209"] = 177,["210"] = 177,["211"] = 177,["212"] = 177,["213"] = 177,["214"] = 177,["215"] = 177,["216"] = 177,["217"] = 188,["219"] = 189,["220"] = 189,["222"] = 190,["223"] = 190,["224"] = 190,["225"] = 190,["226"] = 190,["227"] = 190,["228"] = 190,["229"] = 197,["230"] = 198,["231"] = 198,["232"] = 198,["233"] = 198,["234"] = 198,["235"] = 198,["236"] = 198,["237"] = 199,["238"] = 200,["239"] = 201,["244"] = 167,["245"] = 156,["246"] = 155,["247"] = 156,["249"] = 156,["250"] = 207,["251"] = 208,["252"] = 207,["253"] = 208,["254"] = 209,["255"] = 210,["258"] = 211,["259"] = 212,["262"] = 213,["263"] = 209,["264"] = 208,["265"] = 207,["266"] = 208,["268"] = 208,["269"] = 217,["270"] = 218,["271"] = 217,["272"] = 218,["273"] = 219,["274"] = 220,["275"] = 219,["276"] = 222,["277"] = 223,["278"] = 222,["279"] = 225,["280"] = 226,["281"] = 225,["282"] = 228,["283"] = 229,["284"] = 228,["285"] = 231,["286"] = 232,["287"] = 231,["288"] = 234,["289"] = 235,["290"] = 234,["291"] = 218,["292"] = 217,["293"] = 218,["295"] = 218,["296"] = 239,["297"] = 240,["298"] = 239,["299"] = 240,["300"] = 241,["301"] = 242,["302"] = 241,["303"] = 244,["304"] = 245,["305"] = 244,["306"] = 247,["307"] = 248,["308"] = 247,["309"] = 250,["310"] = 251,["311"] = 250,["312"] = 253,["313"] = 254,["314"] = 253,["315"] = 256,["316"] = 257,["317"] = 256,["318"] = 240,["319"] = 239,["320"] = 240,["322"] = 240,["323"] = 261,["324"] = 262,["325"] = 261,["326"] = 262,["327"] = 263,["328"] = 264,["329"] = 265,["331"] = 267,["332"] = 263,["333"] = 269,["334"] = 270,["335"] = 269,["336"] = 272,["337"] = 273,["340"] = 274,["341"] = 275,["344"] = 277,["345"] = 278,["346"] = 279,["347"] = 280,["348"] = 281,["349"] = 283,["350"] = 284,["351"] = 285,["352"] = 286,["354"] = 289,["355"] = 289,["356"] = 289,["357"] = 289,["358"] = 289,["359"] = 289,["360"] = 289,["361"] = 289,["362"] = 289,["363"] = 289,["364"] = 289,["365"] = 300,["367"] = 301,["368"] = 301,["370"] = 302,["371"] = 303,["372"] = 303,["373"] = 305,["374"] = 306,["375"] = 307,["377"] = 309,["378"] = 303,["379"] = 303,["380"] = 303,["384"] = 272,["385"] = 262,["386"] = 261,["387"] = 262,["389"] = 262,["390"] = 317,["391"] = 318,["392"] = 317,["393"] = 318,["394"] = 319,["395"] = 320,["396"] = 319,["397"] = 322,["398"] = 323,["399"] = 322,["400"] = 325,["401"] = 326,["402"] = 325,["403"] = 328,["404"] = 329,["405"] = 329,["406"] = 329,["407"] = 329,["408"] = 328,["409"] = 334,["410"] = 335,["411"] = 336,["412"] = 337,["413"] = 337,["415"] = 338,["416"] = 334,["417"] = 340,["418"] = 341,["421"] = 342,["422"] = 343,["423"] = 344,["426"] = 345,["429"] = 346,["432"] = 348,["433"] = 349,["436"] = 350,["439"] = 352,["440"] = 353,["441"] = 354,["442"] = 355,["443"] = 356,["444"] = 357,["445"] = 357,["446"] = 357,["447"] = 357,["448"] = 357,["449"] = 357,["450"] = 357,["451"] = 357,["454"] = 368,["455"] = 369,["457"] = 340,["458"] = 318,["459"] = 317,["460"] = 318,["462"] = 318,["463"] = 374,["464"] = 375,["465"] = 374,["466"] = 375,["467"] = 376,["468"] = 377,["469"] = 376,["470"] = 379,["471"] = 380,["472"] = 379,["473"] = 382,["474"] = 383,["475"] = 382,["476"] = 385,["477"] = 386,["478"] = 385,["479"] = 388,["480"] = 389,["481"] = 388,["482"] = 391,["483"] = 392,["484"] = 392,["486"] = 393,["487"] = 394,["488"] = 394,["490"] = 395,["491"] = 395,["492"] = 395,["493"] = 395,["494"] = 396,["495"] = 397,["496"] = 398,["498"] = 400,["500"] = 402,["501"] = 391,["502"] = 375,["503"] = 374,["504"] = 375,["506"] = 375,["507"] = 406,["508"] = 407,["509"] = 406,["510"] = 407,["511"] = 408,["512"] = 409,["513"] = 408,["514"] = 411,["515"] = 412,["516"] = 411,["517"] = 414,["518"] = 415,["519"] = 414,["520"] = 417,["521"] = 418,["522"] = 417,["523"] = 420,["524"] = 421,["525"] = 420,["526"] = 423,["527"] = 424,["528"] = 423,["529"] = 407,["530"] = 406,["531"] = 407,["533"] = 407,["534"] = 428,["535"] = 429,["536"] = 428,["537"] = 429,["538"] = 430,["539"] = 431,["542"] = 432,["543"] = 433,["546"] = 435,["547"] = 436,["548"] = 436,["549"] = 436,["550"] = 436,["551"] = 436,["552"] = 436,["553"] = 436,["554"] = 437,["555"] = 438,["556"] = 439,["557"] = 430,["558"] = 429,["559"] = 428,["560"] = 429,["562"] = 429,["563"] = 443,["564"] = 444,["565"] = 443,["566"] = 444,["568"] = 444,["569"] = 445,["570"] = 446,["571"] = 443,["572"] = 448,["573"] = 449,["574"] = 448,["575"] = 451,["576"] = 452,["577"] = 451,["578"] = 454,["579"] = 455,["580"] = 454,["581"] = 457,["582"] = 458,["583"] = 457,["584"] = 460,["585"] = 461,["588"] = 462,["589"] = 463,["590"] = 464,["591"] = 460,["592"] = 466,["593"] = 467,["596"] = 468,["597"] = 469,["598"] = 470,["601"] = 471,["602"] = 473,["603"] = 474,["604"] = 475,["605"] = 476,["606"] = 477,["609"] = 481,["610"] = 482,["611"] = 483,["612"] = 483,["613"] = 483,["614"] = 483,["615"] = 483,["616"] = 483,["617"] = 483,["618"] = 483,["619"] = 483,["620"] = 483,["621"] = 483,["622"] = 494,["624"] = 495,["625"] = 495,["627"] = 496,["628"] = 497,["629"] = 498,["630"] = 498,["632"] = 499,["633"] = 500,["634"] = 500,["635"] = 500,["636"] = 500,["637"] = 500,["638"] = 500,["639"] = 500,["640"] = 507,["644"] = 466,["645"] = 510,["646"] = 511,["647"] = 511,["648"] = 511,["649"] = 511,["650"] = 510,["651"] = 516,["652"] = 517,["653"] = 516,["654"] = 519,["655"] = 520,["656"] = 519,["657"] = 444,["658"] = 443,["659"] = 444,["661"] = 444});
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
local SCRIPT_PATH = "abilities/bristle/evo_bristle_dreadnought"
local DREAD_MODS = {
    "modifier_evo_bristle_dread_q_debuff",
    "modifier_evo_bristle_dread_q_leash",
    "modifier_evo_bristle_dread_q_puddle",
    "modifier_evo_bristle_dread_w_quill",
    "modifier_evo_bristle_dread_w_dmg",
    "modifier_evo_bristle_dread_e_passive",
    "modifier_evo_bristle_dread_e_active",
    "modifier_evo_bristle_dread_e_slow",
    "modifier_evo_bristle_dread_r_ram"
}
for ____, modName in ipairs(DREAD_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_bristle_dread_q = __TS__Class()
local evo_bristle_dread_q = ____exports.evo_bristle_dread_q
evo_bristle_dread_q.name = "evo_bristle_dread_q"
__TS__ClassExtends(evo_bristle_dread_q, BaseAbility)
function evo_bristle_dread_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local level = self:GetLevel()
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local strPct = self:GetSpecialValueFor("str_pct") / 100
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local dmg = baseDmg + str * strPct
    caster:EmitSound("Hero_Bristleback.ViscousGoo.Cast")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_bristleback/bristleback_viscous_nasal_goo.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, pos)
    ParticleManager:ReleaseParticleIndex(pfx)
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
                goto __continue7
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = dmg,
                damage_type = 2
            })
            local ex = enemy:FindModifierByName("modifier_evo_bristle_dread_q_debuff")
            local next = math.min(
                4,
                (ex and ex:GetStackCount() or 0) + 1
            )
            local mod = enemy:AddNewModifier(caster, self, "modifier_evo_bristle_dread_q_debuff", {duration = 5})
            if mod ~= nil then
                mod:SetStackCount(next)
            end
            if level >= 2 and not ex then
                enemy:AddNewModifier(caster, self, "modifier_evo_bristle_dread_q_leash", {duration = 1.2})
            end
        end
        ::__continue7::
    end
    if level >= 3 then
        CreateModifierThinker(
            caster,
            self,
            "modifier_evo_bristle_dread_q_puddle",
            {duration = 3.5},
            pos,
            caster:GetTeamNumber(),
            false
        )
    end
end
evo_bristle_dread_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_dread_q")},
    evo_bristle_dread_q
)
____exports.evo_bristle_dread_q = evo_bristle_dread_q
____exports.modifier_evo_bristle_dread_q_debuff = __TS__Class()
local modifier_evo_bristle_dread_q_debuff = ____exports.modifier_evo_bristle_dread_q_debuff
modifier_evo_bristle_dread_q_debuff.name = "modifier_evo_bristle_dread_q_debuff"
__TS__ClassExtends(modifier_evo_bristle_dread_q_debuff, BaseModifier)
function modifier_evo_bristle_dread_q_debuff.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_q_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_dread_q_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_q_debuff.prototype.GetTexture(self)
    return "bristleback_viscous_nasal_goo"
end
function modifier_evo_bristle_dread_q_debuff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_TURN_RATE_PERCENTAGE")
    }
end
function modifier_evo_bristle_dread_q_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ab = self:GetAbility()
    return -(ab and ab:GetSpecialValueFor("slow_pct") or 22)
end
function modifier_evo_bristle_dread_q_debuff.prototype.GetModifierPhysicalArmorBonus(self)
    local ab = self:GetAbility()
    return -(ab and ab:GetSpecialValueFor("armor_per_stack") or 2) * self:GetStackCount()
end
function modifier_evo_bristle_dread_q_debuff.prototype.GetModifierTurnRate_Percentage(self)
    local ab = self:GetAbility()
    return ab and ab:GetLevel() >= 2 and -35 or 0
end
modifier_evo_bristle_dread_q_debuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_q_debuff")},
    modifier_evo_bristle_dread_q_debuff
)
____exports.modifier_evo_bristle_dread_q_debuff = modifier_evo_bristle_dread_q_debuff
____exports.modifier_evo_bristle_dread_q_leash = __TS__Class()
local modifier_evo_bristle_dread_q_leash = ____exports.modifier_evo_bristle_dread_q_leash
modifier_evo_bristle_dread_q_leash.name = "modifier_evo_bristle_dread_q_leash"
__TS__ClassExtends(modifier_evo_bristle_dread_q_leash, BaseModifier)
function modifier_evo_bristle_dread_q_leash.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_q_leash.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_dread_q_leash.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_q_leash.prototype.GetTexture(self)
    return "bristleback_viscous_nasal_goo"
end
function modifier_evo_bristle_dread_q_leash.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_TETHERED")] = true}
end
modifier_evo_bristle_dread_q_leash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_q_leash")},
    modifier_evo_bristle_dread_q_leash
)
____exports.modifier_evo_bristle_dread_q_leash = modifier_evo_bristle_dread_q_leash
____exports.modifier_evo_bristle_dread_q_puddle = __TS__Class()
local modifier_evo_bristle_dread_q_puddle = ____exports.modifier_evo_bristle_dread_q_puddle
modifier_evo_bristle_dread_q_puddle.name = "modifier_evo_bristle_dread_q_puddle"
__TS__ClassExtends(modifier_evo_bristle_dread_q_puddle, BaseModifier)
function modifier_evo_bristle_dread_q_puddle.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_dread_q_puddle.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_dread_q_puddle.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(1)
end
function modifier_evo_bristle_dread_q_puddle.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not caster or caster:IsNull() or not parent or parent:IsNull() or not ab then
        return
    end
    local radius = ab:GetSpecialValueFor("radius")
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local dot = 35 + str * 0.2
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
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
                goto __continue33
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dot,
                damage_type = 2
            })
            local ex = enemy:FindModifierByName("modifier_evo_bristle_dread_q_debuff")
            local next = math.min(
                4,
                math.max(
                    1,
                    ex and ex:GetStackCount() or 1
                )
            )
            local mod = enemy:AddNewModifier(caster, ab, "modifier_evo_bristle_dread_q_debuff", {duration = 5})
            if mod ~= nil then
                mod:SetStackCount(next)
            end
        end
        ::__continue33::
    end
end
modifier_evo_bristle_dread_q_puddle = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_q_puddle")},
    modifier_evo_bristle_dread_q_puddle
)
____exports.modifier_evo_bristle_dread_q_puddle = modifier_evo_bristle_dread_q_puddle
____exports.evo_bristle_dread_w = __TS__Class()
local evo_bristle_dread_w = ____exports.evo_bristle_dread_w
evo_bristle_dread_w.name = "evo_bristle_dread_w"
__TS__ClassExtends(evo_bristle_dread_w, BaseAbility)
function evo_bristle_dread_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    fireDreadnoughtQuillFan(nil, caster, self)
end
evo_bristle_dread_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_dread_w")},
    evo_bristle_dread_w
)
____exports.evo_bristle_dread_w = evo_bristle_dread_w
____exports.modifier_evo_bristle_dread_w_quill = __TS__Class()
local modifier_evo_bristle_dread_w_quill = ____exports.modifier_evo_bristle_dread_w_quill
modifier_evo_bristle_dread_w_quill.name = "modifier_evo_bristle_dread_w_quill"
__TS__ClassExtends(modifier_evo_bristle_dread_w_quill, BaseModifier)
function modifier_evo_bristle_dread_w_quill.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_w_quill.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_dread_w_quill.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_w_quill.prototype.GetTexture(self)
    return "bristleback_quill_spray"
end
function modifier_evo_bristle_dread_w_quill.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_bristle_dread_w_quill.prototype.GetModifierPhysicalArmorBonus(self)
    return -1.5 * self:GetStackCount()
end
modifier_evo_bristle_dread_w_quill = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_w_quill")},
    modifier_evo_bristle_dread_w_quill
)
____exports.modifier_evo_bristle_dread_w_quill = modifier_evo_bristle_dread_w_quill
____exports.modifier_evo_bristle_dread_w_dmg = __TS__Class()
local modifier_evo_bristle_dread_w_dmg = ____exports.modifier_evo_bristle_dread_w_dmg
modifier_evo_bristle_dread_w_dmg.name = "modifier_evo_bristle_dread_w_dmg"
__TS__ClassExtends(modifier_evo_bristle_dread_w_dmg, BaseModifier)
function modifier_evo_bristle_dread_w_dmg.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_dread_w_dmg.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_dread_w_dmg.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_dread_w_dmg.prototype.GetTexture(self)
    return "bristleback_quill_spray"
end
function modifier_evo_bristle_dread_w_dmg.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE")}
end
function modifier_evo_bristle_dread_w_dmg.prototype.GetModifierTotalDamageOutgoing_Percentage(self)
    return -15
end
modifier_evo_bristle_dread_w_dmg = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_dread_w_dmg")},
    modifier_evo_bristle_dread_w_dmg
)
____exports.modifier_evo_bristle_dread_w_dmg = modifier_evo_bristle_dread_w_dmg
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
                goto __continue59
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
        ::__continue59::
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
                goto __continue110
            end
            local eid = enemy:entindex()
            local last = self.hitCooldownByEnt:get(eid) or -999
            if now - last < 2.5 then
                goto __continue110
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
        ::__continue110::
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
