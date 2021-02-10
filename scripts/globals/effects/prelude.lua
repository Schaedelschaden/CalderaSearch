-----------------------------------
--
--    tpz.effect.PRELUDE
-- getPower returns the TIER (e.g. 1,2,3,4)
-----------------------------------

function onEffectGain(target, effect)
	power = effect:getPower()
	setBonus = 0
	
	if (power >= 2000 and power < 3000) then
		power = power - 2000
		setBonus = 1
	elseif (power >= 3000 and power < 4000) then
		power = power - 3000
		setBonus = 2
	elseif (power >= 4000 and power < 5000) then
		power = power - 4000
		setBonus = 3
	elseif (power >= 5000) then
		power = power - 5000
		setBonus = 5
	end
	
	if (setBonus > 0) then
		target:addMod(tpz.mod.DEX, setBonus)
	end

    target:addMod(tpz.mod.RACC, power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.RACC, power)
	
	if (setBonus > 0) then
		target:delMod(tpz.mod.DEX, setBonus)
	end
end