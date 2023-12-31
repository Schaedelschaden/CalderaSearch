-----------------------------------
-- Ability: Caster's Roll
-- Enhances "Fast Cast" effect for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 2
-- Unlucky Number: 7
-- Level: 79
-- Phantom Roll +1 Value: 3
--
-- Die Roll    | Fast Cast%
-- --------    -------
-- 1           |+6%
-- 2           |+15%
-- 3           |+7%
-- 4           |+8%
-- 5           |+9%
-- 6           |+10%
-- 7           |+5%
-- 8           |+11%
-- 9           |+12%
-- 10          |+13%
-- 11          |+20%
-- Bust        |-10%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.CASTERS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.CASTERS_ROLL, tpz.job.COR)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {6, 15, 7, 8, 9, 10, 5, 11, 12, 13, 20, -10}
    local effectpower = effectpowers[total]
	local rollPlus = 3 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local chance = math.random(1, 100)
	local gearMod = caster:getMod(tpz.mod.ENHANCES_CASTERS_ROLL)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
	-- Apply Buffs from Caster's Roll Enhancing Gear if present
    if (gearMod == 40 and chance <= gearMod) then -- Navarch's Culottes +1 (40% chance)
		effectpower = effectpower + 10
	elseif (gearMod == 100) then -- Navarch's Culottes +2, Chasseur's Culottes, Chasseur's Culottes +1
		effectpower = effectpower + 10
    end
	
--	printf("casters_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("casters_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.CASTERS_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.FASTCAST) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end