-----------------------------------
--
-- tpz.effect.FLASH
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, -effect:getPower())
end

function onEffectTick(target, effect)
    local power = effect:getPower()
    local decayby = 150
    
    effect:setPower(power - decayby)
    target:delMod(tpz.mod.ACC, -decayby)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ACC, -effect:getPower())
end
