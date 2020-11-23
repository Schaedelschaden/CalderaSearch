-----------------------------------
-- Ability: Cutting Cards
-- Decreases the recast times of party members' special abilities.
-- Obtained: Corsair Level 96
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onUseAbility(caster, target, ability, action)
    local roll
	local total
	local currentRecastSP1 = target:getRecast(0)
	local currentRecastSP2 = target:getRecast(254)
	local newRecastSP1
	local newRecastSP2
	local casterName = caster:getName()
	local targetName = target:getName()
	
	if (targetName == casterName) then
        roll = math.random(1,6)
		caster:setLocalVar("corsairRollTotal", roll)
        action:speceffect(caster:getID(), roll)
    end
	
	total = caster:getLocalVar("corsairRollTotal")
	
--	printf("cutting_cards.lua onUseAbility ROLL: [%i]  SP1 RECAST: [%i]  SP2 RECAST: [%i]\n", total, currentRecastSP1, currentRecastSP2)
	
	if (total == 1) then -- 5% reduction
		newRecastSP1 = currentRecastSP1 * 0.95
		newRecastSP2 = currentRecastSP2 * 0.95
	elseif (total == 2) then -- 10% reduction
		newRecastSP1 = currentRecastSP1 * 0.90
		newRecastSP2 = currentRecastSP2 * 0.90
	elseif (total == 3) then -- 20% reduction
		newRecastSP1 = currentRecastSP1 * 0.80
		newRecastSP2 = currentRecastSP2 * 0.80
	elseif (total == 4) then -- 30% reduction
		newRecastSP1 = currentRecastSP1 * 0.70
		newRecastSP2 = currentRecastSP2 * 0.70
	elseif (total == 5) then -- 40% reduction
		newRecastSP1 = currentRecastSP1 * 0.60
		newRecastSP2 = currentRecastSP2 * 0.60
	elseif (total == 6) then -- 50% reduction
		newRecastSP1 = currentRecastSP1 * 0.50
		newRecastSP2 = currentRecastSP2 * 0.50
	end
	
--	printf("cutting_cards.lua onUseAbility SP1 NEW RECAST: [%i]  SP2 NEW RECAST: [%i]\n", newRecastSP1, newRecastSP2)
	
	action:animation(target:getID(), 132 + (total) - 1)
	
	target:setRecast(0, newRecastSP1)
	target:setRecast(254, newRecastSP2)

    return 0
end