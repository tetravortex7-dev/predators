function Experience(kv)
    local caster = kv.caster
    if not caster or caster:IsNull() then return end

    local level = caster:GetLevel()

    if not XP_TABLE[level + 1] then return end

    local currentXP = caster:GetCurrentXP()
    local nextLevelXP = XP_TABLE[level + 1]

    local xpToGive = math.max(nextLevelXP - currentXP, 0)

    caster:AddExperience(
        xpToGive,
        DOTA_ModifyXP_Unspecified,
        false,
        false
    )
end