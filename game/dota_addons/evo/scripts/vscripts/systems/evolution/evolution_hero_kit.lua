local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 6,["20"] = 14,["21"] = 14,["23"] = 15,["24"] = 16,["25"] = 16,["27"] = 17,["28"] = 18,["29"] = 18,["31"] = 19,["32"] = 19,["34"] = 20,["37"] = 14,["40"] = 5,["41"] = 24,["42"] = 28,["44"] = 29,["45"] = 29,["47"] = 30,["48"] = 31,["49"] = 31,["51"] = 32,["52"] = 33,["53"] = 33,["55"] = 34,["56"] = 34,["58"] = 35,["59"] = 35,["61"] = 36,["64"] = 29,["67"] = 38,["68"] = 24,["69"] = 41,["70"] = 42,["71"] = 43,["73"] = 44,["74"] = 44,["75"] = 45,["76"] = 46,["77"] = 47,["78"] = 47,["79"] = 47,["80"] = 47,["81"] = 47,["82"] = 47,["85"] = 44,["89"] = 52,["90"] = 41,["91"] = 55,["92"] = 60,["95"] = 61,["96"] = 62,["97"] = 63,["98"] = 64,["99"] = 65,["100"] = 66,["103"] = 55,["104"] = 71,["105"] = 76,["106"] = 77,["107"] = 79,["108"] = 80,["109"] = 81,["111"] = 83,["112"] = 85,["113"] = 91,["114"] = 93,["115"] = 93,["116"] = 93,["117"] = 93,["118"] = 94,["119"] = 95,["120"] = 96,["121"] = 98,["122"] = 99,["123"] = 100,["124"] = 101,["125"] = 103,["126"] = 104,["127"] = 105,["129"] = 108,["130"] = 109,["131"] = 110,["132"] = 111,["133"] = 112,["134"] = 113,["135"] = 114,["139"] = 118,["140"] = 119,["141"] = 120,["142"] = 120,["145"] = 122,["146"] = 123,["147"] = 124,["148"] = 124,["151"] = 127,["152"] = 128,["153"] = 129,["154"] = 130,["155"] = 131,["156"] = 132,["157"] = 133,["158"] = 134,["159"] = 135,["160"] = 136,["161"] = 137,["162"] = 138,["163"] = 139,["166"] = 142,["167"] = 143,["168"] = 144,["169"] = 146,["170"] = 146,["171"] = 145,["172"] = 148,["173"] = 148,["174"] = 144,["175"] = 151,["176"] = 152,["179"] = 155,["181"] = 157,["182"] = 158,["183"] = 159,["185"] = 161,["186"] = 162,["187"] = 163,["188"] = 164,["189"] = 164,["193"] = 167,["194"] = 169,["195"] = 170,["196"] = 171,["197"] = 172,["200"] = 175,["201"] = 176,["202"] = 177,["203"] = 178,["206"] = 182,["207"] = 184,["208"] = 185,["209"] = 186,["210"] = 187,["211"] = 188,["214"] = 192,["215"] = 193,["216"] = 194,["217"] = 195,["218"] = 196,["219"] = 197,["222"] = 201,["223"] = 202,["226"] = 205,["227"] = 206,["228"] = 207,["230"] = 210,["231"] = 71});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local getTierConfig = ____game_constants.getTierConfig
function ____exports.stripDefaultHeroAbilities(self, hero)
    local keep = __TS__New(Set, {
        "abyssal_underlord_portal_warp",
        "twin_gate_portal_warp",
        "ability_pluck_famango",
        "ability_capture",
        "ability_lamp_use"
    })
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not ability or ability:IsNull() then
                    goto __continue3
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or keep:has(name) then
                    goto __continue3
                end
                if ability:IsHidden() then
                    goto __continue3
                end
                hero:RemoveAbilityByHandle(ability)
            end
            ::__continue3::
            i = i + 1
        end
    end
end
function ____exports.collectPurchasedAbilities(self, hero, state)
    local result = {}
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not ability or ability:IsNull() or ability:IsHidden() then
                    goto __continue8
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") then
                    goto __continue8
                end
                if name == state.innateAbilityName or name == state.signatureAbilityName then
                    goto __continue8
                end
                if __TS__ArrayIncludes(state.kitAbilityNames, name) then
                    goto __continue8
                end
                result[#result + 1] = name
            end
            ::__continue8::
            i = i + 1
        end
    end
    return result
end
local function removeAbilityPreservingSlot(self, hero, ability)
    local idx = ability:GetAbilityIndex()
    if idx >= 0 and idx < 6 then
        do
            local s = 1
            while s <= 6 do
                local placeholder = hero:FindAbilityByName("evo_empty_slot_" .. tostring(s))
                if placeholder and not placeholder:IsNull() and placeholder:GetAbilityIndex() >= 6 then
                    hero:SwapAbilities(
                        ability:GetAbilityName(),
                        placeholder:GetAbilityName(),
                        false,
                        false
                    )
                    break
                end
                s = s + 1
            end
        end
    end
    hero:RemoveAbilityByHandle(ability)
end
local function placeAbilityInSlot(self, hero, ability, targetSlot)
    if ability:GetAbilityIndex() == targetSlot then
        return
    end
    local occupant = hero:GetAbilityByIndex(targetSlot)
    if occupant and not occupant:IsNull() then
        local occupantName = occupant:GetAbilityName()
        local abilityName = ability:GetAbilityName()
        if occupantName ~= abilityName then
            hero:SwapAbilities(occupantName, abilityName, false, true)
        end
    end
end
function ____exports.applyBodyToHero(self, hero, state, body)
    local tierConfig = getTierConfig(nil, body.tierIndex)
    local mult = tierConfig.statMultiplier
    if not body.heroClass or #body.heroClass == 0 then
        hero:SetOriginalModel(body.model)
        hero:SetModel(body.model)
    end
    hero:SetModelScale(body.modelScale)
    local attrMap = {STR = 0, AGI = 1, INT = 2, ALL = 3}
    hero:SetPrimaryAttribute(attrMap[body.primaryAttribute])
    local levelOffset = math.max(
        0,
        hero:GetLevel() - 1
    )
    hero:SetBaseStrength(math.floor((body.baseStr + body.strGain * levelOffset) * mult))
    hero:SetBaseAgility(math.floor((body.baseAgi + body.agiGain * levelOffset) * mult))
    hero:SetBaseIntellect(math.floor((body.baseInt + body.intGain * levelOffset) * mult))
    hero:SetBaseMoveSpeed(body.baseMoveSpeed)
    hero:SetBaseDamageMin(math.floor(body.baseAttackDamageMin * mult))
    hero:SetBaseDamageMax(math.floor(body.baseAttackDamageMax * mult))
    hero:SetPhysicalArmorBaseValue(body.baseArmor)
    local tierMod = hero:AddNewModifier(hero, nil, "modifier_evo_hero_tier", {})
    if tierMod ~= nil then
        tierMod:SetStackCount(body.tierIndex)
    end
    if body.keepDefaultHeroAbilities ~= true then
        if body.kitAbilities and #body.kitAbilities > 0 then
            for ____, oldName in ipairs(state.kitAbilityNames) do
                if not __TS__ArrayIncludes(body.kitAbilities, oldName) then
                    local oldAb = hero:FindAbilityByName(oldName)
                    if oldAb then
                        removeAbilityPreservingSlot(nil, hero, oldAb)
                    end
                end
            end
            if state.innateAbilityName and not __TS__ArrayIncludes(body.kitAbilities, state.innateAbilityName) then
                local oldInnate = hero:FindAbilityByName(state.innateAbilityName)
                if oldInnate then
                    removeAbilityPreservingSlot(nil, hero, oldInnate)
                end
            end
            if state.signatureAbilityName and not __TS__ArrayIncludes(body.kitAbilities, state.signatureAbilityName) then
                local oldSig = hero:FindAbilityByName(state.signatureAbilityName)
                if oldSig then
                    removeAbilityPreservingSlot(nil, hero, oldSig)
                end
            end
            local granted = {}
            local targetKitLevel = body.kitAbilityLevel or 1
            local activeSlot = 0
            for ____, abName in ipairs(body.kitAbilities) do
                local ab = hero:FindAbilityByName(abName) or hero:AddAbility(abName)
                if ab and not ab:IsNull() then
                    local isInnate = abName == body.innateAbility
                    if not isInnate then
                        local isUltimate = ab:GetAbilityType() == 1
                        local targetSlot = isUltimate and 5 or activeSlot
                        placeAbilityInSlot(nil, hero, ab, targetSlot)
                        if not isUltimate then
                            activeSlot = activeSlot + 1
                        end
                    end
                    ab:SetHidden(false)
                    local maxLvl = ab:GetMaxLevel()
                    local desiredLevel = isInnate and (maxLvl == 2 and math.min(
                        2,
                        math.max(1, body.tierIndex - 2)
                    ) or (maxLvl == 3 and math.min(
                        3,
                        math.max(1, body.tierIndex - 1)
                    ) or 1)) or 0
                    if ab:GetLevel() ~= desiredLevel then
                        ab:SetLevel(desiredLevel)
                    end
                end
                granted[#granted + 1] = abName
            end
            state.kitAbilityNames = granted
            state.innateAbilityName = nil
            state.signatureAbilityName = nil
        else
            for ____, oldName in ipairs(state.kitAbilityNames) do
                if oldName ~= body.innateAbility and oldName ~= body.signatureAbility then
                    local oldAb = hero:FindAbilityByName(oldName)
                    if oldAb then
                        removeAbilityPreservingSlot(nil, hero, oldAb)
                    end
                end
            end
            state.kitAbilityNames = {}
            if state.innateAbilityName and state.innateAbilityName ~= body.innateAbility then
                local oldInnate = hero:FindAbilityByName(state.innateAbilityName)
                if oldInnate then
                    removeAbilityPreservingSlot(nil, hero, oldInnate)
                end
            end
            if state.signatureAbilityName and state.signatureAbilityName ~= body.signatureAbility then
                local oldSig = hero:FindAbilityByName(state.signatureAbilityName)
                if oldSig then
                    removeAbilityPreservingSlot(nil, hero, oldSig)
                end
            end
            local signature = hero:FindAbilityByName(body.signatureAbility) or hero:AddAbility(body.signatureAbility)
            if signature and not signature:IsNull() then
                placeAbilityInSlot(nil, hero, signature, 0)
                signature:SetHidden(false)
                if signature:GetLevel() == 0 then
                    signature:SetLevel(1)
                end
            end
            local innate = hero:FindAbilityByName(body.innateAbility) or hero:AddAbility(body.innateAbility)
            if innate and not innate:IsNull() then
                placeAbilityInSlot(nil, hero, innate, 1)
                innate:SetHidden(false)
                if innate:GetLevel() == 0 then
                    innate:SetLevel(1)
                end
            end
            state.innateAbilityName = body.innateAbility
            state.signatureAbilityName = body.signatureAbility
        end
    else
        state.innateAbilityName = nil
        state.signatureAbilityName = nil
        state.kitAbilityNames = {}
    end
    hero:CalculateStatBonus(true)
end
return ____exports
