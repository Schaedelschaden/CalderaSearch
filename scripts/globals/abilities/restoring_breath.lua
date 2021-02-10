-----------------------------------
-- Ability: Restoring Breath
-- Orders the wyvern to heal with its breath.  
-- Obtained: Dragoon Level 90
-- Recast Time: 01:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasPet()) then
		return 0,0
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	end
end

function onUseAbility(player,target,ability)
--	printf("Active #1\n")
    local breath_healing_range = 18
	local healingbreath = 640 -- Default Healing Breath I
--	printf("Healing Breath Set to I\n")
	
	if (player:getMainLvl() >= 80) then
		healingbreath = 639
--		printf("Healing Breath Set to IV\n")
	elseif (player:getMainLvl() >= 40) then
		healingbreath = 642
--		printf("Healing Breath Set to III\n")
	elseif (player:getMainLvl() >= 20) then
		healingbreath = 641
--		printf("Healing Breath Set to II\n")
	end

    local function inBreathRange(target)
		if (player:getPet():checkDistance(target) <= breath_healing_range) then
			return 1
		else
			return 0
		end
--		printf("Active #2\n")
    end

    if (inBreathRange(target)) then
		player:getPet():useJobAbility(healingbreath, target)
--		printf("Active #3\n")
    end
end