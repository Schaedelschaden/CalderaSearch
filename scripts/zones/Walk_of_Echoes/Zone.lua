-----------------------------------
--
-- Zone: Walk_of_Echoes
--
-----------------------------------
local ID = require("scripts/zones/Walk_of_Echoes/IDs")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1
	
	if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-260, -0, 343, 64)
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end