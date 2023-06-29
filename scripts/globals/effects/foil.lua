-----------------------------------
--
--     tpz.effect.FOIL
--
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(tpz.mod.TP_MOVE_EVASION, effect:getPower())
end

function onEffectTick(target, effect)
    target:delMod(tpz.mod.TP_MOVE_EVASION, 3)
    effect:setPower(effect:getPower() - 3)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.TP_MOVE_EVASION, effect:getPower())
end
