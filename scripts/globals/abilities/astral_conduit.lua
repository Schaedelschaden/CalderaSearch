-----------------------------------
-- Ability: Astral Conduit
-- Reduces Blood Pact recast times.
-- Obtained: Summoner Level 96
-- Recast Time: 1:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability)
	local maxMP = player:getMaxMP()
	
	-- Recover 100% of current MP
	player:addStatusEffect(tpz.effect.ASTRAL_CONDUIT,1,0,30)
	player:setMP(maxMP)
	
	-- All Blood Pact recast times are reset
    player:resetRecast(tpz.recast.ABILITY, 173) -- Blood Pact: Rage
    player:resetRecast(tpz.recast.ABILITY, 174) -- Blood Pact: Ward
end