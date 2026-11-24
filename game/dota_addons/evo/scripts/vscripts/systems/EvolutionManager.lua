local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 2,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 8,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 15,["26"] = 15,["27"] = 53,["28"] = 59,["29"] = 59,["30"] = 59,["31"] = 63,["32"] = 63,["33"] = 64,["34"] = 60,["35"] = 62,["36"] = 67,["37"] = 68,["38"] = 68,["39"] = 68,["40"] = 68,["41"] = 68,["42"] = 69,["43"] = 69,["44"] = 69,["45"] = 69,["46"] = 69,["47"] = 71,["48"] = 71,["49"] = 71,["50"] = 72,["51"] = 71,["52"] = 71,["53"] = 74,["54"] = 74,["55"] = 74,["56"] = 75,["57"] = 74,["58"] = 74,["59"] = 77,["60"] = 77,["61"] = 77,["62"] = 78,["63"] = 77,["64"] = 77,["65"] = 81,["66"] = 81,["67"] = 81,["68"] = 81,["69"] = 81,["70"] = 81,["71"] = 81,["72"] = 82,["73"] = 81,["74"] = 81,["75"] = 84,["76"] = 84,["77"] = 84,["78"] = 84,["79"] = 84,["80"] = 84,["81"] = 84,["82"] = 85,["83"] = 84,["84"] = 84,["85"] = 87,["86"] = 87,["87"] = 87,["88"] = 87,["89"] = 87,["90"] = 87,["91"] = 87,["92"] = 87,["93"] = 87,["94"] = 88,["95"] = 87,["96"] = 87,["97"] = 67,["98"] = 92,["99"] = 93,["100"] = 94,["101"] = 94,["103"] = 95,["104"] = 92,["105"] = 98,["106"] = 99,["107"] = 98,["108"] = 102,["109"] = 103,["110"] = 104,["111"] = 104,["113"] = 105,["114"] = 106,["115"] = 107,["116"] = 108,["119"] = 111,["120"] = 102,["121"] = 114,["122"] = 115,["125"] = 116,["126"] = 117,["127"] = 118,["128"] = 114,["129"] = 121,["130"] = 122,["133"] = 123,["134"] = 124,["135"] = 125,["136"] = 127,["137"] = 134,["138"] = 135,["139"] = 121,["140"] = 138,["141"] = 139,["142"] = 139,["144"] = 140,["145"] = 141,["146"] = 141,["148"] = 143,["149"] = 144,["150"] = 144,["152"] = 146,["153"] = 147,["154"] = 149,["155"] = 150,["156"] = 151,["157"] = 155,["158"] = 155,["160"] = 156,["161"] = 157,["163"] = 160,["164"] = 162,["165"] = 163,["167"] = 166,["168"] = 167,["169"] = 168,["170"] = 169,["172"] = 171,["173"] = 172,["174"] = 174,["175"] = 181,["176"] = 182,["177"] = 183,["178"] = 138,["179"] = 186,["180"] = 190,["182"] = 191,["183"] = 191,["185"] = 192,["186"] = 193,["187"] = 193,["189"] = 194,["190"] = 195,["191"] = 195,["193"] = 196,["194"] = 196,["196"] = 197,["197"] = 197,["199"] = 198,["202"] = 191,["205"] = 200,["206"] = 186,["207"] = 203,["208"] = 204,["210"] = 205,["211"] = 205,["213"] = 206,["214"] = 207,["215"] = 207,["217"] = 208,["221"] = 203,["222"] = 214,["223"] = 215,["224"] = 216,["227"] = 217,["230"] = 219,["231"] = 220,["234"] = 222,["235"] = 223,["236"] = 224,["237"] = 225,["238"] = 226,["239"] = 227,["240"] = 228,["241"] = 229,["242"] = 230,["244"] = 232,["246"] = 239,["248"] = 214,["249"] = 243,["250"] = 244,["251"] = 245,["254"] = 246,["257"] = 248,["258"] = 249,["261"] = 251,["262"] = 252,["263"] = 253,["264"] = 254,["265"] = 255,["266"] = 256,["267"] = 262,["269"] = 243,["270"] = 266,["271"] = 267,["274"] = 268,["275"] = 269,["276"] = 270,["277"] = 271,["280"] = 274,["281"] = 275,["282"] = 266,["283"] = 278,["284"] = 279,["285"] = 280,["288"] = 282,["289"] = 283,["290"] = 285,["291"] = 287,["293"] = 288,["294"] = 288,["296"] = 289,["297"] = 290,["298"] = 291,["299"] = 292,["300"] = 292,["301"] = 292,["302"] = 292,["303"] = 292,["304"] = 292,["305"] = 292,["306"] = 295,["307"] = 296,["309"] = 298,["310"] = 299,["311"] = 300,["312"] = 300,["313"] = 300,["314"] = 300,["321"] = 306,["323"] = 307,["324"] = 307,["325"] = 308,["326"] = 309,["327"] = 310,["328"] = 311,["329"] = 312,["330"] = 313,["331"] = 318,["332"] = 319,["333"] = 320,["338"] = 307,["343"] = 328,["344"] = 328,["345"] = 329,["346"] = 330,["347"] = 331,["348"] = 332,["349"] = 333,["350"] = 334,["351"] = 335,["352"] = 336,["353"] = 337,["354"] = 337,["355"] = 337,["356"] = 337,["360"] = 328,["363"] = 278,["364"] = 344,["365"] = 345,["366"] = 346,["369"] = 348,["370"] = 349,["373"] = 351,["374"] = 352,["377"] = 354,["378"] = 355,["381"] = 359,["382"] = 360,["385"] = 364,["386"] = 365,["387"] = 367,["388"] = 368,["389"] = 344,["390"] = 371,["391"] = 372,["392"] = 373,["395"] = 375,["396"] = 376,["399"] = 378,["400"] = 379,["403"] = 381,["404"] = 382,["407"] = 386,["408"] = 387,["409"] = 371,["410"] = 390,["411"] = 391,["412"] = 392,["415"] = 394,["416"] = 395,["419"] = 397,["420"] = 398,["423"] = 400,["424"] = 401,["427"] = 403,["428"] = 404,["431"] = 408,["432"] = 409,["433"] = 410,["436"] = 412,["437"] = 413,["438"] = 414,["439"] = 416,["440"] = 420,["441"] = 426,["442"] = 427,["443"] = 390,["444"] = 430,["445"] = 431,["446"] = 431,["447"] = 431,["448"] = 431,["449"] = 431,["450"] = 431,["451"] = 431,["453"] = 439,["454"] = 439,["456"] = 440,["457"] = 441,["458"] = 441,["460"] = 442,["461"] = 443,["462"] = 443,["464"] = 444,["465"] = 444,["467"] = 445,["470"] = 439,["473"] = 430,["474"] = 449,["475"] = 454,["476"] = 455,["477"] = 457,["478"] = 458,["479"] = 459,["481"] = 461,["482"] = 463,["483"] = 469,["484"] = 471,["485"] = 471,["486"] = 471,["487"] = 471,["488"] = 472,["489"] = 473,["490"] = 474,["491"] = 476,["492"] = 477,["493"] = 478,["494"] = 479,["495"] = 481,["496"] = 482,["497"] = 483,["498"] = 484,["499"] = 485,["500"] = 486,["501"] = 487,["505"] = 491,["506"] = 492,["507"] = 493,["508"] = 493,["511"] = 495,["512"] = 496,["513"] = 497,["514"] = 497,["517"] = 500,["518"] = 501,["519"] = 502,["520"] = 503,["521"] = 504,["522"] = 505,["523"] = 506,["524"] = 507,["525"] = 508,["526"] = 509,["527"] = 510,["528"] = 511,["529"] = 512,["532"] = 515,["533"] = 516,["534"] = 518,["535"] = 518,["536"] = 518,["537"] = 519,["538"] = 520,["541"] = 523,["543"] = 525,["544"] = 526,["545"] = 527,["547"] = 529,["548"] = 530,["549"] = 531,["550"] = 532,["551"] = 532,["555"] = 535,["556"] = 537,["557"] = 538,["558"] = 539,["559"] = 540,["562"] = 543,["563"] = 544,["564"] = 545,["565"] = 546,["568"] = 550,["569"] = 552,["570"] = 553,["571"] = 554,["572"] = 555,["573"] = 556,["576"] = 560,["577"] = 561,["578"] = 562,["579"] = 563,["580"] = 564,["581"] = 565,["584"] = 569,["585"] = 570,["588"] = 573,["589"] = 574,["590"] = 575,["592"] = 578,["593"] = 449,["594"] = 581,["595"] = 582,["596"] = 583,["598"] = 584,["599"] = 584,["600"] = 585,["601"] = 586,["602"] = 587,["603"] = 587,["604"] = 587,["605"] = 587,["606"] = 587,["607"] = 587,["610"] = 584,["614"] = 592,["615"] = 581,["616"] = 595,["617"] = 600,["620"] = 601,["621"] = 602,["622"] = 603,["623"] = 604,["624"] = 605,["625"] = 606,["628"] = 595,["629"] = 611,["630"] = 612,["631"] = 613,["632"] = 614,["635"] = 617,["636"] = 618,["637"] = 619,["638"] = 620,["641"] = 623,["642"] = 624,["643"] = 625,["646"] = 626,["647"] = 627,["648"] = 628,["651"] = 611,["652"] = 633,["653"] = 634,["654"] = 635,["655"] = 636,["656"] = 637,["659"] = 640,["660"] = 633,["661"] = 643,["662"] = 644,["663"] = 645,["664"] = 646,["665"] = 646,["666"] = 646,["667"] = 646,["668"] = 646,["669"] = 646,["670"] = 646,["671"] = 646,["672"] = 646,["673"] = 646,["674"] = 646,["675"] = 646,["676"] = 646,["677"] = 646,["678"] = 660,["680"] = 662,["681"] = 643,["682"] = 665,["683"] = 666,["684"] = 667,["685"] = 668,["686"] = 669,["687"] = 669,["688"] = 669,["690"] = 669,["691"] = 674,["692"] = 675,["693"] = 676,["694"] = 677,["695"] = 678,["696"] = 679,["697"] = 680,["698"] = 681,["699"] = 682,["700"] = 684,["701"] = 685,["702"] = 686,["704"] = 687,["705"] = 688,["706"] = 688,["708"] = 689,["709"] = 693,["710"] = 693,["711"] = 693,["712"] = 693,["713"] = 693,["714"] = 693,["715"] = 693,["716"] = 693,["717"] = 693,["718"] = 693,["723"] = 705,["724"] = 707,["725"] = 665});
local ____exports = {}
local ____bodies_catalog = require("data.bodies_catalog")
local EVO_DEFAULT_START_BODY_ID = ____bodies_catalog.EVO_DEFAULT_START_BODY_ID
local getBodiesForTier = ____bodies_catalog.getBodiesForTier
local getBodyDefinition = ____bodies_catalog.getBodyDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_TIERS = ____game_constants.EVO_TIERS
local getNextTierConfig = ____game_constants.getNextTierConfig
local getTierConfig = ____game_constants.getTierConfig
local ____mutations_catalog = require("data.mutations_catalog")
local getMutationDefinition = ____mutations_catalog.getMutationDefinition
local getMutationsForSlot = ____mutations_catalog.getMutationsForSlot
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local MUTATION_SLOT_ORDER = {"ACTIVE_UPGRADE", "PASSIVE_SLOT_1", "PASSIVE_SLOT_2"}
____exports.EvolutionManager = __TS__Class()
local EvolutionManager = ____exports.EvolutionManager
EvolutionManager.name = "EvolutionManager"
function EvolutionManager.prototype.____constructor(self, eventBus, spellShopManager)
    self.eventBus = eventBus
    self.spellShopManager = spellShopManager
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
    self:syncPlayerEvo(playerId)
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
    local previousBodyId = state.bodyId
    if body.heroClass and #body.heroClass > 0 and hero:GetUnitName() ~= body.heroClass then
        local preservedAbilities = self:collectPurchasedAbilities(hero, state)
        local replaced = HeroAppearance:replaceHeroPreservingState(playerId, body.heroClass, {stripDefaultAbilities = body.keepDefaultHeroAbilities ~= true, preserveAbilities = preservedAbilities})
        if not replaced then
            return false
        end
        hero = replaced
        self:reapplyMutationsToHero(hero, state)
    end
    self:applyBodyToHero(hero, state, body)
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
    self:syncPlayerEvo(playerId)
    return true
end
function EvolutionManager.prototype.collectPurchasedAbilities(self, hero, state)
    local result = {}
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not ability or ability:IsNull() or ability:IsHidden() then
                    goto __continue33
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") then
                    goto __continue33
                end
                if name == state.innateAbilityName or name == state.signatureAbilityName then
                    goto __continue33
                end
                if __TS__ArrayIncludes(state.kitAbilityNames, name) then
                    goto __continue33
                end
                result[#result + 1] = name
            end
            ::__continue33::
            i = i + 1
        end
    end
    return result
end
function EvolutionManager.prototype.reapplyMutationsToHero(self, hero, state)
    for ____, mutationId in ipairs(state.mutations) do
        do
            if not mutationId then
                goto __continue39
            end
            local mutationDef = getMutationDefinition(nil, mutationId)
            if not mutationDef then
                goto __continue39
            end
            hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
        end
        ::__continue39::
    end
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
        local hero = unit
        self:stripDefaultHeroAbilities(hero)
        local state = self:getOrCreateState(playerId)
        local starter = getBodyDefinition(nil, EVO_DEFAULT_START_BODY_ID)
        if starter then
            self:applyBodyToHero(hero, state, starter)
            if starter.appearance then
                HeroAppearance:applyPreset(hero, starter.appearance)
            end
            self.eventBus:emit("body_morphed", {playerId = playerId, previousBodyId = "", newBodyId = starter.id, tierIndex = starter.tierIndex})
        end
        self:syncPlayerEvo(playerId)
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
    local floorThreshold = self:findFloorEvoThreshold(state.evoPoints)
    if floorThreshold < state.evoPoints then
        local previousPoints = state.evoPoints
        state.evoPoints = floorThreshold
        self.eventBus:emit("evo_points_changed", {playerId = playerId, previousPoints = previousPoints, newPoints = state.evoPoints, delta = state.evoPoints - previousPoints})
        self:syncPlayerEvo(playerId)
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
    self:syncPlayerEvo(playerId)
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
                goto __continue62
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
        ::__continue62::
    end
    if EVO_CONSTANTS.ENABLE_ABILITY_DRAFT then
        do
            local slotIndex = 0
            while slotIndex < #EVO_CONSTANTS.ABILITY_DRAFT_LEVELS do
                local reqLevel = EVO_CONSTANTS.ABILITY_DRAFT_LEVELS[slotIndex + 1]
                if heroLevel >= reqLevel and not state.unlockedAbilitySlots[slotIndex + 1] then
                    state.unlockedAbilitySlots[slotIndex + 1] = true
                    local currentBody = getBodyDefinition(nil, state.bodyId)
                    if currentBody then
                        local choices = self.spellShopManager:rollAbilityDraftChoices(playerId, currentBody, EVO_CONSTANTS.ABILITY_DRAFT_CHOICES)
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
    self:syncPlayerEvo(playerId)
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
    self:syncPlayerEvo(playerId)
end
function EvolutionManager.prototype.stripDefaultHeroAbilities(self, hero)
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
                    goto __continue100
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or keep:has(name) then
                    goto __continue100
                end
                if ability:IsHidden() then
                    goto __continue100
                end
                hero:RemoveAbilityByHandle(ability)
            end
            ::__continue100::
            i = i + 1
        end
    end
end
function EvolutionManager.prototype.applyBodyToHero(self, hero, state, body)
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
    if body.keepDefaultHeroAbilities ~= true then
        if body.kitAbilities and #body.kitAbilities > 0 then
            for ____, oldName in ipairs(state.kitAbilityNames) do
                if not __TS__ArrayIncludes(body.kitAbilities, oldName) then
                    local oldAb = hero:FindAbilityByName(oldName)
                    if oldAb then
                        self:removeAbilityPreservingSlot(hero, oldAb)
                    end
                end
            end
            if state.innateAbilityName and not __TS__ArrayIncludes(body.kitAbilities, state.innateAbilityName) then
                local oldInnate = hero:FindAbilityByName(state.innateAbilityName)
                if oldInnate then
                    self:removeAbilityPreservingSlot(hero, oldInnate)
                end
            end
            if state.signatureAbilityName and not __TS__ArrayIncludes(body.kitAbilities, state.signatureAbilityName) then
                local oldSig = hero:FindAbilityByName(state.signatureAbilityName)
                if oldSig then
                    self:removeAbilityPreservingSlot(hero, oldSig)
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
                        self:placeAbilityInSlot(hero, ab, targetSlot)
                        if not isUltimate then
                            activeSlot = activeSlot + 1
                        end
                    end
                    ab:SetHidden(false)
                    local desiredLevel = isInnate and 1 or math.min(
                        ab:GetMaxLevel(),
                        math.max(1, targetKitLevel)
                    )
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
                        self:removeAbilityPreservingSlot(hero, oldAb)
                    end
                end
            end
            state.kitAbilityNames = {}
            if state.innateAbilityName and state.innateAbilityName ~= body.innateAbility then
                local oldInnate = hero:FindAbilityByName(state.innateAbilityName)
                if oldInnate then
                    self:removeAbilityPreservingSlot(hero, oldInnate)
                end
            end
            if state.signatureAbilityName and state.signatureAbilityName ~= body.signatureAbility then
                local oldSig = hero:FindAbilityByName(state.signatureAbilityName)
                if oldSig then
                    self:removeAbilityPreservingSlot(hero, oldSig)
                end
            end
            local signature = hero:FindAbilityByName(body.signatureAbility) or hero:AddAbility(body.signatureAbility)
            if signature and not signature:IsNull() then
                self:placeAbilityInSlot(hero, signature, 0)
                signature:SetHidden(false)
                if signature:GetLevel() == 0 then
                    signature:SetLevel(1)
                end
            end
            local innate = hero:FindAbilityByName(body.innateAbility) or hero:AddAbility(body.innateAbility)
            if innate and not innate:IsNull() then
                self:placeAbilityInSlot(hero, innate, 1)
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
function EvolutionManager.prototype.removeAbilityPreservingSlot(self, hero, ability)
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
function EvolutionManager.prototype.placeAbilityInSlot(self, hero, ability, targetSlot)
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
function EvolutionManager.prototype.findFloorEvoThreshold(self, points)
    local floorValue = 0
    for ____, threshold in ipairs(EVO_CONSTANTS.EVO_THRESHOLDS) do
        if points >= threshold then
            floorValue = threshold
        end
    end
    return floorValue
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
function EvolutionManager.prototype.syncPlayerEvo(self, playerId)
    local state = self:getOrCreateState(playerId)
    local tierConfig = getTierConfig(nil, state.tierIndex)
    local key = tostring(playerId)
    local ____temp_2 = CustomNetTables:GetTableValue("player_evo", key)
    if ____temp_2 == nil then
        ____temp_2 = {}
    end
    local existing = ____temp_2
    existing.body_id = state.bodyId
    existing.tier_index = state.tierIndex
    existing.tier_label = tierConfig.label
    existing.evo_points = state.evoPoints
    existing.biomass = state.biomass
    existing.mutations = state.mutations
    existing.pending_draft_type = state.pendingDraftType
    existing.pending_mutation_slot = state.pendingMutationSlot
    existing.draft_options = state.draftOptions
    local draftMeta = {}
    if state.pendingDraftType == "BODY" then
        for ____, optId in ipairs(state.draftOptions) do
            do
                local b = getBodyDefinition(nil, optId)
                if not b then
                    goto __continue158
                end
                local abList = b.kitAbilities and #b.kitAbilities > 0 and b.kitAbilities or ({b.signatureAbility, b.innateAbility})
                draftMeta[optId] = {
                    hero_class = b.heroClass or "",
                    attr = b.primaryAttribute,
                    abilities = abList,
                    ms = b.baseMoveSpeed,
                    str = b.baseStr,
                    agi = b.baseAgi,
                    int = b.baseInt,
                    tier_index = b.tierIndex
                }
            end
            ::__continue158::
        end
    end
    existing.draft_meta = draftMeta
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
