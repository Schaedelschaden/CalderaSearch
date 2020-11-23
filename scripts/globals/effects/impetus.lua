-----------------------------------
--
-- tpz.effect.IMPETUS
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.ATT, 2)
	target:addMod(tpz.mod.CRITHITRATE, 1)
end

function onEffectTick(target, effect)

end

function onEffectLose(target, effect)
	local Power = effect:getPower()
	
	target:delMod(tpz.mod.ATT, Power * 2)
	target:delMod(tpz.mod.CRITHITRATE, Power)
end
