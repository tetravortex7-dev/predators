local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 14,["19"] = 14,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 26,["29"] = 31,["30"] = 32,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 38,["35"] = 38,["36"] = 38,["37"] = 42,["38"] = 42,["39"] = 43,["40"] = 44,["41"] = 39,["42"] = 41,["43"] = 47,["44"] = 48,["45"] = 48,["46"] = 48,["47"] = 48,["48"] = 48,["49"] = 49,["50"] = 49,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 52,["58"] = 51,["59"] = 51,["60"] = 54,["61"] = 54,["62"] = 54,["63"] = 55,["64"] = 54,["65"] = 54,["66"] = 57,["67"] = 57,["68"] = 57,["69"] = 58,["70"] = 57,["71"] = 57,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 61,["76"] = 60,["77"] = 60,["78"] = 64,["79"] = 64,["80"] = 64,["81"] = 64,["82"] = 64,["83"] = 64,["84"] = 64,["85"] = 65,["86"] = 64,["87"] = 64,["88"] = 67,["89"] = 67,["90"] = 67,["91"] = 67,["92"] = 67,["93"] = 67,["94"] = 67,["95"] = 68,["96"] = 67,["97"] = 67,["98"] = 70,["99"] = 70,["100"] = 70,["101"] = 70,["102"] = 70,["103"] = 70,["104"] = 70,["105"] = 70,["106"] = 70,["107"] = 71,["108"] = 70,["109"] = 70,["110"] = 47,["111"] = 75,["112"] = 76,["113"] = 77,["114"] = 77,["116"] = 78,["117"] = 75,["118"] = 81,["119"] = 82,["120"] = 81,["121"] = 85,["122"] = 86,["123"] = 87,["124"] = 87,["126"] = 88,["127"] = 89,["128"] = 90,["129"] = 91,["132"] = 94,["133"] = 85,["134"] = 97,["135"] = 98,["138"] = 99,["139"] = 100,["140"] = 101,["141"] = 97,["142"] = 104,["143"] = 105,["146"] = 106,["147"] = 107,["148"] = 108,["149"] = 110,["150"] = 117,["151"] = 118,["152"] = 104,["153"] = 121,["154"] = 122,["155"] = 122,["157"] = 123,["158"] = 124,["159"] = 124,["161"] = 126,["162"] = 127,["163"] = 127,["165"] = 129,["166"] = 131,["167"] = 136,["168"] = 137,["169"] = 138,["170"] = 139,["171"] = 139,["172"] = 139,["173"] = 139,["174"] = 140,["175"] = 139,["176"] = 139,["177"] = 142,["179"] = 145,["180"] = 121,["181"] = 148,["182"] = 149,["183"] = 149,["185"] = 150,["186"] = 151,["187"] = 151,["189"] = 153,["190"] = 154,["191"] = 154,["193"] = 156,["194"] = 157,["195"] = 159,["196"] = 161,["197"] = 162,["198"] = 163,["199"] = 164,["200"] = 169,["201"] = 169,["203"] = 170,["204"] = 171,["206"] = 174,["207"] = 176,["208"] = 177,["210"] = 180,["211"] = 181,["212"] = 182,["213"] = 183,["215"] = 185,["216"] = 186,["217"] = 188,["218"] = 195,["219"] = 196,["220"] = 197,["221"] = 148,["222"] = 200,["223"] = 201,["224"] = 202,["227"] = 203,["230"] = 205,["231"] = 206,["234"] = 208,["235"] = 209,["236"] = 210,["237"] = 211,["238"] = 212,["239"] = 213,["240"] = 214,["241"] = 215,["242"] = 216,["243"] = 217,["245"] = 219,["247"] = 226,["249"] = 200,["250"] = 230,["251"] = 231,["252"] = 232,["255"] = 233,["258"] = 235,["259"] = 236,["262"] = 238,["263"] = 239,["264"] = 240,["265"] = 241,["266"] = 242,["267"] = 243,["268"] = 249,["270"] = 230,["271"] = 253,["272"] = 254,["275"] = 255,["276"] = 256,["277"] = 257,["278"] = 258,["281"] = 261,["282"] = 262,["283"] = 253,["284"] = 265,["285"] = 266,["286"] = 267,["289"] = 269,["290"] = 270,["291"] = 272,["292"] = 274,["294"] = 275,["295"] = 275,["297"] = 276,["298"] = 277,["299"] = 278,["300"] = 279,["301"] = 279,["302"] = 279,["303"] = 279,["304"] = 279,["305"] = 279,["306"] = 279,["307"] = 282,["308"] = 283,["310"] = 285,["311"] = 286,["312"] = 290,["313"] = 291,["314"] = 291,["315"] = 291,["316"] = 291,["323"] = 297,["325"] = 298,["326"] = 298,["327"] = 299,["328"] = 300,["329"] = 301,["330"] = 302,["331"] = 303,["332"] = 304,["333"] = 309,["334"] = 310,["335"] = 311,["340"] = 298,["344"] = 319,["346"] = 320,["347"] = 320,["348"] = 321,["349"] = 322,["350"] = 323,["351"] = 324,["352"] = 329,["353"] = 330,["354"] = 331,["355"] = 332,["359"] = 320,["363"] = 265,["364"] = 340,["365"] = 341,["366"] = 342,["369"] = 344,["370"] = 345,["373"] = 347,["374"] = 348,["377"] = 350,["378"] = 351,["381"] = 355,["382"] = 356,["385"] = 360,["386"] = 361,["387"] = 363,["388"] = 364,["389"] = 340,["390"] = 367,["391"] = 368,["392"] = 369,["395"] = 371,["396"] = 372,["399"] = 374,["400"] = 375,["403"] = 377,["404"] = 378,["407"] = 382,["408"] = 383,["409"] = 367,["410"] = 386,["411"] = 387,["412"] = 387,["413"] = 387,["414"] = 387,["415"] = 387,["416"] = 387,["417"] = 387,["418"] = 387,["419"] = 387,["420"] = 386,["421"] = 395,["422"] = 396,["423"] = 396,["424"] = 396,["425"] = 396,["426"] = 396,["427"] = 396,["428"] = 396,["429"] = 395,["430"] = 402,["431"] = 403,["432"] = 404,["433"] = 404,["434"] = 404,["435"] = 404,["436"] = 404,["439"] = 407,["440"] = 408,["441"] = 409,["444"] = 412,["445"] = 413,["446"] = 414,["447"] = 415,["450"] = 418,["451"] = 419,["452"] = 420,["455"] = 421,["456"] = 422,["457"] = 423,["460"] = 402,["461"] = 428,["462"] = 429,["463"] = 430,["464"] = 431,["465"] = 431,["466"] = 431,["467"] = 431,["468"] = 431,["469"] = 431,["470"] = 431,["471"] = 431,["472"] = 431,["473"] = 431,["474"] = 431,["475"] = 431,["476"] = 431,["477"] = 431,["478"] = 431,["479"] = 446,["481"] = 448,["482"] = 428});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_DEFAULT_START_BODY_ID = ____bodies_catalog.EVO_DEFAULT_START_BODY_ID
local getBodiesForTier = ____bodies_catalog.getBodiesForTier
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local getNextTierConfig = ____game_constants.getNextTierConfig
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local ____evolution_hero_kit = require("systems.evolution.evolution_hero_kit")
local applyBodyToHero = ____evolution_hero_kit.applyBodyToHero
local collectPurchasedAbilities = ____evolution_hero_kit.collectPurchasedAbilities
local stripDefaultHeroAbilities = ____evolution_hero_kit.stripDefaultHeroAbilities
local ____evolution_mutations = require("systems.evolution.evolution_mutations")
local handleRerollMutationDraft = ____evolution_mutations.handleRerollMutationDraft
local handleSelectMutationDraft = ____evolution_mutations.handleSelectMutationDraft
local openDevMutationDraft = ____evolution_mutations.openDevMutationDraft
local ____evolution_types = require("systems.evolution.evolution_types")
local findFloorEvoThreshold = ____evolution_types.findFloorEvoThreshold
local pickRandomSubset = ____evolution_types.pickRandomSubset
local reapplyMutationsToHero = ____evolution_types.reapplyMutationsToHero
local rollMutationChoices = ____evolution_types.rollMutationChoices
local syncPlayerEvoNetTable = ____evolution_types.syncPlayerEvoNetTable
____exports.EvolutionManager = __TS__Class()
local EvolutionManager = ____exports.EvolutionManager
EvolutionManager.name = "EvolutionManager"
function EvolutionManager.prototype.____constructor(self, eventBus, spellShopManager, lazyPrecacheManager)
    self.eventBus = eventBus
    self.spellShopManager = spellShopManager
    self.lazyPrecacheManager = lazyPrecacheManager
    self.playerStates = __TS__New(Map)
end
function EvolutionManager.prototype.init(self)
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:onNpcSpawned(event) end,
        nil
    )
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:onEntityKilled(event) end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "evo_select_body_draft",
        function(_, event)
            self:onSelectBodyDraft(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_select_ability_draft",
        function(_, event)
            self:onSelectAbilityDraft(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_select_mutation",
        function(_, event)
            self:onSelectMutation(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_reroll_mutation",
        function(_, event)
            self:onRerollMutation(event)
        end
    )
    self.eventBus:on(
        "hero_leveled_up",
        function(____, ____bindingPattern0)
            local newLevel
            local playerId
            playerId = ____bindingPattern0.playerId
            newLevel = ____bindingPattern0.newLevel
            self:onHeroLeveledUp(playerId, newLevel)
        end
    )
    self.eventBus:on(
        "biomass_collected",
        function(____, ____bindingPattern0)
            local amount
            local playerId
            playerId = ____bindingPattern0.playerId
            amount = ____bindingPattern0.amount
            self:addBiomass(playerId, amount)
        end
    )
    self.eventBus:on(
        "dev_command",
        function(____, ____bindingPattern0)
            local args
            local command
            local playerId
            playerId = ____bindingPattern0.playerId
            command = ____bindingPattern0.command
            args = ____bindingPattern0.args
            self:onDevCommand(playerId, command, args)
        end
    )
end
function EvolutionManager.prototype.getPlayerBody(self, playerId)
    local state = self.playerStates:get(playerId)
    if not state then
        return getBodyDefinition(nil, EVO_DEFAULT_START_BODY_ID)
    end
    return getBodyDefinition(nil, state.bodyId)
end
function EvolutionManager.prototype.getPlayerTierIndex(self, playerId)
    return self:getOrCreateState(playerId).tierIndex
end
function EvolutionManager.prototype.getPlayerMutations(self, playerId)
    local state = self.playerStates:get(playerId)
    if not state then
        return {}
    end
    local result = {}
    for ____, mutationId in ipairs(state.mutations) do
        if mutationId ~= nil then
            result[#result + 1] = mutationId
        end
    end
    return result
end
function EvolutionManager.prototype.addBiomass(self, playerId, amount)
    if not PlayerResource:IsValidPlayerID(playerId) or amount <= 0 then
        return
    end
    local state = self:getOrCreateState(playerId)
    state.biomass = state.biomass + amount
    self:addEvoPoints(playerId, amount)
end
function EvolutionManager.prototype.addEvoPoints(self, playerId, delta)
    if not PlayerResource:IsValidPlayerID(playerId) or delta == 0 then
        return
    end
    local state = self:getOrCreateState(playerId)
    local previousPoints = state.evoPoints
    state.evoPoints = math.max(0, state.evoPoints + delta)
    self.eventBus:emit("evo_points_changed", {playerId = playerId, previousPoints = previousPoints, newPoints = state.evoPoints, delta = state.evoPoints - previousPoints})
    self:checkEvolutionProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
end
function EvolutionManager.prototype.morphHero(self, playerId, bodyId)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return false
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return false
    end
    local body = getBodyDefinition(nil, bodyId)
    if not body then
        return false
    end
    local state = self:getOrCreateState(playerId)
    if body.heroClass and #body.heroClass > 0 and hero:GetUnitName() ~= body.heroClass and not self.lazyPrecacheManager:isHeroReady(playerId, body.heroClass) then
        state.pendingDraftType = "NONE"
        state.draftOptions = {}
        syncPlayerEvoNetTable(nil, playerId, state)
        self.lazyPrecacheManager:ensureHeroReady(
            playerId,
            body.heroClass,
            function()
                self:completeMorphHero(playerId, bodyId)
            end
        )
        return true
    end
    return self:completeMorphHero(playerId, bodyId)
end
function EvolutionManager.prototype.completeMorphHero(self, playerId, bodyId)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return false
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return false
    end
    local body = getBodyDefinition(nil, bodyId)
    if not body then
        return false
    end
    local state = self:getOrCreateState(playerId)
    local previousBodyId = state.bodyId
    local targetHeroClass = body.heroClass and #body.heroClass > 0 and body.heroClass or hero:GetUnitName()
    local resetHeroLevel = previousBodyId ~= body.id or state.tierIndex ~= body.tierIndex
    if hero:GetUnitName() ~= targetHeroClass or resetHeroLevel then
        local preservedAbilities = collectPurchasedAbilities(nil, hero, state)
        local replaced = HeroAppearance:replaceHeroPreservingState(playerId, targetHeroClass, {stripDefaultAbilities = body.keepDefaultHeroAbilities ~= true, preserveAbilities = preservedAbilities, resetHeroLevel = resetHeroLevel})
        if not replaced then
            return false
        end
        hero = replaced
        reapplyMutationsToHero(nil, hero, state)
    end
    applyBodyToHero(nil, hero, state, body)
    if body.appearance then
        HeroAppearance:applyPreset(hero, body.appearance)
    end
    state.bodyId = body.id
    state.tierIndex = body.tierIndex
    if body.tierIndex > state.highestTierUnlocked then
        state.highestTierUnlocked = body.tierIndex
    end
    state.pendingDraftType = "NONE"
    state.draftOptions = {}
    self.eventBus:emit("body_morphed", {playerId = playerId, previousBodyId = previousBodyId, newBodyId = body.id, tierIndex = body.tierIndex})
    self:checkEvolutionProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
    return true
end
function EvolutionManager.prototype.onNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsBaseNPC() then
        return
    end
    if not unit:IsRealHero() then
        return
    end
    local playerId = unit:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    if not self.playerStates:has(playerId) then
        self.lazyPrecacheManager:precacheForPlayer(playerId)
        local hero = unit
        stripDefaultHeroAbilities(nil, hero)
        local state = self:getOrCreateState(playerId)
        local starter = getBodyDefinition(nil, EVO_DEFAULT_START_BODY_ID)
        if starter then
            applyBodyToHero(nil, hero, state, starter)
            if starter.appearance then
                HeroAppearance:applyPreset(hero, starter.appearance)
            end
            self.eventBus:emit("body_morphed", {playerId = playerId, previousBodyId = "", newBodyId = starter.id, tierIndex = starter.tierIndex})
        end
        syncPlayerEvoNetTable(nil, playerId, state)
    end
end
function EvolutionManager.prototype.onEntityKilled(self, event)
    local victim = EntIndexToHScript(event.entindex_killed)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return
    end
    if not victim:IsRealHero() then
        return
    end
    local playerId = victim:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local state = self:getOrCreateState(playerId)
    local floorThreshold = findFloorEvoThreshold(nil, state.evoPoints)
    if floorThreshold < state.evoPoints then
        local previousPoints = state.evoPoints
        state.evoPoints = floorThreshold
        self.eventBus:emit("evo_points_changed", {playerId = playerId, previousPoints = previousPoints, newPoints = state.evoPoints, delta = state.evoPoints - previousPoints})
        syncPlayerEvoNetTable(nil, playerId, state)
    end
end
function EvolutionManager.prototype.onHeroLeveledUp(self, playerId, newLevel)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local state = self:getOrCreateState(playerId)
    for ____, tier in ipairs(EVO_TIERS) do
        if newLevel >= tier.requiredHeroLevel and tier.tierIndex > state.highestTierUnlocked then
            state.highestTierUnlocked = tier.tierIndex
        end
    end
    self:checkEvolutionProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
end
function EvolutionManager.prototype.checkEvolutionProgress(self, playerId)
    local state = self:getOrCreateState(playerId)
    if state.pendingDraftType ~= "NONE" then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local heroLevel = hero and not hero:IsNull() and IsValidEntity(hero) and hero:GetLevel() or 1
    local currentBody = getBodyDefinition(nil, state.bodyId)
    for ____, tier in ipairs(EVO_TIERS) do
        do
            if tier.tierIndex <= state.tierIndex then
                goto __continue58
            end
            if heroLevel >= tier.requiredHeroLevel then
                local candidates = {}
                if currentBody and currentBody.nextBodyIds and #currentBody.nextBodyIds > 0 then
                    candidates = __TS__ArrayFilter(
                        __TS__ArrayMap(
                            currentBody.nextBodyIds,
                            function(____, id) return getBodyDefinition(nil, id) end
                        ),
                        function(____, b) return b ~= nil and b.tierIndex == tier.tierIndex end
                    )
                elseif state.tierIndex == 0 then
                    candidates = getBodiesForTier(nil, tier.tierIndex)
                end
                if #candidates > 0 then
                    local selected = state.tierIndex == 0 and tier.tierIndex == 1 and not IsInToolsMode() and pickRandomSubset(nil, candidates, EVO_CONSTANTS.BODY_DRAFT_T1_CHOICES) or candidates
                    state.pendingDraftType = "BODY"
                    state.draftOptions = __TS__ArrayMap(
                        selected,
                        function(____, b) return b.id end
                    )
                    return
                end
            end
        end
        ::__continue58::
    end
    if EVO_CONSTANTS.ENABLE_ABILITY_DRAFT then
        do
            local slotIndex = 0
            while slotIndex < #EVO_CONSTANTS.ABILITY_DRAFT_LEVELS do
                local reqLevel = EVO_CONSTANTS.ABILITY_DRAFT_LEVELS[slotIndex + 1]
                if heroLevel >= reqLevel and not state.unlockedAbilitySlots[slotIndex + 1] then
                    state.unlockedAbilitySlots[slotIndex + 1] = true
                    local draftBody = getBodyDefinition(nil, state.bodyId)
                    if draftBody then
                        local choices = self.spellShopManager:rollAbilityDraftChoices(playerId, draftBody, EVO_CONSTANTS.ABILITY_DRAFT_CHOICES)
                        if #choices > 0 then
                            state.pendingDraftType = "ABILITY"
                            state.draftOptions = choices
                            return
                        end
                    end
                end
                slotIndex = slotIndex + 1
            end
        end
    end
    if EVO_CONSTANTS.ENABLE_MUTATION_DRAFT then
        do
            local slotIndex = 0
            while slotIndex < #EVO_CONSTANTS.MUTATION_DRAFT_TIERS do
                local reqTier = EVO_CONSTANTS.MUTATION_DRAFT_TIERS[slotIndex + 1]
                if state.tierIndex >= reqTier and not state.unlockedMutationSlots[slotIndex + 1] then
                    state.unlockedMutationSlots[slotIndex + 1] = true
                    local choices = rollMutationChoices(nil, state, {}, EVO_CONSTANTS.MUTATION_DRAFT_CHOICES)
                    if #choices > 0 then
                        state.pendingDraftType = "MUTATION"
                        state.pendingMutationSlot = slotIndex
                        state.draftOptions = choices
                        return
                    end
                end
                slotIndex = slotIndex + 1
            end
        end
    end
end
function EvolutionManager.prototype.onSelectAbilityDraft(self, event)
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = self:getOrCreateState(playerId)
    if state.pendingDraftType ~= "ABILITY" then
        return
    end
    local optionIndex = event.option_index
    if optionIndex == nil or optionIndex < 0 or optionIndex >= #state.draftOptions then
        return
    end
    local chosenAbility = state.draftOptions[optionIndex + 1]
    if not self.spellShopManager:grantDraftedAbility(playerId, chosenAbility) then
        return
    end
    state.pendingDraftType = "NONE"
    state.draftOptions = {}
    self:checkEvolutionProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
end
function EvolutionManager.prototype.onSelectBodyDraft(self, event)
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = self:getOrCreateState(playerId)
    if state.pendingDraftType ~= "BODY" then
        return
    end
    local optionIndex = event.option_index
    if optionIndex == nil or optionIndex < 0 or optionIndex >= #state.draftOptions then
        return
    end
    local chosenBodyId = state.draftOptions[optionIndex + 1]
    self:morphHero(playerId, chosenBodyId)
end
function EvolutionManager.prototype.onSelectMutation(self, event)
    handleSelectMutationDraft(
        nil,
        {
            event = event,
            eventBus = self.eventBus,
            getState = function(____, pid) return self:getOrCreateState(pid) end,
            checkProgress = function(____, pid) return self:checkEvolutionProgress(pid) end
        }
    )
end
function EvolutionManager.prototype.onRerollMutation(self, event)
    handleRerollMutationDraft(
        nil,
        {
            playerId = event.PlayerID,
            getState = function(____, pid) return self:getOrCreateState(pid) end
        }
    )
end
function EvolutionManager.prototype.onDevCommand(self, playerId, command, args)
    if command == "-evo_mut" then
        openDevMutationDraft(
            nil,
            playerId,
            function(____, pid) return self:getOrCreateState(pid) end
        )
        return
    end
    if command == "-evo_evo" then
        local amount = tonumber(args[1]) or 10
        self:addEvoPoints(playerId, amount)
        return
    end
    if command == "-evo_morph" then
        local target = args[1]
        if target ~= nil and #target > 0 then
            self:morphHero(playerId, target)
            return
        end
        local state = self:getOrCreateState(playerId)
        local nextTier = getNextTierConfig(nil, state.tierIndex)
        if not nextTier then
            return
        end
        local bodies = getBodiesForTier(nil, nextTier.tierIndex)
        if #bodies > 0 then
            self:morphHero(playerId, bodies[1].id)
        end
    end
end
function EvolutionManager.prototype.getOrCreateState(self, playerId)
    local state = self.playerStates:get(playerId)
    if not state then
        state = {
            bodyId = EVO_DEFAULT_START_BODY_ID,
            tierIndex = 0,
            biomass = 0,
            evoPoints = 0,
            highestTierUnlocked = 0,
            mutations = {nil, nil, nil},
            unlockedAbilitySlots = {false, false, false},
            unlockedMutationSlots = {false, false, false},
            mutationRerollsRemaining = EVO_CONSTANTS.MUTATION_REROLLS_PER_MATCH,
            pendingDraftType = "NONE",
            pendingMutationSlot = -1,
            draftOptions = {},
            kitAbilityNames = {}
        }
        self.playerStates:set(playerId, state)
    end
    return state
end
return ____exports
