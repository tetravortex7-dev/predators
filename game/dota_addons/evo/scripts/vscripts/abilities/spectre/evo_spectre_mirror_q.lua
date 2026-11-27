local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 17,["26"] = 19,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 35,["31"] = 39,["32"] = 42,["33"] = 43,["35"] = 47,["36"] = 35,["37"] = 50,["38"] = 51,["39"] = 50,["40"] = 51,["42"] = 51,["43"] = 52,["44"] = 53,["45"] = 54,["46"] = 55,["47"] = 50,["48"] = 57,["49"] = 58,["50"] = 58,["52"] = 59,["53"] = 59,["55"] = 60,["56"] = 60,["58"] = 61,["59"] = 61,["61"] = 57,["62"] = 64,["63"] = 65,["64"] = 65,["65"] = 65,["66"] = 65,["67"] = 64,["68"] = 68,["69"] = 69,["72"] = 70,["73"] = 71,["74"] = 72,["75"] = 73,["76"] = 74,["77"] = 75,["78"] = 75,["79"] = 75,["80"] = 75,["81"] = 76,["82"] = 77,["83"] = 78,["84"] = 80,["85"] = 82,["86"] = 87,["87"] = 88,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 88,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 89,["96"] = 89,["97"] = 91,["98"] = 92,["99"] = 93,["100"] = 94,["102"] = 97,["103"] = 98,["104"] = 98,["105"] = 98,["106"] = 98,["107"] = 98,["108"] = 98,["109"] = 98,["110"] = 98,["111"] = 98,["112"] = 98,["113"] = 98,["114"] = 98,["115"] = 110,["116"] = 111,["117"] = 112,["118"] = 113,["121"] = 117,["122"] = 118,["123"] = 119,["124"] = 120,["125"] = 120,["126"] = 120,["127"] = 120,["128"] = 120,["129"] = 120,["130"] = 120,["131"] = 120,["132"] = 120,["133"] = 120,["134"] = 120,["135"] = 120,["136"] = 120,["137"] = 120,["138"] = 120,["139"] = 120,["140"] = 120,["141"] = 137,["142"] = 138,["143"] = 139,["144"] = 140,["145"] = 68,["146"] = 143,["147"] = 144,["150"] = 145,["151"] = 146,["152"] = 147,["155"] = 148,["157"] = 151,["158"] = 153,["159"] = 154,["160"] = 155,["161"] = 157,["162"] = 158,["163"] = 158,["164"] = 158,["165"] = 158,["166"] = 158,["167"] = 158,["168"] = 158,["169"] = 158,["170"] = 158,["171"] = 159,["172"] = 160,["173"] = 161,["175"] = 143,["176"] = 165,["177"] = 166,["178"] = 167,["179"] = 168,["180"] = 169,["181"] = 165,["182"] = 172,["183"] = 173,["186"] = 174,["187"] = 175,["188"] = 176,["191"] = 177,["192"] = 180,["195"] = 182,["196"] = 183,["197"] = 184,["198"] = 185,["200"] = 188,["201"] = 189,["202"] = 190,["203"] = 191,["204"] = 192,["205"] = 193,["206"] = 193,["207"] = 193,["208"] = 193,["211"] = 197,["212"] = 198,["213"] = 199,["214"] = 200,["215"] = 201,["218"] = 172,["219"] = 206,["220"] = 211,["221"] = 211,["223"] = 212,["224"] = 213,["225"] = 214,["226"] = 215,["227"] = 216,["228"] = 217,["230"] = 220,["231"] = 221,["232"] = 222,["233"] = 223,["235"] = 226,["236"] = 227,["237"] = 228,["238"] = 229,["239"] = 229,["240"] = 229,["241"] = 229,["243"] = 231,["244"] = 232,["246"] = 235,["247"] = 236,["248"] = 237,["249"] = 237,["250"] = 237,["251"] = 237,["253"] = 239,["254"] = 241,["255"] = 242,["256"] = 243,["258"] = 245,["259"] = 206,["260"] = 51,["261"] = 50,["262"] = 51,["264"] = 51,["265"] = 249,["266"] = 250,["267"] = 249,["268"] = 250,["269"] = 250,["270"] = 249,["271"] = 250,["273"] = 250,["274"] = 252,["275"] = 253,["276"] = 252,["277"] = 253,["278"] = 253,["279"] = 252,["280"] = 253,["282"] = 253,["283"] = 255,["284"] = 256,["285"] = 255,["286"] = 256,["288"] = 256,["289"] = 257,["290"] = 258,["291"] = 259,["292"] = 260,["293"] = 261,["294"] = 255,["295"] = 263,["296"] = 264,["297"] = 263,["298"] = 266,["299"] = 267,["300"] = 266,["301"] = 269,["302"] = 270,["303"] = 269,["304"] = 272,["305"] = 273,["306"] = 274,["307"] = 275,["308"] = 276,["309"] = 277,["310"] = 278,["311"] = 279,["312"] = 280,["313"] = 281,["314"] = 282,["315"] = 282,["317"] = 283,["318"] = 283,["321"] = 285,["322"] = 286,["324"] = 272,["325"] = 289,["326"] = 290,["329"] = 291,["330"] = 292,["331"] = 293,["333"] = 295,["334"] = 296,["335"] = 289,["336"] = 298,["337"] = 299,["340"] = 300,["341"] = 300,["342"] = 300,["343"] = 300,["344"] = 300,["345"] = 298,["346"] = 302,["347"] = 303,["350"] = 304,["351"] = 305,["352"] = 306,["353"] = 307,["354"] = 308,["358"] = 312,["359"] = 313,["361"] = 315,["362"] = 315,["363"] = 302,["364"] = 317,["365"] = 318,["368"] = 319,["369"] = 320,["372"] = 322,["373"] = 323,["374"] = 324,["375"] = 325,["376"] = 326,["377"] = 327,["379"] = 329,["382"] = 332,["383"] = 334,["384"] = 335,["385"] = 336,["386"] = 337,["389"] = 340,["390"] = 342,["391"] = 343,["394"] = 347,["395"] = 348,["398"] = 350,["399"] = 351,["400"] = 352,["401"] = 353,["402"] = 354,["403"] = 354,["404"] = 354,["405"] = 354,["406"] = 354,["407"] = 354,["408"] = 357,["409"] = 358,["415"] = 365,["416"] = 366,["417"] = 367,["418"] = 368,["420"] = 370,["421"] = 374,["422"] = 376,["423"] = 377,["425"] = 378,["426"] = 378,["428"] = 379,["429"] = 380,["430"] = 380,["432"] = 381,["433"] = 382,["434"] = 383,["435"] = 384,["437"] = 386,["438"] = 387,["439"] = 387,["440"] = 387,["441"] = 387,["442"] = 387,["443"] = 387,["444"] = 387,["450"] = 317,["451"] = 256,["452"] = 255,["453"] = 256,["455"] = 256,["456"] = 400,["457"] = 401,["458"] = 400,["459"] = 401,["461"] = 401,["462"] = 402,["463"] = 400,["464"] = 404,["465"] = 405,["466"] = 404,["467"] = 407,["468"] = 408,["469"] = 407,["470"] = 410,["471"] = 411,["472"] = 410,["473"] = 413,["474"] = 414,["475"] = 415,["476"] = 416,["477"] = 416,["478"] = 416,["479"] = 416,["480"] = 417,["483"] = 418,["484"] = 419,["485"] = 419,["486"] = 419,["487"] = 419,["488"] = 420,["489"] = 425,["490"] = 425,["491"] = 425,["492"] = 425,["493"] = 425,["494"] = 426,["495"] = 426,["496"] = 426,["497"] = 426,["498"] = 426,["499"] = 427,["500"] = 427,["501"] = 427,["502"] = 427,["503"] = 427,["504"] = 427,["505"] = 427,["506"] = 427,["508"] = 429,["509"] = 413,["510"] = 431,["511"] = 432,["514"] = 433,["515"] = 434,["516"] = 435,["517"] = 436,["520"] = 437,["521"] = 437,["522"] = 437,["523"] = 437,["524"] = 438,["525"] = 439,["526"] = 440,["527"] = 441,["528"] = 442,["529"] = 442,["530"] = 442,["531"] = 442,["534"] = 431,["535"] = 401,["536"] = 400,["537"] = 401,["539"] = 401,["540"] = 448,["541"] = 449,["542"] = 448,["543"] = 449,["545"] = 449,["546"] = 450,["547"] = 451,["548"] = 448,["549"] = 453,["550"] = 454,["551"] = 453,["552"] = 456,["553"] = 457,["554"] = 456,["555"] = 459,["556"] = 460,["557"] = 459,["558"] = 462,["559"] = 463,["560"] = 462,["561"] = 465,["562"] = 466,["563"] = 467,["564"] = 468,["565"] = 469,["566"] = 470,["567"] = 471,["568"] = 472,["569"] = 472,["571"] = 473,["572"] = 473,["575"] = 475,["576"] = 476,["578"] = 465,["579"] = 479,["580"] = 480,["581"] = 479,["582"] = 482,["583"] = 483,["584"] = 483,["585"] = 483,["586"] = 483,["587"] = 482,["588"] = 488,["589"] = 489,["590"] = 488,["591"] = 491,["592"] = 492,["593"] = 491,["594"] = 449,["595"] = 448,["596"] = 449,["598"] = 449});
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
local findMirrorQAbility = ____evo_spectre_shared.findMirrorQAbility
local findSpectreEnemies = ____evo_spectre_shared.findSpectreEnemies
local getSpectreBranchMaxLevel = ____evo_spectre_shared.getSpectreBranchMaxLevel
local getSpectreInt = ____evo_spectre_shared.getSpectreInt
local getSpectreTier = ____evo_spectre_shared.getSpectreTier
require("abilities.spectre.evo_spectre_debuffs")
local SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror_q"
LinkLuaModifier("modifier_evo_spectre_mirror_q_trail", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_hero_trail", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_spectre_mirror_q_phase", SCRIPT_PATH, 0)
local function getTrailController(self, caster, ability)
    local ctrl = caster:FindModifierByName("modifier_evo_spectre_mirror_q_trail")
    if not ctrl or ctrl:IsNull() then
        ctrl = caster:AddNewModifier(caster, ability, "modifier_evo_spectre_mirror_q_trail", {})
    end
    return ctrl and not ctrl:IsNull() and ctrl or nil
end
____exports.evo_spectre_mirror_q = __TS__Class()
local evo_spectre_mirror_q = ____exports.evo_spectre_mirror_q
evo_spectre_mirror_q.name = "evo_spectre_mirror_q"
__TS__ClassExtends(evo_spectre_mirror_q, BaseAbility)
function evo_spectre_mirror_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.hitSets = {}
    self.lastTrailPos = {}
    self.isTrackingProj = {}
    self.ribbonByProj = {}
end
function evo_spectre_mirror_q.prototype.ensureProjState(self)
    if self.hitSets == nil then
        self.hitSets = {}
    end
    if self.lastTrailPos == nil then
        self.lastTrailPos = {}
    end
    if self.isTrackingProj == nil then
        self.isTrackingProj = {}
    end
    if self.ribbonByProj == nil then
        self.ribbonByProj = {}
    end
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
    self:ensureProjState()
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local groundOrigin = GetGroundPosition(origin, caster)
    local target = self:GetCursorTarget()
    local range = math.max(
        400,
        self:GetCastRange(origin, nil)
    )
    local width = self:GetSpecialValueFor("dagger_radius")
    local speed = self:GetSpecialValueFor("speed")
    local pathDur = self:GetSpecialValueFor("dagger_path_duration")
    caster:EmitSound("Hero_Spectre.DaggerCast")
    local trailPfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf", 8, nil)
    ParticleManager:SetParticleControl(trailPfx, 3, groundOrigin)
    ParticleManager:SetParticleControl(
        trailPfx,
        5,
        Vector(pathDur + 0.4, 0, 0)
    )
    ParticleManager:SetParticleControl(
        trailPfx,
        6,
        Vector(1, 0, 0)
    )
    local ctrl = getTrailController(nil, caster, self)
    if ctrl then
        ctrl:registerRibbon(trailPfx, pathDur + 0.5)
        ctrl:pushNode(groundOrigin, pathDur)
    end
    if target and not target:IsNull() and IsValidEntity(target) and target:IsAlive() then
        local projId = ProjectileManager:CreateTrackingProjectile({
            Target = target,
            Source = caster,
            Ability = self,
            EffectName = "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
            iMoveSpeed = speed,
            bDodgeable = false,
            bVisibleToEnemies = true,
            bProvidesVision = true,
            iVisionRadius = 200,
            iVisionTeamNumber = caster:GetTeamNumber()
        })
        self.hitSets[projId] = __TS__New(Set)
        self.lastTrailPos[projId] = groundOrigin
        self.isTrackingProj[projId] = true
        self.ribbonByProj[projId] = trailPfx
        return
    end
    local dir = self:GetCursorPosition() - origin
    dir.z = 0
    dir = dir:Length2D() > 1 and dir:Normalized() or caster:GetForwardVector()
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
        iVisionRadius = 200,
        iVisionTeamNumber = caster:GetTeamNumber()
    })
    self.hitSets[projId] = __TS__New(Set)
    self.lastTrailPos[projId] = groundOrigin
    self.isTrackingProj[projId] = false
    self.ribbonByProj[projId] = trailPfx
end
function evo_spectre_mirror_q.prototype.applyDaggerHit(self, caster, target, set)
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() or target:IsBuilding() then
        return
    end
    local idx = target:GetEntityIndex()
    if set ~= nil then
        if set:has(idx) then
            return
        end
        set:add(idx)
    end
    local dmg = self:GetSpecialValueFor("damage") + getSpectreInt(nil, caster) * self:GetSpecialValueFor("int_pct") / 100
    local creepMult = self:GetSpecialValueFor("creep_mult")
    local pathDur = self:GetSpecialValueFor("dagger_path_duration")
    local heroPathDur = self:GetSpecialValueFor("hero_path_duration")
    target:EmitSound("Hero_Spectre.DaggerImpact")
    applySpectreCreepDamage(
        nil,
        caster,
        target,
        self,
        dmg,
        2,
        creepMult
    )
    target:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_q_slow", {duration = pathDur})
    if target:IsRealHero() then
        target:AddNewModifier(caster, self, "modifier_evo_spectre_mirror_q_hero_trail", {duration = heroPathDur})
    end
end
function evo_spectre_mirror_q.prototype.clearProjectileData(self, projId)
    __TS__Delete(self.hitSets, projId)
    __TS__Delete(self.lastTrailPos, projId)
    __TS__Delete(self.isTrackingProj, projId)
    __TS__Delete(self.ribbonByProj, projId)
end
function evo_spectre_mirror_q.prototype.OnProjectileThinkHandle(self, projectileHandle)
    if not IsServer() then
        return
    end
    self:ensureProjState()
    local caster = self:GetCaster()
    if not caster or caster:IsNull() then
        return
    end
    local location = self.isTrackingProj[projectileHandle] and ProjectileManager:GetTrackingProjectileLocation(projectileHandle) or ProjectileManager:GetLinearProjectileLocation(projectileHandle)
    if not location then
        return
    end
    local ground = GetGroundPosition(location, caster)
    local ribbon = self.ribbonByProj[projectileHandle]
    if ribbon ~= nil then
        ParticleManager:SetParticleControl(ribbon, 3, ground)
    end
    local prev = self.lastTrailPos[projectileHandle]
    if prev == nil or (ground - prev):Length2D() >= 65 then
        self.lastTrailPos[projectileHandle] = ground
        local ctrl = getTrailController(nil, caster, self)
        if ctrl then
            ctrl:pushNode(
                ground,
                self:GetSpecialValueFor("dagger_path_duration")
            )
        end
    end
    if self.isTrackingProj[projectileHandle] then
        local set = self.hitSets[projectileHandle]
        local width = self:GetSpecialValueFor("dagger_radius")
        for ____, enemy in ipairs(findSpectreEnemies(nil, caster, ground, width)) do
            self:applyDaggerHit(caster, enemy, set)
        end
    end
end
function evo_spectre_mirror_q.prototype.OnProjectileHitHandle(self, target, location, projectileHandle)
    if not IsServer() then
        return false
    end
    self:ensureProjState()
    local caster = self:GetCaster()
    local isTracking = self.isTrackingProj[projectileHandle] == true
    if not caster or caster:IsNull() then
        self:clearProjectileData(projectileHandle)
        return isTracking
    end
    local ribbon = self.ribbonByProj[projectileHandle]
    local ground = GetGroundPosition(location, caster)
    if ribbon ~= nil then
        ParticleManager:SetParticleControl(ribbon, 3, ground)
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        local ctrl = getTrailController(nil, caster, self)
        if ctrl then
            ctrl:pushNode(
                ground,
                self:GetSpecialValueFor("dagger_path_duration")
            )
        end
        self:clearProjectileData(projectileHandle)
        return isTracking
    end
    local ctrl = getTrailController(nil, caster, self)
    if ctrl then
        ctrl:pushNode(
            ground,
            self:GetSpecialValueFor("dagger_path_duration")
        )
    end
    self:applyDaggerHit(caster, target, self.hitSets[projectileHandle])
    if isTracking then
        self:clearProjectileData(projectileHandle)
        return true
    end
    return false
end
evo_spectre_mirror_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_q")},
    evo_spectre_mirror_q
)
____exports.evo_spectre_mirror_q = evo_spectre_mirror_q
____exports.evo_spectre_mirror_q_t3 = __TS__Class()
local evo_spectre_mirror_q_t3 = ____exports.evo_spectre_mirror_q_t3
evo_spectre_mirror_q_t3.name = "evo_spectre_mirror_q_t3"
__TS__ClassExtends(evo_spectre_mirror_q_t3, ____exports.evo_spectre_mirror_q)
evo_spectre_mirror_q_t3 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_q_t3")},
    evo_spectre_mirror_q_t3
)
____exports.evo_spectre_mirror_q_t3 = evo_spectre_mirror_q_t3
____exports.evo_spectre_mirror_q_t4 = __TS__Class()
local evo_spectre_mirror_q_t4 = ____exports.evo_spectre_mirror_q_t4
evo_spectre_mirror_q_t4.name = "evo_spectre_mirror_q_t4"
__TS__ClassExtends(evo_spectre_mirror_q_t4, ____exports.evo_spectre_mirror_q)
evo_spectre_mirror_q_t4 = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_spectre_mirror_q_t4")},
    evo_spectre_mirror_q_t4
)
____exports.evo_spectre_mirror_q_t4 = evo_spectre_mirror_q_t4
____exports.modifier_evo_spectre_mirror_q_trail = __TS__Class()
local modifier_evo_spectre_mirror_q_trail = ____exports.modifier_evo_spectre_mirror_q_trail
modifier_evo_spectre_mirror_q_trail.name = "modifier_evo_spectre_mirror_q_trail"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_trail, BaseModifier)
function modifier_evo_spectre_mirror_q_trail.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.nodes = {}
    self.ribbons = {}
    self.pathRadius = 175
    self.gracePeriod = 1
    self.dotAccum = 0
end
function modifier_evo_spectre_mirror_q_trail.prototype.IsHidden(self)
    return true
end
function modifier_evo_spectre_mirror_q_trail.prototype.IsPurgable(self)
    return false
end
function modifier_evo_spectre_mirror_q_trail.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_spectre_mirror_q_trail.prototype.OnCreated(self)
    self.nodes = {}
    self.ribbons = {}
    self.pathRadius = 175
    self.gracePeriod = 1
    self.dotAccum = 0
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local pr = ab:GetSpecialValueFor("path_radius")
        local gp = ab:GetSpecialValueFor("dagger_grace_period")
        if pr > 0 then
            self.pathRadius = pr
        end
        if gp > 0 then
            self.gracePeriod = gp
        end
    end
    if IsServer() then
        self:StartIntervalThink(0.15)
    end
end
function modifier_evo_spectre_mirror_q_trail.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    for ____, r in ipairs(self.ribbons) do
        ParticleManager:DestroyParticle(r.pfx, false)
        ParticleManager:ReleaseParticleIndex(r.pfx)
    end
    self.ribbons = {}
    self.nodes = {}
end
function modifier_evo_spectre_mirror_q_trail.prototype.registerRibbon(self, pfx, duration)
    if not IsServer() then
        return
    end
    local ____self_ribbons_0 = self.ribbons
    ____self_ribbons_0[#____self_ribbons_0 + 1] = {
        pfx = pfx,
        expireTime = GameRules:GetGameTime() + duration
    }
end
function modifier_evo_spectre_mirror_q_trail.prototype.pushNode(self, pos, duration)
    if not IsServer() then
        return
    end
    local now = GameRules:GetGameTime()
    local len = #self.nodes
    if len > 0 then
        local last = self.nodes[len]
        if (pos - last.pos):Length2D() < 55 and last.expireTime - now > duration - 0.35 then
            return
        end
    end
    if len >= 120 then
        table.remove(self.nodes, 1)
    end
    local ____self_nodes_1 = self.nodes
    ____self_nodes_1[#____self_nodes_1 + 1] = {pos = pos, expireTime = now + duration}
end
function modifier_evo_spectre_mirror_q_trail.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return
    end
    local now = GameRules:GetGameTime()
    local aliveRibbons = {}
    for ____, r in ipairs(self.ribbons) do
        if now >= r.expireTime then
            ParticleManager:DestroyParticle(r.pfx, false)
            ParticleManager:ReleaseParticleIndex(r.pfx)
        else
            aliveRibbons[#aliveRibbons + 1] = r
        end
    end
    self.ribbons = aliveRibbons
    local aliveNodes = {}
    for ____, node in ipairs(self.nodes) do
        if now < node.expireTime then
            aliveNodes[#aliveNodes + 1] = node
        end
    end
    self.nodes = aliveNodes
    if #self.nodes == 0 and #self.ribbons == 0 then
        self:Destroy()
        return
    end
    local qAb = findMirrorQAbility(nil, parent)
    if not qAb or qAb:IsNull() then
        return
    end
    if parent:IsAlive() then
        local pPos = parent:GetAbsOrigin()
        for ____, node in ipairs(self.nodes) do
            if (pPos - node.pos):Length2D() <= self.pathRadius then
                local phase = parent:AddNewModifier(
                    parent,
                    qAb,
                    "modifier_evo_spectre_mirror_q_phase",
                    {duration = math.max(0.4, self.gracePeriod)}
                )
                if phase and not phase:IsNull() then
                    phase:SetStackCount(math.floor(qAb:GetSpecialValueFor("trail_reflect_pct") + 0.5))
                end
                break
            end
        end
    end
    self.dotAccum = self.dotAccum + 0.15
    local doDot = getSpectreTier(nil, parent) >= 4 and self.dotAccum >= 0.5
    if doDot then
        self.dotAccum = self.dotAccum - 0.5
    end
    local halfDps = doDot and (qAb:GetSpecialValueFor("rift_dps") + getSpectreInt(nil, parent) * qAb:GetSpecialValueFor("rift_int_pct") / 100) * 0.5 or 0
    local seenEnemies = __TS__New(Set)
    for ____, node in ipairs(self.nodes) do
        for ____, enemy in ipairs(findSpectreEnemies(nil, parent, node.pos, self.pathRadius)) do
            do
                if not enemy or enemy:IsNull() or not enemy:IsAlive() or enemy:IsBuilding() then
                    goto __continue76
                end
                local idx = enemy:GetEntityIndex()
                if seenEnemies:has(idx) then
                    goto __continue76
                end
                seenEnemies:add(idx)
                local slow = enemy:FindModifierByName("modifier_evo_spectre_mirror_q_slow")
                if not slow or slow:GetRemainingTime() < 0.35 then
                    enemy:AddNewModifier(parent, qAb, "modifier_evo_spectre_mirror_q_slow", {duration = 0.35})
                end
                if halfDps > 0 then
                    ApplyDamage({
                        victim = enemy,
                        attacker = parent,
                        ability = qAb,
                        damage = halfDps,
                        damage_type = 2
                    })
                end
            end
            ::__continue76::
        end
    end
end
modifier_evo_spectre_mirror_q_trail = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_q_trail")},
    modifier_evo_spectre_mirror_q_trail
)
____exports.modifier_evo_spectre_mirror_q_trail = modifier_evo_spectre_mirror_q_trail
____exports.modifier_evo_spectre_mirror_q_hero_trail = __TS__Class()
local modifier_evo_spectre_mirror_q_hero_trail = ____exports.modifier_evo_spectre_mirror_q_hero_trail
modifier_evo_spectre_mirror_q_hero_trail.name = "modifier_evo_spectre_mirror_q_hero_trail"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_hero_trail, BaseModifier)
function modifier_evo_spectre_mirror_q_hero_trail.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastPos = Vector(0, 0, 0)
end
function modifier_evo_spectre_mirror_q_hero_trail.prototype.IsHidden(self)
    return true
end
function modifier_evo_spectre_mirror_q_hero_trail.prototype.IsDebuff(self)
    return true
end
function modifier_evo_spectre_mirror_q_hero_trail.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_q_hero_trail.prototype.OnCreated(self)
    local parent = self:GetParent()
    local ab = self:GetAbility()
    self.lastPos = parent and not parent:IsNull() and GetGroundPosition(
        parent:GetAbsOrigin(),
        parent
    ) or Vector(0, 0, 0)
    if not IsServer() then
        return
    end
    if parent and not parent:IsNull() and ab and not ab:IsNull() then
        local heroDur = math.max(
            1,
            ab:GetSpecialValueFor("hero_path_duration")
        )
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_shadow_path_owner.vpcf", 1, parent)
        ParticleManager:SetParticleControl(
            pfx,
            5,
            Vector(heroDur, 0, 0)
        )
        ParticleManager:SetParticleControl(
            pfx,
            6,
            Vector(1, 0, 0)
        )
        self:AddParticle(
            pfx,
            false,
            false,
            -1,
            false,
            false
        )
    end
    self:StartIntervalThink(0.15)
end
function modifier_evo_spectre_mirror_q_hero_trail.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    local cur = GetGroundPosition(
        parent:GetAbsOrigin(),
        parent
    )
    if (cur - self.lastPos):Length2D() >= 65 then
        self.lastPos = cur
        local ctrl = getTrailController(nil, caster, ab)
        if ctrl then
            ctrl:pushNode(
                cur,
                ab:GetSpecialValueFor("dagger_path_duration")
            )
        end
    end
end
modifier_evo_spectre_mirror_q_hero_trail = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_spectre_mirror_q_hero_trail")},
    modifier_evo_spectre_mirror_q_hero_trail
)
____exports.modifier_evo_spectre_mirror_q_hero_trail = modifier_evo_spectre_mirror_q_hero_trail
____exports.modifier_evo_spectre_mirror_q_phase = __TS__Class()
local modifier_evo_spectre_mirror_q_phase = ____exports.modifier_evo_spectre_mirror_q_phase
modifier_evo_spectre_mirror_q_phase.name = "modifier_evo_spectre_mirror_q_phase"
__TS__ClassExtends(modifier_evo_spectre_mirror_q_phase, BaseModifier)
function modifier_evo_spectre_mirror_q_phase.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.msPct = 14
    self.reflectBonus = 10
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsHidden(self)
    return false
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsDebuff(self)
    return false
end
function modifier_evo_spectre_mirror_q_phase.prototype.IsPurgable(self)
    return true
end
function modifier_evo_spectre_mirror_q_phase.prototype.GetTexture(self)
    return "evo_spectre_mirror_q"
end
function modifier_evo_spectre_mirror_q_phase.prototype.OnCreated(self)
    self.msPct = 14
    self.reflectBonus = 10
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        local ms = ab:GetSpecialValueFor("bonus_movespeed")
        local rb = ab:GetSpecialValueFor("trail_reflect_pct")
        if ms > 0 then
            self.msPct = ms
        end
        if rb > 0 then
            self.reflectBonus = rb
        end
    end
    if IsServer() then
        self:SetStackCount(math.floor(self.reflectBonus + 0.5))
    end
end
function modifier_evo_spectre_mirror_q_phase.prototype.OnRefresh(self)
    self:OnCreated()
end
function modifier_evo_spectre_mirror_q_phase.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true
    }
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
return ____exports
