-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    -- Enmity bonus is handled in the CalculateEnmityBonus function inside enmity_container.cpp
    local subPower = effect:getSubPower()

    target:addMod(tpz.mod.ACC, 25)
    target:addMod(tpz.mod.ZANSHIN, subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local subPower = effect:getSubPower()

    target:delMod(tpz.mod.ACC, 25)
    target:delMod(tpz.mod.ZANSHIN, subPower)
end
