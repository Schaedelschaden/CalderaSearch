-----------------------------------
-- Ability: Larceny
-- Steals one beneficial effect from the target enemy. 
-- Obtained: Thief Level 96
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability,action)
	player:stealStatusEffect(target)
	target:dispelStatusEffect()
end