---------------------------------------------
-- Noisome Powder
-- Reduces attack of targets in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2179)
    return 0
end

function onPetAbility(target, pet, skill)

end