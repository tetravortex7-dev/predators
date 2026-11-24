local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 10,["13"] = 11,["14"] = 12,["17"] = 14,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 17,["24"] = 18,["25"] = 18,["27"] = 19,["28"] = 20,["29"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["40"] = 18,["43"] = 27,["45"] = 28,["46"] = 28,["48"] = 29,["49"] = 30,["50"] = 30,["52"] = 31,["53"] = 32,["54"] = 33,["58"] = 28,["61"] = 37,["62"] = 37,["63"] = 37,["64"] = 37,["65"] = 37,["66"] = 37,["67"] = 37,["68"] = 37,["69"] = 37,["70"] = 37,["71"] = 37,["72"] = 37,["73"] = 47,["74"] = 48,["76"] = 51,["77"] = 52,["78"] = 53,["79"] = 53,["80"] = 53,["81"] = 53,["82"] = 53,["83"] = 53,["84"] = 53,["85"] = 54,["86"] = 55,["88"] = 57,["89"] = 57,["90"] = 58,["91"] = 59,["92"] = 60,["94"] = 57,["98"] = 63,["99"] = 63,["100"] = 64,["101"] = 65,["102"] = 66,["104"] = 63,["107"] = 70,["108"] = 71,["109"] = 72,["110"] = 73,["111"] = 75,["112"] = 3,["113"] = 78,["114"] = 83,["117"] = 84,["118"] = 85,["119"] = 86,["122"] = 88,["123"] = 89,["125"] = 92,["126"] = 93,["127"] = 95,["128"] = 96,["129"] = 96,["130"] = 96,["131"] = 96,["132"] = 96,["133"] = 96,["134"] = 96,["135"] = 97,["136"] = 97,["137"] = 97,["138"] = 97,["139"] = 97,["140"] = 97,["141"] = 97,["142"] = 98,["143"] = 98,["144"] = 98,["145"] = 98,["146"] = 98,["147"] = 98,["148"] = 98,["150"] = 100,["151"] = 100,["153"] = 101,["154"] = 102,["155"] = 102,["157"] = 103,["158"] = 104,["159"] = 105,["160"] = 106,["164"] = 100,["168"] = 110,["169"] = 110,["171"] = 111,["172"] = 112,["173"] = 112,["175"] = 113,["176"] = 114,["177"] = 115,["178"] = 116,["182"] = 110,["186"] = 121,["187"] = 122,["189"] = 78,["190"] = 128,["191"] = 129,["192"] = 130,["193"] = 131,["194"] = 132,["197"] = 135,["198"] = 128,["199"] = 138,["200"] = 142,["201"] = 144,["202"] = 144,["203"] = 144,["204"] = 144,["205"] = 144,["206"] = 144,["207"] = 144,["208"] = 144,["209"] = 144,["210"] = 144,["211"] = 144,["212"] = 156,["214"] = 157,["215"] = 157,["217"] = 158,["218"] = 158,["220"] = 159,["221"] = 160,["226"] = 163,["227"] = 163,["229"] = 164,["230"] = 165,["231"] = 165,["233"] = 166,["234"] = 167,["235"] = 167,["237"] = 168,["238"] = 168,["240"] = 169,["241"] = 170,["244"] = 163,["247"] = 138,["248"] = 174,["249"] = 175,["250"] = 174,["251"] = 184,["252"] = 195,["253"] = 196,["254"] = 196,["255"] = 199,["256"] = 197,["257"] = 197,["258"] = 197,["259"] = 197,["261"] = 201,["263"] = 196,["264"] = 202,["265"] = 202,["266"] = 202,["267"] = 202,["268"] = 204,["269"] = 205,["270"] = 205,["271"] = 205,["272"] = 206,["274"] = 209,["275"] = 213,["276"] = 214,["277"] = 217,["278"] = 218,["279"] = 219,["280"] = 220,["281"] = 220,["282"] = 221,["283"] = 209,["284"] = 212,["285"] = 212,["286"] = 212,["287"] = 212,["288"] = 212,["289"] = 212,["290"] = 212,["291"] = 212,["292"] = 212,["293"] = 212,["294"] = 212,["295"] = 212,["296"] = 209,["297"] = 184});
local ____exports = {}
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
    activeDuelistEntIndexes:add(hero:entindex())
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
function ____exports.releaseWorldPause(self, pausedEntIndexes)
    for ____, entIndex in __TS__Iterator(pausedEntIndexes) do
        local ent = EntIndexToHScript(entIndex)
        if ent and not ent:IsNull() and IsValidEntity(ent) and ent:IsBaseNPC() then
            ent:RemoveModifierByName("modifier_evo_world_pause")
        end
    end
    pausedEntIndexes:clear()
end
function ____exports.applyWorldPause(self, activeDuelistEntIndexes, pausedEntIndexes)
    ____exports.releaseWorldPause(nil, pausedEntIndexes)
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
                goto __continue33
            end
            if activeDuelistEntIndexes:has(unit:entindex()) then
                goto __continue33
            end
            unit:AddNewModifier(unit, nil, "modifier_evo_world_pause", {})
            pausedEntIndexes:add(unit:entindex())
        end
        ::__continue33::
    end
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local pid = i
                if not PlayerResource:IsValidPlayerID(pid) then
                    goto __continue37
                end
                local hero = PlayerResource:GetSelectedHeroEntity(pid)
                if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
                    goto __continue37
                end
                if activeDuelistEntIndexes:has(hero:entindex()) then
                    goto __continue37
                end
                hero:AddNewModifier(hero, nil, "modifier_evo_world_pause", {})
                pausedEntIndexes:add(hero:entindex())
            end
            ::__continue37::
            i = i + 1
        end
    end
end
function ____exports.broadcastDuelEvent(self, eventName, winnerId)
    CustomGameEventManager:Send_ServerToAllClients("evo_duel_event", {event = eventName, winner_id = winnerId})
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
        tiebreaker_scores = tiebreakerPayload
    })
end
return ____exports
