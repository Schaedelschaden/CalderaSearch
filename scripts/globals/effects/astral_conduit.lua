-----------------------------------
--
--     tpz.effect.ASTRAL_CONDUIT
--     
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.BP_DELAY, 99)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.BP_DELAY, 99)
end
