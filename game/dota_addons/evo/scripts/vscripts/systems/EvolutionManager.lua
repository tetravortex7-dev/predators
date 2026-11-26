local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 15,["22"] = 15,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 22,["28"] = 23,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 34,["34"] = 34,["35"] = 34,["36"] = 38,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 35,["41"] = 37,["42"] = 43,["43"] = 44,["44"] = 44,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 45,["53"] = 47,["54"] = 47,["55"] = 47,["56"] = 48,["57"] = 47,["58"] = 47,["59"] = 50,["60"] = 50,["61"] = 50,["62"] = 51,["63"] = 50,["64"] = 50,["65"] = 53,["66"] = 53,["67"] = 53,["68"] = 54,["69"] = 53,["70"] = 53,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 57,["77"] = 57,["78"] = 58,["79"] = 57,["80"] = 57,["81"] = 60,["82"] = 60,["83"] = 60,["84"] = 60,["85"] = 60,["86"] = 60,["87"] = 60,["88"] = 61,["89"] = 60,["90"] = 60,["91"] = 63,["92"] = 63,["93"] = 63,["94"] = 63,["95"] = 63,["96"] = 63,["97"] = 63,["98"] = 63,["99"] = 63,["100"] = 64,["101"] = 63,["102"] = 63,["103"] = 43,["104"] = 68,["105"] = 69,["106"] = 70,["107"] = 70,["109"] = 71,["110"] = 68,["111"] = 74,["112"] = 75,["113"] = 74,["114"] = 78,["115"] = 79,["116"] = 80,["117"] = 80,["119"] = 81,["120"] = 82,["121"] = 83,["122"] = 84,["125"] = 87,["126"] = 78,["127"] = 90,["128"] = 91,["131"] = 92,["132"] = 93,["133"] = 94,["134"] = 90,["135"] = 97,["136"] = 98,["139"] = 99,["140"] = 100,["141"] = 101,["142"] = 103,["143"] = 110,["144"] = 111,["145"] = 97,["146"] = 114,["147"] = 115,["148"] = 115,["150"] = 116,["151"] = 117,["152"] = 117,["154"] = 119,["155"] = 120,["156"] = 120,["158"] = 122,["159"] = 124,["160"] = 129,["161"] = 130,["162"] = 131,["163"] = 132,["164"] = 132,["165"] = 132,["166"] = 132,["167"] = 133,["168"] = 132,["169"] = 132,["170"] = 135,["172"] = 138,["173"] = 114,["174"] = 141,["175"] = 142,["176"] = 142,["178"] = 143,["179"] = 144,["180"] = 144,["182"] = 146,["183"] = 147,["184"] = 147,["186"] = 149,["187"] = 150,["188"] = 152,["189"] = 153,["190"] = 154,["191"] = 158,["192"] = 158,["194"] = 159,["195"] = 160,["197"] = 163,["198"] = 165,["199"] = 166,["201"] = 169,["202"] = 170,["203"] = 171,["204"] = 172,["206"] = 174,["207"] = 175,["208"] = 177,["209"] = 184,["210"] = 185,["211"] = 186,["212"] = 141,["213"] = 189,["214"] = 190,["215"] = 191,["218"] = 192,["221"] = 194,["222"] = 195,["225"] = 197,["226"] = 198,["227"] = 199,["228"] = 200,["229"] = 201,["230"] = 202,["231"] = 203,["232"] = 204,["233"] = 205,["234"] = 206,["236"] = 208,["238"] = 215,["240"] = 189,["241"] = 219,["242"] = 220,["243"] = 221,["246"] = 222,["249"] = 224,["250"] = 225,["253"] = 227,["254"] = 228,["255"] = 229,["256"] = 230,["257"] = 231,["258"] = 232,["259"] = 238,["261"] = 219,["262"] = 242,["263"] = 243,["266"] = 244,["267"] = 245,["268"] = 246,["269"] = 247,["272"] = 250,["273"] = 251,["274"] = 242,["275"] = 254,["276"] = 255,["277"] = 256,["280"] = 258,["281"] = 259,["282"] = 261,["283"] = 263,["285"] = 264,["286"] = 264,["288"] = 265,["289"] = 266,["290"] = 267,["291"] = 268,["292"] = 268,["293"] = 268,["294"] = 268,["295"] = 268,["296"] = 268,["297"] = 268,["298"] = 271,["299"] = 272,["301"] = 274,["302"] = 275,["303"] = 279,["304"] = 280,["305"] = 280,["306"] = 280,["307"] = 280,["314"] = 286,["316"] = 287,["317"] = 287,["318"] = 288,["319"] = 289,["320"] = 290,["321"] = 291,["322"] = 292,["323"] = 293,["324"] = 298,["325"] = 299,["326"] = 300,["331"] = 287,["335"] = 308,["337"] = 309,["338"] = 309,["339"] = 310,["340"] = 311,["341"] = 312,["342"] = 313,["343"] = 314,["344"] = 315,["345"] = 316,["346"] = 317,["347"] = 318,["348"] = 318,["349"] = 318,["350"] = 318,["354"] = 309,["358"] = 254,["359"] = 326,["360"] = 327,["361"] = 328,["364"] = 330,["365"] = 331,["368"] = 333,["369"] = 334,["372"] = 336,["373"] = 337,["376"] = 341,["377"] = 342,["380"] = 346,["381"] = 347,["382"] = 349,["383"] = 350,["384"] = 326,["385"] = 353,["386"] = 354,["387"] = 355,["390"] = 357,["391"] = 358,["394"] = 360,["395"] = 361,["398"] = 363,["399"] = 364,["402"] = 368,["403"] = 369,["404"] = 353,["405"] = 372,["406"] = 373,["409"] = 374,["410"] = 375,["413"] = 377,["414"] = 378,["417"] = 380,["418"] = 381,["421"] = 383,["422"] = 384,["425"] = 386,["426"] = 387,["429"] = 391,["430"] = 392,["431"] = 393,["434"] = 395,["435"] = 396,["436"] = 397,["437"] = 399,["438"] = 403,["439"] = 409,["440"] = 410,["441"] = 372,["442"] = 413,["443"] = 414,["444"] = 415,["445"] = 416,["448"] = 419,["449"] = 420,["450"] = 421,["451"] = 422,["454"] = 425,["455"] = 426,["456"] = 427,["459"] = 428,["460"] = 429,["461"] = 430,["464"] = 413,["465"] = 435,["466"] = 436,["467"] = 437,["468"] = 438,["469"] = 438,["470"] = 438,["471"] = 438,["472"] = 438,["473"] = 438,["474"] = 438,["475"] = 438,["476"] = 438,["477"] = 438,["478"] = 438,["479"] = 438,["480"] = 438,["481"] = 438,["482"] = 452,["484"] = 454,["485"] = 435});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_DEFAULT_START_BODY_ID = ____bodies_catalog.EVO_DEFAULT_START_BODY_ID
local getBodiesForTier = ____bodies_catalog.getBodiesForTier
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local getNextTierConfig = ____game_constants.getNextTierConfig
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
local getMutationsForSlot = ____mutations_catalog.getMutationsForSlot
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local ____evolution_hero_kit = require("systems.evolution.evolution_hero_kit")
local applyBodyToHero = ____evolution_hero_kit.applyBodyToHero
local collectPurchasedAbilities = ____evolution_hero_kit.collectPurchasedAbilities
local stripDefaultHeroAbilities = ____evolution_hero_kit.stripDefaultHeroAbilities
local ____evolution_types = require("systems.evolution.evolution_types")
local MUTATION_SLOT_ORDER = ____evolution_types.MUTATION_SLOT_ORDER
local findFloorEvoThreshold = ____evolution_types.findFloorEvoThreshold
local pickRandomSubset = ____evolution_types.pickRandomSubset
local reapplyMutationsToHero = ____evolution_types.reapplyMutationsToHero
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
    if body.heroClass and #body.heroClass > 0 and hero:GetUnitName() ~= body.heroClass then
        local preservedAbilities = collectPurchasedAbilities(nil, hero, state)
        local replaced = HeroAppearance:replaceHeroPreservingState(playerId, body.heroClass, {stripDefaultAbilities = body.keepDefaultHeroAbilities ~= true, preserveAbilities = preservedAbilities})
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
                goto __continue57
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
                    local selected = state.tierIndex == 0 and tier.tierIndex == 1 and pickRandomSubset(nil, candidates, EVO_CONSTANTS.BODY_DRAFT_T1_CHOICES) or candidates
                    state.pendingDraftType = "BODY"
                    state.draftOptions = __TS__ArrayMap(
                        selected,
                        function(____, b) return b.id end
                    )
                    return
                end
            end
        end
        ::__continue57::
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
            while slotIndex < #EVO_CONSTANTS.MUTATION_DRAFT_LEVELS do
                local reqLevel = EVO_CONSTANTS.MUTATION_DRAFT_LEVELS[slotIndex + 1]
                if heroLevel >= reqLevel and not state.unlockedMutationSlots[slotIndex + 1] then
                    state.unlockedMutationSlots[slotIndex + 1] = true
                    local slotType = MUTATION_SLOT_ORDER[slotIndex + 1]
                    local mutations = getMutationsForSlot(nil, slotType)
                    if #mutations > 0 then
                        state.pendingDraftType = "MUTATION"
                        state.pendingMutationSlot = slotIndex
                        state.draftOptions = __TS__ArrayMap(
                            mutations,
                            function(____, m) return m.id end
                        )
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
    if not EVO_CONSTANTS.ENABLE_MUTATION_DRAFT then
        return
    end
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local state = self:getOrCreateState(playerId)
    if state.pendingDraftType ~= "MUTATION" then
        return
    end
    local slotIndex = event.slot or state.pendingMutationSlot
    if slotIndex ~= state.pendingMutationSlot then
        return
    end
    local optionIndex = event.option_index
    if optionIndex == nil or optionIndex < 0 or optionIndex >= #state.draftOptions then
        return
    end
    local mutationId = state.draftOptions[optionIndex + 1]
    local mutationDef = getMutationDefinition(nil, mutationId)
    if not mutationDef then
        return
    end
    state.mutations[slotIndex + 1] = mutationDef.id
    state.pendingDraftType = "NONE"
    state.draftOptions = {}
    hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
    self.eventBus:emit("mutation_applied", {playerId = playerId, slotIndex = slotIndex, mutationId = mutationDef.id})
    self:checkEvolutionProgress(playerId)
    syncPlayerEvoNetTable(nil, playerId, state)
end
function EvolutionManager.prototype.onDevCommand(self, playerId, command, args)
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
