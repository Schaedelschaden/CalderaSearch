-----------------------------------
-- Ability: Asylum
-- Grants party members a powerful resistance to enfeebling magic and Dispel effects. 
-- Obtained: White Mage Level 96
-- Recast Time: 1:00:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.ASYLUM, 1, 0, 30)
end