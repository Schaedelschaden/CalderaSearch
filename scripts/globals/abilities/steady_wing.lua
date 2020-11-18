-----------------------------------
-- Ability: Steady Wing
-- Creates a barrier that temporarily absorbs a certain amount of damage dealt to your wyvern.  
-- Obtained: Dragoon Level 95
-- Recast Time: 05:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasPet()) then
		return 0,0
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	end
end

function onUseAbility(player,target,ability)
	local pet = player:getPet()
	local petmaxHP = pet:getMaxHP()
	local petcurrentHP = pet:getHP()
	
	pet:delStatusEffect(tpz.effect.STONESKIN)
	
--	printf("Pet Current HP: [%i]  Pet Max HP: [%i]\n", petcurrentHP, petmaxHP)
	
	local strength = ((1.3 * petmaxHP) + (petmaxHP - petcurrentHP))
--	printf("Strength: [%i]\n", strength)

	pet:addStatusEffect(tpz.effect.STONESKIN, strength, 0, 180, 0, 0, 4)

    return tpz.effect.STONESKIN
end
