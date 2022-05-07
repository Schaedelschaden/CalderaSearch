-----------------------------------
-- Area: Western Adoulin
--  NPC: Divainy-Gamainy
-- Type: Skirmish NPC
-- !pos 103.05 -0.65 -67.56 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
						  -- Ninzas +2, Leisilonu +2, Iztaasu +2, Crobaci +2, Faizzeer +2, Iclamar +2, Iizamal +2, Qatsunoci +2
	local acceptedItem = {20539, 20623, 20725, 20764, 20816, 20863, 20907, 20952,
						  -- Kannakiri +2, Shichishito +2, Lehbrailg +2, Uffrat +2, Aedold +2, Bocluamni +2, Hgafircian +2
						  20996, 21043, 21179, 21180, 21115, 21230, 21279,
						  -- Gorney Morion +1, Haubert +1, Moufles +1, Brayettes +1, Sollerets +1, Thurandaut Chapeau +1, Tabard +1, Gloves +1
						  27711, 27863, 28010, 28152, 28289, 27712, 27864, 28011,
						  -- Thur Tights +1, Boots +1, Weatherspoon Corona +1, Robe +1, Cuffs +1, Pants +1, Souliers +1
						  28153, 28290, 27713, 27865, 28012, 28154, 28291}
	
	-- DMG, STR, DEX, VIT, AGI, ATK, ACC, Dbl Atk, Crit Hit Rate, PDT
	local augmentsMelee = {45, 512, 513, 514, 515, 25, 23, 143, 41, 54}
	-- DMG, STR, DEX, VIT, AGI, RATK, RACC, Recycle, Snapshot, Rapid Shot
	local augmentsRanged = {45, 512, 513, 514, 515, 29, 27, 212, 211, 139}
	-- DMG, INT, Spell Interruption Rate Down, Fast Cast, -Enmity, MAB, MACC, Conserve MP, Cure Potency, Magic Burst DMG
	local augmentsMagic = {45, 516, 53, 140, 40, 133, 35, 141, 329, 334}
	-- DMG, INT, MND, CHR, Perp Cost, Pet: ATK/RATK, Pet: ACC/RACC, Pet: MAB, Pet: MACC, Pet: Damage Taken
	local augmentsPet = {45, 516, 517, 518, 321, 107, 106, 101, 100, 112}
	-- Gorney (HP +60), Thurandaut (HP +40, MP +20), Weatherspoon (MP +60)
	local augmentsArmor = {{2, 27}, {2, 7}, {9, 19}, {10, 27}}
	-- Kupon I-S1 from Low 5 Battlefields
	local kupon = 8734
	-- 100 Byne Bill, Montiont Silverpiece, Lungo-Nango Jadeshell
	local ancientCurrency = {1456, 1453, 1450}
	local augItem = 0
	local randomValues = true
	local aug1 = 1
	local aug2 = math.random(2, 5)
	local aug3 = math.random(6, 10)
	local aug1Value = math.random(4, 14)
	local aug2Value = math.random(2, 6)
	local aug3Value = math.random(9, 14)
	
	if (aug3 >= 8) then
		aug3Value = math.random(0, 4)
	end
	
	if not (npcUtil.tradeHas(trade, kupon)) then
		player:PrintToPlayer(string.format("Divainy-Gamainy : You have to include a Kupon I-S1 in your trade!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	for i = 1, #acceptedItem do
		if (npcUtil.tradeHas(trade, acceptedItem[i])) then
			augItem = acceptedItem[i]
			break
		end
	end
	
	
	if (augItem == 0) then
		player:PrintToPlayer(string.format("Divainy-Gamainy : You have to include a Weapon or Armor piece from Promyvion in your trade!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Uses a 100-piece Ancient Currency to force max values
	if (npcUtil.tradeHas(trade, ancientCurrency[1]) or npcUtil.tradeHas(trade, ancientCurrency[2]) or npcUtil.tradeHas(trade, ancientCurrency[3])) then
		randomValues = false
	end
	
	if (randomValues == false) then
		aug1Value = 14
		aug2Value = 6
		aug3Value = 14
		if (aug3 >= 8) then
			aug3Value = 4
		end
	end
	
	-- -- Return a Kupon for easier testing, remove later
	-- player:addItem(kupon, 1)
	
	-- -- Return the currency for easier testing, remove later
	-- for i = 1, 3 do
		-- if (npcUtil.tradeHas(trade, ancientCurrency[i])) then
			-- player:addItem(ancientCurrency[i], 1)
		-- end
	-- end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Divainy-Gamainy : It was tricky but here's your augmented item!"),tpz.msg.channel.NS_SAY)
	
	-- Melee Weapons
	if (augItem == 20539 or augItem == 20623 or augItem == 20725 or augItem == 20764 or augItem == 20816 or
		augItem == 20863 or augItem == 20907 or augItem == 20952 or augItem == 20996 or augItem == 21043) then
		player:addItem(augItem, 1, augmentsMelee[aug1], aug1Value, augmentsMelee[aug2], aug2Value, augmentsMelee[aug3], aug3Value)
	-- Ranged Weapons
	elseif (augItem == 21230 or augItem == 21279) then
		player:addItem(augItem, 1, augmentsRanged[1], aug1Value, augmentsRanged[aug2], aug2Value, augmentsRanged[aug3], aug3Value)
	-- Magic Weapons
	elseif (augItem == 21179 or augItem == 21115) then
		player:addItem(augItem, 1, augmentsMagic[1], aug1Value, augmentsMagic[aug2], aug2Value, augmentsMagic[aug3], aug3Value)
	-- Pet Weapons
	elseif (augItem == 21180) then
		if (aug3 < 10 and randomValues == true) then
			aug3Value = math.random(9, 14)
		elseif (aug3 < 10 and randomValues == false) then
			aug3Value = 14
		end
		
		player:addItem(augItem, 1, augmentsPet[1], aug1Value, augmentsPet[aug2], aug2Value, augmentsPet[aug3], aug3Value)
	-- Gorney Armor Set
	elseif (augItem == 27711 or augItem == 27863 or augItem == 28010 or augItem == 28152 or augItem == 28289) then
		player:addItem(augItem, 1, augmentsArmor[1][1], augmentsArmor[1][2])
	-- Thurandaut Armor Set
	elseif (augItem == 27712 or augItem == 27864 or augItem == 28011 or augItem == 28153 or augItem == 28290) then
		player:addItem(augItem, 1, augmentsArmor[2][1], augmentsArmor[2][2], augmentsArmor[3][1], augmentsArmor[3][2])
	-- Weatherspoon Armor Set
	elseif (augItem == 27713 or augItem == 27865 or augItem == 28012 or augItem == 28154 or augItem == 28291) then
		player:addItem(augItem, 1, augmentsArmor[4][1], augmentsArmor[4][2])
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Divainy-Gamainy : My brother dabbles with items from that filthy dark world. I, on the other hand, improve equipment found in the Empty lands."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end