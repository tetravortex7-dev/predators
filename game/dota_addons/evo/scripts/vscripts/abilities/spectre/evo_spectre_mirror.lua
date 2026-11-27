local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 17,["26"] = 19,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 27,["39"] = 26,["40"] = 27,["42"] = 27,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 34,["47"] = 34,["48"] = 33,["49"] = 34,["51"] = 34,["52"] = 36,["53"] = 37,["54"] = 36,["55"] = 37,["56"] = 37,["57"] = 36,["58"] = 37,["60"] = 37,["61"] = 39,["62"] = 40,["63"] = 39,["64"] = 40,["65"] = 41,["66"] = 42,["67"] = 41,["68"] = 44,["69"] = 45,["70"] = 44,["71"] = 47,["72"] = 48,["73"] = 47,["74"] = 50,["75"] = 51,["76"] = 50,["77"] = 53,["78"] = 54,["79"] = 53,["80"] = 56,["81"] = 57,["82"] = 56,["83"] = 59,["84"] = 60,["87"] = 61,["88"] = 62,["89"] = 63,["92"] = 64,["93"] = 64,["94"] = 64,["95"] = 64,["96"] = 64,["97"] = 64,["98"] = 64,["99"] = 59,["100"] = 40,["101"] = 39,["102"] = 40,["104"] = 40,["105"] = 68,["106"] = 69,["107"] = 68,["108"] = 69,["110"] = 69,["111"] = 70,["112"] = 71,["113"] = 68,["114"] = 73,["115"] = 74,["116"] = 74,["117"] = 74,["118"] = 74,["119"] = 73,["120"] = 76,["121"] = 77,["124"] = 78,["125"] = 79,["126"] = 80,["127"] = 81,["128"] = 82,["129"] = 83,["131"] = 85,["132"] = 87,["133"] = 88,["134"] = 89,["135"] = 91,["136"] = 92,["137"] = 92,["138"] = 92,["139"] = 92,["140"] = 92,["141"] = 92,["142"] = 92,["143"] = 92,["144"] = 92,["145"] = 92,["146"] = 92,["147"] = 92,["148"] = 92,["149"] = 92,["150"] = 92,["151"] = 92,["152"] = 92,["153"] = 109,["154"] = 111,["155"] = 112,["156"] = 113,["157"] = 114,["158"] = 114,["159"] = 114,["160"] = 114,["161"] = 118,["162"] = 118,["163"] = 118,["164"] = 118,["165"] = 118,["166"] = 118,["167"] = 114,["168"] = 114,["169"] = 114,["170"] = 114,["171"] = 114,["173"] = 76,["174"] = 132,["175"] = 137,["176"] = 137,["178"] = 138,["179"] = 139,["180"] = 140,["181"] = 141,["183"] = 143,["184"] = 144,["185"] = 145,["186"] = 145,["188"] = 146,["189"] = 146,["191"] = 148,["192"] = 149,["193"] = 150,["194"] = 151,["195"] = 152,["196"] = 153,["197"] = 155,["198"] = 155,["199"] = 155,["200"] = 155,["201"] = 155,["202"] = 155,["203"] = 155,["204"] = 155,["205"] = 155,["206"] = 156,["207"] = 157,["208"] = 159,["209"] = 160,["210"] = 161,["211"] = 162,["212"] = 163,["214"] = 167,["215"] = 132,["216"] = 69,["217"] = 68,["218"] = 69,["220"] = 69,["221"] = 171,["222"] = 172,["223"] = 171,["224"] = 172,["226"] = 172,["227"] = 173,["228"] = 174,["229"] = 175,["230"] = 176,["231"] = 177,["232"] = 178,["233"] = 171,["234"] = 180,["235"] = 181,["236"] = 180,["237"] = 183,["238"] = 184,["239"] = 183,["240"] = 186,["241"] = 187,["242"] = 188,["243"] = 189,["244"] = 190,["245"] = 191,["246"] = 192,["247"] = 193,["248"] = 194,["249"] = 195,["250"] = 195,["251"] = 195,["252"] = 195,["254"] = 197,["257"] = 198,["258"] = 198,["259"] = 198,["260"] = 198,["261"] = 199,["262"] = 199,["263"] = 199,["264"] = 199,["265"] = 200,["266"] = 205,["267"] = 206,["268"] = 207,["269"] = 207,["270"] = 207,["271"] = 207,["272"] = 207,["273"] = 207,["274"] = 207,["275"] = 207,["276"] = 208,["277"] = 186,["278"] = 210,["279"] = 211,["280"] = 212,["281"] = 213,["282"] = 214,["283"] = 214,["285"] = 215,["286"] = 215,["287"] = 215,["288"] = 215,["289"] = 216,["290"] = 217,["291"] = 218,["292"] = 219,["293"] = 220,["294"] = 210,["295"] = 222,["296"] = 223,["299"] = 224,["300"] = 225,["301"] = 226,["302"] = 227,["305"] = 229,["306"] = 230,["308"] = 233,["309"] = 234,["312"] = 235,["313"] = 236,["314"] = 239,["315"] = 239,["316"] = 239,["317"] = 239,["318"] = 239,["319"] = 239,["321"] = 240,["322"] = 240,["324"] = 241,["325"] = 241,["327"] = 242,["328"] = 242,["329"] = 242,["330"] = 242,["331"] = 242,["332"] = 242,["333"] = 242,["337"] = 222,["338"] = 172,["339"] = 171,["340"] = 172,["342"] = 172,["343"] = 253,["344"] = 254,["345"] = 253,["346"] = 254,["348"] = 254,["349"] = 255,["350"] = 253,["351"] = 256,["352"] = 257,["353"] = 256,["354"] = 259,["355"] = 260,["356"] = 259,["357"] = 262,["358"] = 263,["359"] = 262,["360"] = 265,["361"] = 266,["362"] = 265,["363"] = 268,["364"] = 269,["365"] = 270,["366"] = 271,["367"] = 272,["368"] = 273,["369"] = 273,["372"] = 268,["373"] = 276,["374"] = 277,["375"] = 276,["376"] = 281,["377"] = 282,["378"] = 281,["379"] = 284,["380"] = 285,["381"] = 284,["382"] = 254,["383"] = 253,["384"] = 254,["386"] = 254,["387"] = 289,["388"] = 290,["389"] = 289,["390"] = 290,["391"] = 291,["392"] = 292,["393"] = 292,["394"] = 292,["395"] = 292,["396"] = 291,["397"] = 294,["398"] = 295,["401"] = 296,["402"] = 297,["403"] = 298,["404"] = 299,["405"] = 300,["406"] = 304,["407"] = 305,["409"] = 294,["410"] = 290,["411"] = 289,["412"] = 290,["414"] = 290,["415"] = 310,["416"] = 311,["417"] = 310,["418"] = 311,["420"] = 311,["421"] = 312,["422"] = 313,["423"] = 314,["424"] = 315,["425"] = 310,["426"] = 317,["427"] = 318,["428"] = 317,["429"] = 320,["430"] = 321,["431"] = 320,["432"] = 323,["433"] = 324,["434"] = 323,["435"] = 326,["436"] = 327,["437"] = 326,["438"] = 329,["439"] = 330,["440"] = 331,["441"] = 332,["442"] = 333,["443"] = 334,["444"] = 335,["445"] = 336,["446"] = 337,["447"] = 338,["448"] = 339,["450"] = 341,["451"] = 342,["453"] = 329,["454"] = 345,["455"] = 346,["456"] = 345,["457"] = 348,["458"] = 349,["459"] = 350,["460"] = 351,["462"] = 355,["463"] = 348,["464"] = 357,["465"] = 358,["466"] = 358,["467"] = 358,["468"] = 358,["469"] = 358,["470"] = 358,["471"] = 358,["472"] = 357,["473"] = 366,["474"] = 367,["475"] = 366,["476"] = 369,["477"] = 370,["478"] = 369,["479"] = 372,["480"] = 373,["481"] = 372,["482"] = 375,["483"] = 376,["484"] = 375,["485"] = 378,["486"] = 379,["489"] = 380,["490"] = 381,["491"] = 382,["492"] = 383,["495"] = 384,["498"] = 385,["501"] = 387,["502"] = 388,["503"] = 393,["504"] = 395,["505"] = 396,["506"] = 397,["507"] = 398,["508"] = 398,["509"] = 398,["510"] = 398,["511"] = 398,["512"] = 398,["514"] = 399,["515"] = 399,["517"] = 400,["518"] = 400,["519"] = 400,["520"] = 400,["521"] = 400,["522"] = 400,["523"] = 400,["527"] = 408,["528"] = 408,["529"] = 408,["530"] = 408,["531"] = 409,["532"] = 410,["533"] = 411,["536"] = 415,["537"] = 416,["538"] = 417,["539"] = 417,["540"] = 417,["541"] = 417,["542"] = 417,["543"] = 417,["544"] = 420,["545"] = 421,["546"] = 422,["547"] = 423,["548"] = 424,["549"] = 425,["550"] = 426,["551"] = 427,["552"] = 427,["557"] = 432,["558"] = 433,["559"] = 434,["560"] = 435,["563"] = 378,["564"] = 311,["565"] = 310,["566"] = 311,["568"] = 311});
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
____exports.evo_spectre_mirror_inversion_t3 = __TS__Class()
local evo_spectre_mirror_inversion_t3 = ____exports.evo_spectre_mirror_inversion_t3
evo_spectre_mirror_inversion_t3.name = "evo_spectre_mirror_inversion_t3"
__TS__ClassExtends(evo_spectre_mirror_inversion_t3, ____exports.evo_spectre_mirror_inversion)
evo_spectre_mirror_inversion_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion_t3")},
    evo_spectre_mirror_inversion_t3
)
____exports.evo_spectre_mirror_inversion_t3 = evo_spectre_mirror_inversion_t3
____exports.evo_spectre_mirror_inversion_t4 = __TS__Class()
local evo_spectre_mirror_inversion_t4 = ____exports.evo_spectre_mirror_inversion_t4
evo_spectre_mirror_inversion_t4.name = "evo_spectre_mirror_inversion_t4"
__TS__ClassExtends(evo_spectre_mirror_inversion_t4, ____exports.evo_spectre_mirror_inversion)
evo_spectre_mirror_inversion_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_inversion_t4")},
    evo_spectre_mirror_inversion_t4
)
____exports.evo_spectre_mirror_inversion_t4 = evo_spectre_mirror_inversion_t4
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
        EffectName = "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
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
