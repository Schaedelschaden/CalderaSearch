---------------------------------------------
-- Sand Pit
-- Single target bind
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(276)
    return 0
end

function onPetAbility(target, pet, skill)

end