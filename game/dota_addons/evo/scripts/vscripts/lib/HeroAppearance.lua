local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Map = ____lualib.Map
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 40,["11"] = 42,["12"] = 42,["13"] = 42,["14"] = 42,["15"] = 42,["16"] = 42,["17"] = 42,["18"] = 50,["19"] = 50,["20"] = 50,["22"] = 50,["23"] = 53,["24"] = 54,["27"] = 55,["28"] = 53,["29"] = 58,["30"] = 65,["33"] = 66,["34"] = 66,["35"] = 66,["36"] = 66,["37"] = 66,["38"] = 66,["39"] = 66,["40"] = 67,["41"] = 67,["42"] = 67,["43"] = 67,["44"] = 67,["45"] = 67,["46"] = 67,["47"] = 68,["48"] = 68,["49"] = 68,["50"] = 68,["51"] = 68,["52"] = 68,["53"] = 68,["54"] = 69,["55"] = 70,["56"] = 70,["57"] = 70,["58"] = 70,["59"] = 70,["60"] = 70,["61"] = 72,["62"] = 73,["63"] = 74,["64"] = 75,["66"] = 78,["67"] = 79,["68"] = 80,["70"] = 83,["71"] = 58,["72"] = 86,["73"] = 87,["74"] = 87,["75"] = 87,["76"] = 87,["77"] = 87,["78"] = 87,["79"] = 87,["80"] = 86,["81"] = 90,["82"] = 91,["85"] = 92,["86"] = 93,["87"] = 94,["88"] = 95,["90"] = 97,["92"] = 90,["93"] = 101,["94"] = 102,["97"] = 103,["98"] = 104,["99"] = 105,["100"] = 106,["102"] = 108,["104"] = 101,["105"] = 112,["106"] = 113,["109"] = 114,["110"] = 115,["113"] = 117,["114"] = 118,["115"] = 119,["117"] = 121,["118"] = 123,["119"] = 124,["120"] = 125,["123"] = 128,["124"] = 112,["125"] = 131,["126"] = 135,["127"] = 136,["128"] = 137,["130"] = 139,["131"] = 140,["132"] = 141,["133"] = 142,["138"] = 131,["139"] = 149,["140"] = 153,["141"] = 154,["143"] = 156,["144"] = 157,["146"] = 149,["147"] = 161,["148"] = 162,["151"] = 163,["152"] = 165,["153"] = 167,["155"] = 168,["156"] = 168,["158"] = 170,["159"] = 174,["160"] = 174,["162"] = 175,["163"] = 177,["164"] = 178,["165"] = 179,["167"] = 181,["168"] = 182,["170"] = 185,["171"] = 185,["172"] = 187,["173"] = 188,["175"] = 189,["176"] = 189,["178"] = 190,["179"] = 195,["180"] = 195,["188"] = 161,["189"] = 201,["190"] = 204,["191"] = 204,["193"] = 206,["196"] = 208,["197"] = 209,["199"] = 212,["200"] = 213,["201"] = 214,["202"] = 215,["203"] = 215,["204"] = 215,["206"] = 215,["207"] = 219,["208"] = 220,["210"] = 201,["211"] = 224,["212"] = 225,["215"] = 227,["216"] = 228,["217"] = 229,["219"] = 232,["220"] = 233,["221"] = 234,["222"] = 235,["224"] = 238,["225"] = 239,["227"] = 242,["228"] = 243,["229"] = 243,["230"] = 243,["231"] = 243,["232"] = 243,["233"] = 243,["234"] = 243,["235"] = 244,["236"] = 245,["237"] = 246,["238"] = 247,["239"] = 247,["240"] = 247,["241"] = 247,["242"] = 247,["243"] = 247,["244"] = 247,["246"] = 250,["247"] = 251,["249"] = 254,["250"] = 255,["252"] = 224,["253"] = 259,["254"] = 262,["255"] = 262,["257"] = 264,["258"] = 264,["260"] = 266,["261"] = 267,["262"] = 267,["264"] = 269,["265"] = 270,["266"] = 271,["268"] = 273,["270"] = 276,["271"] = 277,["272"] = 278,["273"] = 279,["274"] = 280,["275"] = 281,["276"] = 282,["277"] = 282,["278"] = 282,["279"] = 282,["280"] = 283,["281"] = 283,["282"] = 283,["283"] = 283,["284"] = 285,["285"] = 286,["286"] = 286,["287"] = 286,["288"] = 286,["289"] = 288,["290"] = 289,["291"] = 290,["293"] = 291,["294"] = 292,["295"] = 292,["297"] = 293,["298"] = 293,["299"] = 293,["300"] = 293,["301"] = 293,["306"] = 301,["307"] = 302,["308"] = 304,["309"] = 305,["310"] = 306,["313"] = 309,["314"] = 309,["315"] = 310,["316"] = 311,["317"] = 312,["318"] = 313,["320"] = 309,["323"] = 317,["324"] = 318,["325"] = 318,["326"] = 320,["327"] = 321,["328"] = 322,["330"] = 324,["331"] = 318,["332"] = 318,["333"] = 318,["335"] = 330,["336"] = 331,["338"] = 333,["339"] = 334,["342"] = 338,["344"] = 339,["345"] = 339,["347"] = 340,["348"] = 341,["349"] = 341,["351"] = 342,["352"] = 344,["353"] = 349,["355"] = 351,["358"] = 339,["362"] = 355,["364"] = 356,["365"] = 357,["366"] = 357,["368"] = 358,["369"] = 359,["370"] = 359,["371"] = 359,["372"] = 359,["374"] = 361,["375"] = 362,["380"] = 366,["381"] = 367,["382"] = 368,["383"] = 368,["384"] = 368,["385"] = 368,["386"] = 369,["387"] = 371,["388"] = 372,["390"] = 377,["391"] = 378,["393"] = 381,["394"] = 259,["395"] = 384,["396"] = 388,["397"] = 389,["400"] = 391,["401"] = 392,["402"] = 393,["403"] = 394,["404"] = 395,["405"] = 396,["406"] = 397,["407"] = 398,["410"] = 401,["412"] = 404,["414"] = 405,["415"] = 405,["417"] = 406,["418"] = 407,["419"] = 408,["420"] = 409,["425"] = 384,["426"] = 414,["427"] = 415,["428"] = 416,["429"] = 417,["430"] = 421,["432"] = 423,["433"] = 414,["434"] = 426,["435"] = 427,["436"] = 426,["437"] = 51});
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
    if oldHero:GetUnitName() == newHeroClass and not options.resetHeroLevel then
        if options.appearance then
            self:applyPreset(oldHero, options.appearance)
        end
        return oldHero
    end
    local savedPos = oldHero:GetAbsOrigin()
    local savedForward = oldHero:GetForwardVector()
    local resetHeroLevel = options.resetHeroLevel == true
    local savedLevel = resetHeroLevel and 1 or oldHero:GetLevel()
    local savedXp = resetHeroLevel and 0 or oldHero:GetCurrentXP()
    local savedGold = PlayerResource:GetGold(playerId)
    local savedHpPct = resetHeroLevel and 1 or math.max(
        0.05,
        oldHero:GetHealthPercent() / 100
    )
    local savedMpPct = resetHeroLevel and 1 or math.max(
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
    do
        local slot = 0
        while slot <= 16 do
            local item = oldHero:GetItemInSlot(slot)
            if item and not item:IsNull() and IsValidEntity(item) then
                oldHero:TakeItem(item)
                newHero:AddItem(item)
            end
            slot = slot + 1
        end
    end
    if oldHero ~= newHero and not oldHero:IsNull() and IsValidEntity(oldHero) then
        GameRules:GetGameModeEntity():SetContextThink(
            DoUniqueString("EvoRemoveOldHero"),
            function()
                if not oldHero:IsNull() and IsValidEntity(oldHero) then
                    UTIL_Remove(oldHero)
                end
                return nil
            end,
            0.05
        )
    end
    if resetHeroLevel then
        newHero:SetAbilityPoints(1)
    else
        while newHero:GetLevel() < savedLevel do
            newHero:HeroLevelUp(false)
        end
    end
    if options.stripDefaultAbilities == true then
        do
            local i = 0
            while i < newHero:GetAbilityCount() do
                do
                    local ability = newHero:GetAbilityByIndex(i)
                    if not ability or ability:IsNull() then
                        goto __continue82
                    end
                    local name = ability:GetAbilityName()
                    if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or name == "generic_hidden" or KEEP_MAP_UTILITY_ABILITIES:has(name) then
                        goto __continue82
                    end
                    newHero:RemoveAbilityByHandle(ability)
                end
                ::__continue82::
                i = i + 1
            end
        end
    end
    for ____, saved in ipairs(savedAbilities) do
        do
            local ability = newHero:FindAbilityByName(saved.name) or newHero:AddAbility(saved.name)
            if not ability or ability:IsNull() then
                goto __continue85
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
        ::__continue85::
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
                goto __continue97
            end
            local modelEnt = wearable
            modelEnt:SetRenderColor(color[1], color[2], color[3])
            if state.alpha ~= nil then
                modelEnt:SetRenderAlpha(state.alpha)
            end
        end
        ::__continue97::
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
