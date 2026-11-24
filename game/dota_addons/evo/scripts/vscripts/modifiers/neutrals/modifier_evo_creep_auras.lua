local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 5,["28"] = 5,["29"] = 22,["30"] = 23,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 36,["42"] = 37,["43"] = 37,["45"] = 38,["46"] = 38,["48"] = 39,["49"] = 36,["50"] = 42,["51"] = 43,["52"] = 44,["53"] = 44,["55"] = 45,["56"] = 45,["58"] = 46,["59"] = 42,["60"] = 49,["61"] = 50,["64"] = 51,["65"] = 52,["66"] = 53,["69"] = 56,["70"] = 57,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 49,["75"] = 60,["76"] = 60,["77"] = 60,["78"] = 61,["79"] = 62,["80"] = 61,["81"] = 64,["82"] = 65,["83"] = 64,["84"] = 67,["85"] = 68,["86"] = 67,["87"] = 70,["88"] = 71,["89"] = 70,["90"] = 73,["91"] = 74,["92"] = 73,["93"] = 76,["94"] = 77,["95"] = 76,["96"] = 79,["97"] = 80,["98"] = 79,["99"] = 84,["100"] = 85,["101"] = 84,["102"] = 85,["103"] = 86,["104"] = 87,["105"] = 86,["106"] = 85,["107"] = 84,["108"] = 85,["110"] = 85,["111"] = 91,["112"] = 92,["113"] = 91,["114"] = 92,["115"] = 93,["116"] = 94,["117"] = 93,["118"] = 96,["119"] = 97,["120"] = 96,["121"] = 99,["122"] = 100,["123"] = 99,["124"] = 102,["125"] = 103,["126"] = 102,["127"] = 105,["128"] = 106,["129"] = 105,["130"] = 108,["131"] = 109,["132"] = 108,["133"] = 111,["134"] = 112,["135"] = 111,["136"] = 114,["137"] = 115,["138"] = 115,["139"] = 115,["140"] = 115,["141"] = 115,["142"] = 115,["143"] = 115,["144"] = 114,["145"] = 92,["146"] = 91,["147"] = 92,["149"] = 92,["150"] = 119,["151"] = 120,["152"] = 119,["153"] = 120,["154"] = 121,["155"] = 122,["156"] = 121,["157"] = 120,["158"] = 119,["159"] = 120,["161"] = 120,["162"] = 126,["163"] = 127,["164"] = 126,["165"] = 127,["166"] = 128,["167"] = 129,["168"] = 128,["169"] = 131,["170"] = 132,["171"] = 131,["172"] = 134,["173"] = 135,["174"] = 134,["175"] = 137,["176"] = 138,["177"] = 137,["178"] = 140,["179"] = 141,["180"] = 140,["181"] = 143,["182"] = 144,["183"] = 143,["184"] = 146,["185"] = 147,["186"] = 146,["187"] = 149,["188"] = 150,["189"] = 150,["190"] = 150,["191"] = 150,["192"] = 150,["193"] = 150,["194"] = 150,["195"] = 149,["196"] = 127,["197"] = 126,["198"] = 127,["200"] = 127,["201"] = 154,["202"] = 155,["203"] = 154,["204"] = 155,["205"] = 156,["206"] = 157,["207"] = 156,["208"] = 155,["209"] = 154,["210"] = 155,["212"] = 155,["213"] = 161,["214"] = 162,["215"] = 161,["216"] = 162,["217"] = 163,["218"] = 164,["219"] = 163,["220"] = 166,["221"] = 167,["222"] = 166,["223"] = 169,["224"] = 170,["225"] = 169,["226"] = 172,["227"] = 173,["228"] = 172,["229"] = 175,["230"] = 176,["231"] = 175,["232"] = 178,["233"] = 179,["234"] = 178,["235"] = 181,["236"] = 182,["237"] = 181,["238"] = 184,["239"] = 185,["240"] = 185,["241"] = 185,["242"] = 185,["243"] = 185,["244"] = 185,["245"] = 185,["246"] = 184,["247"] = 162,["248"] = 161,["249"] = 162,["251"] = 162,["252"] = 189,["253"] = 190,["254"] = 189,["255"] = 190,["256"] = 191,["257"] = 192,["258"] = 191,["259"] = 190,["260"] = 189,["261"] = 190,["263"] = 190,["264"] = 196,["265"] = 197,["266"] = 196,["267"] = 197,["268"] = 198,["269"] = 199,["270"] = 198,["271"] = 201,["272"] = 202,["273"] = 201,["274"] = 204,["275"] = 205,["276"] = 204,["277"] = 207,["278"] = 208,["279"] = 207,["280"] = 210,["281"] = 211,["282"] = 210,["283"] = 213,["284"] = 214,["285"] = 213,["286"] = 216,["287"] = 217,["288"] = 216,["289"] = 219,["290"] = 220,["293"] = 221,["294"] = 222,["297"] = 223,["300"] = 224,["303"] = 225,["304"] = 225,["305"] = 225,["306"] = 225,["307"] = 225,["308"] = 225,["309"] = 225,["310"] = 226,["311"] = 227,["314"] = 228,["315"] = 229,["316"] = 234,["317"] = 219,["318"] = 197,["319"] = 196,["320"] = 197,["322"] = 197,["323"] = 238,["324"] = 239,["325"] = 238,["326"] = 239,["327"] = 240,["328"] = 241,["329"] = 240,["330"] = 239,["331"] = 238,["332"] = 239,["334"] = 239,["335"] = 245,["336"] = 246,["337"] = 245,["338"] = 246,["339"] = 247,["340"] = 248,["341"] = 247,["342"] = 250,["343"] = 251,["344"] = 250,["345"] = 253,["346"] = 254,["347"] = 253,["348"] = 256,["349"] = 257,["350"] = 256,["351"] = 259,["352"] = 260,["353"] = 259,["354"] = 262,["355"] = 263,["356"] = 262,["357"] = 265,["358"] = 266,["359"] = 265,["360"] = 268,["361"] = 269,["362"] = 269,["363"] = 269,["364"] = 269,["365"] = 269,["366"] = 269,["367"] = 269,["368"] = 268,["369"] = 246,["370"] = 245,["371"] = 246,["373"] = 246,["374"] = 273,["375"] = 274,["376"] = 273,["377"] = 274,["378"] = 275,["379"] = 276,["380"] = 275,["381"] = 274,["382"] = 273,["383"] = 274,["385"] = 274,["386"] = 280,["387"] = 281,["388"] = 280,["389"] = 281,["390"] = 282,["391"] = 283,["392"] = 282,["393"] = 285,["394"] = 286,["395"] = 285,["396"] = 288,["397"] = 289,["398"] = 288,["399"] = 291,["400"] = 292,["401"] = 291,["402"] = 294,["403"] = 295,["404"] = 294,["405"] = 297,["406"] = 298,["407"] = 297,["408"] = 300,["409"] = 301,["410"] = 300,["411"] = 303,["412"] = 304,["415"] = 305,["416"] = 306,["419"] = 307,["422"] = 308,["423"] = 309,["426"] = 312,["429"] = 313,["432"] = 314,["433"] = 314,["434"] = 314,["435"] = 314,["436"] = 314,["437"] = 314,["438"] = 314,["439"] = 315,["440"] = 316,["443"] = 317,["444"] = 317,["445"] = 317,["446"] = 317,["447"] = 317,["448"] = 317,["449"] = 317,["450"] = 303,["451"] = 281,["452"] = 280,["453"] = 281,["455"] = 281,["456"] = 327,["457"] = 328,["458"] = 327,["459"] = 328,["460"] = 329,["461"] = 330,["462"] = 329,["463"] = 328,["464"] = 327,["465"] = 328,["467"] = 328,["468"] = 334,["469"] = 335,["470"] = 334,["471"] = 335,["472"] = 336,["473"] = 337,["474"] = 336,["475"] = 339,["476"] = 340,["477"] = 339,["478"] = 342,["479"] = 343,["480"] = 342,["481"] = 345,["482"] = 346,["483"] = 345,["484"] = 348,["485"] = 349,["486"] = 348,["487"] = 351,["488"] = 352,["489"] = 351,["490"] = 354,["491"] = 355,["492"] = 354,["493"] = 357,["494"] = 358,["495"] = 358,["496"] = 358,["497"] = 358,["498"] = 358,["499"] = 358,["500"] = 358,["501"] = 357,["502"] = 335,["503"] = 334,["504"] = 335,["506"] = 335});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerModifier = ____dota_ts_adapter.registerModifier
local AURA_SCRIPT_PATH = "modifiers/neutrals/modifier_evo_creep_auras"
local ALL_AURA_MODS = {
    "modifier_evo_creep_aura_frenzy_emitter",
    "modifier_evo_creep_aura_frenzy",
    "modifier_evo_creep_aura_carapace_emitter",
    "modifier_evo_creep_aura_carapace",
    "modifier_evo_creep_aura_vitality_emitter",
    "modifier_evo_creep_aura_vitality",
    "modifier_evo_creep_aura_vampiric_emitter",
    "modifier_evo_creep_aura_vampiric",
    "modifier_evo_creep_aura_haste_emitter",
    "modifier_evo_creep_aura_haste",
    "modifier_evo_creep_aura_thorns_emitter",
    "modifier_evo_creep_aura_thorns",
    "modifier_evo_creep_aura_ward_emitter",
    "modifier_evo_creep_aura_ward"
}
for ____, modName in ipairs(ALL_AURA_MODS) do
    LinkLuaModifier(modName, AURA_SCRIPT_PATH, 0)
end
____exports.EVO_CREEP_AURA_MODIFIERS = {
    "modifier_evo_creep_aura_frenzy_emitter",
    "modifier_evo_creep_aura_carapace_emitter",
    "modifier_evo_creep_aura_vitality_emitter",
    "modifier_evo_creep_aura_vampiric_emitter",
    "modifier_evo_creep_aura_haste_emitter",
    "modifier_evo_creep_aura_thorns_emitter",
    "modifier_evo_creep_aura_ward_emitter"
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
local function syncAuraTier(self, mod, emitterName)
    if not IsServer() then
        return
    end
    local caster = mod:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        mod:SetStackCount(1)
        return
    end
    local emitter = caster:FindModifierByName(emitterName)
    mod:SetStackCount(emitter and clampTier(
        nil,
        emitter:GetStackCount()
    ) or 1)
end
local BaseCreepAuraEmitter = __TS__Class()
BaseCreepAuraEmitter.name = "BaseCreepAuraEmitter"
__TS__ClassExtends(BaseCreepAuraEmitter, BaseModifier)
function BaseCreepAuraEmitter.prototype.IsHidden(self)
    return true
end
function BaseCreepAuraEmitter.prototype.IsPurgable(self)
    return false
end
function BaseCreepAuraEmitter.prototype.IsAura(self)
    return true
end
function BaseCreepAuraEmitter.prototype.GetAuraRadius(self)
    return 700
end
function BaseCreepAuraEmitter.prototype.GetAuraSearchTeam(self)
    return 1
end
function BaseCreepAuraEmitter.prototype.GetAuraSearchType(self)
    return 18 + 2
end
function BaseCreepAuraEmitter.prototype.GetAuraDuration(self)
    return 0.5
end
____exports.modifier_evo_creep_aura_frenzy_emitter = __TS__Class()
local modifier_evo_creep_aura_frenzy_emitter = ____exports.modifier_evo_creep_aura_frenzy_emitter
modifier_evo_creep_aura_frenzy_emitter.name = "modifier_evo_creep_aura_frenzy_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_frenzy_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_frenzy_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_frenzy"
end
modifier_evo_creep_aura_frenzy_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_frenzy_emitter")},
    modifier_evo_creep_aura_frenzy_emitter
)
____exports.modifier_evo_creep_aura_frenzy_emitter = modifier_evo_creep_aura_frenzy_emitter
____exports.modifier_evo_creep_aura_frenzy = __TS__Class()
local modifier_evo_creep_aura_frenzy = ____exports.modifier_evo_creep_aura_frenzy
modifier_evo_creep_aura_frenzy.name = "modifier_evo_creep_aura_frenzy"
__TS__ClassExtends(modifier_evo_creep_aura_frenzy, BaseModifier)
function modifier_evo_creep_aura_frenzy.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_frenzy.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_frenzy.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_frenzy.prototype.GetTexture(self)
    return "alpha_wolf_command_aura"
end
function modifier_evo_creep_aura_frenzy.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_frenzy_emitter")
end
function modifier_evo_creep_aura_frenzy.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_frenzy_emitter")
end
function modifier_evo_creep_aura_frenzy.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")}
end
function modifier_evo_creep_aura_frenzy.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return pickByTier(
        nil,
        self:GetStackCount(),
        20,
        35,
        55
    )
end
modifier_evo_creep_aura_frenzy = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_frenzy")},
    modifier_evo_creep_aura_frenzy
)
____exports.modifier_evo_creep_aura_frenzy = modifier_evo_creep_aura_frenzy
____exports.modifier_evo_creep_aura_carapace_emitter = __TS__Class()
local modifier_evo_creep_aura_carapace_emitter = ____exports.modifier_evo_creep_aura_carapace_emitter
modifier_evo_creep_aura_carapace_emitter.name = "modifier_evo_creep_aura_carapace_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_carapace_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_carapace_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_carapace"
end
modifier_evo_creep_aura_carapace_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_carapace_emitter")},
    modifier_evo_creep_aura_carapace_emitter
)
____exports.modifier_evo_creep_aura_carapace_emitter = modifier_evo_creep_aura_carapace_emitter
____exports.modifier_evo_creep_aura_carapace = __TS__Class()
local modifier_evo_creep_aura_carapace = ____exports.modifier_evo_creep_aura_carapace
modifier_evo_creep_aura_carapace.name = "modifier_evo_creep_aura_carapace"
__TS__ClassExtends(modifier_evo_creep_aura_carapace, BaseModifier)
function modifier_evo_creep_aura_carapace.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_carapace.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_carapace.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_carapace.prototype.GetTexture(self)
    return "enraged_wildkin_toughness_aura"
end
function modifier_evo_creep_aura_carapace.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_carapace_emitter")
end
function modifier_evo_creep_aura_carapace.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_carapace_emitter")
end
function modifier_evo_creep_aura_carapace.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_creep_aura_carapace.prototype.GetModifierPhysicalArmorBonus(self)
    return pickByTier(
        nil,
        self:GetStackCount(),
        3,
        5,
        9
    )
end
modifier_evo_creep_aura_carapace = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_carapace")},
    modifier_evo_creep_aura_carapace
)
____exports.modifier_evo_creep_aura_carapace = modifier_evo_creep_aura_carapace
____exports.modifier_evo_creep_aura_vitality_emitter = __TS__Class()
local modifier_evo_creep_aura_vitality_emitter = ____exports.modifier_evo_creep_aura_vitality_emitter
modifier_evo_creep_aura_vitality_emitter.name = "modifier_evo_creep_aura_vitality_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_vitality_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_vitality_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_vitality"
end
modifier_evo_creep_aura_vitality_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_vitality_emitter")},
    modifier_evo_creep_aura_vitality_emitter
)
____exports.modifier_evo_creep_aura_vitality_emitter = modifier_evo_creep_aura_vitality_emitter
____exports.modifier_evo_creep_aura_vitality = __TS__Class()
local modifier_evo_creep_aura_vitality = ____exports.modifier_evo_creep_aura_vitality
modifier_evo_creep_aura_vitality.name = "modifier_evo_creep_aura_vitality"
__TS__ClassExtends(modifier_evo_creep_aura_vitality, BaseModifier)
function modifier_evo_creep_aura_vitality.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_vitality.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_vitality.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_vitality.prototype.GetTexture(self)
    return "satyr_hellcaller_unholy_aura"
end
function modifier_evo_creep_aura_vitality.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_vitality_emitter")
end
function modifier_evo_creep_aura_vitality.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_vitality_emitter")
end
function modifier_evo_creep_aura_vitality.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE")}
end
function modifier_evo_creep_aura_vitality.prototype.GetModifierHealthRegenPercentage(self)
    return pickByTier(
        nil,
        self:GetStackCount(),
        1.2,
        2,
        3
    )
end
modifier_evo_creep_aura_vitality = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_vitality")},
    modifier_evo_creep_aura_vitality
)
____exports.modifier_evo_creep_aura_vitality = modifier_evo_creep_aura_vitality
____exports.modifier_evo_creep_aura_vampiric_emitter = __TS__Class()
local modifier_evo_creep_aura_vampiric_emitter = ____exports.modifier_evo_creep_aura_vampiric_emitter
modifier_evo_creep_aura_vampiric_emitter.name = "modifier_evo_creep_aura_vampiric_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_vampiric_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_vampiric_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_vampiric"
end
modifier_evo_creep_aura_vampiric_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_vampiric_emitter")},
    modifier_evo_creep_aura_vampiric_emitter
)
____exports.modifier_evo_creep_aura_vampiric_emitter = modifier_evo_creep_aura_vampiric_emitter
____exports.modifier_evo_creep_aura_vampiric = __TS__Class()
local modifier_evo_creep_aura_vampiric = ____exports.modifier_evo_creep_aura_vampiric
modifier_evo_creep_aura_vampiric.name = "modifier_evo_creep_aura_vampiric"
__TS__ClassExtends(modifier_evo_creep_aura_vampiric, BaseModifier)
function modifier_evo_creep_aura_vampiric.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_vampiric.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_vampiric.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_vampiric.prototype.GetTexture(self)
    return "skeleton_king_vampiric_aura"
end
function modifier_evo_creep_aura_vampiric.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_vampiric_emitter")
end
function modifier_evo_creep_aura_vampiric.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_vampiric_emitter")
end
function modifier_evo_creep_aura_vampiric.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")}
end
function modifier_evo_creep_aura_vampiric.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if not event.target or event.target:IsNull() or event.target:IsBuilding() then
        return
    end
    local pct = pickByTier(
        nil,
        self:GetStackCount(),
        0.12,
        0.2,
        0.28
    )
    local heal = event.damage * pct
    if heal <= 0 then
        return
    end
    parent:Heal(heal, nil)
    local pfx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", 1, parent)
    ParticleManager:ReleaseParticleIndex(pfx)
end
modifier_evo_creep_aura_vampiric = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_vampiric")},
    modifier_evo_creep_aura_vampiric
)
____exports.modifier_evo_creep_aura_vampiric = modifier_evo_creep_aura_vampiric
____exports.modifier_evo_creep_aura_haste_emitter = __TS__Class()
local modifier_evo_creep_aura_haste_emitter = ____exports.modifier_evo_creep_aura_haste_emitter
modifier_evo_creep_aura_haste_emitter.name = "modifier_evo_creep_aura_haste_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_haste_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_haste_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_haste"
end
modifier_evo_creep_aura_haste_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_haste_emitter")},
    modifier_evo_creep_aura_haste_emitter
)
____exports.modifier_evo_creep_aura_haste_emitter = modifier_evo_creep_aura_haste_emitter
____exports.modifier_evo_creep_aura_haste = __TS__Class()
local modifier_evo_creep_aura_haste = ____exports.modifier_evo_creep_aura_haste
modifier_evo_creep_aura_haste.name = "modifier_evo_creep_aura_haste"
__TS__ClassExtends(modifier_evo_creep_aura_haste, BaseModifier)
function modifier_evo_creep_aura_haste.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_haste.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_haste.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_haste.prototype.GetTexture(self)
    return "kobold_taskmaster_speed_aura"
end
function modifier_evo_creep_aura_haste.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_haste_emitter")
end
function modifier_evo_creep_aura_haste.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_haste_emitter")
end
function modifier_evo_creep_aura_haste.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_creep_aura_haste.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return pickByTier(
        nil,
        self:GetStackCount(),
        12,
        16,
        20
    )
end
modifier_evo_creep_aura_haste = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_haste")},
    modifier_evo_creep_aura_haste
)
____exports.modifier_evo_creep_aura_haste = modifier_evo_creep_aura_haste
____exports.modifier_evo_creep_aura_thorns_emitter = __TS__Class()
local modifier_evo_creep_aura_thorns_emitter = ____exports.modifier_evo_creep_aura_thorns_emitter
modifier_evo_creep_aura_thorns_emitter.name = "modifier_evo_creep_aura_thorns_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_thorns_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_thorns_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_thorns"
end
modifier_evo_creep_aura_thorns_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_thorns_emitter")},
    modifier_evo_creep_aura_thorns_emitter
)
____exports.modifier_evo_creep_aura_thorns_emitter = modifier_evo_creep_aura_thorns_emitter
____exports.modifier_evo_creep_aura_thorns = __TS__Class()
local modifier_evo_creep_aura_thorns = ____exports.modifier_evo_creep_aura_thorns
modifier_evo_creep_aura_thorns.name = "modifier_evo_creep_aura_thorns"
__TS__ClassExtends(modifier_evo_creep_aura_thorns, BaseModifier)
function modifier_evo_creep_aura_thorns.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_thorns.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_thorns.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_thorns.prototype.GetTexture(self)
    return "centaur_return"
end
function modifier_evo_creep_aura_thorns.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_thorns_emitter")
end
function modifier_evo_creep_aura_thorns.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_thorns_emitter")
end
function modifier_evo_creep_aura_thorns.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")}
end
function modifier_evo_creep_aura_thorns.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    if event.unit ~= parent then
        return
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or attacker == parent or not attacker:IsAlive() then
        return
    end
    if event.damage_type ~= 1 then
        return
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return
    end
    local pct = pickByTier(
        nil,
        self:GetStackCount(),
        0.1,
        0.14,
        0.2
    )
    local reflected = event.original_damage * pct
    if reflected <= 1 then
        return
    end
    ApplyDamage({
        victim = attacker,
        attacker = parent,
        damage = reflected,
        damage_type = 1,
        damage_flags = 16 + 1024
    })
end
modifier_evo_creep_aura_thorns = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_thorns")},
    modifier_evo_creep_aura_thorns
)
____exports.modifier_evo_creep_aura_thorns = modifier_evo_creep_aura_thorns
____exports.modifier_evo_creep_aura_ward_emitter = __TS__Class()
local modifier_evo_creep_aura_ward_emitter = ____exports.modifier_evo_creep_aura_ward_emitter
modifier_evo_creep_aura_ward_emitter.name = "modifier_evo_creep_aura_ward_emitter"
__TS__ClassExtends(modifier_evo_creep_aura_ward_emitter, BaseCreepAuraEmitter)
function modifier_evo_creep_aura_ward_emitter.prototype.GetModifierAura(self)
    return "modifier_evo_creep_aura_ward"
end
modifier_evo_creep_aura_ward_emitter = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_ward_emitter")},
    modifier_evo_creep_aura_ward_emitter
)
____exports.modifier_evo_creep_aura_ward_emitter = modifier_evo_creep_aura_ward_emitter
____exports.modifier_evo_creep_aura_ward = __TS__Class()
local modifier_evo_creep_aura_ward = ____exports.modifier_evo_creep_aura_ward
modifier_evo_creep_aura_ward.name = "modifier_evo_creep_aura_ward"
__TS__ClassExtends(modifier_evo_creep_aura_ward, BaseModifier)
function modifier_evo_creep_aura_ward.prototype.IsHidden(self)
    return false
end
function modifier_evo_creep_aura_ward.prototype.IsDebuff(self)
    return false
end
function modifier_evo_creep_aura_ward.prototype.IsPurgable(self)
    return false
end
function modifier_evo_creep_aura_ward.prototype.GetTexture(self)
    return "centaur_khan_endurance_aura"
end
function modifier_evo_creep_aura_ward.prototype.OnCreated(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_ward_emitter")
end
function modifier_evo_creep_aura_ward.prototype.OnRefresh(self)
    syncAuraTier(nil, self, "modifier_evo_creep_aura_ward_emitter")
end
function modifier_evo_creep_aura_ward.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")}
end
function modifier_evo_creep_aura_ward.prototype.GetModifierMagicalResistanceBonus(self)
    return pickByTier(
        nil,
        self:GetStackCount(),
        15,
        24,
        32
    )
end
modifier_evo_creep_aura_ward = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_creep_aura_ward")},
    modifier_evo_creep_aura_ward
)
____exports.modifier_evo_creep_aura_ward = modifier_evo_creep_aura_ward
return ____exports
