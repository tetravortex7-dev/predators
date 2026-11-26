local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 8,["15"] = 9,["16"] = 12,["17"] = 19,["20"] = 20,["21"] = 21,["24"] = 23,["25"] = 24,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 26,["31"] = 27,["32"] = 27,["34"] = 28,["35"] = 29,["36"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["47"] = 27,["50"] = 36,["52"] = 37,["53"] = 37,["55"] = 38,["56"] = 39,["57"] = 39,["59"] = 40,["60"] = 41,["61"] = 42,["65"] = 37,["68"] = 46,["69"] = 46,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 46,["79"] = 46,["80"] = 56,["81"] = 57,["83"] = 60,["84"] = 61,["85"] = 62,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 62,["91"] = 62,["92"] = 63,["93"] = 64,["95"] = 66,["96"] = 66,["97"] = 67,["98"] = 68,["99"] = 69,["101"] = 66,["105"] = 72,["106"] = 72,["107"] = 73,["108"] = 74,["109"] = 75,["111"] = 72,["114"] = 79,["115"] = 80,["116"] = 81,["117"] = 82,["118"] = 83,["119"] = 84,["120"] = 86,["121"] = 87,["122"] = 12,["123"] = 90,["124"] = 95,["127"] = 96,["128"] = 97,["129"] = 98,["132"] = 100,["133"] = 101,["134"] = 102,["136"] = 105,["137"] = 106,["138"] = 107,["139"] = 109,["140"] = 110,["141"] = 110,["142"] = 110,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 110,["147"] = 111,["148"] = 111,["149"] = 111,["150"] = 111,["151"] = 111,["152"] = 111,["153"] = 111,["154"] = 112,["155"] = 112,["156"] = 112,["157"] = 112,["158"] = 112,["159"] = 112,["160"] = 112,["162"] = 114,["163"] = 114,["165"] = 115,["166"] = 116,["167"] = 116,["169"] = 117,["170"] = 118,["171"] = 119,["172"] = 120,["176"] = 114,["180"] = 124,["181"] = 124,["183"] = 125,["184"] = 126,["185"] = 126,["187"] = 127,["188"] = 128,["189"] = 129,["190"] = 130,["194"] = 124,["198"] = 135,["199"] = 136,["201"] = 90,["202"] = 142,["203"] = 143,["204"] = 142,["205"] = 152,["206"] = 153,["208"] = 154,["209"] = 154,["211"] = 155,["212"] = 156,["213"] = 156,["215"] = 157,["216"] = 158,["220"] = 152,["221"] = 166,["222"] = 179,["223"] = 180,["224"] = 180,["225"] = 183,["226"] = 181,["227"] = 181,["228"] = 181,["229"] = 181,["231"] = 185,["233"] = 180,["234"] = 186,["235"] = 186,["236"] = 186,["237"] = 186,["238"] = 188,["239"] = 189,["240"] = 189,["241"] = 189,["242"] = 190,["244"] = 193,["246"] = 194,["247"] = 194,["249"] = 195,["250"] = 196,["251"] = 196,["253"] = 197,["254"] = 197,["255"] = 197,["256"] = 197,["259"] = 194,["262"] = 203,["263"] = 207,["264"] = 208,["265"] = 211,["266"] = 212,["267"] = 213,["268"] = 214,["269"] = 214,["270"] = 215,["271"] = 203,["272"] = 206,["273"] = 206,["274"] = 206,["275"] = 206,["276"] = 206,["277"] = 206,["278"] = 206,["279"] = 206,["280"] = 206,["281"] = 206,["282"] = 206,["283"] = 206,["284"] = 206,["285"] = 203,["286"] = 166,["287"] = 224,["288"] = 234,["289"] = 237,["290"] = 237,["291"] = 237,["292"] = 237,["293"] = 237,["294"] = 237,["295"] = 237,["296"] = 237,["297"] = 234,["298"] = 224,["299"] = 250,["300"] = 261,["301"] = 265,["302"] = 269,["303"] = 270,["304"] = 271,["305"] = 272,["308"] = 276,["309"] = 277,["310"] = 278,["311"] = 279,["312"] = 280,["313"] = 280,["314"] = 280,["315"] = 280,["316"] = 281,["317"] = 282,["318"] = 282,["319"] = 282,["320"] = 282,["322"] = 284,["323"] = 285,["324"] = 286,["325"] = 287,["326"] = 288,["327"] = 289,["328"] = 290,["329"] = 290,["330"] = 290,["331"] = 290,["332"] = 290,["333"] = 290,["334"] = 290,["337"] = 293,["338"] = 293,["339"] = 293,["340"] = 293,["341"] = 293,["342"] = 293,["343"] = 293,["344"] = 293,["345"] = 293,["346"] = 293,["348"] = 305,["349"] = 250,["350"] = 308,["351"] = 321,["352"] = 322,["354"] = 324,["355"] = 325,["356"] = 326,["357"] = 327,["359"] = 329,["360"] = 331,["361"] = 331,["362"] = 331,["363"] = 331,["364"] = 331,["365"] = 331,["366"] = 331,["367"] = 331,["368"] = 331,["369"] = 331,["370"] = 331,["371"] = 342,["372"] = 344,["373"] = 345,["374"] = 346,["375"] = 346,["376"] = 346,["377"] = 346,["379"] = 348,["381"] = 350,["382"] = 308});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____unit_helpers = require("lib.unit_helpers")
local focusPlayerCamera = ____unit_helpers.focusPlayerCamera
local ____duel_types = require("systems.duel.duel_types")
local debugDuelChat = ____duel_types.debugDuelChat
local settleBets = ____duel_types.settleBets
function ____exports.prepareDuelistSnapshot(self, playerId, spawnPos, lookTarget, snapshots, activeDuelistEntIndexes)
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
                    goto __continue5
                end
                local cd = ability:GetCooldownTimeRemaining()
                if cd > 0 then
                    abilityCooldowns:set(
                        ability:GetAbilityName(),
                        cd
                    )
                end
            end
            ::__continue5::
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
                    goto __continue8
                end
                local cd = item:GetCooldownTimeRemaining()
                if cd > 0 then
                    itemCooldowns:set(slot, cd)
                end
            end
            ::__continue8::
            slot = slot + 1
        end
    end
    snapshots:set(
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
    hero:RemoveModifierByName("modifier_fountain_buff_lua")
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
    hero:RemoveModifierByName("modifier_fountain_buff_lua")
    hero:Stop()
    local dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0):Normalized()
    hero:SetForwardVector(dir)
    focusPlayerCamera(nil, playerId, hero, spawnPos)
    activeDuelistEntIndexes:add(hero:entindex())
    hero:RemoveModifierByName("modifier_fountain_buff_lua")
end
function ____exports.restoreDuelistAfterDuel(self, playerId, isWinner, snapshots)
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local snapshot = snapshots:get(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not snapshot then
        return
    end
    local survivedDuel = hero:IsAlive()
    if not survivedDuel then
        hero:RespawnHero(false, false)
    end
    FindClearSpaceForUnit(hero, snapshot.position, true)
    hero:Stop()
    focusPlayerCamera(nil, playerId, hero, snapshot.position)
    if isWinner or survivedDuel then
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
                        goto __continue21
                    end
                    ability:EndCooldown()
                    local savedCd = snapshot.abilityCooldowns:get(ability:GetAbilityName())
                    if savedCd ~= nil and savedCd > 0 then
                        ability:StartCooldown(savedCd)
                    end
                end
                ::__continue21::
                i = i + 1
            end
        end
        do
            local slot = 0
            while slot < 9 do
                do
                    local item = hero:GetItemInSlot(slot)
                    if not item or item:IsNull() then
                        goto __continue24
                    end
                    item:EndCooldown()
                    local savedCd = snapshot.itemCooldowns:get(slot)
                    if savedCd ~= nil and savedCd > 0 then
                        item:StartCooldown(savedCd)
                    end
                end
                ::__continue24::
                slot = slot + 1
            end
        end
    end
    if snapshot.peaceTimeRemaining > 0 then
        hero:AddNewModifier(hero, nil, "modifier_evo_peace_time", {duration = snapshot.peaceTimeRemaining})
    end
end
function ____exports.broadcastDuelEvent(self, eventName, winnerId)
    CustomGameEventManager:Send_ServerToAllClients("evo_duel_event", {event = eventName, winner_id = winnerId})
end
function ____exports.notifyPreDuelCountdown(self, pair, secondsLeft)
    for ____, pid in ipairs({pair.playerA, pair.playerB}) do
        do
            if not PlayerResource:IsValidPlayerID(pid) then
                goto __continue30
            end
            local player = PlayerResource:GetPlayer(pid)
            if not player or player:IsNull() then
                goto __continue30
            end
            EmitSoundOnClient("General.Ping", player)
            CustomGameEventManager:Send_ServerToPlayer(player, "evo_duel_countdown_tick", {seconds_left = secondsLeft})
        end
        ::__continue30::
    end
end
function ____exports.syncDuelNetState(self, params)
    local now = GameRules:GetDOTATime(false, false)
    local ____params_active_2
    if params.active then
        local ____opt_0 = params.activeBossDuel
        ____params_active_2 = math.max(
            0,
            math.ceil((____opt_0 and ____opt_0.lootEndTime or params.duelEndTime) - now)
        )
    else
        ____params_active_2 = 0
    end
    local remaining = ____params_active_2
    local nextIn = not params.active and math.max(
        0,
        math.ceil(params.nextDuelTime - now)
    ) or 0
    local tiebreakerPayload = {}
    for ____, ____value in __TS__Iterator(params.tiebreakerWins:entries()) do
        local team = ____value[1]
        local wins = ____value[2]
        tiebreakerPayload[tostring(team)] = wins
    end
    local playerRecords = {}
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue37
                end
                playerRecords[tostring(pid)] = {
                    wins = params.duelWins:get(pid) or 0,
                    losses = params.duelLosses:get(pid) or 0
                }
            end
            ::__continue37::
            i = i + 1
        end
    end
    local ____CustomNetTables_SetTableValue_13 = CustomNetTables.SetTableValue
    local ____params_active_7 = params.active
    local ____params_roundIndex_8 = params.roundIndex
    local ____params_betsOpen_9 = params.betsOpen
    local ____params_isTiebreaker_10 = params.isTiebreaker
    local ____temp_11 = params.activeBossDuel ~= nil
    local ____opt_3 = params.activeBossDuel
    local ____temp_12 = ____opt_3 and ____opt_3.bossId or ""
    local ____opt_5 = params.activeBossDuel
    ____CustomNetTables_SetTableValue_13(CustomNetTables, "duel_state", "state", {
        active = ____params_active_7,
        round_index = ____params_roundIndex_8,
        time_remaining = remaining,
        next_duel_in = nextIn,
        bets_open = ____params_betsOpen_9,
        is_tiebreaker = ____params_isTiebreaker_10,
        is_boss_duel = ____temp_11,
        boss_id = ____temp_12,
        challenging_team = ____opt_5 and ____opt_5.challengingTeam or -1,
        player_a = params.currentPair and params.currentPair.playerA or -1,
        player_b = params.currentPair and params.currentPair.playerB or -1,
        tiebreaker_scores = tiebreakerPayload,
        player_records = playerRecords
    })
end
function ____exports.syncDuelResultNetState(self, params)
    CustomNetTables:SetTableValue("duel_state", "last_result", {
        round_index = params.roundIndex,
        winner_id = params.winnerId or -1,
        is_draw = params.isDraw,
        reason = params.reason,
        score_reward = params.scoreReward,
        gold_reward = params.goldReward,
        bet_payout = params.betPayout,
        expires_at = params.expiresAt
    })
end
function ____exports.resolveAndRecordPvpOutcome(self, params)
    local validWinner = params.winnerId ~= nil and PlayerResource:IsValidPlayerID(params.winnerId) and params.winnerId or nil
    local validLoser = params.loserId ~= nil and PlayerResource:IsValidPlayerID(params.loserId) and params.loserId or nil
    if validLoser == nil and validWinner ~= nil and params.pair then
        local candidate = params.pair.playerA == validWinner and params.pair.playerB or params.pair.playerA
        if candidate >= 0 and PlayerResource:IsValidPlayerID(candidate) then
            validLoser = candidate
        end
    end
    if not params.isTiebreaker then
        local now = GameRules:GetDOTATime(false, false)
        local goldReward = 0
        if validWinner ~= nil then
            params.duelWins:set(
                validWinner,
                (params.duelWins:get(validWinner) or 0) + 1
            )
            if validLoser ~= nil and validLoser ~= validWinner then
                params.duelLosses:set(
                    validLoser,
                    (params.duelLosses:get(validLoser) or 0) + 1
                )
            end
            local elapsedMinutes = math.floor(now / 60)
            goldReward = EVO_CONSTANTS.DUEL_WIN_BASE_GOLD + elapsedMinutes * 15
            local xpReward = EVO_CONSTANTS.DUEL_WIN_BASE_XP + elapsedMinutes * 20
            PlayerResource:ModifyGold(validWinner, goldReward, true, 12)
            local winnerHero = PlayerResource:GetSelectedHeroEntity(validWinner)
            if winnerHero and not winnerHero:IsNull() and IsValidEntity(winnerHero) then
                winnerHero:AddExperience(
                    xpReward,
                    1,
                    false,
                    true,
                    0
                )
            end
        end
        ____exports.syncDuelResultNetState(nil, {
            roundIndex = params.roundIndex,
            winnerId = validWinner,
            isDraw = validWinner == nil,
            reason = validWinner == nil and "draw" or params.reason,
            scoreReward = validWinner ~= nil and EVO_CONSTANTS.SCORE_DUEL_WIN or 0,
            goldReward = goldReward,
            betPayout = params.totalBetPayout,
            expiresAt = now + EVO_CONSTANTS.DUEL_RESULT_BANNER_SECONDS
        })
    end
    return {validWinner = validWinner, validLoser = validLoser}
end
function ____exports.finalizePvpDuelOutcome(self, params)
    if params.sparringDummy and not params.sparringDummy:IsNull() and IsValidEntity(params.sparringDummy) then
        UTIL_Remove(params.sparringDummy)
    end
    local totalBetPayout = settleBets(nil, params.activeBets, params.winnerId)
    if params.pair then
        ____exports.restoreDuelistAfterDuel(nil, params.pair.playerA, params.winnerId == params.pair.playerA, params.snapshots)
        ____exports.restoreDuelistAfterDuel(nil, params.pair.playerB, params.winnerId == params.pair.playerB, params.snapshots)
    end
    params.snapshots:clear()
    local outcome = ____exports.resolveAndRecordPvpOutcome(nil, {
        winnerId = params.winnerId,
        loserId = params.loserId,
        pair = params.pair,
        isTiebreaker = params.isTiebreaker,
        roundIndex = params.roundIndex,
        reason = params.reason,
        totalBetPayout = totalBetPayout,
        duelWins = params.duelWins,
        duelLosses = params.duelLosses
    })
    ____exports.broadcastDuelEvent(nil, "finished", outcome.validWinner)
    if outcome.validWinner ~= nil then
        local winnerName = PlayerResource:GetPlayerName(outcome.validWinner)
        debugDuelChat(
            nil,
            ("[Evo] Duel winner: " .. (winnerName or "Player " .. tostring(outcome.validWinner + 1))) .. "!"
        )
    else
        debugDuelChat(nil, "[Evo] Duel ended in a draw!")
    end
    return outcome
end
return ____exports
