local ____lualib = require("lualib_bundle")
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 156,["8"] = 161,["9"] = 162,["10"] = 162,["11"] = 162,["12"] = 162,["13"] = 163,["14"] = 163,["15"] = 163,["16"] = 163,["17"] = 164,["18"] = 164,["19"] = 164,["20"] = 164,["21"] = 164,["22"] = 164,["23"] = 164,["24"] = 165,["25"] = 165,["26"] = 165,["27"] = 165,["28"] = 165,["29"] = 165,["30"] = 165,["31"] = 156,["32"] = 30,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 43,["45"] = 44,["46"] = 44,["48"] = 45,["49"] = 45,["51"] = 46,["52"] = 46,["54"] = 47,["55"] = 43,["56"] = 50,["57"] = 55,["59"] = 56,["60"] = 56,["62"] = 57,["63"] = 58,["64"] = 58,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 59,["70"] = 59,["71"] = 59,["72"] = 59,["73"] = 59,["74"] = 59,["75"] = 68,["76"] = 69,["79"] = 56,["82"] = 72,["83"] = 73,["85"] = 74,["86"] = 75,["87"] = 75,["89"] = 76,["90"] = 77,["91"] = 78,["96"] = 82,["97"] = 83,["98"] = 85,["99"] = 85,["100"] = 85,["101"] = 85,["102"] = 85,["103"] = 85,["104"] = 85,["105"] = 85,["106"] = 93,["107"] = 93,["108"] = 93,["109"] = 93,["110"] = 93,["111"] = 93,["112"] = 85,["113"] = 94,["114"] = 94,["115"] = 94,["116"] = 94,["117"] = 94,["118"] = 94,["119"] = 85,["120"] = 85,["121"] = 85,["122"] = 85,["123"] = 50,["124"] = 100,["125"] = 105,["126"] = 106,["127"] = 108,["128"] = 108,["129"] = 108,["130"] = 108,["131"] = 109,["132"] = 110,["133"] = 111,["134"] = 112,["135"] = 113,["138"] = 117,["139"] = 117,["140"] = 117,["141"] = 117,["142"] = 121,["144"] = 122,["145"] = 123,["146"] = 124,["147"] = 125,["148"] = 126,["150"] = 128,["151"] = 129,["153"] = 131,["154"] = 131,["156"] = 133,["157"] = 134,["158"] = 135,["160"] = 137,["161"] = 138,["163"] = 140,["164"] = 141,["165"] = 142,["166"] = 143,["171"] = 147,["172"] = 148,["174"] = 151,["175"] = 152,["176"] = 153,["177"] = 100});
local ____exports = {}
function ____exports.applyHeroResourceRatios(self, hero, hpPct, mpPct)
    hero:CalculateStatBonus(true)
    local maxHp = math.max(
        1,
        hero:GetMaxHealth()
    )
    local maxMp = math.max(
        0,
        hero:GetMaxMana()
    )
    hero:SetHealth(math.max(
        1,
        math.min(
            maxHp,
            math.floor(maxHp * hpPct)
        )
    ))
    hero:SetMana(math.max(
        0,
        math.min(
            maxMp,
            math.floor(maxMp * mpPct)
        )
    ))
end
local PRESERVED_BUFF_MODIFIERS = {
    "modifier_evo_peace_time",
    "modifier_rune_doubledamage",
    "modifier_rune_haste",
    "modifier_rune_regen",
    "modifier_rune_invis",
    "modifier_rune_arcane",
    "modifier_rune_shield",
    "modifier_bottle_regeneration",
    "modifier_clarity_potion",
    "modifier_flask_healing"
}
local function getRestoreOrderPriority(self, slot)
    if slot >= 9 and slot <= 14 then
        return 0
    end
    if slot >= 6 and slot <= 8 then
        return 1
    end
    if slot >= 0 and slot <= 5 then
        return 2
    end
    return 3
end
function ____exports.captureHeroTransferState(self, playerId, oldHero, resetHeroLevel)
    local items = {}
    do
        local slot = 0
        while slot <= 16 do
            do
                local item = oldHero:GetItemInSlot(slot)
                if not item or item:IsNull() or not IsValidEntity(item) then
                    goto __continue7
                end
                local snapshot = {
                    slot = slot,
                    item = item,
                    name = item:GetAbilityName(),
                    charges = item:GetCurrentCharges(),
                    cooldown = item:GetCooldownTimeRemaining(),
                    purchaseTime = item:GetPurchaseTime(),
                    combineLocked = item:IsCombineLocked()
                }
                oldHero:TakeItem(item)
                items[#items + 1] = snapshot
            end
            ::__continue7::
            slot = slot + 1
        end
    end
    local modifiers = {}
    for ____, modName in ipairs(PRESERVED_BUFF_MODIFIERS) do
        do
            local mod = oldHero:FindModifierByName(modName)
            if not mod then
                goto __continue9
            end
            local remaining = mod:GetRemainingTime()
            if remaining > 0 then
                modifiers[#modifiers + 1] = {name = modName, duration = remaining}
            end
        end
        ::__continue9::
    end
    local reliableGold = PlayerResource:GetReliableGold(playerId)
    local unreliableGold = PlayerResource:GetUnreliableGold(playerId)
    return {
        position = oldHero:GetAbsOrigin(),
        forward = oldHero:GetForwardVector(),
        level = resetHeroLevel and 1 or oldHero:GetLevel(),
        xp = resetHeroLevel and 0 or oldHero:GetCurrentXP(),
        reliableGold = reliableGold,
        unreliableGold = unreliableGold,
        totalGold = reliableGold + unreliableGold,
        hpPct = math.max(
            0.01,
            math.min(
                1,
                oldHero:GetHealthPercent() / 100
            )
        ),
        mpPct = math.max(
            0,
            math.min(
                1,
                oldHero:GetManaPercent() / 100
            )
        ),
        items = items,
        modifiers = modifiers
    }
end
function ____exports.restoreHeroTransferState(self, playerId, newHero, snapshot)
    PlayerResource:SetGold(playerId, snapshot.reliableGold, true)
    PlayerResource:SetGold(playerId, snapshot.unreliableGold, false)
    local hasSavedTp = __TS__ArraySome(
        snapshot.items,
        function(____, entry) return entry.slot == 15 end
    )
    if hasSavedTp then
        local autoTp = newHero:GetItemInSlot(15)
        if autoTp and not autoTp:IsNull() and IsValidEntity(autoTp) then
            newHero:TakeItem(autoTp)
            UTIL_Remove(autoTp)
        end
    end
    local ordered = __TS__ArraySort(
        {unpack(snapshot.items)},
        function(____, a, b) return getRestoreOrderPriority(nil, a.slot) - getRestoreOrderPriority(nil, b.slot) end
    )
    for ____, saved in ipairs(ordered) do
        do
            local restored
            if saved.item and not saved.item:IsNull() and IsValidEntity(saved.item) then
                saved.item:SetOwner(newHero)
                saved.item:SetPurchaser(newHero)
                restored = newHero:AddItem(saved.item)
            end
            if not restored or restored:IsNull() or not IsValidEntity(restored) then
                restored = newHero:AddItemByName(saved.name)
            end
            if not restored or restored:IsNull() or not IsValidEntity(restored) then
                goto __continue18
            end
            local currentSlot = restored:GetItemSlot()
            if currentSlot >= 0 and currentSlot ~= saved.slot then
                newHero:SwapItems(currentSlot, saved.slot)
            end
            if saved.charges > 0 then
                restored:SetCurrentCharges(saved.charges)
            end
            restored:SetCombineLocked(saved.combineLocked)
            restored:SetPurchaseTime(saved.purchaseTime)
            if saved.cooldown > 0 then
                restored:StartCooldown(saved.cooldown)
            end
        end
        ::__continue18::
    end
    for ____, mod in ipairs(snapshot.modifiers) do
        newHero:AddNewModifier(newHero, nil, mod.name, {duration = mod.duration})
    end
    FindClearSpaceForUnit(newHero, snapshot.position, true)
    newHero:SetForwardVector(snapshot.forward)
    ____exports.applyHeroResourceRatios(nil, newHero, snapshot.hpPct, snapshot.mpPct)
end
return ____exports
