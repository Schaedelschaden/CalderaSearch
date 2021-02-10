-----------------------------------
--
-- tpz.effect.RESTRAINT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)

end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power = effect:getSubPower() - 1
	
	target:delMod(tpz.mod.ALL_WSDMG_ALL_HITS, power)
end