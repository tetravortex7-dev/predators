if item_hand_of_midas_custom == nil then item_hand_of_midas_custom = class({}) end

LinkLuaModifier("modifier_hand_of_midas_custom_passive","items/item_hand_of_midas_custom.lua",LUA_MODIFIER_MOTION_NONE)

function item_hand_of_midas_custom:OnSpellStart( event )
	local target = self:GetCursorTarget()
	local caster = self:GetCaster()
	local gold = 1.2 * caster:GetLevel()  + 1.50 * RandomFloat(target:GetMinimumGoldBounty(),target:GetMaximumGoldBounty())
	local exp =  1.2 * caster:GetLevel() + 1.50 * target:GetDeathXP() 
	local hero = caster:GetPlayerOwner():GetAssignedHero()

	if target:IsBoss() or target:IsAncient() or target:IsMagicImmune() then return end
		hero:AddExperience(exp, false,false)
		hero:ModifyGold(gold,true,0)
		SendOverheadEventMessage( caster,  OVERHEAD_ALERT_GOLD , target, gold, nil )
	target:EmitSound("DOTA_Item.Hand_Of_Midas")

	local midas_particle = ParticleManager:CreateParticle("particles/items2_fx/hand_of_midas.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)  
    ParticleManager:SetParticleControlEnt(midas_particle, 1, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), false)

    target:SetDeathXP(0)
    target:SetMinimumGoldBounty(0)
    target:SetMaximumGoldBounty(0)
    target:Kill(self, caster)
end

if modifier_hand_of_midas_custom_passive == nil then modifier_hand_of_midas_custom_passive = class({}) end

function modifier_hand_of_midas_custom_passive:IsHidden(  )
	return true
end

function modifier_hand_of_midas_custom_passive:IsPurgable(  )
	return false
end

function modifier_hand_of_midas_custom_passive:DeclareFunctions(  )
	return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

function modifier_hand_of_midas_custom_passive:GetModifierAttackSpeedBonus_Constant(  )
	return self:GetAbility():GetSpecialValueFor("atk")
end