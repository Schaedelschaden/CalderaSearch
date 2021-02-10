---------------------------------------------------
-- Lamb Chop
-- Deals critical damage.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(260)
    return 0
end

function onPetAbility(target, pet, skill)

end