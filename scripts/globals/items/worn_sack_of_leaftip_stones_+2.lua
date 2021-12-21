-----------------------------------------
-- ID: 6550
-- Item: Worn Sack of Leaftip Stones +2
-- When used, you will obtain 6-12 Leaftip Stone +2's
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
    target:addItem(8944, math.random(6, 12))
end