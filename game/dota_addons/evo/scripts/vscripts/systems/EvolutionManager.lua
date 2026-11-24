local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 15,["22"] = 15,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 22,["28"] = 23,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 33,["33"] = 33,["34"] = 33,["35"] = 37,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 34,["40"] = 36,["41"] = 42,["42"] = 43,["43"] = 43,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 46,["53"] = 46,["54"] = 46,["55"] = 47,["56"] = 46,["57"] = 46,["58"] = 49,["59"] = 49,["60"] = 49,["61"] = 50,["62"] = 49,["63"] = 49,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 53,["68"] = 52,["69"] = 52,["70"] = 56,["71"] = 56,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 56,["76"] = 56,["77"] = 57,["78"] = 56,["79"] = 56,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 59,["84"] = 59,["85"] = 59,["86"] = 59,["87"] = 60,["88"] = 59,["89"] = 59,["90"] = 62,["91"] = 62,["92"] = 62,["93"] = 62,["94"] = 62,["95"] = 62,["96"] = 62,["97"] = 62,["98"] = 62,["99"] = 63,["100"] = 62,["101"] = 62,["102"] = 42,["103"] = 67,["104"] = 68,["105"] = 69,["106"] = 69,["108"] = 70,["109"] = 67,["110"] = 73,["111"] = 74,["112"] = 73,["113"] = 77,["114"] = 78,["115"] = 79,["116"] = 79,["118"] = 80,["119"] = 81,["120"] = 82,["121"] = 83,["124"] = 86,["125"] = 77,["126"] = 89,["127"] = 90,["130"] = 91,["131"] = 92,["132"] = 93,["133"] = 89,["134"] = 96,["135"] = 97,["138"] = 98,["139"] = 99,["140"] = 100,["141"] = 102,["142"] = 109,["143"] = 110,["144"] = 96,["145"] = 113,["146"] = 114,["147"] = 114,["149"] = 115,["150"] = 116,["151"] = 116,["153"] = 118,["154"] = 119,["155"] = 119,["157"] = 121,["158"] = 123,["159"] = 128,["160"] = 129,["161"] = 130,["162"] = 131,["163"] = 131,["164"] = 131,["165"] = 131,["166"] = 132,["167"] = 131,["168"] = 131,["169"] = 134,["171"] = 137,["172"] = 113,["173"] = 140,["174"] = 141,["175"] = 141,["177"] = 142,["178"] = 143,["179"] = 143,["181"] = 145,["182"] = 146,["183"] = 146,["185"] = 148,["186"] = 149,["187"] = 151,["188"] = 152,["189"] = 153,["190"] = 157,["191"] = 157,["193"] = 158,["194"] = 159,["196"] = 162,["197"] = 164,["198"] = 165,["200"] = 168,["201"] = 169,["202"] = 170,["203"] = 171,["205"] = 173,["206"] = 174,["207"] = 176,["208"] = 183,["209"] = 184,["210"] = 185,["211"] = 140,["212"] = 188,["213"] = 189,["214"] = 190,["217"] = 191,["220"] = 193,["221"] = 194,["224"] = 196,["225"] = 197,["226"] = 198,["227"] = 199,["228"] = 200,["229"] = 201,["230"] = 202,["231"] = 203,["232"] = 204,["233"] = 205,["235"] = 207,["237"] = 214,["239"] = 188,["240"] = 218,["241"] = 219,["242"] = 220,["245"] = 221,["248"] = 223,["249"] = 224,["252"] = 226,["253"] = 227,["254"] = 228,["255"] = 229,["256"] = 230,["257"] = 231,["258"] = 237,["260"] = 218,["261"] = 241,["262"] = 242,["265"] = 243,["266"] = 244,["267"] = 245,["268"] = 246,["271"] = 249,["272"] = 250,["273"] = 241,["274"] = 253,["275"] = 254,["276"] = 255,["279"] = 257,["280"] = 258,["281"] = 260,["282"] = 262,["284"] = 263,["285"] = 263,["287"] = 264,["288"] = 265,["289"] = 266,["290"] = 267,["291"] = 267,["292"] = 267,["293"] = 267,["294"] = 267,["295"] = 267,["296"] = 267,["297"] = 270,["298"] = 271,["300"] = 273,["301"] = 274,["302"] = 275,["303"] = 275,["304"] = 275,["305"] = 275,["312"] = 281,["314"] = 282,["315"] = 282,["316"] = 283,["317"] = 284,["318"] = 285,["319"] = 286,["320"] = 287,["321"] = 288,["322"] = 293,["323"] = 294,["324"] = 295,["329"] = 282,["333"] = 303,["335"] = 304,["336"] = 304,["337"] = 305,["338"] = 306,["339"] = 307,["340"] = 308,["341"] = 309,["342"] = 310,["343"] = 311,["344"] = 312,["345"] = 313,["346"] = 313,["347"] = 313,["348"] = 313,["352"] = 304,["356"] = 253,["357"] = 321,["358"] = 322,["359"] = 323,["362"] = 325,["363"] = 326,["366"] = 328,["367"] = 329,["370"] = 331,["371"] = 332,["374"] = 336,["375"] = 337,["378"] = 341,["379"] = 342,["380"] = 344,["381"] = 345,["382"] = 321,["383"] = 348,["384"] = 349,["385"] = 350,["388"] = 352,["389"] = 353,["392"] = 355,["393"] = 356,["396"] = 358,["397"] = 359,["400"] = 363,["401"] = 364,["402"] = 348,["403"] = 367,["404"] = 368,["407"] = 369,["408"] = 370,["411"] = 372,["412"] = 373,["415"] = 375,["416"] = 376,["419"] = 378,["420"] = 379,["423"] = 381,["424"] = 382,["427"] = 386,["428"] = 387,["429"] = 388,["432"] = 390,["433"] = 391,["434"] = 392,["435"] = 394,["436"] = 398,["437"] = 404,["438"] = 405,["439"] = 367,["440"] = 408,["441"] = 409,["442"] = 410,["443"] = 411,["446"] = 414,["447"] = 415,["448"] = 416,["449"] = 417,["452"] = 420,["453"] = 421,["454"] = 422,["457"] = 423,["458"] = 424,["459"] = 425,["462"] = 408,["463"] = 430,["464"] = 431,["465"] = 432,["466"] = 433,["467"] = 433,["468"] = 433,["469"] = 433,["470"] = 433,["471"] = 433,["472"] = 433,["473"] = 433,["474"] = 433,["475"] = 433,["476"] = 433,["477"] = 433,["478"] = 433,["479"] = 433,["480"] = 447,["482"] = 449,["483"] = 430});
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
                    state.pendingDraftType = "BODY"
                    state.draftOptions = __TS__ArrayMap(
                        candidates,
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
