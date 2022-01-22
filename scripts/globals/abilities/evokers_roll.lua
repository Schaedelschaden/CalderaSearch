-----------------------------------
-- Ability: Evoker's Roll
-- Gradually restores MP for party members within area of effect
-- Optimal Job: Summoner
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 40
-- Phantom Roll +1 Value: 1
--
-- Die Roll    | No SMN  | With SMN
-- --------    -------   -----------
-- 1           |+1       |+2
-- 2           |+1       |+2
-- 3           |+1       |+2
-- 4           |+1       |+2
-- 5           |+3       |+4
-- 6           |+2       |+3
-- 7           |+2       |+3
-- 8           |+2       |+3
-- 9           |+1       |+2
-- 10          |+3       |+4
-- 11          |+4       |+5
-- Bust        |-1       |-1
--
-- Busting on Evoker's Roll will give you -1MP/tick less on your own total MP refreshed i.e. you do not actually lose MP
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.EVOKERS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.EVOKERS_ROLL, tpz.job.SMN)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {1, 1, 1, 1, 3, 2, 2, 2, 1, 3, 4, 1}
    local effectpower = effectpowers[total]
	local rollPlus = 1 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 1
    end
	
--	printf("evokers_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
	if (effectpower > 10) then
		effectpower = 10
	end
	
--	printf("evokers_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.EVOKERS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.REFRESH) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end