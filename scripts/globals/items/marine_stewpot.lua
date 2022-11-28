-----------------------------------------
-- ID: 5893
-- Item: Marine Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP +90
-- ACC +90
-- RACC +90
-- MACC +90
-- Pet: ACC +70
-- Pet: RACC +70
-- Pet: MACC +70
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 5893)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 90)
    target:addMod(tpz.mod.ACC, 90)
    target:addMod(tpz.mod.RACC, 90)
    target:addMod(tpz.mod.MACC, 90)
    target:addPetMod(tpz.mod.ACC, 70)
    target:addPetMod(tpz.mod.RACC, 70)
    target:addPetMod(tpz.mod.MACC, 70)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 90)
    target:delMod(tpz.mod.ACC, 90)
    target:delMod(tpz.mod.RACC, 90)
    target:delMod(tpz.mod.MACC, 90)
    target:delPetMod(tpz.mod.ACC, 70)
    target:delPetMod(tpz.mod.RACC, 70)
    target:delPetMod(tpz.mod.MACC, 70)
end
