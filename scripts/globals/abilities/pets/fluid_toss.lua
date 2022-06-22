---------------------------------------------
--  Fluid Toss
--  Description: Lobs a ball of liquid at a single target.
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	
	pet:useMobAbility(432)
	
    return 0
end

function onPetAbility(target, pet, skill)
	
end