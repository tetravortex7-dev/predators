local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 20,["26"] = 21,["28"] = 24,["29"] = 25,["30"] = 24,["31"] = 25,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 32,["39"] = 33,["40"] = 32,["41"] = 35,["42"] = 36,["43"] = 35,["44"] = 38,["45"] = 39,["46"] = 38,["47"] = 41,["48"] = 42,["49"] = 41,["50"] = 25,["51"] = 24,["52"] = 25,["54"] = 25,["55"] = 46,["56"] = 47,["57"] = 46,["58"] = 47,["59"] = 48,["60"] = 49,["63"] = 50,["64"] = 51,["67"] = 53,["68"] = 54,["69"] = 55,["70"] = 56,["71"] = 57,["72"] = 58,["73"] = 59,["74"] = 59,["75"] = 59,["76"] = 59,["77"] = 60,["78"] = 61,["79"] = 63,["80"] = 64,["81"] = 65,["82"] = 48,["83"] = 47,["84"] = 46,["85"] = 47,["87"] = 47,["88"] = 74,["89"] = 75,["90"] = 74,["91"] = 75,["93"] = 75,["94"] = 76,["95"] = 77,["96"] = 78,["97"] = 79,["98"] = 80,["99"] = 81,["100"] = 82,["101"] = 74,["102"] = 85,["103"] = 86,["104"] = 85,["105"] = 88,["106"] = 89,["107"] = 88,["108"] = 91,["109"] = 92,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 91,["114"] = 97,["115"] = 98,["118"] = 99,["119"] = 100,["120"] = 101,["121"] = 102,["122"] = 103,["123"] = 104,["124"] = 105,["125"] = 106,["126"] = 108,["127"] = 109,["128"] = 110,["130"] = 116,["131"] = 97,["132"] = 118,["133"] = 119,["136"] = 120,["137"] = 121,["138"] = 122,["141"] = 125,["142"] = 126,["143"] = 127,["144"] = 128,["145"] = 129,["146"] = 130,["147"] = 132,["148"] = 133,["149"] = 134,["150"] = 134,["151"] = 134,["152"] = 134,["153"] = 134,["154"] = 134,["155"] = 134,["156"] = 134,["157"] = 134,["159"] = 145,["160"] = 145,["161"] = 145,["162"] = 145,["163"] = 145,["164"] = 145,["165"] = 145,["166"] = 145,["167"] = 145,["168"] = 145,["169"] = 145,["170"] = 157,["172"] = 158,["173"] = 158,["175"] = 159,["176"] = 160,["177"] = 160,["179"] = 161,["180"] = 162,["181"] = 162,["182"] = 162,["183"] = 162,["184"] = 162,["185"] = 162,["186"] = 162,["187"] = 169,["188"] = 170,["193"] = 118,["194"] = 174,["195"] = 175,["198"] = 176,["199"] = 177,["200"] = 178,["201"] = 179,["203"] = 181,["204"] = 182,["207"] = 183,["208"] = 184,["209"] = 186,["210"] = 187,["211"] = 188,["212"] = 188,["213"] = 188,["214"] = 188,["215"] = 188,["216"] = 188,["217"] = 188,["218"] = 188,["219"] = 188,["220"] = 188,["221"] = 188,["222"] = 199,["224"] = 200,["225"] = 200,["227"] = 201,["228"] = 201,["229"] = 201,["230"] = 201,["231"] = 201,["232"] = 206,["233"] = 207,["234"] = 208,["235"] = 209,["236"] = 209,["237"] = 209,["238"] = 209,["239"] = 209,["240"] = 214,["242"] = 216,["243"] = 217,["248"] = 174,["249"] = 75,["250"] = 74,["251"] = 75,["253"] = 75,["254"] = 223,["255"] = 224,["256"] = 223,["257"] = 224,["258"] = 225,["259"] = 226,["260"] = 225,["261"] = 228,["262"] = 229,["263"] = 228,["264"] = 231,["265"] = 232,["268"] = 233,["269"] = 231,["270"] = 235,["271"] = 236,["274"] = 237,["275"] = 238,["276"] = 239,["279"] = 240,["280"] = 240,["281"] = 240,["282"] = 240,["283"] = 240,["284"] = 240,["285"] = 240,["286"] = 240,["287"] = 240,["288"] = 240,["289"] = 240,["290"] = 251,["292"] = 252,["293"] = 252,["295"] = 253,["296"] = 253,["297"] = 253,["298"] = 253,["299"] = 253,["300"] = 253,["304"] = 235,["305"] = 224,["306"] = 223,["307"] = 224,["309"] = 224,["310"] = 258,["311"] = 259,["312"] = 258,["313"] = 259,["314"] = 260,["315"] = 261,["318"] = 262,["319"] = 263,["320"] = 264,["323"] = 265,["324"] = 266,["325"] = 266,["326"] = 266,["327"] = 266,["328"] = 266,["329"] = 266,["330"] = 266,["331"] = 266,["332"] = 266,["333"] = 266,["334"] = 260,["335"] = 277,["336"] = 278,["337"] = 278,["339"] = 279,["340"] = 279,["342"] = 280,["343"] = 281,["344"] = 281,["346"] = 282,["347"] = 282,["349"] = 284,["350"] = 285,["351"] = 286,["352"] = 287,["353"] = 288,["354"] = 289,["355"] = 290,["357"] = 292,["358"] = 293,["359"] = 295,["360"] = 296,["361"] = 297,["363"] = 299,["364"] = 299,["365"] = 299,["366"] = 299,["367"] = 299,["368"] = 299,["369"] = 299,["370"] = 306,["371"] = 308,["372"] = 309,["374"] = 312,["375"] = 313,["376"] = 313,["377"] = 313,["378"] = 313,["379"] = 313,["380"] = 318,["381"] = 318,["382"] = 318,["383"] = 318,["384"] = 318,["385"] = 323,["386"] = 323,["387"] = 323,["388"] = 323,["389"] = 323,["390"] = 323,["391"] = 323,["392"] = 323,["393"] = 323,["394"] = 323,["395"] = 323,["396"] = 334,["398"] = 335,["399"] = 335,["401"] = 336,["402"] = 336,["403"] = 336,["404"] = 336,["405"] = 336,["406"] = 336,["407"] = 336,["408"] = 343,["413"] = 346,["414"] = 277,["415"] = 259,["416"] = 258,["417"] = 259,["419"] = 259,["420"] = 350,["421"] = 351,["422"] = 350,["423"] = 351,["424"] = 352,["425"] = 353,["426"] = 352,["427"] = 355,["428"] = 356,["429"] = 355,["430"] = 358,["431"] = 359,["432"] = 358,["433"] = 361,["434"] = 362,["435"] = 361,["436"] = 364,["437"] = 365,["438"] = 364,["439"] = 351,["440"] = 350,["441"] = 351,["443"] = 351,["444"] = 371,["445"] = 372,["446"] = 371,["447"] = 372,["448"] = 373,["449"] = 374,["450"] = 373,["451"] = 376,["452"] = 377,["453"] = 376,["454"] = 379,["455"] = 380,["456"] = 379,["457"] = 382,["458"] = 383,["459"] = 382,["460"] = 385,["461"] = 386,["462"] = 386,["463"] = 386,["464"] = 386,["465"] = 385,["466"] = 391,["467"] = 392,["468"] = 391,["469"] = 394,["470"] = 395,["473"] = 396,["474"] = 397,["477"] = 398,["478"] = 399,["481"] = 400,["482"] = 401,["483"] = 402,["484"] = 403,["486"] = 394,["487"] = 372,["488"] = 371,["489"] = 372,["491"] = 372});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local SCRIPT_PATH = "abilities/morph/evo_morph_water"
local WATER_QW_MODS = {
    "modifier_evo_morph_wet",
    "modifier_evo_morph_water_q_dash",
    "modifier_evo_morph_water_q_trail",
    "modifier_evo_morph_water_w_root",
    "modifier_evo_morph_water_w_mr"
}
for ____, modName in ipairs(WATER_QW_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
____exports.modifier_evo_morph_wet = __TS__Class()
local modifier_evo_morph_wet = ____exports.modifier_evo_morph_wet
modifier_evo_morph_wet.name = "modifier_evo_morph_wet"
__TS__ClassExtends(modifier_evo_morph_wet, BaseModifier)
function modifier_evo_morph_wet.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_wet.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_wet.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_wet.prototype.GetTexture(self)
    return "morphling_waveform"
end
function modifier_evo_morph_wet.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_morph_wet.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -20
end
modifier_evo_morph_wet = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_wet")},
    modifier_evo_morph_wet
)
____exports.modifier_evo_morph_wet = modifier_evo_morph_wet
____exports.evo_morph_water_q = __TS__Class()
local evo_morph_water_q = ____exports.evo_morph_water_q
evo_morph_water_q.name = "evo_morph_water_q"
__TS__ClassExtends(evo_morph_water_q, BaseAbility)
function evo_morph_water_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local maxDist = self:GetSpecialValueFor("dash_range")
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local rawDist = delta:Length2D()
    local dir = rawDist > 1 and delta:Normalized() or caster:GetForwardVector()
    local distance = math.min(
        maxDist,
        math.max(150, rawDist)
    )
    local speed = 1550
    local duration = math.max(0.14, distance / speed)
    caster:SetForwardVector(dir)
    caster:EmitSound("Hero_Morphling.Waveform")
    caster:AddNewModifier(caster, self, "modifier_evo_morph_water_q_dash", {duration = duration, dir_x = dir.x, dir_y = dir.y, speed = speed})
end
evo_morph_water_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_q")},
    evo_morph_water_q
)
____exports.evo_morph_water_q = evo_morph_water_q
____exports.modifier_evo_morph_water_q_dash = __TS__Class()
local modifier_evo_morph_water_q_dash = ____exports.modifier_evo_morph_water_q_dash
modifier_evo_morph_water_q_dash.name = "modifier_evo_morph_water_q_dash"
__TS__ClassExtends(modifier_evo_morph_water_q_dash, BaseModifier)
function modifier_evo_morph_water_q_dash.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.dirX = 1
    self.dirY = 0
    self.speed = 1550
    self.damage = 80
    self.level = 1
    self.tickCount = 0
    self.hitTargets = __TS__New(Set)
end
function modifier_evo_morph_water_q_dash.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_q_dash.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_q_dash.prototype.CheckState(self)
    return {
        [dotaModifierState(nil, "MODIFIER_STATE_NO_UNIT_COLLISION")] = true,
        [dotaModifierState(nil, "MODIFIER_STATE_COMMAND_RESTRICTED")] = true
    }
end
function modifier_evo_morph_water_q_dash.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.dirX = params.dir_x or 1
    self.dirY = params.dir_y or 0
    self.speed = params.speed or 1550
    local ab = self:GetAbility()
    self.damage = ab and ab:GetSpecialValueFor("damage") or 80
    self.level = ab and ab:GetLevel() or 1
    self.tickCount = 0
    self.hitTargets = __TS__New(Set)
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_waveform.vpcf", 1, parent)
    end
    self:StartIntervalThink(0.03)
end
function modifier_evo_morph_water_q_dash.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) or not parent:IsAlive() then
        self:Destroy()
        return
    end
    self.tickCount = self.tickCount + 1
    local pos = parent:GetAbsOrigin()
    local step = self.speed * 0.03
    local nextPos = Vector(pos.x + self.dirX * step, pos.y + self.dirY * step, pos.z)
    nextPos.z = GetGroundHeight(nextPos, parent)
    parent:SetAbsOrigin(nextPos)
    local ab = self:GetAbility()
    if self.level >= 2 and self.tickCount % 3 == 0 then
        CreateModifierThinker(
            parent,
            ab,
            "modifier_evo_morph_water_q_trail",
            {duration = 3},
            nextPos,
            parent:GetTeamNumber(),
            false
        )
    end
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        nextPos,
        nil,
        185,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue23
            end
            local id = enemy:entindex()
            if self.hitTargets:has(id) then
                goto __continue23
            end
            self.hitTargets:add(id)
            ApplyDamage({
                victim = enemy,
                attacker = parent,
                ability = ab,
                damage = self.damage,
                damage_type = 2
            })
            if self.level >= 2 then
                enemy:AddNewModifier(parent, ab, "modifier_evo_morph_wet", {duration = 2.5})
            end
        end
        ::__continue23::
    end
end
function modifier_evo_morph_water_q_dash.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.pfx ~= nil then
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = nil
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or not IsValidEntity(parent) then
        return
    end
    local endPos = parent:GetAbsOrigin()
    FindClearSpaceForUnit(parent, endPos, true)
    if self.level >= 3 then
        local ab = self:GetAbility()
        local enemies = FindUnitsInRadius(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            225,
            2,
            1 + 18,
            0,
            0,
            false
        )
        for ____, enemy in ipairs(enemies) do
            do
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                    goto __continue33
                end
                local toCenter = Vector(
                    parent:GetAbsOrigin().x - enemy:GetAbsOrigin().x,
                    parent:GetAbsOrigin().y - enemy:GetAbsOrigin().y,
                    0
                )
                local d = toCenter:Length2D()
                if d > 90 then
                    local dir = toCenter:Normalized()
                    local pulled = Vector(
                        enemy:GetAbsOrigin().x + dir.x * (d - 80),
                        enemy:GetAbsOrigin().y + dir.y * (d - 80),
                        enemy:GetAbsOrigin().z
                    )
                    FindClearSpaceForUnit(enemy, pulled, true)
                end
                enemy:AddNewModifier(parent, ab, "modifier_stunned", {duration = 0.2})
                enemy:AddNewModifier(parent, ab, "modifier_evo_morph_wet", {duration = 3})
            end
            ::__continue33::
        end
    end
end
modifier_evo_morph_water_q_dash = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_q_dash")},
    modifier_evo_morph_water_q_dash
)
____exports.modifier_evo_morph_water_q_dash = modifier_evo_morph_water_q_dash
____exports.modifier_evo_morph_water_q_trail = __TS__Class()
local modifier_evo_morph_water_q_trail = ____exports.modifier_evo_morph_water_q_trail
modifier_evo_morph_water_q_trail.name = "modifier_evo_morph_water_q_trail"
__TS__ClassExtends(modifier_evo_morph_water_q_trail, BaseModifier)
function modifier_evo_morph_water_q_trail.prototype.IsHidden(self)
    return true
end
function modifier_evo_morph_water_q_trail.prototype.IsPurgable(self)
    return false
end
function modifier_evo_morph_water_q_trail.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(0.35)
end
function modifier_evo_morph_water_q_trail.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not caster or caster:IsNull() or not parent or parent:IsNull() then
        return
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        170,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue44
            end
            enemy:AddNewModifier(
                caster,
                self:GetAbility(),
                "modifier_evo_morph_wet",
                {duration = 1.5}
            )
        end
        ::__continue44::
    end
end
modifier_evo_morph_water_q_trail = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_q_trail")},
    modifier_evo_morph_water_q_trail
)
____exports.modifier_evo_morph_water_q_trail = modifier_evo_morph_water_q_trail
____exports.evo_morph_water_w = __TS__Class()
local evo_morph_water_w = ____exports.evo_morph_water_w
evo_morph_water_w.name = "evo_morph_water_w"
__TS__ClassExtends(evo_morph_water_w, BaseAbility)
function evo_morph_water_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not caster or caster:IsNull() or not target or target:IsNull() then
        return
    end
    caster:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast")
    ProjectileManager:CreateTrackingProjectile({
        Target = target,
        Source = caster,
        Ability = self,
        EffectName = "particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf",
        iMoveSpeed = 1200,
        bDodgeable = true,
        bProvidesVision = false,
        iSourceAttachment = 1
    })
end
function evo_morph_water_w.prototype.OnProjectileHit(self, target)
    if not IsServer() then
        return true
    end
    if not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return true
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return true
    end
    if target:TriggerSpellAbsorb(self) then
        return true
    end
    local level = self:GetLevel()
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local statPct = self:GetSpecialValueFor("stat_pct") / 100
    local statSum = 0
    if caster:IsRealHero() then
        local hero = caster
        statSum = hero:GetStrength() + hero:GetAgility()
    end
    local totalDmg = baseDmg + statSum * statPct
    local wasWet = target:HasModifier("modifier_evo_morph_wet")
    target:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target")
    if level >= 3 then
        target:AddNewModifier(caster, self, "modifier_evo_morph_water_w_mr", {duration = 4})
    end
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = totalDmg,
        damage_type = 2
    })
    target:AddNewModifier(caster, self, "modifier_evo_morph_wet", {duration = 2})
    if level >= 2 and wasWet then
        target:AddNewModifier(caster, self, "modifier_evo_morph_water_w_root", {duration = 1.2})
    end
    if level >= 2 then
        local dir = Vector(
            target:GetAbsOrigin().x - caster:GetAbsOrigin().x,
            target:GetAbsOrigin().y - caster:GetAbsOrigin().y,
            0
        ):Normalized()
        local splashOrigin = Vector(
            target:GetAbsOrigin().x + dir.x * 160,
            target:GetAbsOrigin().y + dir.y * 160,
            target:GetAbsOrigin().z
        )
        local splashTargets = FindUnitsInRadius(
            caster:GetTeamNumber(),
            splashOrigin,
            nil,
            220,
            2,
            1 + 18,
            0,
            0,
            false
        )
        for ____, enemy in ipairs(splashTargets) do
            do
                if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() or enemy == target then
                    goto __continue59
                end
                ApplyDamage({
                    victim = enemy,
                    attacker = caster,
                    ability = self,
                    damage = totalDmg * 0.5,
                    damage_type = 2
                })
                enemy:AddNewModifier(caster, self, "modifier_evo_morph_wet", {duration = 2})
            end
            ::__continue59::
        end
    end
    return true
end
evo_morph_water_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_morph_water_w")},
    evo_morph_water_w
)
____exports.evo_morph_water_w = evo_morph_water_w
____exports.modifier_evo_morph_water_w_root = __TS__Class()
local modifier_evo_morph_water_w_root = ____exports.modifier_evo_morph_water_w_root
modifier_evo_morph_water_w_root.name = "modifier_evo_morph_water_w_root"
__TS__ClassExtends(modifier_evo_morph_water_w_root, BaseModifier)
function modifier_evo_morph_water_w_root.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_w_root.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_water_w_root.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_w_root.prototype.GetTexture(self)
    return "morphling_adaptive_strike_str"
end
function modifier_evo_morph_water_w_root.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_ROOTED")] = true}
end
modifier_evo_morph_water_w_root = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_w_root")},
    modifier_evo_morph_water_w_root
)
____exports.modifier_evo_morph_water_w_root = modifier_evo_morph_water_w_root
____exports.modifier_evo_morph_water_w_mr = __TS__Class()
local modifier_evo_morph_water_w_mr = ____exports.modifier_evo_morph_water_w_mr
modifier_evo_morph_water_w_mr.name = "modifier_evo_morph_water_w_mr"
__TS__ClassExtends(modifier_evo_morph_water_w_mr, BaseModifier)
function modifier_evo_morph_water_w_mr.prototype.IsHidden(self)
    return false
end
function modifier_evo_morph_water_w_mr.prototype.IsDebuff(self)
    return true
end
function modifier_evo_morph_water_w_mr.prototype.IsPurgable(self)
    return true
end
function modifier_evo_morph_water_w_mr.prototype.GetTexture(self)
    return "morphling_adaptive_strike_agi"
end
function modifier_evo_morph_water_w_mr.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_DEATH")
    }
end
function modifier_evo_morph_water_w_mr.prototype.GetModifierMagicalResistanceBonus(self)
    return -15
end
function modifier_evo_morph_water_w_mr.prototype.OnDeath(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() or event.unit ~= parent then
        return
    end
    local ab = self:GetAbility()
    if not ab or ab:IsNull() then
        return
    end
    local rem = ab:GetCooldownTimeRemaining()
    if rem > 0 then
        ab:EndCooldown()
        ab:StartCooldown(rem * 0.5)
    end
end
modifier_evo_morph_water_w_mr = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_morph_water_w_mr")},
    modifier_evo_morph_water_w_mr
)
____exports.modifier_evo_morph_water_w_mr = modifier_evo_morph_water_w_mr
return ____exports
