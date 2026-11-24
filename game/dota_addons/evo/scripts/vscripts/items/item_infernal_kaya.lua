if item_infernal_kaya == nil then item_infernal_kaya = class({}) end

LinkLuaModifier("modifier_infernal_kaya_passive","items/item_infernal_kaya",LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_infernal_kaya_active","items/item_infernal_kaya",LUA_MODIFIER_MOTION_NONE)

function item_infernal_kaya:GetIntrinsicModifierName(  )
	return "modifier_infernal_kaya_passive"
end

function item_infernal_kaya:OnSpellStart() 
	local caster = self:GetCaster()
	if IsServer() and caster:IsRealHero() and not caster:HasModifier("modifier_infernal_kaya_active") then
		caster:AddNewModifier(caster,self,"modifier_infernal_kaya_active",{duration = self:GetSpecialValueFor("duration")})
	end
end

if modifier_infernal_kaya_passive == nil then modifier_infernal_kaya_passive = class({}) end

function modifier_infernal_kaya_passive:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_infernal_kaya_passive:IsHidden() return true end

function modifier_infernal_kaya_passive:IsPurgable() return false end

function modifier_infernal_kaya_passive:DeclareFunctions()
	local funcs = {MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING,MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE}
	return funcs
end

function modifier_infernal_kaya_passive:OnCreated() 
	local ability = self:GetAbility()
	if not ability then return end
	self.manacost = ability:GetSpecialValueFor("manacost")
	self.act_manacost = ability:GetSpecialValueFor("act_manacost")
	self.amp = ability:GetSpecialValueFor("amp")
	self.act_amp = ability:GetSpecialValueFor("act_amp")
	self.int = ability:GetSpecialValueFor("int")
end

function modifier_infernal_kaya_passive:OnRefresh()
	self:OnCreated()
end

function modifier_infernal_kaya_passive:GetModifierPercentageManacostStacking() 
	local caster = self:GetCaster()
	if caster:HasModifier("modifier_infernal_kaya_active") then
		-- Target is 500% cost (incremental increase of 400%)
		-- We subtract 400 from the current percentage.
		-- If passive is 22%, return 22 - 400 = -378. 
		-- Result cost = base * (1 - (-3.78)) = base * 4.78.
		-- To get exactly 5x base cost regardless of passive: return -400
		-- To get exactly 5x REDUCED cost: return self.manacost - 400
		return self.manacost - 400 
	end
	return self.manacost
end


function modifier_infernal_kaya_passive:GetModifierBonusStats_Intellect() 
	return self.int 
end

function modifier_infernal_kaya_passive:GetModifierSpellAmplify_Percentage() 
	local caster = self:GetCaster()
	if caster:HasModifier("modifier_infernal_kaya_active") then
		return self.act_amp + self.amp
	end
	return self.amp 
end

if modifier_infernal_kaya_active == nil then modifier_infernal_kaya_active = class({}) end

function modifier_infernal_kaya_active:IsPurgable() return true end

function modifier_infernal_kaya_active:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_infernal_kaya_active:GetTexture(  )
	return self:GetAbility():GetName()
end