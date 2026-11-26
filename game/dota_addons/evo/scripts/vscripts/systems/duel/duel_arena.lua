local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 5,["14"] = 12,["17"] = 13,["18"] = 14,["21"] = 16,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 19,["28"] = 20,["29"] = 20,["31"] = 21,["32"] = 22,["33"] = 22,["35"] = 23,["36"] = 24,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["44"] = 20,["47"] = 29,["49"] = 30,["50"] = 30,["52"] = 31,["53"] = 32,["54"] = 32,["56"] = 33,["57"] = 34,["58"] = 35,["62"] = 30,["65"] = 39,["66"] = 39,["67"] = 39,["68"] = 39,["69"] = 39,["70"] = 39,["71"] = 39,["72"] = 39,["73"] = 39,["74"] = 39,["75"] = 39,["76"] = 39,["77"] = 49,["78"] = 50,["80"] = 53,["81"] = 54,["82"] = 55,["83"] = 55,["84"] = 55,["85"] = 55,["86"] = 55,["87"] = 55,["88"] = 55,["89"] = 56,["90"] = 57,["92"] = 59,["93"] = 59,["94"] = 60,["95"] = 61,["96"] = 62,["98"] = 59,["102"] = 65,["103"] = 65,["104"] = 66,["105"] = 67,["106"] = 68,["108"] = 65,["111"] = 72,["112"] = 73,["113"] = 74,["114"] = 75,["115"] = 76,["116"] = 77,["117"] = 79,["118"] = 80,["119"] = 5,["120"] = 83,["121"] = 88,["124"] = 89,["125"] = 90,["126"] = 91,["129"] = 93,["130"] = 94,["131"] = 95,["133"] = 98,["134"] = 99,["135"] = 100,["136"] = 102,["137"] = 103,["138"] = 103,["139"] = 103,["140"] = 103,["141"] = 103,["142"] = 103,["143"] = 103,["144"] = 104,["145"] = 104,["146"] = 104,["147"] = 104,["148"] = 104,["149"] = 104,["150"] = 104,["151"] = 105,["152"] = 105,["153"] = 105,["154"] = 105,["155"] = 105,["156"] = 105,["157"] = 105,["159"] = 107,["160"] = 107,["162"] = 108,["163"] = 109,["164"] = 109,["166"] = 110,["167"] = 111,["168"] = 112,["169"] = 113,["173"] = 107,["177"] = 117,["178"] = 117,["180"] = 118,["181"] = 119,["182"] = 119,["184"] = 120,["185"] = 121,["186"] = 122,["187"] = 123,["191"] = 117,["195"] = 128,["196"] = 129,["198"] = 83,["199"] = 135,["200"] = 136,["201"] = 135,["202"] = 145,["203"] = 146,["205"] = 147,["206"] = 147,["208"] = 148,["209"] = 149,["210"] = 149,["212"] = 150,["213"] = 151,["217"] = 145,["218"] = 159,["219"] = 172,["220"] = 173,["221"] = 173,["222"] = 176,["223"] = 174,["224"] = 174,["225"] = 174,["226"] = 174,["228"] = 178,["230"] = 173,["231"] = 179,["232"] = 179,["233"] = 179,["234"] = 179,["235"] = 181,["236"] = 182,["237"] = 182,["238"] = 182,["239"] = 183,["241"] = 186,["243"] = 187,["244"] = 187,["246"] = 188,["247"] = 189,["248"] = 189,["250"] = 190,["251"] = 190,["252"] = 190,["253"] = 190,["256"] = 187,["259"] = 196,["260"] = 200,["261"] = 201,["262"] = 204,["263"] = 205,["264"] = 206,["265"] = 207,["266"] = 207,["267"] = 208,["268"] = 196,["269"] = 199,["270"] = 199,["271"] = 199,["272"] = 199,["273"] = 199,["274"] = 199,["275"] = 199,["276"] = 199,["277"] = 199,["278"] = 199,["279"] = 199,["280"] = 199,["281"] = 199,["282"] = 196,["283"] = 159,["284"] = 217,["285"] = 227,["286"] = 230,["287"] = 230,["288"] = 230,["289"] = 230,["290"] = 230,["291"] = 230,["292"] = 230,["293"] = 230,["294"] = 227,["295"] = 217,["296"] = 243,["297"] = 254,["298"] = 258,["299"] = 262,["300"] = 263,["301"] = 264,["302"] = 265,["305"] = 269,["306"] = 270,["307"] = 271,["308"] = 272,["309"] = 273,["310"] = 273,["311"] = 273,["312"] = 273,["313"] = 274,["314"] = 275,["315"] = 275,["316"] = 275,["317"] = 275,["319"] = 277,["320"] = 278,["321"] = 279,["322"] = 280,["323"] = 281,["324"] = 282,["325"] = 283,["326"] = 283,["327"] = 283,["328"] = 283,["329"] = 283,["330"] = 283,["331"] = 283,["334"] = 286,["335"] = 286,["336"] = 286,["337"] = 286,["338"] = 286,["339"] = 286,["340"] = 286,["341"] = 286,["342"] = 286,["343"] = 286,["345"] = 298,["346"] = 243});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____unit_helpers = require("lib.unit_helpers")
local focusPlayerCamera = ____unit_helpers.focusPlayerCamera
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
return ____exports
