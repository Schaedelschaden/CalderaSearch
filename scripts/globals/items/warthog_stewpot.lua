-----------------------------------------
-- ID: 6219
-- Item: Warthog Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP +10% (Cap 50)
-- Attack +10% (Cap 20)
-- Ranged Attack +19% (Cap 40)
-- HP recovered while healing +5
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 6219)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_HPP, 10)
    target:addMod(tpz.mod.FOOD_HP_CAP, 50)
    target:addMod(tpz.mod.FOOD_ATTP, 10)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 20)
    target:addMod(tpz.mod.FOOD_RATTP, 19)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 40)
    target:addMod(tpz.mod.HPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_HPP, 10)
    target:delMod(tpz.mod.FOOD_HP_CAP, 50)
    target:delMod(tpz.mod.FOOD_ATTP, 10)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 20)
    target:delMod(tpz.mod.FOOD_RATTP, 19)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 40)
    target:delMod(tpz.mod.HPHEAL, 5)
end
