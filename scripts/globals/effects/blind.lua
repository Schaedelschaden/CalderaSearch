-----------------------------------
--
--	tpz.effect.BLIND
--
-----------------------------------

function onEffectGain(target, effect)
	power = effect:getPower()
	
	target:addMod(tpz.mod.ACC, -power)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.ACC, -power)
end