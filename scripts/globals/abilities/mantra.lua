-----------------------------------
-- Ability: Mantra
-- Increases the max. HP of party members within area of effect.
-- Obtainable: Monk Level 75
-- Recast Time: 0:10:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

-- NOTE: This script does not take equipment +HP or +HP% into account. MAX_HP_BOOST values of 
-- 6, 12, 18, 24, 30 give the retail values of 4%, 8%, 12%, 16%, 20% on a naked level 99 MNK.

function onAbilityCheck(player,target,ability) -- Removes Max HP Boost buff if active.
	local active = target:getStatusEffect(tpz.effect.MAX_HP_BOOST)
	
	if (active ~= nil) then
		target:delStatusEffect(tpz.effect.MAX_HP_BOOST)
	end
    return 0,0
end

function onUseAbility(player,target,ability)
	local merits = player:getMerit(tpz.merit.MANTRA) -- Returns Mantra merit value as a multiple of 4 (merit level 1 will return a value of 4, level 2 a value of 8, etc. This probably corresponds to the Mantra value in the merits .sql table)
	
	if merits == 4 then
		target:addStatusEffect(tpz.effect.MAX_HP_BOOST,8,0,180) --Increases Max HP by ~5%
	elseif merits == 8 then
		target:addStatusEffect(tpz.effect.MAX_HP_BOOST,16,0,180) --Increases Max HP by ~10%
	elseif merits == 12 then
		target:addStatusEffect(tpz.effect.MAX_HP_BOOST,24,0,180) --Increases Max HP by ~14%
	elseif merits == 16 then
		target:addStatusEffect(tpz.effect.MAX_HP_BOOST,32,0,180) --Increases Max HP by ~18%
	elseif merits == 20 then
		target:addStatusEffect(tpz.effect.MAX_HP_BOOST,40,0,180) --Increases Max HP by ~22%
	end

	return tpz.effect.MANTRA
end
