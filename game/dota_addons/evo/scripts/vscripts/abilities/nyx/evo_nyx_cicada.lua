local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 2,["15"] = 3,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 11,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 17,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 24,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 23,["40"] = 28,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 28,["46"] = 31,["47"] = 32,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 37,["55"] = 38,["56"] = 40,["57"] = 40,["58"] = 40,["59"] = 40,["60"] = 40,["61"] = 40,["62"] = 40,["63"] = 40,["64"] = 40,["65"] = 41,["66"] = 42,["67"] = 42,["68"] = 44,["69"] = 45,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 46,["80"] = 48,["81"] = 42,["82"] = 42,["83"] = 42,["85"] = 31,["86"] = 54,["87"] = 63,["88"] = 64,["89"] = 65,["90"] = 65,["91"] = 65,["92"] = 65,["93"] = 67,["94"] = 68,["95"] = 68,["96"] = 68,["97"] = 68,["98"] = 68,["99"] = 68,["100"] = 68,["101"] = 68,["102"] = 68,["103"] = 68,["104"] = 68,["105"] = 68,["106"] = 68,["107"] = 68,["108"] = 68,["109"] = 68,["110"] = 68,["111"] = 54,["112"] = 86,["113"] = 91,["114"] = 92,["116"] = 94,["117"] = 95,["118"] = 96,["119"] = 97,["120"] = 98,["121"] = 98,["123"] = 99,["125"] = 102,["126"] = 103,["127"] = 104,["128"] = 105,["129"] = 106,["130"] = 107,["131"] = 108,["132"] = 109,["134"] = 111,["135"] = 112,["137"] = 115,["138"] = 115,["139"] = 115,["140"] = 115,["141"] = 115,["142"] = 115,["143"] = 115,["144"] = 122,["145"] = 122,["146"] = 122,["147"] = 122,["148"] = 122,["149"] = 122,["150"] = 122,["151"] = 123,["152"] = 125,["153"] = 126,["154"] = 127,["155"] = 128,["156"] = 129,["157"] = 130,["158"] = 131,["159"] = 132,["164"] = 137,["165"] = 86,["166"] = 24,["167"] = 23,["168"] = 24,["170"] = 24,["171"] = 141,["172"] = 142,["173"] = 141,["174"] = 142,["175"] = 143,["176"] = 144,["177"] = 143,["178"] = 146,["179"] = 147,["180"] = 146,["181"] = 149,["182"] = 150,["183"] = 149,["184"] = 152,["185"] = 153,["186"] = 152,["187"] = 155,["188"] = 156,["189"] = 155,["190"] = 158,["191"] = 159,["192"] = 160,["193"] = 158,["194"] = 142,["195"] = 141,["196"] = 142,["198"] = 142,["199"] = 164,["200"] = 165,["201"] = 164,["202"] = 165,["203"] = 166,["204"] = 167,["205"] = 167,["206"] = 167,["207"] = 167,["208"] = 166,["209"] = 169,["210"] = 170,["213"] = 171,["214"] = 172,["215"] = 173,["216"] = 169,["217"] = 165,["218"] = 164,["219"] = 165,["221"] = 165,["222"] = 177,["223"] = 178,["224"] = 177,["225"] = 178,["226"] = 179,["227"] = 180,["228"] = 179,["229"] = 182,["230"] = 183,["231"] = 182,["232"] = 185,["233"] = 186,["234"] = 185,["235"] = 188,["236"] = 189,["237"] = 188,["238"] = 191,["239"] = 192,["240"] = 192,["241"] = 192,["242"] = 192,["243"] = 191,["244"] = 197,["245"] = 198,["246"] = 199,["247"] = 197,["248"] = 201,["249"] = 202,["252"] = 203,["253"] = 204,["254"] = 205,["257"] = 206,["260"] = 207,["261"] = 208,["264"] = 211,["265"] = 212,["266"] = 212,["267"] = 212,["268"] = 212,["269"] = 212,["270"] = 212,["271"] = 212,["272"] = 219,["273"] = 219,["274"] = 219,["275"] = 219,["276"] = 219,["277"] = 219,["278"] = 219,["279"] = 219,["280"] = 219,["281"] = 223,["282"] = 224,["284"] = 226,["285"] = 201,["286"] = 178,["287"] = 177,["288"] = 178,["290"] = 178,["291"] = 230,["292"] = 231,["293"] = 230,["294"] = 231,["296"] = 231,["297"] = 232,["298"] = 233,["299"] = 234,["300"] = 230,["301"] = 236,["302"] = 237,["303"] = 236,["304"] = 239,["305"] = 240,["306"] = 239,["307"] = 242,["308"] = 243,["309"] = 242,["310"] = 245,["311"] = 246,["312"] = 245,["313"] = 248,["314"] = 249,["315"] = 250,["316"] = 251,["317"] = 248,["318"] = 253,["319"] = 254,["320"] = 255,["321"] = 256,["322"] = 253,["323"] = 258,["324"] = 259,["325"] = 259,["326"] = 259,["327"] = 259,["328"] = 258,["329"] = 264,["330"] = 265,["333"] = 266,["334"] = 267,["335"] = 268,["338"] = 269,["339"] = 264,["340"] = 271,["341"] = 272,["344"] = 273,["345"] = 274,["346"] = 275,["349"] = 276,["352"] = 277,["355"] = 278,["356"] = 271,["357"] = 280,["358"] = 281,["361"] = 282,["362"] = 283,["363"] = 284,["364"] = 285,["367"] = 288,["368"] = 289,["371"] = 290,["372"] = 292,["373"] = 293,["374"] = 294,["375"] = 298,["376"] = 298,["377"] = 298,["378"] = 298,["379"] = 298,["380"] = 298,["381"] = 298,["382"] = 299,["383"] = 300,["384"] = 302,["385"] = 303,["386"] = 304,["387"] = 305,["388"] = 306,["389"] = 306,["390"] = 306,["391"] = 306,["392"] = 306,["393"] = 306,["394"] = 309,["395"] = 310,["396"] = 313,["398"] = 315,["399"] = 316,["400"] = 316,["401"] = 316,["402"] = 316,["403"] = 316,["404"] = 316,["405"] = 316,["406"] = 316,["407"] = 316,["408"] = 317,["409"] = 318,["410"] = 318,["411"] = 318,["412"] = 319,["413"] = 320,["414"] = 321,["415"] = 318,["416"] = 318,["417"] = 323,["418"] = 323,["419"] = 323,["420"] = 323,["421"] = 323,["422"] = 323,["423"] = 323,["426"] = 326,["428"] = 280,["429"] = 329,["430"] = 336,["431"] = 341,["432"] = 342,["433"] = 344,["434"] = 345,["435"] = 345,["436"] = 345,["437"] = 345,["438"] = 345,["439"] = 345,["440"] = 345,["442"] = 329,["443"] = 231,["444"] = 230,["445"] = 231,["447"] = 231});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
local ____evo_nyx_shared = require("abilities.nyx.evo_nyx_shared")
local applyAcousticDisruption = ____evo_nyx_shared.applyAcousticDisruption
local findEnemiesInRadius = ____evo_nyx_shared.findEnemiesInRadius
local getNyxAllAttrSum = ____evo_nyx_shared.getNyxAllAttrSum
local getNyxBranchMaxLevel = ____evo_nyx_shared.getNyxBranchMaxLevel
local getNyxTier = ____evo_nyx_shared.getNyxTier
local SCRIPT_PATH = "abilities/nyx/evo_nyx_cicada"
LinkLuaModifier("modifier_evo_nyx_cicada_q_ms", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_cicada_w_buff", SCRIPT_PATH, 0)
LinkLuaModifier("modifier_evo_nyx_cicada_w_sting", SCRIPT_PATH, 0)
____exports.evo_nyx_cicada_q = __TS__Class()
local evo_nyx_cicada_q = ____exports.evo_nyx_cicada_q
evo_nyx_cicada_q.name = "evo_nyx_cicada_q"
__TS__ClassExtends(evo_nyx_cicada_q, BaseAbility)
function evo_nyx_cicada_q.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.hitTracker = __TS__New(Map)
    self.projSeq = 0
end
function evo_nyx_cicada_q.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_cicada_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local tier = getNyxTier(nil, caster)
    local origin = caster:GetAbsOrigin()
    local dir = (self:GetCursorPosition() - origin):Normalized()
    local range = self:GetSpecialValueFor("range")
    local width = self:GetSpecialValueFor("width")
    self:launchWave(
        caster,
        origin,
        dir,
        range,
        width,
        tier,
        false
    )
    if tier >= 3 then
        GameRules:GetGameModeEntity():SetContextThink(
            DoUniqueString("evo_cicada_echo"),
            function()
                if caster and not caster:IsNull() and IsValidEntity(caster) and self and not self:IsNull() then
                    self:launchWave(
                        caster,
                        origin,
                        dir,
                        range,
                        140,
                        tier,
                        true
                    )
                end
                return nil
            end,
            0.6
        )
    end
end
function evo_nyx_cicada_q.prototype.launchWave(self, caster, origin, dir, range, width, tier, isEcho)
    self.projSeq = self.projSeq + 1
    local waveId = self.projSeq
    self.hitTracker:set(
        waveId,
        __TS__New(Set)
    )
    caster:EmitSound("Hero_QueenOfPain.SonicWave")
    ProjectileManager:CreateLinearProjectile({
        Ability = self,
        EffectName = "particles/units/heroes/hero_queenofpain/queen_sonic_wave.vpcf",
        vSpawnOrigin = origin,
        fDistance = range,
        fStartRadius = width,
        fEndRadius = width,
        Source = caster,
        bHasFrontalCone = false,
        iUnitTargetTeam = 2,
        iUnitTargetFlags = 0,
        iUnitTargetType = 1 + 18,
        fExpireTime = GameRules:GetGameTime() + 4,
        vVelocity = dir * 1350,
        bProvidesVision = false,
        ExtraData = {waveId = waveId, isEcho = isEcho and 1 or 0, tier = tier}
    })
end
function evo_nyx_cicada_q.prototype.OnProjectileHit_ExtraData(self, target, _location, extraData)
    if not IsServer() or not target or target:IsNull() or not IsValidEntity(target) or not target:IsAlive() then
        return false
    end
    local waveId = extraData.waveId or 0
    local tracked = self.hitTracker:get(waveId)
    if tracked then
        local idx = target:GetEntityIndex()
        if tracked:has(idx) then
            return false
        end
        tracked:add(idx)
    end
    local caster = self:GetCaster()
    local isEcho = (extraData.isEcho or 0) == 1
    local tier = extraData.tier or getNyxTier(nil, caster)
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local allPct = self:GetSpecialValueFor("all_pct") / 100
    local dmg = baseDmg + getNyxAllAttrSum(nil, caster) * allPct
    if isEcho then
        dmg = dmg * 0.5
    end
    if isEvoCreepUnit(nil, target) then
        dmg = dmg * self:GetSpecialValueFor("creep_mult")
    end
    ApplyDamage({
        victim = target,
        attacker = caster,
        ability = self,
        damage = dmg,
        damage_type = 2
    })
    applyAcousticDisruption(
        nil,
        caster,
        target,
        self,
        math.max(1, tier - 1)
    )
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_cicada_q_ms", {duration = 2.5})
    if not isEcho and tier >= 4 and target:IsRealHero() then
        for ____, name in ipairs({"evo_nyx_cicada_q", "evo_nyx_cicada_w", "evo_nyx_cicada_e"}) do
            local ab = caster:FindAbilityByName(name)
            if ab and not ab:IsNull() then
                local rem = ab:GetCooldownTimeRemaining()
                if rem > 0 then
                    ab:EndCooldown()
                    ab:StartCooldown(math.max(0.05, rem - 0.8))
                end
            end
        end
    end
    return false
end
evo_nyx_cicada_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_q")},
    evo_nyx_cicada_q
)
____exports.evo_nyx_cicada_q = evo_nyx_cicada_q
____exports.modifier_evo_nyx_cicada_q_ms = __TS__Class()
local modifier_evo_nyx_cicada_q_ms = ____exports.modifier_evo_nyx_cicada_q_ms
modifier_evo_nyx_cicada_q_ms.name = "modifier_evo_nyx_cicada_q_ms"
__TS__ClassExtends(modifier_evo_nyx_cicada_q_ms, BaseModifier)
function modifier_evo_nyx_cicada_q_ms.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_cicada_q_ms.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_cicada_q_ms.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_cicada_q_ms.prototype.GetTexture(self)
    return "queenofpain_sonic_wave"
end
function modifier_evo_nyx_cicada_q_ms.prototype.DeclareFunctions(self)
    return {dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")}
end
function modifier_evo_nyx_cicada_q_ms.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local ability = self:GetAbility()
    return ability and not ability:IsNull() and ability:GetSpecialValueFor("ms_bonus_pct") or 14
end
modifier_evo_nyx_cicada_q_ms = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_cicada_q_ms")},
    modifier_evo_nyx_cicada_q_ms
)
____exports.modifier_evo_nyx_cicada_q_ms = modifier_evo_nyx_cicada_q_ms
____exports.evo_nyx_cicada_w = __TS__Class()
local evo_nyx_cicada_w = ____exports.evo_nyx_cicada_w
evo_nyx_cicada_w.name = "evo_nyx_cicada_w"
__TS__ClassExtends(evo_nyx_cicada_w, BaseAbility)
function evo_nyx_cicada_w.prototype.GetMaxLevel(self)
    return getNyxBranchMaxLevel(
        nil,
        self:GetCaster()
    )
end
function evo_nyx_cicada_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    caster:EmitSound("Hero_Silencer.GlaivesOfWisdom")
    caster:AddNewModifier(caster, self, "modifier_evo_nyx_cicada_w_buff", {duration = 8})
end
evo_nyx_cicada_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_nyx_cicada_w")},
    evo_nyx_cicada_w
)
____exports.evo_nyx_cicada_w = evo_nyx_cicada_w
____exports.modifier_evo_nyx_cicada_w_buff = __TS__Class()
local modifier_evo_nyx_cicada_w_buff = ____exports.modifier_evo_nyx_cicada_w_buff
modifier_evo_nyx_cicada_w_buff.name = "modifier_evo_nyx_cicada_w_buff"
__TS__ClassExtends(modifier_evo_nyx_cicada_w_buff, BaseModifier)
function modifier_evo_nyx_cicada_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_cicada_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_nyx_cicada_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_cicada_w_buff.prototype.GetTexture(self)
    return "silencer_glaives_of_wisdom"
end
function modifier_evo_nyx_cicada_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACK_RANGE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_nyx_cicada_w_buff.prototype.GetModifierAttackRangeBonus(self)
    local ability = self:GetAbility()
    return ability and not ability:IsNull() and ability:GetSpecialValueFor("range_bonus") or 150
end
function modifier_evo_nyx_cicada_w_buff.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not parent or parent:IsNull() or not ability or ability:IsNull() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local target = event.target
    if not target or target:IsNull() or not IsValidEntity(target) or target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    local dmg = ability:GetSpecialValueFor("base_damage") + getNyxAllAttrSum(nil, parent) * ability:GetSpecialValueFor("all_pct") / 100
    ApplyDamage({
        victim = target,
        attacker = parent,
        ability = ability,
        damage = dmg,
        damage_type = 1
    })
    local sting = target:AddNewModifier(
        parent,
        ability,
        "modifier_evo_nyx_cicada_w_sting",
        {
            duration = ability:GetSpecialValueFor("sting_duration"),
            implantTime = GameRules:GetDOTATime(false, false)
        }
    )
    if sting ~= nil then
        sting:SetStackCount(0)
    end
    self:Destroy()
end
modifier_evo_nyx_cicada_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_cicada_w_buff")},
    modifier_evo_nyx_cicada_w_buff
)
____exports.modifier_evo_nyx_cicada_w_buff = modifier_evo_nyx_cicada_w_buff
____exports.modifier_evo_nyx_cicada_w_sting = __TS__Class()
local modifier_evo_nyx_cicada_w_sting = ____exports.modifier_evo_nyx_cicada_w_sting
modifier_evo_nyx_cicada_w_sting.name = "modifier_evo_nyx_cicada_w_sting"
__TS__ClassExtends(modifier_evo_nyx_cicada_w_sting, BaseModifier)
function modifier_evo_nyx_cicada_w_sting.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.implantTime = -999
    self.lastTriggerTime = -999
    self.shattered = false
end
function modifier_evo_nyx_cicada_w_sting.prototype.IsHidden(self)
    return false
end
function modifier_evo_nyx_cicada_w_sting.prototype.IsDebuff(self)
    return true
end
function modifier_evo_nyx_cicada_w_sting.prototype.IsPurgable(self)
    return true
end
function modifier_evo_nyx_cicada_w_sting.prototype.GetTexture(self)
    return "silencer_glaives_of_wisdom"
end
function modifier_evo_nyx_cicada_w_sting.prototype.OnCreated(self, params)
    self.implantTime = params.implantTime or GameRules:GetDOTATime(false, false)
    self.lastTriggerTime = self.implantTime
    self.shattered = false
end
function modifier_evo_nyx_cicada_w_sting.prototype.OnRefresh(self, params)
    self.implantTime = params.implantTime or GameRules:GetDOTATime(false, false)
    self.lastTriggerTime = self.implantTime
    self.shattered = false
end
function modifier_evo_nyx_cicada_w_sting.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_TAKEDAMAGE"),
        dotaModifierFunction(nil, "MODIFIER_EVENT_ON_ATTACK_LANDED")
    }
end
function modifier_evo_nyx_cicada_w_sting.prototype.OnAttackLanded(self, event)
    if not IsServer() or self.shattered then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetParent()
    if not caster or caster:IsNull() or event.attacker ~= caster or event.target ~= target then
        return
    end
    self:advancePulse()
end
function modifier_evo_nyx_cicada_w_sting.prototype.OnTakeDamage(self, event)
    if not IsServer() or self.shattered then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetParent()
    if not caster or caster:IsNull() or event.attacker ~= caster or event.unit ~= target then
        return
    end
    if not event.inflictor or event.inflictor:IsNull() or event.inflictor:IsItem() then
        return
    end
    if event.inflictor == self:GetAbility() then
        return
    end
    self:advancePulse()
end
function modifier_evo_nyx_cicada_w_sting.prototype.advancePulse(self)
    if self.shattered then
        return
    end
    local caster = self:GetCaster()
    local target = self:GetParent()
    local ability = self:GetAbility()
    if not caster or caster:IsNull() or not target or target:IsNull() or not target:IsAlive() or not ability or ability:IsNull() then
        return
    end
    local now = GameRules:GetDOTATime(false, false)
    if now - self.lastTriggerTime < 0.08 then
        return
    end
    self.lastTriggerTime = now
    local tier = getNyxTier(nil, caster)
    local radius = ability:GetSpecialValueFor("pulse_radius")
    local pulseDmg = ability:GetSpecialValueFor("pulse_damage") + getNyxAllAttrSum(nil, caster) * ability:GetSpecialValueFor("pulse_all_pct") / 100
    self:triggerPulseAt(
        caster,
        ability,
        target:GetAbsOrigin(),
        radius,
        pulseDmg
    )
    local nextCount = self:GetStackCount() + 1
    self:SetStackCount(nextCount)
    local needed = tier >= 4 and target:HasModifier("modifier_evo_nyx_acoustic_disruption") and 2 or 3
    if nextCount >= needed then
        self.shattered = true
        target:EmitSound("Hero_Silencer.Curse.Impact")
        target:AddNewModifier(
            caster,
            ability,
            "modifier_stunned",
            {duration = ability:GetSpecialValueFor("stun_duration")}
        )
        if tier >= 3 then
            target:AddNewModifier(caster, ability, "modifier_disarmed", {duration = tier >= 4 and 2 or 1.5})
            caster:GiveMana(tier >= 4 and 35 or 25)
        end
        if tier >= 4 then
            local others = __TS__ArrayFilter(
                findEnemiesInRadius(
                    nil,
                    caster,
                    target:GetAbsOrigin(),
                    350
                ),
                function(____, e) return e ~= target end
            )
            if #others > 0 then
                __TS__ArraySort(
                    others,
                    function(____, a, b)
                        local aAd = a:HasModifier("modifier_evo_nyx_acoustic_disruption") and 1 or 0
                        local bAd = b:HasModifier("modifier_evo_nyx_acoustic_disruption") and 1 or 0
                        return bAd - aAd
                    end
                )
                self:triggerPulseAt(
                    caster,
                    ability,
                    others[1]:GetAbsOrigin(),
                    radius,
                    pulseDmg
                )
            end
        end
        self:Destroy()
    end
end
function modifier_evo_nyx_cicada_w_sting.prototype.triggerPulseAt(self, caster, ability, center, radius, dmg)
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_silencer/silencer_curse_hit.vpcf", 8, nil)
    ParticleManager:SetParticleControl(pfx, 0, center)
    ParticleManager:ReleaseParticleIndex(pfx)
    for ____, enemy in ipairs(findEnemiesInRadius(nil, caster, center, radius)) do
        ApplyDamage({
            victim = enemy,
            attacker = caster,
            ability = ability,
            damage = dmg,
            damage_type = 2
        })
    end
end
modifier_evo_nyx_cicada_w_sting = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_nyx_cicada_w_sting")},
    modifier_evo_nyx_cicada_w_sting
)
____exports.modifier_evo_nyx_cicada_w_sting = modifier_evo_nyx_cicada_w_sting
return ____exports
