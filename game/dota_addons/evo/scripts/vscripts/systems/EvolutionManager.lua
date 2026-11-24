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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 9,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 54,["28"] = 60,["29"] = 60,["30"] = 60,["31"] = 64,["32"] = 64,["33"] = 65,["34"] = 66,["35"] = 61,["36"] = 63,["37"] = 69,["38"] = 70,["39"] = 70,["40"] = 70,["41"] = 70,["42"] = 70,["43"] = 71,["44"] = 71,["45"] = 71,["46"] = 71,["47"] = 71,["48"] = 73,["49"] = 73,["50"] = 73,["51"] = 74,["52"] = 73,["53"] = 73,["54"] = 76,["55"] = 76,["56"] = 76,["57"] = 77,["58"] = 76,["59"] = 76,["60"] = 79,["61"] = 79,["62"] = 79,["63"] = 80,["64"] = 79,["65"] = 79,["66"] = 83,["67"] = 83,["68"] = 83,["69"] = 83,["70"] = 83,["71"] = 83,["72"] = 83,["73"] = 84,["74"] = 83,["75"] = 83,["76"] = 86,["77"] = 86,["78"] = 86,["79"] = 86,["80"] = 86,["81"] = 86,["82"] = 86,["83"] = 87,["84"] = 86,["85"] = 86,["86"] = 89,["87"] = 89,["88"] = 89,["89"] = 89,["90"] = 89,["91"] = 89,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 90,["96"] = 89,["97"] = 89,["98"] = 69,["99"] = 94,["100"] = 95,["101"] = 96,["102"] = 96,["104"] = 97,["105"] = 94,["106"] = 100,["107"] = 101,["108"] = 100,["109"] = 104,["110"] = 105,["111"] = 106,["112"] = 106,["114"] = 107,["115"] = 108,["116"] = 109,["117"] = 110,["120"] = 113,["121"] = 104,["122"] = 116,["123"] = 117,["126"] = 118,["127"] = 119,["128"] = 120,["129"] = 116,["130"] = 123,["131"] = 124,["134"] = 125,["135"] = 126,["136"] = 127,["137"] = 129,["138"] = 136,["139"] = 137,["140"] = 123,["141"] = 140,["142"] = 141,["143"] = 141,["145"] = 142,["146"] = 143,["147"] = 143,["149"] = 145,["150"] = 146,["151"] = 146,["153"] = 148,["154"] = 150,["155"] = 155,["156"] = 156,["157"] = 157,["158"] = 158,["159"] = 158,["160"] = 158,["161"] = 158,["162"] = 159,["163"] = 158,["164"] = 158,["165"] = 161,["167"] = 164,["168"] = 140,["169"] = 167,["170"] = 168,["171"] = 168,["173"] = 169,["174"] = 170,["175"] = 170,["177"] = 172,["178"] = 173,["179"] = 173,["181"] = 175,["182"] = 176,["183"] = 178,["184"] = 179,["185"] = 180,["186"] = 184,["187"] = 184,["189"] = 185,["190"] = 186,["192"] = 189,["193"] = 191,["194"] = 192,["196"] = 195,["197"] = 196,["198"] = 197,["199"] = 198,["201"] = 200,["202"] = 201,["203"] = 203,["204"] = 210,["205"] = 211,["206"] = 212,["207"] = 167,["208"] = 215,["209"] = 219,["211"] = 220,["212"] = 220,["214"] = 221,["215"] = 222,["216"] = 222,["218"] = 223,["219"] = 224,["220"] = 224,["222"] = 225,["223"] = 225,["225"] = 226,["226"] = 226,["228"] = 227,["231"] = 220,["234"] = 229,["235"] = 215,["236"] = 232,["237"] = 233,["239"] = 234,["240"] = 234,["242"] = 235,["243"] = 236,["244"] = 236,["246"] = 237,["250"] = 232,["251"] = 243,["252"] = 244,["253"] = 245,["256"] = 246,["259"] = 248,["260"] = 249,["263"] = 251,["264"] = 252,["265"] = 253,["266"] = 254,["267"] = 255,["268"] = 256,["269"] = 257,["270"] = 258,["271"] = 259,["272"] = 260,["274"] = 262,["276"] = 269,["278"] = 243,["279"] = 273,["280"] = 274,["281"] = 275,["284"] = 276,["287"] = 278,["288"] = 279,["291"] = 281,["292"] = 282,["293"] = 283,["294"] = 284,["295"] = 285,["296"] = 286,["297"] = 292,["299"] = 273,["300"] = 296,["301"] = 297,["304"] = 298,["305"] = 299,["306"] = 300,["307"] = 301,["310"] = 304,["311"] = 305,["312"] = 296,["313"] = 308,["314"] = 309,["315"] = 310,["318"] = 312,["319"] = 313,["320"] = 315,["321"] = 317,["323"] = 318,["324"] = 318,["326"] = 319,["327"] = 320,["328"] = 321,["329"] = 322,["330"] = 322,["331"] = 322,["332"] = 322,["333"] = 322,["334"] = 322,["335"] = 322,["336"] = 325,["337"] = 326,["339"] = 328,["340"] = 329,["341"] = 330,["342"] = 330,["343"] = 330,["344"] = 330,["351"] = 336,["353"] = 337,["354"] = 337,["355"] = 338,["356"] = 339,["357"] = 340,["358"] = 341,["359"] = 342,["360"] = 343,["361"] = 348,["362"] = 349,["363"] = 350,["368"] = 337,["372"] = 358,["374"] = 359,["375"] = 359,["376"] = 360,["377"] = 361,["378"] = 362,["379"] = 363,["380"] = 364,["381"] = 365,["382"] = 366,["383"] = 367,["384"] = 368,["385"] = 368,["386"] = 368,["387"] = 368,["391"] = 359,["395"] = 308,["396"] = 376,["397"] = 377,["398"] = 378,["401"] = 380,["402"] = 381,["405"] = 383,["406"] = 384,["409"] = 386,["410"] = 387,["413"] = 391,["414"] = 392,["417"] = 396,["418"] = 397,["419"] = 399,["420"] = 400,["421"] = 376,["422"] = 403,["423"] = 404,["424"] = 405,["427"] = 407,["428"] = 408,["431"] = 410,["432"] = 411,["435"] = 413,["436"] = 414,["439"] = 418,["440"] = 419,["441"] = 403,["442"] = 422,["443"] = 423,["446"] = 424,["447"] = 425,["450"] = 427,["451"] = 428,["454"] = 430,["455"] = 431,["458"] = 433,["459"] = 434,["462"] = 436,["463"] = 437,["466"] = 441,["467"] = 442,["468"] = 443,["471"] = 445,["472"] = 446,["473"] = 447,["474"] = 449,["475"] = 453,["476"] = 459,["477"] = 460,["478"] = 422,["479"] = 463,["480"] = 464,["481"] = 464,["482"] = 464,["483"] = 464,["484"] = 464,["485"] = 464,["486"] = 464,["488"] = 472,["489"] = 472,["491"] = 473,["492"] = 474,["493"] = 474,["495"] = 475,["496"] = 476,["497"] = 476,["499"] = 477,["500"] = 477,["502"] = 478,["505"] = 472,["508"] = 463,["509"] = 482,["510"] = 487,["511"] = 488,["512"] = 490,["513"] = 491,["514"] = 492,["516"] = 494,["517"] = 496,["518"] = 502,["519"] = 504,["520"] = 504,["521"] = 504,["522"] = 504,["523"] = 505,["524"] = 506,["525"] = 507,["526"] = 509,["527"] = 510,["528"] = 511,["529"] = 512,["530"] = 514,["531"] = 515,["532"] = 516,["533"] = 517,["534"] = 518,["535"] = 519,["536"] = 520,["540"] = 524,["541"] = 525,["542"] = 526,["543"] = 526,["546"] = 528,["547"] = 529,["548"] = 530,["549"] = 530,["552"] = 533,["553"] = 534,["554"] = 535,["555"] = 536,["556"] = 537,["557"] = 538,["558"] = 539,["559"] = 540,["560"] = 541,["561"] = 542,["562"] = 543,["563"] = 544,["564"] = 545,["567"] = 548,["568"] = 549,["569"] = 551,["570"] = 551,["571"] = 551,["572"] = 552,["573"] = 553,["576"] = 556,["578"] = 558,["579"] = 559,["580"] = 560,["582"] = 562,["583"] = 563,["584"] = 564,["585"] = 565,["586"] = 565,["590"] = 568,["591"] = 570,["592"] = 571,["593"] = 572,["594"] = 573,["597"] = 576,["598"] = 577,["599"] = 578,["600"] = 579,["603"] = 583,["604"] = 585,["605"] = 586,["606"] = 587,["607"] = 588,["608"] = 589,["611"] = 593,["612"] = 594,["613"] = 595,["614"] = 596,["615"] = 597,["616"] = 598,["619"] = 602,["620"] = 603,["623"] = 606,["624"] = 607,["625"] = 608,["627"] = 611,["628"] = 482,["629"] = 614,["630"] = 615,["631"] = 616,["633"] = 617,["634"] = 617,["635"] = 618,["636"] = 619,["637"] = 620,["638"] = 620,["639"] = 620,["640"] = 620,["641"] = 620,["642"] = 620,["645"] = 617,["649"] = 625,["650"] = 614,["651"] = 628,["652"] = 633,["655"] = 634,["656"] = 635,["657"] = 636,["658"] = 637,["659"] = 638,["660"] = 639,["663"] = 628,["664"] = 644,["665"] = 645,["666"] = 646,["667"] = 647,["670"] = 650,["671"] = 651,["672"] = 652,["673"] = 653,["676"] = 656,["677"] = 657,["678"] = 658,["681"] = 659,["682"] = 660,["683"] = 661,["686"] = 644,["687"] = 666,["688"] = 667,["689"] = 668,["690"] = 669,["691"] = 670,["694"] = 673,["695"] = 666,["696"] = 676,["697"] = 677,["698"] = 678,["699"] = 679,["700"] = 679,["701"] = 679,["702"] = 679,["703"] = 679,["704"] = 679,["705"] = 679,["706"] = 679,["707"] = 679,["708"] = 679,["709"] = 679,["710"] = 679,["711"] = 679,["712"] = 679,["713"] = 693,["715"] = 695,["716"] = 676,["717"] = 698,["718"] = 699,["719"] = 700,["720"] = 701,["721"] = 702,["722"] = 702,["723"] = 702,["725"] = 702,["726"] = 707,["727"] = 708,["728"] = 709,["729"] = 710,["730"] = 711,["731"] = 712,["732"] = 713,["733"] = 714,["734"] = 715,["735"] = 717,["736"] = 718,["737"] = 719,["739"] = 720,["740"] = 721,["741"] = 721,["743"] = 722,["744"] = 726,["745"] = 726,["746"] = 726,["747"] = 726,["748"] = 726,["749"] = 726,["750"] = 726,["751"] = 726,["752"] = 726,["753"] = 726,["758"] = 738,["759"] = 740,["760"] = 698});
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
    if body.heroClass and #body.heroClass > 0 and hero:GetUnitName() ~= body.heroClass and not self.lazyPrecacheManager:isHeroReady(playerId, body.heroClass) then
        state.pendingDraftType = "NONE"
        state.draftOptions = {}
        self:syncPlayerEvo(playerId)
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
                    goto __continue39
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") then
                    goto __continue39
                end
                if name == state.innateAbilityName or name == state.signatureAbilityName then
                    goto __continue39
                end
                if __TS__ArrayIncludes(state.kitAbilityNames, name) then
                    goto __continue39
                end
                result[#result + 1] = name
            end
            ::__continue39::
            i = i + 1
        end
    end
    return result
end
function EvolutionManager.prototype.reapplyMutationsToHero(self, hero, state)
    for ____, mutationId in ipairs(state.mutations) do
        do
            if not mutationId then
                goto __continue45
            end
            local mutationDef = getMutationDefinition(nil, mutationId)
            if not mutationDef then
                goto __continue45
            end
            hero:AddNewModifier(hero, nil, mutationDef.modifierName, {mutation_id = mutationDef.id})
        end
        ::__continue45::
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
        self.lazyPrecacheManager:precacheForPlayer(playerId)
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
                goto __continue68
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
        ::__continue68::
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
                    goto __continue108
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or keep:has(name) then
                    goto __continue108
                end
                if ability:IsHidden() then
                    goto __continue108
                end
                hero:RemoveAbilityByHandle(ability)
            end
            ::__continue108::
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
                    goto __continue166
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
            ::__continue166::
        end
    end
    existing.draft_meta = draftMeta
    CustomNetTables:SetTableValue("player_evo", key, existing)
end
return ____exports
