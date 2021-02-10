-----------------------------------
--
--    tpz.effect.MARCH
-- getPower returns the TIER (e.g. 1,2,3,4)
-- DO NOT ALTER ANY OF THE EFFECT VALUES! DO NOT ALTER EFFECT POWER!
-- Todo: Find a better way of doing this. Need to account for varying modifiers + CASTER's skill (not target)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	power = effect:getPower()
	setBonus = 0
	
	if (power >= 20000 and power < 30000) then
		power = power - 20000
		setBonus = 1
	elseif (power >= 30000 and power < 40000) then
		power = power - 30000
		setBonus = 2
	elseif (power >= 40000 and power < 50000) then
		power = power - 40000
		setBonus = 3
	elseif (power >= 50000) then
		power = power - 50000
		setBonus = 5
	end
	
	if (setBonus > 0) then
		target:addMod(tpz.mod.DEX, setBonus)
	end

    target:addMod(tpz.mod.HASTE_MAGIC, power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HASTE_MAGIC, power)
	
	if (setBonus > 0) then
		target:delMod(tpz.mod.DEX, setBonus)
	end
end