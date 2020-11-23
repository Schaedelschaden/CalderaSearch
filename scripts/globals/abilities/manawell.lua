-----------------------------------
-- Ability: Manawell
-- Eliminates the cost of the next magic spell the target casts. 
-- Obtained: Black Mage Level 95
-- Recast Time: 10:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.MANAWELL, 1, 0, 60)
end
