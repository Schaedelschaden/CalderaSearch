-----------------------------------
-- Ability: Choral Roll
-- Decreases spell interruption rate for party members within area of effect
-- Optimal Job: Bard
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 26
-- Phantom Roll +1 Value: 4
--
-- Die Roll     | No BRD     | With BRD
-- --------     --------     -------
-- 1            |-8%         |-33%
-- 2            |-42%        |-57%
-- 3            |-11%        |-36%
-- 4            |-15%        |-30%
-- 5            |-19%        |-34%
-- 6            |-4%         |-19%
-- 7            |-23%        |-38%
-- 8            |-27%        |-42%
-- 9            |-31%        |-46%
-- 10           |-35%        |-50%
-- 11           |-50%        |-65%
-- Bust         |+25%        |+25%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.CHORAL_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.CHORAL_ROLL, tpz.job.BRD)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {8, 42, 11, 15, 19, 4, 23, 27, 31, 35, 50, 25}
    local effectpower = effectpowers[total]
	local rollPlus = 4 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 25
    end
	
--	printf("choral_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("choral_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.CHORAL_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.SPELLINTERRUPT) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end