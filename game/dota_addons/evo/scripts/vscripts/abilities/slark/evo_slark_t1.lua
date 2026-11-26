local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 82,["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 3,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 10,["22"] = 10,["23"] = 82,["24"] = 83,["25"] = 83,["26"] = 83,["27"] = 83,["28"] = 83,["29"] = 83,["30"] = 83,["31"] = 83,["32"] = 83,["33"] = 83,["34"] = 83,["35"] = 94,["36"] = 95,["37"] = 96,["40"] = 99,["42"] = 12,["43"] = 14,["44"] = 15,["45"] = 16,["46"] = 17,["47"] = 18,["48"] = 19,["49"] = 21,["50"] = 22,["51"] = 21,["52"] = 22,["53"] = 23,["54"] = 24,["55"] = 23,["56"] = 22,["57"] = 21,["58"] = 22,["60"] = 22,["61"] = 28,["62"] = 29,["63"] = 28,["64"] = 29,["66"] = 29,["67"] = 30,["68"] = 28,["69"] = 32,["70"] = 33,["71"] = 32,["72"] = 35,["73"] = 36,["74"] = 35,["75"] = 38,["76"] = 39,["77"] = 38,["78"] = 41,["79"] = 42,["82"] = 43,["83"] = 44,["84"] = 41,["85"] = 46,["86"] = 47,["89"] = 48,["90"] = 49,["93"] = 50,["94"] = 51,["97"] = 55,["98"] = 56,["99"] = 57,["100"] = 57,["101"] = 57,["103"] = 58,["104"] = 58,["106"] = 59,["107"] = 60,["113"] = 65,["114"] = 66,["115"] = 67,["116"] = 69,["117"] = 70,["118"] = 71,["119"] = 72,["122"] = 77,["124"] = 46,["125"] = 29,["126"] = 28,["127"] = 29,["129"] = 29,["130"] = 102,["131"] = 103,["132"] = 102,["133"] = 103,["134"] = 104,["135"] = 105,["136"] = 104,["137"] = 107,["138"] = 108,["139"] = 107,["140"] = 110,["141"] = 111,["142"] = 110,["143"] = 113,["144"] = 114,["145"] = 113,["146"] = 116,["147"] = 117,["148"] = 117,["149"] = 117,["150"] = 117,["151"] = 117,["152"] = 117,["153"] = 117,["154"] = 117,["155"] = 117,["156"] = 116,["157"] = 127,["158"] = 128,["159"] = 129,["160"] = 127,["161"] = 131,["162"] = 132,["163"] = 133,["164"] = 131,["165"] = 135,["166"] = 136,["167"] = 137,["168"] = 137,["170"] = 138,["171"] = 139,["172"] = 139,["174"] = 140,["175"] = 140,["177"] = 141,["178"] = 141,["180"] = 142,["181"] = 135,["182"] = 144,["183"] = 145,["184"] = 146,["185"] = 146,["187"] = 147,["188"] = 148,["189"] = 148,["191"] = 149,["192"] = 149,["194"] = 150,["195"] = 150,["197"] = 151,["198"] = 144,["199"] = 153,["200"] = 154,["201"] = 155,["202"] = 155,["204"] = 156,["205"] = 157,["206"] = 157,["208"] = 158,["209"] = 153,["210"] = 160,["211"] = 161,["212"] = 162,["213"] = 162,["215"] = 163,["216"] = 164,["217"] = 164,["219"] = 165,["220"] = 165,["222"] = 166,["223"] = 166,["225"] = 167,["226"] = 160,["227"] = 169,["228"] = 170,["229"] = 171,["230"] = 171,["232"] = 172,["233"] = 173,["234"] = 173,["236"] = 174,["237"] = 174,["239"] = 175,["240"] = 175,["242"] = 176,["243"] = 169,["244"] = 103,["245"] = 102,["246"] = 103,["248"] = 103,["249"] = 180,["250"] = 181,["251"] = 180,["252"] = 181,["253"] = 182,["254"] = 183,["257"] = 184,["258"] = 185,["261"] = 187,["262"] = 188,["263"] = 189,["264"] = 191,["265"] = 192,["266"] = 182,["267"] = 181,["268"] = 180,["269"] = 181,["271"] = 181,["272"] = 201,["273"] = 202,["274"] = 201,["275"] = 202,["277"] = 202,["278"] = 203,["279"] = 204,["280"] = 205,["281"] = 206,["282"] = 207,["283"] = 201,["284"] = 209,["285"] = 210,["286"] = 209,["287"] = 212,["288"] = 213,["289"] = 212,["290"] = 215,["291"] = 216,["292"] = 216,["293"] = 216,["294"] = 216,["295"] = 215,["296"] = 221,["297"] = 222,["300"] = 223,["301"] = 224,["302"] = 225,["303"] = 226,["304"] = 226,["305"] = 226,["306"] = 226,["307"] = 227,["308"] = 228,["309"] = 229,["310"] = 221,["311"] = 231,["312"] = 232,["315"] = 233,["316"] = 234,["317"] = 235,["320"] = 238,["321"] = 239,["322"] = 240,["323"] = 241,["324"] = 242,["325"] = 243,["326"] = 244,["327"] = 245,["328"] = 246,["329"] = 231,["330"] = 248,["331"] = 249,["334"] = 250,["335"] = 251,["338"] = 253,["339"] = 254,["340"] = 256,["341"] = 257,["342"] = 258,["343"] = 259,["344"] = 261,["345"] = 262,["346"] = 262,["347"] = 262,["348"] = 262,["349"] = 262,["350"] = 262,["351"] = 262,["352"] = 262,["353"] = 262,["354"] = 262,["355"] = 262,["356"] = 274,["358"] = 275,["359"] = 275,["361"] = 276,["362"] = 276,["363"] = 276,["364"] = 276,["365"] = 276,["366"] = 276,["367"] = 276,["368"] = 283,["372"] = 248,["373"] = 202,["374"] = 201,["375"] = 202,["377"] = 202,["378"] = 288,["379"] = 289,["380"] = 288,["381"] = 289,["382"] = 290,["383"] = 291,["384"] = 290,["385"] = 293,["386"] = 294,["387"] = 293,["388"] = 296,["389"] = 297,["390"] = 296,["391"] = 299,["392"] = 300,["393"] = 299,["394"] = 302,["395"] = 303,["396"] = 302,["397"] = 305,["398"] = 306,["399"] = 305,["400"] = 289,["401"] = 288,["402"] = 289,["404"] = 289,["405"] = 310,["406"] = 311,["407"] = 310,["408"] = 311,["409"] = 312,["410"] = 313,["413"] = 314,["414"] = 315,["415"] = 316,["418"] = 317,["421"] = 319,["422"] = 320,["423"] = 321,["424"] = 322,["425"] = 323,["426"] = 325,["427"] = 326,["428"] = 326,["429"] = 326,["430"] = 326,["431"] = 326,["432"] = 326,["433"] = 326,["434"] = 326,["435"] = 326,["436"] = 326,["437"] = 327,["438"] = 327,["439"] = 327,["440"] = 327,["441"] = 327,["442"] = 327,["443"] = 327,["444"] = 335,["445"] = 336,["446"] = 337,["448"] = 339,["449"] = 340,["450"] = 341,["452"] = 312,["453"] = 311,["454"] = 310,["455"] = 311,["457"] = 311,["458"] = 346,["459"] = 347,["460"] = 346,["461"] = 347,["462"] = 348,["463"] = 349,["464"] = 348,["465"] = 351,["466"] = 352,["467"] = 351,["468"] = 354,["469"] = 355,["470"] = 354,["471"] = 357,["472"] = 358,["473"] = 357,["474"] = 360,["475"] = 361,["476"] = 360,["477"] = 363,["478"] = 364,["479"] = 363,["480"] = 347,["481"] = 346,["482"] = 347,["484"] = 347,["485"] = 368,["486"] = 369,["487"] = 368,["488"] = 369,["489"] = 370,["490"] = 371,["491"] = 370,["492"] = 373,["493"] = 374,["494"] = 373,["495"] = 376,["496"] = 377,["497"] = 376,["498"] = 379,["499"] = 380,["500"] = 379,["501"] = 382,["502"] = 383,["503"] = 382,["504"] = 385,["505"] = 386,["506"] = 385,["507"] = 369,["508"] = 368,["509"] = 369,["511"] = 369});
local ____exports = {}
local CanTeamSeeUnit
local ____game_constants = require("data.game_constants")
local EVO_PLAYABLE_TEAMS = ____game_constants.EVO_PLAYABLE_TEAMS
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
function CanTeamSeeUnit(self, team, unit)
    local heroes = FindUnitsInRadius(
        team,
        unit:GetAbsOrigin(),
        nil,
        2000,
        1,
        1,
        0,
        0,
        false
    )
    for ____, h in ipairs(heroes) do
        if h and not h:IsNull() and IsValidEntity(h) and h:CanEntityBeSeenByMyTeam(unit) then
            return true
        end
    end
    return false
end
local SCRIPT_PATH = "abilities/slark/evo_slark_t1"
LinkLuaModifier("modifier_evo_slark_deep_predator", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_slark_deep_predator_active", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_slark_t1_leap_motion", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_slark_t1_leap_slow", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_slark_t1_greedy_bite_buff", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_slark_t1_greedy_bite_debuff", SCRIPT_PATH, 0)
____exports.evo_slark_deep_predator = __TS__Class()
local evo_slark_deep_predator = ____exports.evo_slark_deep_predator
evo_slark_deep_predator.name = "evo_slark_deep_predator"
__TS__ClassExtends(evo_slark_deep_predator, BaseAbility)
function evo_slark_deep_predator.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_slark_deep_predator"
end
evo_slark_deep_predator = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_deep_predator")},
    evo_slark_deep_predator
)
____exports.evo_slark_deep_predator = evo_slark_deep_predator
____exports.modifier_evo_slark_deep_predator = __TS__Class()
local modifier_evo_slark_deep_predator = ____exports.modifier_evo_slark_deep_predator
modifier_evo_slark_deep_predator.name = "modifier_evo_slark_deep_predator"
__TS__ClassExtends(modifier_evo_slark_deep_predator, BaseModifier)
function modifier_evo_slark_deep_predator.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.unseenDuration = 0
end
function modifier_evo_slark_deep_predator.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_deep_predator.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_deep_predator.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_slark_deep_predator.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.unseenDuration = 0
    self:StartIntervalThink(0.25)
end
function modifier_evo_slark_deep_predator.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if parent:PassivesDisabled() then
        self.unseenDuration = 0
        return
    end
    local myTeam = parent:GetTeamNumber()
    local spotted = false
    local ____array_0 = __TS__SparseArrayNew(unpack(EVO_PLAYABLE_TEAMS))
    __TS__SparseArrayPush(____array_0, 10)
    for ____, team in ipairs({__TS__SparseArraySpread(____array_0)}) do
        do
            if team == myTeam then
                goto __continue12
            end
            if CanTeamSeeUnit(nil, team, parent) then
                spotted = true
                break
            end
        end
        ::__continue12::
    end
    local ability = self:GetAbility()
    local delay = ability and ability:GetSpecialValueFor("activation_delay") or 2
    local linger = ability and ability:GetSpecialValueFor("linger_duration") or 1.5
    if not spotted then
        self.unseenDuration = self.unseenDuration + 0.25
        if self.unseenDuration >= delay then
            parent:AddNewModifier(parent, ability, "modifier_evo_slark_deep_predator_active", {duration = linger})
        end
    else
        self.unseenDuration = 0
    end
end
modifier_evo_slark_deep_predator = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_deep_predator")},
    modifier_evo_slark_deep_predator
)
____exports.modifier_evo_slark_deep_predator = modifier_evo_slark_deep_predator
____exports.modifier_evo_slark_deep_predator_active = __TS__Class()
local modifier_evo_slark_deep_predator_active = ____exports.modifier_evo_slark_deep_predator_active
modifier_evo_slark_deep_predator_active.name = "modifier_evo_slark_deep_predator_active"
__TS__ClassExtends(modifier_evo_slark_deep_predator_active, BaseModifier)
function modifier_evo_slark_deep_predator_active.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_deep_predator_active.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_deep_predator_active.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_deep_predator_active.prototype.GetTexture(self)
    return "slark_shadow_dance"
end
function modifier_evo_slark_deep_predator_active.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT")
    }
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("bonus_ms_pct") or 14
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierHealthRegenPercentage(self)
    local ability = self:GetAbility()
    return ability and ability:GetSpecialValueFor("hp_regen_pct") or 2.5
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierAttackSpeedBonus_Constant(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return 0
    end
    local agiE = parent:FindAbilityByName("evo_slark_agi_e")
    if not agiE or agiE:IsNull() then
        return 0
    end
    if agiE:GetLevel() >= 3 then
        return 45
    end
    if agiE:GetLevel() >= 2 then
        return 25
    end
    return 0
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierPhysicalArmorBonus(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return 0
    end
    local strE = parent:FindAbilityByName("evo_slark_str_e")
    if not strE or strE:IsNull() then
        return 0
    end
    if strE:GetLevel() >= 3 then
        return 12
    end
    if strE:GetLevel() >= 2 then
        return 6
    end
    return 0
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierStatusResistanceStacking(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return 0
    end
    local strE = parent:FindAbilityByName("evo_slark_str_e")
    if not strE or strE:IsNull() then
        return 0
    end
    return strE:GetLevel() >= 3 and 15 or 0
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierSpellAmplify_Percentage(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return 0
    end
    local intE = parent:FindAbilityByName("evo_slark_int_e")
    if not intE or intE:IsNull() then
        return 0
    end
    if intE:GetLevel() >= 3 then
        return 18
    end
    if intE:GetLevel() >= 2 then
        return 10
    end
    return 0
end
function modifier_evo_slark_deep_predator_active.prototype.GetModifierConstantManaRegen(self)
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return 0
    end
    local intE = parent:FindAbilityByName("evo_slark_int_e")
    if not intE or intE:IsNull() then
        return 0
    end
    if intE:GetLevel() >= 3 then
        return 8
    end
    if intE:GetLevel() >= 2 then
        return 4
    end
    return 0
end
modifier_evo_slark_deep_predator_active = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_deep_predator_active")},
    modifier_evo_slark_deep_predator_active
)
____exports.modifier_evo_slark_deep_predator_active = modifier_evo_slark_deep_predator_active
____exports.evo_slark_t1_short_leap = __TS__Class()
local evo_slark_t1_short_leap = ____exports.evo_slark_t1_short_leap
evo_slark_t1_short_leap.name = "evo_slark_t1_short_leap"
__TS__ClassExtends(evo_slark_t1_short_leap, BaseAbility)
function evo_slark_t1_short_leap.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dir = caster:GetForwardVector()
    local distance = self:GetSpecialValueFor("leap_distance")
    local duration = 0.36
    caster:EmitSound("Hero_Slark.Pounce.Cast")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_t1_leap_motion", {duration = duration, dir_x = dir.x, dir_y = dir.y, distance = distance})
end
evo_slark_t1_short_leap = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_t1_short_leap")},
    evo_slark_t1_short_leap
)
____exports.evo_slark_t1_short_leap = evo_slark_t1_short_leap
____exports.modifier_evo_slark_t1_leap_motion = __TS__Class()
local modifier_evo_slark_t1_leap_motion = ____exports.modifier_evo_slark_t1_leap_motion
modifier_evo_slark_t1_leap_motion.name = "modifier_evo_slark_t1_leap_motion"
__TS__ClassExtends(modifier_evo_slark_t1_leap_motion, BaseModifier)
function modifier_evo_slark_t1_leap_motion.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1380
    self.elapsed = 0
    self.totalDur = 0.36
end
function modifier_evo_slark_t1_leap_motion.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_t1_leap_motion.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_t1_leap_motion.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_slark_t1_leap_motion.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    local dist = params.distance or 500
    self.totalDur = math.max(
        0.15,
        self:GetDuration()
    )
    self.speed = dist / self.totalDur
    self.elapsed = 0
    self:StartIntervalThink(0.03)
end
function modifier_evo_slark_t1_leap_motion.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        self:Destroy()
        return
    end
    self.elapsed = self.elapsed + 0.03
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    local groundZ = GetGroundHeight(nextPos, parent)
    local t = math.min(1, self.elapsed / self.totalDur)
    local arc = math.sin(t * math.pi) * 140
    nextPos.z = groundZ + arc
    parent:SetAbsOrigin(nextPos)
end
function modifier_evo_slark_t1_leap_motion.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    local landingPos = parent:GetAbsOrigin()
    FindClearSpaceForUnit(parent, landingPos, true)
    local ability = self:GetAbility()
    local radius = ability and ability:GetSpecialValueFor("landing_radius") or 225
    local damage = ability and ability:GetSpecialValueFor("damage") or 70
    local slowDur = ability and ability:GetSpecialValueFor("slow_duration") or 2.5
    parent:EmitSound("Hero_Slark.Pounce.Impact")
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        radius,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue67
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ability,
                damage = damage,
                damage_type = 1
            })
            enemy:AddNewModifier(parent, ability, "modifier_evo_slark_t1_leap_slow", {duration = slowDur})
        end
        ::__continue67::
    end
end
modifier_evo_slark_t1_leap_motion = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_t1_leap_motion")},
    modifier_evo_slark_t1_leap_motion
)
____exports.modifier_evo_slark_t1_leap_motion = modifier_evo_slark_t1_leap_motion
____exports.modifier_evo_slark_t1_leap_slow = __TS__Class()
local modifier_evo_slark_t1_leap_slow = ____exports.modifier_evo_slark_t1_leap_slow
modifier_evo_slark_t1_leap_slow.name = "modifier_evo_slark_t1_leap_slow"
__TS__ClassExtends(modifier_evo_slark_t1_leap_slow, BaseModifier)
function modifier_evo_slark_t1_leap_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_t1_leap_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_t1_leap_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_slark_t1_leap_slow.prototype.GetTexture(self)
    return "slark_pounce"
end
function modifier_evo_slark_t1_leap_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_slark_t1_leap_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_slark_t1_leap_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_t1_leap_slow")},
    modifier_evo_slark_t1_leap_slow
)
____exports.modifier_evo_slark_t1_leap_slow = modifier_evo_slark_t1_leap_slow
____exports.evo_slark_t1_greedy_bite = __TS__Class()
local evo_slark_t1_greedy_bite = ____exports.evo_slark_t1_greedy_bite
evo_slark_t1_greedy_bite.name = "evo_slark_t1_greedy_bite"
__TS__ClassExtends(evo_slark_t1_greedy_bite, BaseAbility)
function evo_slark_t1_greedy_bite.prototype.OnSpellStart(self)
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
    local bonusDmg = self:GetSpecialValueFor("bonus_damage")
    local baseSteal = self:GetSpecialValueFor("regen_steal")
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local duration = self:GetSpecialValueFor("duration")
    local stealAmount = isEvoCreepUnit(nil, target) and math.floor(baseSteal * creepMult * 10 + 0.5) or math.floor(baseSteal * 10 + 0.5)
    caster:EmitSound("Hero_Slark.EssenceShift")
    caster:PerformAttack(
        target,
        true,
        true,
        true,
        false,
        false,
        false,
        false
    )
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = bonusDmg,
        damage_type = 1
    })
    local buff = caster:AddNewModifier(caster, self, "modifier_evo_slark_t1_greedy_bite_buff", {duration = duration})
    if buff ~= nil then
        buff:SetStackCount(stealAmount)
    end
    local debuff = target:AddNewModifier(caster, self, "modifier_evo_slark_t1_greedy_bite_debuff", {duration = duration})
    if debuff ~= nil then
        debuff:SetStackCount(stealAmount)
    end
end
evo_slark_t1_greedy_bite = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_t1_greedy_bite")},
    evo_slark_t1_greedy_bite
)
____exports.evo_slark_t1_greedy_bite = evo_slark_t1_greedy_bite
____exports.modifier_evo_slark_t1_greedy_bite_buff = __TS__Class()
local modifier_evo_slark_t1_greedy_bite_buff = ____exports.modifier_evo_slark_t1_greedy_bite_buff
modifier_evo_slark_t1_greedy_bite_buff.name = "modifier_evo_slark_t1_greedy_bite_buff"
__TS__ClassExtends(modifier_evo_slark_t1_greedy_bite_buff, BaseModifier)
function modifier_evo_slark_t1_greedy_bite_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_t1_greedy_bite_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_t1_greedy_bite_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_slark_t1_greedy_bite_buff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_t1_greedy_bite_buff.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")}
end
function modifier_evo_slark_t1_greedy_bite_buff.prototype.GetModifierConstantHealthRegen(self)
    return self:GetStackCount() / 10
end
modifier_evo_slark_t1_greedy_bite_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_t1_greedy_bite_buff")},
    modifier_evo_slark_t1_greedy_bite_buff
)
____exports.modifier_evo_slark_t1_greedy_bite_buff = modifier_evo_slark_t1_greedy_bite_buff
____exports.modifier_evo_slark_t1_greedy_bite_debuff = __TS__Class()
local modifier_evo_slark_t1_greedy_bite_debuff = ____exports.modifier_evo_slark_t1_greedy_bite_debuff
modifier_evo_slark_t1_greedy_bite_debuff.name = "modifier_evo_slark_t1_greedy_bite_debuff"
__TS__ClassExtends(modifier_evo_slark_t1_greedy_bite_debuff, BaseModifier)
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.GetTexture(self)
    return "slark_essence_shift"
end
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT")}
end
function modifier_evo_slark_t1_greedy_bite_debuff.prototype.GetModifierConstantHealthRegen(self)
    return -(self:GetStackCount() / 10)
end
modifier_evo_slark_t1_greedy_bite_debuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_t1_greedy_bite_debuff")},
    modifier_evo_slark_t1_greedy_bite_debuff
)
____exports.modifier_evo_slark_t1_greedy_bite_debuff = modifier_evo_slark_t1_greedy_bite_debuff
return ____exports
