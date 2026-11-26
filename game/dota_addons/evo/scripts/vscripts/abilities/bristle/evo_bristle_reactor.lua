local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 9,["22"] = 9,["23"] = 11,["24"] = 13,["25"] = 19,["26"] = 20,["28"] = 23,["29"] = 29,["30"] = 30,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 32,["37"] = 33,["38"] = 34,["41"] = 36,["42"] = 37,["43"] = 38,["44"] = 39,["45"] = 40,["46"] = 42,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 54,["60"] = 55,["61"] = 55,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 63,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 63,["75"] = 63,["76"] = 63,["80"] = 66,["81"] = 66,["82"] = 66,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 66,["87"] = 66,["88"] = 66,["89"] = 31,["90"] = 30,["91"] = 29,["92"] = 30,["94"] = 30,["95"] = 78,["96"] = 79,["97"] = 78,["98"] = 79,["99"] = 80,["100"] = 81,["101"] = 80,["102"] = 83,["103"] = 84,["104"] = 83,["105"] = 86,["106"] = 87,["107"] = 86,["108"] = 89,["109"] = 90,["110"] = 89,["111"] = 92,["112"] = 93,["113"] = 93,["114"] = 93,["115"] = 93,["116"] = 93,["117"] = 92,["118"] = 99,["119"] = 100,["120"] = 101,["121"] = 99,["122"] = 103,["123"] = 104,["124"] = 105,["125"] = 106,["126"] = 103,["127"] = 108,["128"] = 109,["129"] = 108,["130"] = 111,["131"] = 112,["132"] = 111,["133"] = 79,["134"] = 78,["135"] = 79,["137"] = 79,["138"] = 116,["139"] = 117,["140"] = 116,["141"] = 117,["142"] = 118,["143"] = 119,["144"] = 118,["145"] = 121,["146"] = 122,["147"] = 121,["148"] = 124,["149"] = 125,["152"] = 126,["153"] = 127,["154"] = 128,["155"] = 129,["156"] = 134,["157"] = 134,["158"] = 134,["159"] = 134,["160"] = 134,["161"] = 135,["162"] = 135,["163"] = 135,["164"] = 135,["165"] = 135,["166"] = 136,["168"] = 138,["169"] = 124,["170"] = 140,["171"] = 141,["174"] = 142,["175"] = 143,["176"] = 144,["178"] = 140,["179"] = 147,["180"] = 148,["181"] = 149,["182"] = 147,["183"] = 151,["184"] = 152,["185"] = 151,["186"] = 154,["187"] = 155,["188"] = 154,["189"] = 157,["190"] = 158,["191"] = 157,["192"] = 160,["193"] = 161,["194"] = 160,["195"] = 163,["196"] = 164,["199"] = 165,["200"] = 166,["201"] = 167,["202"] = 168,["205"] = 170,["206"] = 171,["207"] = 171,["208"] = 171,["209"] = 171,["210"] = 171,["211"] = 171,["212"] = 171,["213"] = 171,["214"] = 171,["215"] = 171,["216"] = 171,["217"] = 182,["219"] = 183,["220"] = 183,["222"] = 184,["223"] = 184,["224"] = 184,["225"] = 184,["226"] = 184,["227"] = 184,["228"] = 184,["232"] = 163,["233"] = 117,["234"] = 116,["235"] = 117,["237"] = 117,["238"] = 195,["239"] = 196,["240"] = 195,["241"] = 196,["242"] = 197,["243"] = 198,["246"] = 199,["247"] = 200,["250"] = 202,["251"] = 203,["252"] = 204,["253"] = 205,["254"] = 206,["255"] = 207,["256"] = 208,["257"] = 209,["258"] = 211,["259"] = 212,["260"] = 213,["261"] = 214,["262"] = 216,["263"] = 217,["264"] = 217,["265"] = 217,["266"] = 217,["267"] = 217,["268"] = 217,["269"] = 217,["270"] = 217,["271"] = 217,["272"] = 217,["273"] = 217,["274"] = 229,["275"] = 230,["276"] = 231,["278"] = 232,["279"] = 232,["281"] = 233,["282"] = 233,["283"] = 233,["284"] = 233,["285"] = 233,["286"] = 234,["287"] = 235,["288"] = 235,["290"] = 237,["291"] = 238,["292"] = 238,["293"] = 238,["294"] = 238,["295"] = 238,["296"] = 238,["297"] = 238,["298"] = 246,["299"] = 247,["300"] = 248,["305"] = 252,["306"] = 253,["307"] = 254,["309"] = 255,["310"] = 256,["311"] = 257,["313"] = 259,["314"] = 260,["315"] = 261,["316"] = 262,["317"] = 262,["318"] = 262,["319"] = 262,["320"] = 262,["321"] = 262,["322"] = 262,["323"] = 262,["324"] = 262,["325"] = 262,["326"] = 262,["327"] = 273,["329"] = 274,["330"] = 274,["332"] = 275,["333"] = 275,["334"] = 275,["335"] = 275,["336"] = 275,["337"] = 275,["338"] = 275,["342"] = 283,["343"] = 284,["348"] = 288,["350"] = 289,["351"] = 290,["352"] = 291,["354"] = 293,["355"] = 296,["356"] = 296,["357"] = 296,["358"] = 296,["359"] = 296,["360"] = 297,["361"] = 298,["366"] = 302,["367"] = 303,["369"] = 197,["370"] = 196,["371"] = 195,["372"] = 196,["374"] = 196,["375"] = 308,["376"] = 309,["377"] = 308,["378"] = 309,["379"] = 310,["380"] = 311,["381"] = 310,["382"] = 313,["383"] = 314,["384"] = 313,["385"] = 316,["386"] = 317,["387"] = 316,["388"] = 319,["389"] = 320,["390"] = 319,["391"] = 322,["392"] = 323,["393"] = 323,["394"] = 323,["395"] = 323,["396"] = 322,["397"] = 328,["398"] = 329,["399"] = 328,["400"] = 331,["401"] = 332,["402"] = 331,["403"] = 309,["404"] = 308,["405"] = 309,["407"] = 309});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local dotaModifierFunction = ____dota_ts_adapter.dotaModifierFunction
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____unit_helpers = require("lib.unit_helpers")
local isEvoCreepUnit = ____unit_helpers.isEvoCreepUnit
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
                damage = isEvoCreepUnit(nil, enemy) and dmgBase * 1.3 or dmgBase,
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
