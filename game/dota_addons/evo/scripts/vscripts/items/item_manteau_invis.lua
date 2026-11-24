LinkLuaModifier("modifier_item_manteau_invis_passive", "items/item_manteau_invis", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_manteau_invis_active", "items/item_manteau_invis", LUA_MODIFIER_MOTION_NONE)

item_manteau_invis = class({})

function item_manteau_invis:GetIntrinsicModifierName()
    return "modifier_item_manteau_invis_passive"
end

function item_manteau_invis:OnSpellStart()
    local caster = self:GetCaster()
    local fade_time = self:GetSpecialValueFor("windwalk_fade_time")
    local duration = self:GetSpecialValueFor("windwalk_duration")

    caster:EmitSound("DOTA_Item.InvisibilitySword.Activate")

    -- Add a delay for the fade time
    Timers:CreateTimer(fade_time, function()
        if caster:IsAlive() then
            caster:AddNewModifier(caster, self, "modifier_item_manteau_invis_active", {duration = duration})
        end
    end)
end

--------------------------------------------------------------------------------
-- Passive Modifier
--------------------------------------------------------------------------------
modifier_item_manteau_invis_passive = class({})

function modifier_item_manteau_invis_passive:IsHidden() return true end
function modifier_item_manteau_invis_passive:IsPurgable() return false end
function modifier_item_manteau_invis_passive:RemoveOnDeath() return false end
function modifier_item_manteau_invis_passive:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_manteau_invis_passive:OnCreated()
    if not IsServer() then return end
end

function modifier_item_manteau_invis_passive:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_BONUS,
    }
end

function modifier_item_manteau_invis_passive:GetModifierPreAttack_BonusDamage()
    return self:GetAbility():GetSpecialValueFor("dmg")
end

function modifier_item_manteau_invis_passive:GetModifierBonusStats_Strength()
    return self:GetAbility():GetSpecialValueFor("attributes")
end

function modifier_item_manteau_invis_passive:GetModifierBonusStats_Agility()
    return self:GetAbility():GetSpecialValueFor("attributes")
end

function modifier_item_manteau_invis_passive:GetModifierBonusStats_Intellect()
    return self:GetAbility():GetSpecialValueFor("attributes")
end

function modifier_item_manteau_invis_passive:GetModifierMagicalResistanceBonus()
    return self:GetAbility():GetSpecialValueFor("resist")
end

function modifier_item_manteau_invis_passive:GetModifierMoveSpeedBonus_Percentage()
    return self:GetAbility():GetSpecialValueFor("speeda")
end

function modifier_item_manteau_invis_passive:GetModifierHealthBonus()
    return self:GetAbility():GetSpecialValueFor("health")
end

-- HIDING: Not visible on minimap for enemies.
function modifier_item_manteau_invis_passive:CheckState()
    return {
        [MODIFIER_STATE_NOT_ON_MINIMAP_FOR_ENEMIES] = true,
    }
end

--------------------------------------------------------------------------------
-- Active Modifier (Lothar's Edge)
--------------------------------------------------------------------------------
modifier_item_manteau_invis_active = class({})

function modifier_item_manteau_invis_active:IsHidden() return false end
function modifier_item_manteau_invis_active:IsPurgable() return true end

function modifier_item_manteau_invis_active:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_EVENT_ON_ABILITY_EXECUTED,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
end

function modifier_item_manteau_invis_active:GetModifierInvisibilityLevel()
    return 1
end

function modifier_item_manteau_invis_active:GetModifierMoveSpeedBonus_Percentage()
    return self:GetAbility():GetSpecialValueFor("windwalk_bonus_movement_speed_percentage")
end

function modifier_item_manteau_invis_active:CheckState()
    return {
        [MODIFIER_STATE_INVISIBLE] = true,
        [MODIFIER_STATE_NO_UNIT_COLLISION] = true,
    }
end

function modifier_item_manteau_invis_active:OnAbilityExecuted(keys)
    if not IsServer() then return end
    if keys.unit == self:GetParent() then
        self:Destroy()
    end
end

function modifier_item_manteau_invis_active:OnAttackLanded(keys)
    if not IsServer() then return end
    if keys.attacker == self:GetParent() then
        -- Apply bonus damage from shadow walk
        local bonus_dmg = self:GetAbility():GetSpecialValueFor("windwalk_bonus_damage")
        if bonus_dmg > 0 then
            ApplyDamage({
                victim = keys.target,
                attacker = self:GetParent(),
                damage = bonus_dmg,
                damage_type = DAMAGE_TYPE_PHYSICAL,
                ability = self:GetAbility(),
            })
        end
        self:Destroy()
    end
end
