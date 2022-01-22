-----------------------------------
-- Ability: Samurai Roll
-- Enhances "Store TP" effect for party members within area of effect
-- Optimal Job: Samurai
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level 37
-- Phantom Roll +1 Value: 4
--
-- Die Roll    |No SAM  |With SAM
-- 1           |+8      |+18
-- 2           |+32     |+42
-- 3           |+10     |+20
-- 4           |+12     |+22
-- 5           |+14     |+24
-- 6           |+4      |+14
-- 7           |+16     |+26
-- 8           |+20     |+30
-- 9           |+22     |+32
-- 10          |+24     |+34
-- 11          |+40     |+50
-- Bust        |-5      |-5
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.SAMURAI_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.SAMURAI_ROLL, tpz.job.SAM)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {8, 32, 10, 12, 14, 4, 16, 20, 22, 24, 40, 10}
    local effectpower = effectpowers[total]
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 10
    end
	
--	printf("fighters_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("fighters_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.SAMURAI_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.STORETP) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end