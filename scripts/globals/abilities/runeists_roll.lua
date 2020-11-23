-----------------------------------
-- Ability: Runeist's Roll
-- Enhances magic evasion for party members within area of effect.
-- Optimal Job: Rune Fencer
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 70
-- Phantom Roll +1 Value: 2
--
-- Die Roll    | No RUN  | With RUN
-- --------    --------  -----------
-- 1           |10       |25
-- 2           |13       |28
-- 3           |15       |30
-- 4           |40       |55
-- 5           |18       |33
-- 6           |20       |35
-- 7           |25       |40
-- 8           |5        |20
-- 9           |28       |43
-- 10          |30       |45
-- 11          |50       |65
-- 12+         |-15      |-15
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.RUNEISTS_ROLL
	
    ability:setRange(ability:getRange() + player:getMod(tpz.mod.ROLL_RANGE))
	
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
        corsairSetup(caster, ability, action, tpz.effect.RUNEISTS_ROLL, tpz.job.RUN)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {4, 6, 8, 25, 10, 12, 14, 2, 17, 20, 30, -10}
    local effectpower = effectpowers[total]
	local effectMod = phantombuffMultiple(caster)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 15
    end
	
--	printf("runeists_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("runeists_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.RUNEISTS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.MEVA) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end