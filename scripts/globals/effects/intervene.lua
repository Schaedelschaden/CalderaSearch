-----------------------------------
--
-- tpz.effect.INTERVENE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.ATT,-1000)
	target:addMod(tpz.mod.ACC,-1000)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.ATT,-1000)
	target:delMod(tpz.mod.ACC,-1000)
end
