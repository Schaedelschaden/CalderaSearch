-----------------------------------
--
-- tpz.effect.CONSPIRATOR
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
	local power = effect:getPower()
	if (power == 4) then
		power = power * 5
		target:addMod(tpz.mod.SUBTLE_BLOW, power)
		target:addMod(tpz.mod.ACC, power * 0.75)
		if (effect:getSubPower() == 1) then
			target:addMod(tpz.mod.ATT, power * 0.75)
		end
	elseif (power == 5) then
		power = power * 10
		target:addMod(tpz.mod.SUBTLE_BLOW, power)
		target:addMod(tpz.mod.ACC, power * 0.50)
		if (effect:getSubPower() == 1) then
			target:addMod(tpz.mod.ATT, power * 0.50)
		end
	elseif (power == 6) then
		power = power * 10
		target:addMod(tpz.mod.SUBTLE_BLOW, power)
		target:addMod(tpz.mod.ACC, power * 0.98)
		if (effect:getSubPower() == 1) then
			target:addMod(tpz.mod.ATT, power * 0.98)
		end
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power = effect:getPower()
	if (power == 4) then
		power = power * 5
		target:delMod(tpz.mod.SUBTLE_BLOW, power)
		target:delMod(tpz.mod.ACC, power * 0.75)
		if (effect:getSubPower() == 1) then
			target:delMod(tpz.mod.ATT, power * 0.75)
		end
	elseif (power == 5) then
		power = power * 10
		target:delMod(tpz.mod.SUBTLE_BLOW, power)
		target:delMod(tpz.mod.ACC, power * 0.50)
		if (effect:getSubPower() == 1) then
			target:delMod(tpz.mod.ATT, power * 0.50)
		end
	elseif (power == 6) then
		power = power * 10
		target:delMod(tpz.mod.SUBTLE_BLOW, power)
		target:delMod(tpz.mod.ACC, power * 0.98)
		if (effect:getSubPower() == 1) then
			target:delMod(tpz.mod.ATT, power * 0.98)
		end
	end
end