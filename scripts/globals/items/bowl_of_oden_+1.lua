-----------------------------------------
-- ID: 6470
-- Item: Bowl of Adoulin Soup
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Dexterity 5
-- Intelligence 5
-- ACC % 15 Cap 70
-- MACC % 15 Cap 70
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6470)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.DEX, 5)
	target:addMod(tpz.mod.INT, 5)
	target:addMod(tpz.mod.FOOD_ACCP, 15)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 70)
	target:addMod(tpz.mod.FOOD_MACCP, 15)
    target:addMod(tpz.mod.FOOD_MACC_CAP, 70)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.DEX, 5)
	target:delMod(tpz.mod.INT, 5)
	target:delMod(tpz.mod.FOOD_ACCP, 15)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 70)
	target:delMod(tpz.mod.FOOD_MACCP, 15)
    target:delMod(tpz.mod.FOOD_MACC_CAP, 70)
end