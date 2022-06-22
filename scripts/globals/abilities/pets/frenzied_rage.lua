---------------------------------------------
-- Frenzied Rage
-- Increases attack by 20% for the pet and master.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	
	-- pet:useMobAbility(481)
	
    return 0
end

function onPetAbility(target, pet, skill)

end