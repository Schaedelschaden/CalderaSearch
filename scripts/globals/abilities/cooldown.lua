-----------------------------------
-- Ability: Cooldown
-- Reduces the strain on your automaton.
-- Obtained: Puppetmaster Level 95
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onUseAbility(player, target, ability)

	local burden = -30
	
	player:delStatusEffect(tpz.effect.OVERLOAD)
	
	player:addBurden(tpz.magic.ele.EARTH-1, burden)
	player:addBurden(tpz.magic.ele.WATER-1, burden)
	player:addBurden(tpz.magic.ele.WIND-1, burden)
	player:addBurden(tpz.magic.ele.FIRE-1, burden)
	player:addBurden(tpz.magic.ele.ICE-1, burden)
	player:addBurden(tpz.magic.ele.THUNDER-1, burden)
	player:addBurden(tpz.magic.ele.LIGHT-1, burden)
	player:addBurden(tpz.magic.ele.DARK-1, burden)
	
--	printf("tactical_switch.lua onUseAbility MASTER TP: [%i]  PET TP: [%i]  BONUS: [x%1.2f]", masterTP, petTP, bonus)
end