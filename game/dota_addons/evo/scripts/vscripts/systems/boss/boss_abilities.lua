local ____lualib = require("lualib_bundle")
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 3,["9"] = 4,["10"] = 5,["11"] = 8,["12"] = 9,["13"] = 9,["15"] = 10,["16"] = 11,["17"] = 11,["19"] = 12,["20"] = 13,["22"] = 15,["23"] = 8,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 21,["30"] = 24,["31"] = 18,["32"] = 27,["33"] = 34,["34"] = 35,["35"] = 37,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 40,["41"] = 41,["42"] = 41,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 47,["49"] = 50,["50"] = 51,["51"] = 51,["52"] = 51,["53"] = 51,["54"] = 52,["55"] = 52,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 60,["66"] = 63,["67"] = 64,["68"] = 64,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 65,["74"] = 66,["75"] = 66,["76"] = 66,["77"] = 66,["78"] = 66,["79"] = 66,["80"] = 66,["81"] = 73,["83"] = 76,["84"] = 27,["85"] = 79,["86"] = 80,["87"] = 81,["88"] = 82,["89"] = 82,["90"] = 82,["91"] = 82,["92"] = 82,["93"] = 82,["95"] = 79,["96"] = 91,["97"] = 92,["98"] = 94,["99"] = 95,["100"] = 96,["101"] = 97,["102"] = 97,["103"] = 97,["104"] = 97,["105"] = 97,["106"] = 97,["107"] = 103,["110"] = 107,["111"] = 108,["112"] = 109,["113"] = 110,["114"] = 110,["115"] = 110,["116"] = 110,["117"] = 110,["118"] = 110,["119"] = 116,["122"] = 120,["123"] = 121,["124"] = 122,["125"] = 123,["126"] = 123,["127"] = 123,["128"] = 123,["129"] = 123,["130"] = 123,["131"] = 129,["134"] = 133,["135"] = 91,["136"] = 136,["137"] = 143,["138"] = 144,["139"] = 144,["140"] = 144,["141"] = 144,["142"] = 144,["143"] = 145,["145"] = 147,["146"] = 147,["148"] = 148,["149"] = 149,["150"] = 149,["152"] = 151,["153"] = 152,["154"] = 153,["155"] = 156,["156"] = 157,["157"] = 162,["158"] = 162,["161"] = 165,["162"] = 165,["163"] = 165,["164"] = 165,["165"] = 165,["166"] = 165,["167"] = 165,["168"] = 165,["169"] = 166,["173"] = 147,["176"] = 170,["177"] = 136,["178"] = 173,["179"] = 180,["180"] = 180,["181"] = 180,["182"] = 180,["183"] = 180,["184"] = 182,["185"] = 183,["186"] = 184,["187"] = 184,["188"] = 184,["189"] = 184,["190"] = 184,["191"] = 184,["192"] = 184,["193"] = 191,["195"] = 194,["196"] = 195,["198"] = 198,["199"] = 198,["200"] = 198,["201"] = 198,["202"] = 198,["203"] = 198,["204"] = 198,["205"] = 198,["206"] = 173,["207"] = 201,["209"] = 202,["210"] = 202,["212"] = 203,["213"] = 204,["214"] = 204,["216"] = 205,["217"] = 205,["219"] = 206,["220"] = 207,["224"] = 202,["227"] = 210,["228"] = 201,["229"] = 213,["230"] = 219,["231"] = 220,["232"] = 220,["233"] = 220,["234"] = 220,["235"] = 220,["236"] = 221,["237"] = 221,["238"] = 221,["239"] = 221,["240"] = 222,["241"] = 223,["242"] = 225,["244"] = 226,["245"] = 226,["247"] = 228,["248"] = 229,["249"] = 229,["251"] = 231,["252"] = 232,["253"] = 233,["254"] = 235,["255"] = 235,["257"] = 236,["258"] = 236,["260"] = 238,["261"] = 238,["262"] = 239,["263"] = 239,["264"] = 239,["265"] = 239,["266"] = 238,["267"] = 238,["268"] = 241,["269"] = 242,["270"] = 242,["272"] = 244,["273"] = 245,["274"] = 246,["275"] = 247,["276"] = 248,["277"] = 249,["278"] = 250,["281"] = 253,["282"] = 254,["283"] = 254,["285"] = 256,["286"] = 256,["287"] = 256,["288"] = 256,["289"] = 256,["290"] = 256,["291"] = 256,["292"] = 256,["293"] = 257,["298"] = 261,["299"] = 213});
local ____exports = {}
local ____boss_types = require("systems.boss.boss_types")
local DEFAULT_FARM_MANA_RESERVE = ____boss_types.DEFAULT_FARM_MANA_RESERVE
local IGNORED_BOSS_ABILITIES = ____boss_types.IGNORED_BOSS_ABILITIES
local distance2D = ____boss_types.distance2D
local function isCastableCombatAbility(self, ability)
    if not ability or ability:IsNull() or ability:GetLevel() <= 0 then
        return false
    end
    local name = ability:GetAbilityName()
    if IGNORED_BOSS_ABILITIES:has(name) or __TS__StringStartsWith(name, "special_bonus_") then
        return false
    end
    if ability:IsHidden() or ability:IsPassive() or ability:IsToggle() or ability:IsAttributeBonus() then
        return false
    end
    return ability:IsFullyCastable()
end
local function findAbilityRule(self, definition, abilityName)
    for ____, rule in ipairs(definition.abilityRules) do
        if rule.abilityName == abilityName then
            return rule
        end
    end
    return nil
end
local function castAbilityAtTarget(self, unit, ability, target, dist, customMaxDistance)
    local origin = unit:GetAbsOrigin()
    local behavior = ability:GetBehaviorInt()
    if bit.band(behavior, 4) ~= 0 then
        local isUltimate = ability:GetAbilityType() == 1
        local maxRange = customMaxDistance or (isUltimate and 800 or 380)
        if dist > maxRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 8,
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    if bit.band(behavior, 8) ~= 0 then
        local castRange = customMaxDistance or math.max(
            300,
            ability:GetCastRange(origin, target)
        )
        if dist > castRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = target:entindex(),
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    if bit.band(behavior, 16) ~= 0 then
        local castRange = customMaxDistance or math.max(
            300,
            ability:GetCastRange(origin, target)
        )
        if dist > castRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 5,
            Position = target:GetAbsOrigin(),
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    return false
end
function ____exports.tryUseMobilityItem(self, unit)
    local phase = unit:FindItemInInventory("item_phase_boots")
    if phase and phase:IsFullyCastable() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 8,
            AbilityIndex = phase:entindex(),
            Queue = false
        })
    end
end
function ____exports.tryCastDefensiveItem(self, unit, enemyHeroCount, dist)
    local hpRatio = unit:GetHealthPercent() / 100
    if hpRatio <= 0.85 or enemyHeroCount >= 2 then
        local bkb = unit:FindItemInInventory("item_black_king_bar")
        if bkb and bkb:IsFullyCastable() and dist <= 700 then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = bkb:entindex(),
                Queue = false
            })
            return true
        end
    end
    if hpRatio <= 0.9 and dist <= 550 then
        local bladeMail = unit:FindItemInInventory("item_blade_mail")
        if bladeMail and bladeMail:IsFullyCastable() then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = bladeMail:entindex(),
                Queue = false
            })
            return true
        end
    end
    if dist <= 750 then
        local shiva = unit:FindItemInInventory("item_shivas_guard")
        if shiva and shiva:IsFullyCastable() then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = shiva:entindex(),
                Queue = false
            })
            return true
        end
    end
    return false
end
local function tryCastBossHeroAbilities(self, unit, definition, target, nearbyHeroCount, inCourage)
    local origin = unit:GetAbsOrigin()
    local dist = distance2D(
        nil,
        origin,
        target:GetAbsOrigin()
    )
    local hpRatio = unit:GetHealthPercent() / 100
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not isCastableCombatAbility(nil, ability) then
                    goto __continue27
                end
                local name = ability:GetAbilityName()
                local rule = findAbilityRule(nil, definition, name)
                local isUltimate = ability:GetAbilityType() == 1 or (rule and rule.usage) == "ULTIMATE_COMBAT"
                if isUltimate then
                    local worthUltimate = inCourage or nearbyHeroCount >= 2 or hpRatio <= 0.75 or target:GetHealthPercent() <= 70
                    if not worthUltimate then
                        goto __continue27
                    end
                end
                if castAbilityAtTarget(
                    nil,
                    unit,
                    ability,
                    target,
                    dist,
                    rule and rule.maxCastDistance
                ) then
                    return true
                end
            end
            ::__continue27::
            i = i + 1
        end
    end
    return false
end
function ____exports.tryCastHeroCombatKit(self, unit, definition, target, nearbyHeroCount, inCourage)
    local dist = distance2D(
        nil,
        unit:GetAbsOrigin(),
        target:GetAbsOrigin()
    )
    local abyssal = unit:FindItemInInventory("item_abyssal_blade")
    if abyssal and abyssal:IsFullyCastable() and dist <= 300 then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = target:entindex(),
            AbilityIndex = abyssal:entindex(),
            Queue = false
        })
        return true
    end
    if ____exports.tryCastDefensiveItem(nil, unit, nearbyHeroCount, dist) then
        return true
    end
    return tryCastBossHeroAbilities(
        nil,
        unit,
        definition,
        target,
        nearbyHeroCount,
        inCourage
    )
end
local function getReadyUltimateManaCost(self, unit)
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not ability or ability:IsNull() or ability:GetLevel() <= 0 then
                    goto __continue36
                end
                if ability:GetAbilityType() ~= 1 then
                    goto __continue36
                end
                if ability:GetCooldownTimeRemaining() <= 10 then
                    return ability:GetManaCost(ability:GetLevel() - 1)
                end
            end
            ::__continue36::
            i = i + 1
        end
    end
    return 0
end
function ____exports.tryCastFarmAbilities(self, unit, definition, targetCreep, nearbyCreeps)
    local origin = unit:GetAbsOrigin()
    local dist = distance2D(
        nil,
        origin,
        targetCreep:GetAbsOrigin()
    )
    local maxMana = math.max(
        1,
        unit:GetMaxMana()
    )
    local currentMana = unit:GetMana()
    local reservedUltMana = getReadyUltimateManaCost(nil, unit)
    for ____, rule in ipairs(definition.abilityRules) do
        do
            if rule.usage ~= "FARM_AND_HERO" then
                goto __continue41
            end
            local ability = unit:FindAbilityByName(rule.abilityName)
            if not isCastableCombatAbility(nil, ability) then
                goto __continue41
            end
            local manaCost = ability:GetManaCost(ability:GetLevel() - 1)
            local manaAfterCast = currentMana - manaCost
            local minReserveRatio = rule.minManaRatioForFarm or DEFAULT_FARM_MANA_RESERVE
            if manaAfterCast / maxMana < minReserveRatio then
                goto __continue41
            end
            if reservedUltMana > 0 and manaAfterCast < reservedUltMana then
                goto __continue41
            end
            local closeCreeps = __TS__ArrayFilter(
                nearbyCreeps,
                function(____, c) return distance2D(
                    nil,
                    origin,
                    c:GetAbsOrigin()
                ) <= (rule.maxCastDistance or 380) end
            )
            local minTargets = rule.minFarmTargets or 2
            if #closeCreeps < minTargets then
                goto __continue41
            end
            local fullHpCount = 0
            local totalHpPct = 0
            for ____, c in ipairs(closeCreeps) do
                local hpPct = c:GetHealthPercent()
                totalHpPct = totalHpPct + hpPct
                if hpPct >= 85 then
                    fullHpCount = fullHpCount + 1
                end
            end
            local avgHpPct = totalHpPct / #closeCreeps
            if fullHpCount < minTargets or avgHpPct < 80 then
                goto __continue41
            end
            if castAbilityAtTarget(
                nil,
                unit,
                ability,
                targetCreep,
                dist,
                rule.maxCastDistance
            ) then
                return true
            end
        end
        ::__continue41::
    end
    return false
end
return ____exports
