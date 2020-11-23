-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.SKILLCHAINBONUS, effect:getPower())
	target:addMod(tpz.mod.WSACC, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.SKILLCHAINBONUS, effect:getPower())
	target:delMod(tpz.mod.WSACC, effect:getPower())
end