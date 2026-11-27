local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 8,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 17,["21"] = 18,["22"] = 17,["23"] = 18,["25"] = 18,["26"] = 19,["27"] = 17,["28"] = 20,["29"] = 21,["30"] = 20,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 26,["35"] = 27,["36"] = 26,["37"] = 29,["38"] = 30,["39"] = 29,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 35,["45"] = 37,["46"] = 38,["47"] = 39,["48"] = 40,["49"] = 40,["53"] = 43,["54"] = 44,["55"] = 44,["56"] = 44,["57"] = 44,["59"] = 32,["60"] = 47,["61"] = 48,["62"] = 47,["63"] = 50,["64"] = 51,["65"] = 50,["66"] = 53,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 53,["72"] = 18,["73"] = 17,["74"] = 18,["76"] = 18,["77"] = 58,["78"] = 59,["79"] = 58,["80"] = 59,["82"] = 59,["83"] = 60,["84"] = 58,["85"] = 61,["86"] = 62,["87"] = 61,["88"] = 64,["89"] = 65,["90"] = 64,["91"] = 67,["92"] = 68,["93"] = 67,["94"] = 70,["95"] = 71,["96"] = 70,["97"] = 73,["98"] = 74,["99"] = 75,["100"] = 76,["101"] = 77,["102"] = 78,["103"] = 78,["106"] = 73,["107"] = 81,["108"] = 82,["109"] = 81,["110"] = 86,["111"] = 87,["112"] = 86,["113"] = 89,["114"] = 90,["115"] = 89,["116"] = 59,["117"] = 58,["118"] = 59,["120"] = 59,["121"] = 94,["122"] = 95,["123"] = 94,["124"] = 95,["126"] = 95,["127"] = 96,["128"] = 94,["129"] = 97,["130"] = 98,["131"] = 97,["132"] = 100,["133"] = 101,["134"] = 100,["135"] = 103,["136"] = 104,["137"] = 103,["138"] = 106,["139"] = 107,["140"] = 106,["141"] = 109,["142"] = 110,["143"] = 111,["144"] = 112,["145"] = 113,["146"] = 114,["147"] = 114,["150"] = 109,["151"] = 117,["152"] = 118,["153"] = 117,["154"] = 120,["155"] = 121,["156"] = 120,["157"] = 95,["158"] = 94,["159"] = 95,["161"] = 95,["162"] = 125,["163"] = 126,["164"] = 125,["165"] = 126,["167"] = 126,["168"] = 127,["169"] = 125,["170"] = 128,["171"] = 129,["172"] = 128,["173"] = 131,["174"] = 132,["175"] = 131,["176"] = 134,["177"] = 135,["178"] = 134,["179"] = 137,["180"] = 138,["181"] = 137,["182"] = 140,["183"] = 141,["184"] = 142,["185"] = 143,["186"] = 144,["187"] = 145,["188"] = 145,["191"] = 140,["192"] = 148,["193"] = 149,["194"] = 148,["195"] = 151,["196"] = 152,["197"] = 151,["198"] = 154,["199"] = 155,["200"] = 154,["201"] = 126,["202"] = 125,["203"] = 126,["205"] = 126,["206"] = 159,["207"] = 160,["208"] = 159,["209"] = 160,["211"] = 160,["212"] = 161,["213"] = 159,["214"] = 162,["215"] = 163,["216"] = 162,["217"] = 165,["218"] = 166,["219"] = 165,["220"] = 168,["221"] = 169,["222"] = 168,["223"] = 171,["224"] = 172,["225"] = 171,["226"] = 174,["227"] = 175,["228"] = 176,["229"] = 177,["230"] = 178,["231"] = 179,["232"] = 179,["235"] = 174,["236"] = 182,["237"] = 183,["238"] = 182,["239"] = 185,["240"] = 186,["241"] = 185,["242"] = 160,["243"] = 159,["244"] = 160,["246"] = 160,["247"] = 190,["248"] = 191,["249"] = 190,["250"] = 191,["252"] = 191,["253"] = 192,["254"] = 190,["255"] = 193,["256"] = 194,["257"] = 193,["258"] = 196,["259"] = 197,["260"] = 196,["261"] = 199,["262"] = 200,["263"] = 199,["264"] = 202,["265"] = 203,["266"] = 202,["267"] = 205,["268"] = 206,["269"] = 207,["270"] = 208,["271"] = 209,["272"] = 210,["273"] = 210,["276"] = 205,["277"] = 213,["278"] = 214,["279"] = 213,["280"] = 216,["281"] = 217,["282"] = 216,["283"] = 219,["284"] = 220,["285"] = 219,["286"] = 191,["287"] = 190,["288"] = 191,["290"] = 191});
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
    return "evo_spectre_bastion_q"
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
    return "evo_spectre_bastion_e"
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
    self.slowPct = 14
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
    return "evo_spectre_mirror_q"
end
function modifier_evo_spectre_mirror_q_slow.prototype.OnCreated(self)
    self.slowPct = 14
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local val = ab:GetSpecialValueFor("bonus_movespeed")
        if val > 0 then
            self.slowPct = val
        end
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
return ____exports
