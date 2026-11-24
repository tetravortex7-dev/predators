local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["31"] = 27,["32"] = 28,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 32,["39"] = 33,["40"] = 32,["41"] = 35,["42"] = 36,["43"] = 35,["44"] = 38,["45"] = 39,["46"] = 38,["47"] = 41,["48"] = 42,["49"] = 41,["50"] = 44,["51"] = 45,["52"] = 44,["53"] = 28,["54"] = 27,["55"] = 28,["57"] = 28,["58"] = 49,["59"] = 50,["60"] = 49,["61"] = 50,["62"] = 51,["63"] = 52,["66"] = 53,["67"] = 54,["70"] = 56,["71"] = 57,["72"] = 58,["73"] = 59,["74"] = 60,["75"] = 61,["76"] = 62,["77"] = 62,["78"] = 62,["79"] = 62,["80"] = 63,["81"] = 64,["82"] = 66,["83"] = 67,["84"] = 68,["85"] = 51,["86"] = 50,["87"] = 49,["88"] = 50,["90"] = 50,["91"] = 77,["92"] = 78,["93"] = 77,["94"] = 78,["96"] = 78,["97"] = 79,["98"] = 80,["99"] = 81,["100"] = 82,["101"] = 83,["102"] = 84,["103"] = 85,["104"] = 77,["105"] = 88,["106"] = 89,["107"] = 88,["108"] = 91,["109"] = 92,["110"] = 91,["111"] = 94,["112"] = 95,["113"] = 95,["114"] = 95,["115"] = 95,["116"] = 94,["117"] = 100,["118"] = 101,["121"] = 102,["122"] = 103,["123"] = 104,["124"] = 105,["125"] = 106,["126"] = 107,["127"] = 108,["128"] = 110,["129"] = 111,["130"] = 112,["132"] = 118,["133"] = 100,["134"] = 120,["135"] = 121,["138"] = 122,["139"] = 123,["140"] = 124,["143"] = 127,["144"] = 128,["145"] = 129,["146"] = 130,["147"] = 131,["148"] = 132,["149"] = 134,["150"] = 135,["151"] = 136,["152"] = 136,["153"] = 136,["154"] = 136,["155"] = 136,["156"] = 136,["157"] = 136,["158"] = 136,["159"] = 136,["161"] = 147,["162"] = 147,["163"] = 147,["164"] = 147,["165"] = 147,["166"] = 147,["167"] = 147,["168"] = 147,["169"] = 147,["170"] = 147,["171"] = 147,["172"] = 159,["174"] = 160,["175"] = 160,["177"] = 161,["178"] = 162,["179"] = 162,["181"] = 163,["182"] = 164,["183"] = 164,["184"] = 164,["185"] = 164,["186"] = 164,["187"] = 164,["188"] = 164,["189"] = 171,["190"] = 172,["195"] = 120,["196"] = 176,["197"] = 177,["200"] = 178,["201"] = 179,["202"] = 180,["203"] = 181,["205"] = 183,["206"] = 184,["209"] = 185,["210"] = 186,["211"] = 188,["212"] = 189,["213"] = 190,["214"] = 190,["215"] = 190,["216"] = 190,["217"] = 190,["218"] = 190,["219"] = 190,["220"] = 190,["221"] = 190,["222"] = 190,["223"] = 190,["224"] = 201,["226"] = 202,["227"] = 202,["229"] = 203,["230"] = 203,["231"] = 203,["232"] = 203,["233"] = 203,["234"] = 208,["235"] = 209,["236"] = 210,["237"] = 211,["238"] = 211,["239"] = 211,["240"] = 211,["241"] = 211,["242"] = 216,["244"] = 218,["245"] = 219,["250"] = 176,["251"] = 78,["252"] = 77,["253"] = 78,["255"] = 78,["256"] = 225,["257"] = 226,["258"] = 225,["259"] = 226,["260"] = 227,["261"] = 228,["262"] = 227,["263"] = 230,["264"] = 231,["265"] = 230,["266"] = 233,["267"] = 234,["270"] = 235,["271"] = 233,["272"] = 237,["273"] = 238,["276"] = 239,["277"] = 240,["278"] = 241,["281"] = 242,["282"] = 242,["283"] = 242,["284"] = 242,["285"] = 242,["286"] = 242,["287"] = 242,["288"] = 242,["289"] = 242,["290"] = 242,["291"] = 242,["292"] = 253,["294"] = 254,["295"] = 254,["297"] = 255,["298"] = 255,["299"] = 255,["300"] = 255,["301"] = 255,["302"] = 255,["306"] = 237,["307"] = 226,["308"] = 225,["309"] = 226,["311"] = 226,["312"] = 260,["313"] = 261,["314"] = 260,["315"] = 261,["316"] = 262,["317"] = 263,["320"] = 264,["321"] = 265,["322"] = 266,["325"] = 267,["326"] = 268,["327"] = 268,["328"] = 268,["329"] = 268,["330"] = 268,["331"] = 268,["332"] = 268,["333"] = 268,["334"] = 268,["335"] = 268,["336"] = 262,["337"] = 279,["338"] = 280,["339"] = 280,["341"] = 281,["342"] = 281,["344"] = 282,["345"] = 283,["346"] = 283,["348"] = 284,["349"] = 284,["351"] = 286,["352"] = 287,["353"] = 288,["354"] = 289,["355"] = 290,["356"] = 291,["357"] = 292,["359"] = 294,["360"] = 295,["361"] = 297,["362"] = 298,["363"] = 299,["365"] = 301,["366"] = 301,["367"] = 301,["368"] = 301,["369"] = 301,["370"] = 301,["371"] = 301,["372"] = 308,["373"] = 310,["374"] = 311,["376"] = 314,["377"] = 315,["378"] = 315,["379"] = 315,["380"] = 315,["381"] = 315,["382"] = 320,["383"] = 320,["384"] = 320,["385"] = 320,["386"] = 320,["387"] = 325,["388"] = 325,["389"] = 325,["390"] = 325,["391"] = 325,["392"] = 325,["393"] = 325,["394"] = 325,["395"] = 325,["396"] = 325,["397"] = 325,["398"] = 336,["400"] = 337,["401"] = 337,["403"] = 338,["404"] = 338,["405"] = 338,["406"] = 338,["407"] = 338,["408"] = 338,["409"] = 338,["410"] = 345,["415"] = 348,["416"] = 279,["417"] = 261,["418"] = 260,["419"] = 261,["421"] = 261,["422"] = 352,["423"] = 353,["424"] = 352,["425"] = 353,["426"] = 354,["427"] = 355,["428"] = 354,["429"] = 357,["430"] = 358,["431"] = 357,["432"] = 360,["433"] = 361,["434"] = 360,["435"] = 363,["436"] = 364,["437"] = 363,["438"] = 366,["439"] = 367,["440"] = 366,["441"] = 353,["442"] = 352,["443"] = 353,["445"] = 353,["446"] = 373,["447"] = 374,["448"] = 373,["449"] = 374,["450"] = 375,["451"] = 376,["452"] = 375,["453"] = 378,["454"] = 379,["455"] = 378,["456"] = 381,["457"] = 382,["458"] = 381,["459"] = 384,["460"] = 385,["461"] = 384,["462"] = 387,["463"] = 388,["464"] = 388,["465"] = 388,["466"] = 388,["467"] = 387,["468"] = 393,["469"] = 394,["470"] = 393,["471"] = 396,["472"] = 397,["475"] = 398,["476"] = 399,["479"] = 400,["480"] = 401,["483"] = 402,["484"] = 403,["485"] = 404,["486"] = 405,["488"] = 396,["489"] = 374,["490"] = 373,["491"] = 374,["493"] = 374,["494"] = 410,["495"] = 411,["496"] = 410,["497"] = 411,["498"] = 412,["499"] = 413,["500"] = 412,["501"] = 415,["502"] = 416,["505"] = 417,["506"] = 418,["509"] = 419,["510"] = 420,["511"] = 421,["512"] = 421,["513"] = 421,["514"] = 421,["515"] = 421,["516"] = 421,["517"] = 421,["519"] = 423,["520"] = 424,["521"] = 415,["522"] = 411,["523"] = 410,["524"] = 411,["526"] = 411,["527"] = 428,["528"] = 429,["529"] = 428,["530"] = 429,["531"] = 430,["532"] = 431,["533"] = 430,["534"] = 433,["535"] = 434,["536"] = 433,["537"] = 436,["538"] = 437,["539"] = 436,["540"] = 439,["541"] = 440,["542"] = 439,["543"] = 442,["544"] = 443,["545"] = 444,["546"] = 445,["548"] = 447,["549"] = 442,["550"] = 449,["551"] = 450,["552"] = 450,["553"] = 450,["554"] = 450,["555"] = 450,["556"] = 449,["557"] = 456,["558"] = 457,["559"] = 456,["560"] = 459,["561"] = 460,["562"] = 459,["563"] = 462,["564"] = 463,["565"] = 464,["566"] = 462,["567"] = 429,["568"] = 428,["569"] = 429,["571"] = 429,["572"] = 468,["573"] = 469,["574"] = 468,["575"] = 469,["576"] = 470,["577"] = 471,["578"] = 470,["579"] = 473,["580"] = 474,["581"] = 473,["582"] = 476,["583"] = 477,["584"] = 476,["585"] = 479,["586"] = 480,["587"] = 480,["588"] = 480,["589"] = 480,["590"] = 479,["591"] = 485,["592"] = 486,["593"] = 487,["594"] = 485,["595"] = 489,["596"] = 490,["597"] = 489,["598"] = 492,["599"] = 493,["600"] = 492,["601"] = 469,["602"] = 468,["603"] = 469,["605"] = 469,["606"] = 497,["607"] = 498,["608"] = 497,["609"] = 498,["610"] = 499,["611"] = 500,["614"] = 501,["615"] = 502,["618"] = 503,["619"] = 504,["620"] = 505,["621"] = 506,["622"] = 506,["623"] = 506,["624"] = 506,["625"] = 506,["626"] = 506,["627"] = 506,["628"] = 506,["629"] = 506,["630"] = 499,["631"] = 498,["632"] = 497,["633"] = 498,["635"] = 498,["636"] = 518,["637"] = 519,["638"] = 518,["639"] = 519,["641"] = 519,["642"] = 520,["643"] = 518,["644"] = 522,["645"] = 523,["646"] = 522,["647"] = 525,["648"] = 526,["649"] = 525,["650"] = 528,["651"] = 529,["654"] = 530,["655"] = 531,["656"] = 532,["657"] = 533,["658"] = 534,["659"] = 539,["660"] = 539,["661"] = 539,["662"] = 539,["663"] = 539,["664"] = 540,["665"] = 540,["666"] = 540,["667"] = 540,["668"] = 540,["669"] = 541,["671"] = 543,["672"] = 528,["673"] = 545,["674"] = 546,["677"] = 547,["678"] = 548,["679"] = 549,["682"] = 550,["683"] = 552,["684"] = 553,["685"] = 554,["686"] = 555,["687"] = 556,["688"] = 557,["689"] = 558,["690"] = 559,["691"] = 560,["696"] = 566,["697"] = 566,["698"] = 566,["699"] = 566,["700"] = 566,["701"] = 566,["702"] = 566,["703"] = 566,["704"] = 566,["705"] = 566,["706"] = 566,["707"] = 577,["709"] = 578,["710"] = 578,["712"] = 579,["713"] = 579,["714"] = 579,["715"] = 579,["716"] = 579,["717"] = 579,["721"] = 545,["722"] = 519,["723"] = 518,["724"] = 519,["726"] = 519});
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
for ____, modName in ipairs(WATER_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
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
                goto __continue23
            end
            local id = enemy:entindex()
            if self.hitTargets:has(id) then
                goto __continue23
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
        ::__continue23::
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
                    goto __continue33
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
            ::__continue33::
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
                goto __continue44
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1.5}
            )
        end
        ::__continue44::
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
                    goto __continue59
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
            ::__continue59::
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
                goto __continue115
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1}
            )
        end
        ::__continue115::
    end
end
modifier_evo_morph_water_r_thinker = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_r_thinker")},
    modifier_evo_morph_water_r_thinker
)
____exports.modifier_evo_morph_water_r_thinker = modifier_evo_morph_water_r_thinker
return ____exports
