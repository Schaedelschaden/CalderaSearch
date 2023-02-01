-----------------------------------
--
--     tpz.effect.MIGHTY_GUARD
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HASTE_MAGIC, 1500)
    target:addMod(tpz.mod.DEFP, 25)
    target:addMod(tpz.mod.MDEF, 15)
    target:addMod(tpz.mod.REGEN, 30)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HASTE_MAGIC, 1500)
    target:delMod(tpz.mod.DEFP, 25)
    target:delMod(tpz.mod.MDEF, 15)
    target:delMod(tpz.mod.REGEN, 30)
end
