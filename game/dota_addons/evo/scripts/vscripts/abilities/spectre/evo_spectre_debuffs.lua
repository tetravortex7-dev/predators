local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 20,["24"] = 21,["25"] = 20,["26"] = 21,["28"] = 21,["29"] = 22,["30"] = 20,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 26,["35"] = 27,["36"] = 26,["37"] = 29,["38"] = 30,["39"] = 29,["40"] = 32,["41"] = 33,["42"] = 32,["43"] = 35,["44"] = 36,["45"] = 37,["46"] = 38,["48"] = 40,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 43,["56"] = 46,["57"] = 47,["58"] = 47,["59"] = 47,["60"] = 47,["62"] = 35,["63"] = 50,["64"] = 51,["65"] = 50,["66"] = 53,["67"] = 54,["68"] = 53,["69"] = 56,["70"] = 57,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 56,["75"] = 21,["76"] = 20,["77"] = 21,["79"] = 21,["80"] = 61,["81"] = 62,["82"] = 61,["83"] = 62,["85"] = 62,["86"] = 63,["87"] = 61,["88"] = 64,["89"] = 65,["90"] = 64,["91"] = 67,["92"] = 68,["93"] = 67,["94"] = 70,["95"] = 71,["96"] = 70,["97"] = 73,["98"] = 74,["99"] = 73,["100"] = 76,["101"] = 77,["102"] = 78,["103"] = 79,["104"] = 80,["105"] = 81,["106"] = 81,["109"] = 76,["110"] = 84,["111"] = 85,["112"] = 84,["113"] = 89,["114"] = 90,["115"] = 89,["116"] = 92,["117"] = 93,["118"] = 92,["119"] = 62,["120"] = 61,["121"] = 62,["123"] = 62,["124"] = 97,["125"] = 98,["126"] = 97,["127"] = 98,["129"] = 98,["130"] = 99,["131"] = 97,["132"] = 100,["133"] = 101,["134"] = 100,["135"] = 103,["136"] = 104,["137"] = 103,["138"] = 106,["139"] = 107,["140"] = 106,["141"] = 109,["142"] = 110,["143"] = 109,["144"] = 112,["145"] = 113,["146"] = 114,["147"] = 115,["148"] = 116,["149"] = 117,["150"] = 117,["153"] = 112,["154"] = 120,["155"] = 121,["156"] = 120,["157"] = 123,["158"] = 124,["159"] = 123,["160"] = 98,["161"] = 97,["162"] = 98,["164"] = 98,["165"] = 128,["166"] = 129,["167"] = 128,["168"] = 129,["170"] = 129,["171"] = 130,["172"] = 128,["173"] = 131,["174"] = 132,["175"] = 131,["176"] = 134,["177"] = 135,["178"] = 134,["179"] = 137,["180"] = 138,["181"] = 137,["182"] = 140,["183"] = 141,["184"] = 140,["185"] = 143,["186"] = 144,["187"] = 145,["188"] = 146,["189"] = 147,["190"] = 148,["191"] = 148,["194"] = 143,["195"] = 151,["196"] = 152,["197"] = 151,["198"] = 154,["199"] = 155,["200"] = 154,["201"] = 157,["202"] = 158,["203"] = 157,["204"] = 129,["205"] = 128,["206"] = 129,["208"] = 129,["209"] = 162,["210"] = 163,["211"] = 162,["212"] = 163,["214"] = 163,["215"] = 164,["216"] = 162,["217"] = 165,["218"] = 166,["219"] = 165,["220"] = 168,["221"] = 169,["222"] = 168,["223"] = 171,["224"] = 172,["225"] = 171,["226"] = 174,["227"] = 175,["228"] = 174,["229"] = 177,["230"] = 178,["231"] = 179,["232"] = 180,["233"] = 181,["234"] = 182,["235"] = 182,["238"] = 177,["239"] = 185,["240"] = 186,["241"] = 185,["242"] = 188,["243"] = 189,["244"] = 188,["245"] = 163,["246"] = 162,["247"] = 163,["249"] = 163,["250"] = 193,["251"] = 194,["252"] = 193,["253"] = 194,["255"] = 194,["256"] = 195,["257"] = 193,["258"] = 196,["259"] = 197,["260"] = 196,["261"] = 199,["262"] = 200,["263"] = 199,["264"] = 202,["265"] = 203,["266"] = 202,["267"] = 205,["268"] = 206,["269"] = 205,["270"] = 208,["271"] = 209,["272"] = 210,["273"] = 211,["274"] = 212,["276"] = 208,["277"] = 215,["278"] = 216,["279"] = 215,["280"] = 218,["281"] = 219,["282"] = 218,["283"] = 221,["284"] = 222,["285"] = 221,["286"] = 194,["287"] = 193,["288"] = 194,["290"] = 194,["291"] = 226,["292"] = 227,["293"] = 226,["294"] = 227,["296"] = 227,["297"] = 228,["298"] = 226,["299"] = 229,["300"] = 230,["301"] = 229,["302"] = 232,["303"] = 233,["304"] = 232,["305"] = 235,["306"] = 236,["307"] = 235,["308"] = 238,["309"] = 239,["310"] = 238,["311"] = 241,["312"] = 242,["313"] = 243,["314"] = 244,["315"] = 245,["317"] = 247,["318"] = 248,["320"] = 241,["321"] = 251,["322"] = 252,["323"] = 251,["324"] = 254,["325"] = 255,["326"] = 254,["327"] = 257,["328"] = 258,["331"] = 259,["332"] = 260,["333"] = 261,["334"] = 262,["337"] = 265,["340"] = 266,["343"] = 267,["346"] = 268,["347"] = 269,["350"] = 270,["353"] = 271,["354"] = 272,["355"] = 272,["356"] = 272,["357"] = 272,["358"] = 273,["361"] = 274,["362"] = 274,["363"] = 274,["364"] = 274,["365"] = 274,["366"] = 274,["367"] = 274,["368"] = 274,["369"] = 257,["370"] = 227,["371"] = 226,["372"] = 227,["374"] = 227,["375"] = 285,["376"] = 286,["377"] = 285,["378"] = 286,["380"] = 286,["381"] = 287,["382"] = 285,["383"] = 288,["384"] = 289,["385"] = 288,["386"] = 291,["387"] = 292,["388"] = 291,["389"] = 294,["390"] = 295,["391"] = 294,["392"] = 297,["393"] = 298,["394"] = 297,["395"] = 300,["396"] = 301,["397"] = 302,["398"] = 303,["399"] = 304,["400"] = 305,["401"] = 305,["404"] = 300,["405"] = 308,["406"] = 309,["407"] = 308,["408"] = 311,["409"] = 312,["410"] = 311,["411"] = 314,["412"] = 315,["413"] = 314,["414"] = 286,["415"] = 285,["416"] = 286,["418"] = 286,["419"] = 319,["420"] = 320,["421"] = 319,["422"] = 320,["424"] = 320,["425"] = 321,["426"] = 319,["427"] = 322,["428"] = 323,["429"] = 322,["430"] = 325,["431"] = 326,["432"] = 325,["433"] = 328,["434"] = 329,["435"] = 328,["436"] = 331,["437"] = 332,["438"] = 331,["439"] = 334,["440"] = 335,["441"] = 336,["442"] = 337,["443"] = 338,["444"] = 339,["445"] = 339,["448"] = 334,["449"] = 342,["450"] = 343,["451"] = 342,["452"] = 345,["453"] = 346,["454"] = 345,["455"] = 348,["456"] = 349,["457"] = 348,["458"] = 320,["459"] = 319,["460"] = 320,["462"] = 320});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/spectre/evo_spectre_debuffs"
LinkLuaModifier("modifier_evo_spectre_armor_shred", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_reality_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_portal_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_bastion_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_bastion_break_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_polarity", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_mr_shred", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_inv_shred", SCRIPT_PATH, 0)
____exports.modifier_evo_spectre_armor_shred = __TS__Class()
local modifier_evo_spectre_armor_shred = ____exports.modifier_evo_spectre_armor_shred
modifier_evo_spectre_armor_shred.name = "modifier_evo_spectre_armor_shred"
__TS__ClassExtends(modifier_evo_spectre_armor_shred, BaseModifier)
function modifier_evo_spectre_armor_shred.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.shred = 4
end
function modifier_evo_spectre_armor_shred.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_armor_shred.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_armor_shred.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_armor_shred.prototype.GetTexture(self)
    return "evo_spectre_phantom_w"
end
function modifier_evo_spectre_armor_shred.prototype.OnCreated(self, params)
    self.shred = 4
    if params and params.shred ~= nil then
        self.shred = params.shred
    else
        local ab = self:GetAbility()
        if ab and not ab:IsNull() then
            local v = ab:GetSpecialValueFor("armor_shred")
            if v > 0 then
                self.shred = v
            end
        end
    end
    if IsServer() then
        self:SetStackCount(math.max(
            1,
            math.floor(self.shred + 0.5)
        ))
    end
end
function modifier_evo_spectre_armor_shred.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_spectre_armor_shred.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS")}
end
function modifier_evo_spectre_armor_shred.prototype.GetModifierPhysicalArmorBonus(self)
    return -math.max(
        1,
        self:GetStackCount()
    )
end
modifier_evo_spectre_armor_shred = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_armor_shred")},
    modifier_evo_spectre_armor_shred
)
____exports.modifier_evo_spectre_armor_shred = modifier_evo_spectre_armor_shred
____exports.modifier_evo_spectre_reality_ms = __TS__Class()
local modifier_evo_spectre_reality_ms = ____exports.modifier_evo_spectre_reality_ms
modifier_evo_spectre_reality_ms.name = "modifier_evo_spectre_reality_ms"
__TS__ClassExtends(modifier_evo_spectre_reality_ms, BaseModifier)
function modifier_evo_spectre_reality_ms.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 25
end
function modifier_evo_spectre_reality_ms.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_reality_ms.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_reality_ms.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_reality_ms.prototype.GetTexture(self)
    return "evo_spectre_phantom_d"
end
function modifier_evo_spectre_reality_ms.prototype.OnCreated(self)
    self.msPct = 25
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("ms_pct")
        if val > 0 then
            self.msPct = val
        end
    end
end
function modifier_evo_spectre_reality_ms.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_spectre_reality_ms.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_reality_ms.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.msPct
end
modifier_evo_spectre_reality_ms = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_reality_ms")},
    modifier_evo_spectre_reality_ms
)
____exports.modifier_evo_spectre_reality_ms = modifier_evo_spectre_reality_ms
____exports.modifier_evo_spectre_portal_slow = __TS__Class()
local modifier_evo_spectre_portal_slow = ____exports.modifier_evo_spectre_portal_slow
modifier_evo_spectre_portal_slow.name = "modifier_evo_spectre_portal_slow"
__TS__ClassExtends(modifier_evo_spectre_portal_slow, BaseModifier)
function modifier_evo_spectre_portal_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 15
end
function modifier_evo_spectre_portal_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_portal_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_portal_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_portal_slow.prototype.GetTexture(self)
    return "evo_spectre_phantom_e"
end
function modifier_evo_spectre_portal_slow.prototype.OnCreated(self)
    self.slowPct = 15
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("slow_pct")
        if val > 0 then
            self.slowPct = val
        end
    end
end
function modifier_evo_spectre_portal_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_portal_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.slowPct
end
modifier_evo_spectre_portal_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_portal_slow")},
    modifier_evo_spectre_portal_slow
)
____exports.modifier_evo_spectre_portal_slow = modifier_evo_spectre_portal_slow
____exports.modifier_evo_spectre_bastion_slow = __TS__Class()
local modifier_evo_spectre_bastion_slow = ____exports.modifier_evo_spectre_bastion_slow
modifier_evo_spectre_bastion_slow.name = "modifier_evo_spectre_bastion_slow"
__TS__ClassExtends(modifier_evo_spectre_bastion_slow, BaseModifier)
function modifier_evo_spectre_bastion_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 25
end
function modifier_evo_spectre_bastion_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_bastion_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_bastion_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_bastion_slow.prototype.GetTexture(self)
    return "abaddon_aphotic_shield"
end
function modifier_evo_spectre_bastion_slow.prototype.OnCreated(self)
    self.slowPct = 25
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("slow_pct")
        if val > 0 then
            self.slowPct = val
        end
    end
end
function modifier_evo_spectre_bastion_slow.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_bastion_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_bastion_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.slowPct
end
modifier_evo_spectre_bastion_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_bastion_slow")},
    modifier_evo_spectre_bastion_slow
)
____exports.modifier_evo_spectre_bastion_slow = modifier_evo_spectre_bastion_slow
____exports.modifier_evo_spectre_bastion_break_ms = __TS__Class()
local modifier_evo_spectre_bastion_break_ms = ____exports.modifier_evo_spectre_bastion_break_ms
modifier_evo_spectre_bastion_break_ms.name = "modifier_evo_spectre_bastion_break_ms"
__TS__ClassExtends(modifier_evo_spectre_bastion_break_ms, BaseModifier)
function modifier_evo_spectre_bastion_break_ms.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 25
end
function modifier_evo_spectre_bastion_break_ms.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_bastion_break_ms.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_bastion_break_ms.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_bastion_break_ms.prototype.GetTexture(self)
    return "abaddon_frostmourne"
end
function modifier_evo_spectre_bastion_break_ms.prototype.OnCreated(self)
    self.msPct = 25
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("break_ms_pct")
        if val > 0 then
            self.msPct = val
        end
    end
end
function modifier_evo_spectre_bastion_break_ms.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_bastion_break_ms.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.msPct
end
modifier_evo_spectre_bastion_break_ms = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_bastion_break_ms")},
    modifier_evo_spectre_bastion_break_ms
)
____exports.modifier_evo_spectre_bastion_break_ms = modifier_evo_spectre_bastion_break_ms
____exports.modifier_evo_spectre_mirror_q_slow = __TS__Class()
local modifier_evo_spectre_mirror_q_slow = ____exports.modifier_evo_spectre_mirror_q_slow
modifier_evo_spectre_mirror_q_slow.name = "modifier_evo_spectre_mirror_q_slow"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_slow, BaseModifier)
function modifier_evo_spectre_mirror_q_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 24
end
function modifier_evo_spectre_mirror_q_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_q_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_mirror_q_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_q_slow.prototype.GetTexture(self)
    return "void_spirit_aether_remnant"
end
function modifier_evo_spectre_mirror_q_slow.prototype.OnCreated(self)
    self.slowPct = 24
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.slowPct = ab:GetSpecialValueFor("slow_pct")
    end
end
function modifier_evo_spectre_mirror_q_slow.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_mirror_q_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_mirror_q_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.slowPct
end
modifier_evo_spectre_mirror_q_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_q_slow")},
    modifier_evo_spectre_mirror_q_slow
)
____exports.modifier_evo_spectre_mirror_q_slow = modifier_evo_spectre_mirror_q_slow
____exports.modifier_evo_spectre_mirror_polarity = __TS__Class()
local modifier_evo_spectre_mirror_polarity = ____exports.modifier_evo_spectre_mirror_polarity
modifier_evo_spectre_mirror_polarity.name = "modifier_evo_spectre_mirror_polarity"
__TS__ClassExtends(modifier_evo_spectre_mirror_polarity, BaseModifier)
function modifier_evo_spectre_mirror_polarity.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.pct = 25
end
function modifier_evo_spectre_mirror_polarity.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_polarity.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_mirror_polarity.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_polarity.prototype.GetTexture(self)
    return "void_spirit_aether_remnant"
end
function modifier_evo_spectre_mirror_polarity.prototype.OnCreated(self)
    self.pct = 25
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.pct = ab:GetSpecialValueFor("polarity_pct")
    end
    if IsServer() then
        self:SetStackCount(math.floor(self.pct + 0.5))
    end
end
function modifier_evo_spectre_mirror_polarity.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_mirror_polarity.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")}
end
function modifier_evo_spectre_mirror_polarity.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local markedAttacker = self:GetParent()
    local spectre = self:GetCaster()
    local ability = self:GetAbility()
    if not markedAttacker or markedAttacker:IsNull() or not spectre or spectre:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= markedAttacker then
        return
    end
    if event.damage_type ~= 1 then
        return
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return
    end
    local victim = event.unit
    if not victim or victim:IsNull() or victim == markedAttacker or victim == spectre then
        return
    end
    if victim:GetTeamNumber() ~= spectre:GetTeamNumber() or not victim:IsRealHero() then
        return
    end
    local raw = event.original_damage > 0 and event.original_damage or event.damage
    local reflected = raw * math.max(
        1,
        self:GetStackCount()
    ) / 100
    if reflected <= 0.5 or not markedAttacker:IsAlive() then
        return
    end
    ApplyDamage({
        victim = markedAttacker,
        attacker = spectre,
        ability = ability,
        damage = reflected,
        damage_type = 2,
        damage_flags = 16 + 1024
    })
end
modifier_evo_spectre_mirror_polarity = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_polarity")},
    modifier_evo_spectre_mirror_polarity
)
____exports.modifier_evo_spectre_mirror_polarity = modifier_evo_spectre_mirror_polarity
____exports.modifier_evo_spectre_mirror_mr_shred = __TS__Class()
local modifier_evo_spectre_mirror_mr_shred = ____exports.modifier_evo_spectre_mirror_mr_shred
modifier_evo_spectre_mirror_mr_shred.name = "modifier_evo_spectre_mirror_mr_shred"
__TS__ClassExtends(modifier_evo_spectre_mirror_mr_shred, BaseModifier)
function modifier_evo_spectre_mirror_mr_shred.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.shred = 15
end
function modifier_evo_spectre_mirror_mr_shred.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_mr_shred.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_mirror_mr_shred.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_mr_shred.prototype.GetTexture(self)
    return "void_spirit_aether_remnant"
end
function modifier_evo_spectre_mirror_mr_shred.prototype.OnCreated(self)
    self.shred = 15
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("mr_shred")
        if val > 0 then
            self.shred = val
        end
    end
end
function modifier_evo_spectre_mirror_mr_shred.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_mirror_mr_shred.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")}
end
function modifier_evo_spectre_mirror_mr_shred.prototype.GetModifierMagicalResistanceBonus(self)
    return -self.shred
end
modifier_evo_spectre_mirror_mr_shred = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_mr_shred")},
    modifier_evo_spectre_mirror_mr_shred
)
____exports.modifier_evo_spectre_mirror_mr_shred = modifier_evo_spectre_mirror_mr_shred
____exports.modifier_evo_spectre_mirror_inv_shred = __TS__Class()
local modifier_evo_spectre_mirror_inv_shred = ____exports.modifier_evo_spectre_mirror_inv_shred
modifier_evo_spectre_mirror_inv_shred.name = "modifier_evo_spectre_mirror_inv_shred"
__TS__ClassExtends(modifier_evo_spectre_mirror_inv_shred, BaseModifier)
function modifier_evo_spectre_mirror_inv_shred.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.shred = 12
end
function modifier_evo_spectre_mirror_inv_shred.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_inv_shred.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_mirror_inv_shred.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_inv_shred.prototype.GetTexture(self)
    return "spectre_dispersion"
end
function modifier_evo_spectre_mirror_inv_shred.prototype.OnCreated(self)
    self.shred = 12
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("mr_shred")
        if val > 0 then
            self.shred = val
        end
    end
end
function modifier_evo_spectre_mirror_inv_shred.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_mirror_inv_shred.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")}
end
function modifier_evo_spectre_mirror_inv_shred.prototype.GetModifierMagicalResistanceBonus(self)
    return -self.shred
end
modifier_evo_spectre_mirror_inv_shred = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_inv_shred")},
    modifier_evo_spectre_mirror_inv_shred
)
____exports.modifier_evo_spectre_mirror_inv_shred = modifier_evo_spectre_mirror_inv_shred
return ____exports
