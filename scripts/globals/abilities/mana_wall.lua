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
	local power = 50 + player:getMod(tpz.mod.ENH_MANAWALL)
	player:addStatusEffect(tpz.effect.MANA_WALL, power, 0, 300)
end