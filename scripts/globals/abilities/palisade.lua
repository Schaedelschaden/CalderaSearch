-----------------------------------
-- Ability: Palisade
-- Increases chance of blocking with shield, and eliminates enmity loss.  
-- Obtained: Paladin Level 95
-- Recast Time: 05:00
-- Duration: 01:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability)
	player:addStatusEffect(tpz.effect.PALISADE,1,0,60)
end
