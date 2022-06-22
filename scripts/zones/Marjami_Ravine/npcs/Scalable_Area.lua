-----------------------------------
-- Area: Marjami Ravine
-- NPC: Scalable Area (multiple)
-- Used to move between areas
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	-- !pos 331.886 -39.923 -128.500
	if (npc:getID() == 17867176) then
		player:startEvent(14, 266, 0, 0, 0, 0, 1, 0, 8)
	-- !pos 331.833 -20.205 -130.765
	elseif (npc:getID() == 17867177) then
		player:startEvent(15, 266, 0, 0, 0, 0, 2, 0, 8)
	-- !pos 271.483 -59.917 92.095
	elseif (npc:getID() == 17867178) then
		player:startEvent(16, 266, 0, 0, 0, 0, 3, 0, 8)
	-- !pos 269.003 -40.124 92.170
	elseif (npc:getID() == 17867179) then
		player:startEvent(17, 266, 0, 0, 0, 0, 4, 0, 8)
	-- !pos 227 -59.916 191.476
	elseif (npc:getID() == 17867180) then
		player:startEvent(18, 266, 0, 0, 0, 0, 5, 0, 8)
	-- !pos 227.806 -40.121 188.977
	elseif (npc:getID() == 17867181) then
		player:startEvent(19, 266, 0, 0, 0, 0, 6, 0, 8)
	-- !pos 271.526 -59.922 252.018
	elseif (npc:getID() == 17867182) then
		player:startEvent(20, 266, 0, 0, 0, 0, 7, 0, 8)
	-- !pos 268.972 -40.115 252.125
	elseif (npc:getID() == 17867183) then
		player:startEvent(21, 266, 0, 0, 0, 0, 8, 0, 8)
	-- !pos 268.032 -19.911 -111.428
	elseif (npc:getID() == 17867184) then
		player:startEvent(22, 266, 0, 0, 0, 0, 9, 0, 8)
	-- !pos 268.172 -0.246 -109.393
	elseif (npc:getID() == 17867185) then
		player:startEvent(23, 266, 0, 0, 0, 0, 10, 0, 8)
	-- !pos 108.007 20.086 -128.544
	elseif (npc:getID() == 17867186) then
		player:startEvent(24, 266, 0, 0, 0, 0, 11, 0, 8)
	-- !pos 107.760 39.791 -130.673
	elseif (npc:getID() == 17867187) then
		player:startEvent(25, 266, 0, 0, 0, 0, 12, 0, 8)
	-- !pos -92.037 20.086 -88.537
	elseif (npc:getID() == 17867188) then
		player:startEvent(26, 266, 0, 0, 0, 0, 13, 0, 8)
	-- !pos -92.167 39.774 -90.589
	elseif (npc:getID() == 17867189) then
		player:startEvent(27, 266, 0, 0, 0, 0, 14, 0, 8)
	-- !pos -211.927 -19.912 -151.420
	elseif (npc:getID() == 17867190) then
		player:startEvent(28, 266, 0, 0, 0, 0, 15, 0, 8)
	-- !pos -211.908 -0.198 -149.264
	elseif (npc:getID() == 17867191) then
		player:startEvent(29, 266, 0, 0, 0, 0, 16, 0, 8)
	-- !pos -208.557 -19.915 -211.927
	elseif (npc:getID() == 17867192) then
		player:startEvent(30, 266, 0, 0, 0, 0, 17, 0, 8)
	-- !pos -210.649 -0.235 -211.829
	elseif (npc:getID() == 17867193) then
		player:startEvent(31, 266, 0, 0, 0, 0, 18, 0, 8)
	-- !pos -307.948 -39.913 48.550
	elseif (npc:getID() == 17867194) then
		player:startEvent(32, 266, 0, 0, 0, 0, 19, 0, 8)
	-- !pos -307.848 -20.215 50.631
	elseif (npc:getID() == 17867195) then
		player:startEvent(33, 266, 0, 0, 0, 0, 20, 0, 8)
	-- !pos -271.361 -39.906 228.085
	elseif (npc:getID() == 17867196) then
		player:startEvent(34, 266, 0, 0, 0, 0, 21, 0, 8)
	-- !pos -268.987 -20.116 228.023
	elseif (npc:getID() == 17867197) then
		player:startEvent(35, 266, 0, 0, 0, 0, 22, 0, 8)
	-- !pos -105.022 -18.100 177.665
	elseif (npc:getID() == 17867198) then
		player:startEvent(36, 266, 0, 0, 0, 0, 23, 0, 8)
	-- !pos -106.698 -0.100 179.453
	elseif (npc:getID() == 17867199) then
		player:startEvent(37, 266, 0, 0, 0, 0, 24, 0, 8)
	end
end