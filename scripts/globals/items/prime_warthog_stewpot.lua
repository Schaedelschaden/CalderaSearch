-----------------------------------------
-- ID: 6220
-- Item: Prime Warthog Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP +10% (Cap 75)
-- STR +3
-- MND +1
-- Attack +10% (Cap 30)
-- Ranged Attack +19% (Cap 60)
-- HP recovered while healing +7
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 6220)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_HPP, 10)
    target:addMod(tpz.mod.FOOD_HP_CAP, 75)
    target:addMod(tpz.mod.STR, 3)
    target:addMod(tpz.mod.MND, 1)
    target:addMod(tpz.mod.FOOD_ATTP, 10)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 30)
    target:addMod(tpz.mod.FOOD_RATTP, 19)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 60)
    target:addMod(tpz.mod.HPHEAL, 7)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_HPP, 10)
    target:delMod(tpz.mod.FOOD_HP_CAP, 75)
    target:delMod(tpz.mod.STR, 3)
    target:delMod(tpz.mod.MND, 1)
    target:delMod(tpz.mod.FOOD_ATTP, 10)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 30)
    target:delMod(tpz.mod.FOOD_RATTP, 19)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 60)
    target:delMod(tpz.mod.HPHEAL, 7)
end
