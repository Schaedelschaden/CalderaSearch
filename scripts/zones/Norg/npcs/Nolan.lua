-----------------------------------
-- Area: Norg
--  NPC: Nolan
-- Escha Gear Augment Services
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	local silt = player:getCurrency("escha_silt")
	local beads = player:getCurrency("escha_bead")
	
    player:startEvent(9501, 0, silt, beads, 0, 0, 0, 0, 0)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	local costNQ = 10
	local costHQ1 = 50
	local costHQ2 = 2000
	local eschalixirID
	local cost
	local quantity
	
	if (csid == 9501) then
		if (option == 0x10001) then
			-- Eschalixir Quantity 1
			cost = costNQ * 1
			quantity = 1
			eschalixirID = 9084
		elseif (option == 0x20001) then
			-- Eschalixir Quantity 2
			cost = costNQ * 2
			quantity = 2
			eschalixirID = 9084
		elseif (option == 0x30001) then
			-- Eschalixir Quantity 3
			cost = costNQ * 3
			quantity = 3
			eschalixirID = 9084
		elseif (option == 0x40001) then
			-- Eschalixir Quantity 4
			cost = costNQ * 4
			quantity = 4
			eschalixirID = 9084
		elseif (option == 0x50001) then
			-- Eschalixir Quantity 5
			cost = costNQ * 5
			quantity = 5
			eschalixirID = 9084
		elseif (option == 0x60001) then
			-- Eschalixir Quantity 6
			cost = costNQ * 6
			quantity = 6
			eschalixirID = 9084
		elseif (option == 0x70001) then
			-- Eschalixir Quantity 7
			cost = costNQ * 7
			quantity = 7
			eschalixirID = 9084
		elseif (option == 0x80001) then
			-- Eschalixir Quantity 8
			cost = costNQ * 8
			quantity = 8
			eschalixirID = 9084
		elseif (option == 0x90001) then
			-- Eschalixir Quantity 9
			cost = costNQ * 9
			quantity = 9
			eschalixirID = 9084
		elseif (option == 0xA0001) then
			-- Eschalixir Quantity 10
			cost = costNQ * 10
			quantity = 10
			eschalixirID = 9084
		elseif (option == 0xB0001) then
			-- Eschalixir Quantity 11
			cost = costNQ * 11
			quantity = 11
			eschalixirID = 9084
		elseif (option == 0xC0001) then
			-- Eschalixir Quantity 12
			cost = costNQ * 12
			quantity = 12
			eschalixirID = 9084
		elseif (option == 0x10101) then
			-- Eschalixir +1 Quantity 1
			cost = costHQ1 * 1
			quantity = 1
			eschalixirID = 9085
		elseif (option == 0x20101) then
			-- Eschalixir +1 Quantity 2
			cost = costHQ1 * 2
			quantity = 2
			eschalixirID = 9085
		elseif (option == 0x30101) then
			-- Eschalixir +1 Quantity 3
			cost = costHQ1 * 3
			quantity = 3
			eschalixirID = 9085
		elseif (option == 0x40101) then
			-- Eschalixir +1 Quantity 4
			cost = costHQ1 * 4
			quantity = 4
			eschalixirID = 9085
		elseif (option == 0x50101) then
			-- Eschalixir +1 Quantity 5
			cost = costHQ1 * 5
			quantity = 5
			eschalixirID = 9085
		elseif (option == 0x60101) then
			-- Eschalixir +1 Quantity 6
			cost = costHQ1 * 6
			quantity = 6
			eschalixirID = 9085
		elseif (option == 0x70101) then
			-- Eschalixir +1 Quantity 7
			cost = costHQ1 * 7
			quantity = 7
			eschalixirID = 9085
		elseif (option == 0x80101) then
			-- Eschalixir +1 Quantity 8
			cost = costHQ1 * 8
			quantity = 8
			eschalixirID = 9085
		elseif (option == 0x90101) then
			-- Eschalixir +1 Quantity 9
			cost = costHQ1 * 9
			quantity = 9
			eschalixirID = 9085
		elseif (option == 0xA0101) then
			-- Eschalixir +1 Quantity 10
			cost = costHQ1 * 10
			quantity = 10
			eschalixirID = 9085
		elseif (option == 0xB0101) then
			-- Eschalixir +1 Quantity 11
			cost = costHQ1 * 11
			quantity = 11
			eschalixirID = 9085
		elseif (option == 0xC0101) then
			-- Eschalixir +1 Quantity 12
			cost = costHQ1 * 12
			quantity = 12
			eschalixirID = 9085
		elseif (option == 0x10201) then
			-- Eschalixir +2 Quantity 1
			cost = costHQ2 * 1
			quantity = 1
			eschalixirID = 9086
		elseif (option == 0x20201) then
			-- Eschalixir +2 Quantity 2
			cost = costHQ2 * 2
			quantity = 2
			eschalixirID = 9086
		elseif (option == 0x30201) then
			-- Eschalixir +2 Quantity 3
			cost = costHQ2 * 3
			quantity = 3
			eschalixirID = 9086
		elseif (option == 0x40201) then
			-- Eschalixir +2 Quantity 4
			cost = costHQ2 * 4
			quantity = 4
			eschalixirID = 9086
		elseif (option == 0x50201) then
			-- Eschalixir +2 Quantity 5
			cost = costHQ2 * 5
			quantity = 5
			eschalixirID = 9086
		elseif (option == 0x60201) then
			-- Eschalixir +2 Quantity 6
			cost = costHQ2 * 6
			quantity = 6
			eschalixirID = 9086
		elseif (option == 0x70201) then
			-- Eschalixir +2 Quantity 7
			cost = costHQ2 * 7
			quantity = 7
			eschalixirID = 9086
		elseif (option == 0x80201) then
			-- Eschalixir +2 Quantity 8
			cost = costHQ2 * 8
			quantity = 8
			eschalixirID = 9086
		elseif (option == 0x90201) then
			-- Eschalixir +2 Quantity 9
			cost = costHQ2 * 9
			quantity = 9
			eschalixirID = 9086
		elseif (option == 0xA0201) then
			-- Eschalixir +2 Quantity 10
			cost = costHQ2 * 10
			quantity = 10
			eschalixirID = 9086
		elseif (option == 0xB0201) then
			-- Eschalixir +2 Quantity 11
			cost = costHQ2 * 11
			quantity = 11
			eschalixirID = 9086
		elseif (option == 0xC0201) then
			-- Eschalixir +2 Quantity 12
			cost = costHQ2 * 12
			quantity = 12
			eschalixirID = 9086
		end
		
		if (cost ~= nil and cost > 0) then
			player:delCurrency("escha_bead", cost)
			player:addItem(eschalixirID, quantity)
			player:messageSpecial(ID.text.ITEM_OBTAINED, eschalixirID)
		end
	end
end