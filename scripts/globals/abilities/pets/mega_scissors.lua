---------------------------------------------------
-- Mega Scissors: Deals damage to multiple targets (conal), wipes Utsusemi and resets hate.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	
	pet:useMobAbility(2513)
	
    return 0
end

function onPetAbility(target, pet, skill)

end