-----------------------------------
--
-- tpz.effect.SENGIKORI
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.SENGIKORI_BONUS, effect:getPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.SENGIKORI_BONUS, effect:getPower())
end