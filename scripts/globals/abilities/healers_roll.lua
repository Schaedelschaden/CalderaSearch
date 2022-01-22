-----------------------------------
-- Ability: Healer's Roll
-- Increases potency of "Cure" effect received for party members within area of effect
-- Optimal Job: White Mage
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 20
-- Phantom Roll +1 Value: 3
--
-- Die Roll    | No WHM  | With WHM
-- --------    -------   -----------
-- 1           |+3%      |+7%
-- 2           |+4%      |+8%
-- 3           |+12%     |+16%
-- 4           |+5%      |+9%
-- 5           |+6%      |+10%
-- 6           |+7%      |+11%
-- 7           |+1%      |+5%
-- 8           |+8%      |+12%
-- 9           |+9%      |+13%
-- 10          |+10%     |+14%
-- 11          |+16%     |+20%
-- Bust        |-4%      |-4%
--
-- Note that this roll will increase potency of cures received, not the potency of the caster's spells
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.HEALERS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.HEALERS_ROLL, tpz.job.WHM)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {3, 4, 12, 5, 6, 7, 1, 8, 9, 10, 16, 4}
    local effectpower = effectpowers[total]
	local rollPlus = 1 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 4
    end
	
--	printf("healers_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("healers_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.HEALERS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.CURE_POTENCY_RCVD) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end