local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 19,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 26,["33"] = 28,["34"] = 29,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 30,["43"] = 33,["44"] = 34,["47"] = 35,["48"] = 36,["49"] = 37,["52"] = 39,["53"] = 40,["54"] = 41,["55"] = 42,["56"] = 43,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 45,["61"] = 45,["62"] = 45,["63"] = 45,["64"] = 45,["65"] = 45,["66"] = 45,["67"] = 47,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 48,["72"] = 48,["73"] = 48,["74"] = 48,["75"] = 48,["76"] = 48,["77"] = 49,["78"] = 50,["79"] = 50,["80"] = 50,["81"] = 51,["82"] = 52,["83"] = 53,["84"] = 50,["85"] = 50,["86"] = 55,["87"] = 56,["88"] = 56,["89"] = 56,["90"] = 56,["91"] = 56,["92"] = 56,["93"] = 56,["94"] = 56,["95"] = 56,["96"] = 56,["97"] = 56,["100"] = 33,["101"] = 60,["102"] = 71,["103"] = 72,["104"] = 73,["105"] = 74,["107"] = 77,["108"] = 78,["109"] = 79,["110"] = 84,["111"] = 85,["112"] = 85,["113"] = 85,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 85,["118"] = 85,["119"] = 85,["121"] = 87,["122"] = 89,["123"] = 89,["124"] = 89,["125"] = 89,["126"] = 89,["127"] = 89,["128"] = 89,["129"] = 97,["130"] = 98,["131"] = 99,["133"] = 60,["134"] = 29,["135"] = 28,["136"] = 29,["138"] = 29,["139"] = 107,["140"] = 108,["141"] = 107,["142"] = 108,["144"] = 108,["145"] = 109,["146"] = 107,["147"] = 111,["148"] = 112,["149"] = 111,["150"] = 114,["151"] = 115,["152"] = 114,["153"] = 117,["154"] = 118,["155"] = 117,["156"] = 120,["157"] = 121,["158"] = 120,["159"] = 123,["160"] = 124,["161"] = 123,["162"] = 126,["163"] = 127,["164"] = 126,["165"] = 129,["166"] = 130,["167"] = 131,["168"] = 129,["169"] = 135,["170"] = 136,["171"] = 135,["172"] = 138,["173"] = 139,["174"] = 138,["175"] = 108,["176"] = 107,["177"] = 108,["179"] = 108,["180"] = 143,["181"] = 144,["182"] = 143,["183"] = 144,["184"] = 145,["185"] = 146,["186"] = 146,["187"] = 146,["188"] = 146,["189"] = 145,["190"] = 148,["191"] = 149,["192"] = 148,["193"] = 144,["194"] = 143,["195"] = 144,["197"] = 144,["198"] = 153,["199"] = 154,["200"] = 153,["201"] = 154,["203"] = 154,["204"] = 155,["205"] = 153,["206"] = 157,["207"] = 158,["208"] = 157,["209"] = 160,["210"] = 161,["211"] = 160,["212"] = 163,["213"] = 164,["214"] = 163,["215"] = 166,["216"] = 167,["217"] = 166,["218"] = 169,["219"] = 170,["220"] = 170,["221"] = 170,["222"] = 170,["223"] = 169,["224"] = 175,["225"] = 176,["228"] = 177,["229"] = 178,["230"] = 179,["233"] = 181,["234"] = 182,["235"] = 183,["238"] = 184,["241"] = 185,["242"] = 186,["243"] = 188,["244"] = 189,["245"] = 190,["246"] = 191,["247"] = 192,["248"] = 193,["249"] = 194,["250"] = 194,["251"] = 194,["252"] = 194,["253"] = 198,["254"] = 198,["255"] = 198,["256"] = 198,["257"] = 198,["258"] = 198,["259"] = 194,["260"] = 194,["261"] = 194,["262"] = 194,["263"] = 194,["265"] = 204,["266"] = 205,["267"] = 206,["268"] = 207,["269"] = 208,["270"] = 209,["271"] = 210,["272"] = 215,["273"] = 216,["274"] = 216,["275"] = 216,["276"] = 216,["277"] = 216,["278"] = 217,["279"] = 219,["280"] = 220,["281"] = 220,["282"] = 220,["283"] = 220,["284"] = 220,["285"] = 220,["286"] = 220,["287"] = 227,["288"] = 228,["289"] = 228,["290"] = 228,["291"] = 228,["292"] = 228,["293"] = 228,["294"] = 228,["295"] = 228,["296"] = 228,["302"] = 235,["303"] = 236,["304"] = 237,["305"] = 238,["306"] = 238,["307"] = 238,["308"] = 238,["309"] = 239,["310"] = 240,["313"] = 175,["314"] = 244,["315"] = 245,["318"] = 246,["319"] = 247,["320"] = 248,["323"] = 249,["326"] = 250,["327"] = 251,["330"] = 254,["331"] = 255,["334"] = 257,["335"] = 258,["336"] = 259,["337"] = 259,["338"] = 259,["339"] = 259,["340"] = 259,["341"] = 259,["342"] = 259,["344"] = 262,["345"] = 263,["346"] = 264,["347"] = 265,["348"] = 266,["351"] = 270,["352"] = 271,["353"] = 272,["354"] = 272,["355"] = 272,["356"] = 272,["357"] = 272,["358"] = 272,["359"] = 272,["360"] = 272,["363"] = 244,["364"] = 283,["365"] = 284,["366"] = 285,["367"] = 286,["368"] = 287,["369"] = 287,["370"] = 287,["371"] = 287,["372"] = 288,["373"] = 289,["374"] = 290,["376"] = 283,["377"] = 154,["378"] = 153,["379"] = 154,["381"] = 154,["382"] = 295,["383"] = 296,["384"] = 295,["385"] = 296,["386"] = 297,["387"] = 298,["388"] = 297,["389"] = 300,["390"] = 301,["391"] = 300,["392"] = 303,["393"] = 304,["394"] = 303,["395"] = 306,["396"] = 307,["397"] = 306,["398"] = 309,["399"] = 310,["400"] = 310,["401"] = 310,["402"] = 310,["403"] = 309,["404"] = 315,["405"] = 316,["406"] = 317,["407"] = 317,["409"] = 318,["410"] = 315,["411"] = 320,["412"] = 321,["413"] = 322,["414"] = 322,["416"] = 323,["417"] = 320,["418"] = 296,["419"] = 295,["420"] = 296,["422"] = 296,["423"] = 327,["424"] = 328,["425"] = 327,["426"] = 328,["427"] = 332,["428"] = 333,["429"] = 332,["430"] = 335,["431"] = 336,["432"] = 335,["433"] = 338,["434"] = 339,["435"] = 340,["436"] = 341,["439"] = 342,["440"] = 343,["441"] = 338,["442"] = 345,["443"] = 346,["446"] = 347,["447"] = 345,["448"] = 349,["449"] = 350,["450"] = 349,["451"] = 352,["452"] = 353,["455"] = 354,["456"] = 355,["457"] = 356,["460"] = 357,["463"] = 358,["464"] = 359,["465"] = 360,["468"] = 361,["471"] = 362,["472"] = 363,["473"] = 364,["474"] = 365,["476"] = 352,["477"] = 328,["478"] = 327,["479"] = 328,["481"] = 328,["482"] = 370,["483"] = 371,["484"] = 370,["485"] = 371,["486"] = 372,["487"] = 373,["488"] = 372,["489"] = 375,["490"] = 376,["491"] = 375,["492"] = 378,["493"] = 379,["494"] = 378,["495"] = 381,["496"] = 382,["497"] = 381,["498"] = 384,["499"] = 385,["500"] = 384,["501"] = 371,["502"] = 370,["503"] = 371,["505"] = 371,["506"] = 391,["507"] = 392,["508"] = 391,["509"] = 392,["510"] = 393,["511"] = 394,["512"] = 393,["513"] = 396,["514"] = 397,["515"] = 396,["516"] = 399,["517"] = 400,["518"] = 399,["519"] = 402,["520"] = 403,["521"] = 402,["522"] = 405,["523"] = 406,["524"] = 405,["525"] = 408,["526"] = 409,["527"] = 408,["528"] = 392,["529"] = 391,["530"] = 392,["532"] = 392});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local dotaModifierState = ____dota_ts_adapter.dotaModifierState
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local applyPsiResonance = ____evo_nyx_shared.applyPsiResonance
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getNyxBranchMaxLevel = ____evo_nyx_shared.getNyxBranchMaxLevel
local getNyxInt = ____evo_nyx_shared.getNyxInt
local getNyxTier = ____evo_nyx_shared.getNyxTier
local knockbackUnitFrom = ____evo_nyx_shared.knockbackUnitFrom
local SCRIPT_PATH = "abilities/nyx/evo_nyx_archon"
LinkLuaModifier("modifier_evo_nyx_archon_w_silence", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_e", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_e_stack", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_q_field", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_q_silence", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_archon_e_slow", SCRIPT_PATH, 0)
____exports.evo_nyx_archon_w = __TS__Class()
local evo_nyx_archon_w = ____exports.evo_nyx_archon_w
evo_nyx_archon_w.name = "evo_nyx_archon_w"
__TS__ClassExtends(evo_nyx_archon_w, BaseAbility)
function evo_nyx_archon_w.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_archon_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target or target:IsNull() or not IsValidEntity(target) or target:TriggerSpellAbsorb(self) then
        return
    end
    local tier = getNyxTier(nil, caster)
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local intPct = self:GetSpecialValueFor("int_pct") / 100
    local enemyIntMult = self:GetSpecialValueFor("enemy_int_mult")
    local creepMult = self:GetSpecialValueFor("creep_mult")
    self:hitTarget(
        caster,
        target,
        baseDmg,
        intPct,
        enemyIntMult,
        creepMult,
        tier,
        1
    )
    if tier >= 4 then
        local nearby = __TS__ArrayFilter(
            findEnemiesInRadius(
                nil,
                caster,
                target:GetAbsOrigin(),
                450
            ),
            function(____, e) return e ~= target end
        )
        if #nearby > 0 then
            __TS__ArraySort(
                nearby,
                function(____, a, b)
                    local aRes = a:HasModifier("modifier_evo_nyx_psi_resonance") and 1 or 0
                    local bRes = b:HasModifier("modifier_evo_nyx_psi_resonance") and 1 or 0
                    return bRes - aRes
                end
            )
            local bounceTarget = nearby[1]
            self:hitTarget(
                caster,
                bounceTarget,
                baseDmg,
                intPct,
                enemyIntMult,
                creepMult,
                tier,
                0.75,
                target
            )
        end
    end
end
function evo_nyx_archon_w.prototype.hitTarget(self, caster, target, baseDmg, intPct, enemyIntMult, creepMult, tier, scale, fromUnit)
    local targetInt = target:IsRealHero() and target:GetIntellect(false) or 0
    local dmg = (baseDmg + getNyxInt(nil, caster) * intPct + targetInt * enemyIntMult) * scale
    if isEvoCreepUnit(nil, target) then
        dmg = dmg * creepMult
    end
    caster:EmitSound("Hero_NyxAssassin.ManaBurn.Cast")
    target:EmitSound("Hero_NyxAssassin.ManaBurn.Target")
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn.vpcf", 1, target)
    if fromUnit then
        ParticleManager:SetParticleControlEnt(
            pfx,
            1,
            fromUnit,
            5,
            "attach_hitloc",
            fromUnit:GetAbsOrigin(),
            true
        )
    end
    ParticleManager:ReleaseParticleIndex(pfx)
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = dmg,
        damage_type = 2
    })
    if tier >= 3 then
        local silDur = tier >= 4 and 1.6 or 1.2
        target:AddNewModifier(caster, self, "modifier_evo_nyx_archon_w_silence", {duration = 3, silenceDur = silDur})
    end
end
evo_nyx_archon_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_w")},
    evo_nyx_archon_w
)
____exports.evo_nyx_archon_w = evo_nyx_archon_w
____exports.modifier_evo_nyx_archon_w_silence = __TS__Class()
local modifier_evo_nyx_archon_w_silence = ____exports.modifier_evo_nyx_archon_w_silence
modifier_evo_nyx_archon_w_silence.name = "modifier_evo_nyx_archon_w_silence"
__TS__ClassExtends(modifier_evo_nyx_archon_w_silence, BaseModifier)
function modifier_evo_nyx_archon_w_silence.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.silenceUntil = -999
end
function modifier_evo_nyx_archon_w_silence.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_archon_w_silence.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_archon_w_silence.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_archon_w_silence.prototype.GetTexture(self)
    return "nyx_assassin_jolt"
end
function modifier_evo_nyx_archon_w_silence.prototype.OnCreated(self, params)
    self.silenceUntil = GameRules:GetDOTATime(false, false) + (params.silenceDur or 1.2)
end
function modifier_evo_nyx_archon_w_silence.prototype.OnRefresh(self, params)
    self.silenceUntil = GameRules:GetDOTATime(false, false) + (params.silenceDur or 1.2)
end
function modifier_evo_nyx_archon_w_silence.prototype.CheckState(self)
    local silenced = GameRules:GetDOTATime(false, false) <= self.silenceUntil
    return {[dotaModifierState(nil, "MODIFIER_STATE_SILENCED")] = silenced}
end
function modifier_evo_nyx_archon_w_silence.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_CASTTIME_PERCENTAGE")}
end
function modifier_evo_nyx_archon_w_silence.prototype.GetModifierPercentageCasttime(self)
    return -35
end
modifier_evo_nyx_archon_w_silence = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_w_silence")},
    modifier_evo_nyx_archon_w_silence
)
____exports.modifier_evo_nyx_archon_w_silence = modifier_evo_nyx_archon_w_silence
____exports.evo_nyx_archon_e = __TS__Class()
local evo_nyx_archon_e = ____exports.evo_nyx_archon_e
evo_nyx_archon_e.name = "evo_nyx_archon_e"
__TS__ClassExtends(evo_nyx_archon_e, BaseAbility)
function evo_nyx_archon_e.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_archon_e.prototype.GetIntrinsicModifierName(self)
    return "modifier_evo_nyx_archon_e"
end
evo_nyx_archon_e = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_archon_e")},
    evo_nyx_archon_e
)
____exports.evo_nyx_archon_e = evo_nyx_archon_e
____exports.modifier_evo_nyx_archon_e = __TS__Class()
local modifier_evo_nyx_archon_e = ____exports.modifier_evo_nyx_archon_e
modifier_evo_nyx_archon_e.name = "modifier_evo_nyx_archon_e"
__TS__ClassExtends(modifier_evo_nyx_archon_e, BaseModifier)
function modifier_evo_nyx_archon_e.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.lastGainCastTime = -999
end
function modifier_evo_nyx_archon_e.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_archon_e.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_archon_e.prototype.RemoveOnDeath(self)
    return false
end
function modifier_evo_nyx_archon_e.prototype.OnCreated(self)
    self.lastGainCastTime = -999
end
function modifier_evo_nyx_archon_e.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE")
    }
end
function modifier_evo_nyx_archon_e.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() or parent:PassivesDisabled() then
        return
    end
    local unit = event.unit
    local castAb = event.ability
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not castAb or castAb:IsNull() then
        return
    end
    if castAb:IsItem() or castAb:IsToggle() then
        return
    end
    local abName = castAb:GetAbilityName()
    local tier = getNyxTier(nil, parent)
    if unit == parent then
        if abName == "lion_impale" and tier >= 4 then
            local start = parent:GetAbsOrigin()
            local pos = castAb:GetCursorPosition()
            local dir = (pos - start):Normalized()
            local ____end = start + dir * 1000
            CreateModifierThinker(
                parent,
                ability,
                "modifier_evo_nyx_archon_q_field",
                {
                    duration = 2.5,
                    startX = start.x,
                    startY = start.y,
                    endX = ____end.x,
                    endY = ____end.y
                },
                (start + ____end) * 0.5,
                parent:GetTeamNumber(),
                false
            )
        end
        if tier >= 3 and (abName == "lion_impale" or abName == "evo_nyx_archon_w") then
            local stackMod = parent:FindModifierByName("modifier_evo_nyx_archon_e_stack")
            local maxStacks = ability:GetSpecialValueFor("max_stacks")
            if stackMod and stackMod:GetStackCount() >= maxStacks then
                local pulseDmg = 65 + getNyxInt(nil, parent) * 0.4
                local origin = parent:GetAbsOrigin()
                local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_sanity_eclipse_area.vpcf", 8, nil)
                ParticleManager:SetParticleControl(pfx, 0, origin)
                ParticleManager:SetParticleControl(
                    pfx,
                    1,
                    Vector(375, 1, 1)
                )
                ParticleManager:ReleaseParticleIndex(pfx)
                for ____, enemy in ipairs(findEnemiesInRadius(nil, parent, origin, 375)) do
                    ApplyDamage({
                        victim = enemy,
                        attacker = parent,
                        ability = ability,
                        damage = pulseDmg,
                        damage_type = 2
                    })
                    enemy:AddNewModifier(parent, ability, "modifier_evo_nyx_archon_e_slow", {duration = 2})
                    knockbackUnitFrom(
                        nil,
                        parent,
                        enemy,
                        origin,
                        125,
                        0.25,
                        40
                    )
                end
            end
        end
        return
    end
    if unit:GetTeamNumber() ~= parent:GetTeamNumber() and unit:IsRealHero() then
        local dist = (unit:GetAbsOrigin() - parent:GetAbsOrigin()):Length2D()
        local auraRadius = ability:GetSpecialValueFor("aura_radius")
        local manaCost = castAb:GetManaCost(math.max(
            0,
            castAb:GetLevel() - 1
        ))
        if dist <= auraRadius and manaCost > 0 then
            self:grantConcentration(parent, ability)
        end
    end
end
function modifier_evo_nyx_archon_e.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() or parent:PassivesDisabled() then
        return
    end
    if event.attacker ~= parent then
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
    local tier = getNyxTier(nil, parent)
    if inflictor:GetAbilityName() == "lion_impale" and tier >= 3 then
        applyPsiResonance(
            nil,
            parent,
            victim,
            inflictor,
            math.max(1, tier - 1)
        )
    end
    if event.damage_type == 2 and event.damage > 0 then
        local now = GameRules:GetDOTATime(false, false)
        if now - self.lastGainCastTime >= 0.15 then
            self.lastGainCastTime = now
            self:grantConcentration(parent, ability)
        end
    end
    if tier >= 4 and bit.band(event.damage_flags, 16) == 0 and event.damage > 0 then
        if victim:GetMaxMana() <= 0 or victim:GetManaPercent() < 40 then
            ApplyDamage({
                victim = victim,
                attacker = parent,
                ability = inflictor,
                damage = event.damage * 0.18,
                damage_type = 4,
                damage_flags = 1024 + 16
            })
        end
    end
end
function modifier_evo_nyx_archon_e.prototype.grantConcentration(self, parent, ability)
    local maxStacks = ability:GetSpecialValueFor("max_stacks")
    local dur = ability:GetSpecialValueFor("stack_duration")
    local ex = parent:FindModifierByName("modifier_evo_nyx_archon_e_stack")
    local next = math.min(
        maxStacks,
        (ex and ex:GetStackCount() or 0) + 1
    )
    local mod = parent:AddNewModifier(parent, ability, "modifier_evo_nyx_archon_e_stack", {duration = dur})
    if mod ~= nil then
        mod:SetStackCount(next)
    end
end
modifier_evo_nyx_archon_e = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_e")},
    modifier_evo_nyx_archon_e
)
____exports.modifier_evo_nyx_archon_e = modifier_evo_nyx_archon_e
____exports.modifier_evo_nyx_archon_e_stack = __TS__Class()
local modifier_evo_nyx_archon_e_stack = ____exports.modifier_evo_nyx_archon_e_stack
modifier_evo_nyx_archon_e_stack.name = "modifier_evo_nyx_archon_e_stack"
__TS__ClassExtends(modifier_evo_nyx_archon_e_stack, BaseModifier)
function modifier_evo_nyx_archon_e_stack.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_archon_e_stack.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_archon_e_stack.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_archon_e_stack.prototype.GetTexture(self)
    return "obsidian_destroyer_equilibrium"
end
function modifier_evo_nyx_archon_e_stack.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MANA_REGEN_CONSTANT")
    }
end
function modifier_evo_nyx_archon_e_stack.prototype.GetModifierSpellAmplification_Percentage(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("amp_per_stack")
end
function modifier_evo_nyx_archon_e_stack.prototype.GetModifierConstantManaRegen(self)
    local ability = self:GetAbility()
    if not ability or ability:IsNull() then
        return 0
    end
    return self:GetStackCount() * ability:GetSpecialValueFor("mp_regen_per_stack")
end
modifier_evo_nyx_archon_e_stack = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_e_stack")},
    modifier_evo_nyx_archon_e_stack
)
____exports.modifier_evo_nyx_archon_e_stack = modifier_evo_nyx_archon_e_stack
____exports.modifier_evo_nyx_archon_q_field = __TS__Class()
local modifier_evo_nyx_archon_q_field = ____exports.modifier_evo_nyx_archon_q_field
modifier_evo_nyx_archon_q_field.name = "modifier_evo_nyx_archon_q_field"
__TS__ClassExtends(modifier_evo_nyx_archon_q_field, BaseModifier)
function modifier_evo_nyx_archon_q_field.prototype.IsHidden(self)
    return true
end
function modifier_evo_nyx_archon_q_field.prototype.IsPurgable(self)
    return false
end
function modifier_evo_nyx_archon_q_field.prototype.OnCreated(self, params)
    self.startPos = nil
    self.endPos = nil
    if not IsServer() then
        return
    end
    self.startPos = Vector(params.startX or 0, params.startY or 0, 0)
    self.endPos = Vector(params.endX or 0, params.endY or 0, 0)
end
function modifier_evo_nyx_archon_q_field.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    UTIL_Remove(self:GetParent())
end
function modifier_evo_nyx_archon_q_field.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ABILITY_EXECUTED")}
end
function modifier_evo_nyx_archon_q_field.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if not caster or caster:IsNull() or not ability or ability:IsNull() then
        return
    end
    if not self.startPos or not self.endPos then
        return
    end
    local unit = event.unit
    local castAb = event.ability
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not castAb or castAb:IsNull() or castAb:IsItem() then
        return
    end
    if unit:GetTeamNumber() == caster:GetTeamNumber() then
        return
    end
    local pos = unit:GetAbsOrigin()
    local dist = CalcDistanceToLineSegment2D(pos, self.startPos, self.endPos)
    if dist <= 165 then
        unit:AddNewModifier(caster, ability, "modifier_evo_nyx_archon_q_silence", {duration = 1.5})
    end
end
modifier_evo_nyx_archon_q_field = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_q_field")},
    modifier_evo_nyx_archon_q_field
)
____exports.modifier_evo_nyx_archon_q_field = modifier_evo_nyx_archon_q_field
____exports.modifier_evo_nyx_archon_q_silence = __TS__Class()
local modifier_evo_nyx_archon_q_silence = ____exports.modifier_evo_nyx_archon_q_silence
modifier_evo_nyx_archon_q_silence.name = "modifier_evo_nyx_archon_q_silence"
__TS__ClassExtends(modifier_evo_nyx_archon_q_silence, BaseModifier)
function modifier_evo_nyx_archon_q_silence.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_archon_q_silence.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_archon_q_silence.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_archon_q_silence.prototype.GetTexture(self)
    return "lion_impale"
end
function modifier_evo_nyx_archon_q_silence.prototype.CheckState(self)
    return {[dotaModifierState(nil, "MODIFIER_STATE_SILENCED")] = true}
end
modifier_evo_nyx_archon_q_silence = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_q_silence")},
    modifier_evo_nyx_archon_q_silence
)
____exports.modifier_evo_nyx_archon_q_silence = modifier_evo_nyx_archon_q_silence
____exports.modifier_evo_nyx_archon_e_slow = __TS__Class()
local modifier_evo_nyx_archon_e_slow = ____exports.modifier_evo_nyx_archon_e_slow
modifier_evo_nyx_archon_e_slow.name = "modifier_evo_nyx_archon_e_slow"
__TS__ClassExtends(modifier_evo_nyx_archon_e_slow, BaseModifier)
function modifier_evo_nyx_archon_e_slow.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_archon_e_slow.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_archon_e_slow.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_archon_e_slow.prototype.GetTexture(self)
    return "obsidian_destroyer_equilibrium"
end
function modifier_evo_nyx_archon_e_slow.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_archon_e_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -25
end
modifier_evo_nyx_archon_e_slow = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_archon_e_slow")},
    modifier_evo_nyx_archon_e_slow
)
____exports.modifier_evo_nyx_archon_e_slow = modifier_evo_nyx_archon_e_slow
return ____exports
