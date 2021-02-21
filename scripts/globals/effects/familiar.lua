-----------------------------------
--
--     tpz.effect.FAMILIAR
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.HP, 700)
	target:addMod(tpz.mod.ATTP, 50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.HP, 700)
	target:delMod(tpz.mod.ATTP, 50)
end