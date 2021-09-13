-----------------------------------------
-- ID: 6199
-- Item: Achiyalabopa Quiver
-- When used, you will obtain one stack of Achiyalabopa Arrows
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
    target:addItem(21307, 99)
end