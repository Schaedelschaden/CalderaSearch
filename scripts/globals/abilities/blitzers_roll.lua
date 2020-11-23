-----------------------------------
-- Ability: Blitzer's Roll
-- Reduces melee attack delay for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 4
-- Unlucky Number: 9
-- Level: 83
-- Phantom Roll +1 Value: 1
--
-- Die Roll    | Delay Reduction %
-- --------    -------
-- 1           |+2
-- 2           |+3
-- 3           |+4
-- 4           |+11
-- 5           |+5
-- 6           |+6
-- 7           |+7
-- 8           |+8
-- 9           |+1
-- 10          |+10
-- 11          |+12
-- Bust        |-5
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.BLITZERS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.BLITZERS_ROLL, tpz.job.COR)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {2, 3, 4, 11, 5, 6, 7, 8, 1, 10, 12, -5}
    local effectpower = effectpowers[total]
	local rollPlus = 1 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local chance = math.random(1, 100)
	local gearMod = caster:getMod(tpz.mod.ENHANCES_BLITZERS_ROLL)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
	-- Apply Buffs from Courser's Roll Enhancing Gear if present
    if (gearMod == 40 and chance <= gearMod) then -- Navarch's Tricorne +1 (40% chance)
		effectpower = effectpower + 3
	elseif (gearMod == 100) then -- Navarch's Tricorne +2, Chasseur's Tricorne, Chasseur's Tricorne +1
		effectpower = effectpower + 3
    end
	
--	printf("blitzers_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("blitzers_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.BLITZERS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.DELAY) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end