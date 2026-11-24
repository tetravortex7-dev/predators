local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 10,["22"] = 12,["23"] = 18,["24"] = 19,["26"] = 22,["27"] = 28,["28"] = 29,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["35"] = 32,["36"] = 33,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 38,["43"] = 39,["44"] = 41,["45"] = 42,["46"] = 42,["47"] = 42,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 53,["58"] = 54,["59"] = 54,["61"] = 55,["62"] = 55,["63"] = 55,["64"] = 55,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 62,["78"] = 65,["79"] = 65,["80"] = 65,["81"] = 65,["82"] = 65,["83"] = 65,["84"] = 65,["85"] = 65,["86"] = 65,["87"] = 30,["88"] = 29,["89"] = 28,["90"] = 29,["92"] = 29,["93"] = 77,["94"] = 78,["95"] = 77,["96"] = 78,["97"] = 79,["98"] = 80,["99"] = 79,["100"] = 82,["101"] = 83,["102"] = 82,["103"] = 85,["104"] = 86,["105"] = 85,["106"] = 88,["107"] = 89,["108"] = 88,["109"] = 91,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 91,["116"] = 98,["117"] = 99,["118"] = 100,["119"] = 98,["120"] = 102,["121"] = 103,["122"] = 104,["123"] = 105,["124"] = 102,["125"] = 107,["126"] = 108,["127"] = 107,["128"] = 110,["129"] = 111,["130"] = 110,["131"] = 78,["132"] = 77,["133"] = 78,["135"] = 78,["136"] = 115,["137"] = 116,["138"] = 115,["139"] = 116,["140"] = 117,["141"] = 118,["142"] = 117,["143"] = 120,["144"] = 121,["145"] = 120,["146"] = 123,["147"] = 124,["150"] = 125,["151"] = 126,["152"] = 127,["153"] = 128,["154"] = 133,["155"] = 133,["156"] = 133,["157"] = 133,["158"] = 133,["159"] = 134,["160"] = 134,["161"] = 134,["162"] = 134,["163"] = 134,["164"] = 135,["166"] = 137,["167"] = 123,["168"] = 139,["169"] = 140,["172"] = 141,["173"] = 142,["174"] = 143,["176"] = 139,["177"] = 146,["178"] = 147,["179"] = 148,["180"] = 146,["181"] = 150,["182"] = 151,["183"] = 150,["184"] = 153,["185"] = 154,["186"] = 153,["187"] = 156,["188"] = 157,["189"] = 156,["190"] = 159,["191"] = 160,["192"] = 159,["193"] = 162,["194"] = 163,["197"] = 164,["198"] = 165,["199"] = 166,["200"] = 167,["203"] = 169,["204"] = 170,["205"] = 170,["206"] = 170,["207"] = 170,["208"] = 170,["209"] = 170,["210"] = 170,["211"] = 170,["212"] = 170,["213"] = 170,["214"] = 170,["215"] = 181,["217"] = 182,["218"] = 182,["220"] = 183,["221"] = 183,["222"] = 183,["223"] = 183,["224"] = 183,["225"] = 183,["226"] = 183,["230"] = 162,["231"] = 116,["232"] = 115,["233"] = 116,["235"] = 116,["236"] = 194,["237"] = 195,["238"] = 194,["239"] = 195,["240"] = 196,["241"] = 197,["244"] = 198,["245"] = 199,["248"] = 201,["249"] = 202,["250"] = 203,["251"] = 204,["252"] = 205,["253"] = 206,["254"] = 207,["255"] = 208,["256"] = 210,["257"] = 211,["258"] = 212,["259"] = 213,["260"] = 215,["261"] = 216,["262"] = 216,["263"] = 216,["264"] = 216,["265"] = 216,["266"] = 216,["267"] = 216,["268"] = 216,["269"] = 216,["270"] = 216,["271"] = 216,["272"] = 228,["273"] = 229,["274"] = 230,["276"] = 231,["277"] = 231,["279"] = 232,["280"] = 232,["281"] = 232,["282"] = 232,["283"] = 232,["284"] = 233,["285"] = 234,["286"] = 234,["288"] = 236,["289"] = 237,["290"] = 237,["291"] = 237,["292"] = 237,["293"] = 237,["294"] = 237,["295"] = 237,["296"] = 245,["297"] = 246,["298"] = 247,["303"] = 251,["304"] = 252,["305"] = 253,["307"] = 254,["308"] = 255,["309"] = 256,["311"] = 258,["312"] = 259,["313"] = 260,["314"] = 261,["315"] = 261,["316"] = 261,["317"] = 261,["318"] = 261,["319"] = 261,["320"] = 261,["321"] = 261,["322"] = 261,["323"] = 261,["324"] = 261,["325"] = 272,["327"] = 273,["328"] = 273,["330"] = 274,["331"] = 274,["332"] = 274,["333"] = 274,["334"] = 274,["335"] = 274,["336"] = 274,["340"] = 282,["341"] = 283,["346"] = 287,["348"] = 288,["349"] = 289,["350"] = 290,["352"] = 292,["353"] = 295,["354"] = 295,["355"] = 295,["356"] = 295,["357"] = 295,["358"] = 296,["359"] = 297,["364"] = 301,["365"] = 302,["367"] = 196,["368"] = 195,["369"] = 194,["370"] = 195,["372"] = 195,["373"] = 307,["374"] = 308,["375"] = 307,["376"] = 308,["377"] = 309,["378"] = 310,["379"] = 309,["380"] = 312,["381"] = 313,["382"] = 312,["383"] = 315,["384"] = 316,["385"] = 315,["386"] = 318,["387"] = 319,["388"] = 318,["389"] = 321,["390"] = 322,["391"] = 322,["392"] = 322,["393"] = 322,["394"] = 321,["395"] = 327,["396"] = 328,["397"] = 327,["398"] = 330,["399"] = 331,["400"] = 330,["401"] = 308,["402"] = 307,["403"] = 308,["405"] = 308});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____evo_bristle_shared = require("abilities.bristle.evo_bristle_shared")
local activeReactorZones = ____evo_bristle_shared.activeReactorZones
local applyReactorCatalystStacks = ____evo_bristle_shared.applyReactorCatalystStacks
local getAllAttributesSum = ____evo_bristle_shared.getAllAttributesSum
local SCRIPT_PATH = "abilities/bristle/evo_bristle_reactor"
local REACTOR_QW_MODS = {"modifier_evo_bristle_react_catalyst", "modifier_evo_bristle_react_q_puddle", "modifier_evo_bristle_react_w_buff"}
for ____, modName in ipairs(REACTOR_QW_MODS) do
    LinkLuaModifier(modName, SCRIPT_PATH, 0)
end
local activePuddles = __TS__New(Set)
____exports.evo_bristle_react_q = __TS__Class()
local evo_bristle_react_q = ____exports.evo_bristle_react_q
evo_bristle_react_q.name = "evo_bristle_react_q"
__TS__ClassExtends(evo_bristle_react_q, BaseAbility)
function evo_bristle_react_q.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local pos = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local dmgBase = baseDmg + getAllAttributesSum(nil, caster) * attrPct
    caster:EmitSound("Hero_Alchemist.AcidSpray")
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        pos,
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
                goto __continue7
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = enemy:IsCreep() and dmgBase * 1.3 or dmgBase,
                damage_type = 2
            })
            applyReactorCatalystStacks(
                nil,
                caster,
                enemy,
                self,
                2
            )
        end
        ::__continue7::
    end
    CreateModifierThinker(
        caster,
        self,
        "modifier_evo_bristle_react_q_puddle",
        {duration = 4},
        pos,
        caster:GetTeamNumber(),
        false
    )
end
evo_bristle_react_q = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_q")},
    evo_bristle_react_q
)
____exports.evo_bristle_react_q = evo_bristle_react_q
____exports.modifier_evo_bristle_react_catalyst = __TS__Class()
local modifier_evo_bristle_react_catalyst = ____exports.modifier_evo_bristle_react_catalyst
modifier_evo_bristle_react_catalyst.name = "modifier_evo_bristle_react_catalyst"
__TS__ClassExtends(modifier_evo_bristle_react_catalyst, BaseModifier)
function modifier_evo_bristle_react_catalyst.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_catalyst.prototype.IsDebuff(self)
    return true
end
function modifier_evo_bristle_react_catalyst.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_catalyst.prototype.GetTexture(self)
    return "alchemist_acid_spray"
end
function modifier_evo_bristle_react_catalyst.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")
    }
end
function modifier_evo_bristle_react_catalyst.prototype.getLevel(self)
    local ab = self:GetAbility()
    return ab and ab:GetLevel() or 1
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierMagicalResistanceBonus(self)
    local lvl = self:getLevel()
    local per = lvl >= 3 and 6 or (lvl >= 2 and 5 or 4)
    return -per * self:GetStackCount()
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierPhysicalArmorBonus(self)
    return -1.5 * self:GetStackCount()
end
function modifier_evo_bristle_react_catalyst.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -5 * self:GetStackCount()
end
modifier_evo_bristle_react_catalyst = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_catalyst")},
    modifier_evo_bristle_react_catalyst
)
____exports.modifier_evo_bristle_react_catalyst = modifier_evo_bristle_react_catalyst
____exports.modifier_evo_bristle_react_q_puddle = __TS__Class()
local modifier_evo_bristle_react_q_puddle = ____exports.modifier_evo_bristle_react_q_puddle
modifier_evo_bristle_react_q_puddle.name = "modifier_evo_bristle_react_q_puddle"
__TS__ClassExtends(modifier_evo_bristle_react_q_puddle, BaseModifier)
function modifier_evo_bristle_react_q_puddle.prototype.IsHidden(self)
    return true
end
function modifier_evo_bristle_react_q_puddle.prototype.IsPurgable(self)
    return false
end
function modifier_evo_bristle_react_q_puddle.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent and not parent:IsNull() then
        activePuddles:add(parent)
        local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", 8, nil)
        ParticleManager:SetParticleControl(
            pfx,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            pfx,
            1,
            Vector(260, 1, 1)
        )
        ParticleManager:ReleaseParticleIndex(pfx)
    end
    self:StartIntervalThink(1)
end
function modifier_evo_bristle_react_q_puddle.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if parent ~= nil then
        activePuddles:delete(parent)
    end
end
function modifier_evo_bristle_react_q_puddle.prototype.IsAura(self)
    local ab = self:GetAbility()
    return ab ~= nil and ab:GetLevel() >= 2
end
function modifier_evo_bristle_react_q_puddle.prototype.GetModifierAura(self)
    return "modifier_truesight"
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraRadius(self)
    return 260
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraSearchTeam(self)
    return 2
end
function modifier_evo_bristle_react_q_puddle.prototype.GetAuraSearchType(self)
    return 1 + 18
end
function modifier_evo_bristle_react_q_puddle.prototype.OnIntervalThink(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ab = self:GetAbility()
    if not caster or caster:IsNull() or not parent or parent:IsNull() or not ab then
        return
    end
    local dot = 25 + getAllAttributesSum(nil, caster) * 0.08
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        260,
        2,
        1 + 18,
        0,
        0,
        false
    )
    for ____, enemy in ipairs(enemies) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue35
            end
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = ab,
                damage = dot,
                damage_type = 2
            })
        end
        ::__continue35::
    end
end
modifier_evo_bristle_react_q_puddle = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_q_puddle")},
    modifier_evo_bristle_react_q_puddle
)
____exports.modifier_evo_bristle_react_q_puddle = modifier_evo_bristle_react_q_puddle
____exports.evo_bristle_react_w = __TS__Class()
local evo_bristle_react_w = ____exports.evo_bristle_react_w
evo_bristle_react_w.name = "evo_bristle_react_w"
__TS__ClassExtends(evo_bristle_react_w, BaseAbility)
function evo_bristle_react_w.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) then
        return
    end
    local level = self:GetLevel()
    local origin = caster:GetAbsOrigin()
    local cursor = self:GetCursorPosition()
    local range = self:GetSpecialValueFor("range")
    local baseDmg = self:GetSpecialValueFor("base_damage")
    local attrPct = self:GetSpecialValueFor("attr_pct") / 100
    local attrSum = getAllAttributesSum(nil, caster)
    local dmg = baseDmg + attrSum * attrPct
    local delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0)
    local dir = delta:Length2D() > 1 and delta:Normalized() or caster:GetForwardVector()
    local adrMod = caster:FindModifierByName("modifier_evo_bristle_adrenaline_stack")
    local isFullCircle = level >= 3 and adrMod ~= nil and adrMod:GetStackCount() >= 5
    caster:EmitSound("Hero_Bristleback.QuillSpray.Cast")
    local nearby = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        range,
        2,
        1 + 18,
        0,
        0,
        false
    )
    local hitAny = false
    local stunDur = level >= 3 and 0.8 or 0.6
    for ____, enemy in ipairs(nearby) do
        do
            if not enemy or enemy:IsNull() or not IsValidEntity(enemy) or not enemy:IsAlive() then
                goto __continue41
            end
            local toEnemy = Vector(
                enemy:GetAbsOrigin().x - origin.x,
                enemy:GetAbsOrigin().y - origin.y,
                0
            )
            local inCone = isFullCircle or toEnemy:Length2D() > 0 and dir.x * toEnemy:Normalized().x + dir.y * toEnemy:Normalized().y >= 0.4
            if not inCone then
                goto __continue41
            end
            hitAny = true
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                ability = self,
                damage = dmg,
                damage_type = 1
            })
            local cat = enemy:FindModifierByName("modifier_evo_bristle_react_catalyst")
            if cat and cat:GetStackCount() >= 3 then
                enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = stunDur})
            end
        end
        ::__continue41::
    end
    local puddleBlastBase = level >= 3 and 180 or (level >= 2 and 130 or 80)
    local puddleBlast = puddleBlastBase + attrSum * 0.25
    for ____, puddle in ipairs({__TS__Spread(activePuddles)}) do
        do
            if not puddle or puddle:IsNull() or not IsValidEntity(puddle) then
                activePuddles:delete(puddle)
                goto __continue46
            end
            local pOrigin = puddle:GetAbsOrigin()
            local toPuddle = Vector(pOrigin.x - origin.x, pOrigin.y - origin.y, 0)
            if toPuddle:Length2D() <= range and (isFullCircle or dir.x * toPuddle:Normalized().x + dir.y * toPuddle:Normalized().y >= 0.35) then
                local victims = FindUnitsInRadius(
                    caster:GetTeamNumber(),
                    pOrigin,
                    nil,
                    260,
                    2,
                    1 + 18,
                    0,
                    0,
                    false
                )
                for ____, v in ipairs(victims) do
                    do
                        if not v or v:IsNull() or not IsValidEntity(v) or not v:IsAlive() then
                            goto __continue49
                        end
                        ApplyDamage({
                            victim = v,
                            attacker = caster,
                            ability = self,
                            damage = puddleBlast,
                            damage_type = 2
                        })
                    end
                    ::__continue49::
                end
                puddle:RemoveModifierByName("modifier_evo_bristle_react_q_puddle")
                activePuddles:delete(puddle)
            end
        end
        ::__continue46::
    end
    for ____, zone in ipairs({__TS__Spread(activeReactorZones)}) do
        do
            if not zone or zone:IsNull() or not IsValidEntity(zone) then
                activeReactorZones:delete(zone)
                goto __continue53
            end
            local zMod = zone:FindModifierByName("modifier_evo_bristle_react_r_thinker")
            local toZone = Vector(
                zone:GetAbsOrigin().x - origin.x,
                zone:GetAbsOrigin().y - origin.y,
                0
            )
            if zMod and zMod.triggerPulse ~= nil and toZone:Length2D() <= range + 250 then
                zMod:triggerPulse()
            end
        end
        ::__continue53::
    end
    if level >= 2 and hitAny then
        caster:AddNewModifier(caster, self, "modifier_evo_bristle_react_w_buff", {duration = 2.5})
    end
end
evo_bristle_react_w = __TS__DecorateLegacy(
    {registerAbility(nil, "evo_bristle_react_w")},
    evo_bristle_react_w
)
____exports.evo_bristle_react_w = evo_bristle_react_w
____exports.modifier_evo_bristle_react_w_buff = __TS__Class()
local modifier_evo_bristle_react_w_buff = ____exports.modifier_evo_bristle_react_w_buff
modifier_evo_bristle_react_w_buff.name = "modifier_evo_bristle_react_w_buff"
__TS__ClassExtends(modifier_evo_bristle_react_w_buff, BaseModifier)
function modifier_evo_bristle_react_w_buff.prototype.IsHidden(self)
    return false
end
function modifier_evo_bristle_react_w_buff.prototype.IsDebuff(self)
    return false
end
function modifier_evo_bristle_react_w_buff.prototype.IsPurgable(self)
    return true
end
function modifier_evo_bristle_react_w_buff.prototype.GetTexture(self)
    return "bristleback_quill_spray"
end
function modifier_evo_bristle_react_w_buff.prototype.DeclareFunctions(self)
    return {
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
        dotaModifierFunction(nil, "MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT")
    }
end
function modifier_evo_bristle_react_w_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 15
end
function modifier_evo_bristle_react_w_buff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return 25
end
modifier_evo_bristle_react_w_buff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_evo_bristle_react_w_buff")},
    modifier_evo_bristle_react_w_buff
)
____exports.modifier_evo_bristle_react_w_buff = modifier_evo_bristle_react_w_buff
return ____exports
