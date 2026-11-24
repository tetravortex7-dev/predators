local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 47,["15"] = 47,["16"] = 47,["17"] = 47,["18"] = 47,["19"] = 47,["20"] = 47,["21"] = 47,["22"] = 56,["23"] = 57,["24"] = 58,["25"] = 60,["26"] = 60,["27"] = 60,["28"] = 90,["29"] = 90,["30"] = 91,["31"] = 61,["32"] = 62,["33"] = 63,["34"] = 65,["35"] = 66,["36"] = 67,["37"] = 68,["38"] = 70,["39"] = 71,["40"] = 72,["41"] = 73,["42"] = 74,["43"] = 76,["44"] = 79,["45"] = 80,["46"] = 81,["47"] = 82,["48"] = 83,["49"] = 87,["50"] = 89,["51"] = 94,["52"] = 95,["53"] = 97,["54"] = 97,["55"] = 97,["56"] = 97,["57"] = 97,["58"] = 98,["59"] = 98,["60"] = 98,["61"] = 98,["62"] = 98,["63"] = 100,["64"] = 100,["65"] = 100,["66"] = 101,["67"] = 100,["68"] = 100,["69"] = 103,["70"] = 103,["71"] = 103,["72"] = 104,["73"] = 103,["74"] = 103,["75"] = 107,["76"] = 107,["77"] = 107,["78"] = 107,["79"] = 107,["80"] = 108,["81"] = 107,["82"] = 107,["83"] = 111,["84"] = 111,["85"] = 111,["86"] = 112,["87"] = 113,["88"] = 111,["89"] = 111,["90"] = 116,["91"] = 116,["92"] = 116,["93"] = 116,["94"] = 116,["95"] = 116,["96"] = 116,["97"] = 116,["98"] = 116,["99"] = 117,["100"] = 118,["102"] = 116,["103"] = 116,["104"] = 122,["105"] = 94,["106"] = 125,["107"] = 126,["108"] = 125,["109"] = 129,["110"] = 130,["111"] = 129,["112"] = 133,["113"] = 134,["114"] = 137,["115"] = 140,["116"] = 144,["117"] = 145,["119"] = 147,["120"] = 148,["122"] = 150,["124"] = 152,["125"] = 153,["127"] = 155,["129"] = 133,["130"] = 159,["131"] = 160,["132"] = 161,["133"] = 162,["134"] = 163,["135"] = 165,["136"] = 165,["137"] = 165,["138"] = 165,["139"] = 165,["141"] = 159,["142"] = 173,["143"] = 174,["144"] = 174,["146"] = 175,["147"] = 177,["148"] = 178,["149"] = 179,["151"] = 181,["152"] = 182,["153"] = 183,["154"] = 184,["156"] = 186,["158"] = 188,["160"] = 190,["161"] = 191,["163"] = 193,["165"] = 195,["167"] = 197,["168"] = 198,["170"] = 200,["172"] = 202,["174"] = 205,["175"] = 206,["176"] = 207,["178"] = 210,["179"] = 173,["180"] = 213,["181"] = 214,["182"] = 216,["183"] = 219,["184"] = 220,["185"] = 221,["189"] = 226,["190"] = 227,["191"] = 228,["194"] = 232,["195"] = 233,["196"] = 234,["197"] = 235,["198"] = 237,["199"] = 213,["200"] = 240,["201"] = 241,["202"] = 242,["203"] = 242,["205"] = 244,["206"] = 245,["207"] = 245,["209"] = 247,["210"] = 248,["211"] = 248,["213"] = 250,["214"] = 251,["215"] = 252,["216"] = 253,["217"] = 254,["218"] = 255,["219"] = 256,["220"] = 257,["221"] = 259,["222"] = 260,["223"] = 261,["224"] = 263,["226"] = 264,["227"] = 264,["228"] = 265,["229"] = 266,["230"] = 271,["231"] = 264,["234"] = 274,["235"] = 275,["236"] = 275,["237"] = 275,["238"] = 275,["239"] = 275,["240"] = 275,["241"] = 275,["242"] = 283,["243"] = 285,["244"] = 289,["245"] = 290,["246"] = 292,["247"] = 295,["248"] = 240,["249"] = 298,["250"] = 299,["253"] = 301,["254"] = 302,["255"] = 303,["256"] = 304,["257"] = 305,["258"] = 307,["259"] = 309,["260"] = 310,["262"] = 312,["263"] = 314,["264"] = 315,["265"] = 317,["266"] = 318,["267"] = 324,["268"] = 325,["269"] = 327,["270"] = 328,["272"] = 330,["274"] = 298,["275"] = 334,["276"] = 335,["277"] = 336,["278"] = 337,["279"] = 338,["282"] = 341,["283"] = 341,["285"] = 343,["286"] = 344,["287"] = 345,["288"] = 346,["289"] = 347,["290"] = 348,["291"] = 349,["294"] = 352,["295"] = 353,["297"] = 356,["299"] = 357,["300"] = 357,["301"] = 358,["302"] = 359,["303"] = 360,["305"] = 357,["308"] = 363,["309"] = 334,["310"] = 366,["311"] = 367,["314"] = 369,["315"] = 370,["316"] = 371,["317"] = 372,["318"] = 373,["319"] = 374,["320"] = 376,["321"] = 377,["322"] = 366,["323"] = 380,["324"] = 381,["327"] = 382,["328"] = 383,["329"] = 384,["330"] = 385,["331"] = 386,["332"] = 387,["335"] = 391,["336"] = 392,["337"] = 393,["338"] = 380,["339"] = 396,["340"] = 397,["341"] = 398,["342"] = 399,["343"] = 400,["344"] = 401,["346"] = 403,["350"] = 407,["351"] = 408,["353"] = 410,["354"] = 411,["355"] = 412,["359"] = 417,["360"] = 418,["361"] = 419,["363"] = 421,["367"] = 426,["368"] = 427,["369"] = 428,["370"] = 429,["371"] = 430,["372"] = 431,["375"] = 435,["376"] = 436,["379"] = 438,["380"] = 439,["381"] = 440,["382"] = 440,["383"] = 440,["384"] = 440,["385"] = 440,["386"] = 440,["387"] = 446,["388"] = 447,["389"] = 448,["390"] = 449,["391"] = 451,["392"] = 452,["393"] = 453,["394"] = 455,["395"] = 455,["396"] = 455,["397"] = 455,["398"] = 455,["399"] = 455,["400"] = 455,["401"] = 455,["402"] = 463,["403"] = 464,["404"] = 465,["405"] = 466,["406"] = 467,["409"] = 470,["410"] = 470,["411"] = 470,["412"] = 470,["413"] = 470,["414"] = 470,["416"] = 478,["417"] = 479,["418"] = 480,["419"] = 481,["420"] = 396,["421"] = 484,["422"] = 485,["423"] = 486,["424"] = 487,["425"] = 488,["428"] = 492,["429"] = 492,["431"] = 494,["433"] = 495,["434"] = 495,["435"] = 496,["436"] = 497,["437"] = 498,["438"] = 499,["439"] = 495,["442"] = 502,["443"] = 503,["444"] = 504,["445"] = 505,["446"] = 506,["447"] = 507,["448"] = 508,["450"] = 510,["451"] = 511,["453"] = 514,["454"] = 515,["455"] = 515,["456"] = 515,["457"] = 516,["458"] = 517,["459"] = 518,["460"] = 519,["463"] = 522,["464"] = 484,["465"] = 525,["466"] = 526,["467"] = 527,["468"] = 527,["470"] = 529,["471"] = 530,["472"] = 531,["473"] = 532,["474"] = 533,["475"] = 534,["477"] = 537,["479"] = 538,["480"] = 538,["481"] = 539,["482"] = 540,["483"] = 541,["485"] = 538,["488"] = 544,["489"] = 525,["490"] = 547,["491"] = 548,["492"] = 549,["493"] = 550,["494"] = 551,["495"] = 552,["496"] = 553,["499"] = 557,["500"] = 558,["501"] = 559,["502"] = 560,["503"] = 561,["504"] = 562,["505"] = 564,["506"] = 565,["507"] = 566,["508"] = 568,["509"] = 569,["510"] = 570,["511"] = 572,["512"] = 576,["513"] = 577,["514"] = 579,["515"] = 547,["516"] = 582,["517"] = 583,["520"] = 584,["521"] = 585,["524"] = 587,["525"] = 588,["526"] = 588,["527"] = 588,["528"] = 588,["529"] = 590,["531"] = 591,["532"] = 591,["534"] = 592,["535"] = 593,["536"] = 593,["538"] = 594,["539"] = 595,["540"] = 596,["541"] = 596,["542"] = 596,["543"] = 596,["547"] = 591,["550"] = 600,["552"] = 601,["553"] = 601,["555"] = 602,["556"] = 603,["557"] = 603,["559"] = 604,["560"] = 605,["561"] = 606,["565"] = 601,["568"] = 610,["569"] = 610,["570"] = 610,["571"] = 610,["572"] = 610,["573"] = 610,["574"] = 610,["575"] = 610,["576"] = 610,["577"] = 610,["578"] = 610,["579"] = 610,["580"] = 620,["581"] = 621,["583"] = 624,["584"] = 625,["585"] = 626,["586"] = 626,["587"] = 626,["588"] = 626,["589"] = 626,["590"] = 626,["591"] = 626,["592"] = 627,["593"] = 628,["595"] = 630,["596"] = 630,["597"] = 631,["598"] = 632,["599"] = 633,["601"] = 630,["605"] = 636,["606"] = 636,["607"] = 637,["608"] = 638,["609"] = 639,["611"] = 636,["614"] = 643,["615"] = 644,["616"] = 645,["617"] = 646,["618"] = 648,["619"] = 582,["620"] = 651,["621"] = 652,["624"] = 654,["625"] = 655,["628"] = 657,["629"] = 658,["632"] = 659,["635"] = 661,["636"] = 662,["637"] = 663,["638"] = 664,["639"] = 665,["642"] = 671,["643"] = 671,["644"] = 671,["645"] = 672,["646"] = 673,["647"] = 671,["648"] = 671,["649"] = 675,["650"] = 676,["654"] = 681,["657"] = 683,["658"] = 684,["661"] = 688,["662"] = 689,["663"] = 690,["664"] = 691,["665"] = 692,["667"] = 651,["668"] = 696,["669"] = 697,["672"] = 699,["673"] = 700,["674"] = 701,["675"] = 702,["676"] = 703,["677"] = 705,["678"] = 706,["680"] = 708,["681"] = 710,["682"] = 712,["683"] = 713,["684"] = 714,["686"] = 717,["687"] = 719,["688"] = 721,["689"] = 724,["690"] = 730,["691"] = 732,["692"] = 733,["693"] = 734,["695"] = 736,["697"] = 739,["698"] = 740,["699"] = 741,["700"] = 742,["701"] = 743,["702"] = 744,["703"] = 745,["707"] = 749,["710"] = 753,["711"] = 754,["713"] = 756,["714"] = 757,["716"] = 696,["717"] = 761,["718"] = 762,["719"] = 763,["720"] = 764,["721"] = 765,["722"] = 767,["723"] = 771,["724"] = 761,["725"] = 774,["726"] = 775,["729"] = 776,["730"] = 777,["731"] = 778,["734"] = 780,["735"] = 781,["737"] = 784,["738"] = 785,["739"] = 787,["740"] = 788,["741"] = 788,["742"] = 788,["743"] = 788,["744"] = 788,["745"] = 788,["746"] = 788,["747"] = 789,["748"] = 789,["749"] = 789,["750"] = 789,["751"] = 789,["752"] = 789,["753"] = 789,["754"] = 790,["755"] = 790,["756"] = 790,["757"] = 790,["758"] = 790,["759"] = 790,["760"] = 790,["762"] = 792,["763"] = 792,["765"] = 793,["766"] = 794,["767"] = 794,["769"] = 795,["770"] = 796,["771"] = 797,["772"] = 798,["776"] = 792,["780"] = 802,["781"] = 802,["783"] = 803,["784"] = 804,["785"] = 804,["787"] = 805,["788"] = 806,["789"] = 807,["790"] = 808,["794"] = 802,["798"] = 813,["799"] = 814,["801"] = 774,["802"] = 820,["803"] = 821,["804"] = 823,["805"] = 823,["806"] = 823,["807"] = 823,["808"] = 823,["809"] = 823,["810"] = 823,["811"] = 823,["812"] = 823,["813"] = 823,["814"] = 823,["815"] = 835,["817"] = 836,["818"] = 836,["820"] = 837,["821"] = 837,["823"] = 838,["824"] = 839,["829"] = 842,["830"] = 842,["832"] = 843,["833"] = 844,["834"] = 844,["836"] = 845,["837"] = 846,["838"] = 846,["840"] = 847,["841"] = 847,["843"] = 848,["844"] = 849,["847"] = 842,["850"] = 820,["851"] = 853,["852"] = 854,["853"] = 855,["854"] = 856,["855"] = 857,["858"] = 860,["859"] = 853,["860"] = 863,["861"] = 864,["862"] = 865,["865"] = 866,["866"] = 863,["867"] = 869,["868"] = 870,["869"] = 871,["872"] = 872,["875"] = 873,["878"] = 875,["879"] = 876,["882"] = 878,["883"] = 879,["886"] = 880,["889"] = 881,["890"] = 882,["893"] = 883,["899"] = 888,["900"] = 889,["903"] = 891,["904"] = 892,["907"] = 894,["908"] = 895,["909"] = 869,["910"] = 902,["911"] = 903,["913"] = 904,["914"] = 904,["916"] = 905,["917"] = 906,["918"] = 907,["919"] = 908,["920"] = 909,["925"] = 912,["926"] = 902,["927"] = 915,["928"] = 916,["929"] = 917,["931"] = 918,["932"] = 918,["934"] = 919,["935"] = 920,["936"] = 921,["941"] = 924,["942"] = 915,["943"] = 927,["944"] = 928,["946"] = 929,["947"] = 929,["949"] = 930,["950"] = 931,["951"] = 931,["953"] = 932,["954"] = 932,["956"] = 933,["957"] = 934,["958"] = 934,["960"] = 935,["963"] = 929,["966"] = 937,["967"] = 927,["968"] = 940,["969"] = 941,["970"] = 940,["971"] = 950,["972"] = 951,["973"] = 952,["974"] = 952,["975"] = 955,["976"] = 953,["977"] = 953,["978"] = 953,["979"] = 953,["981"] = 957,["983"] = 952,["984"] = 958,["985"] = 958,["986"] = 958,["987"] = 958,["988"] = 960,["989"] = 961,["990"] = 961,["991"] = 961,["992"] = 962,["994"] = 965,["995"] = 969,["996"] = 970,["997"] = 973,["998"] = 974,["999"] = 975,["1000"] = 976,["1001"] = 976,["1002"] = 977,["1003"] = 965,["1004"] = 968,["1005"] = 968,["1006"] = 968,["1007"] = 968,["1008"] = 968,["1009"] = 968,["1010"] = 968,["1011"] = 968,["1012"] = 968,["1013"] = 968,["1014"] = 968,["1015"] = 968,["1016"] = 965,["1017"] = 950,["1018"] = 985,["1019"] = 986,["1020"] = 987,["1022"] = 985});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local PLAYABLE_TEAMS = {
    2,
    3,
    6,
    7,
    8,
    9
}
local DUEL_BET_WINDOW_SECONDS = 8
local BOSS_DUEL_BET_TEAM = 1
local BOSS_DUEL_BET_BOSS = -2
____exports.DuelManager = __TS__Class()
local DuelManager = ____exports.DuelManager
DuelManager.name = "DuelManager"
function DuelManager.prototype.____constructor(self, eventBus, bossManager)
    self.eventBus = eventBus
    self.bossManager = bossManager
    self.spawnA = Vector(-500, 0, 128)
    self.spawnB = Vector(500, 0, 128)
    self.arenaCenter = Vector(0, 0, 128)
    self.started = false
    self.matchEnded = false
    self.roundIndex = 0
    self.nextDuelTime = EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
    self.active = false
    self.isTiebreaker = false
    self.betsOpen = false
    self.duelEndTime = 0
    self.betCloseTime = 0
    self.pendingPairs = {}
    self.activeDuelistEntIndexes = __TS__New(Set)
    self.snapshots = __TS__New(Map)
    self.applicants = __TS__New(Set)
    self.activeBets = __TS__New(Map)
    self.pausedEntIndexes = __TS__New(Set)
    self.tiebreakerWins = __TS__New(Map)
end
function DuelManager.prototype.init(self)
    self:discoverArenaLocations()
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:onEntityKilled(event) end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "evo_duel_apply",
        function(_, event)
            self:onDuelApply(event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "evo_duel_bet",
        function(_, event)
            self:onDuelBet(event)
        end
    )
    self.eventBus:on(
        "tiebreaker_requested",
        function(____, ____bindingPattern0)
            local tiedTeams
            tiedTeams = ____bindingPattern0.tiedTeams
            self:startTiebreaker(tiedTeams)
        end
    )
    self.eventBus:on(
        "match_ended",
        function()
            self.matchEnded = true
            self:releaseWorldPause()
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
            if command == "-evo_duel" then
                self:triggerDevDuel(playerId, args)
            end
        end
    )
    self:syncDuelState()
end
function DuelManager.prototype.isActiveDuelist(self, entity)
    return self.active and self.activeDuelistEntIndexes:has(entity:entindex())
end
function DuelManager.prototype.getArenaCenter(self)
    return self.arenaCenter
end
function DuelManager.prototype.discoverArenaLocations(self)
    local spawnAEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_SPAWN_A) or Entities:FindByName(nil, "duel_1_teleport_2")
    local spawnBEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_SPAWN_B) or Entities:FindByName(nil, "duel_1_teleport_3")
    local centerEnt = Entities:FindByName(nil, EVO_MAP_ENTITIES.DUEL_ARENA_CENTER) or Entities:FindByName(nil, "duel_1")
    if centerEnt and not centerEnt:IsNull() and IsValidEntity(centerEnt) then
        self.arenaCenter = centerEnt:GetAbsOrigin()
    end
    if spawnAEnt and not spawnAEnt:IsNull() and IsValidEntity(spawnAEnt) then
        self.spawnA = spawnAEnt:GetAbsOrigin()
    else
        self.spawnA = Vector(self.arenaCenter.x - 450, self.arenaCenter.y, self.arenaCenter.z)
    end
    if spawnBEnt and not spawnBEnt:IsNull() and IsValidEntity(spawnBEnt) then
        self.spawnB = spawnBEnt:GetAbsOrigin()
    else
        self.spawnB = Vector(self.arenaCenter.x + 450, self.arenaCenter.y, self.arenaCenter.z)
    end
end
function DuelManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and not self.started then
        self.started = true
        self.nextDuelTime = GameRules:GetDOTATime(false, false) + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
        self:syncDuelState()
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoDuelManagerThink",
            function() return self:onThink() end,
            1
        )
    end
end
function DuelManager.prototype.onThink(self)
    if self.matchEnded then
        return nil
    end
    local now = GameRules:GetDOTATime(false, false)
    if self.active then
        if self.betsOpen and now >= self.betCloseTime then
            self.betsOpen = false
        end
        if self.activeBossDuel then
            if self.activeBossDuel.lootEndTime ~= nil then
                if now >= self.activeBossDuel.lootEndTime then
                    self:finalizeBossDuel(true)
                else
                    self:syncDuelState()
                end
                return 1
            end
            if now >= self.duelEndTime then
                self:finalizeBossDuel(false)
            else
                self:syncDuelState()
            end
            return 1
        end
        if now >= self.duelEndTime then
            self:finishCurrentDuel(nil, nil)
        else
            self:syncDuelState()
        end
        return 1
    end
    if not self.isTiebreaker and self.roundIndex < EVO_CONSTANTS.DUEL_MAX_ROUNDS and now >= self.nextDuelTime then
        self.nextDuelTime = now + EVO_CONSTANTS.DUEL_INTERVAL_SECONDS
        self:startRegularDuelSeries()
    end
    return 1
end
function DuelManager.prototype.startRegularDuelSeries(self)
    local nextRound = self.roundIndex + 1
    if nextRound % EVO_CONSTANTS.BOSS_DUEL_EVERY_N_ROUNDS == 0 and self.bossManager:getStrongestAliveBoss() ~= nil then
        local team = self:pickWeightedBossDuelTeam()
        if team ~= nil and self:startBossArenaDuel(team) then
            self.applicants:clear()
            return
        end
    end
    local ____pairs = self:generateDuelPairs()
    if #____pairs == 0 then
        self:debugChat("[Evo] Duel skipped: not enough teams.")
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self.pendingPairs = ____pairs
    self.applicants:clear()
    self:beginNextPair()
end
function DuelManager.prototype.startBossArenaDuel(self, challengingTeam)
    local bossInfo = self.bossManager:getStrongestAliveBoss()
    if not bossInfo then
        return false
    end
    local challengers = self:getTeamPlayerIds(challengingTeam)
    if #challengers == 0 then
        return false
    end
    local bossReturnPos = self.bossManager:prepareBossForArena(bossInfo.bossId, self.spawnB, self.spawnA)
    if not bossReturnPos then
        return false
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self.active = true
    self.betsOpen = true
    self.currentPair = nil
    self.activeBets:clear()
    self.activeDuelistEntIndexes:clear()
    self.snapshots:clear()
    local now = GameRules:GetDOTATime(false, false)
    self.betCloseTime = now + DUEL_BET_WINDOW_SECONDS
    self.duelEndTime = now + EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS
    local perpDir = Vector(-(self.spawnB.y - self.spawnA.y), self.spawnB.x - self.spawnA.x, 0):Normalized()
    do
        local i = 0
        while i < #challengers do
            local offset = (i - (#challengers - 1) / 2) * 140
            local spawnPos = Vector(self.spawnA.x + perpDir.x * offset, self.spawnA.y + perpDir.y * offset, self.spawnA.z)
            self:prepareDuelist(challengers[i + 1], spawnPos, self.spawnB)
            i = i + 1
        end
    end
    self.activeDuelistEntIndexes:add(bossInfo.unit:entindex())
    self.activeBossDuel = {
        bossId = bossInfo.bossId,
        bossEntIndex = bossInfo.unit:entindex(),
        bossReturnPos = bossReturnPos,
        challengingTeam = challengingTeam,
        challengerIds = challengers
    }
    self:applyWorldPause()
    self.eventBus:emit("duel_started", {roundIndex = self.roundIndex, isTiebreaker = false})
    self:broadcastDuelEvent("started")
    self:syncDuelState()
    self:debugChat(((((((("[Evo] BOSS ARENA! Team " .. tostring(challengingTeam)) .. " vs ") .. bossInfo.bossId) .. " (Lv.") .. tostring(bossInfo.level)) .. ") — ") .. tostring(EVO_CONSTANTS.BOSS_DUEL_DURATION_SECONDS)) .. "s!")
    return true
end
function DuelManager.prototype.finalizeBossDuel(self, teamWon)
    if not self.active or not self.activeBossDuel then
        return
    end
    local bossDuel = self.activeBossDuel
    self.active = false
    self.betsOpen = false
    self.activeBossDuel = nil
    self.activeDuelistEntIndexes:clear()
    self:settleBossDuelBets(teamWon)
    for ____, pid in ipairs(bossDuel.challengerIds) do
        self:restoreDuelistAfterDuel(pid, teamWon)
    end
    self.snapshots:clear()
    self.bossManager:returnBossFromArena(bossDuel.bossId, bossDuel.bossReturnPos, not teamWon)
    self:releaseWorldPause()
    local leadWinner = teamWon and bossDuel.challengerIds[1] or nil
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = leadWinner, loserId = nil, isTiebreaker = false})
    self:broadcastDuelEvent("finished", leadWinner)
    self:syncDuelState()
    if teamWon then
        self:debugChat(((("[Evo] Team " .. tostring(bossDuel.challengingTeam)) .. " defeated ") .. bossDuel.bossId) .. " in the Boss Arena!")
    else
        self:debugChat(("[Evo] " .. bossDuel.bossId) .. " crushed the challengers and entered COURAGE mode!")
    end
end
function DuelManager.prototype.pickWeightedBossDuelTeam(self)
    local activeTeams = {}
    for ____, team in ipairs(PLAYABLE_TEAMS) do
        if #self:getTeamPlayerIds(team) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, team in ipairs(activeTeams) do
        local teamWeight = 1
        for ____, pid in ipairs(self:getTeamPlayerIds(team)) do
            if self.applicants:has(pid) then
                teamWeight = teamWeight + EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER
            end
        end
        weights[#weights + 1] = teamWeight
        totalWeight = totalWeight + teamWeight
    end
    local roll = RandomFloat(0, totalWeight)
    do
        local i = 0
        while i < #activeTeams do
            roll = roll - weights[i + 1]
            if roll <= 0 then
                return activeTeams[i + 1]
            end
            i = i + 1
        end
    end
    return activeTeams[#activeTeams]
end
function DuelManager.prototype.startTiebreaker(self, tiedTeams)
    if self.matchEnded or #tiedTeams < 2 then
        return
    end
    self.isTiebreaker = true
    self.tiebreakerTeams = {tiedTeams[1], tiedTeams[2]}
    self.tiebreakerWins:clear()
    self.tiebreakerWins:set(tiedTeams[1], 0)
    self.tiebreakerWins:set(tiedTeams[2], 0)
    self.pendingPairs = {}
    self:debugChat("[Evo] TIEBREAKER Bo3 started!")
    self:queueNextTiebreakerPair()
end
function DuelManager.prototype.queueNextTiebreakerPair(self)
    if not self.tiebreakerTeams then
        return
    end
    local teamA, teamB = unpack(self.tiebreakerTeams)
    local playerA = self:pickWeightedChampion(teamA)
    local playerB = self:pickWeightedChampion(teamB)
    if playerA == nil or playerB == nil then
        local fallbackWinner = playerA ~= nil and teamA or teamB
        self:finishTiebreaker(fallbackWinner)
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.pendingPairs = {{playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}}
    self:beginNextPair()
end
function DuelManager.prototype.triggerDevDuel(self, playerId, args)
    local sub = string.lower(args[1] or "")
    if sub == "boss" then
        if self.active then
            if self.activeBossDuel then
                self:finalizeBossDuel(false)
            else
                self:finishCurrentDuel(playerId, nil)
            end
            return
        end
        if self.bossManager:getStrongestAliveBoss() == nil then
            self.bossManager:spawnMatchBosses()
        end
        local team = PlayerResource:GetTeam(playerId)
        if not self:startBossArenaDuel(team) then
            self:debugChat("[Evo] Waiting for boss spawn — run -evo_duel boss again in 1s.")
        end
        return
    end
    if self.active then
        if self.activeBossDuel then
            self:finalizeBossDuel(false)
        else
            self:finishCurrentDuel(playerId, nil)
        end
        return
    end
    local ____pairs = self:generateDuelPairs()
    if #____pairs > 0 then
        self.roundIndex = self.roundIndex + 1
        self.isTiebreaker = false
        self.pendingPairs = ____pairs
        self:beginNextPair()
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    self.roundIndex = self.roundIndex + 1
    self.isTiebreaker = false
    self.currentPair = {
        playerA = playerId,
        playerB = -1,
        teamA = PlayerResource:GetTeam(playerId),
        teamB = 10
    }
    self.active = true
    self.betsOpen = false
    local now = GameRules:GetDOTATime(false, false)
    self.duelEndTime = now + EVO_CONSTANTS.DUEL_DURATION_SECONDS
    self.activeDuelistEntIndexes:clear()
    self.snapshots:clear()
    self:prepareDuelist(playerId, self.spawnA, self.spawnB)
    self.sparringDummy = CreateUnitByName(
        "npc_dota_hero_tidehunter",
        self.spawnB,
        true,
        nil,
        nil,
        10
    )
    if self.sparringDummy and not self.sparringDummy:IsNull() then
        self.activeDuelistEntIndexes:add(self.sparringDummy:entindex())
        if self.sparringDummy:IsHero() then
            while self.sparringDummy:GetLevel() < hero:GetLevel() do
                self.sparringDummy:HeroLevelUp(false)
            end
        end
        ExecuteOrderFromTable({
            UnitIndex = self.sparringDummy:entindex(),
            OrderType = 4,
            TargetIndex = hero:entindex(),
            Queue = false
        })
    end
    self:applyWorldPause()
    self:broadcastDuelEvent("started")
    self:syncDuelState()
    self:debugChat("[Evo] Dev solo duel started on arena!")
end
function DuelManager.prototype.generateDuelPairs(self)
    local activeTeams = {}
    for ____, team in ipairs(PLAYABLE_TEAMS) do
        if #self:getTeamPlayerIds(team) > 0 then
            activeTeams[#activeTeams + 1] = team
        end
    end
    if #activeTeams < 2 then
        return {}
    end
    local shuffled = {unpack(activeTeams)}
    do
        local i = #shuffled - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local tmp = shuffled[i + 1]
            shuffled[i + 1] = shuffled[j + 1]
            shuffled[j + 1] = tmp
            i = i - 1
        end
    end
    local teamPairs = {}
    if #shuffled == 2 then
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
    elseif #shuffled == 3 then
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
        teamPairs[#teamPairs + 1] = {shuffled[2], shuffled[3]}
        teamPairs[#teamPairs + 1] = {shuffled[3], shuffled[1]}
    else
        teamPairs[#teamPairs + 1] = {shuffled[1], shuffled[2]}
        teamPairs[#teamPairs + 1] = {shuffled[3], shuffled[4]}
    end
    local result = {}
    for ____, ____value in ipairs(teamPairs) do
        local teamA = ____value[1]
        local teamB = ____value[2]
        local playerA = self:pickWeightedChampion(teamA)
        local playerB = self:pickWeightedChampion(teamB)
        if playerA ~= nil and playerB ~= nil then
            result[#result + 1] = {playerA = playerA, playerB = playerB, teamA = teamA, teamB = teamB}
        end
    end
    return result
end
function DuelManager.prototype.pickWeightedChampion(self, team)
    local candidates = self:getTeamPlayerIds(team)
    if #candidates == 0 then
        return nil
    end
    local totalWeight = 0
    local weights = {}
    for ____, pid in ipairs(candidates) do
        local w = self.applicants:has(pid) and EVO_CONSTANTS.DUEL_APPLY_WEIGHT_MULTIPLIER or 1
        weights[#weights + 1] = w
        totalWeight = totalWeight + w
    end
    local roll = RandomFloat(0, totalWeight)
    do
        local i = 0
        while i < #candidates do
            roll = roll - weights[i + 1]
            if roll <= 0 then
                return candidates[i + 1]
            end
            i = i + 1
        end
    end
    return candidates[#candidates]
end
function DuelManager.prototype.beginNextPair(self)
    local nextPair = table.remove(self.pendingPairs, 1)
    if not nextPair then
        self.active = false
        self.currentPair = nil
        self:releaseWorldPause()
        self:syncDuelState()
        return
    end
    self.currentPair = nextPair
    self.active = true
    self.betsOpen = true
    self.activeBets:clear()
    self.activeDuelistEntIndexes:clear()
    self.snapshots:clear()
    local now = GameRules:GetDOTATime(false, false)
    self.betCloseTime = now + DUEL_BET_WINDOW_SECONDS
    self.duelEndTime = now + EVO_CONSTANTS.DUEL_DURATION_SECONDS
    self:prepareDuelist(nextPair.playerA, self.spawnA, self.spawnB)
    self:prepareDuelist(nextPair.playerB, self.spawnB, self.spawnA)
    self:applyWorldPause()
    self.eventBus:emit("duel_started", {roundIndex = self.roundIndex, isTiebreaker = self.isTiebreaker})
    self:broadcastDuelEvent("started")
    self:syncDuelState()
    self:debugChat(((("[Evo] Duel Round #" .. tostring(self.roundIndex)) .. " started! (") .. tostring(EVO_CONSTANTS.DUEL_DURATION_SECONDS)) .. "s)")
end
function DuelManager.prototype.prepareDuelist(self, playerId, spawnPos, lookTarget)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    local peaceMod = hero:FindModifierByName("modifier_evo_peace_time")
    local peaceRemaining = peaceMod and math.max(
        0,
        peaceMod:GetRemainingTime()
    ) or 0
    local abilityCooldowns = __TS__New(Map)
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not ability or ability:IsNull() then
                    goto __continue106
                end
                local cd = ability:GetCooldownTimeRemaining()
                if cd > 0 then
                    abilityCooldowns:set(
                        ability:GetAbilityName(),
                        cd
                    )
                end
            end
            ::__continue106::
            i = i + 1
        end
    end
    local itemCooldowns = __TS__New(Map)
    do
        local slot = 0
        while slot < 9 do
            do
                local item = hero:GetItemInSlot(slot)
                if not item or item:IsNull() then
                    goto __continue109
                end
                local cd = item:GetCooldownTimeRemaining()
                if cd > 0 then
                    itemCooldowns:set(slot, cd)
                end
            end
            ::__continue109::
            slot = slot + 1
        end
    end
    self.snapshots:set(
        playerId,
        {
            position = hero:GetAbsOrigin(),
            health = hero:GetHealth(),
            mana = hero:GetMana(),
            wasAlive = hero:IsAlive(),
            abilityCooldowns = abilityCooldowns,
            itemCooldowns = itemCooldowns,
            peaceTimeRemaining = peaceRemaining
        }
    )
    if not hero:IsAlive() then
        hero:RespawnHero(false, false)
    end
    hero:RemoveModifierByName("modifier_evo_peace_time")
    hero:RemoveModifierByName("modifier_evo_world_pause")
    hero:Purge(
        false,
        true,
        false,
        true,
        true
    )
    hero:SetHealth(hero:GetMaxHealth())
    hero:SetMana(hero:GetMaxMana())
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            local ability = hero:GetAbilityByIndex(i)
            if ability and not ability:IsNull() then
                ability:EndCooldown()
            end
            i = i + 1
        end
    end
    do
        local slot = 0
        while slot < 9 do
            local item = hero:GetItemInSlot(slot)
            if item and not item:IsNull() then
                item:EndCooldown()
            end
            slot = slot + 1
        end
    end
    FindClearSpaceForUnit(hero, spawnPos, true)
    hero:Stop()
    local dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0):Normalized()
    hero:SetForwardVector(dir)
    self.activeDuelistEntIndexes:add(hero:entindex())
end
function DuelManager.prototype.onEntityKilled(self, event)
    if not self.active then
        return
    end
    local killedIndex = event.entindex_killed
    if not self.activeDuelistEntIndexes:has(killedIndex) then
        return
    end
    local victim = EntIndexToHScript(killedIndex)
    if not victim or victim:IsNull() or not IsValidEntity(victim) or not victim:IsBaseNPC() then
        return
    end
    if victim:IsReincarnating() then
        return
    end
    if self.activeBossDuel then
        if killedIndex == self.activeBossDuel.bossEntIndex then
            local now = GameRules:GetDOTATime(false, false)
            self.activeBossDuel.lootEndTime = now + EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS
            self:debugChat(("[Evo] Boss slain! Grab the Boss Core (" .. tostring(EVO_CONSTANTS.BOSS_DUEL_LOOT_WINDOW_SECONDS)) .. "s)...")
            return
        end
        local anyChallengerAlive = __TS__ArraySome(
            self.activeBossDuel.challengerIds,
            function(____, pid)
                local h = PlayerResource:GetSelectedHeroEntity(pid)
                return h ~= nil and not h:IsNull() and IsValidEntity(h) and (h:IsAlive() or h:IsReincarnating())
            end
        )
        if not anyChallengerAlive then
            self:finalizeBossDuel(false)
        end
        return
    end
    if not self.currentPair then
        return
    end
    if self.sparringDummy and not self.sparringDummy:IsNull() and killedIndex == self.sparringDummy:entindex() then
        self:finishCurrentDuel(self.currentPair.playerA, nil)
        return
    end
    local victimPlayerId = victim:GetPlayerOwnerID()
    if victimPlayerId == self.currentPair.playerA then
        self:finishCurrentDuel(self.currentPair.playerB, self.currentPair.playerA)
    elseif victimPlayerId == self.currentPair.playerB then
        self:finishCurrentDuel(self.currentPair.playerA, self.currentPair.playerB)
    end
end
function DuelManager.prototype.finishCurrentDuel(self, winnerId, loserId)
    if not self.active then
        return
    end
    local pair = self.currentPair
    self.active = false
    self.betsOpen = false
    self.currentPair = nil
    self.activeDuelistEntIndexes:clear()
    if self.sparringDummy and not self.sparringDummy:IsNull() and IsValidEntity(self.sparringDummy) then
        UTIL_Remove(self.sparringDummy)
    end
    self.sparringDummy = nil
    self:settleBets(winnerId)
    if pair then
        self:restoreDuelistAfterDuel(pair.playerA, winnerId == pair.playerA)
        self:restoreDuelistAfterDuel(pair.playerB, winnerId == pair.playerB)
    end
    self.snapshots:clear()
    local validWinner = winnerId ~= nil and PlayerResource:IsValidPlayerID(winnerId) and winnerId or nil
    local validLoser = loserId ~= nil and PlayerResource:IsValidPlayerID(loserId) and loserId or nil
    self.eventBus:emit("duel_finished", {roundIndex = self.roundIndex, winnerId = validWinner, loserId = validLoser, isTiebreaker = self.isTiebreaker})
    self:broadcastDuelEvent("finished", validWinner)
    if validWinner ~= nil then
        local winnerName = PlayerResource:GetPlayerName(validWinner)
        self:debugChat(("[Evo] Duel winner: " .. (winnerName or "Player " .. tostring(validWinner + 1))) .. "!")
    else
        self:debugChat("[Evo] Duel ended in a draw!")
    end
    if self.isTiebreaker and self.tiebreakerTeams then
        if validWinner ~= nil then
            local winTeam = PlayerResource:GetTeam(validWinner)
            local newWins = (self.tiebreakerWins:get(winTeam) or 0) + 1
            self.tiebreakerWins:set(winTeam, newWins)
            if newWins >= 2 then
                self:finishTiebreaker(winTeam)
                return
            end
        end
        self:queueNextTiebreakerPair()
        return
    end
    if #self.pendingPairs > 0 then
        self:beginNextPair()
    else
        self:releaseWorldPause()
        self:syncDuelState()
    end
end
function DuelManager.prototype.finishTiebreaker(self, winnerTeam)
    self.isTiebreaker = false
    self.tiebreakerTeams = nil
    self:releaseWorldPause()
    self:syncDuelState()
    self.eventBus:emit("match_ended", {winnerTeam = winnerTeam, reason = "tiebreaker"})
    GameRules:SetGameWinner(winnerTeam)
end
function DuelManager.prototype.restoreDuelistAfterDuel(self, playerId, isWinner)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local snapshot = self.snapshots:get(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not snapshot then
        return
    end
    if not hero:IsAlive() then
        hero:RespawnHero(false, false)
    end
    FindClearSpaceForUnit(hero, snapshot.position, true)
    hero:Stop()
    if isWinner then
        hero:Purge(
            false,
            true,
            false,
            true,
            true
        )
        hero:SetHealth(math.max(
            1,
            math.min(
                hero:GetMaxHealth(),
                snapshot.health
            )
        ))
        hero:SetMana(math.max(
            0,
            math.min(
                hero:GetMaxMana(),
                snapshot.mana
            )
        ))
        do
            local i = 0
            while i < hero:GetAbilityCount() do
                do
                    local ability = hero:GetAbilityByIndex(i)
                    if not ability or ability:IsNull() then
                        goto __continue147
                    end
                    ability:EndCooldown()
                    local savedCd = snapshot.abilityCooldowns:get(ability:GetAbilityName())
                    if savedCd ~= nil and savedCd > 0 then
                        ability:StartCooldown(savedCd)
                    end
                end
                ::__continue147::
                i = i + 1
            end
        end
        do
            local slot = 0
            while slot < 9 do
                do
                    local item = hero:GetItemInSlot(slot)
                    if not item or item:IsNull() then
                        goto __continue150
                    end
                    item:EndCooldown()
                    local savedCd = snapshot.itemCooldowns:get(slot)
                    if savedCd ~= nil and savedCd > 0 then
                        item:StartCooldown(savedCd)
                    end
                end
                ::__continue150::
                slot = slot + 1
            end
        end
    end
    if snapshot.peaceTimeRemaining > 0 then
        hero:AddNewModifier(hero, nil, "modifier_evo_peace_time", {duration = snapshot.peaceTimeRemaining})
    end
end
function DuelManager.prototype.applyWorldPause(self)
    self:releaseWorldPause()
    local allUnits = FindUnitsInRadius(
        2,
        Vector(0, 0, 0),
        nil,
        FIND_UNITS_EVERYWHERE,
        3,
        bit.bor(1, 18),
        bit.bor(64, 16),
        0,
        false
    )
    for ____, unit in ipairs(allUnits) do
        do
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
                goto __continue155
            end
            if self.activeDuelistEntIndexes:has(unit:entindex()) then
                goto __continue155
            end
            unit:AddNewModifier(unit, nil, "modifier_evo_world_pause", {})
            self.pausedEntIndexes:add(unit:entindex())
        end
        ::__continue155::
    end
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue159
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
                    goto __continue159
                end
                if self.activeDuelistEntIndexes:has(hero:entindex()) then
                    goto __continue159
                end
                hero:AddNewModifier(hero, nil, "modifier_evo_world_pause", {})
                self.pausedEntIndexes:add(hero:entindex())
            end
            ::__continue159::
            i = i + 1
        end
    end
end
function DuelManager.prototype.releaseWorldPause(self)
    for ____, entIndex in __TS__Iterator(self.pausedEntIndexes) do
        local ent = EntIndexToHScript(entIndex)
        if ent and not ent:IsNull() and IsValidEntity(ent) and ent:IsBaseNPC() then
            ent:RemoveModifierByName("modifier_evo_world_pause")
        end
    end
    self.pausedEntIndexes:clear()
end
function DuelManager.prototype.onDuelApply(self, event)
    local playerId = event.PlayerID
    if self.matchEnded or not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    self.applicants:add(playerId)
end
function DuelManager.prototype.onDuelBet(self, event)
    local bettorId = event.PlayerID
    if not self.active or not self.betsOpen then
        return
    end
    if not PlayerResource:IsValidPlayerID(bettorId) then
        return
    end
    if self.activeBets:has(bettorId) then
        return
    end
    local backedTarget = tonumber(event.backed_player_id)
    if backedTarget == nil then
        return
    end
    if self.activeBossDuel then
        if PlayerResource:GetTeam(bettorId) == self.activeBossDuel.challengingTeam then
            return
        end
        if backedTarget ~= BOSS_DUEL_BET_TEAM and backedTarget ~= BOSS_DUEL_BET_BOSS then
            return
        end
    elseif self.currentPair then
        if bettorId == self.currentPair.playerA or bettorId == self.currentPair.playerB then
            return
        end
        if backedTarget ~= self.currentPair.playerA and backedTarget ~= self.currentPair.playerB then
            return
        end
    else
        return
    end
    local amount = math.floor(tonumber(event.gold_amount) or 0)
    if amount < 10 then
        return
    end
    local currentGold = PlayerResource:GetGold(bettorId)
    if currentGold < amount then
        return
    end
    PlayerResource:SpendGold(bettorId, amount, 0)
    self.activeBets:set(bettorId, {bettorId = bettorId, backedTarget = backedTarget, goldAmount = amount})
end
function DuelManager.prototype.settleBets(self, winnerId)
    for ____, bet in __TS__Iterator(self.activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue184
            end
            if winnerId == nil then
                PlayerResource:ModifyGold(bet.bettorId, bet.goldAmount, false, 0)
            elseif bet.backedTarget == winnerId then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue184::
    end
    self.activeBets:clear()
end
function DuelManager.prototype.settleBossDuelBets(self, teamWon)
    local winningSide = teamWon and BOSS_DUEL_BET_TEAM or BOSS_DUEL_BET_BOSS
    for ____, bet in __TS__Iterator(self.activeBets:values()) do
        do
            if not PlayerResource:IsValidPlayerID(bet.bettorId) then
                goto __continue190
            end
            if bet.backedTarget == winningSide then
                local payout = math.floor(bet.goldAmount * EVO_CONSTANTS.DUEL_BET_PAYOUT_MULTIPLIER)
                PlayerResource:ModifyGold(bet.bettorId, payout, false, 0)
            end
        end
        ::__continue190::
    end
    self.activeBets:clear()
end
function DuelManager.prototype.getTeamPlayerIds(self, team)
    local result = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue195
                end
                if PlayerResource:GetTeam(pid) ~= team then
                    goto __continue195
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                if not hero or hero:IsNull() or not IsValidEntity(hero) then
                    goto __continue195
                end
                result[#result + 1] = pid
            end
            ::__continue195::
            i = i + 1
        end
    end
    return result
end
function DuelManager.prototype.broadcastDuelEvent(self, eventName, winnerId)
    CustomGameEventManager:Send_ServerToAllClients("evo_duel_event", {event = eventName, winner_id = winnerId})
end
function DuelManager.prototype.syncDuelState(self)
    local now = GameRules:GetDOTATime(false, false)
    local ____table_active_2
    if self.active then
        local ____opt_0 = self.activeBossDuel
        ____table_active_2 = math.max(
            0,
            math.ceil((____opt_0 and ____opt_0.lootEndTime or self.duelEndTime) - now)
        )
    else
        ____table_active_2 = 0
    end
    local remaining = ____table_active_2
    local nextIn = not self.active and math.max(
        0,
        math.ceil(self.nextDuelTime - now)
    ) or 0
    local tiebreakerPayload = {}
    for ____, ____value in __TS__Iterator(self.tiebreakerWins:entries()) do
        local team = ____value[1]
        local wins = ____value[2]
        tiebreakerPayload[tostring(team)] = wins
    end
    local ____CustomNetTables_SetTableValue_13 = CustomNetTables.SetTableValue
    local ____self_active_7 = self.active
    local ____self_roundIndex_8 = self.roundIndex
    local ____self_betsOpen_9 = self.betsOpen
    local ____self_isTiebreaker_10 = self.isTiebreaker
    local ____temp_11 = self.activeBossDuel ~= nil
    local ____opt_3 = self.activeBossDuel
    local ____temp_12 = ____opt_3 and ____opt_3.bossId or ""
    local ____opt_5 = self.activeBossDuel
    ____CustomNetTables_SetTableValue_13(CustomNetTables, "duel_state", "state", {
        active = ____self_active_7,
        round_index = ____self_roundIndex_8,
        time_remaining = remaining,
        next_duel_in = nextIn,
        bets_open = ____self_betsOpen_9,
        is_tiebreaker = ____self_isTiebreaker_10,
        is_boss_duel = ____temp_11,
        boss_id = ____temp_12,
        challenging_team = ____opt_5 and ____opt_5.challengingTeam or -1,
        player_a = self.currentPair and self.currentPair.playerA or -1,
        player_b = self.currentPair and self.currentPair.playerB or -1,
        tiebreaker_scores = tiebreakerPayload
    })
end
function DuelManager.prototype.debugChat(self, message)
    if IsInToolsMode() then
        GameRules:SendCustomMessage(message, 0, 0)
    end
end
return ____exports
