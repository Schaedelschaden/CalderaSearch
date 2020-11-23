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
	-- All Jump recast times are reset
    player:resetRecast(tpz.recast.ABILITY, 158) -- Jump/Spirit Jump
    player:resetRecast(tpz.recast.ABILITY, 159) -- High Jump/Soul Jump
    player:resetRecast(tpz.recast.ABILITY, 160) -- Super Jump
end
