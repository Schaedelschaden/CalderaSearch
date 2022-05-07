-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Vastran
--  !pos -118.965 -0.150 -8.898 257
-- Type: Sinister Reign Rewards
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local vwKupon = {9178, -- Mog Kupon A-Ab from Kaggem 		augsYgnas
				 9228, -- Mog Kupon A-ASYW from Akvan		augsDarrcuiln
				 2745, -- Mog Kupon A-DBcd from Pil			augsIngrid
				 3968, -- Mog Kupon A-De from Cath Palug	augsTeodor
				 3967, -- Mog Kupon A-DeII from Modron		augsMorimar
				 2746, -- Mog Kupon A-DXar from Mimic King	augsRosulatia
				 3441, -- Mog Kupon A-E +2 from Aello		augsArciela
				 2736, -- Mog Kupon A-Lum from Uptala		augsSajjaka
				 9226, -- Mog Kupon A-EMI from Qilin		augsAugust
				}

local pathKupon = {9177, -- Path A Mog Kupon AW-GF
				   9176, -- Path B Mog Kupon AW-GFII
				   9175, -- Path C Mog Kupon AW-GFIII
				   9187, -- Path D Mog Kupon AW-GeIV
				  }
					 
			-- Himetsu., Humility, Lengo pants, Leyline Gloves
local rewardItem = { 21026, 21697, 27321, 27135,
			-- Amm Greaves, Fleshcarvers, Koresuke, Ta'lab Trousers	
					27491, 20517, 20936, 27322,				 
			-- Dampening Tam, Fanatic Gloves, Malevolence, Purgation	  
					25630, 27136, 20595, 20796}
-- Ygnas Augs DONE
-- Path A           ACC,      ATK,    STR,    Quad Attack			Himetsuruchimonji
local augsYgnas = {{23, 9}, {25, 9}, {512, 9}, {354, 2},
-- Path B             ACC,      ATK,      DMG,     STR,  			Humility
					{23, 9}, {25, 9}, {45, 14}, {512, 9},
-- Path C             INT,      MACC,      MATK,     Refresh,     	Lengo Pants
					{516, 9}, {35, 9}, {133, 14}, {138, 0},
-- Path D             ACC,		MACC,		MATK,	Fast Cast		Leyline Gloves
					{23, 14}, {35, 14}, {133, 14}, {140, 2}}
					
					

-- Darrcuiln Augs DONE
-- Path A          		VIT,      HP,		ACC,	  DT			Amm Greaves
local augsDarrcuiln = {{514, 9}, {2, 16}, {23, 14}, {71, 1},
-- Path B           DMG,      STR,      DEX,     STP				Flesh Carvers
				  {45, 9}, {512, 9}, {513, 9}, {142, 4},
-- Path C           DMG,      STP,      STR,     ACC				Koresuke
				  {45, 9}, {142, 5}, {512, 9}, {23, 9},
-- Path D           Crit Hit Dam, ACC,	  MEVA,     ENM-			Ta'lab Trousers
				  {328, 2}, {23, 14}, {37, 14}, {40, 6}}
				  
				  

-- Ingrid Augs DONE
-- Path A          	  Dex		ACC		 MACC		Quad ATT		Dampening Tam
local augsIngrid = {{512, 9}, {23, 14}, {35, 14}, {354, 2},
-- Path B           MP,		  Heal Skill FC		   Conserve MP		Fanatics Gloves
				   {10, 16}, {289, 9}, {140, 7}, {141, 6},
-- Path C           MACC	  MATT		FC		  INT				Malevolence
				   {35, 9}, {133, 9}, {140, 4}, {516, 9},
-- Path D           DMG			ATT		  STP		  WSD			Purgation
				   {45, 14}, {25, 9}, {142, 5}, {327, 3}}

function onTrade(player, npc, trade)
	if (player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailOfLove") > 0) then
		local vwKuponPicked = 0
		local pathKuponPicked = 0
		local rewardItemPicked = 0
		local augItem = 0
		local aug1 = 0
		local aug2 = 0
		local aug3 = 0
		local aug4 = 0
		local aug1Value = 0
		local aug2Value = 0
		local aug3Value = 0
		local aug4Value = 0
		local chanceValue = math.random(1, 5)
		
		-- Check for VW Kupon included in trade
		for i = 1, #vwKupon do
			if (npcUtil.tradeHas(trade, {vwKupon[i]})) then
				vwKuponPicked = vwKupon[i]
				break
			end
		end
		
		-- Cancel transaction if no VW Kupon is found
		if (vwKuponPicked == 0) then
			player:PrintToPlayer(string.format("Vastran : You need to give me a Kupon you receive from defeating a Sinister Reign NM."),tpz.msg.channel.NS_SAY)
			return
		end
		
		-- Check for path Kupon included in trade
		for i = 1, #pathKupon do
			if (npcUtil.tradeHas(trade, {pathKupon[i]})) then
				pathKuponPicked = pathKupon[i]
				break
			end
		end
		
		-- Cancel transaction if no path Kupon is found
		if (pathKuponPicked == 0) then
			player:PrintToPlayer(string.format("Vastran : You need to give me a Kupon that determines the pathway I'll try to manifest."),tpz.msg.channel.NS_SAY)
			return
		end
		
		if (chanceValue < 4) then -- 3 Augs
			if (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[1]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				aug3 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[2]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				aug3 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[3]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				aug3 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[4]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				aug3 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
				-- End Yngas
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[5]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				aug3 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[6]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				aug3 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[7]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				aug3 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[8]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				aug3 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
				-- End Darrcuiln
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[9]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				aug3 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[10]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				aug3 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[11]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				aug3 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[12]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				aug3 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				while (aug1 == aug3 or aug2 == aug3) do
					aug3 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
				-- End Ingrud
			end
			
			player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value, aug3, aug3Value)
		elseif (chanceValue == 4) then -- 2 Augs
			if (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[1]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[2]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[3]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[4]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				-- End Yngas
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[5]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[6]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[7]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[8]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				-- End Darrcuiln
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[9]
				aug1 = math.random(1, 4)
				aug2 = math.random(1, 4)
				
				while (aug1 == aug2) do
					aug2 = math.random(1, 4)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[10]
				aug1 = math.random(5, 8)
				aug2 = math.random(5, 8)
				
				while (aug1 == aug2) do
					aug2 = math.random(5, 8)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[11]
				aug1 = math.random(9, 12)
				aug2 = math.random(9, 12)
				
				while (aug1 == aug2) do
					aug2 = math.random(9, 12)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[12]
				aug1 = math.random(13, 16)
				aug2 = math.random(13, 16)
				
				while (aug1 == aug2) do
					aug2 = math.random(13, 16)
				end
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				-- End Ingrud
			end
			
			player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value)
		elseif (chanceValue == 5) then -- 4 Augs
			if (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[1]
				aug1 = 1
				aug2 = 2
				aug3 = 3
				aug4 = 4
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug4Value = math.random(1, augsYgnas[aug4][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
				aug4 = augsYgnas[aug4][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[2]
				aug1 = 5
				aug2 = 6
				aug3 = 7
				aug4 = 8
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug4Value = math.random(1, augsYgnas[aug4][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
				aug4 = augsYgnas[aug4][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[3]
				aug1 = 9
				aug2 = 10
				aug3 = 11
				aug4 = 12
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug4Value = math.random(1, augsYgnas[aug4][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
				aug4 = augsYgnas[aug4][1]
			elseif (vwKuponPicked == vwKupon[1] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[4]
				aug1 = 13
				aug2 = 14
				aug3 = 15
				aug4 = 16
				
				aug1Value = math.random(1, augsYgnas[aug1][2])
				aug2Value = math.random(1, augsYgnas[aug2][2])
				aug3Value = math.random(1, augsYgnas[aug3][2])
				aug4Value = math.random(1, augsYgnas[aug4][2])
				aug1 = augsYgnas[aug1][1]
				aug2 = augsYgnas[aug2][1]
				aug3 = augsYgnas[aug3][1]
				aug4 = augsYgnas[aug4][1]
				-- End Yngas
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[5]
				aug1 = 1
				aug2 = 2
				aug3 = 3
				aug4 = 4
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug4Value = math.random(1, augsDarrcuiln[aug4][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
				aug4 = augsDarrcuiln[aug4][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[6]
				aug1 = 5
				aug2 = 6
				aug3 = 7
				aug4 = 8
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug4Value = math.random(1, augsDarrcuiln[aug4][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
				aug4 = augsDarrcuiln[aug4][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[7]
				aug1 = 9
				aug2 = 10
				aug3 = 11
				aug4 = 12
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug4Value = math.random(1, augsDarrcuiln[aug4][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
				aug4 = augsDarrcuiln[aug4][1]
			elseif (vwKuponPicked == vwKupon[2] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[8]
				aug1 = 13
				aug2 = 14
				aug3 = 15
				aug4 = 16
				
				aug1Value = math.random(1, augsDarrcuiln[aug1][2])
				aug2Value = math.random(1, augsDarrcuiln[aug2][2])
				aug3Value = math.random(1, augsDarrcuiln[aug3][2])
				aug4Value = math.random(1, augsDarrcuiln[aug4][2])
				aug1 = augsDarrcuiln[aug1][1]
				aug2 = augsDarrcuiln[aug2][1]
				aug3 = augsDarrcuiln[aug3][1]
				aug4 = augsDarrcuiln[aug4][1]
				-- End Darrcuiln
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[1]) then
				rewardItemPicked = rewardItem[9]
				aug1 = 1
				aug2 = 2
				aug3 = 3
				aug4 = 4
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug4Value = math.random(1, augsIngrid[aug4][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
				aug4 = augsIngrid[aug4][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[2]) then
				rewardItemPicked = rewardItem[10]
				aug1 = 5
				aug2 = 6
				aug3 = 7
				aug4 = 8
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug4Value = math.random(1, augsIngrid[aug4][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
				aug4 = augsIngrid[aug4][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[3]) then
				rewardItemPicked = rewardItem[11]
				aug1 = 9
				aug2 = 10
				aug3 = 11
				aug4 = 12
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug4Value = math.random(1, augsIngrid[aug4][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
				aug4 = augsIngrid[aug4][1]
			elseif (vwKuponPicked == vwKupon[3] and pathKuponPicked == pathKupon[4]) then
				rewardItemPicked = rewardItem[12]
				aug1 = 13
				aug2 = 14
				aug3 = 15
				aug4 = 16
				
				aug1Value = math.random(1, augsIngrid[aug1][2])
				aug2Value = math.random(1, augsIngrid[aug2][2])
				aug3Value = math.random(1, augsIngrid[aug3][2])
				aug4Value = math.random(1, augsIngrid[aug4][2])
				aug1 = augsIngrid[aug1][1]
				aug2 = augsIngrid[aug2][1]
				aug3 = augsIngrid[aug3][1]
				aug4 = augsIngrid[aug4][1]
				-- End Ingrid
			end
			
			player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value, aug3, aug3Value, aug4, aug4Value)
		end
		
		player:tradeComplete()
		player:PrintToPlayer(string.format("Vastran : The power of this item feels...overwhelming."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Vastran : The more powerful creatures of Voidwatch carry ancient Kupons that may materialize amazing equipment."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end