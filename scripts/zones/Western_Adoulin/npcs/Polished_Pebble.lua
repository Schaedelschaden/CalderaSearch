-----------------------------------
-- Area: Western Adoulin
--  NPC: Polished Pebble
-- Type: JSE Cape Aug
-- !pos 103.05 -0.65 -67.56 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


function onTrade(player, npc, trade)
					-- Mauler's, Anchoret's, Mending, Bane, Ghostfyre, Canny, Weard, Niht, Pastoralist
	local jseCape = {28617, 28618, 28619, 28620, 28621, 28622, 28623, 28624, 28625, 
					-- Lutian, Takaha, Yokaze, Updraft, Coveyance, Cornflower, Gunslinger's, Dispersal, Toetapper
					 28627, 28628, 28629, 28630, 28631, 28632, 28633, 28634, 28635,
					-- Bookworm's, Lifestream, Evasionist's, Rhapsode's
					 28636, 28637, 28638, 28626}
	local kupon = {{3972, 3}} -- 3 Kupon I-S2
	local augGear = 0
	
	
	-- Cancel the transaction if no Kupon is found or not enough was traded
	if not (npcUtil.tradeHas(trade, kupon)) then
		player:PrintToPlayer(string.format("Polished Pebble : You have to include 3 Kupon I-S2 in your trade!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for the piece of gear
	for i = 1, #jseCape do
		if (npcUtil.tradeHas(trade, jseCape[i])) then
			augGear = jseCape[i]
			jseCapeCounter = i
			break
		end
	end
	
	-- Cancel the transaction if no gear is found
	if (jseCape == 0) then
		player:PrintToPlayer(string.format("Polished Pebble : Kupons and no cape? What am I supposed to do? Miracle it?"),tpz.msg.channel.NS_SAY)
		return
	end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Polished Pebble : Doesn't that look fancy?!"),tpz.msg.channel.NS_SAY)
	
	
	if (jseCapeCounter == 1) then -- Mauler's Mantle
			player:addItem(augGear, 1, 512, 4, 514, 4, 23, 9, 328, 2) -- +5 STR, +5 VIT, +10 ACC +3% Crit Damage
		elseif (jseCapeCounter == 2) then -- Anchoret's Mantle
			player:addItem(augGear, 1, 512, 4, 513, 4, 145, 4, 195, 4) -- +5 STR, +5 DEX, +5 COUNTER, +5 SUBTLE BLOW
		elseif (jseCapeCounter == 3) then -- Mending Cape
			player:addItem(augGear, 1, 35, 9, 289, 9, 290, 9, 329, 4) -- +10 MACC, +10 HEALING MAGIC SKILL, +10 ENHANCING SKILL, CURE POT +5%
		elseif (jseCapeCounter == 4) then -- Bane Cape
			player:addItem(augGear, 1, 133, 4, 292, 9, 293, 9, 140, 4) -- +5 MAB, +10 ELEMENTAL SKILL, +10 DARK SKILL, +5 FAST CAST
		elseif (jseCapeCounter == 5) then -- Ghostfyre Cape 
			player:addItem(augGear, 1, 35, 9, 291, 9, 290, 9, 1354, 19) -- +10 MACC, +10 ENFEEBLING SKILL, +10 ENHANCING SKILL, +20 ENHANCING DURATION
		elseif (jseCapeCounter == 6) then -- Canny Cape
			player:addItem(augGear, 1, 513, 4, 515, 4, 146, 4, 328, 2) -- +5 DEX, +5 AGI, +5 DUAL WIELD, +3% CRIT DAMAGE
		elseif (jseCapeCounter == 7) then -- Weard Mantle 
			player:addItem(augGear, 1, 2, 27, 514, 4, 39, 9, 368, 4) -- +60 HP, +5 VIT, +10 ENM, +5 PHALANX
		elseif (jseCapeCounter == 8) then -- Niht Mantle
			player:addItem(augGear, 1, 25, 14, 293, 9, 343, 24, 327, 4) -- +15 ATK, +10 DARK SKILL, +25 DRAIN/ASPIR, +5% WSD
		elseif (jseCapeCounter == 9) then -- Pastoralist's Mantle
			player:addItem(augGear, 1, 512, 4, 23, 9, 96, 19, 112, 4) -- +5 STR, +10 ACC, +20 PET ACC/RACC, -5% PET DT
		elseif (jseCapeCounter == 10) then -- Lutian Cape
			player:addItem(augGear, 1, 512, 4, 515, 4, 142, 2, 211, 2) -- +5 STR, +5 AGI, +3 STP, +3 SNAPSHOT
		elseif (jseCapeCounter == 11) then -- Takaha Mantle
			player:addItem(augGear, 1, 512, 4, 142, 2, 198, 4, 1264, 7) -- +5 STR, +3 STP, +5 ZANSHIN, +8 MEDITATE DURATION
		elseif (jseCapeCounter == 12) then -- Yokaze Mantle
			player:addItem(augGear, 1, 512, 4, 513, 4, 332, 4, 327, 4) -- +5 STR, +5 DEX, +5% sc DAMAGE, +5% WSD
		elseif (jseCapeCounter == 13) then -- Updraft Mantle
			player:addItem(augGear, 1, 512, 4, 327, 4, 112, 4, 121, 9) -- +5 STR, +5% WSD, -5% PET DT, +10 BREATH 
		elseif (jseCapeCounter == 14) then -- Conveyance Cape
			player:addItem(augGear, 1, 294, 9, 369, 4, 320, 2, 104, 14) -- +10 SUMMONING SKILL, +5 BP DAMAGE, -3 BP RECAST, +15 PET ENMITY
		elseif (jseCapeCounter == 15) then -- Cornflower Cape
			player:addItem(augGear, 1, 9, 29, 513, 4, 23, 9, 299, 9) -- +30 MP, +5 DEX, +10 ACC, +10 BLUE SKILL
		elseif (jseCapeCounter == 16) then -- Gunslinger's Cape
			player:addItem(augGear, 1, 133, 4, 40, 4, 340, 4, 327, 4) -- +5 MAB, -5 ENM, -5 ROLL DELAY, +5% WSD
		elseif (jseCapeCounter == 17) then -- Dispersal Mantle
			player:addItem(augGear, 1, 512, 4, 513, 4, 151, 19, 122, 24) -- +5 STR, +5 DEX, +20 MARTIAL ARTS, +500 PET TP BONUS
		elseif (jseCapeCounter == 18) then -- Toetapper Mantle
			player:addItem(augGear, 1, 142, 4, 146, 4, 370, 29, 327, 4) -- +5 STP, +5 DUAL WIELD, +30 REVERSE FLOURISH, +5% WSD
		elseif (jseCapeCounter == 19) then -- Bookworm's Cape
			player:addItem(augGear, 1, 516, 4, 517, 4, 1249, 19, 371, 9) -- +5 INT, +5 MND, +20 HELIX DURATION, +10 REGEN POTENCY
		elseif (jseCapeCounter == 20) then -- Lifestream Cape
			player:addItem(augGear, 1, 300, 9, 1250, 19, 71, 4, 112, 4) -- +10 GEOMANCY SKILL, +20 INDI DURATION, -5% DT, -5% PET DT
		elseif (jseCapeCounter == 21) then -- Evasionist's Cape
			player:addItem(augGear, 1, 4, 3, 39, 9, 37, 9, 71, 4) -- +100 HP, +10 ENM, +10 MEVA, -5% DT
		elseif (jseCapeCounter == 22) then -- Rhapsode's Cape
			player:addItem(augGear, 1, 1, 29, 35, 9, 40, 9, 71, 2) -- +30 HP, +10 MACC, -10 ENM, -3% DT
	end
	
	
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Polished Pebble : I can imbue JSE capes with moogle magic, for those worthy heroes."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end