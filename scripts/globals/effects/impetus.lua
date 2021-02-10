-----------------------------------
--
-- tpz.effect.IMPETUS
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.ATT, 2)
	target:addMod(tpz.mod.CRITHITRATE, 1)
	if (effect:getSubPower() > 0) then
		target:addMod(tpz.mod.ACC, 2)
		target:addMod(tpz.mod.CRIT_DMG_INCREASE, 1)
	end
end

function onEffectTick(target, effect)

end

function onEffectLose(target, effect)
	local power = effect:getPower()
	
	target:delMod(tpz.mod.ATT, power * 2)
	target:delMod(tpz.mod.CRITHITRATE, power)
	if (effect:getSubPower() > 0) then
		target:delMod(tpz.mod.ACC, power * 2)
		target:delMod(tpz.mod.CRIT_DMG_INCREASE, power)
	end
end