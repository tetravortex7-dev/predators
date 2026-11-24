local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["30"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 30,["37"] = 31,["38"] = 32,["39"] = 31,["40"] = 34,["41"] = 35,["42"] = 34,["43"] = 37,["44"] = 38,["45"] = 37,["46"] = 40,["47"] = 41,["48"] = 40,["49"] = 43,["50"] = 44,["51"] = 43,["52"] = 46,["53"] = 47,["54"] = 46,["55"] = 30,["56"] = 29,["57"] = 30,["59"] = 30,["60"] = 51,["61"] = 52,["62"] = 51,["63"] = 52,["64"] = 53,["65"] = 54,["68"] = 55,["69"] = 56,["72"] = 58,["73"] = 59,["74"] = 60,["75"] = 61,["76"] = 62,["77"] = 63,["78"] = 64,["79"] = 64,["80"] = 64,["81"] = 64,["82"] = 65,["83"] = 66,["84"] = 68,["85"] = 69,["86"] = 70,["87"] = 53,["88"] = 52,["89"] = 51,["90"] = 52,["92"] = 52,["93"] = 79,["94"] = 80,["95"] = 79,["96"] = 80,["98"] = 80,["99"] = 81,["100"] = 82,["101"] = 83,["102"] = 84,["103"] = 85,["104"] = 86,["105"] = 87,["106"] = 79,["107"] = 90,["108"] = 91,["109"] = 90,["110"] = 93,["111"] = 94,["112"] = 93,["113"] = 96,["114"] = 97,["115"] = 97,["116"] = 97,["117"] = 97,["118"] = 96,["119"] = 102,["120"] = 103,["123"] = 104,["124"] = 105,["125"] = 106,["126"] = 107,["127"] = 108,["128"] = 109,["129"] = 110,["130"] = 111,["131"] = 113,["132"] = 114,["133"] = 115,["135"] = 121,["136"] = 102,["137"] = 123,["138"] = 124,["141"] = 125,["142"] = 126,["143"] = 127,["146"] = 130,["147"] = 131,["148"] = 132,["149"] = 133,["150"] = 134,["151"] = 135,["152"] = 137,["153"] = 138,["154"] = 139,["155"] = 139,["156"] = 139,["157"] = 139,["158"] = 139,["159"] = 139,["160"] = 139,["161"] = 139,["162"] = 139,["164"] = 150,["165"] = 150,["166"] = 150,["167"] = 150,["168"] = 150,["169"] = 150,["170"] = 150,["171"] = 150,["172"] = 150,["173"] = 150,["174"] = 150,["175"] = 162,["177"] = 163,["178"] = 163,["180"] = 164,["181"] = 165,["182"] = 165,["184"] = 166,["185"] = 167,["186"] = 167,["187"] = 167,["188"] = 167,["189"] = 167,["190"] = 167,["191"] = 167,["192"] = 174,["193"] = 175,["198"] = 123,["199"] = 179,["200"] = 180,["203"] = 181,["204"] = 182,["205"] = 183,["206"] = 184,["208"] = 186,["209"] = 187,["212"] = 188,["213"] = 189,["214"] = 191,["215"] = 192,["216"] = 193,["217"] = 193,["218"] = 193,["219"] = 193,["220"] = 193,["221"] = 193,["222"] = 193,["223"] = 193,["224"] = 193,["225"] = 193,["226"] = 193,["227"] = 204,["229"] = 205,["230"] = 205,["232"] = 206,["233"] = 206,["234"] = 206,["235"] = 206,["236"] = 206,["237"] = 211,["238"] = 212,["239"] = 213,["240"] = 214,["241"] = 214,["242"] = 214,["243"] = 214,["244"] = 214,["245"] = 219,["247"] = 221,["248"] = 222,["253"] = 179,["254"] = 80,["255"] = 79,["256"] = 80,["258"] = 80,["259"] = 228,["260"] = 229,["261"] = 228,["262"] = 229,["263"] = 230,["264"] = 231,["265"] = 230,["266"] = 233,["267"] = 234,["268"] = 233,["269"] = 236,["270"] = 237,["273"] = 238,["274"] = 236,["275"] = 240,["276"] = 241,["279"] = 242,["280"] = 243,["281"] = 244,["284"] = 245,["285"] = 245,["286"] = 245,["287"] = 245,["288"] = 245,["289"] = 245,["290"] = 245,["291"] = 245,["292"] = 245,["293"] = 245,["294"] = 245,["295"] = 256,["297"] = 257,["298"] = 257,["300"] = 258,["301"] = 258,["302"] = 258,["303"] = 258,["304"] = 258,["305"] = 258,["309"] = 240,["310"] = 229,["311"] = 228,["312"] = 229,["314"] = 229,["315"] = 263,["316"] = 264,["317"] = 263,["318"] = 264,["319"] = 265,["320"] = 266,["323"] = 267,["324"] = 268,["325"] = 269,["328"] = 270,["329"] = 271,["330"] = 271,["331"] = 271,["332"] = 271,["333"] = 271,["334"] = 271,["335"] = 271,["336"] = 271,["337"] = 271,["338"] = 271,["339"] = 265,["340"] = 282,["341"] = 283,["342"] = 283,["344"] = 284,["345"] = 284,["347"] = 285,["348"] = 286,["349"] = 286,["351"] = 287,["352"] = 287,["354"] = 289,["355"] = 290,["356"] = 291,["357"] = 292,["358"] = 293,["359"] = 294,["360"] = 295,["362"] = 297,["363"] = 298,["364"] = 300,["365"] = 301,["366"] = 302,["368"] = 304,["369"] = 304,["370"] = 304,["371"] = 304,["372"] = 304,["373"] = 304,["374"] = 304,["375"] = 311,["376"] = 313,["377"] = 314,["379"] = 317,["380"] = 318,["381"] = 318,["382"] = 318,["383"] = 318,["384"] = 318,["385"] = 323,["386"] = 323,["387"] = 323,["388"] = 323,["389"] = 323,["390"] = 328,["391"] = 328,["392"] = 328,["393"] = 328,["394"] = 328,["395"] = 328,["396"] = 328,["397"] = 328,["398"] = 328,["399"] = 328,["400"] = 328,["401"] = 339,["403"] = 340,["404"] = 340,["406"] = 341,["407"] = 341,["408"] = 341,["409"] = 341,["410"] = 341,["411"] = 341,["412"] = 341,["413"] = 348,["418"] = 351,["419"] = 282,["420"] = 264,["421"] = 263,["422"] = 264,["424"] = 264,["425"] = 355,["426"] = 356,["427"] = 355,["428"] = 356,["429"] = 357,["430"] = 358,["431"] = 357,["432"] = 360,["433"] = 361,["434"] = 360,["435"] = 363,["436"] = 364,["437"] = 363,["438"] = 366,["439"] = 367,["440"] = 366,["441"] = 369,["442"] = 370,["443"] = 369,["444"] = 356,["445"] = 355,["446"] = 356,["448"] = 356,["449"] = 376,["450"] = 377,["451"] = 376,["452"] = 377,["453"] = 378,["454"] = 379,["455"] = 378,["456"] = 381,["457"] = 382,["458"] = 381,["459"] = 384,["460"] = 385,["461"] = 384,["462"] = 387,["463"] = 388,["464"] = 387,["465"] = 390,["466"] = 391,["467"] = 391,["468"] = 391,["469"] = 391,["470"] = 390,["471"] = 396,["472"] = 397,["473"] = 396,["474"] = 399,["475"] = 400,["478"] = 401,["479"] = 402,["482"] = 403,["483"] = 404,["486"] = 405,["487"] = 406,["488"] = 407,["489"] = 408,["491"] = 399,["492"] = 377,["493"] = 376,["494"] = 377,["496"] = 377,["497"] = 413,["498"] = 414,["499"] = 413,["500"] = 414,["501"] = 415,["502"] = 416,["503"] = 415,["504"] = 418,["505"] = 419,["508"] = 420,["509"] = 421,["512"] = 422,["513"] = 423,["514"] = 424,["515"] = 424,["516"] = 424,["517"] = 424,["518"] = 424,["519"] = 424,["520"] = 424,["522"] = 426,["523"] = 427,["524"] = 418,["525"] = 414,["526"] = 413,["527"] = 414,["529"] = 414,["530"] = 431,["531"] = 432,["532"] = 431,["533"] = 432,["534"] = 433,["535"] = 434,["536"] = 433,["537"] = 436,["538"] = 437,["539"] = 436,["540"] = 439,["541"] = 440,["542"] = 439,["543"] = 442,["544"] = 443,["545"] = 442,["546"] = 445,["547"] = 446,["548"] = 447,["549"] = 448,["551"] = 450,["552"] = 445,["553"] = 452,["554"] = 453,["555"] = 453,["556"] = 453,["557"] = 453,["558"] = 453,["559"] = 452,["560"] = 459,["561"] = 460,["562"] = 459,["563"] = 462,["564"] = 463,["565"] = 462,["566"] = 465,["567"] = 466,["568"] = 467,["569"] = 465,["570"] = 432,["571"] = 431,["572"] = 432,["574"] = 432,["575"] = 471,["576"] = 472,["577"] = 471,["578"] = 472,["579"] = 473,["580"] = 474,["581"] = 473,["582"] = 476,["583"] = 477,["584"] = 476,["585"] = 479,["586"] = 480,["587"] = 479,["588"] = 482,["589"] = 483,["590"] = 483,["591"] = 483,["592"] = 483,["593"] = 482,["594"] = 488,["595"] = 489,["596"] = 490,["597"] = 488,["598"] = 492,["599"] = 493,["600"] = 492,["601"] = 495,["602"] = 496,["603"] = 495,["604"] = 472,["605"] = 471,["606"] = 472,["608"] = 472,["609"] = 500,["610"] = 501,["611"] = 500,["612"] = 501,["613"] = 502,["614"] = 503,["617"] = 504,["618"] = 505,["621"] = 506,["622"] = 507,["623"] = 508,["624"] = 509,["625"] = 509,["626"] = 509,["627"] = 509,["628"] = 509,["629"] = 509,["630"] = 509,["631"] = 509,["632"] = 509,["633"] = 502,["634"] = 501,["635"] = 500,["636"] = 501,["638"] = 501,["639"] = 521,["640"] = 522,["641"] = 521,["642"] = 522,["644"] = 522,["645"] = 523,["646"] = 521,["647"] = 525,["648"] = 526,["649"] = 525,["650"] = 528,["651"] = 529,["652"] = 528,["653"] = 531,["654"] = 532,["657"] = 533,["658"] = 534,["659"] = 535,["660"] = 536,["661"] = 537,["662"] = 542,["663"] = 542,["664"] = 542,["665"] = 542,["666"] = 542,["667"] = 543,["668"] = 543,["669"] = 543,["670"] = 543,["671"] = 543,["672"] = 544,["674"] = 546,["675"] = 531,["676"] = 548,["677"] = 549,["680"] = 550,["681"] = 551,["682"] = 552,["685"] = 553,["686"] = 555,["687"] = 556,["688"] = 557,["689"] = 558,["690"] = 559,["691"] = 560,["692"] = 561,["693"] = 562,["694"] = 563,["699"] = 569,["700"] = 569,["701"] = 569,["702"] = 569,["703"] = 569,["704"] = 569,["705"] = 569,["706"] = 569,["707"] = 569,["708"] = 569,["709"] = 569,["710"] = 580,["712"] = 581,["713"] = 581,["715"] = 582,["716"] = 582,["717"] = 582,["718"] = 582,["719"] = 582,["720"] = 582,["724"] = 548,["725"] = 522,["726"] = 521,["727"] = 522,["729"] = 522});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_water"
local WATER_MODS = {
    "modifier_evo_morph_wet",
    "modifier_evo_morph_water_q_dash",
    "modifier_evo_morph_water_q_trail",
    "modifier_evo_morph_water_w_root",
    "modifier_evo_morph_water_w_mr",
    "modifier_evo_morph_water_e_buff",
    "modifier_evo_morph_water_e_passive",
    "modifier_evo_morph_water_r_thinker"
}
if IsServer() then
    for ____, modName in ipairs(WATER_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
end
____exports.modifier_evo_morph_wet = __TS__Class()
local modifier_evo_morph_wet = ____exports.modifier_evo_morph_wet
modifier_evo_morph_wet.name = "modifier_evo_morph_wet"
__TS__ClassExtends(modifier_evo_morph_wet, BaseModifier)
function modifier_evo_morph_wet.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_wet.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_wet.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_wet.prototype.GetTexture(self)
    return "morphling_waveform"
end
function modifier_evo_morph_wet.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_morph_wet.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_morph_wet = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_wet")},
    modifier_evo_morph_wet
)
____exports.modifier_evo_morph_wet = modifier_evo_morph_wet
____exports.evo_morph_water_q = __TS__Class()
local evo_morph_water_q = ____exports.evo_morph_water_q
evo_morph_water_q.name = "evo_morph_water_q"
__TS__ClassExtends(evo_morph_water_q, BaseAbility)
function evo_morph_water_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local maxDist = self:GetSpecialValueFor("dash_range")
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local rawDist = delta:Length2D()
    local dir = rawDist > 1 and delta:Normalized() or caster:GetForwardVector()
    local distance = math.min(
        maxDist,
        math.max(150, rawDist)
    )
    local speed = 1550
    local duration = math.max(0.14, distance / speed)
    caster:SetForwardVector(dir)
    caster:EmitSound("Hero_Morphling.Waveform")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_water_q_dash", {duration = duration, dir_x = dir.x, dir_y = dir.y, speed = speed})
end
evo_morph_water_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_q")},
    evo_morph_water_q
)
____exports.evo_morph_water_q = evo_morph_water_q
____exports.modifier_evo_morph_water_q_dash = __TS__Class()
local modifier_evo_morph_water_q_dash = ____exports.modifier_evo_morph_water_q_dash
modifier_evo_morph_water_q_dash.name = "modifier_evo_morph_water_q_dash"
__TS__ClassExtends(modifier_evo_morph_water_q_dash, BaseModifier)
function modifier_evo_morph_water_q_dash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1550
    self.damage = 80
    self.level = 1
    self.tickCount = 0
    self.hitTargets = __TS__New(Set)
end
function modifier_evo_morph_water_q_dash.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_q_dash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_q_dash.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_morph_water_q_dash.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    self.speed = params.speed or 1550
    local ab = self:GetAbility()
    self.damage = ab and ab:GetSpecialValueFor("damage") or 80
    self.level = ab and ab:GetLevel() or 1
    self.tickCount = 0
    self.hitTargets = __TS__New(Set)
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_waveform.vpcf", 1, parent)
    end
    self:StartIntervalThink(0.03)
end
function modifier_evo_morph_water_q_dash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        self:Destroy()
        return
    end
    self.tickCount = self.tickCount + 1
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    nextPos.z = GetGroundHeight(nextPos, parent)
    parent:SetAbsOrigin(nextPos)
    local ab = self:GetAbility()
    if self.level >= 2 and self.tickCount % 3 == 0 then
        CreateModifierThinker(
            parent,
            ab,
            "modifier_evo_morph_water_q_trail",
            {duration = 3},
            nextPos,
            parent:GetTeamNumber(),
            false
        )
    end
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        185,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue24
            end
            local id = enemy:entindex()
            if self.hitTargets:has(id) then
                goto __continue24
            end
            self.hitTargets:add(id)
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = self.damage,
                damage_type = 2
            })
            if self.level >= 2 then
                enemy:AddNewModifier(parent, ab, "modifier_evo_morph_wet", {duration = 2.5})
            end
        end
        ::__continue24::
    end
end
function modifier_evo_morph_water_q_dash.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    local endPos = parent:GetAbsOrigin()
    FindClearSpaceForUnit(parent, endPos, true)
    if self.level >= 3 then
        local ab = self:GetAbility()
        local enemies = FindUnitsInRadius(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            225,
            2,
            1 + 18,
            0,
            0,
            false
        )
        for ____, enemy in ipairs(enemies) do
            do
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                    goto __continue34
                end
                local toCenter = Vector(
                    parent:GetAbsOrigin().x - enemy:GetAbsOrigin().x,
                    parent:GetAbsOrigin().y - enemy:GetAbsOrigin().y,
                    0
                )
                local d = toCenter:Length2D()
                if d > 90 then
                    local dir = toCenter:Normalized()
                    local pulled = Vector(
                        enemy:GetAbsOrigin().x + dir.x * (d - 80),
                        enemy:GetAbsOrigin().y + dir.y * (d - 80),
                        enemy:GetAbsOrigin().z
                    )
                    FindClearSpaceForUnit(enemy, pulled, true)
                end
                enemy:AddNewModifier(parent, ab, "modifier_stunned", {duration = 0.2})
                enemy:AddNewModifier(parent, ab, "modifier_evo_morph_wet", {duration = 3})
            end
            ::__continue34::
        end
    end
end
modifier_evo_morph_water_q_dash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_q_dash")},
    modifier_evo_morph_water_q_dash
)
____exports.modifier_evo_morph_water_q_dash = modifier_evo_morph_water_q_dash
____exports.modifier_evo_morph_water_q_trail = __TS__Class()
local modifier_evo_morph_water_q_trail = ____exports.modifier_evo_morph_water_q_trail
modifier_evo_morph_water_q_trail.name = "modifier_evo_morph_water_q_trail"
__TS__ClassExtends(modifier_evo_morph_water_q_trail, BaseModifier)
function modifier_evo_morph_water_q_trail.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_q_trail.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_q_trail.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.35)
end
function modifier_evo_morph_water_q_trail.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not parent or parent:IsNull() then
        return
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        170,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue45
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1.5}
            )
        end
        ::__continue45::
    end
end
modifier_evo_morph_water_q_trail = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_q_trail")},
    modifier_evo_morph_water_q_trail
)
____exports.modifier_evo_morph_water_q_trail = modifier_evo_morph_water_q_trail
____exports.evo_morph_water_w = __TS__Class()
local evo_morph_water_w = ____exports.evo_morph_water_w
evo_morph_water_w.name = "evo_morph_water_w"
__TS__ClassExtends(evo_morph_water_w, BaseAbility)
function evo_morph_water_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not caster or caster:IsNull() or not target or target:IsNull() then
        return
    end
    caster:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast")
    ProjectileManager:CreateTrackingProjectile({
        Target = target,
        Source = caster,
        Ability = self,
        EffectName = "particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf",
        iMoveSpeed = 1200,
        bDodgeable = true,
        bProvidesVision = false,
        iSourceAttachment = 1
    })
end
function evo_morph_water_w.prototype.OnProjectileHit(self, target)
    if not IsServer() then
        return true
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return true
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return true
    end
    if target:TriggerSpellAbsorb(self) then
        return true
    end
    local level = self:GetLevel()
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local statPct = self:GetSpecialValueFor("stat_pct") / 100
    local statSum = 0
    if caster:IsRealHero() then
        local hero = caster
        statSum = hero:GetStrength() + hero:GetAgility()
    end
    local totalDmg = baseDmg + statSum * statPct
    local wasWet = target:HasModifier("modifier_evo_morph_wet")
    target:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target")
    if level >= 3 then
        target:AddNewModifier(caster, self, "modifier_evo_morph_water_w_mr", {duration = 4})
    end
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = totalDmg,
        damage_type = 2
    })
    target:AddNewModifier(caster, self, "modifier_evo_morph_wet", {duration = 2})
    if level >= 2 and wasWet then
        target:AddNewModifier(caster, self, "modifier_evo_morph_water_w_root", {duration = 1.2})
    end
    if level >= 2 then
        local dir = Vector(
            target:GetAbsOrigin().x - caster:GetAbsOrigin().x,
            target:GetAbsOrigin().y - caster:GetAbsOrigin().y,
            0
        ):Normalized()
        local splashOrigin = Vector(
            target:GetAbsOrigin().x + dir.x * 160,
            target:GetAbsOrigin().y + dir.y * 160,
            target:GetAbsOrigin().z
        )
        local splashTargets = FindUnitsInRadius(
            caster:GetTeamNumber(),
            splashOrigin,
            nil,
            220,
            2,
            1 + 18,
            0,
            0,
            false
        )
        for ____, enemy in ipairs(splashTargets) do
            do
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() or enemy == target then
                    goto __continue60
                end
                ApplyDamage({
                    victim = enemy,
                    attacker = caster,
                    ability = self,
                    damage = totalDmg * 0.5,
                    damage_type = 2
                })
                enemy:AddNewModifier(caster, self, "modifier_evo_morph_wet", {duration = 2})
            end
            ::__continue60::
        end
    end
    return true
end
evo_morph_water_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_w")},
    evo_morph_water_w
)
____exports.evo_morph_water_w = evo_morph_water_w
____exports.modifier_evo_morph_water_w_root = __TS__Class()
local modifier_evo_morph_water_w_root = ____exports.modifier_evo_morph_water_w_root
modifier_evo_morph_water_w_root.name = "modifier_evo_morph_water_w_root"
__TS__ClassExtends(modifier_evo_morph_water_w_root, BaseModifier)
function modifier_evo_morph_water_w_root.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_w_root.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_water_w_root.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_w_root.prototype.GetTexture(self)
    return "morphling_adaptive_strike_str"
end
function modifier_evo_morph_water_w_root.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_morph_water_w_root = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_w_root")},
    modifier_evo_morph_water_w_root
)
____exports.modifier_evo_morph_water_w_root = modifier_evo_morph_water_w_root
____exports.modifier_evo_morph_water_w_mr = __TS__Class()
local modifier_evo_morph_water_w_mr = ____exports.modifier_evo_morph_water_w_mr
modifier_evo_morph_water_w_mr.name = "modifier_evo_morph_water_w_mr"
__TS__ClassExtends(modifier_evo_morph_water_w_mr, BaseModifier)
function modifier_evo_morph_water_w_mr.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_w_mr.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_water_w_mr.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_w_mr.prototype.GetTexture(self)
    return "morphling_adaptive_strike_agi"
end
function modifier_evo_morph_water_w_mr.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")
    }
end
function modifier_evo_morph_water_w_mr.prototype.GetModifierMagicalResistanceBonus(self)
    return -15
end
function modifier_evo_morph_water_w_mr.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.unit ~= parent then
        return
    end
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local rem = ab:GetCooldownTimeRemaining()
    if rem > 0 then
        ab:EndCooldown()
        ab:StartCooldown(rem * 0.5)
    end
end
modifier_evo_morph_water_w_mr = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_w_mr")},
    modifier_evo_morph_water_w_mr
)
____exports.modifier_evo_morph_water_w_mr = modifier_evo_morph_water_w_mr
____exports.evo_morph_water_e = __TS__Class()
local evo_morph_water_e = ____exports.evo_morph_water_e
evo_morph_water_e.name = "evo_morph_water_e"
__TS__ClassExtends(evo_morph_water_e, BaseAbility)
function evo_morph_water_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_morph_water_e_passive"
end
function evo_morph_water_e.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    if self:GetLevel() >= 2 then
        caster:Purge(
            false,
            true,
            false,
            false,
            false
        )
    end
    caster:EmitSound("Hero_Morphling.MorphAgi")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_water_e_buff", {duration = dur})
end
evo_morph_water_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_e")},
    evo_morph_water_e
)
____exports.evo_morph_water_e = evo_morph_water_e
____exports.modifier_evo_morph_water_e_buff = __TS__Class()
local modifier_evo_morph_water_e_buff = ____exports.modifier_evo_morph_water_e_buff
modifier_evo_morph_water_e_buff.name = "modifier_evo_morph_water_e_buff"
__TS__ClassExtends(modifier_evo_morph_water_e_buff, BaseModifier)
function modifier_evo_morph_water_e_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_e_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_morph_water_e_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_e_buff.prototype.GetTexture(self)
    return "morphling_morph_str"
end
function modifier_evo_morph_water_e_buff.prototype.CheckState(self)
    local ab = self:GetAbility()
    if ab and ab:GetLevel() >= 2 then
        return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
    end
    return {}
end
function modifier_evo_morph_water_e_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EVASION_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING")
    }
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 18
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierEvasion_Constant(self)
    return 25
end
function modifier_evo_morph_water_e_buff.prototype.GetModifierStatusResistanceStacking(self)
    local ab = self:GetAbility()
    return ab and ab:GetLevel() >= 3 and 25 or 0
end
modifier_evo_morph_water_e_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_e_buff")},
    modifier_evo_morph_water_e_buff
)
____exports.modifier_evo_morph_water_e_buff = modifier_evo_morph_water_e_buff
____exports.modifier_evo_morph_water_e_passive = __TS__Class()
local modifier_evo_morph_water_e_passive = ____exports.modifier_evo_morph_water_e_passive
modifier_evo_morph_water_e_passive.name = "modifier_evo_morph_water_e_passive"
__TS__ClassExtends(modifier_evo_morph_water_e_passive, BaseModifier)
function modifier_evo_morph_water_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_morph_water_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")
    }
end
function modifier_evo_morph_water_e_passive.prototype.isOnCooldownT4(self)
    local ab = self:GetAbility()
    return ab ~= nil and not ab:IsNull() and ab:GetLevel() >= 3 and not ab:IsCooldownReady()
end
function modifier_evo_morph_water_e_passive.prototype.GetModifierPhysicalArmorBonus(self)
    return self:isOnCooldownT4() and 6 or 0
end
function modifier_evo_morph_water_e_passive.prototype.GetModifierConstantHealthRegen(self)
    return self:isOnCooldownT4() and 5 or 0
end
modifier_evo_morph_water_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_e_passive")},
    modifier_evo_morph_water_e_passive
)
____exports.modifier_evo_morph_water_e_passive = modifier_evo_morph_water_e_passive
____exports.evo_morph_water_r = __TS__Class()
local evo_morph_water_r = ____exports.evo_morph_water_r
evo_morph_water_r.name = "evo_morph_water_r"
__TS__ClassExtends(evo_morph_water_r, BaseAbility)
function evo_morph_water_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Slardar.Amplify_Damage")
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_morph_water_r_thinker",
        {duration = dur},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_morph_water_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_r")},
    evo_morph_water_r
)
____exports.evo_morph_water_r = evo_morph_water_r
____exports.modifier_evo_morph_water_r_thinker = __TS__Class()
local modifier_evo_morph_water_r_thinker = ____exports.modifier_evo_morph_water_r_thinker
modifier_evo_morph_water_r_thinker.name = "modifier_evo_morph_water_r_thinker"
__TS__ClassExtends(modifier_evo_morph_water_r_thinker, BaseModifier)
function modifier_evo_morph_water_r_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 500
end
function modifier_evo_morph_water_r_thinker.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_r_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_r_thinker.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local ab = self:GetAbility()
    self.radius = ab and ab:GetSpecialValueFor("radius") or 500
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slardar/slardar_crush.vpcf", 8, nil)
        ParticleManager:SetParticleControl(
            pfx,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            pfx,
            1,
            Vector(self.radius, self.radius, self.radius)
        )
        ParticleManager:ReleaseParticleIndex(pfx)
    end
    self:StartIntervalThink(0.5)
end
function modifier_evo_morph_water_r_thinker.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not parent or parent:IsNull() then
        return
    end
    local origin = parent:GetAbsOrigin()
    if caster:IsAlive() then
        local dist = (caster:GetAbsOrigin() - origin):Length2D()
        if dist <= self.radius then
            local q = caster:FindAbilityByName("evo_morph_water_q")
            if q and not q:IsNull() then
                local rem = q:GetCooldownTimeRemaining()
                if rem > 0.3 then
                    q:EndCooldown()
                    q:StartCooldown(math.max(0.05, rem - 0.25))
                end
            end
        end
    end
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
                goto __continue116
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1}
            )
        end
        ::__continue116::
    end
end
modifier_evo_morph_water_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_r_thinker")},
    modifier_evo_morph_water_r_thinker
)
____exports.modifier_evo_morph_water_r_thinker = modifier_evo_morph_water_r_thinker
return ____exports
