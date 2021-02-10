---------------------------------------------------
-- Big Scissors: Deals damage to a single target.
-- Nightmare Crabs ignore shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(444)
    return 0
end

function onPetAbility(target, pet, skill)

end