-----------------------------------
-- Ability: Subtle Sorcery
-- Reduces the amount of enmity generated from magic spells and increases magic accuracy.  
-- Obtained: Black Mage Level 96
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.SUBTLE_SORCERY, 10000, 0, 60)
end
