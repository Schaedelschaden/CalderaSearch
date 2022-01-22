-----------------------------------
-- Ability: Rogue's Roll
-- Improves critical hit rate for party members within area of effect
-- Optimal Job: Thief
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 43
-- Phantom Roll +1 Value: 1
--
-- Die Roll    |No THF  |With THF
-- --------    -------  -----------
-- 1           |2%      |8%
-- 2           |2%      |8%
-- 3           |3%      |9%
-- 4           |4%      |10%
-- 5           |12%     |18%
-- 6           |5%      |11%
-- 7           |6%      |12%
-- 8           |6%      |12%
-- 9           |1%      |7%
-- 10          |8%      |14%
-- 11          |19%     |25%
-- 12+         |-6%     |-6%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.ROGUES_ROLL
	
    ability:setRange(ability:getRange() + player:getMod(tpz.mod.ROLL_RANGE))
	
	if (checkForElevenRoll(player)) then
		local recast = 30 - player:getMerit(tpz.merit.PHANTOM_ROLL_RECAST) + player:getMod(tpz.mod.PHANTOM_ROLL_RECAST)
		ability:setRecast(recast)
	end
	
    if (player:hasStatusEffect(effectID)) then
        return tpz.msg.basic.ROLL_ALREADY_ACTIVE,0
    elseif atMaxCorsairBusts(player) then
        return tpz.msg.basic.CANNOT_PERFORM,0
    else
        return 0,0
    end
end

function onUseAbility(caster, target, ability, action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, tpz.effect.ROGUES_ROLL, tpz.job.THF)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {1, 2, 3, 4, 10, 5, 6, 7, 1, 8, 14, 5}
    local effectpower = effectpowers[total]
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 5
    end
	
--	printf("rogues_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("rogues_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.ROGUES_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.CRITHITRATE) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end