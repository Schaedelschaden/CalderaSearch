-----------------------------------
-- Ability: Cascade
-- Grants a damage bonus to the next elemental magic spell cast based on TP consumed.
-- Obtained: Black Mage Level 85
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
	local TP = player:getTP() / 10
	player:addStatusEffect(tpz.effect.CASCADE, TP, 0, 60)
	player:setTP(0)
end
