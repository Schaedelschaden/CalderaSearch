-----------------------------------
-- Ability: Courser's Roll
-- Enhances "Snapshot" effect for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 3
-- Unlucky Number: 9
-- Level: 81
-- Phantom Roll +1 Value: 1
--
-- No Reliable Community Data available. Numbers Based on Blitzer's Roll Values.
--
-- Die Roll    | Snapshot+
-- --------    -------
-- 1           |+5
-- 2           |+6
-- 3           |+16
-- 4           |+8
-- 5           |+9
-- 6           |+10
-- 7           |+11
-- 8           |+12
-- 9           |+2
-- 10          |+14
-- 11          |+20
-- Bust        |-5
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local effectID = tpz.effect.COURSERS_ROLL
	
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
        corsairSetup(caster, ability, action, tpz.effect.COURSERS_ROLL, tpz.job.COR)
    end
	
    local total = caster:getLocalVar("corsairRollTotal")
	
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster, target, ability, action, total)
    local duration = 300 + caster:getMerit(tpz.merit.WINNING_STREAK) + caster:getMod(tpz.mod.PHANTOM_DURATION)
    local effectpowers = {5, 6, 16, 8, 9, 10, 11, 12, 2, 14, 20, -5}
    local effectpower = effectpowers[total]
	local rollPlus = 2 -- Roll +1 Line from BGWiki
	local effectMod = phantombuffMultiple(caster)
	local chance = math.random(1, 100)
	local gearMod = caster:getMod(tpz.mod.ENHANCES_COURSERS_ROLL)
	local CrookedCardsMod = 1 + (caster:getMod(tpz.mod.PHANTOM_ROLL_EFFECT) / 100)
	
	-- Apply Buffs from Courser's Roll Enhancing Gear if present
    if (gearMod == 40 and chance <= gearMod) then -- Navarch's Bottes +1 (40% chance)
		effectpower = effectpower + 10
	elseif (gearMod == 100) then -- Navarch's Bottes +2, Chasseur's Bottes, Chasseur's Bottes +1
		effectpower = effectpower + 10
    end
	
--	printf("coursers_roll.lua applyRoll EFFECT POWER: [%i]  EFFECT MOD: [%i]\n", effectpower, effectMod)
	
	-- Apply 'Phantom Roll +' gear
	effectMod = effectMod * rollPlus
	effectpower = (effectpower + effectMod) * CrookedCardsMod
	
--	printf("coursers_roll.lua applyRoll MODIFIED EFFECT POWER: [%i]\n", effectpower)
	
	-- Check if COR Main or Sub
    if (caster:getMainJob() == tpz.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == tpz.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
	
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(tpz.merit.BUST_DURATION), tpz.effect.COURSERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_SNAPSHOT) == false) then
        ability:setMsg(tpz.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(tpz.msg.basic.DOUBLEUP_BUST)
    end
	
    return total
end