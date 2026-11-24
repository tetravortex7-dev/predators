if item_asura_staff == nil then item_asura_staff = class({}) end

LinkLuaModifier("modifier_asura_staff_passive","items/item_asura_staff",LUA_MODIFIER_MOTION_NONE)

function item_asura_staff:GetIntrinsicModifierName(  )
	return "modifier_asura_staff_passive"
end

if modifier_asura_staff_passive == nil then modifier_asura_staff_passive = class({}) end

function modifier_asura_staff_passive:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_asura_staff_passive:IsHidden() return true end

function modifier_asura_staff_passive:IsPurgable() return false end

function modifier_asura_staff_passive:DeclareFunctions()
	local funcs = {MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING,MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE}
	return funcs
end

function modifier_asura_staff_passive:OnCreated() 
	local ability = self:GetAbility()
	if not ability then return end
	self.manacost = ability:GetSpecialValueFor("manacost")
	self.amp = ability:GetSpecialValueFor("amp")
	self.int = ability:GetSpecialValueFor("int")
end

function modifier_asura_staff_passive:OnRefresh()
	self:OnCreated()
end

function modifier_asura_staff_passive:GetModifierPercentageManacostStacking() return self.manacost end


function modifier_asura_staff_passive:GetModifierBonusStats_Intellect() return self.int end

function modifier_asura_staff_passive:GetModifierSpellAmplify_Percentage() return self.amp end