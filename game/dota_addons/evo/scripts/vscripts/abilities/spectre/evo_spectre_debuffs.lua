local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 22,["26"] = 23,["27"] = 22,["28"] = 23,["30"] = 23,["31"] = 24,["32"] = 22,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 31,["40"] = 32,["41"] = 31,["42"] = 34,["43"] = 35,["44"] = 34,["45"] = 37,["46"] = 38,["47"] = 39,["48"] = 40,["49"] = 41,["51"] = 37,["52"] = 44,["53"] = 45,["54"] = 44,["55"] = 47,["56"] = 48,["57"] = 47,["58"] = 50,["59"] = 51,["60"] = 50,["61"] = 23,["62"] = 22,["63"] = 23,["65"] = 23,["66"] = 55,["67"] = 56,["68"] = 55,["69"] = 56,["71"] = 56,["72"] = 57,["73"] = 55,["74"] = 58,["75"] = 59,["76"] = 58,["77"] = 61,["78"] = 62,["79"] = 61,["80"] = 64,["81"] = 65,["82"] = 64,["83"] = 67,["84"] = 68,["85"] = 67,["86"] = 70,["87"] = 71,["88"] = 72,["89"] = 73,["90"] = 74,["92"] = 70,["93"] = 77,["94"] = 78,["95"] = 77,["96"] = 80,["97"] = 81,["98"] = 81,["99"] = 81,["100"] = 81,["101"] = 80,["102"] = 86,["103"] = 87,["104"] = 86,["105"] = 89,["106"] = 90,["107"] = 89,["108"] = 56,["109"] = 55,["110"] = 56,["112"] = 56,["113"] = 94,["114"] = 95,["115"] = 94,["116"] = 95,["118"] = 95,["119"] = 96,["120"] = 94,["121"] = 97,["122"] = 98,["123"] = 97,["124"] = 100,["125"] = 101,["126"] = 100,["127"] = 103,["128"] = 104,["129"] = 103,["130"] = 106,["131"] = 107,["132"] = 106,["133"] = 109,["134"] = 110,["135"] = 111,["136"] = 112,["138"] = 114,["139"] = 115,["140"] = 116,["141"] = 117,["142"] = 117,["146"] = 120,["147"] = 121,["148"] = 121,["149"] = 121,["150"] = 121,["152"] = 109,["153"] = 124,["154"] = 125,["155"] = 124,["156"] = 127,["157"] = 128,["158"] = 127,["159"] = 130,["160"] = 131,["161"] = 131,["162"] = 131,["163"] = 131,["164"] = 130,["165"] = 95,["166"] = 94,["167"] = 95,["169"] = 95,["170"] = 135,["171"] = 136,["172"] = 135,["173"] = 136,["175"] = 136,["176"] = 137,["177"] = 135,["178"] = 138,["179"] = 139,["180"] = 138,["181"] = 141,["182"] = 142,["183"] = 141,["184"] = 144,["185"] = 145,["186"] = 144,["187"] = 147,["188"] = 148,["189"] = 147,["190"] = 150,["191"] = 151,["192"] = 152,["193"] = 153,["194"] = 154,["195"] = 155,["196"] = 155,["199"] = 150,["200"] = 158,["201"] = 159,["202"] = 158,["203"] = 163,["204"] = 164,["205"] = 163,["206"] = 166,["207"] = 167,["208"] = 166,["209"] = 136,["210"] = 135,["211"] = 136,["213"] = 136,["214"] = 171,["215"] = 172,["216"] = 171,["217"] = 172,["219"] = 172,["220"] = 173,["221"] = 171,["222"] = 174,["223"] = 175,["224"] = 174,["225"] = 177,["226"] = 178,["227"] = 177,["228"] = 180,["229"] = 181,["230"] = 180,["231"] = 183,["232"] = 184,["233"] = 183,["234"] = 186,["235"] = 187,["236"] = 188,["237"] = 189,["238"] = 190,["239"] = 191,["240"] = 191,["243"] = 186,["244"] = 194,["245"] = 195,["246"] = 194,["247"] = 197,["248"] = 198,["249"] = 197,["250"] = 172,["251"] = 171,["252"] = 172,["254"] = 172,["255"] = 202,["256"] = 203,["257"] = 202,["258"] = 203,["260"] = 203,["261"] = 204,["262"] = 202,["263"] = 205,["264"] = 206,["265"] = 205,["266"] = 208,["267"] = 209,["268"] = 208,["269"] = 211,["270"] = 212,["271"] = 211,["272"] = 214,["273"] = 215,["274"] = 214,["275"] = 217,["276"] = 218,["277"] = 219,["278"] = 220,["279"] = 221,["280"] = 222,["281"] = 222,["284"] = 217,["285"] = 225,["286"] = 226,["287"] = 225,["288"] = 228,["289"] = 229,["290"] = 228,["291"] = 231,["292"] = 232,["293"] = 231,["294"] = 203,["295"] = 202,["296"] = 203,["298"] = 203,["299"] = 236,["300"] = 237,["301"] = 236,["302"] = 237,["304"] = 237,["305"] = 238,["306"] = 236,["307"] = 239,["308"] = 240,["309"] = 239,["310"] = 242,["311"] = 243,["312"] = 242,["313"] = 245,["314"] = 246,["315"] = 245,["316"] = 248,["317"] = 249,["318"] = 248,["319"] = 251,["320"] = 252,["321"] = 253,["322"] = 254,["323"] = 255,["324"] = 256,["325"] = 256,["328"] = 251,["329"] = 259,["330"] = 260,["331"] = 259,["332"] = 262,["333"] = 263,["334"] = 262,["335"] = 237,["336"] = 236,["337"] = 237,["339"] = 237,["340"] = 267,["341"] = 268,["342"] = 267,["343"] = 268,["345"] = 268,["346"] = 269,["347"] = 267,["348"] = 270,["349"] = 271,["350"] = 270,["351"] = 273,["352"] = 274,["353"] = 273,["354"] = 276,["355"] = 277,["356"] = 276,["357"] = 279,["358"] = 280,["359"] = 279,["360"] = 282,["361"] = 283,["362"] = 284,["363"] = 285,["364"] = 286,["366"] = 282,["367"] = 289,["368"] = 290,["369"] = 289,["370"] = 292,["371"] = 293,["372"] = 292,["373"] = 295,["374"] = 296,["375"] = 295,["376"] = 268,["377"] = 267,["378"] = 268,["380"] = 268,["381"] = 300,["382"] = 301,["383"] = 300,["384"] = 301,["386"] = 301,["387"] = 302,["388"] = 300,["389"] = 303,["390"] = 304,["391"] = 303,["392"] = 306,["393"] = 307,["394"] = 306,["395"] = 309,["396"] = 310,["397"] = 309,["398"] = 312,["399"] = 313,["400"] = 312,["401"] = 315,["402"] = 316,["403"] = 317,["404"] = 318,["405"] = 319,["407"] = 321,["408"] = 322,["410"] = 315,["411"] = 325,["412"] = 326,["413"] = 325,["414"] = 328,["415"] = 329,["416"] = 328,["417"] = 331,["418"] = 332,["421"] = 333,["422"] = 334,["423"] = 335,["424"] = 336,["427"] = 339,["430"] = 340,["433"] = 341,["436"] = 342,["437"] = 343,["440"] = 344,["443"] = 345,["444"] = 346,["445"] = 346,["446"] = 346,["447"] = 346,["448"] = 347,["451"] = 348,["452"] = 348,["453"] = 348,["454"] = 348,["455"] = 348,["456"] = 348,["457"] = 348,["458"] = 348,["459"] = 331,["460"] = 301,["461"] = 300,["462"] = 301,["464"] = 301,["465"] = 359,["466"] = 360,["467"] = 359,["468"] = 360,["470"] = 360,["471"] = 361,["472"] = 359,["473"] = 362,["474"] = 363,["475"] = 362,["476"] = 365,["477"] = 366,["478"] = 365,["479"] = 368,["480"] = 369,["481"] = 368,["482"] = 371,["483"] = 372,["484"] = 371,["485"] = 374,["486"] = 375,["487"] = 376,["488"] = 377,["489"] = 378,["490"] = 379,["491"] = 379,["494"] = 374,["495"] = 382,["496"] = 383,["497"] = 382,["498"] = 385,["499"] = 386,["500"] = 385,["501"] = 388,["502"] = 389,["503"] = 388,["504"] = 360,["505"] = 359,["506"] = 360,["508"] = 360,["509"] = 393,["510"] = 394,["511"] = 393,["512"] = 394,["514"] = 394,["515"] = 395,["516"] = 393,["517"] = 396,["518"] = 397,["519"] = 396,["520"] = 399,["521"] = 400,["522"] = 399,["523"] = 402,["524"] = 403,["525"] = 402,["526"] = 405,["527"] = 406,["528"] = 405,["529"] = 408,["530"] = 409,["531"] = 410,["532"] = 411,["533"] = 412,["534"] = 413,["535"] = 413,["538"] = 408,["539"] = 416,["540"] = 417,["541"] = 416,["542"] = 419,["543"] = 420,["544"] = 419,["545"] = 422,["546"] = 423,["547"] = 422,["548"] = 394,["549"] = 393,["550"] = 394,["552"] = 394});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/spectre/evo_spectre_debuffs"
LinkLuaModifier("modifier_evo_spectre_dagger_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_shadow_path", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_armor_shred", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_reality_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_portal_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_bastion_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_bastion_break_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_polarity", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_mr_shred", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_inv_shred", SCRIPT_PATH, 0)
____exports.modifier_evo_spectre_dagger_slow = __TS__Class()
local modifier_evo_spectre_dagger_slow = ____exports.modifier_evo_spectre_dagger_slow
modifier_evo_spectre_dagger_slow.name = "modifier_evo_spectre_dagger_slow"
__TS__ClassExtends(modifier_evo_spectre_dagger_slow, BaseModifier)
function modifier_evo_spectre_dagger_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slowPct = 20
end
function modifier_evo_spectre_dagger_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_dagger_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_dagger_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_dagger_slow.prototype.GetTexture(self)
    return "spectre_spectral_dagger"
end
function modifier_evo_spectre_dagger_slow.prototype.OnCreated(self)
    self.slowPct = 20
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.slowPct = ab:GetSpecialValueFor("slow_pct")
    end
end
function modifier_evo_spectre_dagger_slow.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_dagger_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_dagger_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.slowPct
end
modifier_evo_spectre_dagger_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_dagger_slow")},
    modifier_evo_spectre_dagger_slow
)
____exports.modifier_evo_spectre_dagger_slow = modifier_evo_spectre_dagger_slow
____exports.modifier_evo_spectre_shadow_path = __TS__Class()
local modifier_evo_spectre_shadow_path = ____exports.modifier_evo_spectre_shadow_path
modifier_evo_spectre_shadow_path.name = "modifier_evo_spectre_shadow_path"
__TS__ClassExtends(modifier_evo_spectre_shadow_path, BaseModifier)
function modifier_evo_spectre_shadow_path.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 16
end
function modifier_evo_spectre_shadow_path.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_shadow_path.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_shadow_path.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_shadow_path.prototype.GetTexture(self)
    return "spectre_spectral_dagger"
end
function modifier_evo_spectre_shadow_path.prototype.OnCreated(self)
    self.msPct = 16
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.msPct = ab:GetSpecialValueFor("path_ms_pct")
    end
end
function modifier_evo_spectre_shadow_path.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_shadow_path.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true
    }
end
function modifier_evo_spectre_shadow_path.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_shadow_path.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.msPct
end
modifier_evo_spectre_shadow_path = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_shadow_path")},
    modifier_evo_spectre_shadow_path
)
____exports.modifier_evo_spectre_shadow_path = modifier_evo_spectre_shadow_path
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
    return "spectre_desolate"
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
    return "spectre_reality"
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
    return "spectre_haunt"
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
