local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["20"] = 2,["21"] = 2,["22"] = 4,["23"] = 4,["24"] = 4,["25"] = 5,["26"] = 6,["27"] = 7,["28"] = 8,["29"] = 9,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 32,["34"] = 32,["35"] = 30,["36"] = 32,["37"] = 34,["38"] = 35,["39"] = 35,["40"] = 35,["41"] = 36,["42"] = 35,["43"] = 35,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 39,["48"] = 38,["49"] = 38,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 43,["58"] = 44,["61"] = 45,["62"] = 42,["63"] = 42,["64"] = 34,["65"] = 49,["66"] = 50,["69"] = 52,["70"] = 53,["71"] = 54,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 56,["76"] = 56,["77"] = 56,["78"] = 56,["79"] = 56,["80"] = 62,["81"] = 63,["82"] = 65,["83"] = 70,["84"] = 77,["85"] = 77,["86"] = 77,["87"] = 77,["90"] = 78,["91"] = 78,["92"] = 78,["93"] = 78,["95"] = 76,["96"] = 81,["97"] = 49,["98"] = 84,["99"] = 85,["100"] = 84,["101"] = 88,["102"] = 93,["103"] = 93,["105"] = 94,["106"] = 95,["107"] = 96,["108"] = 98,["109"] = 98,["110"] = 98,["111"] = 98,["112"] = 98,["113"] = 98,["114"] = 98,["115"] = 98,["116"] = 104,["117"] = 104,["118"] = 104,["119"] = 104,["120"] = 107,["121"] = 109,["122"] = 109,["123"] = 108,["124"] = 117,["125"] = 118,["126"] = 119,["127"] = 120,["128"] = 120,["131"] = 123,["132"] = 124,["133"] = 125,["134"] = 125,["136"] = 127,["137"] = 88,["138"] = 130,["139"] = 131,["140"] = 131,["142"] = 132,["143"] = 133,["144"] = 133,["146"] = 135,["147"] = 136,["148"] = 136,["150"] = 138,["151"] = 139,["152"] = 139,["154"] = 140,["155"] = 140,["157"] = 142,["158"] = 143,["159"] = 143,["161"] = 145,["162"] = 146,["163"] = 148,["164"] = 148,["165"] = 149,["166"] = 149,["167"] = 149,["168"] = 149,["169"] = 151,["170"] = 152,["171"] = 152,["172"] = 152,["173"] = 152,["174"] = 152,["175"] = 152,["177"] = 155,["178"] = 157,["179"] = 162,["180"] = 163,["181"] = 130,["182"] = 166,["183"] = 167,["186"] = 169,["187"] = 170,["190"] = 172,["191"] = 173,["194"] = 175,["195"] = 176,["198"] = 178,["199"] = 179,["202"] = 180,["205"] = 181,["208"] = 183,["209"] = 184,["212"] = 186,["215"] = 187,["218"] = 189,["219"] = 190,["222"] = 192,["223"] = 193,["224"] = 193,["225"] = 193,["226"] = 193,["227"] = 195,["228"] = 197,["229"] = 197,["230"] = 198,["231"] = 198,["232"] = 198,["233"] = 198,["234"] = 200,["235"] = 201,["236"] = 201,["237"] = 203,["238"] = 201,["239"] = 201,["240"] = 201,["242"] = 208,["243"] = 210,["244"] = 215,["245"] = 166,["246"] = 218,["247"] = 219,["250"] = 221,["251"] = 222,["254"] = 224,["255"] = 225,["256"] = 226,["259"] = 228,["260"] = 229,["263"] = 231,["264"] = 232,["265"] = 233,["268"] = 235,["269"] = 236,["270"] = 237,["273"] = 239,["274"] = 239,["275"] = 239,["276"] = 239,["277"] = 239,["278"] = 239,["279"] = 218,["280"] = 242,["281"] = 247,["282"] = 249,["283"] = 250,["284"] = 251,["285"] = 252,["288"] = 256,["289"] = 257,["290"] = 258,["291"] = 259,["292"] = 260,["296"] = 265,["297"] = 266,["298"] = 267,["299"] = 268,["300"] = 269,["304"] = 242,["305"] = 275,["306"] = 276,["307"] = 277,["308"] = 278,["309"] = 279,["310"] = 280,["312"] = 282,["313"] = 283,["314"] = 284,["316"] = 286,["317"] = 287,["318"] = 288,["320"] = 275,["321"] = 292,["322"] = 297,["324"] = 298,["325"] = 298,["327"] = 299,["329"] = 300,["330"] = 300,["332"] = 301,["333"] = 302,["341"] = 306,["342"] = 292,["343"] = 309,["344"] = 314,["345"] = 315,["346"] = 317,["348"] = 318,["349"] = 318,["351"] = 319,["352"] = 319,["354"] = 320,["355"] = 320,["357"] = 321,["358"] = 321,["360"] = 323,["361"] = 323,["362"] = 323,["363"] = 323,["364"] = 324,["365"] = 325,["367"] = 327,["372"] = 331,["373"] = 309,["374"] = 334,["375"] = 339,["376"] = 340,["377"] = 342,["378"] = 343,["379"] = 344,["380"] = 346,["381"] = 347,["382"] = 348,["383"] = 349,["385"] = 351,["386"] = 352,["388"] = 355,["389"] = 356,["391"] = 357,["392"] = 357,["393"] = 358,["394"] = 359,["395"] = 360,["398"] = 357,["401"] = 365,["402"] = 366,["404"] = 369,["405"] = 334,["406"] = 372,["407"] = 373,["408"] = 374,["409"] = 375,["410"] = 380,["412"] = 382,["413"] = 372,["414"] = 385,["415"] = 386,["416"] = 387,["417"] = 388,["418"] = 385});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local getTierConfig = ____game_constants.getTierConfig
local ____spell_pools = require("data.spell_pools")
local EVO_BANNED_SPELL_COMBINATIONS = ____spell_pools.EVO_BANNED_SPELL_COMBINATIONS
local EVO_SPELL_BUNDLES = ____spell_pools.EVO_SPELL_BUNDLES
local EVO_SPELL_POOL = ____spell_pools.EVO_SPELL_POOL
local findSpellPoolEntry = ____spell_pools.findSpellPoolEntry
____exports.SpellShopManager = __TS__Class()
local SpellShopManager = ____exports.SpellShopManager
SpellShopManager.name = "SpellShopManager"
function SpellShopManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.playerStates = __TS__New(Map)
end
function SpellShopManager.prototype.init(self)
    CustomGameEventManager:RegisterListener(
        "evo_spell_buy",
        function(_, event)
            self:onSpellBuy(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_spell_swap",
        function(_, event)
            self:onSpellSwap(event)
        end
    )
    self.eventBus:on(
        "body_morphed",
        function(____, ____bindingPattern0)
            local newBodyId
            local playerId
            playerId = ____bindingPattern0.playerId
            newBodyId = ____bindingPattern0.newBodyId
            local body = getBodyDefinition(nil, newBodyId)
            if not body then
                return
            end
            self:rollShowcaseForBody(playerId, body)
        end
    )
end
function SpellShopManager.prototype.rollShowcaseForBody(self, playerId, body)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local state = self:getOrCreateState(playerId)
    local tierConfig = getTierConfig(nil, body.tierIndex)
    state.maxSlots = body.spellShopSlots or tierConfig.spellShopSlots or EVO_CONSTANTS.SPELL_SHOP_DEFAULT_SLOTS
    local excluded = __TS__New(
        Set,
        {
            body.innateAbility,
            body.signatureAbility,
            unpack(state.ownedSpells)
        }
    )
    local eligibleBasics = self:filterEligibleSpells(body, false, excluded)
    local eligibleUltimates = self:filterEligibleSpells(body, true, excluded)
    local pickedBasics = self:weightedSampleWithoutReplacement(eligibleBasics, tierConfig.offerBasicCount, body)
    local pickedUltimates = self:weightedSampleWithoutReplacement(eligibleUltimates, tierConfig.offerUltimateCount, body)
    local ____array_0 = __TS__SparseArrayNew(unpack(__TS__ArrayMap(
        pickedBasics,
        function(____, entry) return entry.abilityName end
    )))
    __TS__SparseArrayPush(
        ____array_0,
        unpack(__TS__ArrayMap(
            pickedUltimates,
            function(____, entry) return entry.abilityName end
        ))
    )
    state.offeredSpells = {__TS__SparseArraySpread(____array_0)}
    self:syncSpellShop(playerId)
end
function SpellShopManager.prototype.getOwnedSpells(self, playerId)
    return self:getOrCreateState(playerId).ownedSpells
end
function SpellShopManager.prototype.rollAbilityDraftChoices(self, playerId, body, count)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return {}
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local state = self:getOrCreateState(playerId)
    local tierConfig = getTierConfig(nil, body.tierIndex)
    local excluded = __TS__New(
        Set,
        {
            body.innateAbility,
            body.signatureAbility,
            unpack(state.ownedSpells)
        }
    )
    local eligibleBasics = __TS__ArrayFilter(
        self:filterEligibleSpells(body, false, excluded),
        function(____, e) return not hero or not hero:HasAbility(e.abilityName) and not self:violatesBannedCombinations(hero, state.ownedSpells, e.abilityName) end
    )
    local eligibleUltimates = tierConfig.offerUltimateCount > 0 and __TS__ArrayFilter(
        self:filterEligibleSpells(body, true, excluded),
        function(____, e) return not hero or not hero:HasAbility(e.abilityName) and not self:violatesBannedCombinations(hero, state.ownedSpells, e.abilityName) end
    ) or ({})
    local picks = {}
    if #eligibleUltimates > 0 and count >= 3 then
        local ultPick = self:weightedSampleWithoutReplacement(eligibleUltimates, 1, body)
        for ____, u in ipairs(ultPick) do
            picks[#picks + 1] = u.abilityName
        end
    end
    local remainingNeed = math.max(0, count - #picks)
    local basicPicks = self:weightedSampleWithoutReplacement(eligibleBasics, remainingNeed, body)
    for ____, b in ipairs(basicPicks) do
        picks[#picks + 1] = b.abilityName
    end
    return picks
end
function SpellShopManager.prototype.grantDraftedAbility(self, playerId, abilityName)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return false
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return false
    end
    local state = self:getOrCreateState(playerId)
    if __TS__ArrayIncludes(state.ownedSpells, abilityName) or hero:HasAbility(abilityName) then
        return false
    end
    local entry = findSpellPoolEntry(nil, abilityName)
    if not entry then
        return false
    end
    if self:violatesBannedCombinations(hero, state.ownedSpells, abilityName) then
        return false
    end
    local added = hero:AddAbility(abilityName)
    if not added then
        return false
    end
    added:SetLevel(1)
    self:grantLinkedAbilities(hero, added, abilityName)
    local ____state_ownedSpells_1 = state.ownedSpells
    ____state_ownedSpells_1[#____state_ownedSpells_1 + 1] = abilityName
    state.offeredSpells = __TS__ArrayFilter(
        state.offeredSpells,
        function(____, name) return name ~= abilityName end
    )
    if entry.ownerHeroName then
        PrecacheUnitByNameAsync(
            entry.ownerHeroName,
            function()
            end,
            playerId
        )
    end
    self:refreshScepterAndShard(hero)
    self.eventBus:emit("spell_purchased", {playerId = playerId, abilityName = abilityName})
    self:syncSpellShop(playerId)
    return true
end
function SpellShopManager.prototype.onSpellBuy(self, event)
    if GameRules:IsGamePaused() then
        return
    end
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local abilityName = event.ability_name
    if not abilityName or #abilityName == 0 then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = self:getOrCreateState(playerId)
    if not __TS__ArrayIncludes(state.offeredSpells, abilityName) then
        return
    end
    if __TS__ArrayIncludes(state.ownedSpells, abilityName) or hero:HasAbility(abilityName) then
        return
    end
    if #state.ownedSpells >= state.maxSlots then
        return
    end
    local entry = findSpellPoolEntry(nil, abilityName)
    if not entry then
        return
    end
    if hero:GetAbilityPoints() < entry.pointCost then
        return
    end
    if self:violatesBannedCombinations(hero, state.ownedSpells, abilityName) then
        return
    end
    local added = hero:AddAbility(abilityName)
    if not added then
        return
    end
    added:SetLevel(1)
    hero:SetAbilityPoints(math.max(
        0,
        hero:GetAbilityPoints() - entry.pointCost
    ))
    self:grantLinkedAbilities(hero, added, abilityName)
    local ____state_ownedSpells_2 = state.ownedSpells
    ____state_ownedSpells_2[#____state_ownedSpells_2 + 1] = abilityName
    state.offeredSpells = __TS__ArrayFilter(
        state.offeredSpells,
        function(____, name) return name ~= abilityName end
    )
    if entry.ownerHeroName then
        PrecacheUnitByNameAsync(
            entry.ownerHeroName,
            function()
            end,
            playerId
        )
    end
    self:refreshScepterAndShard(hero)
    self.eventBus:emit("spell_purchased", {playerId = playerId, abilityName = abilityName})
    self:syncSpellShop(playerId)
end
function SpellShopManager.prototype.onSpellSwap(self, event)
    if GameRules:IsGamePaused() then
        return
    end
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local slot1 = event.slot1
    local slot2 = event.slot2
    if slot1 == nil or slot2 == nil or slot1 == slot2 then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    local ability1 = hero:GetAbilityByIndex(slot1)
    local ability2 = hero:GetAbilityByIndex(slot2)
    if not ability1 or not ability2 then
        return
    end
    local name1 = ability1:GetAbilityName()
    local name2 = ability2:GetAbilityName()
    if __TS__StringStartsWith(name1, "special_bonus_") or __TS__StringStartsWith(name2, "special_bonus_") then
        return
    end
    hero:SwapAbilities(
        name1,
        name2,
        not ability1:IsHidden(),
        not ability2:IsHidden()
    )
end
function SpellShopManager.prototype.grantLinkedAbilities(self, hero, ability, abilityName)
    local linkedNames = __TS__New(Set)
    local bundle = EVO_SPELL_BUNDLES[abilityName]
    if bundle ~= nil then
        for ____, sub in ipairs(bundle) do
            linkedNames:add(sub)
        end
    end
    local secondary = ability:GetAssociatedSecondaryAbilities()
    if secondary ~= nil and #secondary > 0 then
        for ____, sub in ipairs(__TS__StringSplit(secondary, ";")) do
            if #sub > 0 then
                linkedNames:add(sub)
            end
        end
    end
    for ____, subName in __TS__Iterator(linkedNames) do
        if not hero:HasAbility(subName) then
            local subAbility = hero:AddAbility(subName)
            if subAbility and subAbility:GetLevel() == 0 then
                subAbility:SetLevel(1)
            end
        end
    end
end
function SpellShopManager.prototype.refreshScepterAndShard(self, hero)
    local scepterBuff = hero:FindModifierByName("modifier_item_ultimate_scepter")
    if scepterBuff then
        local scepterAbility = scepterBuff:GetAbility()
        scepterBuff:Destroy()
        hero:AddNewModifier(hero, scepterAbility, "modifier_item_ultimate_scepter", {})
    end
    if hero:HasModifier("modifier_item_ultimate_scepter_consumed") then
        hero:RemoveModifierByName("modifier_item_ultimate_scepter_consumed")
        hero:AddNewModifier(hero, nil, "modifier_item_ultimate_scepter_consumed", {})
    end
    if hero:HasModifier("modifier_item_aghanims_shard") then
        hero:RemoveModifierByName("modifier_item_aghanims_shard")
        hero:AddNewModifier(hero, nil, "modifier_item_aghanims_shard", {})
    end
end
function SpellShopManager.prototype.violatesBannedCombinations(self, hero, ownedSpells, candidate)
    for ____, combo in ipairs(EVO_BANNED_SPELL_COMBINATIONS) do
        do
            if not __TS__ArrayIncludes(combo, candidate) then
                goto __continue71
            end
            for ____, other in ipairs(combo) do
                do
                    if other == candidate then
                        goto __continue73
                    end
                    if __TS__ArrayIncludes(ownedSpells, other) or hero:HasAbility(other) then
                        return true
                    end
                end
                ::__continue73::
            end
        end
        ::__continue71::
    end
    return false
end
function SpellShopManager.prototype.filterEligibleSpells(self, body, isUltimate, excluded)
    local matched = {}
    local fallback = {}
    for ____, entry in ipairs(EVO_SPELL_POOL) do
        do
            if entry.isUltimate ~= isUltimate then
                goto __continue79
            end
            if excluded:has(entry.abilityName) then
                goto __continue79
            end
            if body.tierIndex < entry.minTierIndex then
                goto __continue79
            end
            if entry.maxTierIndex ~= nil and body.tierIndex > entry.maxTierIndex then
                goto __continue79
            end
            local hasTagOverlap = __TS__ArraySome(
                entry.tags,
                function(____, tag) return __TS__ArrayIncludes(body.spellPoolTags, tag) end
            )
            if hasTagOverlap then
                matched[#matched + 1] = entry
            else
                fallback[#fallback + 1] = entry
            end
        end
        ::__continue79::
    end
    return #matched > 0 and matched or fallback
end
function SpellShopManager.prototype.weightedSampleWithoutReplacement(self, pool, count, body)
    local remaining = {unpack(pool)}
    local result = {}
    while #result < count and #remaining > 0 do
        local totalWeight = 0
        local weights = {}
        for ____, entry in ipairs(remaining) do
            local w = entry.weight
            if entry.diet == body.diet then
                w = w * 1.5
            end
            weights[#weights + 1] = w
            totalWeight = totalWeight + w
        end
        local roll = RandomFloat(0, totalWeight)
        local chosenIndex = #remaining - 1
        do
            local i = 0
            while i < #weights do
                roll = roll - weights[i + 1]
                if roll <= 0 then
                    chosenIndex = i
                    break
                end
                i = i + 1
            end
        end
        result[#result + 1] = remaining[chosenIndex + 1]
        __TS__ArraySplice(remaining, chosenIndex, 1)
    end
    return result
end
function SpellShopManager.prototype.getOrCreateState(self, playerId)
    local state = self.playerStates:get(playerId)
    if not state then
        state = {offeredSpells = {}, ownedSpells = {}, maxSlots = EVO_CONSTANTS.SPELL_SHOP_DEFAULT_SLOTS}
        self.playerStates:set(playerId, state)
    end
    return state
end
function SpellShopManager.prototype.syncSpellShop(self, playerId)
    local state = self:getOrCreateState(playerId)
    local key = tostring(playerId)
    CustomNetTables:SetTableValue("spell_shop", key, {offered_spells = state.offeredSpells, owned_spells = state.ownedSpells, max_slots = state.maxSlots})
end
return ____exports
