-----------------------------------------
-- ID: 6471
-- Item: Bowl of Oden +1
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Dexterity 6
-- Intelligence 6
-- ACC % 16 Cap 75
-- MACC % 16 Cap 75
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 6471)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.DEX, 6)
	target:addMod(tpz.mod.INT, 6)
	target:addMod(tpz.mod.FOOD_ACCP, 16)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 75)
	target:addMod(tpz.mod.FOOD_MACCP, 16)
    target:addMod(tpz.mod.FOOD_MACC_CAP, 75)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.DEX, 6)
	target:delMod(tpz.mod.INT, 6)
	target:delMod(tpz.mod.FOOD_ACCP, 16)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 75)
	target:delMod(tpz.mod.FOOD_MACCP, 16)
    target:delMod(tpz.mod.FOOD_MACC_CAP, 75)
end