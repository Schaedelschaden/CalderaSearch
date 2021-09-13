-----------------------------------------
-- ID: 6601
-- Item: omelette_sandwich
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +11% (caps @ 150)
-- Vitality +7
-- Mind +7
-- Accuracy 11% (caps @ 80)
-- Defense 11% (caps @ 120)
-- Enmity +4
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6601)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.VIT, 7)
	target:addMod(tpz.mod.MND, 7)
	target:addMod(tpz.mod.FOOD_HPP, 11)
	target:addMod(tpz.mod.FOOD_HP_CAP, 150)
    target:addMod(tpz.mod.FOOD_ACCP, 11)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 80)
	target:addMod(tpz.mod.FOOD_DEFP, 11)
    target:addMod(tpz.mod.FOOD_DEF_CAP, 120)
	target:addMod(tpz.mod.ENMITY, 4)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.VIT, 7)
	target:delMod(tpz.mod.MND, 7)
	target:delMod(tpz.mod.FOOD_HPP, 11)
	target:delMod(tpz.mod.FOOD_HP_CAP, 150)
    target:delMod(tpz.mod.FOOD_ACCP, 11)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 80)
	target:delMod(tpz.mod.FOOD_DEFP, 11)
    target:delMod(tpz.mod.FOOD_DEF_CAP, 120)
	target:delMod(tpz.mod.ENMITY, 4)
end