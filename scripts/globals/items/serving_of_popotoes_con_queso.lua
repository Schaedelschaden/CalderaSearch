-----------------------------------------
-- ID: 6609
-- Item: Serving of Popotoes con Queso
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Strength 5
-- Mind 5
-- Attack % 20
-- ATK Cap 130
-- Ranged Attack % 20
-- RATK Cap 130
-- Evasion % 10
-- EVA Cap 50
-- Magic Evasion % 10
-- MEVA Cap 50
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6609)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STR, 5)
    target:addMod(tpz.mod.MND, 5)
    target:addMod(tpz.mod.FOOD_ATTP, 20)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 130)
	target:addMod(tpz.mod.FOOD_RATTP, 20)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 130)
	target:addMod(tpz.mod.FOOD_EVAP, 10)
    target:addMod(tpz.mod.FOOD_EVAP_CAP, 50)
	target:addMod(tpz.mod.FOOD_MEVAP, 10)
    target:addMod(tpz.mod.FOOD_MEVAP_CAP, 50)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, 5)
    target:delMod(tpz.mod.MND, 5)
    target:delMod(tpz.mod.FOOD_ATTP, 20)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 130)
	target:delMod(tpz.mod.FOOD_RATTP, 20)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 130)
	target:delMod(tpz.mod.FOOD_EVAP, 10)
    target:delMod(tpz.mod.FOOD_EVAP_CAP, 50)
	target:delMod(tpz.mod.FOOD_MEVAP, 10)
    target:delMod(tpz.mod.FOOD_MEVAP_CAP, 50)
end