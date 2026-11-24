local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 11,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 21,["28"] = 22,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["38"] = 29,["39"] = 30,["42"] = 32,["43"] = 33,["44"] = 34,["45"] = 36,["46"] = 37,["47"] = 27,["48"] = 26,["49"] = 25,["50"] = 26,["52"] = 26,["53"] = 46,["54"] = 47,["55"] = 46,["56"] = 47,["58"] = 47,["59"] = 48,["60"] = 49,["61"] = 50,["62"] = 51,["63"] = 52,["64"] = 53,["65"] = 46,["66"] = 55,["67"] = 56,["68"] = 55,["69"] = 58,["70"] = 59,["71"] = 58,["72"] = 61,["73"] = 62,["74"] = 62,["75"] = 62,["76"] = 62,["77"] = 61,["78"] = 67,["79"] = 68,["82"] = 69,["83"] = 70,["84"] = 71,["85"] = 72,["86"] = 72,["87"] = 72,["88"] = 72,["89"] = 73,["90"] = 74,["91"] = 75,["92"] = 76,["93"] = 67,["94"] = 78,["95"] = 79,["98"] = 80,["99"] = 81,["100"] = 82,["103"] = 85,["104"] = 86,["105"] = 87,["106"] = 88,["107"] = 89,["108"] = 90,["109"] = 91,["110"] = 92,["111"] = 94,["112"] = 94,["113"] = 94,["114"] = 94,["115"] = 94,["116"] = 94,["117"] = 94,["118"] = 94,["119"] = 94,["120"] = 94,["121"] = 94,["122"] = 105,["123"] = 106,["124"] = 107,["125"] = 108,["129"] = 78,["130"] = 113,["131"] = 114,["132"] = 115,["133"] = 116,["136"] = 118,["137"] = 119,["138"] = 120,["139"] = 121,["140"] = 122,["141"] = 124,["142"] = 125,["143"] = 125,["144"] = 125,["145"] = 125,["146"] = 125,["147"] = 125,["148"] = 125,["149"] = 133,["150"] = 134,["151"] = 140,["152"] = 141,["153"] = 142,["154"] = 142,["155"] = 142,["156"] = 142,["157"] = 142,["158"] = 142,["159"] = 142,["160"] = 142,["161"] = 142,["162"] = 142,["164"] = 144,["165"] = 113,["166"] = 146,["167"] = 147,["170"] = 148,["171"] = 149,["174"] = 150,["175"] = 150,["176"] = 150,["177"] = 150,["178"] = 150,["179"] = 152,["182"] = 153,["183"] = 154,["186"] = 155,["187"] = 156,["188"] = 157,["189"] = 158,["190"] = 158,["191"] = 158,["192"] = 158,["193"] = 158,["194"] = 158,["195"] = 158,["196"] = 158,["197"] = 158,["198"] = 158,["199"] = 158,["200"] = 169,["202"] = 170,["203"] = 170,["205"] = 171,["206"] = 171,["207"] = 171,["208"] = 171,["209"] = 171,["210"] = 171,["211"] = 171,["215"] = 146,["216"] = 47,["217"] = 46,["218"] = 47,["220"] = 47,["221"] = 182,["222"] = 183,["223"] = 182,["224"] = 183,["226"] = 183,["227"] = 184,["228"] = 185,["229"] = 186,["230"] = 182,["231"] = 188,["232"] = 189,["233"] = 188,["234"] = 191,["235"] = 192,["236"] = 191,["237"] = 194,["238"] = 195,["239"] = 194,["240"] = 197,["241"] = 198,["242"] = 197,["243"] = 200,["244"] = 201,["247"] = 202,["248"] = 203,["249"] = 204,["250"] = 205,["251"] = 206,["252"] = 207,["253"] = 208,["254"] = 200,["255"] = 210,["256"] = 211,["259"] = 212,["260"] = 213,["263"] = 214,["264"] = 215,["265"] = 216,["266"] = 217,["267"] = 218,["268"] = 219,["269"] = 220,["270"] = 221,["271"] = 221,["272"] = 221,["273"] = 221,["274"] = 221,["275"] = 221,["276"] = 221,["277"] = 221,["278"] = 222,["280"] = 210,["281"] = 225,["282"] = 226,["283"] = 225,["284"] = 230,["285"] = 231,["286"] = 230,["287"] = 233,["288"] = 234,["291"] = 235,["292"] = 236,["293"] = 237,["294"] = 238,["297"] = 239,["300"] = 240,["301"] = 241,["302"] = 233,["303"] = 183,["304"] = 182,["305"] = 183,["307"] = 183,["308"] = 245,["309"] = 246,["310"] = 245,["311"] = 246,["312"] = 247,["313"] = 248,["316"] = 249,["317"] = 250,["320"] = 251,["321"] = 252,["322"] = 253,["323"] = 247,["324"] = 246,["325"] = 245,["326"] = 246,["328"] = 246,["329"] = 257,["330"] = 258,["331"] = 257,["332"] = 258,["333"] = 259,["334"] = 260,["335"] = 259,["336"] = 262,["337"] = 263,["338"] = 262,["339"] = 265,["340"] = 266,["341"] = 265,["342"] = 268,["343"] = 269,["344"] = 268,["345"] = 271,["346"] = 272,["349"] = 273,["350"] = 274,["351"] = 275,["354"] = 276,["355"] = 277,["356"] = 271,["357"] = 258,["358"] = 257,["359"] = 258,["361"] = 258,["362"] = 281,["363"] = 282,["364"] = 281,["365"] = 282,["367"] = 282,["368"] = 283,["369"] = 281,["370"] = 285,["371"] = 286,["372"] = 285,["373"] = 288,["374"] = 289,["375"] = 288,["376"] = 291,["377"] = 292,["380"] = 293,["381"] = 294,["382"] = 295,["383"] = 291,["384"] = 297,["385"] = 298,["388"] = 299,["389"] = 300,["390"] = 301,["393"] = 303,["394"] = 303,["395"] = 303,["396"] = 303,["397"] = 303,["398"] = 303,["399"] = 303,["400"] = 305,["401"] = 306,["402"] = 307,["403"] = 308,["404"] = 309,["405"] = 311,["406"] = 312,["407"] = 313,["409"] = 316,["410"] = 321,["411"] = 321,["412"] = 321,["413"] = 321,["414"] = 321,["415"] = 322,["416"] = 324,["417"] = 324,["418"] = 324,["419"] = 324,["420"] = 324,["421"] = 324,["422"] = 324,["423"] = 324,["424"] = 324,["425"] = 324,["426"] = 324,["427"] = 335,["429"] = 336,["430"] = 336,["432"] = 337,["433"] = 337,["434"] = 337,["435"] = 337,["436"] = 337,["437"] = 337,["438"] = 337,["439"] = 344,["440"] = 345,["445"] = 297,["446"] = 349,["447"] = 350,["450"] = 351,["451"] = 352,["452"] = 353,["455"] = 354,["456"] = 355,["457"] = 356,["458"] = 357,["459"] = 358,["462"] = 349,["463"] = 282,["464"] = 281,["465"] = 282,["467"] = 282,["468"] = 364,["469"] = 365,["470"] = 364,["471"] = 365,["472"] = 366,["473"] = 367,["474"] = 366,["475"] = 369,["476"] = 370,["477"] = 369,["478"] = 372,["479"] = 373,["480"] = 372,["481"] = 375,["482"] = 376,["483"] = 375,["484"] = 378,["485"] = 379,["486"] = 378,["487"] = 383,["488"] = 384,["489"] = 384,["490"] = 384,["491"] = 384,["492"] = 384,["493"] = 383,["494"] = 390,["495"] = 391,["496"] = 390,["497"] = 393,["498"] = 394,["499"] = 394,["500"] = 394,["501"] = 394,["502"] = 393,["503"] = 396,["504"] = 397,["505"] = 396,["506"] = 365,["507"] = 364,["508"] = 365,["510"] = 365});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_slark_shared = require("abilities.slark.evo_slark_shared")
local grantSlarkAgiEssenceStack = ____evo_slark_shared.grantSlarkAgiEssenceStack
local SCRIPT_PATH = "abilities/slark/evo_slark_agi"
local SLARK_AGI_QW_MODS = {
    "modifier_evo_slark_agi_q_leap",
    "modifier_evo_slark_agi_q_leash",
    "modifier_evo_slark_agi_w_charge",
    "modifier_evo_slark_agi_w_pulse",
    "modifier_evo_slark_agi_w_buff"
}
for ____, modName in ipairs(SLARK_AGI_QW_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.evo_slark_agi_q = __TS__Class()
local evo_slark_agi_q = ____exports.evo_slark_agi_q
evo_slark_agi_q.name = "evo_slark_agi_q"
__TS__ClassExtends(evo_slark_agi_q, BaseAbility)
function evo_slark_agi_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local dir = caster:GetForwardVector()
    local distance = self:GetSpecialValueFor("leap_distance")
    local duration = math.max(0.28, distance / 1750)
    caster:EmitSound("Hero_Slark.Pounce.Cast")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_q_leap", {duration = duration, dir_x = dir.x, dir_y = dir.y, distance = distance})
end
evo_slark_agi_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_q")},
    evo_slark_agi_q
)
____exports.evo_slark_agi_q = evo_slark_agi_q
____exports.modifier_evo_slark_agi_q_leap = __TS__Class()
local modifier_evo_slark_agi_q_leap = ____exports.modifier_evo_slark_agi_q_leap
modifier_evo_slark_agi_q_leap.name = "modifier_evo_slark_agi_q_leap"
__TS__ClassExtends(modifier_evo_slark_agi_q_leap, BaseModifier)
function modifier_evo_slark_agi_q_leap.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1750
    self.elapsed = 0
    self.totalDur = 0.4
    self.latched = false
end
function modifier_evo_slark_agi_q_leap.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_q_leap.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_q_leap.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_slark_agi_q_leap.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    local dist = params.distance or 650
    self.totalDur = math.max(
        0.2,
        self:GetDuration()
    )
    self.speed = dist / self.totalDur
    self.elapsed = 0
    self.latched = false
    self:StartIntervalThink(0.03)
end
function modifier_evo_slark_agi_q_leap.prototype.OnIntervalThink(self)
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
    nextPos.z = groundZ + math.sin(t * math.pi) * 155
    parent:SetAbsOrigin(nextPos)
    local heroes = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        135,
        2,
        1,
        0,
        1,
        false
    )
    for ____, enemy in ipairs(heroes) do
        if enemy and not enemy:IsNull() and IsValidEntity(enemy) and enemy:IsAlive() then
            self:latchOnto(parent, enemy)
            self:Destroy()
            return
        end
    end
end
function modifier_evo_slark_agi_q_leap.prototype.latchOnto(self, caster, target)
    self.latched = true
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local level = ab:GetLevel()
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local leashDur = ab:GetSpecialValueFor("leash_duration")
    local agi = caster:IsRealHero() and caster:GetAgility() or 0
    caster:EmitSound("Hero_Slark.Pounce.Impact")
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = ab,
        damage = baseDmg + agi * agiPct,
        damage_type = 1
    })
    local anchor = target:GetAbsOrigin()
    target:AddNewModifier(caster, ab, "modifier_evo_slark_agi_q_leash", {duration = leashDur, anchor_x = anchor.x, anchor_y = anchor.y})
    if level >= 2 then
        grantSlarkAgiEssenceStack(nil, caster, target, 2)
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
    end
    caster:MoveToTargetToAttack(target)
end
function modifier_evo_slark_agi_q_leap.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    FindClearSpaceForUnit(
        parent,
        parent:GetAbsOrigin(),
        true
    )
    if self.latched then
        return
    end
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local agi = parent:IsRealHero() and parent:GetAgility() or 0
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        225,
        2,
        1 + 18,
        0,
        1,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue26
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = baseDmg + agi * agiPct,
                damage_type = 1
            })
        end
        ::__continue26::
    end
end
modifier_evo_slark_agi_q_leap = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_q_leap")},
    modifier_evo_slark_agi_q_leap
)
____exports.modifier_evo_slark_agi_q_leap = modifier_evo_slark_agi_q_leap
____exports.modifier_evo_slark_agi_q_leash = __TS__Class()
local modifier_evo_slark_agi_q_leash = ____exports.modifier_evo_slark_agi_q_leash
modifier_evo_slark_agi_q_leash.name = "modifier_evo_slark_agi_q_leash"
__TS__ClassExtends(modifier_evo_slark_agi_q_leash, BaseModifier)
function modifier_evo_slark_agi_q_leash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.anchorX = 0
    self.anchorY = 0
    self.maxRadius = 350
end
function modifier_evo_slark_agi_q_leash.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_q_leash.prototype.IsDebuff(self)
    return true
end
function modifier_evo_slark_agi_q_leash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_q_leash.prototype.GetTexture(self)
    return "slark_pounce"
end
function modifier_evo_slark_agi_q_leash.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local origin = parent and not parent:IsNull() and parent:GetAbsOrigin() or Vector(0, 0, 0)
    self.anchorX = params.anchor_x or origin.x
    self.anchorY = params.anchor_y or origin.y
    local ab = self:GetAbility()
    self.maxRadius = ab and ab:GetSpecialValueFor("leash_radius") or 350
    self:StartIntervalThink(0.05)
end
function modifier_evo_slark_agi_q_leash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    local pos = parent:GetAbsOrigin()
    local dx = pos.x - self.anchorX
    local dy = pos.y - self.anchorY
    local dist = math.sqrt(dx * dx + dy * dy)
    if dist > self.maxRadius then
        local nx = self.anchorX + dx / dist * self.maxRadius
        local ny = self.anchorY + dy / dist * self.maxRadius
        local clamped = Vector(
            nx,
            ny,
            GetGroundHeight(
                Vector(nx, ny, pos.z),
                parent
            )
        )
        parent:SetAbsOrigin(clamped)
    end
end
function modifier_evo_slark_agi_q_leash.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_TETHERED")] = true}
end
function modifier_evo_slark_agi_q_leash.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")}
end
function modifier_evo_slark_agi_q_leash.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not caster or caster:IsNull() or not ab then
        return
    end
    if event.unit ~= parent or ab:GetLevel() < 3 then
        return
    end
    ab:EndCooldown()
    caster:GiveMana(caster:GetMaxMana() * 0.25)
end
modifier_evo_slark_agi_q_leash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_q_leash")},
    modifier_evo_slark_agi_q_leash
)
____exports.modifier_evo_slark_agi_q_leash = modifier_evo_slark_agi_q_leash
____exports.evo_slark_agi_w = __TS__Class()
local evo_slark_agi_w = ____exports.evo_slark_agi_w
evo_slark_agi_w.name = "evo_slark_agi_w"
__TS__ClassExtends(evo_slark_agi_w, BaseAbility)
function evo_slark_agi_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local delay = self:GetSpecialValueFor("delay")
    caster:EmitSound("Hero_Slark.DarkPact.PreCast")
    caster:AddNewModifier(caster, self, "modifier_evo_slark_agi_w_charge", {duration = delay})
end
evo_slark_agi_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_slark_agi_w")},
    evo_slark_agi_w
)
____exports.evo_slark_agi_w = evo_slark_agi_w
____exports.modifier_evo_slark_agi_w_charge = __TS__Class()
local modifier_evo_slark_agi_w_charge = ____exports.modifier_evo_slark_agi_w_charge
modifier_evo_slark_agi_w_charge.name = "modifier_evo_slark_agi_w_charge"
__TS__ClassExtends(modifier_evo_slark_agi_w_charge, BaseModifier)
function modifier_evo_slark_agi_w_charge.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_w_charge.prototype.GetTexture(self)
    return "slark_dark_pact"
end
function modifier_evo_slark_agi_w_charge.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    parent:EmitSound("Hero_Slark.DarkPact.Cast")
    parent:AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_pulse", {duration = 0.85})
end
modifier_evo_slark_agi_w_charge = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_charge")},
    modifier_evo_slark_agi_w_charge
)
____exports.modifier_evo_slark_agi_w_charge = modifier_evo_slark_agi_w_charge
____exports.modifier_evo_slark_agi_w_pulse = __TS__Class()
local modifier_evo_slark_agi_w_pulse = ____exports.modifier_evo_slark_agi_w_pulse
modifier_evo_slark_agi_w_pulse.name = "modifier_evo_slark_agi_w_pulse"
__TS__ClassExtends(modifier_evo_slark_agi_w_pulse, BaseModifier)
function modifier_evo_slark_agi_w_pulse.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.hitHeroIds = __TS__New(Set)
end
function modifier_evo_slark_agi_w_pulse.prototype.IsHidden(self)
    return true
end
function modifier_evo_slark_agi_w_pulse.prototype.IsPurgable(self)
    return false
end
function modifier_evo_slark_agi_w_pulse.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self.hitHeroIds = __TS__New(Set)
    self:OnIntervalThink()
    self:StartIntervalThink(0.2)
end
function modifier_evo_slark_agi_w_pulse.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    parent:Purge(
        false,
        true,
        false,
        true,
        true
    )
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local radius = ab:GetSpecialValueFor("radius")
    local agi = parent:IsRealHero() and parent:GetAgility() or 0
    local pulseDmg = (baseDmg + agi * agiPct) / 5
    local selfDmg = pulseDmg * 0.35
    if parent:GetHealth() > selfDmg + 1 then
        parent:SetHealth(parent:GetHealth() - selfDmg)
    end
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_slark/slark_dark_pact_pulses.vpcf", 1, parent)
    ParticleManager:SetParticleControl(
        pfx,
        1,
        Vector(radius, radius, radius)
    )
    ParticleManager:ReleaseParticleIndex(pfx)
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
                goto __continue63
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = pulseDmg,
                damage_type = 2
            })
            if enemy:IsHero() then
                self.hitHeroIds:add(enemy:entindex())
            end
        end
        ::__continue63::
    end
end
function modifier_evo_slark_agi_w_pulse.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        return
    end
    if ab:GetLevel() >= 2 then
        local dur = ab:GetLevel() >= 3 and 4 or 2.5
        local mod = parent:AddNewModifier(parent, ab, "modifier_evo_slark_agi_w_buff", {duration = dur})
        if mod ~= nil then
            mod:SetStackCount(ab:GetLevel() >= 3 and math.max(1, self.hitHeroIds.size) or 0)
        end
    end
end
modifier_evo_slark_agi_w_pulse = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_pulse")},
    modifier_evo_slark_agi_w_pulse
)
____exports.modifier_evo_slark_agi_w_pulse = modifier_evo_slark_agi_w_pulse
____exports.modifier_evo_slark_agi_w_buff = __TS__Class()
local modifier_evo_slark_agi_w_buff = ____exports.modifier_evo_slark_agi_w_buff
modifier_evo_slark_agi_w_buff.name = "modifier_evo_slark_agi_w_buff"
__TS__ClassExtends(modifier_evo_slark_agi_w_buff, BaseModifier)
function modifier_evo_slark_agi_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_slark_agi_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_slark_agi_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_slark_agi_w_buff.prototype.GetTexture(self)
    return "slark_dark_pact"
end
function modifier_evo_slark_agi_w_buff.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_slark_agi_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_EVASION_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 20
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierEvasion_Constant(self)
    return math.min(
        50,
        self:GetStackCount() * 10
    )
end
function modifier_evo_slark_agi_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self:GetStackCount() * 20
end
modifier_evo_slark_agi_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_slark_agi_w_buff")},
    modifier_evo_slark_agi_w_buff
)
____exports.modifier_evo_slark_agi_w_buff = modifier_evo_slark_agi_w_buff
return ____exports
