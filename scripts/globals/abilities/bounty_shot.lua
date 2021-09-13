-----------------------------------
-- Ability: Bounty Shot
-- Increases the rate at which the target yields treasure. 
-- Obtained: Ranger Level 87
-- Recast Time: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability, action)
	ability:setMsg(tpz.msg.basic.ABILITY_TH)

	local strength = 2 + player:getMod(tpz.mod.BOUNTY_SHOT_RATE) + player:getMod(tpz.mod.TREASURE_HUNTER) -- Base TH2, goes up to TH4 with gear
	
	-- RNG is capped at inflicting TH4 at most on one hit
	-- Additional Bounty Shot and Treasure Hunter gear increase the chance of increasing the level on a hit/shot
	if (strength > 4) then
		strength = 4
	end
	
	if (player:getWeaponSkillType(tpz.slot.RANGED) == tpz.skill.MARKSMANSHIP) then -- can't have your crossbow/gun held like a bow, now can we?
        action:animation(target:getID(), action:animation(target:getID()) + 5)
    end
	
	local TH = target:getTHlevel()
	local diffTH = (player:getMod(tpz.mod.TREASURE_HUNTER) - TH) * 10
	local upgradeChance = math.random(1, 100)
	
	if (diffTH < 0) then
		diffTH = 0
	end
	
	if (TH == 0) then
		target:setTHlevel(strength)
	elseif (TH > 0 and upgradeChance <= diffTH) then
		strength = TH + 1
		target:setTHlevel(strength)
	elseif (TH > 0 and upgradeChance > diffTH) then
		ability:setMsg(tpz.msg.basic.NONE)
	end
	
	return strength
end