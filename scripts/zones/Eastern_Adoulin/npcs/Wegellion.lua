-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Wegellion
-- Type: Oboro/Unity Aug NPC
-- !pos -96 -.65 -50.676 257
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


function onTrade(player, npc, trade)
					  -- Minos, Nyepel, Sindri, Kaladanda, Egeking, Sandung, Priwen, Cronus, (1-8)
	local augmentGear = {20860, 20534, 21110, 21173, 20720, 20618, 28648, 20904,
					  -- Arktoi, Terpander, Lionsquall, Kurikaranotachi, Shigi, Areadbhar, Gridarvor (9-15)
						20811, 21407, 21277, 21039, 20994, 20948, 21174,
					  -- Mimesis, Deathlocke, Ohtas, Polyhymnia, Coeus, Dunna, Aettir (16-22)
						20721, 21278, 20535, 20619, 21175, 21372, 20761,
					  }
					  -- Plutons, Beitetsu, Riftworn Boulder
	local tierCurrency = {{4059, 20}, {4060, 20}, {4061, 20}}
	local augCurrency = 0
	local augGear = 0
	local augmentGearCounter = 0
	
	-- Check for the required Ancient Currency
	for i = 1, #tierCurrency do
		if (npcUtil.tradeHas(trade, {tierCurrency[i]})) then
			augCurrency = tierCurrency[i][1]
			break
		end
	end
	
	-- Cancel the transaction if no Ancient Currency is found or not enough was traded
	if (augCurrency == 0) then
		player:PrintToPlayer(string.format("Wegellion : Hmmmm. Something seems to be missing here."),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for the piece of gear
	for i = 1, #augmentGear do
		if (npcUtil.tradeHas(trade, augmentGear[i])) then
			augGear = augmentGear[i]
			augmentGearCounter = i
			break
		end
	end
	
	-- Cancel the transaction if no gear is found
	if (augWeapon == 0) then
		player:PrintToPlayer(string.format("Wegellion : What am I supposed to do with this?"),tpz.msg.channel.NS_SAY)
		return
	end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Wegellion : I think that will do."),tpz.msg.channel.NS_SAY)
	
	if (augCurrency == 4059) then
		if (augmentGearCounter == 1) then -- Minos
			player:addItem(augGear, 1, 45, 16, 1356, 5, 41, 4, 143, 5) -- +16 DMG, +70 ACC, +6 DOUBLE ATTACK, +5 Crit Hit Rate
		elseif (augmentGearCounter == 2) then -- Nyepel
			player:addItem(augGear, 1, 45, 21, 1356, 5, 512, 9, 142, 4) -- +22 DMG, +70 ACC, +10 STR, +5 Store TP
		elseif (augmentGearCounter == 3) then -- Sindri
			player:addItem(augGear, 1, 45, 4, 62, 17, 25, 29, 143, 4) -- +5 DMG, +50 ACC, +30 ATT, +5 Double Attack
		elseif (augmentGearCounter == 4) then -- Kaladanda
			player:addItem(augGear, 1, 45, 15, 64, 17, 362, 29, 140, 5) -- +16 DMG, +50 MACC, +30 MDMG, +6 Fast Cast
		elseif (augmentGearCounter == 5) then -- Egeking
			player:addItem(augGear, 1, 45, 15, 62, 17, 25, 29, 140, 7) -- +16 DMG, +50 ACC, +30 ATT, +8 Fast Cast
		elseif (augmentGearCounter == 6) then -- Sandung
			player:addItem(augGear, 1, 45, 7, 62, 17, 41, 4, 144, 2) -- +8 DMG, +50 ACC, +5 Crit hit rate, +3 triple Attack
		elseif (augmentGearCounter == 7) then -- Priwen
			player:addItem(augGear, 1, 2, 17, 37, 31, 37, 17, 71, 2) -- +50 HP, +50 MEVA, -3 DT
		elseif (augmentGearCounter == 8) then -- Cronus
			player:addItem(augGear, 1, 45, 21, 1356, 5, 327, 9) -- +22 DMG, +70 ACC, +10 WSD
		elseif (augmentGearCounter == 9) then -- Arktoi
			player:addItem(augGear, 1, 106, 31, 106, 17, 107, 29, 62, 17) -- +50 pet:ACC/RACC, +30 pet:ATT/RATT, +50 ACC
		elseif (augmentGearCounter == 10) then -- Terpander
			player:addItem(augGear, 1, 1, 29, 35, 9, 71, 2) -- +30 HP, +10 MACC, -3% DT
		elseif (augmentGearCounter == 11) then -- Lionsquall
			player:addItem(augGear, 1, 45, 8, 63, 17, 142, 7, 211, 4) -- +9 DMG, +50 RACC, +8 Store TP, +5 Snapshot
		elseif (augmentGearCounter == 12) then -- Kurikaranotachi
			player:addItem(augGear, 1, 45, 18, 1356, 5, 327, 4, 143, 4) -- +19 DMG, +70 ACC, +5 WSD, +5 Double attack
		elseif (augmentGearCounter == 13) then -- Shigi
			player:addItem(augGear, 1, 45, 16, 62, 17, 63, 17, 71, 4) -- +17 DMG, +50 ACC, +50 RACC, -5% DT
		elseif (augmentGearCounter == 14) then -- Areadbhar
			player:addItem(augGear, 1, 45, 30, 1356, 5, 142, 7) -- +31 DMG, +70 ACC, +8 Store TP
		elseif (augmentGearCounter == 15) then -- Gridarvor
			player:addItem(augGear, 1, 96, 31, 97, 31, 123, 14, 369, 9) -- +37 ATT/RATT/ACC/RACC, +15 Pet: Double attack, +10 Blood Pact Damage
		elseif (augmentGearCounter == 16) then -- Mimesis
			player:addItem(augGear, 1, 45, 11, 64, 17, 362, 29, 62, 17) -- +12 DMG, +50 MACC, +30 MDMG, +50 ACC
		elseif (augmentGearCounter == 17) then -- Deathlocke
			player:addItem(augGear, 1, 45, 29, 362, 29, 515, 9, 133, 9) -- +30 DMG, +30 MDMG, +10 AGL, +10 MATK
		elseif (augmentGearCounter == 18) then -- Ohtas
			player:addItem(augGear, 1, 97, 31, 97, 31, 111, 9, 1356, 5) -- +64 Pet: ACC/RACC, +10 Pet: Double Haste, +70 ACC
		elseif (augmentGearCounter == 19) then -- Polyhymnia
			player:addItem(augGear, 1, 45, 9, 62, 17, 142, 7, 327, 4) -- +10 DMG, +50 ACC, +8 Store TP, +5 WSD%
		elseif (augmentGearCounter == 20) then -- Coeus
			player:addItem(augGear, 1, 45, 15, 64, 17, 133, 9, 140, 2) -- +16 DMG, +50 MACC, +10 MATK, +3 Fast Cast
		elseif (augmentGearCounter == 21) then -- Dunna
			player:addItem(augGear, 1, 1, 19, 35, 9, 140, 2) -- +20 MP, +10 MACC, +3 Fast Cast
		elseif (augmentGearCounter == 22) then -- Aettir
			player:addItem(augGear, 1, 37, 31, 37, 31, 1356, 5, 327, 9) -- +64 MEVA, +70 ACC, +10 WSD
		end
	end
	
	
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Wegellion : There are a lot of big baddies around the world. I bet I could make their stuff better!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end