---------------------------------------------
-- Rhinowrecker
-- Deals physical damage to enemies within a fan-shaped area in front of pet.
-- Additional effect: Decreases defense (DEF-25%) Damage varies with TP.
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	
	pet:useMobAbility(2823)
	
    return 0
end

function onPetAbility(target, pet, skill)
	
end