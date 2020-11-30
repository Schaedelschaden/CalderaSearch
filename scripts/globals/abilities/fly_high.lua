-----------------------------------
-- Ability: Fly High
-- Decreases the recast time of jumps. 
-- Obtained: Dragoon Level 96
-- Recast Time: 1:00:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability)
	player:addStatusEffect(tpz.effect.FLY_HIGH,1,0,30)
	player:setRecast(158, 0)
	player:setRecast(159, 0)
	player:setRecast(160, 0)
	player:setRecast(166, 0)
	player:setRecast(167, 0)
end