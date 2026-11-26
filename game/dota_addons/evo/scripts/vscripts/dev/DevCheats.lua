local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 7,["22"] = 12,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 12,["29"] = 16,["30"] = 17,["33"] = 21,["34"] = 22,["37"] = 26,["38"] = 27,["41"] = 31,["42"] = 32,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 37,["50"] = 38,["52"] = 40,["53"] = 41,["56"] = 42,["57"] = 43,["58"] = 44,["62"] = 47,["65"] = 48,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 48,["73"] = 49,["74"] = 49,["75"] = 50,["78"] = 51,["79"] = 49,["82"] = 53,["86"] = 56,["89"] = 57,["90"] = 57,["91"] = 57,["92"] = 57,["93"] = 58,["94"] = 58,["95"] = 58,["96"] = 58,["97"] = 58,["98"] = 59,["99"] = 60,["103"] = 63,["106"] = 64,["110"] = 67,["113"] = 74,["114"] = 75,["120"] = 79,["125"] = 16,["126"] = 85,["127"] = 86,["128"] = 87,["129"] = 88,["130"] = 89,["131"] = 89,["132"] = 89,["133"] = 89,["134"] = 89,["135"] = 88,["136"] = 122,["139"] = 126,["140"] = 127,["141"] = 128,["142"] = 129,["143"] = 130,["144"] = 131,["148"] = 136,["149"] = 137,["150"] = 138,["151"] = 139,["152"] = 140,["153"] = 140,["154"] = 140,["156"] = 140,["158"] = 140,["159"] = 141,["160"] = 141,["161"] = 141,["162"] = 141,["163"] = 141,["164"] = 141,["165"] = 141,["166"] = 142,["169"] = 146,["170"] = 147,["171"] = 148,["172"] = 149,["175"] = 153,["176"] = 154,["177"] = 154,["178"] = 154,["179"] = 154,["180"] = 155,["181"] = 156,["182"] = 157,["186"] = 162,["187"] = 163,["188"] = 164,["189"] = 165,["190"] = 166,["191"] = 167,["193"] = 85,["194"] = 171,["195"] = 172,["196"] = 171});
local ____exports = {}
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
____exports.DevCheats = __TS__Class()
local DevCheats = ____exports.DevCheats
DevCheats.name = "DevCheats"
function DevCheats.prototype.____constructor(self, eventBus, levelingManager)
    self.eventBus = eventBus
    self.levelingManager = levelingManager
end
function DevCheats.prototype.init(self)
    ListenToGameEvent(
        "player_chat",
        function(event) return self:onPlayerChat(event) end,
        nil
    )
end
function DevCheats.prototype.onPlayerChat(self, event)
    if not IsInToolsMode() and not GameRules:IsCheatMode() then
        return
    end
    local text = __TS__StringTrim(event.text or "")
    if not __TS__StringStartsWith(text, "-evo_") then
        return
    end
    local playerId = event.playerid
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or hero:IsNull() or not IsValidEntity(hero) then
        return
    end
    local parts = __TS__ArrayFilter(
        __TS__StringSplit(text, " "),
        function(____, token) return #token > 0 end
    )
    local command = string.lower(parts[1])
    local args = __TS__ArraySlice(parts, 1)
    repeat
        local ____switch11 = command
        local ____cond11 = ____switch11 == "-evo_gold"
        if ____cond11 then
            do
                local amount = tonumber(args[1]) or 1000
                hero:ModifyGold(amount, true, 8)
                self:say(("[Dev] +" .. tostring(amount)) .. " gold")
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "-evo_lvl"
        if ____cond11 then
            do
                local levels = math.max(
                    1,
                    math.min(
                        EVO_CONSTANTS.MAX_HERO_LEVEL,
                        tonumber(args[1]) or 1
                    )
                )
                do
                    local i = 0
                    while i < levels do
                        if hero:GetLevel() >= EVO_CONSTANTS.MAX_HERO_LEVEL then
                            break
                        end
                        hero:HeroLevelUp(true)
                        i = i + 1
                    end
                end
                self:say("[Dev] Hero level is now " .. tostring(hero:GetLevel()))
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "-evo_fortify"
        if ____cond11 then
            do
                local count = math.max(
                    1,
                    tonumber(args[1]) or 1
                )
                self.levelingManager:grantFortificationCharge(
                    playerId,
                    count,
                    hero:GetLevel()
                )
                local total = self.levelingManager:getFortificationCharges(playerId)
                self:say(((("[Dev] +" .. tostring(count)) .. " fortification charge(s) (total: ") .. tostring(total)) .. ")")
                break
            end
        end
        ____cond11 = ____cond11 or ____switch11 == "-evo_look"
        if ____cond11 then
            do
                self:handleLookCommand(playerId, hero, args)
                break
            end
        end
        ____cond11 = ____cond11 or (____switch11 == "-evo_evo" or ____switch11 == "-evo_morph" or ____switch11 == "-evo_duel" or ____switch11 == "-evo_boss" or ____switch11 == "-evo_score" or ____switch11 == "-evo_tp" or ____switch11 == "-evo_mut")
        if ____cond11 then
            do
                self.eventBus:emit("dev_command", {playerId = playerId, command = command, args = args})
                self:say((("[Dev] Dispatched " .. command) .. " ") .. table.concat(args, " "))
                break
            end
        end
        do
            do
                self:say("[Dev] Unknown command: " .. command)
                break
            end
        end
    until true
end
function DevCheats.prototype.handleLookCommand(self, playerId, hero, args)
    local sub = string.lower(args[1] or "morph")
    if sub == "morph" then
        HeroAppearance:replaceHeroPreservingState(playerId, "npc_dota_hero_morphling", {appearance = {
            scale = 1.35,
            color = {90, 240, 200},
            hideBaseWearables = true,
            displayName = "APEX MORPHLING",
            wearables = {{model = "models/items/morphling/crown_of_tears/mesh/crown_of_tears_model.vmdl", particles = {"particles/econ/items/morphling/morphling_crown_of_tears/morphling_crown_ambient.vpcf"}}, {model = "models/items/morphling/ethereal_blade/ethereal_blade.vmdl", particles = {"particles/econ/items/morphling/morphling_ethereal/morphling_ethereal_ambient.vpcf"}}, {model = "models/items/morphling/abyss_overlord_shoulder/abyss_overlord_shoulder.vmdl", particles = {"particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_shoulder_ambient.vpcf"}}, {model = "models/items/morphling/abyss_overlord_back/abyss_overlord_back.vmdl", particles = {"particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_back_ambient.vpcf"}}}
        }})
        self:say("[Dev] Switched to native Morphling + Apex appearance preset.")
        return
    end
    if sub == "hero" then
        local rawName = string.lower(args[2] or "morphling")
        local heroClass = __TS__StringStartsWith(rawName, "npc_dota_hero_") and rawName or "npc_dota_hero_" .. rawName
        local replaced = HeroAppearance:replaceHeroPreservingState(playerId, heroClass)
        if replaced then
            self:say("[Dev] Replaced hero with " .. heroClass)
        end
        return
    end
    if sub == "color" then
        local r = tonumber(args[2]) or 255
        local g = tonumber(args[3]) or 255
        local b = tonumber(args[4]) or 255
        local ____temp_0
        if args[5] ~= nil then
            ____temp_0 = tonumber(args[5])
        else
            ____temp_0 = nil
        end
        local a = ____temp_0
        HeroAppearance:setColor(
            hero,
            r,
            g,
            b,
            a
        )
        self:say(((((("[Dev] Hero color set to (" .. tostring(r)) .. ", ") .. tostring(g)) .. ", ") .. tostring(b)) .. ")")
        return
    end
    if sub == "scale" then
        local scale = tonumber(args[2]) or 1
        HeroAppearance:setScale(hero, scale)
        self:say("[Dev] Hero scale set to " .. tostring(scale))
        return
    end
    if sub == "name" then
        local displayName = __TS__StringTrim(table.concat(
            __TS__ArraySlice(args, 1),
            " "
        ))
        if #displayName > 0 then
            HeroAppearance:setDisplayName(hero, displayName)
            self:say("[Dev] Hero display name set to " .. displayName)
        end
        return
    end
    if sub == "reset" then
        HeroAppearance:clearCustomWearables(hero)
        HeroAppearance:restoreBaseWearables(hero)
        HeroAppearance:resetColor(hero)
        HeroAppearance:setScale(hero, 1)
        self:say("[Dev] Hero appearance reset.")
    end
end
function DevCheats.prototype.say(self, message)
    GameRules:SendCustomMessage(message, 0, 0)
end
return ____exports
