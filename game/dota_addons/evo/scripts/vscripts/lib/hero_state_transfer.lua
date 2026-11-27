local ____lualib = require("lualib_bundle")
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 161,["8"] = 166,["9"] = 167,["10"] = 167,["11"] = 167,["12"] = 167,["13"] = 168,["14"] = 168,["15"] = 168,["16"] = 168,["17"] = 169,["18"] = 169,["19"] = 169,["20"] = 169,["21"] = 169,["22"] = 169,["23"] = 169,["24"] = 170,["25"] = 170,["26"] = 170,["27"] = 170,["28"] = 170,["29"] = 170,["30"] = 170,["31"] = 161,["32"] = 31,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 44,["45"] = 45,["46"] = 45,["48"] = 46,["49"] = 46,["51"] = 47,["52"] = 47,["54"] = 48,["55"] = 44,["56"] = 51,["57"] = 56,["59"] = 57,["60"] = 57,["62"] = 58,["63"] = 59,["64"] = 59,["66"] = 60,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 60,["71"] = 60,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 69,["76"] = 70,["79"] = 57,["82"] = 73,["83"] = 74,["85"] = 75,["86"] = 76,["87"] = 76,["89"] = 77,["90"] = 78,["91"] = 79,["96"] = 83,["97"] = 84,["98"] = 86,["99"] = 86,["100"] = 86,["101"] = 86,["102"] = 86,["103"] = 86,["104"] = 86,["105"] = 86,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 94,["110"] = 94,["111"] = 94,["112"] = 86,["113"] = 95,["114"] = 95,["115"] = 95,["116"] = 95,["117"] = 95,["118"] = 95,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 86,["123"] = 86,["124"] = 51,["125"] = 102,["126"] = 107,["127"] = 108,["128"] = 110,["129"] = 110,["130"] = 110,["131"] = 110,["132"] = 111,["133"] = 112,["134"] = 113,["135"] = 114,["136"] = 115,["139"] = 119,["140"] = 119,["141"] = 119,["142"] = 119,["143"] = 123,["145"] = 124,["146"] = 125,["147"] = 126,["148"] = 127,["149"] = 128,["151"] = 130,["152"] = 131,["154"] = 133,["155"] = 133,["157"] = 135,["158"] = 136,["159"] = 137,["161"] = 139,["162"] = 140,["164"] = 142,["165"] = 143,["166"] = 144,["167"] = 145,["172"] = 149,["173"] = 150,["175"] = 152,["176"] = 153,["178"] = 156,["179"] = 157,["180"] = 158,["181"] = 102});
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
        modifiers = modifiers,
        hasShard = oldHero:HasModifier("modifier_item_aghanims_shard")
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
    if snapshot.hasShard then
        newHero:AddNewModifier(newHero, nil, "modifier_item_aghanims_shard", {})
    end
    FindClearSpaceForUnit(newHero, snapshot.position, true)
    newHero:SetForwardVector(snapshot.forward)
    ____exports.applyHeroResourceRatios(nil, newHero, snapshot.hpPct, snapshot.mpPct)
end
return ____exports
