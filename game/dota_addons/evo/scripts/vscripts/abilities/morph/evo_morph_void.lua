local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 23,["29"] = 24,["30"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 30,["37"] = 31,["38"] = 32,["41"] = 33,["42"] = 34,["45"] = 35,["46"] = 36,["47"] = 37,["48"] = 31,["49"] = 30,["50"] = 29,["51"] = 30,["53"] = 30,["54"] = 41,["55"] = 42,["56"] = 41,["57"] = 42,["59"] = 42,["60"] = 43,["61"] = 41,["62"] = 45,["63"] = 46,["64"] = 45,["65"] = 48,["66"] = 49,["67"] = 48,["68"] = 51,["69"] = 52,["70"] = 51,["71"] = 54,["72"] = 55,["73"] = 54,["74"] = 57,["75"] = 58,["78"] = 59,["79"] = 60,["80"] = 57,["81"] = 62,["82"] = 63,["85"] = 64,["86"] = 65,["87"] = 66,["90"] = 68,["91"] = 69,["92"] = 70,["93"] = 70,["94"] = 70,["95"] = 70,["96"] = 70,["97"] = 70,["98"] = 70,["99"] = 70,["100"] = 70,["101"] = 70,["102"] = 70,["103"] = 81,["105"] = 82,["106"] = 82,["108"] = 83,["109"] = 84,["110"] = 84,["112"] = 85,["113"] = 86,["114"] = 86,["115"] = 86,["116"] = 86,["117"] = 86,["118"] = 86,["119"] = 86,["120"] = 93,["121"] = 94,["122"] = 95,["123"] = 96,["124"] = 97,["130"] = 62,["131"] = 102,["132"] = 103,["133"] = 103,["134"] = 103,["135"] = 103,["136"] = 102,["137"] = 108,["138"] = 109,["139"] = 109,["140"] = 109,["141"] = 109,["142"] = 109,["143"] = 109,["144"] = 108,["145"] = 116,["146"] = 117,["147"] = 116,["148"] = 119,["149"] = 120,["150"] = 119,["151"] = 122,["152"] = 123,["155"] = 124,["156"] = 125,["159"] = 126,["160"] = 127,["161"] = 128,["162"] = 129,["163"] = 130,["165"] = 132,["166"] = 122,["167"] = 134,["168"] = 135,["171"] = 136,["172"] = 137,["175"] = 138,["178"] = 139,["181"] = 140,["182"] = 134,["183"] = 42,["184"] = 41,["185"] = 42,["187"] = 42,["188"] = 144,["189"] = 145,["190"] = 144,["191"] = 145,["192"] = 146,["193"] = 147,["194"] = 146,["195"] = 149,["196"] = 150,["197"] = 149,["198"] = 152,["199"] = 153,["200"] = 152,["201"] = 155,["202"] = 156,["203"] = 155,["204"] = 158,["205"] = 159,["206"] = 158,["207"] = 161,["208"] = 162,["209"] = 161,["210"] = 145,["211"] = 144,["212"] = 145,["214"] = 145,["215"] = 166,["216"] = 167,["217"] = 166,["218"] = 167,["219"] = 168,["220"] = 169,["223"] = 170,["224"] = 171,["225"] = 172,["228"] = 173,["231"] = 175,["232"] = 176,["233"] = 177,["234"] = 168,["235"] = 167,["236"] = 166,["237"] = 167,["239"] = 167,["240"] = 181,["241"] = 182,["242"] = 181,["243"] = 182,["245"] = 182,["246"] = 183,["247"] = 181,["248"] = 185,["249"] = 186,["250"] = 185,["251"] = 188,["252"] = 189,["253"] = 188,["254"] = 191,["255"] = 192,["256"] = 191,["257"] = 194,["258"] = 195,["259"] = 194,["260"] = 197,["261"] = 198,["262"] = 197,["263"] = 200,["264"] = 201,["265"] = 200,["266"] = 203,["267"] = 204,["270"] = 205,["271"] = 206,["272"] = 207,["273"] = 208,["276"] = 209,["279"] = 210,["282"] = 212,["283"] = 213,["284"] = 214,["285"] = 215,["286"] = 216,["287"] = 218,["288"] = 219,["289"] = 219,["290"] = 219,["291"] = 219,["292"] = 219,["293"] = 219,["294"] = 219,["295"] = 226,["296"] = 227,["298"] = 229,["299"] = 230,["300"] = 231,["301"] = 231,["302"] = 231,["303"] = 231,["304"] = 232,["306"] = 234,["307"] = 203,["308"] = 182,["309"] = 181,["310"] = 182,["312"] = 182,["313"] = 238,["314"] = 239,["315"] = 238,["316"] = 239,["317"] = 240,["318"] = 241,["319"] = 240,["320"] = 243,["321"] = 244,["322"] = 243,["323"] = 246,["324"] = 247,["325"] = 246,["326"] = 249,["327"] = 250,["328"] = 249,["329"] = 252,["330"] = 253,["331"] = 252,["332"] = 255,["333"] = 256,["334"] = 255,["335"] = 239,["336"] = 238,["337"] = 239,["339"] = 239,["340"] = 260,["341"] = 261,["342"] = 260,["343"] = 261,["344"] = 262,["345"] = 263,["346"] = 262,["347"] = 261,["348"] = 260,["349"] = 261,["351"] = 261,["352"] = 267,["353"] = 268,["354"] = 267,["355"] = 268,["356"] = 269,["357"] = 270,["358"] = 269,["359"] = 272,["360"] = 273,["361"] = 272,["362"] = 275,["363"] = 276,["364"] = 275,["365"] = 278,["366"] = 279,["367"] = 278,["368"] = 281,["369"] = 282,["372"] = 283,["373"] = 284,["374"] = 285,["377"] = 286,["378"] = 287,["381"] = 289,["382"] = 290,["383"] = 291,["384"] = 292,["385"] = 295,["386"] = 296,["387"] = 297,["388"] = 298,["389"] = 299,["390"] = 300,["392"] = 303,["393"] = 303,["394"] = 303,["395"] = 303,["396"] = 303,["397"] = 303,["398"] = 303,["399"] = 311,["400"] = 312,["402"] = 281,["403"] = 268,["404"] = 267,["405"] = 268,["407"] = 268,["408"] = 317,["409"] = 318,["410"] = 317,["411"] = 318,["412"] = 319,["413"] = 320,["414"] = 319,["415"] = 322,["416"] = 323,["417"] = 322,["418"] = 325,["419"] = 326,["420"] = 325,["421"] = 328,["422"] = 329,["423"] = 328,["424"] = 331,["425"] = 332,["426"] = 331,["427"] = 334,["428"] = 335,["429"] = 336,["430"] = 337,["431"] = 334,["432"] = 318,["433"] = 317,["434"] = 318,["436"] = 318,["437"] = 341,["438"] = 342,["439"] = 341,["440"] = 342,["441"] = 343,["442"] = 344,["443"] = 343,["444"] = 346,["445"] = 347,["446"] = 346,["447"] = 349,["448"] = 350,["449"] = 349,["450"] = 352,["451"] = 353,["452"] = 352,["453"] = 355,["454"] = 356,["455"] = 356,["456"] = 356,["457"] = 356,["458"] = 355,["459"] = 361,["460"] = 362,["461"] = 361,["462"] = 364,["463"] = 365,["464"] = 364,["465"] = 342,["466"] = 341,["467"] = 342,["469"] = 342,["470"] = 369,["471"] = 370,["472"] = 369,["473"] = 370,["474"] = 371,["475"] = 372,["478"] = 373,["479"] = 374,["480"] = 375,["483"] = 376,["486"] = 378,["487"] = 379,["488"] = 381,["489"] = 382,["490"] = 384,["491"] = 384,["492"] = 384,["493"] = 384,["494"] = 384,["495"] = 384,["496"] = 384,["497"] = 384,["498"] = 384,["499"] = 396,["501"] = 397,["502"] = 397,["504"] = 398,["505"] = 399,["506"] = 399,["507"] = 399,["508"] = 399,["509"] = 399,["510"] = 400,["514"] = 371,["515"] = 370,["516"] = 369,["517"] = 370,["519"] = 370,["520"] = 405,["521"] = 406,["522"] = 405,["523"] = 406,["524"] = 407,["525"] = 408,["526"] = 407,["527"] = 410,["528"] = 411,["529"] = 410,["530"] = 413,["531"] = 414,["532"] = 413,["533"] = 416,["534"] = 417,["535"] = 416,["536"] = 419,["537"] = 420,["538"] = 419,["539"] = 406,["540"] = 405,["541"] = 406,["543"] = 406});
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
if IsServer() then
    for ____, modName in ipairs(VOID_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
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
                goto __continue17
            end
            local id = enemy:entindex()
            if self.hitSet:has(id) then
                goto __continue17
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
        ::__continue17::
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
                goto __continue93
            end
            illu:AddNewModifier(caster, self, "modifier_kill", {duration = illuDur})
            FindClearSpaceForUnit(
                illu,
                target:GetAbsOrigin(),
                true
            )
            illu:MoveToTargetToAttack(target)
        end
        ::__continue93::
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
