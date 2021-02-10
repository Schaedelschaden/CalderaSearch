-----------------------------------
-- Ability: Sneak Attack
-- Deals critical damage when striking from behind.
-- Obtained: Thief Level 15
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:hasStatusEffect(tpz.effect.CLIMACTIC_FLOURISH) or 
		player:hasStatusEffect(tpz.effect.STRIKING_FLOURISH) or
		player:hasStatusEffect(tpz.effect.TERNARY_FLOURISH)) then
		return tpz.msg.basic.STATUS_PREVENTS,0
	else
		return 0,0
	end
end

function onUseAbility(player, target, ability)
   player:addStatusEffect(tpz.effect.SNEAK_ATTACK, 1, 0, 60)
end