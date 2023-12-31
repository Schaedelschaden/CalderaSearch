-----------------------------------
-- Ability: Allies's Roll
-- Enhances skillchain damage and skillchain accuracy for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 3
-- Unlucky Number: 10
-- Level: 89
-- Phantom Roll +1 Value: 1
--
-- Die Roll    | Skillchain Bonus
-- --------    -------
-- 1           |+2%
-- 2           |+3%
-- 3           |+20%
-- 4           |+5%
-- 5           |+7%
-- 6           |+9%
-- 7           |+11%
-- 8           |+13%
-- 9           |+15%
-- 10          |+1%
-- 11          |+25%
-- Bust        |-5%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.ALLIES_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.ALLIES_ROLL, tpz.job.COR)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster, target, ability, action, total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {2, 3, 20, 5, 7, 9, 11, 13, 15, 1, 25, -5}
    local effectpower = effectpowers[total]
	local rollPlus = 1 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local chance = math.random(1, 100)
	local gearMod = caster:getMod(tpz.mod.ENHANCES_ALLIES_ROLL)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
	-- Apply Buffs from Allies' Roll Enhancing Gear if present
    if (gearMod == 2 and chance <= 40) then -- Navarch's Gants +1 (40% chance)
		effectpower = effectpower + gearMod
	elseif (gearMod == 5) then -- Navarch's Gants +2, Chasseur's Gants, Chasseur's Gants +1
		effectpower = effectpower + gearMod
    end
	
--	printf("allies_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("allies_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.ALLIES_ROLL, effectpower, 0, duration, caster:getID(), total, tpz.mod.SKILLCHAINBONUS) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end