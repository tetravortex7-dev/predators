local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 15,["21"] = 15,["22"] = 16,["23"] = 16,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 21,["28"] = 23,["29"] = 24,["30"] = 25,["31"] = 26,["32"] = 28,["33"] = 33,["34"] = 34,["35"] = 35,["36"] = 36,["37"] = 37,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 44,["42"] = 44,["43"] = 45,["44"] = 46,["45"] = 41,["46"] = 43,["47"] = 49,["48"] = 50,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 50,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 54,["62"] = 53,["63"] = 53,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 57,["68"] = 56,["69"] = 56,["70"] = 59,["71"] = 59,["72"] = 59,["73"] = 60,["74"] = 59,["75"] = 59,["76"] = 62,["77"] = 62,["78"] = 62,["79"] = 63,["80"] = 62,["81"] = 62,["82"] = 66,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 66,["87"] = 66,["88"] = 66,["89"] = 67,["90"] = 66,["91"] = 66,["92"] = 69,["93"] = 69,["94"] = 69,["95"] = 69,["96"] = 69,["97"] = 69,["98"] = 69,["99"] = 70,["100"] = 69,["101"] = 69,["102"] = 72,["103"] = 72,["104"] = 72,["105"] = 72,["106"] = 72,["107"] = 72,["108"] = 72,["109"] = 72,["110"] = 72,["111"] = 73,["112"] = 72,["113"] = 72,["114"] = 49,["115"] = 77,["116"] = 78,["117"] = 79,["118"] = 79,["120"] = 80,["121"] = 77,["122"] = 83,["123"] = 84,["124"] = 83,["125"] = 87,["126"] = 88,["127"] = 89,["128"] = 89,["130"] = 90,["131"] = 91,["132"] = 92,["133"] = 93,["136"] = 96,["137"] = 87,["138"] = 99,["139"] = 100,["142"] = 101,["143"] = 102,["144"] = 103,["145"] = 99,["146"] = 106,["147"] = 107,["150"] = 108,["151"] = 109,["152"] = 110,["153"] = 112,["154"] = 119,["155"] = 120,["156"] = 106,["157"] = 123,["158"] = 124,["159"] = 124,["161"] = 125,["162"] = 126,["163"] = 126,["165"] = 128,["166"] = 129,["167"] = 129,["169"] = 131,["170"] = 133,["171"] = 138,["172"] = 139,["173"] = 140,["174"] = 141,["175"] = 141,["176"] = 141,["177"] = 141,["178"] = 142,["179"] = 141,["180"] = 141,["181"] = 144,["183"] = 147,["184"] = 123,["185"] = 150,["186"] = 151,["187"] = 151,["189"] = 152,["190"] = 153,["191"] = 153,["193"] = 155,["194"] = 156,["195"] = 156,["197"] = 158,["198"] = 159,["199"] = 161,["200"] = 163,["201"] = 164,["202"] = 164,["203"] = 164,["204"] = 164,["205"] = 164,["206"] = 164,["207"] = 164,["208"] = 165,["209"] = 165,["210"] = 165,["211"] = 165,["212"] = 165,["213"] = 165,["214"] = 165,["215"] = 166,["216"] = 167,["217"] = 168,["218"] = 173,["219"] = 173,["221"] = 174,["222"] = 175,["224"] = 178,["225"] = 180,["226"] = 181,["228"] = 184,["229"] = 185,["230"] = 186,["231"] = 187,["233"] = 189,["234"] = 190,["235"] = 192,["236"] = 199,["237"] = 201,["238"] = 202,["239"] = 203,["240"] = 150,["241"] = 206,["242"] = 207,["243"] = 208,["246"] = 209,["249"] = 211,["250"] = 212,["253"] = 214,["254"] = 215,["255"] = 216,["256"] = 217,["257"] = 218,["258"] = 219,["259"] = 220,["260"] = 221,["261"] = 222,["262"] = 223,["264"] = 225,["266"] = 232,["268"] = 206,["269"] = 236,["270"] = 237,["271"] = 238,["274"] = 239,["277"] = 241,["278"] = 242,["281"] = 244,["282"] = 245,["283"] = 246,["284"] = 247,["285"] = 248,["286"] = 249,["287"] = 255,["289"] = 236,["290"] = 259,["291"] = 260,["294"] = 261,["295"] = 262,["296"] = 263,["297"] = 264,["300"] = 267,["301"] = 268,["302"] = 259,["303"] = 271,["304"] = 272,["305"] = 273,["308"] = 275,["309"] = 276,["310"] = 278,["311"] = 280,["313"] = 281,["314"] = 281,["316"] = 282,["317"] = 283,["318"] = 284,["319"] = 285,["320"] = 285,["321"] = 285,["322"] = 285,["323"] = 285,["324"] = 285,["325"] = 285,["326"] = 288,["327"] = 289,["329"] = 291,["330"] = 292,["331"] = 296,["332"] = 297,["333"] = 297,["334"] = 297,["335"] = 297,["342"] = 303,["344"] = 304,["345"] = 304,["346"] = 305,["347"] = 306,["348"] = 307,["349"] = 308,["350"] = 309,["351"] = 310,["352"] = 315,["353"] = 316,["354"] = 317,["359"] = 304,["363"] = 325,["365"] = 326,["366"] = 326,["367"] = 327,["368"] = 328,["369"] = 329,["370"] = 330,["371"] = 335,["372"] = 336,["373"] = 337,["374"] = 338,["378"] = 326,["382"] = 271,["383"] = 346,["384"] = 347,["385"] = 348,["388"] = 350,["389"] = 351,["392"] = 353,["393"] = 354,["396"] = 356,["397"] = 357,["400"] = 361,["401"] = 362,["404"] = 366,["405"] = 367,["406"] = 369,["407"] = 370,["408"] = 346,["409"] = 373,["410"] = 374,["411"] = 375,["414"] = 377,["415"] = 378,["418"] = 380,["419"] = 381,["422"] = 383,["423"] = 384,["426"] = 388,["427"] = 389,["428"] = 373,["429"] = 392,["430"] = 393,["431"] = 393,["432"] = 393,["433"] = 393,["434"] = 393,["435"] = 393,["436"] = 393,["437"] = 393,["438"] = 393,["439"] = 392,["440"] = 401,["441"] = 402,["442"] = 402,["443"] = 402,["444"] = 402,["445"] = 402,["446"] = 402,["447"] = 402,["448"] = 401,["449"] = 408,["450"] = 409,["451"] = 410,["452"] = 410,["453"] = 410,["454"] = 410,["455"] = 410,["458"] = 413,["459"] = 414,["460"] = 415,["463"] = 418,["464"] = 419,["465"] = 420,["466"] = 421,["469"] = 424,["470"] = 425,["471"] = 426,["474"] = 427,["475"] = 428,["476"] = 429,["479"] = 408,["480"] = 434,["481"] = 435,["482"] = 436,["483"] = 437,["484"] = 438,["485"] = 439,["486"] = 439,["487"] = 439,["488"] = 439,["489"] = 439,["490"] = 439,["491"] = 439,["492"] = 439,["493"] = 439,["494"] = 439,["495"] = 439,["496"] = 439,["497"] = 439,["498"] = 439,["499"] = 439,["500"] = 454,["502"] = 456,["503"] = 434});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_DEFAULT_START_BODY_ID = ____bodies_catalog.EVO_DEFAULT_START_BODY_ID
local getBodiesForTier = ____bodies_catalog.getBodiesForTier
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____start_body_override = require("data.start_body_override")
local getInitialStartBody = ____start_body_override.getInitialStartBody
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local getNextTierConfig = ____game_constants.getNextTierConfig
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local ____hero_state_transfer = require("lib.hero_state_transfer")
local applyHeroResourceRatios = ____hero_state_transfer.applyHeroResourceRatios
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
        return getInitialStartBody(nil)
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
    local preMorphHpPct = math.max(
        0.01,
        math.min(
            1,
            hero:GetHealthPercent() / 100
        )
    )
    local preMorphMpPct = math.max(
        0,
        math.min(
            1,
            hero:GetManaPercent() / 100
        )
    )
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
    applyHeroResourceRatios(nil, hero, preMorphHpPct, preMorphMpPct)
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
        local starter = getInitialStartBody(nil)
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
        local startBody = getInitialStartBody(nil)
        local startTier = startBody and startBody.tierIndex or 0
        state = {
            bodyId = startBody and startBody.id or EVO_DEFAULT_START_BODY_ID,
            tierIndex = startTier,
            biomass = 0,
            evoPoints = 0,
            highestTierUnlocked = startTier,
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
