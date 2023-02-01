-----------------------------------------
-- ID: 5620
-- Item: roast_turkey
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Vitality 4
-- hMP +2
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
    local duration = 14400

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5620)
    target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:addMod(tpz.mod.STR, 15)
        target:addMod(tpz.mod.VIT, 15)
        target:addMod(tpz.mod.FOOD_ATTP, 15)
        target:addMod(tpz.mod.FOOD_ATT_CAP, 150)
        target:addMod(tpz.mod.FOOD_RATTP, 15)
        target:addMod(tpz.mod.FOOD_RATT_CAP, 150)
    else
        target:addMod(tpz.mod.STR, 4)
        target:addMod(tpz.mod.VIT, 4)
        target:addMod(tpz.mod.HPHEAL, 2)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:delMod(tpz.mod.STR, 15)
        target:delMod(tpz.mod.VIT, 15)
        target:delMod(tpz.mod.FOOD_ATTP, 15)
        target:delMod(tpz.mod.FOOD_ATT_CAP, 150)
        target:delMod(tpz.mod.FOOD_RATTP, 15)
        target:delMod(tpz.mod.FOOD_RATT_CAP, 150)
    else
        target:delMod(tpz.mod.STR, 4)
        target:delMod(tpz.mod.VIT, 4)
        target:delMod(tpz.mod.HPHEAL, 2)
    end
end
