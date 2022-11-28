-----------------------------------------
-- ID: 5894
-- Item: Prime Marine Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP +95
-- ACC +95
-- RACC +95
-- MACC +95
-- Pet: ACC +75
-- Pet: RACC +75
-- Pet: MACC +75
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 5894)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 95)
    target:addMod(tpz.mod.ACC, 95)
    target:addMod(tpz.mod.RACC, 95)
    target:addMod(tpz.mod.MACC, 95)
    target:addPetMod(tpz.mod.ACC, 75)
    target:addPetMod(tpz.mod.RACC, 75)
    target:addPetMod(tpz.mod.MACC, 75)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 95)
    target:delMod(tpz.mod.ACC, 95)
    target:delMod(tpz.mod.RACC, 95)
    target:delMod(tpz.mod.MACC, 95)
    target:delPetMod(tpz.mod.ACC, 75)
    target:delPetMod(tpz.mod.RACC, 75)
    target:delPetMod(tpz.mod.MACC, 75)
end
