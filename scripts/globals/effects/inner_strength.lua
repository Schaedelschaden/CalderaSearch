-----------------------------------
--
-- tpz.effect.INNER_STRENGTH
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.HPP,113)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.HPP,113)
end
