-----------------------------------
-- Area: Morimar Basalt Fields
--  NPC: Waypoint
-- Frontier Station  !pos 
-- Bivouac #1        !pos 367 -16 37.5 265
-- Bivouac #2        !pos 
-- Bivouac #3        !pos 
-- Bivouac #4        !pos 
-- Bivouac #5        !pos -78.063 -47.295 304.106 265
-----------------------------------

-- local wpEvent = 5005
-- local hpIndex = 48

--							         event, 0x19C03D,0xFF817F,  ?,  ? ,unlock,  ? ,  ?  , ?
-- Frontier Station player:startEvent(5000, 1687613, 16744831, -2, 775, 2753, 1997, 1998, 0)
--							   event, 0x1BC042,0xFF817F,  ?,  ? ,unlock,  ? ,  ?  , ?
-- Bivouac #5 player:startEvent(5005, 1818690, 16744831, -2, 775, 2753, 1997, 1998, 0)

function onTrigger(player, npc)
	if (npc:getID() == 17863392) then
		player:startEvent(5000, 1687613, 16744831, -2, 775, 2753, 1997, 1998, 0) -- Frontier Station
	elseif (npc:getID() == 17863393) then
		player:startEvent(5001, 1425470, 16744831, -2, 775, 2753, 1997, 1998, 0) -- Bivouac #1
	elseif (npc:getID() == 17863394) then
		-- player:startEvent(5002, ) -- Bivouac #2
	elseif (npc:getID() == 17863395) then
		player:startEvent(5003, 1163328, 16744831, -2, 775, 2753, 1997, 1998, 0) -- Bivouac #3
	elseif (npc:getID() == 17863396) then
		-- player:startEvent(5004, ) -- Bivouac #4
	elseif (npc:getID() == 17863397) then
		player:startEvent(5005, 1818690, 16744831, -2, 775, 2753, 1997, 1998, 0) -- Bivouac #5
	end
end

function onEventUpdate(player, csid, option)
    printf("Waypoint.lua onEventUpdate OPTION: [%i]", option)
	if (csid == 5000 and option == 0x40333D) then
		player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #5 from Frontier Station
	end
	
	if (csid == 5001 and option == 0x40333E) then
		player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #5 from Bivouac #1
	end
	
	-- if (csid == 5002 and option == 0x40333E) then
		-- player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #5 from Bivouac #2
	-- end
	
	if (csid == 5003 and option == 0x403340) then
		player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #5 from Bivouac #3
	end
	
	-- if (csid == 5004 and option == 0x40333E) then
		-- player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #5 from Bivouac #4
	-- end
	
	if (csid == 5005 and option == 0x400B42) then
		player:updateEvent(0, 617, 2964, 0, 0, 84, 0, 0) -- Teleport to Frontier Station from Bivouac #5
	elseif (csid == 5005 and option == 0x401342) then
		player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #1 from Bivouac #5
	elseif (csid == 5005 and option == 0x402342) then
		player:updateEvent(0, 16744831, -2, 775, 2753, 84, 1998, 0) -- Teleport to Bivouac #3 from Bivouac #5
	end
end

function onEventFinish(player, csid, option)
    
end