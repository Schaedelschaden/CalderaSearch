-----------------------------------
--
-- tpz.effect.BEWILDERED_DAZE_1
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.CRIT_HIT_EVASION, effect:getPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.CRIT_HIT_EVASION, effect:getPower())
end