local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 14,["19"] = 14,["20"] = 15,["21"] = 15,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 27,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 35,["35"] = 36,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 43,["40"] = 43,["41"] = 44,["42"] = 45,["43"] = 40,["44"] = 42,["45"] = 48,["46"] = 49,["47"] = 49,["48"] = 49,["49"] = 49,["50"] = 49,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 53,["60"] = 52,["61"] = 52,["62"] = 55,["63"] = 55,["64"] = 55,["65"] = 56,["66"] = 55,["67"] = 55,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 59,["72"] = 58,["73"] = 58,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 62,["78"] = 61,["79"] = 61,["80"] = 65,["81"] = 65,["82"] = 65,["83"] = 65,["84"] = 65,["85"] = 65,["86"] = 65,["87"] = 66,["88"] = 65,["89"] = 65,["90"] = 68,["91"] = 68,["92"] = 68,["93"] = 68,["94"] = 68,["95"] = 68,["96"] = 68,["97"] = 69,["98"] = 68,["99"] = 68,["100"] = 71,["101"] = 71,["102"] = 71,["103"] = 71,["104"] = 71,["105"] = 71,["106"] = 71,["107"] = 71,["108"] = 71,["109"] = 72,["110"] = 71,["111"] = 71,["112"] = 48,["113"] = 76,["114"] = 77,["115"] = 78,["116"] = 78,["118"] = 79,["119"] = 76,["120"] = 82,["121"] = 83,["122"] = 82,["123"] = 86,["124"] = 87,["125"] = 88,["126"] = 88,["128"] = 89,["129"] = 90,["130"] = 91,["131"] = 92,["134"] = 95,["135"] = 86,["136"] = 98,["137"] = 99,["140"] = 100,["141"] = 101,["142"] = 102,["143"] = 98,["144"] = 105,["145"] = 106,["148"] = 107,["149"] = 108,["150"] = 109,["151"] = 111,["152"] = 118,["153"] = 119,["154"] = 105,["155"] = 122,["156"] = 123,["157"] = 123,["159"] = 124,["160"] = 125,["161"] = 125,["163"] = 127,["164"] = 128,["165"] = 128,["167"] = 130,["168"] = 132,["169"] = 137,["170"] = 138,["171"] = 139,["172"] = 140,["173"] = 140,["174"] = 140,["175"] = 140,["176"] = 141,["177"] = 140,["178"] = 140,["179"] = 143,["181"] = 146,["182"] = 122,["183"] = 149,["184"] = 150,["185"] = 150,["187"] = 151,["188"] = 152,["189"] = 152,["191"] = 154,["192"] = 155,["193"] = 155,["195"] = 157,["196"] = 158,["197"] = 160,["198"] = 162,["199"] = 163,["200"] = 163,["201"] = 163,["202"] = 163,["203"] = 163,["204"] = 163,["205"] = 163,["206"] = 164,["207"] = 164,["208"] = 164,["209"] = 164,["210"] = 164,["211"] = 164,["212"] = 164,["213"] = 165,["214"] = 166,["215"] = 167,["216"] = 172,["217"] = 172,["219"] = 173,["220"] = 174,["222"] = 177,["223"] = 179,["224"] = 180,["226"] = 183,["227"] = 184,["228"] = 185,["229"] = 186,["231"] = 188,["232"] = 189,["233"] = 191,["234"] = 198,["235"] = 200,["236"] = 201,["237"] = 202,["238"] = 149,["239"] = 205,["240"] = 206,["241"] = 207,["244"] = 208,["247"] = 210,["248"] = 211,["251"] = 213,["252"] = 214,["253"] = 215,["254"] = 216,["255"] = 217,["256"] = 218,["257"] = 219,["258"] = 220,["259"] = 221,["260"] = 222,["262"] = 224,["264"] = 231,["266"] = 205,["267"] = 235,["268"] = 236,["269"] = 237,["272"] = 238,["275"] = 240,["276"] = 241,["279"] = 243,["280"] = 244,["281"] = 245,["282"] = 246,["283"] = 247,["284"] = 248,["285"] = 254,["287"] = 235,["288"] = 258,["289"] = 259,["292"] = 260,["293"] = 261,["294"] = 262,["295"] = 263,["298"] = 266,["299"] = 267,["300"] = 258,["301"] = 270,["302"] = 271,["303"] = 272,["306"] = 274,["307"] = 275,["308"] = 277,["309"] = 279,["311"] = 280,["312"] = 280,["314"] = 281,["315"] = 282,["316"] = 283,["317"] = 284,["318"] = 284,["319"] = 284,["320"] = 284,["321"] = 284,["322"] = 284,["323"] = 284,["324"] = 287,["325"] = 288,["327"] = 290,["328"] = 291,["329"] = 295,["330"] = 296,["331"] = 296,["332"] = 296,["333"] = 296,["340"] = 302,["342"] = 303,["343"] = 303,["344"] = 304,["345"] = 305,["346"] = 306,["347"] = 307,["348"] = 308,["349"] = 309,["350"] = 314,["351"] = 315,["352"] = 316,["357"] = 303,["361"] = 324,["363"] = 325,["364"] = 325,["365"] = 326,["366"] = 327,["367"] = 328,["368"] = 329,["369"] = 334,["370"] = 335,["371"] = 336,["372"] = 337,["376"] = 325,["380"] = 270,["381"] = 345,["382"] = 346,["383"] = 347,["386"] = 349,["387"] = 350,["390"] = 352,["391"] = 353,["394"] = 355,["395"] = 356,["398"] = 360,["399"] = 361,["402"] = 365,["403"] = 366,["404"] = 368,["405"] = 369,["406"] = 345,["407"] = 372,["408"] = 373,["409"] = 374,["412"] = 376,["413"] = 377,["416"] = 379,["417"] = 380,["420"] = 382,["421"] = 383,["424"] = 387,["425"] = 388,["426"] = 372,["427"] = 391,["428"] = 392,["429"] = 392,["430"] = 392,["431"] = 392,["432"] = 392,["433"] = 392,["434"] = 392,["435"] = 392,["436"] = 392,["437"] = 391,["438"] = 400,["439"] = 401,["440"] = 401,["441"] = 401,["442"] = 401,["443"] = 401,["444"] = 401,["445"] = 401,["446"] = 400,["447"] = 407,["448"] = 408,["449"] = 409,["450"] = 409,["451"] = 409,["452"] = 409,["453"] = 409,["456"] = 412,["457"] = 413,["458"] = 414,["461"] = 417,["462"] = 418,["463"] = 419,["464"] = 420,["467"] = 423,["468"] = 424,["469"] = 425,["472"] = 426,["473"] = 427,["474"] = 428,["477"] = 407,["478"] = 433,["479"] = 434,["480"] = 435,["481"] = 436,["482"] = 436,["483"] = 436,["484"] = 436,["485"] = 436,["486"] = 436,["487"] = 436,["488"] = 436,["489"] = 436,["490"] = 436,["491"] = 436,["492"] = 436,["493"] = 436,["494"] = 436,["495"] = 436,["496"] = 451,["498"] = 453,["499"] = 433});
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
