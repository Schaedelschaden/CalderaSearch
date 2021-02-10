---------------------------------------------
-- Hi-Freq Field
-- Lowers the evasion of enemies in a fan-shaped area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(339)
    return 0
end

function onPetAbility(target, pet, skill)

end