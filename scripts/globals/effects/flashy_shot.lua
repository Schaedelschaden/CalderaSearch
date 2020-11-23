-----------------------------------
--
-- tpz.effect.FLASHY_SHOT
--
-----------------------------------

function onEffectGain(target,effect)
	local merits = target:getMerit(tpz.merit.FLASHY_SHOT) - 5
	target:addMod(tpz.mod.RACC, 200)
	target:addMod(tpz.mod.RATTP, merits)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	local merits = target:getMerit(tpz.merit.FLASHY_SHOT) - 5
	target:delMod(tpz.mod.RACC, 200)
	target:delMod(tpz.mod.RATTP, merits)
end
