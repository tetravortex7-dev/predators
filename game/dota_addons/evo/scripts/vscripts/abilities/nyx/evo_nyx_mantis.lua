local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 20,["26"] = 21,["27"] = 22,["30"] = 26,["31"] = 27,["32"] = 26,["33"] = 30,["34"] = 31,["35"] = 35,["36"] = 36,["37"] = 36,["38"] = 36,["39"] = 36,["40"] = 37,["42"] = 30,["43"] = 41,["44"] = 42,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 44,["51"] = 45,["52"] = 46,["55"] = 48,["56"] = 49,["57"] = 50,["58"] = 51,["59"] = 52,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 53,["65"] = 53,["66"] = 53,["67"] = 54,["68"] = 55,["69"] = 57,["70"] = 58,["71"] = 43,["72"] = 42,["73"] = 41,["74"] = 42,["76"] = 42,["77"] = 67,["78"] = 68,["79"] = 67,["80"] = 68,["82"] = 68,["83"] = 69,["84"] = 70,["85"] = 71,["86"] = 72,["87"] = 67,["88"] = 74,["89"] = 75,["90"] = 74,["91"] = 77,["92"] = 78,["93"] = 77,["94"] = 80,["95"] = 81,["96"] = 81,["97"] = 81,["98"] = 81,["99"] = 80,["100"] = 86,["101"] = 87,["102"] = 88,["103"] = 89,["104"] = 90,["105"] = 91,["108"] = 92,["109"] = 86,["110"] = 94,["111"] = 95,["114"] = 96,["115"] = 97,["116"] = 98,["117"] = 99,["120"] = 103,["121"] = 104,["122"] = 105,["123"] = 106,["124"] = 107,["125"] = 109,["126"] = 110,["127"] = 111,["128"] = 112,["129"] = 113,["130"] = 114,["131"] = 115,["132"] = 116,["133"] = 118,["134"] = 118,["135"] = 118,["136"] = 118,["137"] = 118,["138"] = 118,["139"] = 118,["140"] = 118,["141"] = 118,["142"] = 118,["143"] = 118,["144"] = 129,["146"] = 130,["147"] = 130,["149"] = 131,["150"] = 132,["151"] = 132,["153"] = 133,["154"] = 135,["155"] = 136,["156"] = 137,["157"] = 138,["159"] = 140,["160"] = 141,["162"] = 143,["163"] = 143,["164"] = 143,["165"] = 143,["166"] = 143,["167"] = 143,["168"] = 143,["169"] = 150,["170"] = 150,["171"] = 150,["172"] = 150,["173"] = 150,["174"] = 150,["175"] = 150,["176"] = 150,["180"] = 94,["181"] = 153,["182"] = 154,["185"] = 155,["186"] = 156,["187"] = 157,["188"] = 157,["189"] = 157,["190"] = 157,["191"] = 157,["193"] = 153,["194"] = 68,["195"] = 67,["196"] = 68,["198"] = 68,["199"] = 162,["200"] = 163,["201"] = 162,["202"] = 163,["204"] = 163,["205"] = 164,["206"] = 162,["207"] = 166,["208"] = 167,["209"] = 166,["210"] = 169,["211"] = 170,["212"] = 169,["213"] = 172,["214"] = 173,["215"] = 172,["216"] = 175,["217"] = 176,["218"] = 175,["219"] = 178,["220"] = 179,["221"] = 180,["224"] = 181,["225"] = 178,["226"] = 183,["227"] = 184,["230"] = 185,["231"] = 186,["233"] = 183,["234"] = 189,["235"] = 190,["238"] = 191,["239"] = 192,["240"] = 193,["243"] = 194,["246"] = 196,["247"] = 196,["248"] = 196,["249"] = 196,["250"] = 197,["251"] = 197,["252"] = 197,["253"] = 197,["254"] = 197,["255"] = 197,["256"] = 197,["257"] = 189,["258"] = 163,["259"] = 162,["260"] = 163,["262"] = 163,["263"] = 207,["264"] = 208,["265"] = 207,["266"] = 208,["267"] = 209,["268"] = 210,["269"] = 209,["270"] = 212,["271"] = 213,["272"] = 212,["273"] = 215,["274"] = 216,["275"] = 215,["276"] = 218,["277"] = 219,["278"] = 218,["279"] = 221,["280"] = 222,["281"] = 221,["282"] = 224,["283"] = 225,["286"] = 226,["287"] = 227,["288"] = 228,["291"] = 229,["292"] = 230,["293"] = 231,["294"] = 232,["295"] = 233,["296"] = 234,["299"] = 224,["300"] = 208,["301"] = 207,["302"] = 208,["304"] = 208,["305"] = 240,["306"] = 241,["307"] = 240,["308"] = 241,["309"] = 242,["310"] = 243,["313"] = 244,["314"] = 245,["317"] = 247,["318"] = 248,["319"] = 249,["320"] = 250,["321"] = 251,["323"] = 254,["324"] = 255,["325"] = 256,["326"] = 256,["327"] = 258,["328"] = 259,["329"] = 259,["331"] = 260,["332"] = 261,["333"] = 256,["334"] = 256,["335"] = 256,["337"] = 242,["338"] = 268,["339"] = 269,["340"] = 270,["341"] = 271,["342"] = 272,["343"] = 273,["344"] = 274,["345"] = 276,["346"] = 277,["347"] = 278,["348"] = 280,["349"] = 280,["350"] = 280,["351"] = 280,["352"] = 280,["353"] = 280,["354"] = 280,["355"] = 280,["356"] = 280,["357"] = 280,["358"] = 280,["359"] = 291,["361"] = 292,["362"] = 292,["364"] = 293,["365"] = 293,["366"] = 293,["367"] = 293,["368"] = 293,["369"] = 293,["370"] = 293,["371"] = 300,["372"] = 301,["373"] = 301,["374"] = 301,["375"] = 301,["376"] = 301,["377"] = 301,["378"] = 301,["380"] = 309,["381"] = 310,["382"] = 311,["383"] = 312,["389"] = 268,["390"] = 241,["391"] = 240,["392"] = 241,["394"] = 241,["395"] = 319,["396"] = 320,["397"] = 319,["398"] = 320,["399"] = 321,["400"] = 322,["401"] = 321,["402"] = 324,["403"] = 325,["404"] = 324,["405"] = 327,["406"] = 328,["407"] = 327,["408"] = 330,["409"] = 331,["410"] = 330,["411"] = 333,["412"] = 334,["413"] = 334,["414"] = 334,["415"] = 334,["416"] = 333,["417"] = 339,["418"] = 340,["419"] = 339,["420"] = 342,["421"] = 343,["422"] = 342,["423"] = 320,["424"] = 319,["425"] = 320,["427"] = 320,["428"] = 347,["429"] = 348,["430"] = 347,["431"] = 348,["432"] = 349,["433"] = 350,["434"] = 349,["435"] = 348,["436"] = 347,["437"] = 348,["439"] = 348,["440"] = 354,["441"] = 355,["442"] = 354,["443"] = 355,["445"] = 355,["446"] = 356,["447"] = 354,["448"] = 358,["449"] = 359,["450"] = 358,["451"] = 361,["452"] = 362,["453"] = 361,["454"] = 364,["455"] = 365,["456"] = 364,["457"] = 367,["458"] = 368,["459"] = 367,["460"] = 370,["461"] = 371,["462"] = 371,["463"] = 371,["464"] = 371,["465"] = 371,["466"] = 370,["467"] = 377,["468"] = 378,["469"] = 379,["470"] = 380,["471"] = 380,["473"] = 381,["474"] = 377,["475"] = 383,["476"] = 384,["477"] = 384,["479"] = 385,["480"] = 386,["481"] = 387,["482"] = 387,["484"] = 388,["485"] = 389,["486"] = 390,["487"] = 391,["489"] = 393,["490"] = 394,["491"] = 383,["492"] = 396,["493"] = 397,["496"] = 398,["497"] = 399,["498"] = 400,["499"] = 401,["500"] = 402,["503"] = 403,["506"] = 404,["507"] = 404,["508"] = 404,["509"] = 404,["510"] = 404,["511"] = 404,["512"] = 404,["513"] = 404,["514"] = 396,["515"] = 355,["516"] = 354,["517"] = 355,["519"] = 355});
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
if IsServer() then
    for ____, modName in ipairs(MANTIS_MODS) do
        LinkLuaModifier(modName, SCRIPT_PATH, 0)
    end
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
                goto __continue19
            end
            local id = enemy:entindex()
            if self.hitSet:has(id) then
                goto __continue19
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
        ::__continue19::
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
                goto __continue59
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
        ::__continue59::
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
