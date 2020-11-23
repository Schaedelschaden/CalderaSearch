-----------------------------------
-- Ability: Mana Wall
-- Allows you to take damage with MP.
-- Obtained: Black Mage Level 76
-- Recast Time: 5:00
-- Duration: 10:00 (base)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
	player:addStatusEffect(tpz.effect.MANA_WALL,1,0,300)
end
