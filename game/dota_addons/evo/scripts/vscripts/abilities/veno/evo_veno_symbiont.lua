local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 20,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 26,["35"] = 26,["36"] = 27,["37"] = 25,["38"] = 29,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 29,["44"] = 32,["45"] = 33,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 38,["61"] = 38,["62"] = 38,["63"] = 38,["64"] = 38,["65"] = 38,["66"] = 55,["67"] = 55,["68"] = 55,["69"] = 55,["70"] = 32,["71"] = 57,["72"] = 58,["75"] = 59,["76"] = 60,["77"] = 61,["78"] = 62,["79"] = 63,["80"] = 64,["82"] = 66,["83"] = 68,["84"] = 69,["85"] = 71,["86"] = 72,["87"] = 74,["88"] = 75,["89"] = 76,["90"] = 77,["91"] = 77,["92"] = 79,["93"] = 80,["94"] = 80,["96"] = 81,["97"] = 82,["98"] = 83,["99"] = 84,["100"] = 84,["102"] = 85,["103"] = 85,["104"] = 85,["105"] = 85,["106"] = 85,["107"] = 86,["108"] = 77,["109"] = 77,["110"] = 77,["112"] = 57,["113"] = 92,["114"] = 97,["115"] = 97,["117"] = 98,["118"] = 99,["119"] = 100,["120"] = 101,["122"] = 103,["123"] = 104,["124"] = 104,["126"] = 105,["127"] = 105,["129"] = 107,["130"] = 108,["131"] = 109,["132"] = 110,["133"] = 112,["134"] = 113,["135"] = 114,["136"] = 115,["137"] = 116,["138"] = 117,["139"] = 117,["140"] = 117,["141"] = 117,["142"] = 117,["143"] = 117,["144"] = 117,["145"] = 118,["146"] = 119,["147"] = 119,["148"] = 119,["149"] = 119,["150"] = 119,["151"] = 119,["152"] = 119,["153"] = 119,["154"] = 119,["157"] = 125,["158"] = 126,["159"] = 126,["160"] = 126,["161"] = 126,["162"] = 126,["163"] = 126,["164"] = 126,["165"] = 126,["166"] = 126,["168"] = 128,["169"] = 92,["170"] = 26,["171"] = 25,["172"] = 26,["174"] = 26,["175"] = 132,["176"] = 133,["177"] = 132,["178"] = 133,["179"] = 134,["180"] = 135,["181"] = 135,["182"] = 135,["183"] = 135,["184"] = 134,["185"] = 137,["186"] = 138,["187"] = 139,["188"] = 140,["190"] = 142,["191"] = 137,["192"] = 144,["193"] = 145,["196"] = 146,["197"] = 147,["198"] = 148,["201"] = 149,["202"] = 151,["203"] = 152,["204"] = 153,["205"] = 154,["208"] = 158,["209"] = 159,["210"] = 163,["211"] = 164,["212"] = 168,["213"] = 169,["215"] = 144,["216"] = 133,["217"] = 132,["218"] = 133,["220"] = 133,["221"] = 174,["222"] = 175,["223"] = 174,["224"] = 175,["226"] = 175,["227"] = 176,["228"] = 177,["229"] = 174,["230"] = 179,["231"] = 180,["232"] = 179,["233"] = 182,["234"] = 183,["235"] = 182,["236"] = 185,["237"] = 186,["238"] = 185,["239"] = 188,["240"] = 189,["241"] = 188,["242"] = 191,["243"] = 192,["244"] = 193,["245"] = 194,["246"] = 195,["247"] = 196,["249"] = 198,["252"] = 199,["253"] = 200,["255"] = 202,["256"] = 191,["257"] = 204,["258"] = 205,["259"] = 204,["260"] = 207,["261"] = 208,["264"] = 209,["265"] = 210,["266"] = 211,["267"] = 212,["270"] = 214,["271"] = 215,["272"] = 216,["275"] = 217,["276"] = 219,["277"] = 220,["278"] = 221,["279"] = 221,["280"] = 221,["281"] = 221,["282"] = 221,["283"] = 221,["285"] = 222,["286"] = 222,["288"] = 223,["289"] = 223,["290"] = 223,["291"] = 223,["292"] = 223,["293"] = 223,["294"] = 223,["298"] = 207,["299"] = 232,["300"] = 233,["303"] = 234,["304"] = 235,["305"] = 236,["306"] = 237,["309"] = 238,["312"] = 240,["313"] = 241,["314"] = 242,["315"] = 243,["316"] = 245,["317"] = 246,["318"] = 247,["321"] = 250,["323"] = 251,["324"] = 251,["326"] = 252,["327"] = 253,["328"] = 254,["329"] = 254,["331"] = 255,["332"] = 255,["333"] = 255,["334"] = 255,["335"] = 256,["339"] = 232,["340"] = 259,["341"] = 260,["342"] = 260,["343"] = 260,["344"] = 260,["345"] = 259,["346"] = 265,["347"] = 266,["348"] = 265,["349"] = 268,["350"] = 269,["351"] = 269,["353"] = 270,["354"] = 271,["355"] = 271,["357"] = 272,["358"] = 272,["359"] = 272,["360"] = 272,["361"] = 273,["362"] = 274,["363"] = 275,["364"] = 276,["366"] = 278,["367"] = 268,["368"] = 175,["369"] = 174,["370"] = 175,["372"] = 175,["373"] = 282,["374"] = 283,["375"] = 282,["376"] = 283,["378"] = 283,["379"] = 284,["380"] = 282,["381"] = 286,["382"] = 287,["383"] = 286,["384"] = 289,["385"] = 290,["386"] = 289,["387"] = 292,["388"] = 293,["389"] = 292,["390"] = 295,["391"] = 296,["392"] = 295,["393"] = 298,["394"] = 299,["395"] = 300,["398"] = 301,["399"] = 301,["400"] = 301,["401"] = 301,["402"] = 301,["403"] = 306,["404"] = 306,["405"] = 306,["406"] = 306,["407"] = 306,["408"] = 306,["409"] = 306,["410"] = 306,["411"] = 307,["412"] = 298,["413"] = 309,["414"] = 310,["417"] = 311,["418"] = 312,["419"] = 313,["420"] = 314,["423"] = 316,["424"] = 317,["425"] = 318,["426"] = 318,["427"] = 318,["428"] = 318,["429"] = 318,["430"] = 318,["431"] = 318,["432"] = 325,["433"] = 326,["435"] = 309,["436"] = 329,["437"] = 330,["438"] = 329,["439"] = 283,["440"] = 282,["441"] = 283,["443"] = 283});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_veno_shared = require("abilities.veno.evo_veno_shared")
local applyVenoCreepDamage = ____evo_veno_shared.applyVenoCreepDamage
local applyVenoSymbiontPollen = ____evo_veno_shared.applyVenoSymbiontPollen
local findVenoAllies = ____evo_veno_shared.findVenoAllies
local findVenoEnemies = ____evo_veno_shared.findVenoEnemies
local getVenoAllAttrSum = ____evo_veno_shared.getVenoAllAttrSum
local getVenoBranchMaxLevel = ____evo_veno_shared.getVenoBranchMaxLevel
local getVenoTier = ____evo_veno_shared.getVenoTier
require("abilities.veno.evo_veno_debuffs")
local SCRIPT_PATH = "abilities/veno/evo_veno_symbiont"
LinkLuaModifier("modifier_evo_veno_symbiont_w_ally", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_veno_symbiont_w_enemy", SCRIPT_PATH, 0)
____exports.evo_veno_symbiont_q = __TS__Class()
local evo_veno_symbiont_q = ____exports.evo_veno_symbiont_q
evo_veno_symbiont_q.name = "evo_veno_symbiont_q"
__TS__ClassExtends(evo_veno_symbiont_q, BaseAbility)
function evo_veno_symbiont_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.projMeta = {}
end
function evo_veno_symbiont_q.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_symbiont_q.prototype.launchWave(self, origin, dir, isReturn)
    local caster = self:GetCaster()
    local range = self:GetSpecialValueFor("range")
    local width = self:GetSpecialValueFor("width")
    local speed = self:GetSpecialValueFor("speed")
    local projId = ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf",
        vSpawnOrigin = origin,
        fDistance = range,
        fStartRadius = width,
        fEndRadius = width,
        Source = caster,
        bHasFrontalCone = false,
        iUnitTargetTeam = 3,
        iUnitTargetFlags = 0,
        iUnitTargetType = 1 + 18,
        vVelocity = dir * speed,
        bProvidesVision = true,
        iVisionRadius = 220,
        iVisionTeamNumber = caster:GetTeamNumber()
    })
    self.projMeta[projId] = {
        isReturn = isReturn,
        hit = __TS__New(Set)
    }
end
function evo_veno_symbiont_q.prototype.OnSpellStart(self)
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
    local speed = self:GetSpecialValueFor("speed")
    caster:EmitSound("Hero_Venomancer.VenomousGale")
    self:launchWave(origin, dir, false)
    if getVenoTier(nil, caster) >= 4 then
        local endPos = GetGroundPosition(origin + dir * range, caster)
        local delay = range / math.max(100, speed) + 0.2
        caster:SetContextThink(
            DoUniqueString("VenoSymbiontWaveReturn"),
            function()
                if not self or self:IsNull() or not caster or caster:IsNull() then
                    return nil
                end
                local dest = caster:IsAlive() and caster:GetAbsOrigin() or origin
                local backDir = dest - endPos
                backDir.z = 0
                if backDir:Length2D() < 1 then
                    backDir = -dir
                end
                self:launchWave(
                    endPos,
                    backDir:Normalized(),
                    true
                )
                return nil
            end,
            delay
        )
    end
end
function evo_veno_symbiont_q.prototype.OnProjectileHitHandle(self, target, _location, projectileHandle)
    if not IsServer() then
        return false
    end
    local meta = self.projMeta[projectileHandle]
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        __TS__Delete(self.projMeta, projectileHandle)
        return false
    end
    local eIdx = target:GetEntityIndex()
    if meta ~= nil and meta.hit:has(eIdx) then
        return false
    end
    if meta ~= nil then
        meta.hit:add(eIdx)
    end
    local caster = self:GetCaster()
    local tier = getVenoTier(nil, caster)
    local allStats = getVenoAllAttrSum(nil, caster)
    local mult = meta and meta.isReturn and self:GetSpecialValueFor("return_pct") / 100 or 1
    applyVenoSymbiontPollen(nil, caster, target, self)
    if target:GetTeamNumber() == caster:GetTeamNumber() then
        local heal = (self:GetSpecialValueFor("heal_base") + allStats * self:GetSpecialValueFor("heal_all_pct") / 100) * mult
        target:Heal(heal, self)
        if tier >= 3 and not (meta and meta.isReturn) then
            target:Purge(
                false,
                true,
                false,
                false,
                false
            )
            local shield = math.ceil(heal * self:GetSpecialValueFor("shield_heal_pct") / 100)
            target:AddNewModifier(
                caster,
                self,
                "modifier_evo_veno_symbiont_shield",
                {
                    duration = self:GetSpecialValueFor("shield_duration"),
                    shield = shield
                }
            )
        end
    else
        local dmg = (self:GetSpecialValueFor("dmg_base") + allStats * self:GetSpecialValueFor("dmg_all_pct") / 100) * mult
        applyVenoCreepDamage(
            nil,
            caster,
            target,
            self,
            dmg,
            2,
            self:GetSpecialValueFor("creep_mult")
        )
    end
    return false
end
evo_veno_symbiont_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_q")},
    evo_veno_symbiont_q
)
____exports.evo_veno_symbiont_q = evo_veno_symbiont_q
____exports.evo_veno_symbiont_w = __TS__Class()
local evo_veno_symbiont_w = ____exports.evo_veno_symbiont_w
evo_veno_symbiont_w.name = "evo_veno_symbiont_w"
__TS__ClassExtends(evo_veno_symbiont_w, BaseAbility)
function evo_veno_symbiont_w.prototype.GetMaxLevel(self)
    return getVenoBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_veno_symbiont_w.prototype.GetAbilityTargetTeam(self)
    local caster = self:GetCaster()
    if caster and not caster:IsNull() and getVenoTier(nil, caster) >= 3 then
        return 3
    end
    return 1
end
function evo_veno_symbiont_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget() or caster
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return
    end
    local tier = getVenoTier(nil, caster)
    if target:GetTeamNumber() ~= caster:GetTeamNumber() and tier >= 3 then
        local rootDur = tier >= 4 and 1.5 or 1.2
        target:EmitSound("Hero_Treant.Overgrowth.Target")
        target:AddNewModifier(caster, self, "modifier_evo_veno_symbiont_w_enemy", {duration = rootDur})
        return
    end
    local dur = self:GetSpecialValueFor("duration")
    local shield = math.ceil(self:GetSpecialValueFor("shield_base") + getVenoAllAttrSum(nil, caster) * self:GetSpecialValueFor("shield_all_pct") / 100)
    target:EmitSound("Hero_Treant.LivingArmor.Target")
    local mod = target:AddNewModifier(caster, self, "modifier_evo_veno_symbiont_w_ally", {duration = dur, shield = shield})
    if mod ~= nil then
        mod:SetStackCount(shield)
    end
end
evo_veno_symbiont_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_veno_symbiont_w")},
    evo_veno_symbiont_w
)
____exports.evo_veno_symbiont_w = evo_veno_symbiont_w
____exports.modifier_evo_veno_symbiont_w_ally = __TS__Class()
local modifier_evo_veno_symbiont_w_ally = ____exports.modifier_evo_veno_symbiont_w_ally
modifier_evo_veno_symbiont_w_ally.name = "modifier_evo_veno_symbiont_w_ally"
__TS__ClassExtends(modifier_evo_veno_symbiont_w_ally, BaseModifier)
function modifier_evo_veno_symbiont_w_ally.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.statusRes = 20
    self.pulseAccum = 0
end
function modifier_evo_veno_symbiont_w_ally.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_symbiont_w_ally.prototype.IsDebuff(self)
    return false
end
function modifier_evo_veno_symbiont_w_ally.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_symbiont_w_ally.prototype.GetTexture(self)
    return "treant_living_armor"
end
function modifier_evo_veno_symbiont_w_ally.prototype.OnCreated(self, params)
    self.statusRes = 20
    self.pulseAccum = 0
    local ab = self:GetAbility()
    if ab and not ab:IsNull() then
        self.statusRes = ab:GetSpecialValueFor("status_res")
    end
    if not IsServer() then
        return
    end
    if params and params.shield ~= nil then
        self:SetStackCount(params.shield)
    end
    self:StartIntervalThink(0.1)
end
function modifier_evo_veno_symbiont_w_ally.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_evo_veno_symbiont_w_ally.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    self.pulseAccum = self.pulseAccum + 0.1
    local interval = ab:GetSpecialValueFor("pulse_interval")
    if self.pulseAccum < interval then
        return
    end
    self.pulseAccum = self.pulseAccum - interval
    local radius = ab:GetSpecialValueFor("pulse_radius")
    local dmg = ab:GetSpecialValueFor("pulse_dmg") + getVenoAllAttrSum(nil, caster) * ab:GetSpecialValueFor("pulse_all_pct") / 100
    for ____, enemy in ipairs(findVenoEnemies(
        nil,
        caster,
        parent:GetAbsOrigin(),
        radius
    )) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue40
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dmg,
                damage_type = 2
            })
        end
        ::__continue40::
    end
end
function modifier_evo_veno_symbiont_w_ally.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    if getVenoTier(nil, caster) < 4 then
        return
    end
    local origin = parent:GetAbsOrigin()
    local radius = ab:GetSpecialValueFor("burst_radius")
    local heal = ab:GetSpecialValueFor("burst_heal") + getVenoAllAttrSum(nil, caster) * ab:GetSpecialValueFor("burst_all_pct") / 100
    local pushDist = ab:GetSpecialValueFor("burst_push")
    for ____, ally in ipairs(findVenoAllies(nil, caster, origin, radius)) do
        if ally and not ally:IsNull() and ally:IsAlive() then
            ally:Heal(heal, ab)
        end
    end
    for ____, enemy in ipairs(findVenoEnemies(nil, caster, origin, radius)) do
        do
            if not enemy or enemy:IsNull() or not enemy:IsAlive() then
                goto __continue50
            end
            local dir = enemy:GetAbsOrigin() - origin
            dir.z = 0
            if dir:Length2D() < 1 then
                dir = Vector(1, 0, 0)
            end
            local nextPos = GetGroundPosition(
                enemy:GetAbsOrigin() + dir:Normalized() * pushDist,
                enemy
            )
            FindClearSpaceForUnit(enemy, nextPos, false)
        end
        ::__continue50::
    end
end
function modifier_evo_veno_symbiont_w_ally.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK")
    }
end
function modifier_evo_veno_symbiont_w_ally.prototype.GetModifierStatusResistanceStacking(self)
    return self.statusRes
end
function modifier_evo_veno_symbiont_w_ally.prototype.GetModifierTotal_ConstantBlock(self, event)
    if not IsServer() then
        return 0
    end
    local pool = self:GetStackCount()
    if pool <= 0 or event.damage <= 0 then
        return 0
    end
    local blocked = math.min(
        pool,
        math.ceil(event.damage)
    )
    local rem = pool - blocked
    self:SetStackCount(math.max(0, rem))
    if rem <= 0 then
        self:Destroy()
    end
    return blocked
end
modifier_evo_veno_symbiont_w_ally = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_symbiont_w_ally")},
    modifier_evo_veno_symbiont_w_ally
)
____exports.modifier_evo_veno_symbiont_w_ally = modifier_evo_veno_symbiont_w_ally
____exports.modifier_evo_veno_symbiont_w_enemy = __TS__Class()
local modifier_evo_veno_symbiont_w_enemy = ____exports.modifier_evo_veno_symbiont_w_enemy
modifier_evo_veno_symbiont_w_enemy.name = "modifier_evo_veno_symbiont_w_enemy"
__TS__ClassExtends(modifier_evo_veno_symbiont_w_enemy, BaseModifier)
function modifier_evo_veno_symbiont_w_enemy.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.accum = 0
end
function modifier_evo_veno_symbiont_w_enemy.prototype.IsHidden(self)
    return false
end
function modifier_evo_veno_symbiont_w_enemy.prototype.IsDebuff(self)
    return true
end
function modifier_evo_veno_symbiont_w_enemy.prototype.IsPurgable(self)
    return true
end
function modifier_evo_veno_symbiont_w_enemy.prototype.GetTexture(self)
    return "treant_living_armor"
end
function modifier_evo_veno_symbiont_w_enemy.prototype.OnCreated(self)
    self.accum = 0
    if not IsServer() then
        return
    end
    local pfx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_treant/treant_bramble_root.vpcf",
        1,
        self:GetParent()
    )
    self:AddParticle(
        pfx,
        false,
        false,
        -1,
        false,
        false
    )
    self:StartIntervalThink(0.5)
end
function modifier_evo_veno_symbiont_w_enemy.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ab = self:GetAbility()
    if not parent or parent:IsNull() or not parent:IsAlive() or not caster or caster:IsNull() or not ab or ab:IsNull() then
        return
    end
    local baseDrain = getVenoTier(nil, caster) >= 4 and 65 or 40
    local halfDrain = (baseDrain + getVenoAllAttrSum(nil, caster) * ab:GetSpecialValueFor("drain_all_pct") / 100) * 0.5
    ApplyDamage({
        victim = parent,
        attacker = caster,
        ability = ab,
        damage = halfDrain,
        damage_type = 2
    })
    if caster:IsAlive() then
        caster:Heal(halfDrain, ab)
    end
end
function modifier_evo_veno_symbiont_w_enemy.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_veno_symbiont_w_enemy = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_veno_symbiont_w_enemy")},
    modifier_evo_veno_symbiont_w_enemy
)
____exports.modifier_evo_veno_symbiont_w_enemy = modifier_evo_veno_symbiont_w_enemy
return ____exports
