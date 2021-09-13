-----------------------------------
-- Area: Western Adoulin
--  NPC: Heemo-Weemo
-- Type: Skirmish NPC
-- !pos 103.05 -0.65 -67.56 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


function onTrade(player, npc, trade)
					  -- Isuka, Sabebus, Usonmunku, Emxgha, Kbiroj, Lekboza, Vunetshelo, Tinhaspa,
	local dynaGear = {20995, 20620, 20722, 20813, 20763, 20862, 20906, 20536,
					  -- Kumalo, Shokudaikiri-mitsutada, Gabaxorea, Twebuliij, Tumafyrig, Cibitshavore, Pulfanxa
					  20949, 21040, 21112, 21177, 21178, 21229, 21276,
					  -- Artsieq Hat, Artsieq Jubbah, Artsieq Cuffs, Artsieq Hose, Artsieq Boots
					  27725, 27871, 28017, 28159, 28296,
					  -- Qaaxo Mask, Qaaxo Harness, Qaaxo Mitaines, Qaaxo Tights, Qaaxo Leggings
					  27724, 27870, 28016, 28158, 28295,
					  -- Xaddi Headgear, Xaddi Mail, Xaddi Gauntlets, Xaddi Cuisses, Xaddi Boots
					  27723, 27869, 28015, 28157, 28294
					  }
					  -- T.Whiteshell, O.Bronzepiece, 1 Byne Bill
	local ancientCurrency = {{1449, 75}, {1452, 75}, {1455, 75}}
	local augCurrency = 0
	local augGear = 0
	local dynaGearCounter = 0
	
	-- Check for the required Ancient Currency
	for i = 1, #ancientCurrency do
		if (npcUtil.tradeHas(trade, {ancientCurrency[i]})) then
			augCurrency = ancientCurrency[i][1]
			break
		end
	end
	
	-- Cancel the transaction if no Ancient Currency is found or not enough was traded
	if (augCurrency == 0) then
		player:PrintToPlayer(string.format("Heemo-Weemo : Hey! Where's my money!?!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for the piece of gear
	for i = 1, #dynaGear do
		if (npcUtil.tradeHas(trade, dynaGear[i])) then
			augGear = dynaGear[i]
			dynaGearCounter = i
			break
		end
	end
	
	-- Cancel the transaction if no gear is found
	if (augWeapon == 0) then
		player:PrintToPlayer(string.format("Heemo-Weemo : So...you want me to augment thin air? You need to trade me a weapon."),tpz.msg.channel.NS_SAY)
		return
	end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Heemo-Weemo : Look what I made!"),tpz.msg.channel.NS_SAY)
	
	-- Path A (T.Whiteshell)
	if (augCurrency == 1449) then
		-- 1h Melee Weapons
		if (dynaGearCounter <= 4) then
			player:addItem(augGear, 1, 45, 2, 512, 6, 25, 9) -- +3 DMG, +7 STR, +10 ATK
		-- 2h Melee Weapons
		elseif (dynaGearCounter <= 10) then
			player:addItem(augGear, 1, 45, 4, 512, 11, 25, 14) -- +5 DMG, +12 STR, +15 ATK
		-- Club
		elseif (dynaGearCounter == 11) then
			player:addItem(augGear, 1, 9, 29, 133, 9, 516, 9) -- +30 MP, +10 MATT, +10 INT
		-- Mage Staff
		elseif (dynaGearCounter == 12) then
			player:addItem(augGear, 1, 9, 28, 9, 30, 133, 14, 516, 11) -- +60 MP, +15 MATT, +12 INT
		-- SMN Staff
		elseif (dynaGearCounter == 13) then
			player:addItem(augGear, 1, 9, 28, 9, 30, 96, 14, 97, 14) -- +60 MP, +15 Pet Acc, +15 Pet ATT
		-- Ranged Weapons
		elseif (dynaGearCounter >= 14 and dynaGearCounter <= 15) then
			player:addItem(augGear, 1, 45, 4, 512, 11, 29, 14) -- +5 DMG, +12 STR, +14 RATT
		-- Artsieq Set
		elseif (dynaGearCounter >= 16 and dynaGearCounter <= 20) then
			player:addItem(augGear, 1, 9, 29, 133, 19, 516, 6) -- +30 MP, +20 MATT, +7 INT
		-- Qaaxo Set
		elseif (dynaGearCounter >= 21 and dynaGearCounter <= 25) then
			player:addItem(augGear, 1, 25, 14, 31, 14, 143, 1) -- +15 ATT, +15 EVA, +2 DOUBLE ATTACK
		-- Xaddi Set
		elseif (dynaGearCounter >= 26 and dynaGearCounter <= 30) then
			player:addItem(augGear, 1, 25, 14, 23, 9, 142, 2) -- +15 ATT, +10 ACC, +3 STP
		end
	-- Path B (O.Bronzepiece)
	elseif (augCurrency == 1452) then
		-- Melee Weapons
		if (dynaGearCounter <= 4) then
			player:addItem(augGear, 1, 45, 2, 513, 6, 23, 9) -- +3 DMG, +7 DEX, +10 ACC
		-- 2h Melee Weapons
		elseif (dynaGearCounter <= 10) then
			player:addItem(augGear, 1, 45, 4, 513, 11, 23, 14) -- +5 DMG, +12 DEX, +15 ACC
		-- Club
		elseif (dynaGearCounter == 11) then
			player:addItem(augGear, 1, 45, 2, 513, 6, 23, 9) -- +3 DMG, +7 DEX, +10 ACC
		-- Mage Staff
		elseif (dynaGearCounter == 12) then
			player:addItem(augGear, 1, 9, 28, 9, 30, 35, 14, 517, 11) -- +60 MP, +15 MACC, +12 MND
		-- SMN Staff
		elseif (dynaGearCounter == 13) then
			player:addItem(augGear, 1, 9, 28, 9, 30, 108, 14) -- +60 MP, +15 Pet MATT, +15 Pet MACC
		-- Ranged Weapons
		elseif (dynaGearCounter >= 14 and dynaGearCounter <= 15) then
			player:addItem(augGear, 1, 45, 4, 515, 11, 27, 14) -- +5 DMG, +12 AGL, +14 RACC
		-- Artsieq Set
		elseif (dynaGearCounter >= 16 and dynaGearCounter <= 20) then
			player:addItem(augGear, 1, 9, 29, 35, 19, 517, 6) -- +30 MP, +20 MACC, +7 MND
		-- Qaaxo Set
		elseif (dynaGearCounter >= 21 and dynaGearCounter <= 25) then
			player:addItem(augGear, 1, 23, 14, 54, 2, 512, 6) -- +15 ACC, -3 PDT, +7 STR
		-- Xaddi Set
		elseif (dynaGearCounter >= 26 and dynaGearCounter <= 30) then
			player:addItem(augGear, 1, 23, 14, 54, 2, 512, 6) -- +15 ACC, -3 PDT, +7 STR
		end
	-- Path C (1 Byne Bill)
	elseif (augCurrency == 1455) then
		if (dynaGearCounter == 1) then -- Isuka
			player:addItem(augGear, 1, 25, 14, 54, 2, 133, 14) -- +15 ATT, -3 PDT, +15 MATT
		elseif (dynaGearCounter == 2) then -- Sabebus
			player:addItem(augGear, 1, 25, 9, 31, 9, 143, 2) -- +10 ATT, +10 EVA, +3 DOUBLE ATTACK
		elseif (dynaGearCounter == 3) then -- Usonmunku
			player:addItem(augGear, 1, 1, 29, 1, 15, 23, 9, 55, 2) -- +45 HP, +10 ACC, -3 MDT
		elseif (dynaGearCounter == 4) then -- Emxgha
			player:addItem(augGear, 1, 25, 9, 23, 9, 97, 14) -- +10 ATT, +10 ACC, +15 Pet ATT
		elseif (dynaGearCounter == 5) then -- Kbiroj
			player:addItem(augGear, 1, 1, 29, 1, 15, 23, 9, 54, 4) -- +45 HP, +10 ACC, -5 PDT
		elseif (dynaGearCounter == 6) then -- Lekboza
			player:addItem(augGear, 1, 25, 14, 23, 14, 143, 2) -- +15 ATT, +15 ACC, +3 DOUBLE ATTACK
		elseif (dynaGearCounter == 7) then -- Vunetshelo
			player:addItem(augGear, 1, 9, 29, 133, 19, 516, 14) -- +30 MP, +20 MATT, +15 INT
		elseif (dynaGearCounter == 8) then -- Tinhapsa
			player:addItem(augGear, 1, 25, 14, 513, 6, 142, 6) -- +15 ATT, +7 DEX, +7 STP
		elseif (dynaGearCounter == 9) then -- Kumalo
			player:addItem(augGear, 1, 25, 14, 23, 14, 97, 19) -- +15 ATT, +15 ACC, +20 Pet ATT
		elseif (dynaGearCounter == 10) then -- Shokudaikiri-mitsutada
			player:addItem(augGear, 1, 512, 9, 353, 9, 142, 9) -- +10 STR, +500 TP bonus, +10 STP
		elseif (dynaGearCounter == 11) then -- Gabaxorea
			player:addItem(augGear, 1, 513, 6, 23, 9, 54, 2) -- +7 DEX, +10 ACC, -3 PDT
		elseif (dynaGearCounter == 12) then -- Twebuliij
			player:addItem(augGear, 1, 1, 29, 1, 15, 23, 9, 54, 4) -- +45 HP, +10 ACC, -5 PDT
		elseif (dynaGearCounter == 13) then -- Tumafyrig
			player:addItem(augGear, 1, 54, 4, 108, 14) -- -5 PDT, +15 Pet MATT, +15 Pet MACC
		elseif (dynaGearCounter == 14) then -- Cibitshavore
			player:addItem(augGear, 1, 512, 11, 27, 9, 142, 6) -- +12 STR, +10 RACC, +7 STP
		elseif (dynaGearCounter == 15) then -- Pulfanxa
			player:addItem(augGear, 1, 515, 11, 133, 9, 211, 2) -- +12 AGL, +10 MATT, +3 Snapshot
		elseif (dynaGearCounter == 16) then -- Artsieq Hat
			player:addItem(augGear, 1, 35, 24, 37, 9, 55, 4) -- +25 MACC, +10 MEVA, -5 MDT
		elseif (dynaGearCounter == 17) then -- Artsieq Jubbah
			player:addItem(augGear, 1, 9, 28, 9, 30, 35, 14, 133, 14) -- +60 MP, +15 MACC, +15 MATT
		elseif (dynaGearCounter == 18) then -- Artsieq Cuffs
			player:addItem(augGear, 1, 9, 29, 96, 14, 97, 14) -- +30 MP, +15 Pet Acc, +15 Pet ATT
		elseif (dynaGearCounter == 19) then -- Artsieq Hose
			player:addItem(augGear, 1, 35, 24, 37, 9, 54, 4) -- +25 MACC, +10 MEVA, -5 PDT
		elseif (dynaGearCounter == 20) then -- Artsieq Boots
			player:addItem(augGear, 1, 9, 29, 108, 19) -- +30 MP, +20 Pet MATT, +20 Pet MACC
		elseif (dynaGearCounter == 21) then -- Qaaxo Mask
			player:addItem(augGear, 1, 25, 14, 512, 11, 142, 2) -- +15 ATT, +12 STR, +3 STP
		elseif (dynaGearCounter == 22) then -- Qaaxo Harness
			player:addItem(augGear, 1, 23, 14, 96, 19, 97, 19) -- +15 ACC, +20 Pet Acc, +20 Pet ATT
		elseif (dynaGearCounter == 23) then -- Qaaxo Mitaines
			player:addItem(augGear, 1, 211, 2, 27, 14, 142, 2) -- +12 STR, +15 RACC, +3 STP
		elseif (dynaGearCounter == 24) then -- Qaaxo Tights
			player:addItem(augGear, 1, 3, 1, 1, 9, 37, 9, 54, 4) -- +75 HP, +10 ACC, -5 PDT
		elseif (dynaGearCounter == 25) then -- Qaaxo Leggings
			player:addItem(augGear, 1, 25, 14, 512, 11, 133, 14) -- +15 ATT, +12 STR, +15 MATT
		elseif (dynaGearCounter == 26) then -- Xaddi Headgear
			player:addItem(augGear, 1, 23, 14, 513, 11, 512, 6) -- +15 ACC, +12 DEX, +7 STR
		elseif (dynaGearCounter == 27) then -- Xaddi Mail
			player:addItem(augGear, 1, 514, 11, 54, 4, 55, 2) -- +12 VIT, -5 PDT, -3 MDT
		elseif (dynaGearCounter == 28) then -- Xaddi Gauntlets
			player:addItem(augGear, 1, 23, 14, 143, 1, 142, 2) -- +15 ACC, +2 Double Attack, +3 STP
		elseif (dynaGearCounter == 29) then -- Xaddi Cuisses
			player:addItem(augGear, 1, 3, 1, 1, 9, 37, 14, 31, 14) -- +75 HP, +15 EVA, +15 MEVA
		elseif (dynaGearCounter == 30) then -- Xaddi Boots
			player:addItem(augGear, 1, 25, 14, 143, 1, 512, 6) -- +15 ATT, +2 Double Attack, +7 STR
		end
	end
	
	
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Heemo-Weemo : If you bring me any equipment you find in the dark worlds, along with 75 of an ancient currency, I can make them even better!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end