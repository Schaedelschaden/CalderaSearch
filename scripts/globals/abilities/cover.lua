-----------------------------------
-- Ability: Cover
-- Allows you to protect party members by placing yourself between them and the enemy.  
-- Obtained: Paladin Level 35
-- Recast Time: 03:00
-- Duration: 0:15 (base)
-----------------------------------
require("scripts/globals/status")

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability,action)
	local base = 15
	local PLDVIT = player:getMod(tpz.mod.VIT)
	local PLDMND = player:getMod(tpz.mod.MND)
	local targVIT = target:getMod(tpz.mod.VIT) * 2
	local merit = player:getMerit(tpz.merit.COVER_EFFECT_LENGTH)
	
	local duration = base + math.min(math.max(math.floor((PLDVIT + PLDMND - targVIT)/4),0),15) + merit
	
	target:addStatusEffect(tpz.effect.COVER,1,0,duration)
end