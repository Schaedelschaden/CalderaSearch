-----------------------------------
--
-- tpz.effect.PRESTO
--
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.STEP_ACCURACY, effect:getPower())
	target:addMod(tpz.mod.STEP_FINISH, 5)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.STEP_ACCURACY, effect:getPower())
	target:delMod(tpz.mod.STEP_FINISH, 5)
end