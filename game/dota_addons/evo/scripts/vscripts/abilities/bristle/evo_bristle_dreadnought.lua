local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 11,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 13,["31"] = 25,["32"] = 26,["34"] = 29,["35"] = 31,["36"] = 32,["37"] = 33,["38"] = 34,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 38,["43"] = 39,["44"] = 40,["45"] = 42,["46"] = 43,["47"] = 48,["48"] = 50,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 62,["60"] = 63,["62"] = 64,["63"] = 64,["65"] = 65,["66"] = 66,["67"] = 67,["68"] = 68,["69"] = 69,["71"] = 71,["72"] = 71,["73"] = 71,["74"] = 71,["75"] = 71,["76"] = 71,["77"] = 71,["78"] = 71,["79"] = 80,["80"] = 81,["81"] = 82,["82"] = 83,["84"] = 86,["85"] = 87,["87"] = 90,["88"] = 91,["89"] = 92,["90"] = 93,["91"] = 94,["92"] = 95,["93"] = 96,["94"] = 98,["95"] = 98,["96"] = 98,["97"] = 97,["98"] = 104,["99"] = 104,["100"] = 104,["101"] = 104,["102"] = 104,["103"] = 109,["104"] = 110,["110"] = 31,["111"] = 116,["112"] = 117,["113"] = 116,["114"] = 117,["115"] = 118,["116"] = 119,["119"] = 120,["120"] = 121,["123"] = 123,["124"] = 124,["125"] = 125,["126"] = 126,["127"] = 127,["128"] = 128,["129"] = 129,["130"] = 131,["131"] = 132,["132"] = 137,["133"] = 138,["134"] = 140,["135"] = 140,["136"] = 140,["137"] = 140,["138"] = 140,["139"] = 140,["140"] = 140,["141"] = 140,["142"] = 140,["143"] = 140,["144"] = 140,["145"] = 152,["147"] = 153,["148"] = 153,["150"] = 154,["151"] = 154,["152"] = 154,["153"] = 154,["154"] = 154,["155"] = 154,["156"] = 154,["157"] = 161,["158"] = 162,["159"] = 162,["160"] = 162,["161"] = 162,["162"] = 163,["163"] = 164,["164"] = 165,["166"] = 167,["167"] = 168,["172"] = 172,["173"] = 173,["174"] = 173,["175"] = 173,["176"] = 173,["177"] = 173,["178"] = 173,["179"] = 173,["180"] = 173,["181"] = 173,["183"] = 118,["184"] = 117,["185"] = 116,["186"] = 117,["188"] = 117,["189"] = 186,["190"] = 187,["191"] = 186,["192"] = 187,["193"] = 188,["194"] = 189,["195"] = 188,["196"] = 191,["197"] = 192,["198"] = 191,["199"] = 194,["200"] = 195,["201"] = 194,["202"] = 197,["203"] = 198,["204"] = 197,["205"] = 200,["206"] = 201,["207"] = 201,["208"] = 201,["209"] = 201,["210"] = 201,["211"] = 200,["212"] = 207,["213"] = 208,["214"] = 209,["215"] = 207,["216"] = 211,["217"] = 212,["218"] = 213,["219"] = 211,["220"] = 215,["221"] = 216,["222"] = 217,["223"] = 215,["224"] = 187,["225"] = 186,["226"] = 187,["228"] = 187,["229"] = 221,["230"] = 222,["231"] = 221,["232"] = 222,["233"] = 223,["234"] = 224,["235"] = 223,["236"] = 226,["237"] = 227,["238"] = 226,["239"] = 229,["240"] = 230,["241"] = 229,["242"] = 232,["243"] = 233,["244"] = 232,["245"] = 235,["246"] = 236,["247"] = 235,["248"] = 222,["249"] = 221,["250"] = 222,["252"] = 222,["253"] = 242,["254"] = 243,["255"] = 242,["256"] = 243,["257"] = 244,["258"] = 245,["259"] = 244,["260"] = 247,["261"] = 248,["262"] = 247,["263"] = 250,["264"] = 251,["267"] = 252,["268"] = 250,["269"] = 254,["270"] = 255,["273"] = 256,["274"] = 257,["275"] = 258,["276"] = 259,["279"] = 261,["280"] = 262,["281"] = 263,["282"] = 264,["283"] = 264,["284"] = 264,["285"] = 264,["286"] = 264,["287"] = 264,["288"] = 264,["289"] = 264,["290"] = 264,["291"] = 264,["292"] = 264,["293"] = 275,["295"] = 276,["296"] = 276,["298"] = 277,["299"] = 277,["300"] = 277,["301"] = 277,["302"] = 277,["303"] = 277,["304"] = 277,["305"] = 284,["306"] = 285,["307"] = 285,["308"] = 285,["309"] = 285,["310"] = 285,["311"] = 285,["312"] = 285,["313"] = 286,["314"] = 287,["315"] = 288,["320"] = 254,["321"] = 243,["322"] = 242,["323"] = 243,["325"] = 243,["326"] = 294,["327"] = 295,["328"] = 294,["329"] = 295,["330"] = 296,["331"] = 297,["334"] = 298,["335"] = 299,["338"] = 300,["339"] = 296,["340"] = 295,["341"] = 294,["342"] = 295,["344"] = 295,["345"] = 304,["346"] = 305,["347"] = 304,["348"] = 305,["349"] = 306,["350"] = 307,["351"] = 306,["352"] = 309,["353"] = 310,["354"] = 309,["355"] = 312,["356"] = 313,["357"] = 312,["358"] = 315,["359"] = 316,["360"] = 315,["361"] = 318,["362"] = 319,["363"] = 318,["364"] = 321,["365"] = 322,["366"] = 321,["367"] = 305,["368"] = 304,["369"] = 305,["371"] = 305,["372"] = 326,["373"] = 327,["374"] = 326,["375"] = 327,["376"] = 328,["377"] = 329,["378"] = 328,["379"] = 331,["380"] = 332,["381"] = 331,["382"] = 334,["383"] = 335,["384"] = 334,["385"] = 337,["386"] = 338,["387"] = 337,["388"] = 340,["389"] = 341,["390"] = 340,["391"] = 343,["392"] = 344,["393"] = 343,["394"] = 327,["395"] = 326,["396"] = 327,["398"] = 327,["399"] = 348,["400"] = 349,["401"] = 348,["402"] = 349,["403"] = 350,["404"] = 351,["405"] = 352,["407"] = 354,["408"] = 350,["409"] = 356,["410"] = 357,["411"] = 356,["412"] = 359,["413"] = 360,["416"] = 361,["417"] = 362,["420"] = 364,["421"] = 365,["422"] = 366,["423"] = 367,["424"] = 368,["425"] = 370,["426"] = 371,["427"] = 372,["428"] = 373,["430"] = 376,["431"] = 376,["432"] = 376,["433"] = 376,["434"] = 376,["435"] = 376,["436"] = 376,["437"] = 376,["438"] = 376,["439"] = 376,["440"] = 376,["441"] = 387,["443"] = 388,["444"] = 388,["446"] = 389,["447"] = 390,["448"] = 390,["449"] = 392,["450"] = 393,["451"] = 394,["453"] = 396,["454"] = 390,["455"] = 390,["456"] = 390,["460"] = 359,["461"] = 349,["462"] = 348,["463"] = 349,["465"] = 349,["466"] = 404,["467"] = 405,["468"] = 404,["469"] = 405,["470"] = 406,["471"] = 407,["472"] = 406,["473"] = 409,["474"] = 410,["475"] = 409,["476"] = 412,["477"] = 413,["478"] = 412,["479"] = 415,["480"] = 416,["481"] = 416,["482"] = 416,["483"] = 416,["484"] = 415,["485"] = 421,["486"] = 422,["487"] = 423,["488"] = 424,["489"] = 424,["491"] = 425,["492"] = 421,["493"] = 427,["494"] = 428,["497"] = 429,["498"] = 430,["499"] = 431,["502"] = 432,["505"] = 433,["508"] = 435,["509"] = 436,["512"] = 437,["515"] = 439,["516"] = 440,["517"] = 441,["518"] = 442,["519"] = 443,["520"] = 444,["521"] = 444,["522"] = 444,["523"] = 444,["524"] = 444,["525"] = 444,["526"] = 444,["527"] = 444,["530"] = 455,["531"] = 456,["533"] = 427,["534"] = 405,["535"] = 404,["536"] = 405,["538"] = 405,["539"] = 461,["540"] = 462,["541"] = 461,["542"] = 462,["543"] = 463,["544"] = 464,["545"] = 463,["546"] = 466,["547"] = 467,["548"] = 466,["549"] = 469,["550"] = 470,["551"] = 469,["552"] = 472,["553"] = 473,["554"] = 472,["555"] = 475,["556"] = 476,["557"] = 475,["558"] = 478,["559"] = 479,["560"] = 479,["562"] = 480,["563"] = 481,["564"] = 481,["566"] = 482,["567"] = 482,["568"] = 482,["569"] = 482,["570"] = 483,["571"] = 484,["572"] = 485,["574"] = 487,["576"] = 489,["577"] = 478,["578"] = 462,["579"] = 461,["580"] = 462,["582"] = 462,["583"] = 493,["584"] = 494,["585"] = 493,["586"] = 494,["587"] = 495,["588"] = 496,["589"] = 495,["590"] = 498,["591"] = 499,["592"] = 498,["593"] = 501,["594"] = 502,["595"] = 501,["596"] = 504,["597"] = 505,["598"] = 504,["599"] = 507,["600"] = 508,["601"] = 507,["602"] = 510,["603"] = 511,["604"] = 510,["605"] = 494,["606"] = 493,["607"] = 494,["609"] = 494,["610"] = 515,["611"] = 516,["612"] = 515,["613"] = 516,["614"] = 517,["615"] = 518,["618"] = 519,["619"] = 520,["622"] = 522,["623"] = 523,["624"] = 523,["625"] = 523,["626"] = 523,["627"] = 523,["628"] = 523,["629"] = 523,["630"] = 524,["631"] = 525,["632"] = 526,["633"] = 517,["634"] = 516,["635"] = 515,["636"] = 516,["638"] = 516,["639"] = 530,["640"] = 531,["641"] = 530,["642"] = 531,["644"] = 531,["645"] = 532,["646"] = 533,["647"] = 530,["648"] = 535,["649"] = 536,["650"] = 535,["651"] = 538,["652"] = 539,["653"] = 538,["654"] = 541,["655"] = 542,["656"] = 541,["657"] = 544,["658"] = 545,["659"] = 544,["660"] = 547,["661"] = 548,["664"] = 549,["665"] = 550,["666"] = 551,["667"] = 547,["668"] = 553,["669"] = 554,["672"] = 555,["673"] = 556,["674"] = 557,["677"] = 558,["678"] = 560,["679"] = 561,["680"] = 562,["681"] = 563,["682"] = 564,["685"] = 568,["686"] = 569,["687"] = 570,["688"] = 570,["689"] = 570,["690"] = 570,["691"] = 570,["692"] = 570,["693"] = 570,["694"] = 570,["695"] = 570,["696"] = 570,["697"] = 570,["698"] = 581,["700"] = 582,["701"] = 582,["703"] = 583,["704"] = 584,["705"] = 585,["706"] = 585,["708"] = 586,["709"] = 587,["710"] = 587,["711"] = 587,["712"] = 587,["713"] = 587,["714"] = 587,["715"] = 587,["716"] = 594,["720"] = 553,["721"] = 597,["722"] = 598,["723"] = 598,["724"] = 598,["725"] = 598,["726"] = 597,["727"] = 603,["728"] = 604,["729"] = 603,["730"] = 606,["731"] = 607,["732"] = 606,["733"] = 531,["734"] = 530,["735"] = 531,["737"] = 531});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_bristle_t1 = require("abilities.bristle.evo_bristle_t1")
local grantBristleAdrenalineStacks = ____evo_bristle_t1.grantBristleAdrenalineStacks
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
local pushCooldownByEnt = __TS__New(Map)
function ____exports.fireDreadnoughtQuillFan(self, caster, ability)
    local level = ability:GetLevel()
    local radius = ability:GetSpecialValueFor("radius")
    local baseDmg = ability:GetSpecialValueFor("base_damage")
    local strPct = ability:GetSpecialValueFor("str_pct") / 100
    local perStackBonus = ability:GetSpecialValueFor("stack_damage")
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    local str = caster:IsRealHero() and caster:GetStrength() or 0
    local rawBase = baseDmg + str * strPct
    local now = GameRules:GetDOTATime(false, false)
    caster:EmitSound("Hero_Bristleback.QuillSpray.Cast")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_bristleback/bristleback_quill_spray.vpcf", 1, caster)
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
    local casterOrigin = caster:GetAbsOrigin()
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue5
            end
            local ex = enemy:FindModifierByName("modifier_evo_bristle_dread_w_quill")
            local curStacks = ex and ex:GetStackCount() or 0
            local dmg = rawBase + curStacks * perStackBonus
            if enemy:IsCreep() then
                dmg = dmg * 1.3
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ability,
                damage = dmg,
                damage_type = 1,
                damage_flags = level >= 2 and 524288 or 0
            })
            local nextStacks = math.min(maxStacks, curStacks + 1)
            local mod = enemy:AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_quill", {duration = 5})
            if mod ~= nil then
                mod:SetStackCount(nextStacks)
            end
            if level >= 2 and nextStacks >= 3 then
                enemy:AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_dmg", {duration = 3})
            end
            if level >= 3 then
                local dist = (enemy:GetAbsOrigin() - casterOrigin):Length2D()
                local eid = enemy:entindex()
                local lastPush = pushCooldownByEnt:get(eid) or -999
                if dist <= 225 and now - lastPush >= 4 then
                    pushCooldownByEnt:set(eid, now)
                    local pushDir = dist > 1 and Vector(
                        enemy:GetAbsOrigin().x - casterOrigin.x,
                        enemy:GetAbsOrigin().y - casterOrigin.y,
                        0
                    ):Normalized() or caster:GetForwardVector()
                    local targetPos = Vector(
                        enemy:GetAbsOrigin().x + pushDir.x * 110,
                        enemy:GetAbsOrigin().y + pushDir.y * 110,
                        enemy:GetAbsOrigin().z
                    )
                    FindClearSpaceForUnit(enemy, targetPos, true)
                    enemy:Interrupt()
                end
            end
        end
        ::__continue5::
    end
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
                goto __continue16
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
        ::__continue16::
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
                goto __continue42
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
        ::__continue42::
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
    ____exports.fireDreadnoughtQuillFan(nil, caster, self)
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
                goto __continue68
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
        ::__continue68::
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
            ____exports.fireDreadnoughtQuillFan(nil, parent, wAb)
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
                goto __continue119
            end
            local eid = enemy:entindex()
            local last = self.hitCooldownByEnt:get(eid) or -999
            if now - last < 2.5 then
                goto __continue119
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
        ::__continue119::
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
