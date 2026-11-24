local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Map = ____lualib.Map
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 39,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 49,["19"] = 49,["20"] = 49,["22"] = 49,["23"] = 52,["24"] = 53,["27"] = 54,["28"] = 52,["29"] = 57,["30"] = 64,["33"] = 65,["34"] = 65,["35"] = 65,["36"] = 65,["37"] = 65,["38"] = 65,["39"] = 65,["40"] = 66,["41"] = 66,["42"] = 66,["43"] = 66,["44"] = 66,["45"] = 66,["46"] = 66,["47"] = 67,["48"] = 67,["49"] = 67,["50"] = 67,["51"] = 67,["52"] = 67,["53"] = 67,["54"] = 68,["55"] = 69,["56"] = 69,["57"] = 69,["58"] = 69,["59"] = 69,["60"] = 69,["61"] = 71,["62"] = 72,["63"] = 73,["64"] = 74,["66"] = 77,["67"] = 78,["68"] = 79,["70"] = 82,["71"] = 57,["72"] = 85,["73"] = 86,["74"] = 86,["75"] = 86,["76"] = 86,["77"] = 86,["78"] = 86,["79"] = 86,["80"] = 85,["81"] = 89,["82"] = 90,["85"] = 91,["86"] = 92,["87"] = 93,["88"] = 94,["90"] = 96,["92"] = 89,["93"] = 100,["94"] = 101,["97"] = 102,["98"] = 103,["99"] = 104,["100"] = 105,["102"] = 107,["104"] = 100,["105"] = 111,["106"] = 112,["109"] = 113,["110"] = 114,["113"] = 116,["114"] = 117,["115"] = 118,["117"] = 120,["118"] = 122,["119"] = 123,["120"] = 124,["123"] = 127,["124"] = 111,["125"] = 130,["126"] = 134,["127"] = 135,["128"] = 136,["130"] = 138,["131"] = 139,["132"] = 140,["133"] = 141,["138"] = 130,["139"] = 148,["140"] = 152,["141"] = 153,["143"] = 155,["144"] = 156,["146"] = 148,["147"] = 160,["148"] = 161,["151"] = 162,["152"] = 164,["153"] = 166,["155"] = 167,["156"] = 167,["158"] = 169,["159"] = 173,["160"] = 173,["162"] = 174,["163"] = 176,["164"] = 177,["165"] = 178,["167"] = 180,["168"] = 181,["170"] = 184,["171"] = 184,["172"] = 186,["173"] = 187,["175"] = 188,["176"] = 188,["178"] = 189,["179"] = 194,["180"] = 194,["188"] = 160,["189"] = 200,["190"] = 203,["191"] = 203,["193"] = 205,["196"] = 207,["197"] = 208,["199"] = 211,["200"] = 212,["201"] = 213,["202"] = 214,["203"] = 214,["204"] = 214,["206"] = 214,["207"] = 218,["208"] = 219,["210"] = 200,["211"] = 223,["212"] = 224,["215"] = 226,["216"] = 227,["217"] = 228,["219"] = 231,["220"] = 232,["221"] = 233,["222"] = 234,["224"] = 237,["225"] = 238,["227"] = 241,["228"] = 242,["229"] = 242,["230"] = 242,["231"] = 242,["232"] = 242,["233"] = 242,["234"] = 242,["235"] = 243,["236"] = 244,["237"] = 245,["238"] = 246,["239"] = 246,["240"] = 246,["241"] = 246,["242"] = 246,["243"] = 246,["244"] = 246,["246"] = 249,["247"] = 250,["249"] = 253,["250"] = 254,["252"] = 223,["253"] = 258,["254"] = 261,["255"] = 261,["257"] = 263,["258"] = 263,["260"] = 265,["261"] = 266,["262"] = 266,["264"] = 268,["265"] = 269,["266"] = 270,["268"] = 272,["270"] = 275,["271"] = 276,["272"] = 277,["273"] = 278,["274"] = 279,["275"] = 280,["276"] = 280,["277"] = 280,["278"] = 280,["279"] = 281,["280"] = 281,["281"] = 281,["282"] = 281,["283"] = 283,["284"] = 284,["285"] = 284,["286"] = 284,["287"] = 284,["288"] = 286,["289"] = 287,["290"] = 288,["292"] = 289,["293"] = 290,["294"] = 290,["296"] = 291,["297"] = 291,["298"] = 291,["299"] = 291,["300"] = 291,["305"] = 299,["306"] = 300,["307"] = 302,["308"] = 303,["309"] = 304,["311"] = 307,["312"] = 308,["314"] = 311,["315"] = 312,["317"] = 315,["319"] = 316,["320"] = 316,["322"] = 317,["323"] = 318,["324"] = 318,["326"] = 319,["327"] = 321,["328"] = 326,["330"] = 328,["333"] = 316,["337"] = 332,["339"] = 333,["340"] = 334,["341"] = 334,["343"] = 335,["344"] = 336,["345"] = 336,["346"] = 336,["347"] = 336,["349"] = 338,["350"] = 339,["355"] = 343,["356"] = 344,["357"] = 345,["358"] = 345,["359"] = 345,["360"] = 345,["361"] = 346,["362"] = 348,["363"] = 349,["365"] = 354,["366"] = 355,["368"] = 358,["369"] = 258,["370"] = 361,["371"] = 365,["372"] = 366,["375"] = 368,["376"] = 369,["377"] = 370,["378"] = 371,["379"] = 372,["380"] = 373,["381"] = 374,["382"] = 375,["385"] = 378,["387"] = 381,["389"] = 382,["390"] = 382,["392"] = 383,["393"] = 384,["394"] = 385,["395"] = 386,["400"] = 361,["401"] = 391,["402"] = 392,["403"] = 393,["404"] = 394,["405"] = 398,["407"] = 400,["408"] = 391,["409"] = 403,["410"] = 404,["411"] = 403,["412"] = 50});
local ____exports = {}
local EF_NODRAW = 32
local KEEP_MAP_UTILITY_ABILITIES = __TS__New(Set, {
    "abyssal_underlord_portal_warp",
    "twin_gate_portal_warp",
    "ability_pluck_famango",
    "ability_capture",
    "ability_lamp_use"
})
____exports.HeroAppearance = __TS__Class()
local HeroAppearance = ____exports.HeroAppearance
HeroAppearance.name = "HeroAppearance"
function HeroAppearance.prototype.____constructor(self)
end
function HeroAppearance.setScale(self, hero, scale)
    if not self:isValidUnit(hero) then
        return
    end
    hero:SetModelScale(math.max(0.1, scale))
end
function HeroAppearance.setColor(self, hero, r, g, b, alpha)
    if not self:isValidUnit(hero) then
        return
    end
    local clampedR = math.max(
        0,
        math.min(
            255,
            math.floor(r + 0.5)
        )
    )
    local clampedG = math.max(
        0,
        math.min(
            255,
            math.floor(g + 0.5)
        )
    )
    local clampedB = math.max(
        0,
        math.min(
            255,
            math.floor(b + 0.5)
        )
    )
    local clampedAlpha = alpha ~= nil and math.max(
        0,
        math.min(
            255,
            math.floor(alpha + 0.5)
        )
    ) or nil
    local state = self:getOrCreateState(hero:entindex())
    state.color = {clampedR, clampedG, clampedB}
    if clampedAlpha ~= nil then
        state.alpha = clampedAlpha
    end
    hero:SetRenderColor(clampedR, clampedG, clampedB)
    if clampedAlpha ~= nil then
        hero:SetRenderAlpha(clampedAlpha)
    end
    self:applyColorToAttachedWearables(hero, state)
end
function HeroAppearance.resetColor(self, hero)
    self:setColor(
        hero,
        255,
        255,
        255,
        255
    )
end
function HeroAppearance.hideBaseWearables(self, hero)
    if not self:isValidUnit(hero) then
        return
    end
    local child = hero:FirstMoveChild()
    while child and not child:IsNull() and IsValidEntity(child) do
        if child:GetClassname() == "dota_item_wearable" then
            child:AddEffects(EF_NODRAW)
        end
        child = child:NextMovePeer()
    end
end
function HeroAppearance.restoreBaseWearables(self, hero)
    if not self:isValidUnit(hero) then
        return
    end
    local child = hero:FirstMoveChild()
    while child and not child:IsNull() and IsValidEntity(child) do
        if child:GetClassname() == "dota_item_wearable" then
            child:RemoveEffects(EF_NODRAW)
        end
        child = child:NextMovePeer()
    end
end
function HeroAppearance.clearCustomWearables(self, hero)
    if not self:isValidUnit(hero) then
        return
    end
    local state = self.stateByHero:get(hero:entindex())
    if not state then
        return
    end
    for ____, particleId in ipairs(state.customParticles) do
        ParticleManager:DestroyParticle(particleId, true)
        ParticleManager:ReleaseParticleIndex(particleId)
    end
    state.customParticles = {}
    for ____, wearable in ipairs(state.customWearables) do
        if wearable and not wearable:IsNull() and IsValidEntity(wearable) then
            UTIL_Remove(wearable)
        end
    end
    state.customWearables = {}
end
function HeroAppearance.precacheWearables(self, wearables, context)
    for ____, spec in ipairs(wearables) do
        if spec.model and #spec.model > 0 then
            PrecacheModel(spec.model, context)
        end
        if spec.particles then
            for ____, vpcf in ipairs(spec.particles) do
                if vpcf and #vpcf > 0 then
                    PrecacheResource("particle", vpcf, context)
                end
            end
        end
    end
end
function HeroAppearance.precachePreset(self, preset, context)
    if preset.model and #preset.model > 0 then
        PrecacheModel(preset.model, context)
    end
    if preset.wearables then
        self:precacheWearables(preset.wearables, context)
    end
end
function HeroAppearance.equipWearables(self, hero, wearables)
    if not self:isValidUnit(hero) then
        return
    end
    self:clearCustomWearables(hero)
    local state = self:getOrCreateState(hero:entindex())
    for ____, spec in ipairs(wearables) do
        do
            if not spec.model or #spec.model == 0 then
                goto __continue39
            end
            local prop = SpawnEntityFromTableSynchronous("prop_dynamic", {model = spec.model})
            if not prop or prop:IsNull() or not IsValidEntity(prop) then
                goto __continue39
            end
            prop:FollowEntity(hero, true)
            local targetColor = spec.color or state.color
            if targetColor then
                prop:SetRenderColor(targetColor[1], targetColor[2], targetColor[3])
            end
            if state.alpha ~= nil then
                prop:SetRenderAlpha(state.alpha)
            end
            local ____state_customWearables_0 = state.customWearables
            ____state_customWearables_0[#____state_customWearables_0 + 1] = prop
            if spec.particles then
                for ____, vpcf in ipairs(spec.particles) do
                    do
                        if not vpcf or #vpcf == 0 then
                            goto __continue45
                        end
                        local pid = ParticleManager:CreateParticle(vpcf, 1, prop)
                        local ____state_customParticles_1 = state.customParticles
                        ____state_customParticles_1[#____state_customParticles_1 + 1] = pid
                    end
                    ::__continue45::
                end
            end
        end
        ::__continue39::
    end
end
function HeroAppearance.setDisplayName(self, hero, displayName, labelColor)
    if labelColor == nil then
        labelColor = {212, 184, 118}
    end
    if not self:isValidUnit(hero) then
        return
    end
    if not hero:IsRealHero() then
        hero:SetCustomHealthLabel(displayName, labelColor[1], labelColor[2], labelColor[3])
    end
    local playerId = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(playerId) then
        local key = tostring(playerId)
        local ____temp_2 = CustomNetTables:GetTableValue("player_evo", key)
        if ____temp_2 == nil then
            ____temp_2 = {}
        end
        local existing = ____temp_2
        existing.display_name = displayName
        CustomNetTables:SetTableValue("player_evo", key, existing)
    end
end
function HeroAppearance.applyPreset(self, hero, preset)
    if not self:isValidUnit(hero) then
        return
    end
    if preset.model and #preset.model > 0 then
        hero:SetOriginalModel(preset.model)
        hero:SetModel(preset.model)
    end
    if preset.hideBaseWearables == true then
        self:hideBaseWearables(hero)
    elseif preset.hideBaseWearables == false then
        self:restoreBaseWearables(hero)
    end
    if preset.scale ~= nil then
        self:setScale(hero, preset.scale)
    end
    if preset.color ~= nil then
        self:setColor(
            hero,
            preset.color[1],
            preset.color[2],
            preset.color[3],
            preset.alpha
        )
    elseif preset.alpha ~= nil then
        local state = self:getOrCreateState(hero:entindex())
        local c = state.color or ({255, 255, 255})
        self:setColor(
            hero,
            c[1],
            c[2],
            c[3],
            preset.alpha
        )
    end
    if preset.wearables ~= nil then
        self:equipWearables(hero, preset.wearables)
    end
    if preset.displayName ~= nil then
        self:setDisplayName(hero, preset.displayName, preset.labelColor)
    end
end
function HeroAppearance.replaceHeroPreservingState(self, playerId, newHeroClass, options)
    if options == nil then
        options = {}
    end
    if not PlayerResource:IsValidPlayerID(playerId) then
        return nil
    end
    local oldHero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not oldHero or oldHero:IsNull() or not IsValidEntity(oldHero) then
        return nil
    end
    if oldHero:GetUnitName() == newHeroClass then
        if options.appearance then
            self:applyPreset(oldHero, options.appearance)
        end
        return oldHero
    end
    local savedPos = oldHero:GetAbsOrigin()
    local savedForward = oldHero:GetForwardVector()
    local savedLevel = oldHero:GetLevel()
    local savedXp = oldHero:GetCurrentXP()
    local savedGold = PlayerResource:GetGold(playerId)
    local savedHpPct = math.max(
        0.05,
        oldHero:GetHealthPercent() / 100
    )
    local savedMpPct = math.max(
        0,
        oldHero:GetManaPercent() / 100
    )
    local peaceMod = oldHero:FindModifierByName("modifier_evo_peace_time")
    local savedPeaceRemaining = peaceMod and math.max(
        0,
        peaceMod:GetRemainingTime()
    ) or 0
    local savedAbilities = {}
    if options.preserveAbilities then
        for ____, abilityName in ipairs(options.preserveAbilities) do
            do
                local ability = oldHero:FindAbilityByName(abilityName)
                if not ability or ability:IsNull() then
                    goto __continue69
                end
                savedAbilities[#savedAbilities + 1] = {
                    name = abilityName,
                    level = ability:GetLevel(),
                    cooldown = ability:GetCooldownTimeRemaining()
                }
            end
            ::__continue69::
        end
    end
    self:clearCustomWearables(oldHero)
    self.stateByHero:delete(oldHero:entindex())
    local newHero = PlayerResource:ReplaceHeroWith(playerId, newHeroClass, savedGold, savedXp)
    if not newHero or newHero:IsNull() or not IsValidEntity(newHero) then
        return nil
    end
    if oldHero ~= newHero and not oldHero:IsNull() and IsValidEntity(oldHero) then
        UTIL_Remove(oldHero)
    end
    while newHero:GetLevel() < savedLevel do
        newHero:HeroLevelUp(false)
    end
    if options.stripDefaultAbilities == true then
        do
            local i = 0
            while i < newHero:GetAbilityCount() do
                do
                    local ability = newHero:GetAbilityByIndex(i)
                    if not ability or ability:IsNull() then
                        goto __continue76
                    end
                    local name = ability:GetAbilityName()
                    if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or name == "generic_hidden" or KEEP_MAP_UTILITY_ABILITIES:has(name) then
                        goto __continue76
                    end
                    newHero:RemoveAbilityByHandle(ability)
                end
                ::__continue76::
                i = i + 1
            end
        end
    end
    for ____, saved in ipairs(savedAbilities) do
        do
            local ability = newHero:FindAbilityByName(saved.name) or newHero:AddAbility(saved.name)
            if not ability or ability:IsNull() then
                goto __continue79
            end
            if saved.level > 0 then
                ability:SetLevel(math.min(
                    ability:GetMaxLevel(),
                    saved.level
                ))
            end
            if saved.cooldown > 0 then
                ability:StartCooldown(saved.cooldown)
            end
        end
        ::__continue79::
    end
    FindClearSpaceForUnit(newHero, savedPos, true)
    newHero:SetForwardVector(savedForward)
    newHero:SetHealth(math.max(
        1,
        math.floor(newHero:GetMaxHealth() * savedHpPct)
    ))
    newHero:SetMana(math.floor(newHero:GetMaxMana() * savedMpPct))
    if savedPeaceRemaining > 0 then
        newHero:AddNewModifier(newHero, nil, "modifier_evo_peace_time", {duration = savedPeaceRemaining})
    end
    if options.appearance then
        self:applyPreset(newHero, options.appearance)
    end
    return newHero
end
function HeroAppearance.applyColorToAttachedWearables(self, hero, state)
    local color = state.color
    if not color then
        return
    end
    local child = hero:FirstMoveChild()
    while child and not child:IsNull() and IsValidEntity(child) do
        local cls = child:GetClassname()
        if cls == "dota_item_wearable" or cls == "prop_dynamic" then
            local modelEnt = child
            modelEnt:SetRenderColor(color[1], color[2], color[3])
            if state.alpha ~= nil then
                modelEnt:SetRenderAlpha(state.alpha)
            end
        end
        child = child:NextMovePeer()
    end
    for ____, wearable in ipairs(state.customWearables) do
        do
            if not wearable or wearable:IsNull() or not IsValidEntity(wearable) then
                goto __continue91
            end
            local modelEnt = wearable
            modelEnt:SetRenderColor(color[1], color[2], color[3])
            if state.alpha ~= nil then
                modelEnt:SetRenderAlpha(state.alpha)
            end
        end
        ::__continue91::
    end
end
function HeroAppearance.getOrCreateState(self, entIndex)
    local state = self.stateByHero:get(entIndex)
    if not state then
        state = {customWearables = {}, customParticles = {}}
        self.stateByHero:set(entIndex, state)
    end
    return state
end
function HeroAppearance.isValidUnit(self, unit)
    return unit ~= nil and not unit:IsNull() and IsValidEntity(unit)
end
HeroAppearance.stateByHero = __TS__New(Map)
return ____exports
