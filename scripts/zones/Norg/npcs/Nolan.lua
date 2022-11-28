-----------------------------------
-- Area: Norg
--  NPC: Nolan
-- Escha Gear Augment Services
-- !pos 12.107 0.142 23.005 252
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
					-- Rawhide Mask, Vest, Gloves, Trousers, Boots 
	local zitahGear = {26794, 26950, 27100, 27285, 27460,
					-- Despair Helm, Mail, Gauntlets, Cuisses, Greaves
					  26792, 26948, 27098, 27283, 27458,
					-- Eschite Helm, Breastplate, Gauntlets, Cuisses, Greaves		  
					  26791, 26947, 27097, 27282, 27457,
					-- Naga Somen, Samue, Tekko, Hakama, Kyahan
					  26793, 26949, 27099, 27284, 27459,
					-- Persuer Beret, Doublet, Cuffs, Pants, Gaiters
					  26795, 26951, 27101, 27286, 27461,
					-- Psycloth Tiara, Vest, Manillas, Lappas, Boots
					  26796, 26952, 27102, 27287, 27462,
					-- Vanya Hood, Robe, Cuffs, Slops, Clogs
					  26797, 26953, 27103, 27288, 27463
					  }
		-- Mog Kupon  AW-GF, GFII, GFIII, GeIV
	local augCurrency = {9177, 9176, 9175, 9187}
	local pathKupon = 0
	local eschalixer = {{9084, 60}, {9085, 12}, {9086, 3}}
	local elixerFound = 0
	local augGear = 0
	local zitahGearCounter = 0
	
	-- Check for the required path dictating kupon
	for i = 1, #eschalixer do
		if (npcUtil.tradeHas(trade, {eschalixer[i]})) then
			elixerFound = eschalixer[i]
			break
		end
	end
		
	-- Cancel the transaction if no eschalixer is found or not enough was traded
	if (elixerFound == 0) then
		player:PrintToPlayer(string.format("Nolan : Wheres the magic?"),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for the required path dictating kupon
	for i = 1, #augCurrency do
		if (npcUtil.tradeHas(trade, {augCurrency[i]})) then
			pathKupon = augCurrency[i]
			break
		end
	end
	
	-- Cancel the transaction if no Ancient Currency is found or not enough was traded
	if (pathKupon == 0) then
		player:PrintToPlayer(string.format("Nolan : I really need a Kupon so I know what path you want."),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for the piece of gear
	for i = 1, #zitahGear do
		if (npcUtil.tradeHas(trade, zitahGear[i])) then
			augGear = zitahGear[i]
			zitahGearCounter = i
			break
		end
	end
	
	-- Cancel the transaction if no gear is found
	if (augGear == 0) then
		player:PrintToPlayer(string.format("Nolan : Where's the gear?"),tpz.msg.channel.NS_SAY)
		return
	end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Nolan : This should satisfy you."),tpz.msg.channel.NS_SAY)
	
	-- Path A (Mog Kupon AW-GF)
	if (pathKupon == 9177) then
		-- Rawhide
		if (zitahGearCounter <= 5) then
			player:addItem(augGear, 1, 513, 9, 512, 6, 516, 6) -- DEX +10, STR +7, INT +7 DONE
		-- Despair
		elseif (zitahGearCounter <= 10) then
			player:addItem(augGear, 1, 2, 17, 514, 9, 356, 4) -- HP +50, VIT +10, Cure Pot rec +5 DONE
		-- Eschite
		elseif (zitahGearCounter <= 15) then
			player:addItem(augGear, 1, 3, 15, 39, 6, 54, 3) -- HP +80, ENM +7, PDT -4 DONE
		-- Naga
		elseif (zitahGearCounter <= 20) then
			player:addItem(augGear, 1, 512, 9, 23, 14, 44, 6) -- STR +10, ACC +15, Subtle Blow +7 DONE
		-- Persuer
		elseif (zitahGearCounter <= 25) then
			player:addItem(augGear, 1, 515, 9, 139, 9, 195, 6) -- AGI +10, Rapid Shot +10, Subtle Blow +7 DONE
		-- Psycloth
		elseif (zitahGearCounter <= 30) then
			player:addItem(augGear, 1, 10, 17, 516, 6, 141, 5) -- MP +50, INT +7, Conserve MP +6 DONE
		-- Vanya
		elseif (zitahGearCounter <= 35) then
			player:addItem(augGear, 1, 10, 17, 329, 6, 40, 5) -- MP +50, Cure potency +7%, Enmity -6 DONE
		end
	-- Path B (Mog Kupon AW-GFII)
	elseif (pathKupon == 9176) then
		-- Rawhide
		if (zitahGearCounter <= 5) then
			player:addItem(augGear, 1, 2, 17, 23, 14, 31, 19) -- HP +50, ACC +15, EVA +20 DONE
		-- Despair
		elseif (zitahGearCounter <= 10) then
			player:addItem(augGear, 1, 512, 1, 514, 6, 49, 1) -- STR +12, VIT +7, Gear Haste +2% DONE
		-- Eschite
		elseif (zitahGearCounter <= 15) then
			player:addItem(augGear, 1, 11, 15, 23, 9, 39, 6) -- MP +80, ACC +10, ENM +7 DONE
		-- Naga
		elseif (zitahGearCounter <= 20) then
			player:addItem(augGear, 1, 2, 17, 514, 9, 31, 19) -- HP +50, VIT +10, EVA +20 DONE
		-- Persuer
		elseif (zitahGearCounter <= 25) then
			player:addItem(augGear, 1, 513, 6, 515, 9, 212, 14) -- DEX +7, AGL +10, Recycle +15 DONE
		-- Psycloth
		elseif (zitahGearCounter <= 30) then
			player:addItem(augGear, 1, 35, 9, 53, 14, 517, 6) -- MACC +10, Spell Interruption Rate -15%, MND +7 DONE
		-- Vanya
		elseif (zitahGearCounter <= 35) then
			player:addItem(augGear, 1, 289, 19, 323, 6, 55, 2) -- Healing Magic Skill +20, Cure Cast Time -7%, MDT -3% DONE
		end
	-- Path C (Mog Kupon AW-GEIII)
	elseif (pathKupon == 9175) then
		-- Rawhide
		if (zitahGearCounter <= 5) then
			player:addItem(augGear, 1, 23, 14, 106, 14, 123, 2) -- ACC +15, Pet: ACC +15, Pet: Double Attack +3 DONE
		-- Despair
		elseif (zitahGearCounter <= 10) then
			player:addItem(augGear, 1, 23, 9, 1794, 6, 112, 2) -- ACC +10, Pet: VIT +7, Pet: DT -3% DONE
		-- Eschite
		elseif (zitahGearCounter <= 15) then
			player:addItem(augGear, 1, 37, 14, 53, 14, 39, 6) -- MEVA +15, Spell Interrupt Down -15%, Enmity +7 DONE
		-- Naga
		elseif (zitahGearCounter <= 20) then
			-- player:addItem(augGear, 1, xxx, 28, xxx, 3, xxx, 2) -- Automaton: MP +80, Automaton: Cure Potency +4, Automaton: Fast Cast +3
			player:addItem(augGear, 1, 108, 19, 105, 19) -- Pet: MAcc/MATT +15, Pet: Enm -20
		-- Persuer
		elseif (zitahGearCounter <= 25) then
			player:addItem(augGear, 1, 2, 17, 23, 19, 25, 14) -- HP +50, ACC +20, ATT +15 DONE
		-- Psycloth
		elseif (zitahGearCounter <= 30) then
			player:addItem(augGear, 1, 107, 24, 101, 14, 104, 6) -- Pet: ATT +25, Pet: MATT +15, ENM +7 DONE
		-- Vanya
		elseif (zitahGearCounter <= 35) then
			player:addItem(augGear, 1, 517, 9, 53, 14, 141, 5) -- MND +10, Spell Interruption Rate -15%, Conserve MP +6 DONE
		end
	-- Path D (Mog Kupon AW-GeIV)
	elseif (pathKupon == 9187) then
		if (zitahGearCounter == 1) then -- Rawhide Mask
			player:addItem(augGear, 1, 25, 14, 100, 19, 101, 14) -- ATT +15, Pet: MACC +20, Pet: MAB +15 DONE
		elseif (zitahGearCounter == 2) then -- Rawhide Vest
			player:addItem(augGear, 1, 2, 17, 195, 6, 144, 1) -- HP +50, Subtle Blow +7, Triple Attack +2 DONE
		elseif (zitahGearCounter == 3) then -- Rawhide Gloves
			player:addItem(augGear, 1, 131, 14, 516, 6, 517, 6) -- MACC +15, INT +7, MND +7 DONE
		elseif (zitahGearCounter == 4) then -- Rawhide Trousers
			player:addItem(augGear, 1, 10, 17, 140, 4, 138, 0) -- MP +50, Fast Cast +5, Refresh +1 DONE
		elseif (zitahGearCounter == 5) then -- Rawhide Boots
			player:addItem(augGear, 1, 512, 9, 25, 14, 142, 4) -- STR +10, ATT +15, Store TP +5 DONE
		elseif (zitahGearCounter == 6) then -- Despair Helm
			player:addItem(augGear, 1, 512, 14, 39, 6, 142, 2) -- STR +15, ENM +7, Store TP +3 DONE
		elseif (zitahGearCounter == 7) then -- Despair Mail
			player:addItem(augGear, 1, 25, 24, 37, 19, 132, 2) -- ATT +25, MEVA +20, Double Attach +3 DONE
		elseif (zitahGearCounter == 8) then -- Despair Finger Gauntlets
			player:addItem(augGear, 1, 27, 24, 29, 19, 212, 9) -- RACC +25, RATT +20, Recycle +10 DONE
		elseif (zitahGearCounter == 9) then -- Despair Cuisses
			player:addItem(augGear, 1, 515, 9, 31, 19, 116, 6) -- AGI +10, EVA +20, Subtle Blow +7 DONE
		elseif (zitahGearCounter == 10) then -- Despair Greaves
			player:addItem(augGear, 1, 513, 9, 512, 6, 54, 2) -- DEX +10, STR +7, PDT -3% DONE
		elseif (zitahGearCounter == 11) then -- Eschite Helm
			player:addItem(augGear, 1, 512, 8, 514, 6, 329, 6) -- STR +9, VIT +7, Cure Pot +7 DONE
		elseif (zitahGearCounter == 12) then -- Eschite Breastplate
			player:addItem(augGear, 1, 25, 14, 514, 6, 71, 3) -- ATT +15, VIT +7, DT -4% DONE
		elseif (zitahGearCounter == 13) then -- Eschite Gauntlets
			player:addItem(augGear, 1, 23, 19, 143, 3, 39, 7) -- ACC +20, Double Attack +4, Enmity +7 DONE
		elseif (zitahGearCounter == 14) then -- Eschite Cuisses
			player:addItem(augGear, 1, 131, 24, 141, 5, 140, 4) -- MAB +25, Conserve MP +6, Fast Cast +5 DONE
		elseif (zitahGearCounter == 15) then -- Eschite Greaves
			player:addItem(augGear, 1, 512, 14, 2, 17, 142, 4) -- STR +15, HP +50, Store TP +5 DONE
		elseif (zitahGearCounter == 16) then -- Naga Somen
			player:addItem(augGear, 1, 23, 14, 27, 24, 40, 5) -- ACC +15, RACC +25, ENM -6 DONE
		elseif (zitahGearCounter == 17) then -- Naga Samue
			player:addItem(augGear, 1, 3, 15, 513, 9, 25, 19) -- HP +80, DEX +10, ATT +20 DONE
		elseif (zitahGearCounter == 18) then -- Naga Tekko
			-- player:addItem(augGear, 1, XXX, XXX, 101, 19, 100, 19) -- Pet: MP +80, Pet: MAB +20, Pet: MACC +20
			player:addItem(augGear, 1, 101, 19, 100, 19) -- Pet: MAB +20, Pet: MACC +20 DONE
		elseif (zitahGearCounter == 19) then -- Naga Hakama
			player:addItem(augGear, 1, 25, 19, 29, 24, 41, 3) -- ATT +20, RATT +25, Critical Hit Rate +4% DONE
		elseif (zitahGearCounter == 20) then -- Naga Kyahan
			player:addItem(augGear, 1, 4, 3, 106, 24, 107, 24) -- HP +100, Pet: ACC +25, Pet: ATT +25 DONE
		elseif (zitahGearCounter == 21) then -- Pursuer's Beret
			player:addItem(augGear, 1, 29, 14, 40, 5, 116, 6) -- RATT +15, ENM -6, Subtle Blow +7 DONE
		elseif (zitahGearCounter == 22) then -- Pursuer's Doublet
			player:addItem(augGear, 1, 2, 17, 41, 3, 211, 5) -- HP +50, Critical hit rate +4%, Snapshot +6 DONE
		elseif (zitahGearCounter == 23) then -- Pursuer's Cuffs
			player:addItem(augGear, 1, 29, 14, 512, 6, 54, 3) -- RATT +15, STR +7, PDT -4% DONE
		elseif (zitahGearCounter == 24) then -- Pursuer's Pants
			player:addItem(augGear, 1, 513, 6, 515, 9, 512, 6) -- DEX +7, AGI +10, STR +7 DONE
		elseif (zitahGearCounter == 25) then -- Pursuer's Gaiters
			player:addItem(augGear, 1, 29, 9, 139, 9, 212, 14) -- RACC +10, Rapid Shot +10, Recycle +15 DONE
		elseif (zitahGearCounter == 26) then -- Psycloth Tiara
			player:addItem(augGear, 1, 35, 19, 140, 9, 516, 6) -- MACC +20, Fast Cast +10, INT +7 DONE
		elseif (zitahGearCounter == 27) then -- Psycloth Vest
			player:addItem(augGear, 1, 292, 19, 516, 6, 40, 5) -- Elemental Magic Skill +20, INT +7, ENM -6 DONE
		elseif (zitahGearCounter == 28) then -- Psycloth Manillas
			player:addItem(augGear, 1, 11, 15, 233, 3, 101, 24) -- MP +80, Blood Boon +4, Pet: MAB +25 DONE
		elseif (zitahGearCounter == 29) then -- Psycloth Lappas
			player:addItem(augGear, 1, 11, 15, 35, 14, 140, 6) -- MP +80, MACC +15, Fast Cast +7 DONE
		elseif (zitahGearCounter == 30) then -- Psycloth Boots
			player:addItem(augGear, 1, 100, 19, 101, 19, 104, 6) -- Pet: MACC +20, Pet: MAB +20, Pet: Enm +7 DONE
		elseif (zitahGearCounter == 31) then -- Vanya Hood
			player:addItem(augGear, 1, 10, 17, 140, 9, 49, 1) -- MP +50, Fast Cast +10, Haste +2% DONE
		elseif (zitahGearCounter == 32) then -- Vanya Robe
			player:addItem(augGear, 1, 2, 17, 10, 17, 138, 1) -- HP +50, MP +50, Refresh +2 DONE
		elseif (zitahGearCounter == 33) then -- Vanya Cuffs
			player:addItem(augGear, 1, 518, 9, 297, 9, 35, 19) -- CHR +10, String Skill +10, MACC +20 DONE
		elseif (zitahGearCounter == 34) then -- Vanya Slops
			player:addItem(augGear, 1, 2, 17, 37, 14, 54, 2) -- HP +50, MEVA +15, PDT -3% DONE
		elseif (zitahGearCounter == 35) then -- Vanya Clogs
			player:addItem(augGear, 1, 329, 4, 323, 14, 141, 5) -- Cure pot +5%, Cure Cast -15%, Conserve MP +6 DONE
		end
	end
end

function onTrigger(player, npc)
	-- local silt = player:getCurrency("escha_silt")
	-- local beads = player:getCurrency("escha_bead")
	
    -- player:startEvent(9501, 0, silt, beads, 0, 0, 0, 0, 0)
	player:PrintToPlayer(string.format("Nolan : I'm charged with imbueing the items won from the dark lands of Escha."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	-- local costNQ       = 10
	-- local costHQ1      = 50
	-- local costHQ2      = 2000
	-- local eschalixirID
	-- local cost
	-- local quantity
	
	-- if (csid == 9501) then
		-- if (option == 0x10001) then
			-- -- Eschalixir Quantity 1
			-- cost = costNQ * 1
			-- quantity = 1
			-- eschalixirID = 9084
		-- elseif (option == 0x20001) then
			-- -- Eschalixir Quantity 2
			-- cost = costNQ * 2
			-- quantity = 2
			-- eschalixirID = 9084
		-- elseif (option == 0x30001) then
			-- -- Eschalixir Quantity 3
			-- cost = costNQ * 3
			-- quantity = 3
			-- eschalixirID = 9084
		-- elseif (option == 0x40001) then
			-- -- Eschalixir Quantity 4
			-- cost = costNQ * 4
			-- quantity = 4
			-- eschalixirID = 9084
		-- elseif (option == 0x50001) then
			-- -- Eschalixir Quantity 5
			-- cost = costNQ * 5
			-- quantity = 5
			-- eschalixirID = 9084
		-- elseif (option == 0x60001) then
			-- -- Eschalixir Quantity 6
			-- cost = costNQ * 6
			-- quantity = 6
			-- eschalixirID = 9084
		-- elseif (option == 0x70001) then
			-- -- Eschalixir Quantity 7
			-- cost = costNQ * 7
			-- quantity = 7
			-- eschalixirID = 9084
		-- elseif (option == 0x80001) then
			-- -- Eschalixir Quantity 8
			-- cost = costNQ * 8
			-- quantity = 8
			-- eschalixirID = 9084
		-- elseif (option == 0x90001) then
			-- -- Eschalixir Quantity 9
			-- cost = costNQ * 9
			-- quantity = 9
			-- eschalixirID = 9084
		-- elseif (option == 0xA0001) then
			-- -- Eschalixir Quantity 10
			-- cost = costNQ * 10
			-- quantity = 10
			-- eschalixirID = 9084
		-- elseif (option == 0xB0001) then
			-- -- Eschalixir Quantity 11
			-- cost = costNQ * 11
			-- quantity = 11
			-- eschalixirID = 9084
		-- elseif (option == 0xC0001) then
			-- -- Eschalixir Quantity 12
			-- cost = costNQ * 12
			-- quantity = 12
			-- eschalixirID = 9084
		-- elseif (option == 0x10101) then
			-- -- Eschalixir +1 Quantity 1
			-- cost = costHQ1 * 1
			-- quantity = 1
			-- eschalixirID = 9085
		-- elseif (option == 0x20101) then
			-- -- Eschalixir +1 Quantity 2
			-- cost = costHQ1 * 2
			-- quantity = 2
			-- eschalixirID = 9085
		-- elseif (option == 0x30101) then
			-- -- Eschalixir +1 Quantity 3
			-- cost = costHQ1 * 3
			-- quantity = 3
			-- eschalixirID = 9085
		-- elseif (option == 0x40101) then
			-- -- Eschalixir +1 Quantity 4
			-- cost = costHQ1 * 4
			-- quantity = 4
			-- eschalixirID = 9085
		-- elseif (option == 0x50101) then
			-- -- Eschalixir +1 Quantity 5
			-- cost = costHQ1 * 5
			-- quantity = 5
			-- eschalixirID = 9085
		-- elseif (option == 0x60101) then
			-- -- Eschalixir +1 Quantity 6
			-- cost = costHQ1 * 6
			-- quantity = 6
			-- eschalixirID = 9085
		-- elseif (option == 0x70101) then
			-- -- Eschalixir +1 Quantity 7
			-- cost = costHQ1 * 7
			-- quantity = 7
			-- eschalixirID = 9085
		-- elseif (option == 0x80101) then
			-- -- Eschalixir +1 Quantity 8
			-- cost = costHQ1 * 8
			-- quantity = 8
			-- eschalixirID = 9085
		-- elseif (option == 0x90101) then
			-- -- Eschalixir +1 Quantity 9
			-- cost = costHQ1 * 9
			-- quantity = 9
			-- eschalixirID = 9085
		-- elseif (option == 0xA0101) then
			-- -- Eschalixir +1 Quantity 10
			-- cost = costHQ1 * 10
			-- quantity = 10
			-- eschalixirID = 9085
		-- elseif (option == 0xB0101) then
			-- -- Eschalixir +1 Quantity 11
			-- cost = costHQ1 * 11
			-- quantity = 11
			-- eschalixirID = 9085
		-- elseif (option == 0xC0101) then
			-- -- Eschalixir +1 Quantity 12
			-- cost = costHQ1 * 12
			-- quantity = 12
			-- eschalixirID = 9085
		-- elseif (option == 0x10201) then
			-- -- Eschalixir +2 Quantity 1
			-- cost = costHQ2 * 1
			-- quantity = 1
			-- eschalixirID = 9086
		-- elseif (option == 0x20201) then
			-- -- Eschalixir +2 Quantity 2
			-- cost = costHQ2 * 2
			-- quantity = 2
			-- eschalixirID = 9086
		-- elseif (option == 0x30201) then
			-- -- Eschalixir +2 Quantity 3
			-- cost = costHQ2 * 3
			-- quantity = 3
			-- eschalixirID = 9086
		-- elseif (option == 0x40201) then
			-- -- Eschalixir +2 Quantity 4
			-- cost = costHQ2 * 4
			-- quantity = 4
			-- eschalixirID = 9086
		-- elseif (option == 0x50201) then
			-- -- Eschalixir +2 Quantity 5
			-- cost = costHQ2 * 5
			-- quantity = 5
			-- eschalixirID = 9086
		-- elseif (option == 0x60201) then
			-- -- Eschalixir +2 Quantity 6
			-- cost = costHQ2 * 6
			-- quantity = 6
			-- eschalixirID = 9086
		-- elseif (option == 0x70201) then
			-- -- Eschalixir +2 Quantity 7
			-- cost = costHQ2 * 7
			-- quantity = 7
			-- eschalixirID = 9086
		-- elseif (option == 0x80201) then
			-- -- Eschalixir +2 Quantity 8
			-- cost = costHQ2 * 8
			-- quantity = 8
			-- eschalixirID = 9086
		-- elseif (option == 0x90201) then
			-- -- Eschalixir +2 Quantity 9
			-- cost = costHQ2 * 9
			-- quantity = 9
			-- eschalixirID = 9086
		-- elseif (option == 0xA0201) then
			-- -- Eschalixir +2 Quantity 10
			-- cost = costHQ2 * 10
			-- quantity = 10
			-- eschalixirID = 9086
		-- elseif (option == 0xB0201) then
			-- -- Eschalixir +2 Quantity 11
			-- cost = costHQ2 * 11
			-- quantity = 11
			-- eschalixirID = 9086
		-- elseif (option == 0xC0201) then
			-- -- Eschalixir +2 Quantity 12
			-- cost = costHQ2 * 12
			-- quantity = 12
			-- eschalixirID = 9086
		-- end
		
		-- if (cost ~= nil and cost > 0) then
			-- player:delCurrency("escha_bead", cost)
			-- player:addItem(eschalixirID, quantity)
			-- player:messageSpecial(ID.text.ITEM_OBTAINED, eschalixirID)
		-- end
	-- end
end