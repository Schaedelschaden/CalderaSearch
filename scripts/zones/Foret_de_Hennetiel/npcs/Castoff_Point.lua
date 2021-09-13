-----------------------------------
-- Area: Foret de Hennetiel
-- NPC: Castoff Point
-----------------------------------

-----------------------------------

function onTrigger(player, npc)
    if (npc:getID() == 17850930) then
		player:setPos(-8.0293, -0.4452, 60.3396, 251)
	end
	
	if (npc:getID() == 17850931) then
		player:setPos(-111.6998, -0.4161, 140.3671, 123)
	end
end

function onEventUpdate(player, csid, option)
    
end

function onEventFinish(player, csid, option)
    
end