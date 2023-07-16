-----------------------------------
--
--      tpz.effect.CAROL
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
    local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
    local subPower = effect:getSubPower()

    if effect:getTier() > 1 then
        target:addMod(tpz.magic.nullMod[subPower], effect:getTier())
    end

    target:addMod(tpz.magic.resistMod[subPower], power)
    target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
    local subPower = effect:getSubPower()

    if effect:getTier() > 1 then
        target:delMod(tpz.magic.nullMod[subPower], effect:getTier())
    end

    target:delMod(tpz.magic.resistMod[subPower], power)
    target:delMod(bonusMod, empSetBonus)
end
