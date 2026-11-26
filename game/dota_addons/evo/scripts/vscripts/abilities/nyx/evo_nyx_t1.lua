local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 8,["17"] = 8,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 20,["29"] = 22,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 27,["39"] = 26,["40"] = 27,["42"] = 27,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 34,["47"] = 34,["48"] = 33,["49"] = 34,["51"] = 34,["52"] = 36,["53"] = 37,["54"] = 36,["55"] = 37,["56"] = 37,["57"] = 36,["58"] = 37,["60"] = 37,["61"] = 39,["62"] = 40,["63"] = 39,["64"] = 40,["65"] = 40,["66"] = 39,["67"] = 40,["69"] = 40,["70"] = 42,["71"] = 43,["72"] = 42,["73"] = 43,["74"] = 43,["75"] = 42,["76"] = 43,["78"] = 43,["79"] = 45,["80"] = 46,["81"] = 45,["82"] = 46,["84"] = 46,["85"] = 47,["86"] = 48,["87"] = 50,["88"] = 51,["89"] = 52,["90"] = 53,["91"] = 45,["92"] = 55,["93"] = 56,["94"] = 55,["95"] = 58,["96"] = 59,["97"] = 58,["98"] = 61,["99"] = 62,["100"] = 61,["101"] = 64,["102"] = 65,["103"] = 64,["104"] = 67,["105"] = 68,["106"] = 67,["107"] = 70,["108"] = 71,["109"] = 72,["110"] = 73,["111"] = 74,["112"] = 75,["113"] = 76,["114"] = 77,["115"] = 78,["118"] = 79,["119"] = 80,["120"] = 81,["121"] = 70,["122"] = 83,["123"] = 84,["126"] = 85,["127"] = 86,["128"] = 87,["131"] = 90,["132"] = 91,["133"] = 93,["134"] = 94,["135"] = 95,["136"] = 96,["137"] = 97,["138"] = 98,["139"] = 99,["142"] = 102,["143"] = 103,["144"] = 104,["145"] = 105,["146"] = 106,["147"] = 107,["148"] = 108,["149"] = 109,["150"] = 110,["151"] = 111,["156"] = 116,["158"] = 118,["161"] = 121,["163"] = 83,["164"] = 124,["165"] = 125,["166"] = 125,["167"] = 125,["168"] = 125,["169"] = 125,["170"] = 125,["171"] = 125,["172"] = 125,["173"] = 125,["174"] = 125,["175"] = 125,["176"] = 125,["177"] = 125,["178"] = 125,["179"] = 125,["180"] = 124,["181"] = 141,["182"] = 142,["183"] = 143,["184"] = 143,["186"] = 144,["187"] = 141,["188"] = 146,["189"] = 147,["190"] = 148,["191"] = 148,["193"] = 149,["194"] = 146,["195"] = 151,["196"] = 152,["197"] = 153,["198"] = 153,["200"] = 154,["201"] = 155,["202"] = 156,["203"] = 157,["204"] = 158,["205"] = 159,["207"] = 161,["208"] = 151,["209"] = 163,["210"] = 164,["211"] = 164,["212"] = 164,["213"] = 164,["214"] = 165,["215"] = 165,["217"] = 166,["218"] = 163,["219"] = 168,["220"] = 169,["221"] = 169,["222"] = 169,["223"] = 169,["224"] = 170,["225"] = 170,["227"] = 171,["228"] = 168,["229"] = 173,["230"] = 174,["231"] = 174,["232"] = 174,["233"] = 174,["234"] = 175,["235"] = 175,["237"] = 176,["238"] = 173,["239"] = 178,["240"] = 179,["241"] = 179,["242"] = 179,["243"] = 179,["244"] = 180,["245"] = 180,["247"] = 181,["248"] = 178,["249"] = 183,["250"] = 184,["251"] = 184,["252"] = 184,["253"] = 184,["254"] = 185,["255"] = 185,["257"] = 186,["258"] = 183,["259"] = 188,["260"] = 189,["261"] = 189,["263"] = 190,["264"] = 191,["265"] = 192,["266"] = 192,["268"] = 193,["269"] = 193,["271"] = 194,["272"] = 194,["274"] = 195,["275"] = 195,["277"] = 196,["278"] = 197,["279"] = 197,["281"] = 198,["282"] = 199,["283"] = 199,["285"] = 200,["286"] = 200,["288"] = 202,["289"] = 203,["290"] = 204,["291"] = 205,["292"] = 206,["293"] = 208,["294"] = 209,["295"] = 214,["296"] = 216,["297"] = 216,["298"] = 216,["299"] = 216,["300"] = 216,["301"] = 216,["302"] = 217,["303"] = 218,["304"] = 218,["305"] = 218,["306"] = 218,["307"] = 218,["308"] = 218,["309"] = 218,["310"] = 218,["312"] = 227,["313"] = 188,["314"] = 229,["315"] = 230,["318"] = 231,["319"] = 232,["320"] = 233,["323"] = 234,["326"] = 235,["327"] = 236,["328"] = 237,["330"] = 229,["331"] = 240,["332"] = 241,["335"] = 242,["336"] = 243,["337"] = 244,["340"] = 245,["343"] = 246,["344"] = 247,["347"] = 250,["348"] = 251,["349"] = 252,["350"] = 253,["351"] = 254,["352"] = 254,["353"] = 254,["354"] = 254,["355"] = 254,["356"] = 254,["357"] = 254,["358"] = 254,["360"] = 263,["361"] = 264,["362"] = 264,["363"] = 264,["364"] = 264,["365"] = 264,["366"] = 264,["368"] = 240,["369"] = 267,["370"] = 268,["373"] = 269,["374"] = 270,["375"] = 271,["378"] = 272,["381"] = 273,["382"] = 274,["385"] = 275,["386"] = 276,["387"] = 278,["388"] = 279,["389"] = 280,["390"] = 281,["391"] = 282,["392"] = 283,["395"] = 286,["396"] = 287,["397"] = 288,["398"] = 288,["399"] = 288,["400"] = 288,["401"] = 288,["402"] = 288,["404"] = 290,["405"] = 291,["406"] = 292,["410"] = 267,["411"] = 297,["412"] = 298,["415"] = 299,["416"] = 300,["417"] = 301,["420"] = 302,["423"] = 303,["424"] = 304,["427"] = 307,["428"] = 308,["431"] = 310,["432"] = 311,["435"] = 312,["436"] = 315,["437"] = 320,["438"] = 321,["439"] = 322,["440"] = 323,["441"] = 324,["442"] = 325,["444"] = 327,["445"] = 327,["446"] = 327,["447"] = 327,["448"] = 327,["449"] = 327,["450"] = 327,["452"] = 330,["453"] = 331,["454"] = 332,["456"] = 297,["457"] = 335,["458"] = 341,["459"] = 342,["460"] = 343,["461"] = 344,["462"] = 345,["463"] = 347,["464"] = 348,["465"] = 353,["466"] = 354,["467"] = 354,["468"] = 354,["469"] = 354,["470"] = 354,["471"] = 355,["472"] = 357,["473"] = 358,["474"] = 359,["475"] = 359,["476"] = 359,["477"] = 359,["478"] = 359,["479"] = 359,["480"] = 359,["481"] = 366,["482"] = 366,["483"] = 366,["484"] = 366,["485"] = 366,["486"] = 366,["487"] = 366,["489"] = 369,["490"] = 370,["491"] = 373,["492"] = 374,["495"] = 335,["496"] = 46,["497"] = 45,["498"] = 46,["500"] = 46,["501"] = 380,["502"] = 381,["503"] = 380,["504"] = 381,["505"] = 382,["506"] = 383,["509"] = 384,["510"] = 385,["511"] = 386,["514"] = 389,["515"] = 390,["516"] = 391,["517"] = 393,["518"] = 394,["519"] = 394,["520"] = 394,["521"] = 394,["522"] = 394,["523"] = 394,["524"] = 394,["525"] = 402,["526"] = 403,["527"] = 404,["528"] = 405,["529"] = 406,["530"] = 407,["531"] = 408,["532"] = 410,["533"] = 415,["534"] = 416,["535"] = 418,["536"] = 419,["537"] = 419,["538"] = 419,["539"] = 419,["540"] = 419,["541"] = 419,["542"] = 419,["543"] = 419,["544"] = 427,["547"] = 433,["548"] = 434,["550"] = 382,["551"] = 381,["552"] = 380,["553"] = 381,["555"] = 381});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local addLivingChitinStacks = ____evo_nyx_shared.addLivingChitinStacks
local applyAcousticDisruption = ____evo_nyx_shared.applyAcousticDisruption
local applyPsiResonance = ____evo_nyx_shared.applyPsiResonance
local detectNyxBranchAndTier = ____evo_nyx_shared.detectNyxBranchAndTier
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getLivingChitinStacks = ____evo_nyx_shared.getLivingChitinStacks
local getNyxAgi = ____evo_nyx_shared.getNyxAgi
local getNyxAllAttrSum = ____evo_nyx_shared.getNyxAllAttrSum
local getNyxHighestAttr = ____evo_nyx_shared.getNyxHighestAttr
require("abilities.nyx.evo_nyx_debuffs")
local SCRIPT_PATH = "abilities/nyx/evo_nyx_t1"
LinkLuaModifier("modifier_evo_nyx_living_chitin", SCRIPT_PATH, 0)
____exports.evo_nyx_living_chitin = __TS__Class()
local evo_nyx_living_chitin = ____exports.evo_nyx_living_chitin
evo_nyx_living_chitin.name = "evo_nyx_living_chitin"
__TS__ClassExtends(evo_nyx_living_chitin, BaseAbility)
function evo_nyx_living_chitin.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_living_chitin"
end
evo_nyx_living_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_living_chitin")},
    evo_nyx_living_chitin
)
____exports.evo_nyx_living_chitin = evo_nyx_living_chitin
____exports.evo_nyx_scarab_chitin = __TS__Class()
local evo_nyx_scarab_chitin = ____exports.evo_nyx_scarab_chitin
evo_nyx_scarab_chitin.name = "evo_nyx_scarab_chitin"
__TS__ClassExtends(evo_nyx_scarab_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_scarab_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_scarab_chitin")},
    evo_nyx_scarab_chitin
)
____exports.evo_nyx_scarab_chitin = evo_nyx_scarab_chitin
____exports.evo_nyx_mantis_chitin = __TS__Class()
local evo_nyx_mantis_chitin = ____exports.evo_nyx_mantis_chitin
evo_nyx_mantis_chitin.name = "evo_nyx_mantis_chitin"
__TS__ClassExtends(evo_nyx_mantis_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_mantis_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_chitin")},
    evo_nyx_mantis_chitin
)
____exports.evo_nyx_mantis_chitin = evo_nyx_mantis_chitin
____exports.evo_nyx_archon_chitin = __TS__Class()
local evo_nyx_archon_chitin = ____exports.evo_nyx_archon_chitin
evo_nyx_archon_chitin.name = "evo_nyx_archon_chitin"
__TS__ClassExtends(evo_nyx_archon_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_archon_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_chitin")},
    evo_nyx_archon_chitin
)
____exports.evo_nyx_archon_chitin = evo_nyx_archon_chitin
____exports.evo_nyx_cicada_chitin = __TS__Class()
local evo_nyx_cicada_chitin = ____exports.evo_nyx_cicada_chitin
evo_nyx_cicada_chitin.name = "evo_nyx_cicada_chitin"
__TS__ClassExtends(evo_nyx_cicada_chitin, ____exports.evo_nyx_living_chitin)
evo_nyx_cicada_chitin = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_chitin")},
    evo_nyx_cicada_chitin
)
____exports.evo_nyx_cicada_chitin = evo_nyx_cicada_chitin
____exports.modifier_evo_nyx_living_chitin = __TS__Class()
local modifier_evo_nyx_living_chitin = ____exports.modifier_evo_nyx_living_chitin
modifier_evo_nyx_living_chitin.name = "modifier_evo_nyx_living_chitin"
__TS__ClassExtends(modifier_evo_nyx_living_chitin, BaseModifier)
function modifier_evo_nyx_living_chitin.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.stackAccum = 0
    self.cicadaDistAccum = 0
    self.lastPsiRestoreTime = -999
    self.empoweredUntil = -999
    self.empoweredAbilityName = ""
    self.burnHeroRecords = __TS__New(Set)
end
function modifier_evo_nyx_living_chitin.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_living_chitin.prototype.GetTexture(self)
    return "nyx_assassin_spiked_carapace"
end
function modifier_evo_nyx_living_chitin.prototype.OnCreated(self)
    self.stackAccum = 0
    self.cicadaDistAccum = 0
    self.lastPos = nil
    self.lastPsiRestoreTime = -999
    self.empoweredUntil = -999
    self.empoweredAbilityName = ""
    self.burnHeroRecords = __TS__New(Set)
    if not IsServer() then
        return
    end
    self:SetStackCount(1)
    self.lastPos = self:GetParent():GetAbsOrigin()
    self:StartIntervalThink(0.1)
end
function modifier_evo_nyx_living_chitin.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not ability or ability:IsNull() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    if parent:IsAlive() then
        self.stackAccum = self.stackAccum + 0.1
        local interval = ability:GetSpecialValueFor("stack_interval")
        if self.stackAccum >= interval then
            self.stackAccum = self.stackAccum - interval
            if self:GetStackCount() < maxStacks then
                self:IncrementStackCount()
            end
        end
        if info.branch == "CICADA" then
            local pos = parent:GetAbsOrigin()
            if self.lastPos then
                local delta = (pos - self.lastPos):Length2D()
                if delta > 0 and delta < 900 then
                    self.cicadaDistAccum = self.cicadaDistAccum + delta
                    if self.cicadaDistAccum >= 550 then
                        self.cicadaDistAccum = self.cicadaDistAccum - 550
                        if self:GetStackCount() < maxStacks then
                            self:IncrementStackCount()
                        end
                    end
                end
            end
            self.lastPos = pos
        else
            self.lastPos = parent:GetAbsOrigin()
        end
    else
        self.lastPos = parent:GetAbsOrigin()
    end
end
function modifier_evo_nyx_living_chitin.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_STRENGTH_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierPhysicalArmorBonus(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("armor_per_stack")
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierMagicalResistanceBonus(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("mr_per_stack")
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    local parent = self:GetParent()
    local stacks = self:GetStackCount()
    local bonus = stacks * ability:GetSpecialValueFor("ms_per_stack")
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "CICADA" and info.tier >= 3 and stacks >= 3 then
        bonus = bonus + (info.tier >= 4 and 18 or 12)
    end
    return bonus
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierBonusStats_Strength(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "SCARAB" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 7 or 4)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierStatusResistanceStacking(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "SCARAB" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 15 or 10)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "MANTIS" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 16 or 10)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierSpellAmplification_Percentage(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "ARCHON" or info.tier < 3 then
        return 0
    end
    return self:GetStackCount() * (info.tier >= 4 and 6 or 4)
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierCastRangeBonusStacking(self)
    local info = detectNyxBranchAndTier(
        nil,
        self:GetParent()
    )
    if info.branch ~= "ARCHON" or info.tier < 3 or self:GetStackCount() < 1 then
        return 0
    end
    return info.tier >= 4 and 225 or 150
end
function modifier_evo_nyx_living_chitin.prototype.GetModifierTotal_ConstantBlock(self, event)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return 0
    end
    if parent:PassivesDisabled() then
        return 0
    end
    if bit.band(event.damage_flags, 16) ~= 0 then
        return 0
    end
    if event.damage <= 0 or self:GetStackCount() <= 0 then
        return 0
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "CICADA" or info.tier >= 3 then
        return 0
    end
    local attacker = event.attacker
    if not attacker or attacker:IsNull() or not IsValidEntity(attacker) or not attacker:IsRealHero() then
        return 0
    end
    if attacker:GetTeamNumber() == parent:GetTeamNumber() then
        return 0
    end
    self:DecrementStackCount()
    local attrVal = getNyxHighestAttr(nil, parent)
    local block = ability:GetSpecialValueFor("base_block") + attrVal * ability:GetSpecialValueFor("block_attr_pct") / 100
    local pulseDmg = ability:GetSpecialValueFor("pulse_damage")
    local pulseRadius = ability:GetSpecialValueFor("pulse_radius")
    parent:EmitSound("Hero_NyxAssassin.SpikedCarapace")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf", 1, parent)
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = findEnemiesInRadius(
        nil,
        parent,
        parent:GetAbsOrigin(),
        pulseRadius
    )
    for ____, enemy in ipairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = pulseDmg,
            damage_type = 2,
            damage_flags = 16
        })
    end
    return block
end
function modifier_evo_nyx_living_chitin.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    if self:GetStackCount() < maxStacks then
        self:IncrementStackCount()
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "MANTIS" and info.tier >= 3 and self:GetStackCount() >= 3 and not target:IsBuilding() then
        local basePure = info.tier >= 4 and 35 or 20
        local pureDmg = basePure + getNyxAgi(nil, parent) * 0.2
        ApplyDamage({
            victim = target,
            attacker = parent,
            ability = ability,
            damage = pureDmg,
            damage_type = 4,
            damage_flags = 1024
        })
    end
    if info.branch == "CICADA" and self:GetStackCount() >= 3 then
        self:releaseCicadaSonicRing(
            parent,
            ability,
            info.tier,
            target:GetAbsOrigin()
        )
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.unit ~= parent or parent:PassivesDisabled() then
        return
    end
    local castAb = event.ability
    if not castAb or castAb:IsNull() or castAb:IsItem() or castAb:IsToggle() then
        return
    end
    local abName = castAb:GetAbilityName()
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch == "ARCHON" and info.tier >= 3 then
        if (abName == "lion_impale" or abName == "evo_nyx_archon_w") and self:GetStackCount() >= 1 then
            self:DecrementStackCount()
            self.empoweredUntil = GameRules:GetDOTATime(false, false) + 1.5
            self.empoweredAbilityName = abName
            self.burnHeroRecords = __TS__New(Set)
        end
    end
    if info.branch == "CICADA" then
        if self:GetStackCount() >= 3 then
            self:releaseCicadaSonicRing(
                parent,
                ability,
                info.tier,
                parent:GetAbsOrigin()
            )
        else
            local maxStacks = ability:GetSpecialValueFor("max_stacks")
            if self:GetStackCount() < maxStacks then
                self:IncrementStackCount()
            end
        end
    end
end
function modifier_evo_nyx_living_chitin.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent or parent:PassivesDisabled() then
        return
    end
    local victim = event.unit
    if not victim or victim:IsNull() or not IsValidEntity(victim) or victim:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local inflictor = event.inflictor
    if not inflictor or inflictor:IsNull() or inflictor:IsItem() then
        return
    end
    local info = detectNyxBranchAndTier(nil, parent)
    if info.branch ~= "ARCHON" or info.tier < 3 then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now <= self.empoweredUntil and inflictor:GetAbilityName() == self.empoweredAbilityName and victim:IsRealHero() and not self.burnHeroRecords:has(victim:GetEntityIndex()) then
        self.burnHeroRecords:add(victim:GetEntityIndex())
        local burnPct = info.tier >= 4 and 0.09 or 0.06
        local burn = victim:GetMaxMana() * burnPct
        if burn > 0 then
            victim:Script_ReduceMana(burn, inflictor)
            parent:GiveMana(burn * 0.5)
        end
        applyPsiResonance(
            nil,
            parent,
            victim,
            inflictor,
            info.tier - 1
        )
    end
    if victim:HasModifier("modifier_evo_nyx_psi_resonance") and now - self.lastPsiRestoreTime >= 3 then
        self.lastPsiRestoreTime = now
        addLivingChitinStacks(nil, parent, 1)
    end
end
function modifier_evo_nyx_living_chitin.prototype.releaseCicadaSonicRing(self, parent, ability, tier, origin)
    self:SetStackCount(0)
    local base = tier >= 4 and 80 or (tier >= 3 and 45 or 35)
    local pct = tier >= 4 and 0.35 or (tier >= 3 and 0.25 or 0.15)
    local dmg = base + getNyxAllAttrSum(nil, parent) * pct
    local debuffTier = math.max(1, tier - 1)
    parent:EmitSound("Hero_QueenOfPain.SonicWave")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_razor/razor_plasmafield_shockwave.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, origin)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(325, 325, 1)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = findEnemiesInRadius(nil, parent, origin, 325)
    for ____, enemy in ipairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            ability = ability,
            damage = dmg,
            damage_type = 2
        })
        applyAcousticDisruption(
            nil,
            parent,
            enemy,
            ability,
            debuffTier
        )
    end
    if tier >= 3 then
        local asMod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_cicada_chitin_as", {duration = 3})
        if asMod ~= nil then
            asMod:SetStackCount(tier >= 4 and 45 or 30)
        end
    end
end
modifier_evo_nyx_living_chitin = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_living_chitin")},
    modifier_evo_nyx_living_chitin
)
____exports.modifier_evo_nyx_living_chitin = modifier_evo_nyx_living_chitin
____exports.evo_nyx_t1_chitin_burst = __TS__Class()
local evo_nyx_t1_chitin_burst = ____exports.evo_nyx_t1_chitin_burst
evo_nyx_t1_chitin_burst.name = "evo_nyx_t1_chitin_burst"
__TS__ClassExtends(evo_nyx_t1_chitin_burst, BaseAbility)
function evo_nyx_t1_chitin_burst.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target or target:IsNull() or not IsValidEntity(target) or target:TriggerSpellAbsorb(self) then
        return
    end
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local dmg = baseDmg + getNyxHighestAttr(nil, caster) * attrPct
    caster:EmitSound("Hero_NyxAssassin.Vendetta.Crit")
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = dmg,
        damage_type = 1
    })
    local stacks = getLivingChitinStacks(nil, caster)
    if stacks > 0 then
        addLivingChitinStacks(nil, caster, -stacks)
        local burstDmg = stacks * self:GetSpecialValueFor("burst_per_stack")
        local radius = self:GetSpecialValueFor("burst_radius")
        local slowDuration = self:GetSpecialValueFor("slow_duration")
        local hitPos = target:GetAbsOrigin()
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf", 8, nil)
        ParticleManager:SetParticleControl(pfx, 0, hitPos)
        ParticleManager:ReleaseParticleIndex(pfx)
        for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, hitPos, radius)) do
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = burstDmg,
                damage_type = 4,
                damage_flags = 1024
            })
            enemy:AddNewModifier(caster, self, "modifier_evo_nyx_t1_burst_slow", {duration = slowDuration})
        end
    end
    if isEvoCreepUnit(nil, target) and (not target:IsAlive() or target:GetHealth() <= 0) then
        addLivingChitinStacks(nil, caster, 1)
    end
end
evo_nyx_t1_chitin_burst = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_t1_chitin_burst")},
    evo_nyx_t1_chitin_burst
)
____exports.evo_nyx_t1_chitin_burst = evo_nyx_t1_chitin_burst
return ____exports
