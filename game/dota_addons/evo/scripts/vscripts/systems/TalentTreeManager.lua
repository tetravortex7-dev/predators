local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 9,["10"] = 9,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 29,["18"] = 29,["19"] = 29,["20"] = 32,["21"] = 32,["22"] = 30,["23"] = 32,["24"] = 34,["25"] = 35,["26"] = 35,["27"] = 35,["28"] = 36,["29"] = 35,["30"] = 35,["31"] = 39,["32"] = 39,["33"] = 41,["34"] = 42,["35"] = 43,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 49,["41"] = 49,["42"] = 51,["43"] = 52,["44"] = 53,["47"] = 54,["48"] = 55,["49"] = 56,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 62,["55"] = 62,["56"] = 62,["57"] = 62,["58"] = 62,["59"] = 63,["60"] = 64,["61"] = 62,["62"] = 62,["63"] = 34,["64"] = 68,["65"] = 69,["66"] = 70,["67"] = 71,["68"] = 71,["69"] = 71,["70"] = 71,["71"] = 72,["73"] = 74,["74"] = 68,["75"] = 77,["76"] = 78,["77"] = 79,["80"] = 81,["81"] = 82,["82"] = 83,["85"] = 84,["88"] = 86,["89"] = 87,["92"] = 89,["93"] = 90,["96"] = 92,["97"] = 93,["100"] = 95,["101"] = 96,["102"] = 97,["105"] = 98,["108"] = 99,["111"] = 101,["112"] = 102,["113"] = 103,["116"] = 105,["117"] = 106,["118"] = 107,["119"] = 109,["120"] = 110,["122"] = 112,["124"] = 115,["125"] = 115,["126"] = 115,["127"] = 115,["128"] = 116,["129"] = 77,["130"] = 119,["131"] = 120,["132"] = 121,["135"] = 122,["136"] = 123,["140"] = 125,["141"] = 125,["142"] = 126,["143"] = 127,["144"] = 128,["145"] = 129,["146"] = 130,["147"] = 130,["150"] = 132,["151"] = 133,["152"] = 134,["153"] = 134,["156"] = 125,["159"] = 137,["160"] = 119,["161"] = 140,["162"] = 141,["163"] = 142,["164"] = 143,["165"] = 144,["166"] = 146,["168"] = 147,["169"] = 147,["170"] = 148,["171"] = 149,["172"] = 150,["173"] = 150,["174"] = 150,["175"] = 150,["176"] = 150,["177"] = 150,["178"] = 150,["179"] = 147,["182"] = 159,["183"] = 159,["184"] = 159,["185"] = 159,["186"] = 159,["187"] = 140});
local ____exports = {}
____exports.EVO_TALENT_ROWS = {
    {level = 10, left = "special_bonus_evo_agi_int_1", right = "special_bonus_evo_int_str_1"},
    {level = 15, left = "special_bonus_evo_hp_100", right = "special_bonus_evo_mana_125"},
    {level = 20, left = "special_bonus_evo_ms_25", right = "special_bonus_evo_armor_6"},
    {level = 25, left = "special_bonus_evo_all_stats_5", right = "special_bonus_evo_magic_resist_15"},
    {level = 30, left = "special_bonus_evo_hp_regen_15", right = "special_bonus_evo_mana_regen_75"},
    {level = 35, left = "special_bonus_evo_damage_75", right = "special_bonus_evo_spell_amp_28"}
}
____exports.TalentTreeManager = __TS__Class()
local TalentTreeManager = ____exports.TalentTreeManager
TalentTreeManager.name = "TalentTreeManager"
function TalentTreeManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.picksByPlayer = __TS__New(Map)
end
function TalentTreeManager.prototype.init(self)
    CustomGameEventManager:RegisterListener(
        "evo_learn_talent",
        function(_, event)
            self:onLearnTalent(event)
        end
    )
    ListenToGameEvent(
        "dota_player_gained_level",
        function(event)
            if event.player_id ~= nil and PlayerResource:IsValidPlayerID(event.player_id) then
                self:syncPlayer(event.player_id)
            end
        end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event)
            local ent = EntIndexToHScript(event.entindex)
            if not ent or ent:IsNull() or not IsValidEntity(ent) or not ent:IsBaseNPC() or not ent:IsRealHero() then
                return
            end
            local pid = ent:GetPlayerOwnerID()
            if PlayerResource:IsValidPlayerID(pid) then
                self:syncPlayer(pid)
            end
        end,
        nil
    )
    self.eventBus:on(
        "body_morphed",
        function(____, ____bindingPattern0)
            local playerId
            playerId = ____bindingPattern0.playerId
            self:reapplyTalentsToHero(playerId)
            self:syncPlayer(playerId)
        end
    )
end
function TalentTreeManager.prototype.getOrCreatePicks(self, playerId)
    local picks = self.picksByPlayer:get(playerId)
    if not picks then
        picks = __TS__ArrayMap(
            ____exports.EVO_TALENT_ROWS,
            function() return {left = false, right = false} end
        )
        self.picksByPlayer:set(playerId, picks)
    end
    return picks
end
function TalentTreeManager.prototype.onLearnTalent(self, event)
    local playerId = event.PlayerID
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local row = event.row
    local side = event.side
    if row == nil or row < 0 or row >= #____exports.EVO_TALENT_ROWS then
        return
    end
    if side ~= "left" and side ~= "right" then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) or not hero:IsAlive() then
        return
    end
    local rowDef = ____exports.EVO_TALENT_ROWS[row + 1]
    if hero:GetLevel() < rowDef.level then
        return
    end
    local abilityPoints = hero:GetAbilityPoints()
    if abilityPoints <= 0 then
        return
    end
    local picks = self:getOrCreatePicks(playerId)
    local rowState = picks[row + 1]
    if side == "left" and rowState.left then
        return
    end
    if side == "right" and rowState.right then
        return
    end
    if (rowState.left or rowState.right) and hero:GetLevel() < 30 then
        return
    end
    local abilityName = side == "left" and rowDef.left or rowDef.right
    local ability = hero:FindAbilityByName(abilityName) or hero:AddAbility(abilityName)
    if not ability or ability:IsNull() then
        return
    end
    hero:SetAbilityPoints(math.max(0, abilityPoints - 1))
    ability:SetLevel(1)
    hero:CalculateStatBonus(true)
    if side == "left" then
        rowState.left = true
    else
        rowState.right = true
    end
    EmitSoundOnClient(
        "General.LevelUp",
        PlayerResource:GetPlayer(playerId)
    )
    self:syncPlayer(playerId)
end
function TalentTreeManager.prototype.reapplyTalentsToHero(self, playerId)
    local picks = self.picksByPlayer:get(playerId)
    if not picks then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    do
        local i = 0
        while i < #____exports.EVO_TALENT_ROWS do
            local rowDef = ____exports.EVO_TALENT_ROWS[i + 1]
            local rowState = picks[i + 1]
            if rowState.left then
                local ab = hero:FindAbilityByName(rowDef.left) or hero:AddAbility(rowDef.left)
                if ab and ab:GetLevel() == 0 then
                    ab:SetLevel(1)
                end
            end
            if rowState.right then
                local ab = hero:FindAbilityByName(rowDef.right) or hero:AddAbility(rowDef.right)
                if ab and ab:GetLevel() == 0 then
                    ab:SetLevel(1)
                end
            end
            i = i + 1
        end
    end
    hero:CalculateStatBonus(true)
end
function TalentTreeManager.prototype.syncPlayer(self, playerId)
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local level = hero and not hero:IsNull() and IsValidEntity(hero) and hero:GetLevel() or 1
    local points = hero and not hero:IsNull() and IsValidEntity(hero) and hero:GetAbilityPoints() or 0
    local picks = self:getOrCreatePicks(playerId)
    local rowsPayload = {}
    do
        local i = 0
        while i < #____exports.EVO_TALENT_ROWS do
            local rowDef = ____exports.EVO_TALENT_ROWS[i + 1]
            local state = picks[i + 1]
            rowsPayload[tostring(i)] = {
                level = rowDef.level,
                left_ability = rowDef.left,
                right_ability = rowDef.right,
                left_learned = state.left and 1 or 0,
                right_learned = state.right and 1 or 0
            }
            i = i + 1
        end
    end
    CustomNetTables:SetTableValue(
        "player_talents",
        tostring(playerId),
        {hero_level = level, ability_points = points, rows = rowsPayload}
    )
end
return ____exports
