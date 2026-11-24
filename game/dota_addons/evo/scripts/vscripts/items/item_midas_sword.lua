if item_midas_sword == nil then item_midas_sword = class({}) end

LinkLuaModifier("modifier_midas_sword_passive","items/item_midas_sword.lua",LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_midas_sword_gold","items/item_midas_sword.lua",LUA_MODIFIER_MOTION_NONE)

function item_midas_sword:OnSpellStart(  )
	local target = self:GetCursorTarget()
	
	local caster = self:GetCaster()
	local hero = caster
	local target_gold = caster:GetLevel() * 0.2 * RandomFloat(target:GetMinimumGoldBounty(),target:GetMaximumGoldBounty())
	local gold = self:GetSpecialValueFor("gold_active") + target_gold
	local exp = self:GetSpecialValueFor("exp")

	if not target
	or target:IsHero()
	or target:IsBoss()
	or target:IsAncient()
	or target:IsMagicImmune()
	then
		return
	end
	
	hero:AddExperience(target:GetDeathXP() * exp * 0.01, false,true) 
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

function item_midas_sword:GetIntrinsicModifierName(  )
	return "modifier_midas_sword_passive"
end

if modifier_midas_sword_passive == nil then modifier_midas_sword_passive = class({}) end

function modifier_midas_sword_passive:GetAttributes(  )
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_midas_sword_passive:IsHidden(  )
	return false
end

function modifier_midas_sword_passive:IsPurgable(  )
	return false
end

function modifier_midas_sword_passive:DeclareFunctions(  )
	return {MODIFIER_PROPERTY_MANA_BONUS,MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

function modifier_midas_sword_passive:GetModifierAttackSpeedBonus_Constant(  )
	return self:GetAbility():GetSpecialValueFor("atk")
end

function modifier_midas_sword_passive:GetModifierManaBonus(  )
	return self:GetAbility():GetSpecialValueFor("mana")
end

function modifier_midas_sword_passive:OnCreated(  )
	if not IsServer() then return end

	local caster = self:GetCaster()
	if not caster or caster:IsNull() then return end
	if not caster:HasModifier("modifier_midas_sword_gold") then
		caster:AddNewModifier(
			caster,
			self:GetAbility(),
			"modifier_midas_sword_gold",
			{}
		)
	end
end

function modifier_midas_sword_passive:OnDestroy(  )
	local caster = self:GetCaster()
	if not caster or caster:IsNull() then return end
end

if modifier_midas_sword_gold == nil then modifier_midas_sword_gold = class({}) end

function modifier_midas_sword_gold:IsHidden(  )
	return true
end

function modifier_midas_sword_gold:IsPurgable(  )
	return false
end

function modifier_midas_sword_gold:DeclareFunctions(  )
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

function modifier_midas_sword_gold:OnAttackLanded( params )
	if not IsServer() then return end
	local ability = self:GetAbility()
	if not ability then return end
	local caster = self:GetCaster()
	if params.target:IsBuilding() or params.target:IsOther() then return end
	
	if not RollPercentage(ability:GetSpecialValueFor("gold_chance")) then return end
	
	if caster:IsRealHero() and params.attacker == caster then
			local vec1 = RandomFloat(0,360)
			local vec2 = RandomFloat(0,360)
			local id0 = ParticleManager:CreateParticle("particles/courier_flopjaw_ambient_coins_gold_custom.vpcf",PATTACH_OVERHEAD_FOLLOW, caster)
			ParticleManager:SetParticleControlEnt(id0, 1, caster, PATTACH_OVERHEAD_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), false)
			ParticleManager:SetParticleControlForward(id0, 1, Vector(vec1,vec2,0))
			SendOverheadEventMessage( caster,  OVERHEAD_ALERT_GOLD , params.target, 5, nil )
			params.target:EmitSound("DOTA_Item.Hand_Of_Midas")
			caster:ModifyGold(ability:GetSpecialValueFor("gold"),true,0)
			Timers:CreateTimer({endTime = 0.3, callback = function() ParticleManager:DestroyParticle(id0,false) ParticleManager:ReleaseParticleIndex(id0) end})
	end
end