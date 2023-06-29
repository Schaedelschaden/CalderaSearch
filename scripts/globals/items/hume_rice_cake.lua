-----------------------------------------
-- ID: 5294
-- Hume Rice Cake
-- Enchantment: 60Min, Costume - Hume child (female)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 3 or month == 4 or month == 5 then

        if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
            result = tpz.msg.basic.IS_FULL
        end

        return result
    else
        if not target:canUseMisc(tpz.zoneMisc.COSTUME) then
            return tpz.msg.basic.CANT_BE_USED_IN_AREA
        end
        return 0
    end      
end

function onItemUse(target)
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 3 or month == 4 or month == 5 then
        duration = 14400

        target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5550)
        target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
    else
        target:addStatusEffect(tpz.effect.COSTUME, 118, 0, 3600)
    end
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 3 or month == 4 or month == 5 then
        target:addMod(tpz.mod.MND, 15)
        target:addMod(tpz.mod.CHR, 15)
        target:addMod(tpz.mod.CURE_POTENCY_II, 5)
        target:addMod(tpz.mod.WALTZ_POTENTCY, 5)
        target:addMod(tpz.mod.FASTCAST, 5)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 3 or month == 4 or month == 5 then
        target:delMod(tpz.mod.MND, 15)
        target:delMod(tpz.mod.CHR, 15)
        target:delMod(tpz.mod.CURE_POTENCY_II, 5)
        target:delMod(tpz.mod.WALTZ_POTENTCY, 5)
        target:delMod(tpz.mod.FASTCAST, 5)
    end
end
