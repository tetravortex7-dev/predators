local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 17,["26"] = 19,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 27,["39"] = 26,["40"] = 27,["42"] = 27,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 35,["50"] = 38,["51"] = 39,["52"] = 38,["53"] = 41,["54"] = 42,["55"] = 41,["56"] = 44,["57"] = 45,["58"] = 44,["59"] = 47,["60"] = 48,["61"] = 47,["62"] = 50,["63"] = 51,["64"] = 50,["65"] = 53,["66"] = 54,["69"] = 55,["70"] = 56,["71"] = 57,["74"] = 58,["75"] = 58,["76"] = 58,["77"] = 58,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 53,["82"] = 34,["83"] = 33,["84"] = 34,["86"] = 34,["87"] = 62,["88"] = 63,["89"] = 62,["90"] = 63,["92"] = 63,["93"] = 64,["94"] = 65,["95"] = 62,["96"] = 67,["97"] = 68,["98"] = 68,["99"] = 68,["100"] = 68,["101"] = 67,["102"] = 70,["103"] = 71,["106"] = 72,["107"] = 73,["108"] = 74,["109"] = 75,["110"] = 76,["111"] = 77,["113"] = 79,["114"] = 81,["115"] = 82,["116"] = 83,["117"] = 85,["118"] = 86,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 86,["123"] = 86,["124"] = 86,["125"] = 86,["126"] = 86,["127"] = 86,["128"] = 86,["129"] = 86,["130"] = 86,["131"] = 86,["132"] = 86,["133"] = 86,["134"] = 86,["135"] = 103,["136"] = 105,["137"] = 106,["138"] = 107,["139"] = 108,["140"] = 108,["141"] = 108,["142"] = 108,["143"] = 112,["144"] = 112,["145"] = 112,["146"] = 112,["147"] = 112,["148"] = 112,["149"] = 108,["150"] = 108,["151"] = 108,["152"] = 108,["153"] = 108,["155"] = 70,["156"] = 126,["157"] = 131,["158"] = 131,["160"] = 132,["161"] = 133,["162"] = 134,["163"] = 135,["165"] = 137,["166"] = 138,["167"] = 139,["168"] = 139,["170"] = 140,["171"] = 140,["173"] = 142,["174"] = 143,["175"] = 144,["176"] = 145,["177"] = 146,["178"] = 147,["179"] = 149,["180"] = 149,["181"] = 149,["182"] = 149,["183"] = 149,["184"] = 149,["185"] = 149,["186"] = 149,["187"] = 149,["188"] = 150,["189"] = 151,["190"] = 153,["191"] = 154,["192"] = 155,["193"] = 156,["194"] = 157,["196"] = 161,["197"] = 126,["198"] = 63,["199"] = 62,["200"] = 63,["202"] = 63,["203"] = 165,["204"] = 166,["205"] = 165,["206"] = 166,["208"] = 166,["209"] = 167,["210"] = 168,["211"] = 169,["212"] = 170,["213"] = 171,["214"] = 172,["215"] = 165,["216"] = 174,["217"] = 175,["218"] = 174,["219"] = 177,["220"] = 178,["221"] = 177,["222"] = 180,["223"] = 181,["224"] = 182,["225"] = 183,["226"] = 184,["227"] = 185,["228"] = 186,["229"] = 187,["230"] = 188,["231"] = 189,["232"] = 189,["233"] = 189,["234"] = 189,["236"] = 191,["239"] = 192,["240"] = 192,["241"] = 192,["242"] = 192,["243"] = 193,["244"] = 193,["245"] = 193,["246"] = 193,["247"] = 194,["248"] = 199,["249"] = 200,["250"] = 201,["251"] = 201,["252"] = 201,["253"] = 201,["254"] = 201,["255"] = 201,["256"] = 201,["257"] = 201,["258"] = 202,["259"] = 180,["260"] = 204,["261"] = 205,["262"] = 206,["263"] = 207,["264"] = 208,["265"] = 208,["267"] = 209,["268"] = 209,["269"] = 209,["270"] = 209,["271"] = 210,["272"] = 211,["273"] = 212,["274"] = 213,["275"] = 214,["276"] = 204,["277"] = 216,["278"] = 217,["281"] = 218,["282"] = 219,["283"] = 220,["284"] = 221,["287"] = 223,["288"] = 224,["290"] = 227,["291"] = 228,["294"] = 229,["295"] = 230,["296"] = 233,["297"] = 233,["298"] = 233,["299"] = 233,["300"] = 233,["301"] = 233,["303"] = 234,["304"] = 234,["306"] = 235,["307"] = 235,["309"] = 236,["310"] = 236,["311"] = 236,["312"] = 236,["313"] = 236,["314"] = 236,["315"] = 236,["319"] = 216,["320"] = 166,["321"] = 165,["322"] = 166,["324"] = 166,["325"] = 247,["326"] = 248,["327"] = 247,["328"] = 248,["330"] = 248,["331"] = 249,["332"] = 247,["333"] = 250,["334"] = 251,["335"] = 250,["336"] = 253,["337"] = 254,["338"] = 253,["339"] = 256,["340"] = 257,["341"] = 256,["342"] = 259,["343"] = 260,["344"] = 259,["345"] = 262,["346"] = 263,["347"] = 264,["348"] = 265,["349"] = 266,["350"] = 267,["351"] = 267,["354"] = 262,["355"] = 270,["356"] = 271,["357"] = 270,["358"] = 275,["359"] = 276,["360"] = 275,["361"] = 278,["362"] = 279,["363"] = 278,["364"] = 248,["365"] = 247,["366"] = 248,["368"] = 248,["369"] = 283,["370"] = 284,["371"] = 283,["372"] = 284,["373"] = 285,["374"] = 286,["375"] = 286,["376"] = 286,["377"] = 286,["378"] = 285,["379"] = 288,["380"] = 289,["383"] = 290,["384"] = 291,["385"] = 292,["386"] = 293,["387"] = 294,["388"] = 298,["389"] = 299,["391"] = 288,["392"] = 284,["393"] = 283,["394"] = 284,["396"] = 284,["397"] = 304,["398"] = 305,["399"] = 304,["400"] = 305,["402"] = 305,["403"] = 306,["404"] = 307,["405"] = 308,["406"] = 309,["407"] = 304,["408"] = 311,["409"] = 312,["410"] = 311,["411"] = 314,["412"] = 315,["413"] = 314,["414"] = 317,["415"] = 318,["416"] = 317,["417"] = 320,["418"] = 321,["419"] = 320,["420"] = 323,["421"] = 324,["422"] = 325,["423"] = 326,["424"] = 327,["425"] = 328,["426"] = 329,["427"] = 330,["428"] = 331,["429"] = 332,["430"] = 333,["432"] = 335,["433"] = 336,["435"] = 323,["436"] = 339,["437"] = 340,["438"] = 339,["439"] = 342,["440"] = 343,["441"] = 344,["442"] = 345,["444"] = 349,["445"] = 342,["446"] = 351,["447"] = 352,["448"] = 352,["449"] = 352,["450"] = 352,["451"] = 352,["452"] = 352,["453"] = 352,["454"] = 351,["455"] = 360,["456"] = 361,["457"] = 360,["458"] = 363,["459"] = 364,["460"] = 363,["461"] = 366,["462"] = 367,["463"] = 366,["464"] = 369,["465"] = 370,["466"] = 369,["467"] = 372,["468"] = 373,["471"] = 374,["472"] = 375,["473"] = 376,["474"] = 377,["477"] = 378,["480"] = 379,["483"] = 381,["484"] = 382,["485"] = 387,["486"] = 389,["487"] = 390,["488"] = 391,["489"] = 392,["490"] = 392,["491"] = 392,["492"] = 392,["493"] = 392,["494"] = 392,["496"] = 393,["497"] = 393,["499"] = 394,["500"] = 394,["501"] = 394,["502"] = 394,["503"] = 394,["504"] = 394,["505"] = 394,["509"] = 402,["510"] = 402,["511"] = 402,["512"] = 402,["513"] = 403,["514"] = 404,["515"] = 405,["518"] = 409,["519"] = 410,["520"] = 411,["521"] = 411,["522"] = 411,["523"] = 411,["524"] = 411,["525"] = 411,["526"] = 414,["527"] = 415,["528"] = 416,["529"] = 417,["530"] = 418,["531"] = 419,["532"] = 420,["533"] = 421,["534"] = 421,["539"] = 426,["540"] = 427,["541"] = 428,["542"] = 429,["545"] = 372,["546"] = 305,["547"] = 304,["548"] = 305,["550"] = 305});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_spectre_shared = require("abilities.spectre.evo_spectre_shared")
local applySpectreCreepDamage = ____evo_spectre_shared.applySpectreCreepDamage
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreInt = ____evo_spectre_shared.getSpectreInt
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
local triggerAstralInversionReflect = ____evo_spectre_shared.triggerAstralInversionReflect
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror"
LinkLuaModifier("modifier_evo_spectre_mirror_inversion", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_rift", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_phase", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_w_buff", SCRIPT_PATH, 0)
____exports.evo_spectre_mirror_inversion = __TS__Class()
local evo_spectre_mirror_inversion = ____exports.evo_spectre_mirror_inversion
evo_spectre_mirror_inversion.name = "evo_spectre_mirror_inversion"
__TS__ClassExtends(evo_spectre_mirror_inversion, BaseAbility)
function evo_spectre_mirror_inversion.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_spectre_mirror_inversion"
end
evo_spectre_mirror_inversion = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion")},
    evo_spectre_mirror_inversion
)
____exports.evo_spectre_mirror_inversion = evo_spectre_mirror_inversion
____exports.modifier_evo_spectre_mirror_inversion = __TS__Class()
local modifier_evo_spectre_mirror_inversion = ____exports.modifier_evo_spectre_mirror_inversion
modifier_evo_spectre_mirror_inversion.name = "modifier_evo_spectre_mirror_inversion"
__TS__ClassExtends(modifier_evo_spectre_mirror_inversion, BaseModifier)
function modifier_evo_spectre_mirror_inversion.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_spectre_mirror_inversion.prototype.GetTexture(self)
    return "spectre_dispersion"
end
function modifier_evo_spectre_mirror_inversion.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")}
end
function modifier_evo_spectre_mirror_inversion.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not ab or ab:IsNull() or parent:PassivesDisabled() then
        return
    end
    triggerAstralInversionReflect(
        nil,
        parent,
        parent,
        ab,
        event
    )
end
modifier_evo_spectre_mirror_inversion = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_inversion")},
    modifier_evo_spectre_mirror_inversion
)
____exports.modifier_evo_spectre_mirror_inversion = modifier_evo_spectre_mirror_inversion
____exports.evo_spectre_mirror_q = __TS__Class()
local evo_spectre_mirror_q = ____exports.evo_spectre_mirror_q
evo_spectre_mirror_q.name = "evo_spectre_mirror_q"
__TS__ClassExtends(evo_spectre_mirror_q, BaseAbility)
function evo_spectre_mirror_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.hitSets = {}
    self.silencedFirst = __TS__New(Set)
end
function evo_spectre_mirror_q.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_mirror_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local dir = self:GetCursorPosition() - origin
    dir.z = 0
    if dir:Length2D() < 1 then
        dir = caster:GetForwardVector()
    end
    dir = dir:Normalized()
    local range = self:GetSpecialValueFor("range")
    local width = self:GetSpecialValueFor("width")
    local speed = self:GetSpecialValueFor("speed")
    caster:EmitSound("Hero_VoidSpirit.AetherRemnant.Cast")
    local projId = ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_spectre/spectre_spectral_dagger.vpcf",
        vSpawnOrigin = origin,
        fDistance = range,
        fStartRadius = width,
        fEndRadius = width,
        Source = caster,
        bHasFrontalCone = false,
        iUnitTargetTeam = 2,
        iUnitTargetFlags = 0,
        iUnitTargetType = 1 + 18,
        vVelocity = dir * speed,
        bProvidesVision = true,
        iVisionRadius = 220,
        iVisionTeamNumber = caster:GetTeamNumber()
    })
    self.hitSets[projId] = __TS__New(Set)
    if getSpectreTier(nil, caster) >= 4 then
        local riftDur = self:GetSpecialValueFor("rift_duration")
        local midPoint = GetGroundPosition(origin + dir * (range * 0.5), caster)
        CreateModifierThinker(
            caster,
            self,
            "modifier_evo_spectre_mirror_q_rift",
            {
                duration = riftDur,
                x0 = origin.x,
                y0 = origin.y,
                x1 = origin.x + dir.x * range,
                y1 = origin.y + dir.y * range
            },
            midPoint,
            caster:GetTeamNumber(),
            false
        )
    end
end
function evo_spectre_mirror_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.hitSets, projectileHandle)
        self.silencedFirst:delete(projectileHandle)
        return false
    end
    local set = self.hitSets[projectileHandle]
    local idx = target:GetEntityIndex()
    if set ~= nil and set:has(idx) then
        return false
    end
    if set ~= nil then
        set:add(idx)
    end
    local caster = self:GetCaster()
    local tier = getSpectreTier(nil, caster)
    local dmg = self:GetSpecialValueFor("base_damage") + getSpectreInt(nil, caster) * self:GetSpecialValueFor("int_pct") / 100
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local slowDur = self:GetSpecialValueFor("slow_duration")
    local polDur = self:GetSpecialValueFor("polarity_dur")
    applySpectreCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        2,
        creepMult
    )
    target:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_q_slow", {duration = slowDur})
    target:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_polarity", {duration = polDur})
    if tier >= 3 and not self.silencedFirst:has(projectileHandle) then
        self.silencedFirst:add(projectileHandle)
        local silDur = tier >= 4 and 1.4 or 1.1
        target:AddNewModifier(caster, self, "modifier_silence", {duration = silDur})
        target:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_mr_shred", {duration = polDur})
    end
    return false
end
evo_spectre_mirror_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_q")},
    evo_spectre_mirror_q
)
____exports.evo_spectre_mirror_q = evo_spectre_mirror_q
____exports.modifier_evo_spectre_mirror_q_rift = __TS__Class()
local modifier_evo_spectre_mirror_q_rift = ____exports.modifier_evo_spectre_mirror_q_rift
modifier_evo_spectre_mirror_q_rift.name = "modifier_evo_spectre_mirror_q_rift"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_rift, BaseModifier)
function modifier_evo_spectre_mirror_q_rift.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.x0 = 0
    self.y0 = 0
    self.x1 = 0
    self.y1 = 0
    self.width = 180
    self.accum = 0
end
function modifier_evo_spectre_mirror_q_rift.prototype.IsHidden(self)
    return true
end
function modifier_evo_spectre_mirror_q_rift.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_mirror_q_rift.prototype.OnCreated(self, params)
    self.x0 = params and params.x0 or 0
    self.y0 = params and params.y0 or 0
    self.x1 = params and params.x1 or 0
    self.y1 = params and params.y1 or 0
    self.width = 180
    self.accum = 0
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.width = math.max(
            160,
            ab:GetSpecialValueFor("width") + 20
        )
    end
    if not IsServer() then
        return
    end
    local p0 = GetGroundPosition(
        Vector(self.x0, self.y0, 0),
        self:GetParent()
    )
    local p1 = GetGroundPosition(
        Vector(self.x1, self.y1, 0),
        self:GetParent()
    )
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, p0)
    ParticleManager:SetParticleControl(pfx, 1, p1)
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
    self:StartIntervalThink(0.25)
end
function modifier_evo_spectre_mirror_q_rift.prototype.isNearSegment(self, pos)
    local vx = self.x1 - self.x0
    local vy = self.y1 - self.y0
    local lenSq = vx * vx + vy * vy
    if lenSq <= 1 then
        return false
    end
    local t = math.max(
        0,
        math.min(1, ((pos.x - self.x0) * vx + (pos.y - self.y0) * vy) / lenSq)
    )
    local px = self.x0 + t * vx
    local py = self.y0 + t * vy
    local dx = pos.x - px
    local dy = pos.y - py
    return dx * dx + dy * dy <= self.width * self.width
end
function modifier_evo_spectre_mirror_q_rift.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    local thinker = self:GetParent()
    if not caster or caster:IsNull() or not ab or ab:IsNull() or not thinker or thinker:IsNull() then
        return
    end
    if caster:IsAlive() and self:isNearSegment(caster:GetAbsOrigin()) then
        caster:AddNewModifier(caster, ab, "modifier_evo_spectre_mirror_q_phase", {duration = 0.35})
    end
    self.accum = self.accum + 0.25
    if self.accum < 0.5 then
        return
    end
    self.accum = self.accum - 0.5
    local halfDps = (ab:GetSpecialValueFor("rift_dps") + getSpectreInt(nil, caster) * ab:GetSpecialValueFor("rift_int_pct") / 100) * 0.5
    for ____, enemy in ipairs(findSpectreEnemies(
        nil,
        caster,
        thinker:GetAbsOrigin(),
        700
    )) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue35
            end
            if not self:isNearSegment(enemy:GetAbsOrigin()) then
                goto __continue35
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = halfDps,
                damage_type = 2
            })
        end
        ::__continue35::
    end
end
modifier_evo_spectre_mirror_q_rift = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_q_rift")},
    modifier_evo_spectre_mirror_q_rift
)
____exports.modifier_evo_spectre_mirror_q_rift = modifier_evo_spectre_mirror_q_rift
____exports.modifier_evo_spectre_mirror_q_phase = __TS__Class()
local modifier_evo_spectre_mirror_q_phase = ____exports.modifier_evo_spectre_mirror_q_phase
modifier_evo_spectre_mirror_q_phase.name = "modifier_evo_spectre_mirror_q_phase"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_phase, BaseModifier)
function modifier_evo_spectre_mirror_q_phase.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 30
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_mirror_q_phase.prototype.GetTexture(self)
    return "void_spirit_aether_remnant"
end
function modifier_evo_spectre_mirror_q_phase.prototype.OnCreated(self)
    self.msPct = 30
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local v = ab:GetSpecialValueFor("rift_ms_pct")
        if v > 0 then
            self.msPct = v
        end
    end
end
function modifier_evo_spectre_mirror_q_phase.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true}
end
function modifier_evo_spectre_mirror_q_phase.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_spectre_mirror_q_phase.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.msPct
end
modifier_evo_spectre_mirror_q_phase = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_q_phase")},
    modifier_evo_spectre_mirror_q_phase
)
____exports.modifier_evo_spectre_mirror_q_phase = modifier_evo_spectre_mirror_q_phase
____exports.evo_spectre_mirror_w = __TS__Class()
local evo_spectre_mirror_w = ____exports.evo_spectre_mirror_w
evo_spectre_mirror_w.name = "evo_spectre_mirror_w"
__TS__ClassExtends(evo_spectre_mirror_w, BaseAbility)
function evo_spectre_mirror_w.prototype.GetMaxLevel(self)
    return getSpectreBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_spectre_mirror_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("duration")
    local charges = getSpectreTier(nil, caster) >= 4 and 4 or self:GetSpecialValueFor("charges")
    caster:EmitSound("Hero_ObsidianDestroyer.ArcaneOrb.Impact")
    local mod = caster:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_w_buff", {duration = dur, charges = charges})
    if mod ~= nil then
        mod:SetStackCount(charges)
    end
end
evo_spectre_mirror_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_w")},
    evo_spectre_mirror_w
)
____exports.evo_spectre_mirror_w = evo_spectre_mirror_w
____exports.modifier_evo_spectre_mirror_w_buff = __TS__Class()
local modifier_evo_spectre_mirror_w_buff = ____exports.modifier_evo_spectre_mirror_w_buff
modifier_evo_spectre_mirror_w_buff.name = "modifier_evo_spectre_mirror_w_buff"
__TS__ClassExtends(modifier_evo_spectre_mirror_w_buff, BaseModifier)
function modifier_evo_spectre_mirror_w_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonusAs = 50
    self.bonusRange = 125
    self.bonusDmg = 40
    self.hitSequence = 0
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetTexture(self)
    return "obsidian_destroyer_arcane_orb"
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnCreated(self, params)
    self.bonusAs = 50
    self.bonusRange = 125
    self.bonusDmg = 40
    self.hitSequence = 0
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if ab and not ab:IsNull() and parent and not parent:IsNull() then
        self.bonusAs = ab:GetSpecialValueFor("bonus_as")
        self.bonusRange = ab:GetSpecialValueFor("bonus_range")
        self.bonusDmg = ab:GetSpecialValueFor("bonus_dmg") + getSpectreInt(nil, parent) * ab:GetSpecialValueFor("int_pct") / 100
    end
    if IsServer() and params and params.charges ~= nil then
        self:SetStackCount(params.charges)
    end
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_spectre_mirror_w_buff.prototype.CheckState(self)
    local parent = self:GetParent()
    if parent and not parent:IsNull() and getSpectreTier(nil, parent) >= 3 then
        return {[dotaModifierState(nil, "MODIFIER_STATE_CANNOT_MISS")] = true}
    end
    return {}
end
function modifier_evo_spectre_mirror_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_OVERRIDE_ATTACK_MAGICAL"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.bonusAs
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierAttackRangeBonus(self)
    return self.bonusRange
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetOverrideAttackMagical(self)
    return 1
end
function modifier_evo_spectre_mirror_w_buff.prototype.GetModifierProcAttack_BonusDamage_Magical(self)
    return self.bonusDmg
end
function modifier_evo_spectre_mirror_w_buff.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ab = self:GetAbility()
    local target = event.target
    if not parent or parent:IsNull() or not ab or ab:IsNull() or event.attacker ~= parent then
        return
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() then
        return
    end
    local tier = getSpectreTier(nil, parent)
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_arcane_orb_hit.vpcf", 1, target)
    ParticleManager:ReleaseParticleIndex(pfx)
    if tier >= 3 then
        local cleaveRadius = ab:GetSpecialValueFor("cleave_radius")
        local cleaveDmg = (event.damage + self.bonusDmg) * ab:GetSpecialValueFor("cleave_pct") / 100
        for ____, other in ipairs(findSpectreEnemies(
            nil,
            parent,
            target:GetAbsOrigin(),
            cleaveRadius
        )) do
            do
                if not other or other:IsNull() or not other:IsAlive() or other == target then
                    goto __continue74
                end
                ApplyDamage({
                    victim = other,
                    attacker = parent,
                    ability = ab,
                    damage = cleaveDmg,
                    damage_type = 2
                })
            end
            ::__continue74::
        end
        local steal = math.min(
            target:GetMana(),
            ab:GetSpecialValueFor("mana_steal")
        )
        if steal > 0 then
            target:Script_ReduceMana(steal, ab)
            parent:GiveMana(steal)
        end
    end
    self.hitSequence = self.hitSequence + 1
    if tier >= 4 and self.hitSequence % 4 == 0 then
        target:AddNewModifier(
            parent,
            ab,
            "modifier_stunned",
            {duration = ab:GetSpecialValueFor("stun_duration")}
        )
        local qAb = parent:FindAbilityByName("evo_spectre_mirror_q")
        local reduce = ab:GetSpecialValueFor("q_cd_reduce")
        if qAb and not qAb:IsNull() and reduce > 0 then
            local rem = qAb:GetCooldownTimeRemaining()
            if rem > 0 then
                qAb:EndCooldown()
                local next = rem - reduce
                if next > 0.05 then
                    qAb:StartCooldown(next)
                end
            end
        end
    end
    if not parent:HasModifier("modifier_evo_spectre_mirror_r_aura") then
        self:DecrementStackCount()
        if self:GetStackCount() <= 0 then
            self:Destroy()
        end
    end
end
modifier_evo_spectre_mirror_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_w_buff")},
    modifier_evo_spectre_mirror_w_buff
)
____exports.modifier_evo_spectre_mirror_w_buff = modifier_evo_spectre_mirror_w_buff
return ____exports
