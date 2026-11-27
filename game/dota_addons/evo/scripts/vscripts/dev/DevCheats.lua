local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 10,["19"] = 10,["20"] = 11,["21"] = 7,["22"] = 9,["23"] = 14,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 14,["30"] = 18,["31"] = 19,["34"] = 23,["35"] = 24,["36"] = 25,["39"] = 29,["40"] = 30,["43"] = 34,["44"] = 35,["47"] = 39,["48"] = 40,["49"] = 41,["52"] = 45,["53"] = 45,["54"] = 45,["55"] = 45,["56"] = 46,["57"] = 47,["59"] = 49,["60"] = 50,["63"] = 51,["64"] = 52,["65"] = 53,["69"] = 56,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["79"] = 60,["82"] = 61,["83"] = 61,["84"] = 61,["85"] = 61,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 62,["91"] = 63,["92"] = 64,["96"] = 67,["99"] = 68,["103"] = 71,["106"] = 72,["107"] = 73,["108"] = 73,["109"] = 73,["111"] = 73,["112"] = 73,["113"] = 73,["115"] = 73,["117"] = 73,["119"] = 73,["120"] = 74,["121"] = 75,["122"] = 76,["123"] = 77,["127"] = 80,["130"] = 87,["131"] = 88,["137"] = 92,["142"] = 18,["143"] = 98,["144"] = 99,["145"] = 100,["146"] = 101,["147"] = 102,["148"] = 102,["149"] = 102,["150"] = 102,["151"] = 102,["152"] = 101,["153"] = 135,["156"] = 139,["157"] = 140,["158"] = 141,["159"] = 142,["160"] = 143,["161"] = 144,["165"] = 149,["166"] = 150,["167"] = 151,["168"] = 152,["169"] = 153,["170"] = 153,["171"] = 153,["173"] = 153,["175"] = 153,["176"] = 154,["177"] = 154,["178"] = 154,["179"] = 154,["180"] = 154,["181"] = 154,["182"] = 154,["183"] = 155,["186"] = 159,["187"] = 160,["188"] = 161,["189"] = 162,["192"] = 166,["193"] = 167,["194"] = 167,["195"] = 167,["196"] = 167,["197"] = 168,["198"] = 169,["199"] = 170,["203"] = 175,["204"] = 176,["205"] = 177,["206"] = 178,["207"] = 179,["208"] = 180,["210"] = 98,["211"] = 184,["212"] = 185,["213"] = 185,["214"] = 185,["215"] = 185,["217"] = 186,["218"] = 186,["219"] = 187,["222"] = 188,["223"] = 186,["226"] = 190,["227"] = 184,["228"] = 193,["229"] = 194,["230"] = 193});
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
    self.devFowDisabled = false
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
        ____cond12 = ____cond12 or ____switch12 == "-evo_fow"
        if ____cond12 then
            do
                local mode = string.lower(args[1] or "")
                local ____temp_1
                if mode == "off" then
                    ____temp_1 = true
                else
                    local ____temp_0
                    if mode == "on" then
                        ____temp_0 = false
                    else
                        ____temp_0 = not self.devFowDisabled
                    end
                    ____temp_1 = ____temp_0
                end
                self.devFowDisabled = ____temp_1
                local gm = GameRules:GetGameModeEntity()
                gm:SetFogOfWarDisabled(self.devFowDisabled)
                gm:SetUnseenFogOfWarEnabled(not self.devFowDisabled)
                self:say("[Dev] FOW " .. (self.devFowDisabled and "DISABLED" or "ENABLED"))
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
        local ____temp_2
        if args[5] ~= nil then
            ____temp_2 = tonumber(args[5])
        else
            ____temp_2 = nil
        end
        local a = ____temp_2
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
