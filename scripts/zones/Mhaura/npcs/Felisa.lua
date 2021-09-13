-----------------------------------
-- Area: Mhaura
--  NPC: Felisa
-- Admits players to the dock in Mhaura.
-----------------------------------

function onTrade(player, npc, trade)
	if (trade:hasItemQty(65535, 200)) then
		player:tradeComplete()
		player:setPos(0, 0, 0, 0, 50)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("If you would like to teleport to Aht Urhgan Whitegate please trade 200 gil to Felisa."))

    if (player:getZPos() > 38.5) then
        player:startEvent(221, player:getGil(), 100)
    else
        player:startEvent(235)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 221 and option == 333) then
        player:delGil(100)
    end

end
