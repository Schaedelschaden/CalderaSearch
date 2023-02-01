-----------------------------------------
-- ID: 5550
-- Item: Roll of Buche Au Chocolat
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +8
-- MP +3% Cap 13
-- Intelligence +2
-- HP Recovered while healing +1
-- MP Recovered while healing +4
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
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 1 or month == 2 or month == 12 then
        duration = 14400
    end

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5550)
    target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:addMod(tpz.mod.MND, 15)
        target:addMod(tpz.mod.CHR, 15)
        target:addMod(tpz.mod.CURE_POTENCY_II, 5)
        target:addMod(tpz.mod.WALTZ_POTENTCY, 5)
        target:addMod(tpz.mod.FASTCAST, 5)
    else
        target:addMod(tpz.mod.FOOD_MPP, 3)
        target:addMod(tpz.mod.FOOD_MP_CAP, 13)
        target:addMod(tpz.mod.HP, 8)
        target:addMod(tpz.mod.INT, 2)
        target:addMod(tpz.mod.HPHEAL, 1)
        target:addMod(tpz.mod.MPHEAL, 4)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:delMod(tpz.mod.MND, 15)
        target:delMod(tpz.mod.CHR, 15)
        target:delMod(tpz.mod.CURE_POTENCY_II, 5)
        target:delMod(tpz.mod.WALTZ_POTENTCY, 5)
        target:delMod(tpz.mod.FASTCAST, 5)
    else
        target:delMod(tpz.mod.FOOD_MPP, 3)
        target:delMod(tpz.mod.FOOD_MP_CAP, 13)
        target:delMod(tpz.mod.HP, 8)
        target:delMod(tpz.mod.INT, 2)
        target:delMod(tpz.mod.HPHEAL, 1)
        target:delMod(tpz.mod.MPHEAL, 4)
    end
end
