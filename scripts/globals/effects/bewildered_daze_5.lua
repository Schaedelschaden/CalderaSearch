-----------------------------------
--
-- tpz.effect.BEWILDERED_DAZE_5
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.CRIT_HIT_EVASION, 10 + effect:getSubPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.CRIT_HIT_EVASION, 10 + effect:getSubPower())
end