-----------------------------------------
-- ID: 6209
-- Item: Titanium Bullet Pouch
-- When used, you will obtain one stack of Titanium Bullets
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
    target:addItem(21335, 99)
end