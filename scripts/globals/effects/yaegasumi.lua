-----------------------------------
--
-- tpz.effect.YAEGASUMI
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
	
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(tpz.mod.YAEGASUMI_WS_BONUS, 0)
end
