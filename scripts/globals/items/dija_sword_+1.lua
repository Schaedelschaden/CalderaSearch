-----------------------------------------
-- ID: 20724
-- Item: Dija Sword +1
-- Additional Effect: TP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local TpDrain = math.random(25, 40)

        if (TpDrain > target:getTP()) then
            TpDrain = target:getTP()
        end

        target:addTP(-TpDrain)
        player:addTP(TpDrain)

        return tpz.subEffect.TP_DRAIN, tpz.msg.basic.ADD_EFFECT_TP_DRAIN, TpDrain
    end
end