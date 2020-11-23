-----------------------------------
--
--	tpz.effect.UNLEASH
--
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.CHARM_CHANCE, 95)
	target:getPet():addMod(tpz.mod.REGAIN, 3000)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.CHARM_CHANCE, 95)
	target:getPet():delMod(tpz.mod.REGAIN, 3000)
end
