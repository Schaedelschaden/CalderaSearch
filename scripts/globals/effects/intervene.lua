-----------------------------------
--
-- tpz.effect.INTERVENE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.ATT,-50)
	target:addMod(tpz.mod.ACC,-50)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.ATT,-50)
	target:delMod(tpz.mod.ACC,-50)
end
