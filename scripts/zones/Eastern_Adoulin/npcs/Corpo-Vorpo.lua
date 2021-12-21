-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Corpo-Vorpo
--  !pos -108.778 -0.65 21.72 257
-- Type: Vesca Augments
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
						-- 1 Shield, 2-6 Gende, 7-11 Cizen, 12-16 Otro, 17-21 Iuitl, 21-26 Hagon
	-- Beatific Shield, Gend Caubeen +1, Gend Bliaut +1, Gende Gages +1, Gende Spats +1, Gende Galoshes, Cizin Helm +1, Cizin Mail +1, Cizin Mufflers +1, Cizin Breeches +1,  
	local acceptedItem = {28654, 27731, 27877, 28021, 28163, 28300, 27728, 27874, 28018, 28160,
	-- Cizin Greavs +1, Otro Mask +1, Otro Harness +1, Otro Gloves +1, Otro Brais +1, Otro Boots +1, Hagondes Hat +1, Hagondes Coat +1, Hagondes Cuffs +1, Hagondes Pants +1,
						  28297, 27729, 27875, 28019, 28161, 28298, 27732, 27878, 28022, 28164, 
	-- Hagondes Sabots +1, Iuitl Headgear +1, Iuitl Vest +1, Iuitl Wristbands +1, Iuitl Tights +1, Iuitl Gaiters +1
						  28301, 27730, 27876, 28020, 28162, 28299}
	-- PDT, HP/MP, Spell Int Rate, Shield Mastery, PDT, MDT
	local augmentsBeatific = {54, {17, 29}, {53, 9}, {153, 2}, {54, 3}, {55, 3}}
	-- PDT, ATK, ACC, Double Attack, Crit Rate, MDEF, MDT
	--               Cizin AND Otronif
	local augmentsMelee = {54, {25, 9}, {23, 9}, {143, 1}, {41, 1}, {134, 2}, {39, 9}, {55, 3}}
	-- PDT, Cure Cast, Cure Pot, Song Cast, Song Recast, MDT
	local augmentsGende = {54, {323, 4}, {329, 7}, {322, 4}, {337, 2}, {55, 3}}
	-- PDT, MAB, MACC, Pet: MAB, Pet: MACC, Pet: ATK/RATK, Pet: Acc/RAcc, Avatar Perp, ENM-, Fast Cast, Magic Burst Damage, MDT
	local augmentsHagon = {54, {133, 29}, {35, 29}, {101, 24}, {100, 24}, {107, 24}, {106, 24}, {321, 4}, {40, 5}, {140, 4}, {334, 9}, {55, 3}}
	-- PDT, ATK, ACC, RATK, RACC, Snapshot, Recycle, Double Attack, Crit Hit Rate. ENM-, MDEF, MDT
	local augmentsIuitl = {54, {25, 9}, {23, 9}, {29, 9}, {27, 9}, {211, 2}, {1388, 1}, {143, 1}, {41, 1}, {40, 6}, {134, 1}, {55, 3}}
	--local tradeItem = -- thing	
	local kupon = {{3951, 25}} -- 25 wailing stones
	local augItem = 0
	local randomValues = true
	local aug1 = 1 -- Good, same for all trades
	local aug2 = 0
	local aug3 = 0
	
	if not (npcUtil.tradeHas(trade, kupon)) then
		player:PrintToPlayer(string.format("Corpo-Vorpo : I need the agony of 25 wailing stones before I can augment anything!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	for i = 1, #acceptedItem do
		if (npcUtil.tradeHas(trade, acceptedItem[i])) then
			augItem = acceptedItem[i]
			break
		end
	end
	
	if (augItem == 0) then
		player:PrintToPlayer(string.format("Corpo-Vorpo : I can't augment something if you don't give it to me!"),tpz.msg.channel.NS_SAY)
		return
	end
	
	player:tradeComplete()
	player:PrintToPlayer(string.format("Corpo-Vorpo : This goes here...that does that...and.....TA-DA!!"),tpz.msg.channel.NS_SAY)
	
	local aug1Value = math.random(1, 3) -- Good, same for all trades
	local aug2Value = 0
	local aug3Value = 0
	
	for i = 1, #acceptedItem do
		if (i == 1 and augItem == acceptedItem[i]) then -- Beatific
			aug2 = math.random(2, 6)
			aug3 = math.random(2, 6)
			
			while (aug2 == aug3) do
				aug3 = math.random(2, 6)
			end
			
			aug2Value = math.random(1, augmentsBeatific[aug2][2])
			aug3Value = math.random(1, augmentsBeatific[aug3][2])
		elseif (i >= 2 and i <= 6 and augItem == acceptedItem[i]) then -- Gende
			aug2 = math.random(2, 6)
			aug3 = math.random(2, 6)
			
			while (aug2 == aug3) do
				aug3 = math.random(2, 6)
			end
			
			aug2Value = math.random(1, augmentsGende[aug2][2])
			aug3Value = math.random(1, augmentsGende[aug3][2])
		elseif (i >= 7 and i <= 16 and augItem == acceptedItem[i]) then -- Cizin/Otro
			aug2 = math.random(2, 8)
			aug3 = math.random(2, 8)
			
			while (aug2 == aug3) do
				aug3 = math.random(2, 7)
			end
			
			aug2Value = math.random(1, augmentsMelee[aug2][2])
			aug3Value = math.random(1, augmentsMelee[aug3][2])
		elseif (i >= 17 and i <= 21 and augItem == acceptedItem[i]) then -- Hagon
			aug2 = math.random(2, 12)
			aug3 = math.random(2, 12)
			
			while (aug2 == aug3) do
				aug3 = math.random(2, 6)
			end
			
			aug2Value = math.random(1, augmentsHagon[aug2][2])
			aug3Value = math.random(1, augmentsHagon[aug3][2])
		elseif (i >= 22 and augItem == acceptedItem[i]) then -- Iuitl
			aug2 = math.random(2, 12)
			aug3 = math.random(2, 12)
			
			while (aug2 == aug3) do
				aug3 = math.random(2, 6)
			end
			
			aug2Value = math.random(1, augmentsIuitl[aug2][2])
			aug3Value = math.random(1, augmentsIuitl[aug3][2])
		end
	end

	-- Beatific Shield
	if (augItem == 28654) then
		player:addItem(augItem, 1, augmentsBeatific[aug1], aug1Value, augmentsBeatific[aug2][1], aug2Value, augmentsBeatific[aug3][1], aug3Value)
	-- Gendewitha
	elseif (augItem == 27731 or augItem == 27877 or augItem == 28021 or augItem == 28163 or augItem == 28300) then
		player:addItem(augItem, 1, augmentsGende[aug1], aug1Value, augmentsGende[aug2][1], aug2Value, augmentsGende[aug3][1], aug3Value)
	-- Cizin and Otronif
	elseif (augItem == 27728 or augItem == 27874 or augItem == 28018 or augItem == 28160 or augItem == 28297 or
			augItem == 27729 or augItem == 27875 or augItem == 28019 or augItem == 28161 or augItem == 28298) then
		player:addItem(augItem, 1, augmentsMelee[aug1], aug1Value, augmentsMelee[aug2][1], aug2Value, augmentsMelee[aug3][1], aug3Value)
	-- Hagon
	elseif (augItem == 27732 or augItem == 27878 or augItem == 28022 or augItem == 28164 or augItem == 28301) then
		player:addItem(augItem, 1, augmentsHagon[aug1], aug1Value, augmentsHagon[aug2][1], aug2Value, augmentsHagon[aug3][1], aug3Value)
	-- Iuitl
	elseif (augItem == 27730 or augItem == 27876 or augItem == 28020 or augItem == 28162 or augItem == 28299) then
		player:addItem(augItem, 1, augmentsIuitl[aug1], aug1Value, augmentsIuitl[aug2][1], aug2Value, augmentsIuitl[aug3][1], aug3Value)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Corpo-Vorpo : Captain Vesca knows how to make wicked armor, but if you have the right item I can imbue it with magic!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)

end