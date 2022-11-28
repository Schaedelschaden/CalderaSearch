-----------------------------------
--
-- Zone: Escha - Zi'Tah (288)
--
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
	
end

function onZoneIn(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-344.882, 1.189, -179.463, 177)
    end

    if player:getCurrentMission(ROV) == tpz.mission.id.rov.EDDIES_OF_DESPAIR_I then
        cs = 1
    end

    return cs
end

function afterZoneIn(player)
	-- player:PrintToPlayer(string.format("You can feel the swirling energies of Escha slowly leech away your communication with Trusts."), tpz.msg.channel.NS_LINKSHELL3)
	-- player:PrintToPlayer(string.format("There must be some way to reestablish contact..."), tpz.msg.channel.NS_LINKSHELL3)
end

function onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
	
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 1 then
        player:completeMission(ROV, tpz.mission.id.rov.EDDIES_OF_DESPAIR_I)
        player:addMission(ROV, tpz.mission.id.rov.A_LAND_AFTER_TIME)
    end
end
