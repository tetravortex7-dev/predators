-- overriding valve-broken functions
CDOTA_Ability_Lua.GetCastRangeBonus = function(self, hTarget)
	if not self or self:IsNull() then return 0 end
	if not self:GetCaster() or self:GetCaster():IsNull() then return 0 end
	return self:GetCaster():GetCastRangeBonus()
end
CDOTABaseAbility.GetCastRangeBonus = function(self, hTarget)
	if not self or self:IsNull() then return 0 end
	if not self:GetCaster() or self:GetCaster():IsNull() then return 0 end
	return self:GetCaster():GetCastRangeBonus()
end

-- CustomGameEventManager
-- PlayerResource
function CDOTA_PlayerResource:DisplayError(pId, msg)
	CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(pId), "CreateIngameErrorMessage", {message = msg})
end
function CDOTA_PlayerResource:GetPlayerIDs()
	local players = {}
	for i=0, DOTA_MAX_TEAM_PLAYERS do
		if PlayerResource:IsValidPlayerID(i) then
			table.insert(players, i)
		end
	end
	return players
end
function CDOTA_PlayerResource:GetPlayerIDsInTeam(team)
	return table.values(table.filter(PlayerResource:GetPlayerIDs(), function(k, v)
		return PlayerResource:GetTeam(v) == team
	end))
end
function CDOTA_PlayerResource:GetNetWorthInTeam(team)
	local gold = {}
	for _, playerID in pairs(PlayerResource:GetPlayerIDsInTeam(team)) do
		gold[playerID] = PlayerResource:GetNetWorth(playerID)
	end
	return gold
end
function CDOTA_PlayerResource:GetTeams()
	return table.values(table.filter(TEAMS, function(_, team)
		return #PlayerResource:GetPlayerIDsInTeam(team) > 0
	end))
end
function CDOTA_PlayerResource:Kick(playerID)
	SendToServerConsole("kickid "..tostring(GetUserID(playerID)))
end
function CDOTA_PlayerResource:KickID(userID)
	SendToServerConsole("kickid "..tostring(userID))
end
function CDOTA_PlayerResource:PingAtMinimap(player, point)
	CustomGameEventManager:Send_ServerToPlayer(type(player) == "number" and PlayerResource:GetPlayer(player) or player, "MinimapPing", {location=point})
end
function CDOTA_PlayerResource:PingAtMinimapTeam(team, point)
	CustomGameEventManager:Send_ServerToTeam(team, "MinimapPing", {location=point})
end
function CDOTA_PlayerResource:PingAtMinimapAll(point)
	CustomGameEventManager:Send_ServerToAllClients("MinimapPing", {location = point})
end
function CDOTA_PlayerResource:GetRespawnPositions(team)
	local info_player_starts = table.values(table.filter(Entities:FindAllByClassname("info_player_start_dota"), function(_, spawn)
		return spawn:GetTeamNumber() == team
	end))
	if team == DOTA_TEAM_GOODGUYS then
		info_player_starts = table.combine(info_player_starts, Entities:FindAllByClassname("info_player_start_goodguys"))
	elseif team == DOTA_TEAM_BADGUYS then
		info_player_starts = table.combine(info_player_starts, Entities:FindAllByClassname("info_player_start_badguys"))
	end
	return table.values(table.map(info_player_starts, function(_, spawn)
		return spawn:GetAbsOrigin()
	end))
end
function CDOTA_PlayerResource:GetRespawnPosition(team)
	return table.choice(PlayerResource:GetRespawnPositions(team))
end

-- Sounds
function EmitSoundOnLocationForTeam(sound, pos, team)
	local dummy = CreateUnitByName("npc_dummy_unit", pos, false, nil, nil, team)
	Timers:CreateTimer(60, function() UTIL_Remove(dummy) end)
	EmitSoundOnLocationForAllies(pos, sound, dummy)
end
function CDOTAPlayerController:EmitSoundOnClient(sound)
	CustomGameEventManager:Send_ServerToPlayer(self, "EmitSoundOnClient", {sound = sound})
end
function CDOTA_BaseNPC:EmitSoundOnClient(sound)
	local player = self:GetPlayerOwner()
	if player then
		CustomGameEventManager:Send_ServerToPlayer(player, "EmitSoundOnClient", {sound = sound})
	end
end
function EmitSoundWithCooldown(sound, cooldown, soundData)
	if SOUNDS_COOLDOWN[soundData["id"] or sound] == nil or (GameRules:GetDOTATime(false, false) - SOUNDS_COOLDOWN[soundData["id"] or sound]) > cooldown then
		SOUNDS_COOLDOWN[soundData["id"] or sound] = GameRules:GetDOTATime(false, false)
		if soundData["soundType"] == "unit" then
			soundData["unit"]:EmitSound(sound)
		elseif soundData["soundType"] == "unit_on" then
			EmitSoundOn(sound, soundData["unit"])
		elseif soundData["soundType"] == "unit_params" then
			soundData["unit"]:EmitSoundParams(sound, soundData["pitch"], soundData["volume"], soundData["delay"])
		elseif soundData["soundType"] == "player" then
			soundData["unit"]:EmitSoundOnClient(sound)
		elseif soundData["soundType"] == "location" then
			EmitSoundOnLocationWithCaster(soundData["location"], sound, soundData["unit"])
		elseif soundData["soundType"] == "location_team" then
			EmitSoundOnLocationForTeam(sound, soundData["location"], soundData["team"])
		elseif soundData["soundType"] == "global" then
			EmitGlobalSound(sound)
		elseif soundData["soundType"] == "anoouncer_team" then
			EmitAnnouncerSoundForTeam(sound, soundData["team"])
		end
	end
end
function CDOTABaseAbility:EmitResponseSound(sound, range, random, cooldown)
	if self:IsStolen() then return end
	if random then if not RollPercentage(random) then return end end
	if cooldown then
		id = tostring(self:entindex()..sound..self:GetCaster():entindex())
		if SOUNDS_COOLDOWN[id] ~= nil and (GameRules:GetDOTATime(false, false) - SOUNDS_COOLDOWN[id]) <= cooldown then
			return
		end
		SOUNDS_COOLDOWN[id] = GameRules:GetDOTATime(false, false)
	end
	local nums = {}
	for _, _rn in pairs(range) do
		if string.find(_rn, "-") ~= nil then
			local rn = string.split(_rn, "-")
			for i=tonumber(rn[1]), tonumber(rn[2]) do
				table.insert(nums, i)
			end
		else
			table.insert(nums, tonumber(_rn))
		end
	end
	self:GetCaster():EmitSoundOnClient(sound..string.format("%02d", table.choice(nums)))
end

-- Entities
function CBaseEntity:IsMonkey() return false end
function CDOTA_BaseNPC:IsMonkey()
	return self:HasModifier("modifier_monkey_king_wukongs_command_clone_lua") or self:HasModifier("modifier_monkey_king_fur_army_soldier_hidden") or self:HasModifier("modifier_monkey_king_fur_army_soldier") or self:HasModifier("modifier_monkey_king_fur_army_soldier_in_position") or self:HasModifier("modifier_monkey_king_fur_army_soldier_inactive")
end
