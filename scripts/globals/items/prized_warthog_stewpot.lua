-----------------------------------------
-- ID: 6221
-- Item: Prized Warthog Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP +10% (Cap 100)
-- STR +5
-- MND +2
-- Attack +10% (Cap 40)
-- Ranged Attack +19% (Cap 80)
-- HP recovered while healing +9
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 6221)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_HPP, 10)
    target:addMod(tpz.mod.FOOD_HP_CAP, 100)
    target:addMod(tpz.mod.STR, 5)
    target:addMod(tpz.mod.MND, 2)
    target:addMod(tpz.mod.FOOD_ATTP, 10)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 40)
    target:addMod(tpz.mod.FOOD_RATTP, 19)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 80)
    target:addMod(tpz.mod.HPHEAL, 9)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_HPP, 10)
    target:delMod(tpz.mod.FOOD_HP_CAP, 100)
    target:delMod(tpz.mod.STR, 5)
    target:delMod(tpz.mod.MND, 2)
    target:delMod(tpz.mod.FOOD_ATTP, 10)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 40)
    target:delMod(tpz.mod.FOOD_RATTP, 19)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 80)
    target:delMod(tpz.mod.HPHEAL, 9)
end
