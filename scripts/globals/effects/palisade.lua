-----------------------------------
--
-- tpz.effect.PALISADE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.PALISADE_BLOCK_BONUS, effect:getPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.PALISADE_BLOCK_BONUS, effect:getPower())
end
