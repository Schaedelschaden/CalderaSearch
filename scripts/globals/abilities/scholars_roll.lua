-----------------------------------
-- Ability: Scholar's Roll
-- Enhances Conserve MP effect for party members within area of effect
-- Optimal Job: Scholar
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 64
-- Phantom Roll +1 Value: 1
--
-- Die Roll    |No SCH  |With SCH
-- --------    -------- -----------
-- 1           |2%      |5%
-- 2           |10%     |13%
-- 3           |3%      |6%
-- 4           |4%      |7%
-- 5           |4%      |7%
-- 6           |1%      |4%
-- 7           |5%      |8%
-- 8           |6%      |9%
-- 9           |7%      |10%
-- 10          |7%      |10%
-- 11          |12%     |15%
-- 12+         |-3%     |0%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.SCHOLARS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.SCHOLARS_ROLL, tpz.job.SCH)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {2, 10, 3, 4, 4, 1, 5, 6, 7, 7, 12, 3}
    local effectpower = effectpowers[total]
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 3
    end
	
--	printf("scholars_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("scholars_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.SCHOLARS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.CONSERVE_MP) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end