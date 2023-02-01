-----------------------------------------
-- ID: 5542
-- Item: Gateau aux fraises
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP 8
-- MP 8% Cap 50
-- Intelligence 1
-- HP Recovered while healing 1
-- MP Recovered while healing 1
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

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5542)
    target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:addMod(tpz.mod.DEX, 15)
        target:addMod(tpz.mod.AGI, 15)
        target:addMod(tpz.mod.FOOD_ACCP, 15)
        target:addMod(tpz.mod.FOOD_ACC_CAP, 150)
        target:addMod(tpz.mod.FOOD_RACCP, 15)
        target:addMod(tpz.mod.FOOD_RACC_CAP, 150)
    else
        target:addMod(tpz.mod.HP, 8)
        target:addMod(tpz.mod.INT, 1)
        target:addMod(tpz.mod.FOOD_MPP, 8)
        target:addMod(tpz.mod.FOOD_MP_CAP, 50)
        target:addMod(tpz.mod.HPHEAL, 1)
        target:addMod(tpz.mod.MPHEAL, 1)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:delMod(tpz.mod.DEX, 15)
        target:delMod(tpz.mod.AGI, 15)
        target:delMod(tpz.mod.FOOD_ACCP, 15)
        target:delMod(tpz.mod.FOOD_ACC_CAP, 150)
        target:delMod(tpz.mod.FOOD_RACCP, 15)
        target:delMod(tpz.mod.FOOD_RACC_CAP, 150)
    else
        target:delMod(tpz.mod.HP, 8)
        target:delMod(tpz.mod.INT, 1)
        target:delMod(tpz.mod.FOOD_MPP, 8)
        target:delMod(tpz.mod.FOOD_MP_CAP, 50)
        target:delMod(tpz.mod.HPHEAL, 1)
        target:delMod(tpz.mod.MPHEAL, 1)
    end
end
