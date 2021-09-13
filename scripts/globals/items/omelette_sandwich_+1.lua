-----------------------------------------
-- ID: 6602
-- Item: omelette_sandwich_+1
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +11% (caps @ 155)
-- Vitality +8
-- Mind +8
-- Accuracy 11% (caps @ 85)
-- Defense 11% (caps @ 125)
-- Enmity +5
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6602)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.VIT, 8)
	target:addMod(tpz.mod.MND, 8)
	target:addMod(tpz.mod.FOOD_HPP, 11)
	target:addMod(tpz.mod.FOOD_HP_CAP, 155)
    target:addMod(tpz.mod.FOOD_ACCP, 11)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 85)
	target:addMod(tpz.mod.FOOD_DEFP, 11)
    target:addMod(tpz.mod.FOOD_DEF_CAP, 125)
	target:addMod(tpz.mod.ENMITY, 5)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.VIT, 8)
	target:delMod(tpz.mod.MND, 8)
	target:delMod(tpz.mod.FOOD_HPP, 11)
	target:delMod(tpz.mod.FOOD_HP_CAP, 155)
    target:delMod(tpz.mod.FOOD_ACCP, 11)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 85)
	target:delMod(tpz.mod.FOOD_DEFP, 11)
    target:delMod(tpz.mod.FOOD_DEF_CAP, 125)
	target:delMod(tpz.mod.ENMITY, 5)
end