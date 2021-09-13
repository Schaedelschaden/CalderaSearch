-----------------------------------------
-- ID: 6344
-- Item: grape_daifuku+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Master MAB + 4 , Pet MAB + 15
-- Accuracy/Ranged Accuracy +11% (cap 54 on master, cap 81 on pet)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD)) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 3600, 6344)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 30)
	target:addMod(tpz.mod.STR, 3)
    target:addMod(tpz.mod.VIT, 4)
    target:addMod(tpz.mod.MATT, 4)
	target:addMod(tpz.mod.FOOD_ATTP, 11)
	target:addMod(tpz.mod.FOOD_ATT_CAP, 55)
	target:addMod(tpz.mod.FOOD_RATTP, 11)
	target:addMod(tpz.mod.FOOD_RATT_CAP, 55)
    target:addMod(tpz.mod.FOOD_ACCP, 11)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 85)
    target:addMod(tpz.mod.FOOD_RACCP, 11)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 85)
    target:addPetMod(tpz.mod.HP, 30)
	target:addPetMod(tpz.mod.STR, 3)
    target:addPetMod(tpz.mod.VIT, 4)
    target:addPetMod(tpz.mod.MATT, 15)
	target:addPetMod(tpz.mod.FOOD_ATTP, 11)
	target:addPetMod(tpz.mod.FOOD_ATT_CAP, 80)
	target:addPetMod(tpz.mod.FOOD_RATTP, 11)
	target:addPetMod(tpz.mod.FOOD_RATT_CAP, 80)
    target:addPetMod(tpz.mod.FOOD_ACCP, 11)
    target:addPetMod(tpz.mod.FOOD_ACC_CAP, 110)
    target:addPetMod(tpz.mod.FOOD_RACCP, 11)
    target:addPetMod(tpz.mod.FOOD_RACC_CAP, 110)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 30)
	target:delMod(tpz.mod.STR, 3)
    target:delMod(tpz.mod.VIT, 4)
    target:delMod(tpz.mod.MATT, 4)
	target:delMod(tpz.mod.FOOD_ATTP, 11)
	target:delMod(tpz.mod.FOOD_ATT_CAP, 55)
	target:delMod(tpz.mod.FOOD_RATTP, 11)
	target:delMod(tpz.mod.FOOD_RATT_CAP, 55)
    target:delMod(tpz.mod.FOOD_ACCP, 11)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 85)
    target:delMod(tpz.mod.FOOD_RACCP, 11)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 85)
    target:delPetMod(tpz.mod.HP, 30)
	target:delPetMod(tpz.mod.STR, 3)
    target:delPetMod(tpz.mod.VIT, 4)
    target:delPetMod(tpz.mod.MATT, 15)
	target:delPetMod(tpz.mod.FOOD_ATTP, 11)
	target:delPetMod(tpz.mod.FOOD_ATT_CAP, 80)
	target:delPetMod(tpz.mod.FOOD_RATTP, 11)
	target:delPetMod(tpz.mod.FOOD_RATT_CAP, 80)
    target:delPetMod(tpz.mod.FOOD_ACCP, 11)
    target:delPetMod(tpz.mod.FOOD_ACC_CAP, 110)
    target:delPetMod(tpz.mod.FOOD_RACCP, 11)
    target:delPetMod(tpz.mod.FOOD_RACC_CAP, 110)
end