-----------------------------------------
-- ID: 6545
-- Item: Worn Sack of Duskslit Stones +1
-- When used, you will obtain 6-12 Duskslit Stone +1's
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = tpz.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addItem(8937, math.random(6, 12))
end