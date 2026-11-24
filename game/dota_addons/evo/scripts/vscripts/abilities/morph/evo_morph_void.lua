local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["31"] = 27,["32"] = 28,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["39"] = 31,["40"] = 32,["43"] = 33,["44"] = 34,["45"] = 35,["46"] = 29,["47"] = 28,["48"] = 27,["49"] = 28,["51"] = 28,["52"] = 39,["53"] = 40,["54"] = 39,["55"] = 40,["57"] = 40,["58"] = 41,["59"] = 39,["60"] = 43,["61"] = 44,["62"] = 43,["63"] = 46,["64"] = 47,["65"] = 46,["66"] = 49,["67"] = 50,["68"] = 49,["69"] = 52,["70"] = 53,["71"] = 52,["72"] = 55,["73"] = 56,["76"] = 57,["77"] = 58,["78"] = 55,["79"] = 60,["80"] = 61,["83"] = 62,["84"] = 63,["85"] = 64,["88"] = 66,["89"] = 67,["90"] = 68,["91"] = 68,["92"] = 68,["93"] = 68,["94"] = 68,["95"] = 68,["96"] = 68,["97"] = 68,["98"] = 68,["99"] = 68,["100"] = 68,["101"] = 79,["103"] = 80,["104"] = 80,["106"] = 81,["107"] = 82,["108"] = 82,["110"] = 83,["111"] = 84,["112"] = 84,["113"] = 84,["114"] = 84,["115"] = 84,["116"] = 84,["117"] = 84,["118"] = 91,["119"] = 92,["120"] = 93,["121"] = 94,["122"] = 95,["128"] = 60,["129"] = 100,["130"] = 101,["131"] = 101,["132"] = 101,["133"] = 101,["134"] = 100,["135"] = 106,["136"] = 107,["137"] = 107,["138"] = 107,["139"] = 107,["140"] = 107,["141"] = 107,["142"] = 106,["143"] = 114,["144"] = 115,["145"] = 114,["146"] = 117,["147"] = 118,["148"] = 117,["149"] = 120,["150"] = 121,["153"] = 122,["154"] = 123,["157"] = 124,["158"] = 125,["159"] = 126,["160"] = 127,["161"] = 128,["163"] = 130,["164"] = 120,["165"] = 132,["166"] = 133,["169"] = 134,["170"] = 135,["173"] = 136,["176"] = 137,["179"] = 138,["180"] = 132,["181"] = 40,["182"] = 39,["183"] = 40,["185"] = 40,["186"] = 142,["187"] = 143,["188"] = 142,["189"] = 143,["190"] = 144,["191"] = 145,["192"] = 144,["193"] = 147,["194"] = 148,["195"] = 147,["196"] = 150,["197"] = 151,["198"] = 150,["199"] = 153,["200"] = 154,["201"] = 153,["202"] = 156,["203"] = 157,["204"] = 156,["205"] = 159,["206"] = 160,["207"] = 159,["208"] = 143,["209"] = 142,["210"] = 143,["212"] = 143,["213"] = 164,["214"] = 165,["215"] = 164,["216"] = 165,["217"] = 166,["218"] = 167,["221"] = 168,["222"] = 169,["223"] = 170,["226"] = 171,["229"] = 173,["230"] = 174,["231"] = 175,["232"] = 166,["233"] = 165,["234"] = 164,["235"] = 165,["237"] = 165,["238"] = 179,["239"] = 180,["240"] = 179,["241"] = 180,["243"] = 180,["244"] = 181,["245"] = 179,["246"] = 183,["247"] = 184,["248"] = 183,["249"] = 186,["250"] = 187,["251"] = 186,["252"] = 189,["253"] = 190,["254"] = 189,["255"] = 192,["256"] = 193,["257"] = 192,["258"] = 195,["259"] = 196,["260"] = 195,["261"] = 198,["262"] = 199,["263"] = 198,["264"] = 201,["265"] = 202,["268"] = 203,["269"] = 204,["270"] = 205,["271"] = 206,["274"] = 207,["277"] = 208,["280"] = 210,["281"] = 211,["282"] = 212,["283"] = 213,["284"] = 214,["285"] = 216,["286"] = 217,["287"] = 217,["288"] = 217,["289"] = 217,["290"] = 217,["291"] = 217,["292"] = 217,["293"] = 224,["294"] = 225,["296"] = 227,["297"] = 228,["298"] = 229,["299"] = 229,["300"] = 229,["301"] = 229,["302"] = 230,["304"] = 232,["305"] = 201,["306"] = 180,["307"] = 179,["308"] = 180,["310"] = 180,["311"] = 236,["312"] = 237,["313"] = 236,["314"] = 237,["315"] = 238,["316"] = 239,["317"] = 238,["318"] = 241,["319"] = 242,["320"] = 241,["321"] = 244,["322"] = 245,["323"] = 244,["324"] = 247,["325"] = 248,["326"] = 247,["327"] = 250,["328"] = 251,["329"] = 250,["330"] = 253,["331"] = 254,["332"] = 253,["333"] = 237,["334"] = 236,["335"] = 237,["337"] = 237,["338"] = 258,["339"] = 259,["340"] = 258,["341"] = 259,["342"] = 260,["343"] = 261,["344"] = 260,["345"] = 259,["346"] = 258,["347"] = 259,["349"] = 259,["350"] = 265,["351"] = 266,["352"] = 265,["353"] = 266,["354"] = 267,["355"] = 268,["356"] = 267,["357"] = 270,["358"] = 271,["359"] = 270,["360"] = 273,["361"] = 274,["362"] = 273,["363"] = 276,["364"] = 277,["365"] = 276,["366"] = 279,["367"] = 280,["370"] = 281,["371"] = 282,["372"] = 283,["375"] = 284,["376"] = 285,["379"] = 287,["380"] = 288,["381"] = 289,["382"] = 290,["383"] = 293,["384"] = 294,["385"] = 295,["386"] = 296,["387"] = 297,["388"] = 298,["390"] = 301,["391"] = 301,["392"] = 301,["393"] = 301,["394"] = 301,["395"] = 301,["396"] = 301,["397"] = 309,["398"] = 310,["400"] = 279,["401"] = 266,["402"] = 265,["403"] = 266,["405"] = 266,["406"] = 315,["407"] = 316,["408"] = 315,["409"] = 316,["410"] = 317,["411"] = 318,["412"] = 317,["413"] = 320,["414"] = 321,["415"] = 320,["416"] = 323,["417"] = 324,["418"] = 323,["419"] = 326,["420"] = 327,["421"] = 326,["422"] = 329,["423"] = 330,["424"] = 329,["425"] = 332,["426"] = 333,["427"] = 334,["428"] = 335,["429"] = 332,["430"] = 316,["431"] = 315,["432"] = 316,["434"] = 316,["435"] = 339,["436"] = 340,["437"] = 339,["438"] = 340,["439"] = 341,["440"] = 342,["441"] = 341,["442"] = 344,["443"] = 345,["444"] = 344,["445"] = 347,["446"] = 348,["447"] = 347,["448"] = 350,["449"] = 351,["450"] = 350,["451"] = 353,["452"] = 354,["453"] = 354,["454"] = 354,["455"] = 354,["456"] = 353,["457"] = 359,["458"] = 360,["459"] = 359,["460"] = 362,["461"] = 363,["462"] = 362,["463"] = 340,["464"] = 339,["465"] = 340,["467"] = 340,["468"] = 367,["469"] = 368,["470"] = 367,["471"] = 368,["472"] = 369,["473"] = 370,["476"] = 371,["477"] = 372,["478"] = 373,["481"] = 374,["484"] = 376,["485"] = 377,["486"] = 379,["487"] = 380,["488"] = 382,["489"] = 382,["490"] = 382,["491"] = 382,["492"] = 382,["493"] = 382,["494"] = 382,["495"] = 382,["496"] = 382,["497"] = 394,["499"] = 395,["500"] = 395,["502"] = 396,["503"] = 397,["504"] = 397,["505"] = 397,["506"] = 397,["507"] = 397,["508"] = 398,["512"] = 369,["513"] = 368,["514"] = 367,["515"] = 368,["517"] = 368,["518"] = 403,["519"] = 404,["520"] = 403,["521"] = 404,["522"] = 405,["523"] = 406,["524"] = 405,["525"] = 408,["526"] = 409,["527"] = 408,["528"] = 411,["529"] = 412,["530"] = 411,["531"] = 414,["532"] = 415,["533"] = 414,["534"] = 417,["535"] = 418,["536"] = 417,["537"] = 404,["538"] = 403,["539"] = 404,["541"] = 404});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_void"
local VOID_MODS = {
    "modifier_evo_morph_void_q_invis",
    "modifier_evo_morph_void_q_slow",
    "modifier_evo_morph_void_w_mark",
    "modifier_evo_morph_void_w_amp",
    "modifier_evo_morph_void_e_passive",
    "modifier_evo_morph_erosion",
    "modifier_evo_morph_void_exhaust",
    "modifier_evo_morph_void_r_root"
}
for ____, modName in ipairs(VOID_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_morph_void_q = __TS__Class()
local evo_morph_void_q = ____exports.evo_morph_void_q
evo_morph_void_q.name = "evo_morph_void_q"
__TS__ClassExtends(evo_morph_void_q, BaseAbility)
function evo_morph_void_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Weaver.Shukuchi")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_void_q_invis", {duration = dur})
end
evo_morph_void_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_void_q")},
    evo_morph_void_q
)
____exports.evo_morph_void_q = evo_morph_void_q
____exports.modifier_evo_morph_void_q_invis = __TS__Class()
local modifier_evo_morph_void_q_invis = ____exports.modifier_evo_morph_void_q_invis
modifier_evo_morph_void_q_invis.name = "modifier_evo_morph_void_q_invis"
__TS__ClassExtends(modifier_evo_morph_void_q_invis, BaseModifier)
function modifier_evo_morph_void_q_invis.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitSet = __TS__New(Set)
end
function modifier_evo_morph_void_q_invis.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_q_invis.prototype.IsDebuff(self)
    return false
end
function modifier_evo_morph_void_q_invis.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_void_q_invis.prototype.GetTexture(self)
    return "weaver_shukuchi"
end
function modifier_evo_morph_void_q_invis.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.hitSet = __TS__New(Set)
    self:StartIntervalThink(0.1)
end
function modifier_evo_morph_void_q_invis.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    local passDmg = ab:GetSpecialValueFor("pass_damage")
    local level = ab:GetLevel()
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        175,
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
            local id = enemy:entindex()
            if self.hitSet:has(id) then
                goto __continue16
            end
            self.hitSet:add(id)
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = passDmg,
                damage_type = 2
            })
            if level >= 2 then
                local slowDur = level >= 3 and 4 or 3
                local mod = enemy:AddNewModifier(parent, ab, "modifier_evo_morph_void_q_slow", {duration = slowDur})
                if mod ~= nil then
                    mod:SetStackCount(level >= 3 and 25 or 15)
                end
            end
        end
        ::__continue16::
    end
end
function modifier_evo_morph_void_q_invis.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_INVISIBLE")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true
    }
end
function modifier_evo_morph_void_q_invis.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED")
    }
end
function modifier_evo_morph_void_q_invis.prototype.GetModifierMoveSpeed_Absolute(self)
    return 550
end
function modifier_evo_morph_void_q_invis.prototype.GetModifierInvisibilityLevel(self)
    return 1
end
function modifier_evo_morph_void_q_invis.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local target = event.target
    local ab = self:GetAbility()
    if target and not target:IsNull() and IsValidEntity(target) and ab and ab:GetLevel() >= 2 then
        local stun = ab:GetLevel() >= 3 and 0.4 or 0.2
        target:AddNewModifier(parent, ab, "modifier_stunned", {duration = stun})
    end
    self:Destroy()
end
function modifier_evo_morph_void_q_invis.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.unit ~= parent then
        return
    end
    if event.ability and event.ability:GetAbilityName() == "evo_morph_void_w" then
        return
    end
    if event.ability and event.ability:GetAbilityName() == "evo_morph_void_q" then
        return
    end
    self:Destroy()
end
modifier_evo_morph_void_q_invis = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_q_invis")},
    modifier_evo_morph_void_q_invis
)
____exports.modifier_evo_morph_void_q_invis = modifier_evo_morph_void_q_invis
____exports.modifier_evo_morph_void_q_slow = __TS__Class()
local modifier_evo_morph_void_q_slow = ____exports.modifier_evo_morph_void_q_slow
modifier_evo_morph_void_q_slow.name = "modifier_evo_morph_void_q_slow"
__TS__ClassExtends(modifier_evo_morph_void_q_slow, BaseModifier)
function modifier_evo_morph_void_q_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_q_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_void_q_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_void_q_slow.prototype.GetTexture(self)
    return "weaver_shukuchi"
end
function modifier_evo_morph_void_q_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_morph_void_q_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self:GetStackCount()
end
modifier_evo_morph_void_q_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_q_slow")},
    modifier_evo_morph_void_q_slow
)
____exports.modifier_evo_morph_void_q_slow = modifier_evo_morph_void_q_slow
____exports.evo_morph_void_w = __TS__Class()
local evo_morph_void_w = ____exports.evo_morph_void_w
evo_morph_void_w.name = "evo_morph_void_w"
__TS__ClassExtends(evo_morph_void_w, BaseAbility)
function evo_morph_void_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not caster or caster:IsNull() or not target or target:IsNull() then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    caster:EmitSound("Hero_Enigma.Malefice")
    target:AddNewModifier(caster, self, "modifier_evo_morph_void_w_mark", {duration = dur})
end
evo_morph_void_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_void_w")},
    evo_morph_void_w
)
____exports.evo_morph_void_w = evo_morph_void_w
____exports.modifier_evo_morph_void_w_mark = __TS__Class()
local modifier_evo_morph_void_w_mark = ____exports.modifier_evo_morph_void_w_mark
modifier_evo_morph_void_w_mark.name = "modifier_evo_morph_void_w_mark"
__TS__ClassExtends(modifier_evo_morph_void_w_mark, BaseModifier)
function modifier_evo_morph_void_w_mark.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.triggered = false
end
function modifier_evo_morph_void_w_mark.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_w_mark.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_void_w_mark.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_void_w_mark.prototype.GetTexture(self)
    return "enigma_malefice"
end
function modifier_evo_morph_void_w_mark.prototype.OnCreated(self)
    self.triggered = false
end
function modifier_evo_morph_void_w_mark.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")}
end
function modifier_evo_morph_void_w_mark.prototype.OnTakeDamage(self, event)
    if not IsServer() or self.triggered then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not caster or caster:IsNull() or not ab then
        return
    end
    if event.unit ~= parent or event.attacker ~= caster then
        return
    end
    if event.inflictor == ab then
        return
    end
    self.triggered = true
    local level = ab:GetLevel()
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local intPct = ab:GetSpecialValueFor("int_pct") / 100
    local intVal = caster:IsRealHero() and caster:GetIntellect(false) or 0
    parent:EmitSound("Hero_VoidSpirit.AstralStep.End")
    ApplyDamage({
        victim = parent,
        attacker = caster,
        ability = ab,
        damage = baseDmg + intVal * intPct,
        damage_type = 2
    })
    if level >= 2 then
        parent:AddNewModifier(caster, ab, "modifier_silence", {duration = 1.5})
    end
    if level >= 3 then
        local burn = parent:GetMaxMana() * 0.1
        parent:SetMana(math.max(
            0,
            parent:GetMana() - burn
        ))
        caster:AddNewModifier(caster, ab, "modifier_evo_morph_void_w_amp", {duration = 5})
    end
    self:Destroy()
end
modifier_evo_morph_void_w_mark = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_w_mark")},
    modifier_evo_morph_void_w_mark
)
____exports.modifier_evo_morph_void_w_mark = modifier_evo_morph_void_w_mark
____exports.modifier_evo_morph_void_w_amp = __TS__Class()
local modifier_evo_morph_void_w_amp = ____exports.modifier_evo_morph_void_w_amp
modifier_evo_morph_void_w_amp.name = "modifier_evo_morph_void_w_amp"
__TS__ClassExtends(modifier_evo_morph_void_w_amp, BaseModifier)
function modifier_evo_morph_void_w_amp.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_w_amp.prototype.IsDebuff(self)
    return false
end
function modifier_evo_morph_void_w_amp.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_void_w_amp.prototype.GetTexture(self)
    return "enigma_malefice"
end
function modifier_evo_morph_void_w_amp.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE")}
end
function modifier_evo_morph_void_w_amp.prototype.GetModifierSpellAmplify_Percentage(self)
    return 12
end
modifier_evo_morph_void_w_amp = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_w_amp")},
    modifier_evo_morph_void_w_amp
)
____exports.modifier_evo_morph_void_w_amp = modifier_evo_morph_void_w_amp
____exports.evo_morph_void_e = __TS__Class()
local evo_morph_void_e = ____exports.evo_morph_void_e
evo_morph_void_e.name = "evo_morph_void_e"
__TS__ClassExtends(evo_morph_void_e, BaseAbility)
function evo_morph_void_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_morph_void_e_passive"
end
evo_morph_void_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_void_e")},
    evo_morph_void_e
)
____exports.evo_morph_void_e = evo_morph_void_e
____exports.modifier_evo_morph_void_e_passive = __TS__Class()
local modifier_evo_morph_void_e_passive = ____exports.modifier_evo_morph_void_e_passive
modifier_evo_morph_void_e_passive.name = "modifier_evo_morph_void_e_passive"
__TS__ClassExtends(modifier_evo_morph_void_e_passive, BaseModifier)
function modifier_evo_morph_void_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_void_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_void_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_morph_void_e_passive.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_morph_void_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    local level = ab:GetLevel()
    local maxStacks = ab:GetSpecialValueFor("max_stacks")
    local onHitPerStack = ab:GetSpecialValueFor("on_hit_damage")
    local addStacks = level >= 2 and (target:IsRooted() or target:HasModifier("modifier_evo_morph_void_q_slow")) and 2 or 1
    local existing = target:FindModifierByName("modifier_evo_morph_erosion")
    local cur = existing and existing:GetStackCount() or 0
    local next = math.min(maxStacks, cur + addStacks)
    local mod = target:AddNewModifier(parent, ab, "modifier_evo_morph_erosion", {duration = 4})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ab,
        damage = next * onHitPerStack,
        damage_type = 2
    })
    if level >= 3 and next >= maxStacks then
        target:AddNewModifier(parent, ab, "modifier_evo_morph_void_exhaust", {duration = 4})
    end
end
modifier_evo_morph_void_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_e_passive")},
    modifier_evo_morph_void_e_passive
)
____exports.modifier_evo_morph_void_e_passive = modifier_evo_morph_void_e_passive
____exports.modifier_evo_morph_erosion = __TS__Class()
local modifier_evo_morph_erosion = ____exports.modifier_evo_morph_erosion
modifier_evo_morph_erosion.name = "modifier_evo_morph_erosion"
__TS__ClassExtends(modifier_evo_morph_erosion, BaseModifier)
function modifier_evo_morph_erosion.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_erosion.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_erosion.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_erosion.prototype.GetTexture(self)
    return "enigma_midnight_pulse"
end
function modifier_evo_morph_erosion.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")}
end
function modifier_evo_morph_erosion.prototype.GetModifierMagicalResistanceBonus(self)
    local ab = self:GetAbility()
    local per = ab and ab:GetSpecialValueFor("mr_shred_per_stack") or 3
    return -per * self:GetStackCount()
end
modifier_evo_morph_erosion = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_erosion")},
    modifier_evo_morph_erosion
)
____exports.modifier_evo_morph_erosion = modifier_evo_morph_erosion
____exports.modifier_evo_morph_void_exhaust = __TS__Class()
local modifier_evo_morph_void_exhaust = ____exports.modifier_evo_morph_void_exhaust
modifier_evo_morph_void_exhaust.name = "modifier_evo_morph_void_exhaust"
__TS__ClassExtends(modifier_evo_morph_void_exhaust, BaseModifier)
function modifier_evo_morph_void_exhaust.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_exhaust.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_void_exhaust.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_void_exhaust.prototype.GetTexture(self)
    return "ancient_apparition_ice_blast"
end
function modifier_evo_morph_void_exhaust.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE")
    }
end
function modifier_evo_morph_void_exhaust.prototype.GetModifierHealAmplify_PercentageTarget(self)
    return -40
end
function modifier_evo_morph_void_exhaust.prototype.GetModifierHPRegenAmplify_Percentage(self)
    return -40
end
modifier_evo_morph_void_exhaust = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_exhaust")},
    modifier_evo_morph_void_exhaust
)
____exports.modifier_evo_morph_void_exhaust = modifier_evo_morph_void_exhaust
____exports.evo_morph_void_r = __TS__Class()
local evo_morph_void_r = ____exports.evo_morph_void_r
evo_morph_void_r.name = "evo_morph_void_r"
__TS__ClassExtends(evo_morph_void_r, BaseAbility)
function evo_morph_void_r.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not caster or caster:IsNull() or not target or target:IsNull() then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local rootDur = self:GetSpecialValueFor("root_duration")
    local illuDur = self:GetSpecialValueFor("illusion_duration")
    caster:EmitSound("Hero_Enigma.Black_Hole")
    target:AddNewModifier(caster, self, "modifier_evo_morph_void_r_root", {duration = rootDur})
    local illusions = CreateIllusions(
        caster,
        caster,
        {outgoing_damage = -35, incoming_damage = 50},
        1,
        100,
        false,
        true
    )
    for ____, illu in ipairs(illusions) do
        do
            if not illu or illu:IsNull() or not IsValidEntity(illu) then
                goto __continue92
            end
            illu:AddNewModifier(caster, self, "modifier_kill", {duration = illuDur})
            FindClearSpaceForUnit(
                illu,
                target:GetAbsOrigin(),
                true
            )
            illu:MoveToTargetToAttack(target)
        end
        ::__continue92::
    end
end
evo_morph_void_r = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_void_r")},
    evo_morph_void_r
)
____exports.evo_morph_void_r = evo_morph_void_r
____exports.modifier_evo_morph_void_r_root = __TS__Class()
local modifier_evo_morph_void_r_root = ____exports.modifier_evo_morph_void_r_root
modifier_evo_morph_void_r_root.name = "modifier_evo_morph_void_r_root"
__TS__ClassExtends(modifier_evo_morph_void_r_root, BaseModifier)
function modifier_evo_morph_void_r_root.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_void_r_root.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_void_r_root.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_void_r_root.prototype.GetTexture(self)
    return "enigma_black_hole"
end
function modifier_evo_morph_void_r_root.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_morph_void_r_root = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_void_r_root")},
    modifier_evo_morph_void_r_root
)
____exports.modifier_evo_morph_void_r_root = modifier_evo_morph_void_r_root
return ____exports
