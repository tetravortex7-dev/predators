local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 6,["20"] = 8,["21"] = 9,["24"] = 11,["25"] = 12,["26"] = 13,["29"] = 15,["30"] = 16,["33"] = 18,["34"] = 19,["35"] = 20,["36"] = 21,["37"] = 22,["38"] = 23,["41"] = 26,["42"] = 27,["43"] = 28,["44"] = 29,["45"] = 29,["46"] = 29,["47"] = 29,["48"] = 29,["49"] = 29,["52"] = 33,["53"] = 34,["54"] = 35,["56"] = 38,["57"] = 5,["58"] = 42,["59"] = 43,["60"] = 42,["61"] = 43,["62"] = 43,["63"] = 42,["64"] = 43,["66"] = 43,["67"] = 45,["68"] = 46,["69"] = 45,["70"] = 46,["71"] = 46,["72"] = 45,["73"] = 46,["75"] = 46});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerItem = ____dota_ts_adapter.registerItem
local ____bosses_catalog = require("data.bosses_catalog")
local getBossDefinitionByCoreItem = ____bosses_catalog.getBossDefinitionByCoreItem
local EvoBossCoreItemBase = __TS__Class()
EvoBossCoreItemBase.name = "EvoBossCoreItemBase"
__TS__ClassExtends(EvoBossCoreItemBase, BaseItem)
function EvoBossCoreItemBase.prototype.OnSpellStart(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() or not IsValidEntity(caster) or not caster:IsRealHero() then
        return
    end
    local itemName = self:GetAbilityName()
    local bossDef = getBossDefinitionByCoreItem(nil, itemName)
    if not bossDef then
        return
    end
    local playerId = caster:GetPlayerOwnerID()
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    local grantedName = bossDef.grantedAbilityName
    local existing = caster:FindAbilityByName(grantedName)
    if existing then
        local maxLevel = existing:GetMaxLevel()
        if existing:GetLevel() < maxLevel then
            existing:SetLevel(existing:GetLevel() + 1)
        end
    else
        local added = caster:AddAbility(grantedName)
        if added ~= nil then
            added:SetLevel(1)
            PrecacheUnitByNameAsync(
                bossDef.ownerHeroName,
                function()
                end,
                playerId
            )
        end
    end
    EmitSoundOn("Hero_Omniknight.GuardianAngel.Cast", caster)
    if IsInToolsMode() then
        GameRules:SendCustomMessage("[Evo] Boss Core assimilated: " .. grantedName, 0, 0)
    end
    caster:RemoveItem(self)
end
____exports.item_evo_boss_core_alpha = __TS__Class()
local item_evo_boss_core_alpha = ____exports.item_evo_boss_core_alpha
item_evo_boss_core_alpha.name = "item_evo_boss_core_alpha"
__TS__ClassExtends(item_evo_boss_core_alpha, EvoBossCoreItemBase)
item_evo_boss_core_alpha = __TS__DecorateLegacy(
    {registerItem(nil, "item_evo_boss_core_alpha")},
    item_evo_boss_core_alpha
)
____exports.item_evo_boss_core_alpha = item_evo_boss_core_alpha
____exports.item_evo_boss_core_beta = __TS__Class()
local item_evo_boss_core_beta = ____exports.item_evo_boss_core_beta
item_evo_boss_core_beta.name = "item_evo_boss_core_beta"
__TS__ClassExtends(item_evo_boss_core_beta, EvoBossCoreItemBase)
item_evo_boss_core_beta = __TS__DecorateLegacy(
    {registerItem(nil, "item_evo_boss_core_beta")},
    item_evo_boss_core_beta
)
____exports.item_evo_boss_core_beta = item_evo_boss_core_beta
return ____exports
