---------------------------------------------
-- Scream
-- 15' Reduces MND of players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(306)
    return 0
end

function onPetAbility(target, pet, skill)

end