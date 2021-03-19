-----------------------------------
--
--    tpz.effect.MINUET
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	local power = effect:getPower()
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
		target:addMod(tpz.mod.STR, setBonus)
	end
	
    target:addMod(tpz.mod.ATT, power)
    target:addMod(tpz.mod.RATT, power)
	effect:setPower(power)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	local power = effect:getPower()
	
    target:delMod(tpz.mod.ATT, power)
    target:delMod(tpz.mod.RATT, power)
	
	if (setBonus > 0) then
		target:delMod(tpz.mod.STR, setBonus)
	end
end