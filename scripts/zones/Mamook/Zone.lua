-----------------------------------
--
-- Zone: Mamook (65)
--
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)
	
	-- Gulool Ja Ja's spawn ???
	GetNPCByID(16999018):setPos(-290.538, 17.777, -379.968, 0)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-117.491, -20.115, -299.997, 6)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
