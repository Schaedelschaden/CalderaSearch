-----------------------------------
-- Infernal_Transposer
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/RaKaznar_Inner_Court/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    if (trade:hasItemQty(538, 1) == true and trade:getItemCount() == 1) then --Magicked Skull
        for _, member in pairs(player:getAlliance()) do
            member:setPos(900, 99, 20, 245)
        end
        player:tradeComplete()
        SpawnMob(17908008)
        GetMobByID(17908008):setPos(player:getXPos() + 5, player:getYPos(), player:getZPos(), player:getRotPos())
        GetMobByID(17908008):updateEnmity(player)
        SpawnMob(17908053)
        GetMobByID(17908053):setPos(player:getXPos() + 3, player:getYPos() + 1, player:getZPos() + 2, player:getRotPos())
        GetMobByID(17908053):updateEnmity(player)
    end        

end

function onTrigger(player, npc)

end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)
end
