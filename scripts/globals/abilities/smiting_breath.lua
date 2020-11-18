-----------------------------------
-- Ability: Smiting Breath
-- Orders the wyvern to attack with its breath.  
-- Obtained: Dragoon Level 90
-- Recast Time: 01:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
--    printf("Active #1\n")
	if (player:hasPet()) then
		return 0,0
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	end
end

function onUseAbility(player,target,ability)
--	printf("Active #2\n")
    local breath_attack_range = 12
	local weaknessTargetChance = 75
	local breaths = {}
	
	if player:getMod(tpz.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
		weaknessTargetChance = 100
--		printf("Weakness Target Chance [%i]\n", weaknessTargetChance)
	end

	if math.random(100) <= weaknessTargetChance then
		local weakness = 0
			for mod = 0, 5 do
				if target:getMod(tpz.mod.FIREDEF + mod) < target:getMod(tpz.mod.FIREDEF + weakness) then
					breaths = {}
					table.insert(breaths, 630 + mod)
				elseif target:getMod(tpz.mod.FIREDEF + mod) == target:getMod(tpz.mod.FIREDEF + weakness) then
					table.insert(breaths, 630 + mod)
				end
			end
	else
		breaths = {630, 631, 632, 633, 634, 635}
	end

    local function inBreathRange(target)
		if (player:getPet():checkDistance(target) <= breath_attack_range) then
			return 1
		else
			return 0
		end
    end

    if (inBreathRange(target)) then
		breaths = breaths[math.random(#breaths)]
--		printf("Breaths [%i]\n", breaths)
		player:getPet():useJobAbility(breaths, target)
    end
end
