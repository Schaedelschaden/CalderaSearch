-----------------------------------
--
-- tpz.effect.FEALTY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
   target:addMod(tpz.mod.MEVA, 200)
   target:addMod(tpz.mod.CHARMRES, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
   target:delMod(tpz.mod.MEVA, 100)
   target:delMod(tpz.mod.CHARMRES, 100)
end