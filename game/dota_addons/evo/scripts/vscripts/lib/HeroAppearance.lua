local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Map = ____lualib.Map
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 45,["14"] = 47,["15"] = 47,["16"] = 47,["17"] = 47,["18"] = 47,["19"] = 47,["20"] = 47,["21"] = 55,["22"] = 55,["23"] = 55,["25"] = 55,["26"] = 58,["27"] = 59,["30"] = 60,["31"] = 58,["32"] = 63,["33"] = 70,["36"] = 71,["37"] = 71,["38"] = 71,["39"] = 71,["40"] = 71,["41"] = 71,["42"] = 71,["43"] = 72,["44"] = 72,["45"] = 72,["46"] = 72,["47"] = 72,["48"] = 72,["49"] = 72,["50"] = 73,["51"] = 73,["52"] = 73,["53"] = 73,["54"] = 73,["55"] = 73,["56"] = 73,["57"] = 74,["58"] = 75,["59"] = 75,["60"] = 75,["61"] = 75,["62"] = 75,["63"] = 75,["64"] = 77,["65"] = 78,["66"] = 79,["67"] = 80,["69"] = 83,["70"] = 84,["71"] = 85,["73"] = 88,["74"] = 63,["75"] = 91,["76"] = 92,["77"] = 92,["78"] = 92,["79"] = 92,["80"] = 92,["81"] = 92,["82"] = 92,["83"] = 91,["84"] = 95,["85"] = 96,["88"] = 97,["89"] = 98,["90"] = 99,["91"] = 100,["93"] = 102,["95"] = 95,["96"] = 106,["97"] = 107,["100"] = 108,["101"] = 109,["102"] = 110,["103"] = 111,["105"] = 113,["107"] = 106,["108"] = 117,["109"] = 118,["112"] = 119,["113"] = 120,["116"] = 122,["117"] = 123,["118"] = 124,["120"] = 126,["121"] = 128,["122"] = 129,["123"] = 130,["126"] = 133,["127"] = 117,["128"] = 136,["129"] = 140,["130"] = 141,["131"] = 142,["133"] = 144,["134"] = 145,["135"] = 146,["136"] = 147,["141"] = 136,["142"] = 154,["143"] = 158,["144"] = 159,["146"] = 161,["147"] = 162,["149"] = 154,["150"] = 166,["151"] = 167,["154"] = 168,["155"] = 170,["156"] = 172,["158"] = 173,["159"] = 173,["161"] = 175,["162"] = 179,["163"] = 179,["165"] = 180,["166"] = 182,["167"] = 183,["168"] = 184,["170"] = 186,["171"] = 187,["173"] = 190,["174"] = 190,["175"] = 192,["176"] = 193,["178"] = 194,["179"] = 194,["181"] = 195,["182"] = 200,["183"] = 200,["191"] = 166,["192"] = 206,["193"] = 209,["194"] = 209,["196"] = 211,["199"] = 213,["200"] = 214,["202"] = 217,["203"] = 218,["204"] = 219,["205"] = 220,["206"] = 220,["207"] = 220,["209"] = 220,["210"] = 224,["211"] = 225,["213"] = 206,["214"] = 229,["215"] = 230,["218"] = 232,["219"] = 233,["220"] = 234,["222"] = 237,["223"] = 238,["224"] = 239,["225"] = 240,["227"] = 243,["228"] = 244,["230"] = 247,["231"] = 248,["232"] = 248,["233"] = 248,["234"] = 248,["235"] = 248,["236"] = 248,["237"] = 248,["238"] = 249,["239"] = 250,["240"] = 251,["241"] = 252,["242"] = 252,["243"] = 252,["244"] = 252,["245"] = 252,["246"] = 252,["247"] = 252,["249"] = 255,["250"] = 256,["252"] = 259,["253"] = 260,["255"] = 229,["256"] = 264,["257"] = 267,["258"] = 267,["260"] = 269,["261"] = 269,["263"] = 271,["264"] = 272,["265"] = 272,["267"] = 274,["268"] = 275,["269"] = 276,["271"] = 278,["273"] = 281,["274"] = 283,["275"] = 284,["276"] = 285,["278"] = 286,["279"] = 287,["280"] = 287,["282"] = 288,["283"] = 288,["284"] = 288,["285"] = 288,["286"] = 288,["291"] = 296,["292"] = 298,["293"] = 299,["294"] = 301,["295"] = 307,["296"] = 308,["297"] = 309,["299"] = 312,["300"] = 313,["301"] = 313,["302"] = 315,["303"] = 316,["304"] = 317,["306"] = 319,["307"] = 313,["308"] = 313,["309"] = 313,["311"] = 325,["312"] = 326,["314"] = 328,["315"] = 329,["318"] = 333,["320"] = 334,["321"] = 334,["323"] = 335,["324"] = 336,["325"] = 336,["327"] = 337,["328"] = 339,["329"] = 344,["331"] = 346,["334"] = 334,["338"] = 350,["340"] = 351,["341"] = 352,["342"] = 352,["344"] = 353,["345"] = 354,["346"] = 354,["347"] = 354,["348"] = 354,["350"] = 356,["351"] = 357,["356"] = 361,["357"] = 363,["358"] = 364,["360"] = 367,["361"] = 264,["362"] = 370,["363"] = 374,["364"] = 375,["367"] = 377,["368"] = 378,["369"] = 379,["370"] = 380,["371"] = 381,["372"] = 382,["373"] = 383,["374"] = 384,["377"] = 387,["379"] = 390,["381"] = 391,["382"] = 391,["384"] = 392,["385"] = 393,["386"] = 394,["387"] = 395,["392"] = 370,["393"] = 400,["394"] = 401,["395"] = 402,["396"] = 403,["397"] = 407,["399"] = 409,["400"] = 400,["401"] = 412,["402"] = 413,["403"] = 412,["404"] = 56});
local ____exports = {}
local ____hero_state_transfer = require("lib.hero_state_transfer")
local captureHeroTransferState = ____hero_state_transfer.captureHeroTransferState
local restoreHeroTransferState = ____hero_state_transfer.restoreHeroTransferState
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
    local resetHeroLevel = options.resetHeroLevel == true
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
    local transferSnapshot = captureHeroTransferState(nil, playerId, oldHero, resetHeroLevel)
    self:clearCustomWearables(oldHero)
    self.stateByHero:delete(oldHero:entindex())
    PlayerResource:ReplaceHeroWithNoTransfer(playerId, newHeroClass, transferSnapshot.totalGold, transferSnapshot.xp)
    local newHero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not newHero or newHero:IsNull() or not IsValidEntity(newHero) then
        return nil
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
        while newHero:GetLevel() < transferSnapshot.level do
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
                        goto __continue80
                    end
                    local name = ability:GetAbilityName()
                    if __TS__StringStartsWith(name, "special_bonus_") or __TS__StringStartsWith(name, "evo_empty_slot_") or name == "generic_hidden" or KEEP_MAP_UTILITY_ABILITIES:has(name) then
                        goto __continue80
                    end
                    newHero:RemoveAbilityByHandle(ability)
                end
                ::__continue80::
                i = i + 1
            end
        end
    end
    for ____, saved in ipairs(savedAbilities) do
        do
            local ability = newHero:FindAbilityByName(saved.name) or newHero:AddAbility(saved.name)
            if not ability or ability:IsNull() then
                goto __continue83
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
        ::__continue83::
    end
    restoreHeroTransferState(nil, playerId, newHero, transferSnapshot)
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
                goto __continue94
            end
            local modelEnt = wearable
            modelEnt:SetRenderColor(color[1], color[2], color[3])
            if state.alpha ~= nil then
                modelEnt:SetRenderAlpha(state.alpha)
            end
        end
        ::__continue94::
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
