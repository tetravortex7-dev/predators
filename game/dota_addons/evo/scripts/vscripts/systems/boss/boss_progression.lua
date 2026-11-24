local ____lualib = require("lualib_bundle")
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 5,["12"] = 6,["13"] = 7,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 14,["19"] = 19,["20"] = 19,["22"] = 20,["23"] = 21,["24"] = 21,["26"] = 22,["27"] = 22,["29"] = 23,["30"] = 23,["32"] = 24,["33"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["39"] = 29,["40"] = 14,["41"] = 32,["42"] = 37,["44"] = 39,["45"] = 39,["47"] = 40,["48"] = 41,["49"] = 41,["51"] = 42,["52"] = 43,["56"] = 39,["59"] = 47,["60"] = 48,["61"] = 49,["62"] = 50,["65"] = 54,["66"] = 55,["67"] = 56,["68"] = 57,["72"] = 61,["73"] = 61,["75"] = 62,["76"] = 63,["77"] = 63,["79"] = 64,["80"] = 65,["81"] = 65,["83"] = 66,["86"] = 61,["90"] = 69,["91"] = 69,["93"] = 70,["94"] = 71,["95"] = 71,["97"] = 72,["98"] = 72,["99"] = 72,["100"] = 72,["101"] = 73,["105"] = 69,["108"] = 77,["109"] = 32,["110"] = 80,["111"] = 81,["112"] = 82,["113"] = 83,["114"] = 84,["115"] = 85,["116"] = 86,["117"] = 87,["120"] = 89,["121"] = 90,["122"] = 91,["125"] = 80,["126"] = 96,["127"] = 97,["128"] = 97,["129"] = 97,["130"] = 97,["131"] = 97,["132"] = 97,["133"] = 97,["135"] = 98,["136"] = 98,["138"] = 99,["139"] = 100,["140"] = 100,["142"] = 101,["143"] = 101,["144"] = 101,["145"] = 101,["146"] = 102,["147"] = 103,["151"] = 98,["154"] = 96,["155"] = 108,["157"] = 109,["158"] = 109,["159"] = 110,["160"] = 111,["161"] = 112,["163"] = 109,["166"] = 108,["167"] = 117,["168"] = 118,["169"] = 119,["172"] = 121,["173"] = 122,["174"] = 124,["175"] = 125,["176"] = 126,["177"] = 127,["180"] = 131,["181"] = 132,["182"] = 133,["183"] = 134,["184"] = 135,["187"] = 137,["188"] = 138,["189"] = 139,["190"] = 140,["191"] = 141,["193"] = 143,["194"] = 144,["197"] = 148,["198"] = 149,["200"] = 152,["201"] = 153,["202"] = 154,["205"] = 157,["207"] = 160,["208"] = 161,["209"] = 162,["212"] = 164,["213"] = 165,["214"] = 166,["215"] = 167,["216"] = 168,["217"] = 168,["218"] = 168,["219"] = 168,["220"] = 168,["223"] = 117,["224"] = 177,["225"] = 178,["226"] = 179,["229"] = 181,["230"] = 182,["231"] = 183,["232"] = 183,["233"] = 183,["234"] = 183,["235"] = 183,["236"] = 188,["237"] = 188,["238"] = 188,["239"] = 188,["240"] = 188,["241"] = 188,["242"] = 188,["243"] = 177,["244"] = 191,["246"] = 192,["247"] = 192,["248"] = 193,["249"] = 194,["250"] = 194,["252"] = 192,["255"] = 196,["256"] = 191,["257"] = 199,["258"] = 205,["261"] = 207,["264"] = 214,["265"] = 219,["266"] = 220,["267"] = 220,["268"] = 220,["269"] = 220,["270"] = 220,["271"] = 220,["272"] = 220,["275"] = 230,["278"] = 231,["281"] = 233,["282"] = 234,["283"] = 235,["284"] = 236,["285"] = 238,["286"] = 239,["287"] = 240,["288"] = 241,["289"] = 242,["290"] = 243,["292"] = 246,["295"] = 248,["296"] = 249,["297"] = 250,["298"] = 251,["299"] = 252,["300"] = 252,["301"] = 252,["302"] = 252,["303"] = 252,["304"] = 252,["305"] = 252,["307"] = 199,["308"] = 262,["309"] = 267,["312"] = 268,["313"] = 269,["314"] = 271,["315"] = 272,["316"] = 273,["317"] = 274,["318"] = 275,["319"] = 276,["320"] = 277,["321"] = 278,["322"] = 279,["323"] = 280,["324"] = 281,["325"] = 282,["326"] = 283,["327"] = 284,["329"] = 286,["331"] = 289,["332"] = 290,["333"] = 262});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____boss_types = require("systems.boss.boss_types")
local COMBINED_POTION_COST = ____boss_types.COMBINED_POTION_COST
local HEAL_POTION_BUY_COOLDOWN = ____boss_types.HEAL_POTION_BUY_COOLDOWN
local HEAL_POTION_COST = ____boss_types.HEAL_POTION_COST
local HEAL_POTION_HP_THRESHOLD = ____boss_types.HEAL_POTION_HP_THRESHOLD
local IGNORED_BOSS_ABILITIES = ____boss_types.IGNORED_BOSS_ABILITIES
local computeBossScale = ____boss_types.computeBossScale
local getBossRequiredXp = ____boss_types.getBossRequiredXp
local function canUpgradeBossAbility(self, hero, ability, skipped)
    if not ability or ability:IsNull() then
        return false
    end
    local name = ability:GetAbilityName()
    if skipped:has(name) or IGNORED_BOSS_ABILITIES:has(name) then
        return false
    end
    if ability:IsHidden() then
        return false
    end
    if ability:GetLevel() >= ability:GetMaxLevel() then
        return false
    end
    if hero:GetLevel() < ability:GetHeroLevelRequiredToUpgrade() then
        return false
    end
    local learnResult = ability:CanAbilityBeUpgraded()
    if learnResult == false or type(learnResult) == "number" and learnResult ~= 0 then
        return false
    end
    return true
end
local function pickNextAbilityToUpgrade(self, hero, definition, skipped)
    local abilityCount = hero:GetAbilityCount()
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not canUpgradeBossAbility(nil, hero, ability, skipped) then
                    goto __continue10
                end
                if ability:GetAbilityType() == 1 then
                    return ability
                end
            end
            ::__continue10::
            i = i + 1
        end
    end
    for ____, preferredName in ipairs(definition.abilityUpgradeOrder) do
        local ability = hero:FindAbilityByName(preferredName)
        if canUpgradeBossAbility(nil, hero, ability, skipped) and ability:GetLevel() == 0 then
            return ability
        end
    end
    for ____, preferredName in ipairs(definition.abilityUpgradeOrder) do
        local ability = hero:FindAbilityByName(preferredName)
        if canUpgradeBossAbility(nil, hero, ability, skipped) then
            return ability
        end
    end
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not canUpgradeBossAbility(nil, hero, ability, skipped) then
                    goto __continue19
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") or ability:IsAttributeBonus() then
                    goto __continue19
                end
                return ability
            end
            ::__continue19::
            i = i + 1
        end
    end
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not canUpgradeBossAbility(nil, hero, ability, skipped) then
                    goto __continue22
                end
                if __TS__StringStartsWith(
                    ability:GetAbilityName(),
                    "special_bonus_"
                ) then
                    return ability
                end
            end
            ::__continue22::
            i = i + 1
        end
    end
    return nil
end
function ____exports.upgradeBossHeroAbilities(self, hero, definition)
    local skipped = __TS__New(Set)
    local safety = 40
    while hero:GetAbilityPoints() > 0 and safety > 0 do
        safety = safety - 1
        local pointsBefore = hero:GetAbilityPoints()
        local chosen = pickNextAbilityToUpgrade(nil, hero, definition, skipped)
        if not chosen then
            break
        end
        hero:UpgradeAbility(chosen)
        if hero:GetAbilityPoints() >= pointsBefore then
            skipped:add(chosen:GetAbilityName())
        end
    end
end
function ____exports.syncBossAbilitiesLevel(self, unit, bossLevel)
    local targetAbilityLevel = math.min(
        15,
        math.max(
            1,
            math.floor((bossLevel - 1) / 10) + 1
        )
    )
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not ability or ability:IsNull() then
                    goto __continue30
                end
                local capped = math.min(
                    ability:GetMaxLevel(),
                    targetAbilityLevel
                )
                if ability:GetLevel() < capped then
                    ability:SetLevel(capped)
                end
            end
            ::__continue30::
            i = i + 1
        end
    end
end
function ____exports.equipPurchasedItems(self, unit, runtime)
    do
        local i = 0
        while i < runtime.nextItemIndex do
            local step = runtime.itemBuild[i + 1]
            if step ~= nil then
                unit:AddItemByName(step.itemName)
            end
            i = i + 1
        end
    end
end
function ____exports.grantBossProgress(self, runtime, xpDelta, goldDelta)
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return
    end
    runtime.xp = runtime.xp + xpDelta
    runtime.gold = runtime.gold + goldDelta
    if unit:IsHero() then
        local nativeLevel = unit:GetLevel()
        if nativeLevel > runtime.level then
            runtime.level = nativeLevel
        end
    end
    local leveledUp = false
    while runtime.level < EVO_CONSTANTS.BOSS_MAX_LEVEL do
        local nextLevel = runtime.level + 1
        local requiredXp = getBossRequiredXp(nil, nextLevel)
        if runtime.xp < requiredXp then
            break
        end
        runtime.level = nextLevel
        leveledUp = true
        if unit:IsHero() then
            while unit:GetLevel() < runtime.level do
                unit:HeroLevelUp(false)
            end
        elseif unit:IsCreature() then
            unit:CreatureLevelUp(1)
        end
    end
    if leveledUp then
        unit:SetModelScale(computeBossScale(nil, runtime.definition, runtime.level))
    end
    if unit:IsHero() then
        if unit:GetAbilityPoints() > 0 then
            ____exports.upgradeBossHeroAbilities(nil, unit, runtime.definition)
        end
    else
        ____exports.syncBossAbilitiesLevel(nil, unit, runtime.level)
    end
    while runtime.nextItemIndex < #runtime.itemBuild do
        local nextStep = runtime.itemBuild[runtime.nextItemIndex + 1]
        if runtime.gold < nextStep.goldCost then
            break
        end
        runtime.gold = runtime.gold - nextStep.goldCost
        runtime.nextItemIndex = runtime.nextItemIndex + 1
        unit:AddItemByName(nextStep.itemName)
        if IsInToolsMode() then
            GameRules:SendCustomMessage(
                (((("[Evo] " .. runtime.definition.id) .. " (Lv.") .. tostring(runtime.level)) .. ") bought ") .. nextStep.itemName,
                0,
                0
            )
        end
    end
end
function ____exports.dropBossCore(self, _definition, origin)
    local item = CreateItem("item_aghanims_shard_roshan", nil, nil)
    if not item then
        return
    end
    item:SetPurchaseTime(0)
    CreateItemOnPositionSync(origin, item)
    local destination = Vector(
        origin.x + RandomFloat(-140, 140),
        origin.y + RandomFloat(-140, 140),
        origin.z
    )
    item:LaunchLoot(
        false,
        280,
        0.7,
        destination,
        nil
    )
end
local function hasFreeInventorySlot(self, unit)
    do
        local slot = 0
        while slot < 6 do
            local item = unit:GetItemInSlot(slot)
            if not item or item:IsNull() then
                return true
            end
            slot = slot + 1
        end
    end
    return false
end
function ____exports.tryMaintainBossHealth(self, runtime, unit, hpRatio, now)
    if hpRatio > HEAL_POTION_HP_THRESHOLD then
        return
    end
    if unit:HasModifier("modifier_heal_potion_active") or unit:HasModifier("modifier_combined_potion_active") or unit:HasModifier("modifier_flask_healing") then
        return
    end
    local existing = unit:FindItemInInventory("item_combined_potion") or unit:FindItemInInventory("item_heal_potion") or unit:FindItemInInventory("item_flask")
    if existing and not existing:IsNull() and existing:IsFullyCastable() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = unit:entindex(),
            AbilityIndex = existing:entindex(),
            Queue = false
        })
        return
    end
    if now - runtime.lastHealBuyTime < HEAL_POTION_BUY_COOLDOWN then
        return
    end
    if not hasFreeInventorySlot(nil, unit) then
        return
    end
    local maxMana = unit:GetMaxMana()
    local lowMana = maxMana > 0 and unit:GetMana() / maxMana < 0.55
    local potionName
    local potionCost = 0
    if lowMana and runtime.gold >= COMBINED_POTION_COST then
        potionName = "item_combined_potion"
        potionCost = COMBINED_POTION_COST
    elseif runtime.gold >= HEAL_POTION_COST then
        potionName = "item_heal_potion"
        potionCost = HEAL_POTION_COST
    end
    if not potionName then
        return
    end
    runtime.gold = runtime.gold - potionCost
    runtime.lastHealBuyTime = now
    local bought = unit:AddItemByName(potionName)
    if bought and not bought:IsNull() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = unit:entindex(),
            AbilityIndex = bought:entindex(),
            Queue = false
        })
    end
end
function ____exports.consumeRuneForBoss(self, runtime, unit, rune)
    if not rune or rune:IsNull() or not IsValidEntity(rune) then
        return
    end
    local runeApi = rune
    local runeType = runeApi.GetRuneType ~= nil and runeApi:GetRuneType() or 5
    if runeType == 5 then
        ____exports.grantBossProgress(nil, runtime, 200, 220)
    elseif runeType == 0 then
        unit:AddNewModifier(unit, nil, "modifier_rune_doubledamage", {duration = 45})
    elseif runeType == 1 then
        unit:AddNewModifier(unit, nil, "modifier_rune_haste", {duration = 22})
    elseif runeType == 4 then
        unit:AddNewModifier(unit, nil, "modifier_rune_regen", {duration = 30})
    elseif runeType == 6 then
        unit:AddNewModifier(unit, nil, "modifier_rune_arcane", {duration = 50})
    elseif runeType == 3 then
        unit:AddNewModifier(unit, nil, "modifier_rune_invis", {duration = 45})
    elseif runeType == 9 then
        unit:AddNewModifier(unit, nil, "modifier_rune_shield", {duration = 75})
    else
        ____exports.grantBossProgress(nil, runtime, 150, 150)
    end
    unit:EmitSound("General.RunePickUp")
    UTIL_Remove(rune)
end
return ____exports
