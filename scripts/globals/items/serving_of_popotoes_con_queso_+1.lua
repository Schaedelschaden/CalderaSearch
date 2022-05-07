-----------------------------------------
-- ID: 6610
-- Item: Serving of Popotoes con Queso +1
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Strength 6
-- Mind 6
-- Attack % 21
-- ATK Cap 135
-- Ranged Attack % 21
-- RATK Cap 135
-- Evasion % 11
-- EVA Cap 55
-- Magic Evasion % 11
-- MEVA Cap 55
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6610)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STR, 6)
    target:addMod(tpz.mod.MND, 6)
    target:addMod(tpz.mod.FOOD_ATTP, 21)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 135)
	target:addMod(tpz.mod.FOOD_RATTP, 21)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 135)
	target:addMod(tpz.mod.FOOD_EVAP, 11)
    target:addMod(tpz.mod.FOOD_EVAP_CAP, 55)
	target:addMod(tpz.mod.FOOD_MEVAP, 11)
    target:addMod(tpz.mod.FOOD_MEVAP_CAP, 55)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, 6)
    target:delMod(tpz.mod.MND, 6)
    target:delMod(tpz.mod.FOOD_ATTP, 21)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 135)
	target:delMod(tpz.mod.FOOD_RATTP, 21)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 135)
	target:delMod(tpz.mod.FOOD_EVAP, 11)
    target:delMod(tpz.mod.FOOD_EVAP_CAP, 55)
	target:delMod(tpz.mod.FOOD_MEVAP, 11)
    target:delMod(tpz.mod.FOOD_MEVAP_CAP, 55)
end