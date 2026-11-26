local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 7,["22"] = 12,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 12,["29"] = 16,["30"] = 17,["33"] = 21,["34"] = 22,["35"] = 23,["38"] = 27,["39"] = 28,["42"] = 32,["43"] = 33,["46"] = 37,["47"] = 38,["48"] = 39,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 44,["56"] = 45,["58"] = 47,["59"] = 48,["62"] = 49,["63"] = 50,["64"] = 51,["68"] = 54,["71"] = 55,["72"] = 55,["73"] = 55,["74"] = 55,["78"] = 58,["81"] = 59,["82"] = 59,["83"] = 59,["84"] = 59,["85"] = 60,["86"] = 60,["87"] = 60,["88"] = 60,["89"] = 60,["90"] = 61,["91"] = 62,["95"] = 65,["98"] = 66,["102"] = 69,["105"] = 76,["106"] = 77,["112"] = 81,["117"] = 16,["118"] = 87,["119"] = 88,["120"] = 89,["121"] = 90,["122"] = 91,["123"] = 91,["124"] = 91,["125"] = 91,["126"] = 91,["127"] = 90,["128"] = 124,["131"] = 128,["132"] = 129,["133"] = 130,["134"] = 131,["135"] = 132,["136"] = 133,["140"] = 138,["141"] = 139,["142"] = 140,["143"] = 141,["144"] = 142,["145"] = 142,["146"] = 142,["148"] = 142,["150"] = 142,["151"] = 143,["152"] = 143,["153"] = 143,["154"] = 143,["155"] = 143,["156"] = 143,["157"] = 143,["158"] = 144,["161"] = 148,["162"] = 149,["163"] = 150,["164"] = 151,["167"] = 155,["168"] = 156,["169"] = 156,["170"] = 156,["171"] = 156,["172"] = 157,["173"] = 158,["174"] = 159,["178"] = 164,["179"] = 165,["180"] = 166,["181"] = 167,["182"] = 168,["183"] = 169,["185"] = 87,["186"] = 173,["187"] = 174,["188"] = 174,["189"] = 174,["190"] = 174,["192"] = 175,["193"] = 175,["194"] = 176,["197"] = 177,["198"] = 175,["201"] = 179,["202"] = 173,["203"] = 182,["204"] = 183,["205"] = 182});
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
    local isPlusLevel = text == "+" or __TS__StringStartsWith(text, "+") and tonumber(__TS__StringTrim(string.sub(text, 2))) ~= nil
    if not isPlusLevel and not __TS__StringStartsWith(text, "-evo_") then
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
    if isPlusLevel then
        local count = text == "+" and 1 or (tonumber(__TS__StringTrim(string.sub(text, 2))) or 1)
        self:levelUpHero(hero, count)
        return
    end
    local parts = __TS__ArrayFilter(
        __TS__StringSplit(text, " "),
        function(____, token) return #token > 0 end
    )
    local command = string.lower(parts[1])
    local args = __TS__ArraySlice(parts, 1)
    repeat
        local ____switch12 = command
        local ____cond12 = ____switch12 == "-evo_gold"
        if ____cond12 then
            do
                local amount = tonumber(args[1]) or 1000
                hero:ModifyGold(amount, true, 8)
                self:say(("[Dev] +" .. tostring(amount)) .. " gold")
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "-evo_lvl"
        if ____cond12 then
            do
                self:levelUpHero(
                    hero,
                    tonumber(args[1]) or 1
                )
                break
            end
        end
        ____cond12 = ____cond12 or ____switch12 == "-evo_fortify"
        if ____cond12 then
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
        ____cond12 = ____cond12 or ____switch12 == "-evo_look"
        if ____cond12 then
            do
                self:handleLookCommand(playerId, hero, args)
                break
            end
        end
        ____cond12 = ____cond12 or (____switch12 == "-evo_evo" or ____switch12 == "-evo_morph" or ____switch12 == "-evo_duel" or ____switch12 == "-evo_boss" or ____switch12 == "-evo_score" or ____switch12 == "-evo_tp" or ____switch12 == "-evo_mut")
        if ____cond12 then
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
function DevCheats.prototype.levelUpHero(self, hero, rawLevels)
    local levels = math.max(
        1,
        math.min(EVO_CONSTANTS.MAX_HERO_LEVEL, rawLevels)
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
end
function DevCheats.prototype.say(self, message)
    GameRules:SendCustomMessage(message, 0, 0)
end
return ____exports
