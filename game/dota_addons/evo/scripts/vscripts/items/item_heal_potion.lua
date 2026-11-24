function heal(keys)
	if IsServer() then
		--local ability = keys.ability
		local heal = 25 / 10

		local hpreg = keys.target:GetMaxHealth() * 0.01 + heal / 10 --10%hp + 2.5 per tick in total: 10%hp + 250
		keys.target:Heal(hpreg,keys.target)
	end
end