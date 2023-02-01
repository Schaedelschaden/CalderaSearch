-----------------------------------------
-- ID: 5622
-- Item: Candy Cane
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Intelligence 4
-- Mind 4
-- MP Recovery while healing 2
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0

    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end

    return result
end

function onItemUse(target)
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 1 or month == 2 or month == 12 then
        duration = 14400
    end

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5622)
end

function onEffectGain(target, effect)
    effect:unsetFlag(tpz.effectFlag.DEATH)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:addMod(tpz.mod.STR, -20)
        target:addMod(tpz.mod.VIT, -20)
        target:addMod(tpz.mod.DEX, -20)
        target:addMod(tpz.mod.AGI, -20)
        target:addMod(tpz.mod.INT, 30)
        target:addMod(tpz.mod.MND, 30)
        target:addMod(tpz.mod.CHR, 30)
    else
        target:addMod(tpz.mod.INT, 4)
        target:addMod(tpz.mod.MND, 4)
        target:addMod(tpz.mod.MPHEAL, 2)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:delMod(tpz.mod.STR, -20)
        target:delMod(tpz.mod.VIT, -20)
        target:delMod(tpz.mod.DEX, -20)
        target:delMod(tpz.mod.AGI, -20)
        target:delMod(tpz.mod.INT, 30)
        target:delMod(tpz.mod.MND, 30)
        target:delMod(tpz.mod.CHR, 30)
    else
        target:delMod(tpz.mod.INT, 4)
        target:delMod(tpz.mod.MND, 4)
        target:delMod(tpz.mod.MPHEAL, 2)
    end
end
