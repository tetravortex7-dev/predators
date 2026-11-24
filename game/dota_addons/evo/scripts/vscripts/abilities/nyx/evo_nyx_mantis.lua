local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 20,["26"] = 21,["28"] = 24,["29"] = 25,["30"] = 24,["31"] = 28,["32"] = 29,["33"] = 33,["34"] = 34,["35"] = 34,["36"] = 34,["37"] = 34,["38"] = 35,["40"] = 28,["41"] = 39,["42"] = 40,["43"] = 39,["44"] = 40,["45"] = 41,["46"] = 42,["49"] = 43,["50"] = 44,["53"] = 46,["54"] = 47,["55"] = 48,["56"] = 49,["57"] = 50,["58"] = 51,["59"] = 51,["60"] = 51,["61"] = 51,["62"] = 51,["63"] = 51,["64"] = 51,["65"] = 52,["66"] = 53,["67"] = 55,["68"] = 56,["69"] = 41,["70"] = 40,["71"] = 39,["72"] = 40,["74"] = 40,["75"] = 65,["76"] = 66,["77"] = 65,["78"] = 66,["80"] = 66,["81"] = 67,["82"] = 68,["83"] = 69,["84"] = 70,["85"] = 65,["86"] = 72,["87"] = 73,["88"] = 72,["89"] = 75,["90"] = 76,["91"] = 75,["92"] = 78,["93"] = 79,["94"] = 79,["95"] = 79,["96"] = 79,["97"] = 78,["98"] = 84,["99"] = 85,["100"] = 86,["101"] = 87,["102"] = 88,["103"] = 89,["106"] = 90,["107"] = 84,["108"] = 92,["109"] = 93,["112"] = 94,["113"] = 95,["114"] = 96,["115"] = 97,["118"] = 101,["119"] = 102,["120"] = 103,["121"] = 104,["122"] = 105,["123"] = 107,["124"] = 108,["125"] = 109,["126"] = 110,["127"] = 111,["128"] = 112,["129"] = 113,["130"] = 114,["131"] = 116,["132"] = 116,["133"] = 116,["134"] = 116,["135"] = 116,["136"] = 116,["137"] = 116,["138"] = 116,["139"] = 116,["140"] = 116,["141"] = 116,["142"] = 127,["144"] = 128,["145"] = 128,["147"] = 129,["148"] = 130,["149"] = 130,["151"] = 131,["152"] = 133,["153"] = 134,["154"] = 135,["155"] = 136,["157"] = 138,["158"] = 139,["160"] = 141,["161"] = 141,["162"] = 141,["163"] = 141,["164"] = 141,["165"] = 141,["166"] = 141,["167"] = 148,["168"] = 148,["169"] = 148,["170"] = 148,["171"] = 148,["172"] = 148,["173"] = 148,["174"] = 148,["178"] = 92,["179"] = 151,["180"] = 152,["183"] = 153,["184"] = 154,["185"] = 155,["186"] = 155,["187"] = 155,["188"] = 155,["189"] = 155,["191"] = 151,["192"] = 66,["193"] = 65,["194"] = 66,["196"] = 66,["197"] = 160,["198"] = 161,["199"] = 160,["200"] = 161,["202"] = 161,["203"] = 162,["204"] = 160,["205"] = 164,["206"] = 165,["207"] = 164,["208"] = 167,["209"] = 168,["210"] = 167,["211"] = 170,["212"] = 171,["213"] = 170,["214"] = 173,["215"] = 174,["216"] = 173,["217"] = 176,["218"] = 177,["219"] = 178,["222"] = 179,["223"] = 176,["224"] = 181,["225"] = 182,["228"] = 183,["229"] = 184,["231"] = 181,["232"] = 187,["233"] = 188,["236"] = 189,["237"] = 190,["238"] = 191,["241"] = 192,["244"] = 194,["245"] = 194,["246"] = 194,["247"] = 194,["248"] = 195,["249"] = 195,["250"] = 195,["251"] = 195,["252"] = 195,["253"] = 195,["254"] = 195,["255"] = 187,["256"] = 161,["257"] = 160,["258"] = 161,["260"] = 161,["261"] = 205,["262"] = 206,["263"] = 205,["264"] = 206,["265"] = 207,["266"] = 208,["267"] = 207,["268"] = 210,["269"] = 211,["270"] = 210,["271"] = 213,["272"] = 214,["273"] = 213,["274"] = 216,["275"] = 217,["276"] = 216,["277"] = 219,["278"] = 220,["279"] = 219,["280"] = 222,["281"] = 223,["284"] = 224,["285"] = 225,["286"] = 226,["289"] = 227,["290"] = 228,["291"] = 229,["292"] = 230,["293"] = 231,["294"] = 232,["297"] = 222,["298"] = 206,["299"] = 205,["300"] = 206,["302"] = 206,["303"] = 238,["304"] = 239,["305"] = 238,["306"] = 239,["307"] = 240,["308"] = 241,["311"] = 242,["312"] = 243,["315"] = 245,["316"] = 246,["317"] = 247,["318"] = 248,["319"] = 249,["321"] = 252,["322"] = 253,["323"] = 254,["324"] = 254,["325"] = 256,["326"] = 257,["327"] = 257,["329"] = 258,["330"] = 259,["331"] = 254,["332"] = 254,["333"] = 254,["335"] = 240,["336"] = 266,["337"] = 267,["338"] = 268,["339"] = 269,["340"] = 270,["341"] = 271,["342"] = 272,["343"] = 274,["344"] = 275,["345"] = 276,["346"] = 278,["347"] = 278,["348"] = 278,["349"] = 278,["350"] = 278,["351"] = 278,["352"] = 278,["353"] = 278,["354"] = 278,["355"] = 278,["356"] = 278,["357"] = 289,["359"] = 290,["360"] = 290,["362"] = 291,["363"] = 291,["364"] = 291,["365"] = 291,["366"] = 291,["367"] = 291,["368"] = 291,["369"] = 298,["370"] = 299,["371"] = 299,["372"] = 299,["373"] = 299,["374"] = 299,["375"] = 299,["376"] = 299,["378"] = 307,["379"] = 308,["380"] = 309,["381"] = 310,["387"] = 266,["388"] = 239,["389"] = 238,["390"] = 239,["392"] = 239,["393"] = 317,["394"] = 318,["395"] = 317,["396"] = 318,["397"] = 319,["398"] = 320,["399"] = 319,["400"] = 322,["401"] = 323,["402"] = 322,["403"] = 325,["404"] = 326,["405"] = 325,["406"] = 328,["407"] = 329,["408"] = 328,["409"] = 331,["410"] = 332,["411"] = 332,["412"] = 332,["413"] = 332,["414"] = 331,["415"] = 337,["416"] = 338,["417"] = 337,["418"] = 340,["419"] = 341,["420"] = 340,["421"] = 318,["422"] = 317,["423"] = 318,["425"] = 318,["426"] = 345,["427"] = 346,["428"] = 345,["429"] = 346,["430"] = 347,["431"] = 348,["432"] = 347,["433"] = 346,["434"] = 345,["435"] = 346,["437"] = 346,["438"] = 352,["439"] = 353,["440"] = 352,["441"] = 353,["443"] = 353,["444"] = 354,["445"] = 352,["446"] = 356,["447"] = 357,["448"] = 356,["449"] = 359,["450"] = 360,["451"] = 359,["452"] = 362,["453"] = 363,["454"] = 362,["455"] = 365,["456"] = 366,["457"] = 365,["458"] = 368,["459"] = 369,["460"] = 369,["461"] = 369,["462"] = 369,["463"] = 369,["464"] = 368,["465"] = 375,["466"] = 376,["467"] = 377,["468"] = 378,["469"] = 378,["471"] = 379,["472"] = 375,["473"] = 381,["474"] = 382,["475"] = 382,["477"] = 383,["478"] = 384,["479"] = 385,["480"] = 385,["482"] = 386,["483"] = 387,["484"] = 388,["485"] = 389,["487"] = 391,["488"] = 392,["489"] = 381,["490"] = 394,["491"] = 395,["494"] = 396,["495"] = 397,["496"] = 398,["497"] = 399,["498"] = 400,["501"] = 401,["504"] = 402,["505"] = 402,["506"] = 402,["507"] = 402,["508"] = 402,["509"] = 402,["510"] = 402,["511"] = 402,["512"] = 394,["513"] = 353,["514"] = 352,["515"] = 353,["517"] = 353});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis"
local MANTIS_MODS = {
    "modifier_evo_nyx_mantis_q_dash",
    "modifier_evo_nyx_mantis_bleed",
    "modifier_evo_nyx_mantis_q_mark",
    "modifier_evo_nyx_mantis_w_mark",
    "modifier_evo_nyx_mantis_e_passive"
}
for ____, modName in ipairs(MANTIS_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
local function getAgi(self, unit)
    return unit:IsRealHero() and unit:GetAgility() or 0
end
local function applyLaceration(self, caster, target, ability, dps, dur)
    local mod = target:AddNewModifier(caster, ability, "modifier_evo_nyx_mantis_bleed", {duration = dur, dps = dps})
    if mod ~= nil then
        local next = math.min(
            4,
            mod:GetStackCount() + 1
        )
        mod:SetStackCount(next)
    end
end
____exports.evo_nyx_mantis_q = __TS__Class()
local evo_nyx_mantis_q = ____exports.evo_nyx_mantis_q
evo_nyx_mantis_q.name = "evo_nyx_mantis_q"
__TS__ClassExtends(evo_nyx_mantis_q, BaseAbility)
function evo_nyx_mantis_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local range = self:GetSpecialValueFor("range")
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local dir = delta:Length2D() > 1 and delta:Normalized() or caster:GetForwardVector()
    local dist = math.min(
        range,
        math.max(
            200,
            delta:Length2D() > 1 and delta:Length2D() or range
        )
    )
    local speed = 1900
    local dur = math.max(0.12, dist / speed)
    caster:EmitSound("Hero_PhantomAssassin.Strike.End")
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_mantis_q_dash", {duration = dur, dir_x = dir.x, dir_y = dir.y, speed = speed})
end
evo_nyx_mantis_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_q")},
    evo_nyx_mantis_q
)
____exports.evo_nyx_mantis_q = evo_nyx_mantis_q
____exports.modifier_evo_nyx_mantis_q_dash = __TS__Class()
local modifier_evo_nyx_mantis_q_dash = ____exports.modifier_evo_nyx_mantis_q_dash
modifier_evo_nyx_mantis_q_dash.name = "modifier_evo_nyx_mantis_q_dash"
__TS__ClassExtends(modifier_evo_nyx_mantis_q_dash, BaseModifier)
function modifier_evo_nyx_mantis_q_dash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1900
    self.hitSet = __TS__New(Set)
end
function modifier_evo_nyx_mantis_q_dash.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_mantis_q_dash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_q_dash.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_nyx_mantis_q_dash.prototype.OnCreated(self, params)
    self.dirX = params and params.dir_x or 1
    self.dirY = params and params.dir_y or 0
    self.speed = params and params.speed or 1900
    self.hitSet = __TS__New(Set)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.03)
end
function modifier_evo_nyx_mantis_q_dash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() or not ab then
        self:Destroy()
        return
    end
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    nextPos.z = GetGroundHeight(nextPos, parent)
    parent:SetAbsOrigin(nextPos)
    local level = ab:GetLevel()
    local width = ab:GetSpecialValueFor("width")
    local baseDmg = ab:GetSpecialValueFor("base_damage")
    local agiPct = ab:GetSpecialValueFor("agi_pct") / 100
    local creepMult = ab:GetSpecialValueFor("creep_mult")
    local bleedDps = ab:GetSpecialValueFor("bleed_dps")
    local bleedDur = ab:GetSpecialValueFor("bleed_duration")
    local dmg = baseDmg + getAgi(nil, parent) * agiPct
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        width,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue18
            end
            local id = enemy:entindex()
            if self.hitSet:has(id) then
                goto __continue18
            end
            self.hitSet:add(id)
            local hitDmg = enemy:IsCreep() and dmg * creepMult or dmg
            if level >= 2 and enemy:GetHealthPercent() <= 50 then
                hitDmg = hitDmg * 1.5
                enemy:AddNewModifier(parent, ab, "modifier_stunned", {duration = 0.5})
            end
            if level >= 3 then
                enemy:AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_q_mark", {duration = 3})
            end
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = hitDmg,
                damage_type = 1
            })
            applyLaceration(
                nil,
                parent,
                enemy,
                ab,
                bleedDps,
                bleedDur
            )
        end
        ::__continue18::
    end
end
function modifier_evo_nyx_mantis_q_dash.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() and IsValidEntity(parent) then
        FindClearSpaceForUnit(
            parent,
            parent:GetAbsOrigin(),
            true
        )
    end
end
modifier_evo_nyx_mantis_q_dash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_q_dash")},
    modifier_evo_nyx_mantis_q_dash
)
____exports.modifier_evo_nyx_mantis_q_dash = modifier_evo_nyx_mantis_q_dash
____exports.modifier_evo_nyx_mantis_bleed = __TS__Class()
local modifier_evo_nyx_mantis_bleed = ____exports.modifier_evo_nyx_mantis_bleed
modifier_evo_nyx_mantis_bleed.name = "modifier_evo_nyx_mantis_bleed"
__TS__ClassExtends(modifier_evo_nyx_mantis_bleed, BaseModifier)
function modifier_evo_nyx_mantis_bleed.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dps = 20
end
function modifier_evo_nyx_mantis_bleed.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_bleed.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_bleed.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_bleed.prototype.GetTexture(self)
    return "bloodseeker_rupture"
end
function modifier_evo_nyx_mantis_bleed.prototype.OnCreated(self, params)
    self.dps = params and params.dps or 20
    if not IsServer() then
        return
    end
    self:StartIntervalThink(1)
end
function modifier_evo_nyx_mantis_bleed.prototype.OnRefresh(self, params)
    if not IsServer() then
        return
    end
    if (params and params.dps) ~= nil and params.dps > self.dps then
        self.dps = params.dps
    end
end
function modifier_evo_nyx_mantis_bleed.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        return
    end
    if not caster or caster:IsNull() then
        return
    end
    local stacks = math.max(
        1,
        self:GetStackCount()
    )
    ApplyDamage({
        victim = parent,
        attacker = caster,
        ability = self:GetAbility(),
        damage = (self.dps or 20) * stacks,
        damage_type = 1
    })
end
modifier_evo_nyx_mantis_bleed = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_bleed")},
    modifier_evo_nyx_mantis_bleed
)
____exports.modifier_evo_nyx_mantis_bleed = modifier_evo_nyx_mantis_bleed
____exports.modifier_evo_nyx_mantis_q_mark = __TS__Class()
local modifier_evo_nyx_mantis_q_mark = ____exports.modifier_evo_nyx_mantis_q_mark
modifier_evo_nyx_mantis_q_mark.name = "modifier_evo_nyx_mantis_q_mark"
__TS__ClassExtends(modifier_evo_nyx_mantis_q_mark, BaseModifier)
function modifier_evo_nyx_mantis_q_mark.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_q_mark.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_q_mark.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_q_mark.prototype.GetTexture(self)
    return "phantom_assassin_phantom_strike"
end
function modifier_evo_nyx_mantis_q_mark.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")}
end
function modifier_evo_nyx_mantis_q_mark.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not parent or parent:IsNull() or event.unit ~= parent or not caster or caster:IsNull() then
        return
    end
    local qAb = caster:FindAbilityByName("evo_nyx_mantis_q")
    if qAb and not qAb:IsNull() then
        local rem = qAb:GetCooldownTimeRemaining()
        if rem > 0 then
            qAb:EndCooldown()
            qAb:StartCooldown(rem * 0.3)
        end
    end
end
modifier_evo_nyx_mantis_q_mark = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_q_mark")},
    modifier_evo_nyx_mantis_q_mark
)
____exports.modifier_evo_nyx_mantis_q_mark = modifier_evo_nyx_mantis_q_mark
____exports.evo_nyx_mantis_w = __TS__Class()
local evo_nyx_mantis_w = ____exports.evo_nyx_mantis_w
evo_nyx_mantis_w.name = "evo_nyx_mantis_w"
__TS__ClassExtends(evo_nyx_mantis_w, BaseAbility)
function evo_nyx_mantis_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local level = self:GetLevel()
    local chitinMod = caster:FindModifierByName("modifier_evo_nyx_living_chitin")
    local plates = chitinMod and chitinMod:GetStackCount() or 0
    if chitinMod and plates > 0 then
        chitinMod:SetStackCount(0)
    end
    self:performSlash(caster, level, plates, 1)
    if level >= 3 then
        caster:SetContextThink(
            DoUniqueString("evo_nyx_mantis_w_second"),
            function()
                if not caster or caster:IsNull() or not IsValidEntity(caster) or not caster:IsAlive() then
                    return nil
                end
                self:performSlash(caster, level, 0, 0.5)
                return nil
            end,
            0.25
        )
    end
end
function evo_nyx_mantis_w.prototype.performSlash(self, caster, level, plates, mult)
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local agiPct = self:GetSpecialValueFor("agi_pct") / 100
    local silenceDur = self:GetSpecialValueFor("silence_duration")
    local burstPerPlate = self:GetSpecialValueFor("burst_per_plate")
    local creepMult = self:GetSpecialValueFor("creep_mult")
    caster:EmitSound("Hero_Riki.TricksOfTheTrade")
    local physDmg = (baseDmg + getAgi(nil, caster) * agiPct) * mult
    local plateBurst = plates * burstPerPlate
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
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
                goto __continue58
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = enemy:IsCreep() and physDmg * creepMult or physDmg,
                damage_type = 1
            })
            if plateBurst > 0 and enemy:IsAlive() then
                ApplyDamage({
                    victim = enemy,
                    attacker = caster,
                    ability = self,
                    damage = plateBurst,
                    damage_type = 4
                })
            end
            if mult == 1 and enemy:IsAlive() then
                enemy:AddNewModifier(caster, self, "modifier_silence", {duration = silenceDur})
                if level >= 2 then
                    enemy:AddNewModifier(caster, self, "modifier_evo_nyx_mantis_w_mark", {duration = 4})
                end
            end
        end
        ::__continue58::
    end
end
evo_nyx_mantis_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_w")},
    evo_nyx_mantis_w
)
____exports.evo_nyx_mantis_w = evo_nyx_mantis_w
____exports.modifier_evo_nyx_mantis_w_mark = __TS__Class()
local modifier_evo_nyx_mantis_w_mark = ____exports.modifier_evo_nyx_mantis_w_mark
modifier_evo_nyx_mantis_w_mark.name = "modifier_evo_nyx_mantis_w_mark"
__TS__ClassExtends(modifier_evo_nyx_mantis_w_mark, BaseModifier)
function modifier_evo_nyx_mantis_w_mark.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_mantis_w_mark.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_mantis_w_mark.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_mantis_w_mark.prototype.GetTexture(self)
    return "riki_tricks_of_the_trade"
end
function modifier_evo_nyx_mantis_w_mark.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE")
    }
end
function modifier_evo_nyx_mantis_w_mark.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
function modifier_evo_nyx_mantis_w_mark.prototype.GetModifierIncomingDamage_Percentage(self)
    return 12
end
modifier_evo_nyx_mantis_w_mark = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_w_mark")},
    modifier_evo_nyx_mantis_w_mark
)
____exports.modifier_evo_nyx_mantis_w_mark = modifier_evo_nyx_mantis_w_mark
____exports.evo_nyx_mantis_e = __TS__Class()
local evo_nyx_mantis_e = ____exports.evo_nyx_mantis_e
evo_nyx_mantis_e.name = "evo_nyx_mantis_e"
__TS__ClassExtends(evo_nyx_mantis_e, BaseAbility)
function evo_nyx_mantis_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_mantis_e_passive"
end
evo_nyx_mantis_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_mantis_e")},
    evo_nyx_mantis_e
)
____exports.evo_nyx_mantis_e = evo_nyx_mantis_e
____exports.modifier_evo_nyx_mantis_e_passive = __TS__Class()
local modifier_evo_nyx_mantis_e_passive = ____exports.modifier_evo_nyx_mantis_e_passive
modifier_evo_nyx_mantis_e_passive.name = "modifier_evo_nyx_mantis_e_passive"
__TS__ClassExtends(modifier_evo_nyx_mantis_e_passive, BaseModifier)
function modifier_evo_nyx_mantis_e_passive.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.critArmed = false
end
function modifier_evo_nyx_mantis_e_passive.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_mantis_e_passive.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_mantis_e_passive.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_mantis_e_passive.prototype.OnCreated(self)
    self.critArmed = false
end
function modifier_evo_nyx_mantis_e_passive.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_nyx_mantis_e_passive.prototype.GetModifierBonusStats_Agility(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or parent:PassivesDisabled() then
        return 0
    end
    return ab:GetSpecialValueFor("bonus_agi")
end
function modifier_evo_nyx_mantis_e_passive.prototype.GetModifierPreAttack_CriticalStrike(self)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or parent:PassivesDisabled() then
        return 0
    end
    local chance = ab:GetSpecialValueFor("crit_chance")
    if RollPercentage(chance) then
        self.critArmed = true
        return ab:GetSpecialValueFor("crit_mult")
    end
    self.critArmed = false
    return 0
end
function modifier_evo_nyx_mantis_e_passive.prototype.OnAttackLanded(self, event)
    if not IsServer() or not self.critArmed then
        return
    end
    self.critArmed = false
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or event.attacker ~= parent then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or target:IsBuilding() then
        return
    end
    applyLaceration(
        nil,
        parent,
        target,
        ab,
        28,
        4
    )
end
modifier_evo_nyx_mantis_e_passive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_mantis_e_passive")},
    modifier_evo_nyx_mantis_e_passive
)
____exports.modifier_evo_nyx_mantis_e_passive = modifier_evo_nyx_mantis_e_passive
return ____exports
