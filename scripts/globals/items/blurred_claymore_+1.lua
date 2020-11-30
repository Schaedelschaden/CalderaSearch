-----------------------------------------
-- ID: 21701
-- Item: Blurred Claymore +1
-- Additional Effect: Haste
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 20

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        player:addStatusEffect(tpz.effect.HASTE, 1465, 0, 30)

        local message = tpz.msg.basic.ADD_EFFECT_STATUS

        return tpz.subEffect.HASTE, message, tpz.effect.HASTE
    end
end