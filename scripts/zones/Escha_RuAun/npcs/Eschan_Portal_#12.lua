-----------------------------------
-- Area: Escha - Ru'Aun
--  NPC: Eschan Portal #2
-- !pos -274.7603 -40.5040 -377.8283 289
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
    -- option (0) = Teleport list using silt only
    -- option (1) = Teleport list using silt only
    -- option (2) = Teleport list choose between Eschan droplets or using silt. Droplets = Next consecutive Portal, Silt = Choose Portal

    local unlocks  = 432013119 -- TODO: Determine the retail hex values used and math this
    local zoneID   = 289
    local portalId = 19
    local option   = 1
	local silt     = player:getCurrency("escha_silt")
    local siltCost = 50

	player:startEvent(9100, 0, unlocks, zoneID, portalId, option, silt, siltCost, 0)
end

function onEventUpdate(player, csid, option)
	if (option == 0x00090001) then
--		player:delItem(9148, 1)
	end

	if (option == 0x00090003) then
		player:messageSpecial(ID.text.ITEM_USED, 9148)
--		player:delItem(9148, 1)
--		player:PrintToPlayer(string.format("You have used a clump of eschan droplets."), tpz.msg.channel.NS_SAY) -- Needs to be replaced with correct ID.text when found
	end
end

function onEventFinish(player, csid, option)
end
