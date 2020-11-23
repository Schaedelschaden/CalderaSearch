-----------------------------------
-- Ability: Inner Strength
-- Increases your Maximum HP.
-- Obtained: Monk Level 96
-- Recast Time: 1:00:00
-- Duration: 0:30
-- Author: Schaedel
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local MaxHP = player:getMaxHP()
	local HPHealed = MaxHP * 0.51 + 100
	
	player:addStatusEffect(tpz.effect.INNER_STRENGTH,1,0,30)
	target:restoreHP(HPHealed)
end
