local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 11,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 13,["31"] = 25,["32"] = 26,["33"] = 27,["36"] = 31,["37"] = 33,["38"] = 34,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 38,["43"] = 39,["44"] = 40,["45"] = 41,["46"] = 42,["47"] = 44,["48"] = 45,["49"] = 50,["50"] = 52,["51"] = 52,["52"] = 52,["53"] = 52,["54"] = 52,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 64,["62"] = 65,["64"] = 66,["65"] = 66,["67"] = 67,["68"] = 68,["69"] = 69,["70"] = 70,["71"] = 71,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 73,["79"] = 73,["80"] = 73,["81"] = 82,["82"] = 83,["83"] = 84,["84"] = 85,["86"] = 88,["87"] = 89,["89"] = 92,["90"] = 93,["91"] = 94,["92"] = 95,["93"] = 96,["94"] = 97,["95"] = 98,["96"] = 100,["97"] = 100,["98"] = 100,["99"] = 99,["100"] = 106,["101"] = 106,["102"] = 106,["103"] = 106,["104"] = 106,["105"] = 111,["106"] = 112,["112"] = 33,["113"] = 118,["114"] = 119,["115"] = 118,["116"] = 119,["117"] = 120,["118"] = 121,["121"] = 122,["122"] = 123,["125"] = 125,["126"] = 126,["127"] = 127,["128"] = 128,["129"] = 129,["130"] = 130,["131"] = 131,["132"] = 133,["133"] = 134,["134"] = 139,["135"] = 140,["136"] = 142,["137"] = 142,["138"] = 142,["139"] = 142,["140"] = 142,["141"] = 142,["142"] = 142,["143"] = 142,["144"] = 142,["145"] = 142,["146"] = 142,["147"] = 154,["149"] = 155,["150"] = 155,["152"] = 156,["153"] = 156,["154"] = 156,["155"] = 156,["156"] = 156,["157"] = 156,["158"] = 156,["159"] = 163,["160"] = 164,["161"] = 164,["162"] = 164,["163"] = 164,["164"] = 165,["165"] = 166,["166"] = 167,["168"] = 169,["169"] = 170,["174"] = 174,["175"] = 175,["176"] = 175,["177"] = 175,["178"] = 175,["179"] = 175,["180"] = 175,["181"] = 175,["182"] = 175,["183"] = 175,["185"] = 120,["186"] = 119,["187"] = 118,["188"] = 119,["190"] = 119,["191"] = 188,["192"] = 189,["193"] = 188,["194"] = 189,["195"] = 190,["196"] = 191,["197"] = 190,["198"] = 193,["199"] = 194,["200"] = 193,["201"] = 196,["202"] = 197,["203"] = 196,["204"] = 199,["205"] = 200,["206"] = 199,["207"] = 202,["208"] = 203,["209"] = 203,["210"] = 203,["211"] = 203,["212"] = 203,["213"] = 202,["214"] = 209,["215"] = 210,["216"] = 211,["217"] = 209,["218"] = 213,["219"] = 214,["220"] = 215,["221"] = 213,["222"] = 217,["223"] = 218,["224"] = 219,["225"] = 217,["226"] = 189,["227"] = 188,["228"] = 189,["230"] = 189,["231"] = 223,["232"] = 224,["233"] = 223,["234"] = 224,["235"] = 225,["236"] = 226,["237"] = 225,["238"] = 228,["239"] = 229,["240"] = 228,["241"] = 231,["242"] = 232,["243"] = 231,["244"] = 234,["245"] = 235,["246"] = 234,["247"] = 237,["248"] = 238,["249"] = 237,["250"] = 224,["251"] = 223,["252"] = 224,["254"] = 224,["255"] = 244,["256"] = 245,["257"] = 244,["258"] = 245,["259"] = 246,["260"] = 247,["261"] = 246,["262"] = 249,["263"] = 250,["264"] = 249,["265"] = 252,["266"] = 253,["269"] = 254,["270"] = 252,["271"] = 256,["272"] = 257,["275"] = 258,["276"] = 259,["277"] = 260,["278"] = 261,["281"] = 263,["282"] = 264,["283"] = 265,["284"] = 266,["285"] = 266,["286"] = 266,["287"] = 266,["288"] = 266,["289"] = 266,["290"] = 266,["291"] = 266,["292"] = 266,["293"] = 266,["294"] = 266,["295"] = 277,["297"] = 278,["298"] = 278,["300"] = 279,["301"] = 279,["302"] = 279,["303"] = 279,["304"] = 279,["305"] = 279,["306"] = 279,["307"] = 286,["308"] = 287,["309"] = 287,["310"] = 287,["311"] = 287,["312"] = 287,["313"] = 287,["314"] = 287,["315"] = 288,["316"] = 289,["317"] = 290,["322"] = 256,["323"] = 245,["324"] = 244,["325"] = 245,["327"] = 245,["328"] = 296,["329"] = 297,["330"] = 296,["331"] = 297,["332"] = 298,["333"] = 299,["336"] = 300,["337"] = 301,["340"] = 302,["341"] = 298,["342"] = 297,["343"] = 296,["344"] = 297,["346"] = 297,["347"] = 306,["348"] = 307,["349"] = 306,["350"] = 307,["351"] = 308,["352"] = 309,["353"] = 308,["354"] = 311,["355"] = 312,["356"] = 311,["357"] = 314,["358"] = 315,["359"] = 314,["360"] = 317,["361"] = 318,["362"] = 317,["363"] = 320,["364"] = 321,["365"] = 320,["366"] = 323,["367"] = 324,["368"] = 323,["369"] = 307,["370"] = 306,["371"] = 307,["373"] = 307,["374"] = 328,["375"] = 329,["376"] = 328,["377"] = 329,["378"] = 330,["379"] = 331,["380"] = 330,["381"] = 333,["382"] = 334,["383"] = 333,["384"] = 336,["385"] = 337,["386"] = 336,["387"] = 339,["388"] = 340,["389"] = 339,["390"] = 342,["391"] = 343,["392"] = 342,["393"] = 345,["394"] = 346,["395"] = 345,["396"] = 329,["397"] = 328,["398"] = 329,["400"] = 329,["401"] = 350,["402"] = 351,["403"] = 350,["404"] = 351,["405"] = 352,["406"] = 353,["407"] = 354,["409"] = 356,["410"] = 352,["411"] = 358,["412"] = 359,["413"] = 358,["414"] = 361,["415"] = 362,["418"] = 363,["419"] = 364,["422"] = 366,["423"] = 367,["424"] = 368,["425"] = 369,["426"] = 370,["427"] = 372,["428"] = 373,["429"] = 374,["430"] = 375,["432"] = 378,["433"] = 378,["434"] = 378,["435"] = 378,["436"] = 378,["437"] = 378,["438"] = 378,["439"] = 378,["440"] = 378,["441"] = 378,["442"] = 378,["443"] = 389,["445"] = 390,["446"] = 390,["448"] = 391,["449"] = 392,["450"] = 392,["451"] = 394,["452"] = 395,["453"] = 396,["455"] = 398,["456"] = 392,["457"] = 392,["458"] = 392,["462"] = 361,["463"] = 351,["464"] = 350,["465"] = 351,["467"] = 351,["468"] = 406,["469"] = 407,["470"] = 406,["471"] = 407,["472"] = 408,["473"] = 409,["474"] = 408,["475"] = 411,["476"] = 412,["477"] = 411,["478"] = 414,["479"] = 415,["480"] = 414,["481"] = 417,["482"] = 418,["483"] = 418,["484"] = 418,["485"] = 418,["486"] = 417,["487"] = 423,["488"] = 424,["489"] = 425,["490"] = 426,["491"] = 426,["493"] = 427,["494"] = 423,["495"] = 429,["496"] = 430,["499"] = 431,["500"] = 432,["501"] = 433,["504"] = 434,["507"] = 435,["510"] = 437,["511"] = 438,["514"] = 439,["517"] = 441,["518"] = 442,["519"] = 443,["520"] = 444,["521"] = 445,["522"] = 446,["523"] = 446,["524"] = 446,["525"] = 446,["526"] = 446,["527"] = 446,["528"] = 446,["529"] = 446,["532"] = 457,["533"] = 458,["535"] = 429,["536"] = 407,["537"] = 406,["538"] = 407,["540"] = 407,["541"] = 463,["542"] = 464,["543"] = 463,["544"] = 464,["545"] = 465,["546"] = 466,["547"] = 465,["548"] = 468,["549"] = 469,["550"] = 468,["551"] = 471,["552"] = 472,["553"] = 471,["554"] = 474,["555"] = 475,["556"] = 474,["557"] = 477,["558"] = 478,["559"] = 477,["560"] = 480,["561"] = 481,["562"] = 481,["564"] = 482,["565"] = 483,["566"] = 483,["568"] = 484,["569"] = 484,["570"] = 484,["571"] = 484,["572"] = 485,["573"] = 486,["574"] = 487,["576"] = 489,["578"] = 491,["579"] = 480,["580"] = 464,["581"] = 463,["582"] = 464,["584"] = 464,["585"] = 495,["586"] = 496,["587"] = 495,["588"] = 496,["589"] = 497,["590"] = 498,["591"] = 497,["592"] = 500,["593"] = 501,["594"] = 500,["595"] = 503,["596"] = 504,["597"] = 503,["598"] = 506,["599"] = 507,["600"] = 506,["601"] = 509,["602"] = 510,["603"] = 509,["604"] = 512,["605"] = 513,["606"] = 512,["607"] = 496,["608"] = 495,["609"] = 496,["611"] = 496,["612"] = 517,["613"] = 518,["614"] = 517,["615"] = 518,["616"] = 519,["617"] = 520,["620"] = 521,["621"] = 522,["624"] = 524,["625"] = 525,["626"] = 525,["627"] = 525,["628"] = 525,["629"] = 525,["630"] = 525,["631"] = 525,["632"] = 526,["633"] = 527,["634"] = 528,["635"] = 519,["636"] = 518,["637"] = 517,["638"] = 518,["640"] = 518,["641"] = 532,["642"] = 533,["643"] = 532,["644"] = 533,["646"] = 533,["647"] = 534,["648"] = 535,["649"] = 532,["650"] = 537,["651"] = 538,["652"] = 537,["653"] = 540,["654"] = 541,["655"] = 540,["656"] = 543,["657"] = 544,["658"] = 543,["659"] = 546,["660"] = 547,["661"] = 546,["662"] = 549,["663"] = 550,["666"] = 551,["667"] = 552,["668"] = 553,["669"] = 549,["670"] = 555,["671"] = 556,["674"] = 557,["675"] = 558,["676"] = 559,["679"] = 560,["680"] = 562,["681"] = 563,["682"] = 564,["683"] = 565,["684"] = 566,["687"] = 570,["688"] = 571,["689"] = 572,["690"] = 572,["691"] = 572,["692"] = 572,["693"] = 572,["694"] = 572,["695"] = 572,["696"] = 572,["697"] = 572,["698"] = 572,["699"] = 572,["700"] = 583,["702"] = 584,["703"] = 584,["705"] = 585,["706"] = 586,["707"] = 587,["708"] = 587,["710"] = 588,["711"] = 589,["712"] = 589,["713"] = 589,["714"] = 589,["715"] = 589,["716"] = 589,["717"] = 589,["718"] = 596,["722"] = 555,["723"] = 599,["724"] = 600,["725"] = 600,["726"] = 600,["727"] = 600,["728"] = 599,["729"] = 605,["730"] = 606,["731"] = 605,["732"] = 608,["733"] = 609,["734"] = 608,["735"] = 533,["736"] = 532,["737"] = 533,["739"] = 533});
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
if IsServer() then
    for ____, modName in ipairs(DREAD_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
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
                goto __continue6
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
        ::__continue6::
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
                goto __continue17
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
        ::__continue17::
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
                goto __continue43
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
        ::__continue43::
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
                goto __continue69
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
        ::__continue69::
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
                goto __continue120
            end
            local eid = enemy:entindex()
            local last = self.hitCooldownByEnt:get(eid) or -999
            if now - last < 2.5 then
                goto __continue120
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
        ::__continue120::
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
