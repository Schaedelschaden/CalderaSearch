-----------------------------------
-- Area: Morimar Basalt Fields
--  NPC: Scalable Area
-----------------------------------
local ID = require("scripts/zones/Morimar_Basalt_Fields/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	-- !pos 221.097 -16.520 -389.981 265
	if (npc:getID() == 17863478) then
		player:startEvent(40, 265, 0, 0, 519, 2753, 1, 1998, 0)
	-- !pos 218.755 -1.785 -389.756 265
	elseif (npc:getID() == 17863479) then
		player:startEvent(41, 265, 0, 1, 519, 2753, 2, 1998, 0)
	-- !pos 178.713 -16.523 -449.997 265
	elseif (npc:getID() == 17863480) then
		player:startEvent(42, 265, 0, 0, 519, 2753, 3, 1998, 0)
	-- !pos 181.161 -1.875 -450.298 265
	elseif (npc:getID() == 17863481) then
		player:startEvent(43, 265, 0, 1, 519, 2753, 4, 1998, 0)
	-- !pos -90.045 -16.520 181.326
	elseif (npc:getID() == 17863482) then
		player:startEvent(44, 265, 0, 0, 519, 2753, 5, 1998, 0)
	-- !pos -90.282 -1.785 178.920
	elseif (npc:getID() == 17863483) then
		player:startEvent(45, 265, 0, 1, 519, 2753, 6, 1998, 0)
	-- !pos -50.020 -32.520 261.314
	elseif (npc:getID() == 17863484) then
		player:startEvent(46, 265, 0, 0, 519, 2753, 7, 1998, 0)
	-- !pos -50.261 -17.784 259.131
	elseif (npc:getID() == 17863485) then
		player:startEvent(47, 265, 0, 1, 519, 2753, 8, 1998, 0)
	-- !pos -131.019 -48.523 301.254
	elseif (npc:getID() == 17863486) then
		player:startEvent(48, 265, 0, 0, 519, 2753, 9, 1998, 0)
	-- !pos -130.244 -33.784 299.033
	elseif (npc:getID() == 17863487) then
		player:startEvent(49, 265, 0, 1, 519, 2753, 10, 1998, 0)
	-- !pos -181.297 -16.520 69.930
	elseif (npc:getID() == 17863488) then
		player:startEvent(50, 265, 0, 0, 519, 2753, 11, 1998, 0)
	-- !pos -179.099 -1.785 69.752
	elseif (npc:getID() == 17863489) then
		player:startEvent(51, 265, 0, 1, 519, 2753, 12, 1998, 0)
	-- !pos -221.245 -35.527 109.986
	elseif (npc:getID() == 17863490) then
		player:startEvent(52, 265, 0, 0, 519, 2753, 13, 1998, 0)
	-- !pos -219.021 -17.785 109.811
	elseif (npc:getID() == 17863491) then
		player:startEvent(53, 265, 0, 1, 519, 2753, 14, 1998, 0)
	-- !pos -261.313 -48.520 149.955
	elseif (npc:getID() == 17863492) then
		player:startEvent(54, 265, 0, 0, 519, 2753, 15, 1998, 0)
	-- !pos -259.100 -33.784 149.762
	elseif (npc:getID() == 17863493) then
		player:startEvent(55, 265, 0, 1, 519, 2753, 16, 1998, 0)
	end
end