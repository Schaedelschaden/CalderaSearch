---------------------------------------------
--  ??? Needles
--
--  Description: Shoots multiple needles at enemies within range.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	local abilitySelector = math.random(1,100)
	
	if (abilitySelector > 90 and abilitySelector <= 100) then
		pet:useMobAbility(1120) -- 10000 Needles
	elseif (abilitySelector > 70 and abilitySelector <= 90) then
		pet:useMobAbility(1626) -- 4000 Needles
	elseif (abilitySelector > 40 and abilitySelector <= 70) then
		pet:useMobAbility(1625) -- 2000 Needles
	elseif (abilitySelector <= 40) then
		pet:useMobAbility(322) -- 1000 Needles
	end
	
    return 0
end

function onPetAbility(target, pet, skill)

end