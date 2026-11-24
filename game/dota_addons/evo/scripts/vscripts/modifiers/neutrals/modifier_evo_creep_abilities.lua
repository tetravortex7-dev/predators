local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 5,["25"] = 5,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 35,["41"] = 36,["42"] = 36,["44"] = 37,["45"] = 37,["47"] = 38,["48"] = 35,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 43,["54"] = 44,["55"] = 44,["57"] = 45,["58"] = 41,["59"] = 48,["60"] = 49,["61"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["65"] = 50,["66"] = 53,["67"] = 54,["68"] = 53,["69"] = 56,["70"] = 57,["71"] = 56,["72"] = 59,["73"] = 60,["74"] = 59,["75"] = 62,["76"] = 63,["77"] = 62,["78"] = 65,["79"] = 66,["82"] = 67,["83"] = 68,["86"] = 69,["87"] = 70,["90"] = 73,["91"] = 65,["92"] = 49,["93"] = 48,["94"] = 49,["96"] = 49,["97"] = 77,["98"] = 78,["99"] = 77,["100"] = 78,["101"] = 79,["102"] = 80,["103"] = 79,["104"] = 82,["105"] = 83,["106"] = 82,["107"] = 85,["108"] = 86,["109"] = 85,["110"] = 88,["111"] = 89,["112"] = 88,["113"] = 91,["114"] = 92,["115"] = 92,["116"] = 92,["117"] = 92,["118"] = 91,["119"] = 97,["120"] = 98,["121"] = 97,["122"] = 100,["123"] = 101,["124"] = 100,["125"] = 78,["126"] = 77,["127"] = 78,["129"] = 78,["130"] = 105,["131"] = 106,["132"] = 105,["133"] = 106,["134"] = 107,["135"] = 108,["136"] = 107,["137"] = 110,["138"] = 111,["139"] = 110,["140"] = 113,["141"] = 114,["142"] = 113,["143"] = 116,["144"] = 117,["145"] = 116,["146"] = 119,["147"] = 120,["148"] = 119,["149"] = 122,["150"] = 123,["153"] = 124,["154"] = 125,["157"] = 126,["158"] = 127,["161"] = 130,["162"] = 131,["163"] = 132,["164"] = 132,["165"] = 132,["166"] = 132,["168"] = 122,["169"] = 106,["170"] = 105,["171"] = 106,["173"] = 106,["174"] = 137,["175"] = 138,["176"] = 137,["177"] = 138,["178"] = 139,["179"] = 140,["180"] = 139,["181"] = 142,["182"] = 143,["183"] = 142,["184"] = 145,["185"] = 146,["186"] = 145,["187"] = 148,["188"] = 149,["189"] = 148,["190"] = 151,["191"] = 152,["194"] = 153,["195"] = 151,["196"] = 155,["197"] = 156,["200"] = 157,["201"] = 158,["202"] = 159,["205"] = 160,["206"] = 160,["207"] = 160,["208"] = 160,["209"] = 160,["210"] = 160,["211"] = 160,["212"] = 161,["213"] = 161,["214"] = 161,["215"] = 161,["216"] = 161,["217"] = 161,["218"] = 155,["219"] = 168,["220"] = 169,["221"] = 169,["222"] = 169,["223"] = 169,["224"] = 168,["225"] = 174,["226"] = 175,["227"] = 174,["228"] = 177,["229"] = 178,["230"] = 177,["231"] = 138,["232"] = 137,["233"] = 138,["235"] = 138,["236"] = 182,["237"] = 183,["238"] = 182,["239"] = 183,["240"] = 184,["241"] = 185,["242"] = 184,["243"] = 187,["244"] = 188,["245"] = 187,["246"] = 190,["247"] = 191,["248"] = 190,["249"] = 193,["250"] = 194,["251"] = 193,["252"] = 196,["253"] = 197,["254"] = 196,["255"] = 199,["256"] = 200,["259"] = 201,["260"] = 202,["263"] = 203,["264"] = 204,["267"] = 205,["268"] = 206,["269"] = 207,["270"] = 207,["271"] = 207,["272"] = 207,["274"] = 199,["275"] = 183,["276"] = 182,["277"] = 183,["279"] = 183,["280"] = 212,["281"] = 213,["282"] = 212,["283"] = 213,["284"] = 214,["285"] = 215,["286"] = 214,["287"] = 217,["288"] = 218,["289"] = 217,["290"] = 220,["291"] = 221,["292"] = 220,["293"] = 223,["294"] = 224,["295"] = 223,["296"] = 226,["297"] = 227,["298"] = 226,["299"] = 229,["300"] = 230,["301"] = 230,["302"] = 230,["303"] = 230,["304"] = 230,["305"] = 230,["306"] = 230,["307"] = 229,["308"] = 213,["309"] = 212,["310"] = 213,["312"] = 213,["313"] = 234,["314"] = 235,["315"] = 234,["316"] = 235,["317"] = 236,["318"] = 237,["319"] = 236,["320"] = 239,["321"] = 240,["322"] = 239,["323"] = 242,["324"] = 243,["325"] = 242,["326"] = 245,["327"] = 246,["328"] = 245,["329"] = 248,["330"] = 249,["331"] = 248,["332"] = 251,["333"] = 252,["336"] = 253,["337"] = 254,["340"] = 255,["341"] = 256,["344"] = 259,["345"] = 259,["346"] = 259,["347"] = 259,["348"] = 259,["349"] = 259,["350"] = 259,["351"] = 260,["352"] = 261,["353"] = 262,["356"] = 263,["357"] = 264,["358"] = 251,["359"] = 235,["360"] = 234,["361"] = 235,["363"] = 235,["364"] = 273,["365"] = 274,["366"] = 273,["367"] = 274,["368"] = 275,["369"] = 276,["370"] = 275,["371"] = 278,["372"] = 279,["373"] = 278,["374"] = 281,["375"] = 282,["376"] = 281,["377"] = 284,["378"] = 285,["379"] = 284,["380"] = 287,["381"] = 288,["382"] = 287,["383"] = 290,["384"] = 291,["385"] = 291,["387"] = 292,["388"] = 293,["389"] = 293,["390"] = 293,["391"] = 293,["392"] = 293,["393"] = 293,["394"] = 293,["396"] = 295,["397"] = 290,["398"] = 274,["399"] = 273,["400"] = 274,["402"] = 274,["403"] = 299,["404"] = 300,["405"] = 299,["406"] = 300,["407"] = 301,["408"] = 302,["409"] = 301,["410"] = 304,["411"] = 305,["412"] = 304,["413"] = 307,["414"] = 308,["415"] = 307,["416"] = 310,["417"] = 311,["418"] = 310,["419"] = 313,["420"] = 314,["421"] = 313,["422"] = 316,["423"] = 317,["426"] = 318,["427"] = 319,["430"] = 320,["431"] = 320,["432"] = 320,["433"] = 320,["434"] = 321,["435"] = 321,["436"] = 321,["437"] = 321,["438"] = 321,["439"] = 321,["440"] = 321,["441"] = 321,["442"] = 321,["443"] = 321,["444"] = 321,["445"] = 332,["447"] = 333,["448"] = 333,["450"] = 334,["454"] = 316,["455"] = 300,["456"] = 299,["457"] = 300,["459"] = 300,["460"] = 344,["461"] = 345,["462"] = 344,["463"] = 345,["465"] = 345,["466"] = 346,["467"] = 344,["468"] = 348,["469"] = 349,["470"] = 348,["471"] = 351,["472"] = 352,["473"] = 351,["474"] = 354,["475"] = 355,["476"] = 354,["477"] = 357,["478"] = 358,["479"] = 357,["480"] = 360,["481"] = 361,["484"] = 362,["485"] = 363,["486"] = 360,["487"] = 365,["488"] = 366,["491"] = 367,["492"] = 368,["495"] = 369,["498"] = 370,["499"] = 371,["502"] = 373,["503"] = 373,["504"] = 373,["505"] = 373,["506"] = 373,["507"] = 373,["508"] = 373,["509"] = 373,["510"] = 373,["511"] = 373,["512"] = 373,["513"] = 384,["516"] = 386,["517"] = 387,["518"] = 387,["519"] = 387,["520"] = 387,["521"] = 388,["522"] = 388,["523"] = 388,["524"] = 388,["525"] = 388,["526"] = 388,["527"] = 388,["528"] = 389,["530"] = 390,["531"] = 390,["533"] = 391,["534"] = 397,["535"] = 398,["536"] = 399,["541"] = 365,["542"] = 345,["543"] = 344,["544"] = 345,["546"] = 345,["547"] = 405,["548"] = 406,["549"] = 405,["550"] = 406,["551"] = 407,["552"] = 408,["553"] = 407,["554"] = 410,["555"] = 411,["556"] = 410,["557"] = 413,["558"] = 414,["559"] = 413,["560"] = 416,["561"] = 417,["562"] = 416,["563"] = 419,["564"] = 420,["565"] = 419,["566"] = 422,["567"] = 423,["568"] = 422,["569"] = 406,["570"] = 405,["571"] = 406,["573"] = 406});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerModifier = ____dota_ts_adapter.registerModifier
local ABILITY_SCRIPT_PATH = "modifiers/neutrals/modifier_evo_creep_abilities"
local ALL_ABILITY_MODS = {
    "modifier_evo_creep_ability_frost",
    "modifier_evo_creep_debuff_frost",
    "modifier_evo_creep_ability_venom",
    "modifier_evo_creep_debuff_venom",
    "modifier_evo_creep_ability_sunder",
    "modifier_evo_creep_debuff_sunder",
    "modifier_evo_creep_ability_manaburn",
    "modifier_evo_creep_ability_crit",
    "modifier_evo_creep_ability_explode",
    "modifier_evo_creep_ability_stomp",
    "modifier_evo_creep_debuff_stomp"
}
if IsServer() then
    for ____, modName in ipairs(ALL_ABILITY_MODS) do
        LinkLuaModifier(modName, ABILITY_SCRIPT_PATH, 0)
    end
end
____exports.EVO_CREEP_ABILITY_MODIFIERS = {
    "modifier_evo_creep_ability_frost",
    "modifier_evo_creep_ability_venom",
    "modifier_evo_creep_ability_sunder",
    "modifier_evo_creep_ability_manaburn",
    "modifier_evo_creep_ability_crit",
    "modifier_evo_creep_ability_explode",
    "modifier_evo_creep_ability_stomp"
}
local function clampTier(self, raw)
    if raw <= 1 then
        return 1
    end
    if raw >= 3 then
        return 3
    end
    return 2
end
local function pickByTier(self, tier, t1, t2, t3)
    local t = clampTier(nil, tier)
    if t == 1 then
        return t1
    end
    if t == 2 then
        return t2
    end
    return t3
end
____exports.modifier_evo_creep_ability_frost = __TS__Class()
local modifier_evo_creep_ability_frost = ____exports.modifier_evo_creep_ability_frost
modifier_evo_creep_ability_frost.name = "modifier_evo_creep_ability_frost"
__TS__ClassExtends(modifier_evo_creep_ability_frost, BaseModifier)
function modifier_evo_creep_ability_frost.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_frost.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_frost.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_frost.prototype.GetTexture(self)
    return "ghost_frost_attack"
end
function modifier_evo_creep_ability_frost.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_creep_ability_frost.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() or target:IsMagicImmune() then
        return
    end
    target:AddNewModifier(parent, nil, "modifier_evo_creep_debuff_frost", {duration = 2.5})
end
modifier_evo_creep_ability_frost = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_frost")},
    modifier_evo_creep_ability_frost
)
____exports.modifier_evo_creep_ability_frost = modifier_evo_creep_ability_frost
____exports.modifier_evo_creep_debuff_frost = __TS__Class()
local modifier_evo_creep_debuff_frost = ____exports.modifier_evo_creep_debuff_frost
modifier_evo_creep_debuff_frost.name = "modifier_evo_creep_debuff_frost"
__TS__ClassExtends(modifier_evo_creep_debuff_frost, BaseModifier)
function modifier_evo_creep_debuff_frost.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_debuff_frost.prototype.IsDebuff(self)
    return true
end
function modifier_evo_creep_debuff_frost.prototype.IsPurgable(self)
    return true
end
function modifier_evo_creep_debuff_frost.prototype.GetTexture(self)
    return "ghost_frost_attack"
end
function modifier_evo_creep_debuff_frost.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_creep_debuff_frost.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
function modifier_evo_creep_debuff_frost.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return -25
end
modifier_evo_creep_debuff_frost = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_debuff_frost")},
    modifier_evo_creep_debuff_frost
)
____exports.modifier_evo_creep_debuff_frost = modifier_evo_creep_debuff_frost
____exports.modifier_evo_creep_ability_venom = __TS__Class()
local modifier_evo_creep_ability_venom = ____exports.modifier_evo_creep_ability_venom
modifier_evo_creep_ability_venom.name = "modifier_evo_creep_ability_venom"
__TS__ClassExtends(modifier_evo_creep_ability_venom, BaseModifier)
function modifier_evo_creep_ability_venom.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_venom.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_venom.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_venom.prototype.GetTexture(self)
    return "gnoll_assassin_envenomed_weapon"
end
function modifier_evo_creep_ability_venom.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_creep_ability_venom.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() or target:IsMagicImmune() then
        return
    end
    local mod = target:AddNewModifier(parent, nil, "modifier_evo_creep_debuff_venom", {duration = 4})
    if mod ~= nil then
        mod:SetStackCount(clampTier(
            nil,
            self:GetStackCount()
        ))
    end
end
modifier_evo_creep_ability_venom = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_venom")},
    modifier_evo_creep_ability_venom
)
____exports.modifier_evo_creep_ability_venom = modifier_evo_creep_ability_venom
____exports.modifier_evo_creep_debuff_venom = __TS__Class()
local modifier_evo_creep_debuff_venom = ____exports.modifier_evo_creep_debuff_venom
modifier_evo_creep_debuff_venom.name = "modifier_evo_creep_debuff_venom"
__TS__ClassExtends(modifier_evo_creep_debuff_venom, BaseModifier)
function modifier_evo_creep_debuff_venom.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_debuff_venom.prototype.IsDebuff(self)
    return true
end
function modifier_evo_creep_debuff_venom.prototype.IsPurgable(self)
    return true
end
function modifier_evo_creep_debuff_venom.prototype.GetTexture(self)
    return "gnoll_assassin_envenomed_weapon"
end
function modifier_evo_creep_debuff_venom.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(1)
end
function modifier_evo_creep_debuff_venom.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    local dps = pickByTier(
        nil,
        self:GetStackCount(),
        12,
        24,
        42
    )
    ApplyDamage({
        victim = parent,
        attacker = caster and not caster:IsNull() and caster or parent,
        damage = dps,
        damage_type = 2
    })
end
function modifier_evo_creep_debuff_venom.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE")
    }
end
function modifier_evo_creep_debuff_venom.prototype.GetModifierHealAmplify_PercentageTarget(self)
    return -25
end
function modifier_evo_creep_debuff_venom.prototype.GetModifierHPRegenAmplify_Percentage(self)
    return -25
end
modifier_evo_creep_debuff_venom = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_debuff_venom")},
    modifier_evo_creep_debuff_venom
)
____exports.modifier_evo_creep_debuff_venom = modifier_evo_creep_debuff_venom
____exports.modifier_evo_creep_ability_sunder = __TS__Class()
local modifier_evo_creep_ability_sunder = ____exports.modifier_evo_creep_ability_sunder
modifier_evo_creep_ability_sunder.name = "modifier_evo_creep_ability_sunder"
__TS__ClassExtends(modifier_evo_creep_ability_sunder, BaseModifier)
function modifier_evo_creep_ability_sunder.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_sunder.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_sunder.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_sunder.prototype.GetTexture(self)
    return "item_desolator"
end
function modifier_evo_creep_ability_sunder.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_creep_ability_sunder.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    local mod = target:AddNewModifier(parent, nil, "modifier_evo_creep_debuff_sunder", {duration = 4})
    if mod ~= nil then
        mod:SetStackCount(clampTier(
            nil,
            self:GetStackCount()
        ))
    end
end
modifier_evo_creep_ability_sunder = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_sunder")},
    modifier_evo_creep_ability_sunder
)
____exports.modifier_evo_creep_ability_sunder = modifier_evo_creep_ability_sunder
____exports.modifier_evo_creep_debuff_sunder = __TS__Class()
local modifier_evo_creep_debuff_sunder = ____exports.modifier_evo_creep_debuff_sunder
modifier_evo_creep_debuff_sunder.name = "modifier_evo_creep_debuff_sunder"
__TS__ClassExtends(modifier_evo_creep_debuff_sunder, BaseModifier)
function modifier_evo_creep_debuff_sunder.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_debuff_sunder.prototype.IsDebuff(self)
    return true
end
function modifier_evo_creep_debuff_sunder.prototype.IsPurgable(self)
    return true
end
function modifier_evo_creep_debuff_sunder.prototype.GetTexture(self)
    return "item_desolator"
end
function modifier_evo_creep_debuff_sunder.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_creep_debuff_sunder.prototype.GetModifierPhysicalArmorBonus(self)
    return -pickByTier(
        nil,
        self:GetStackCount(),
        3,
        5,
        8
    )
end
modifier_evo_creep_debuff_sunder = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_debuff_sunder")},
    modifier_evo_creep_debuff_sunder
)
____exports.modifier_evo_creep_debuff_sunder = modifier_evo_creep_debuff_sunder
____exports.modifier_evo_creep_ability_manaburn = __TS__Class()
local modifier_evo_creep_ability_manaburn = ____exports.modifier_evo_creep_ability_manaburn
modifier_evo_creep_ability_manaburn.name = "modifier_evo_creep_ability_manaburn"
__TS__ClassExtends(modifier_evo_creep_ability_manaburn, BaseModifier)
function modifier_evo_creep_ability_manaburn.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_manaburn.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_manaburn.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_manaburn.prototype.GetTexture(self)
    return "necronomicon_warrior_mana_burn"
end
function modifier_evo_creep_ability_manaburn.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_creep_ability_manaburn.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() or target:IsMagicImmune() then
        return
    end
    local burn = pickByTier(
        nil,
        self:GetStackCount(),
        20,
        35,
        55
    )
    local available = target:GetMana()
    local actual = math.min(available, burn)
    if actual <= 0 then
        return
    end
    target:SetMana(math.max(0, available - actual))
    ApplyDamage({victim = target, attacker = parent, damage = actual, damage_type = 1})
end
modifier_evo_creep_ability_manaburn = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_manaburn")},
    modifier_evo_creep_ability_manaburn
)
____exports.modifier_evo_creep_ability_manaburn = modifier_evo_creep_ability_manaburn
____exports.modifier_evo_creep_ability_crit = __TS__Class()
local modifier_evo_creep_ability_crit = ____exports.modifier_evo_creep_ability_crit
modifier_evo_creep_ability_crit.name = "modifier_evo_creep_ability_crit"
__TS__ClassExtends(modifier_evo_creep_ability_crit, BaseModifier)
function modifier_evo_creep_ability_crit.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_crit.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_crit.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_crit.prototype.GetTexture(self)
    return "alpha_wolf_critical_strike"
end
function modifier_evo_creep_ability_crit.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE")}
end
function modifier_evo_creep_ability_crit.prototype.GetModifierPreAttack_CriticalStrike(self)
    if not IsServer() then
        return 0
    end
    if RandomInt(1, 100) <= 20 then
        return pickByTier(
            nil,
            self:GetStackCount(),
            160,
            180,
            200
        )
    end
    return 0
end
modifier_evo_creep_ability_crit = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_crit")},
    modifier_evo_creep_ability_crit
)
____exports.modifier_evo_creep_ability_crit = modifier_evo_creep_ability_crit
____exports.modifier_evo_creep_ability_explode = __TS__Class()
local modifier_evo_creep_ability_explode = ____exports.modifier_evo_creep_ability_explode
modifier_evo_creep_ability_explode.name = "modifier_evo_creep_ability_explode"
__TS__ClassExtends(modifier_evo_creep_ability_explode, BaseModifier)
function modifier_evo_creep_ability_explode.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_explode.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_explode.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_explode.prototype.GetTexture(self)
    return "techies_suicide"
end
function modifier_evo_creep_ability_explode.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")}
end
function modifier_evo_creep_ability_explode.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.unit ~= parent then
        return
    end
    local damage = math.max(
        40,
        math.floor(parent:GetMaxHealth() * 0.1)
    )
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        275,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue91
            end
            ApplyDamage({victim = enemy, attacker = parent, damage = damage, damage_type = 2})
        end
        ::__continue91::
    end
end
modifier_evo_creep_ability_explode = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_explode")},
    modifier_evo_creep_ability_explode
)
____exports.modifier_evo_creep_ability_explode = modifier_evo_creep_ability_explode
____exports.modifier_evo_creep_ability_stomp = __TS__Class()
local modifier_evo_creep_ability_stomp = ____exports.modifier_evo_creep_ability_stomp
modifier_evo_creep_ability_stomp.name = "modifier_evo_creep_ability_stomp"
__TS__ClassExtends(modifier_evo_creep_ability_stomp, BaseModifier)
function modifier_evo_creep_ability_stomp.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.nextReadyTime = 0
end
function modifier_evo_creep_ability_stomp.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_ability_stomp.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_ability_stomp.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_ability_stomp.prototype.GetTexture(self)
    return "centaur_khan_war_stomp"
end
function modifier_evo_creep_ability_stomp.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.nextReadyTime = 0
    self:StartIntervalThink(1)
end
function modifier_evo_creep_ability_stomp.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if parent:IsStunned() or parent:IsSilenced() or parent:IsHexed() then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now < self.nextReadyTime then
        return
    end
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        275,
        2,
        1,
        0,
        0,
        false
    )
    if #enemies == 0 then
        return
    end
    self.nextReadyTime = now + 8
    local tier = clampTier(
        nil,
        self:GetStackCount()
    )
    local damage = pickByTier(
        nil,
        tier,
        65,
        130,
        240
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue106
            end
            ApplyDamage({victim = enemy, attacker = parent, damage = damage, damage_type = 2})
            enemy:AddNewModifier(parent, nil, "modifier_evo_creep_debuff_stomp", {duration = 2})
            if tier >= 3 then
                enemy:AddNewModifier(parent, nil, "modifier_stunned", {duration = 0.7})
            end
        end
        ::__continue106::
    end
end
modifier_evo_creep_ability_stomp = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_ability_stomp")},
    modifier_evo_creep_ability_stomp
)
____exports.modifier_evo_creep_ability_stomp = modifier_evo_creep_ability_stomp
____exports.modifier_evo_creep_debuff_stomp = __TS__Class()
local modifier_evo_creep_debuff_stomp = ____exports.modifier_evo_creep_debuff_stomp
modifier_evo_creep_debuff_stomp.name = "modifier_evo_creep_debuff_stomp"
__TS__ClassExtends(modifier_evo_creep_debuff_stomp, BaseModifier)
function modifier_evo_creep_debuff_stomp.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_debuff_stomp.prototype.IsDebuff(self)
    return true
end
function modifier_evo_creep_debuff_stomp.prototype.IsPurgable(self)
    return true
end
function modifier_evo_creep_debuff_stomp.prototype.GetTexture(self)
    return "centaur_khan_war_stomp"
end
function modifier_evo_creep_debuff_stomp.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_creep_debuff_stomp.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -35
end
modifier_evo_creep_debuff_stomp = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_debuff_stomp")},
    modifier_evo_creep_debuff_stomp
)
____exports.modifier_evo_creep_debuff_stomp = modifier_evo_creep_debuff_stomp
return ____exports
