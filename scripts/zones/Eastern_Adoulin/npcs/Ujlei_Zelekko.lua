-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Ujlei Zelekko
-- Type: Reforged Relic +2 Shards
-- !pos -102.697 -0.650 16.175 257
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

-----------------------------------
-- Shard Trades and Paragon cards
-- Testimony, Gil, Ancient Currency = Shard
-----------------------------------

local gilCost = {{"gil", 250000}, {"gil", 300000}, {"gil", 350000}}

local itemTrades =
{
	[	1	] = {trade = {1426, gilCost[1], {1450, 3}}, 			 reward = 9544}, -- 	Headshard: WAR
	[	2	] = {trade = {1426, gilCost[3],  1450,		1453, 1456}, reward = 9588}, -- 	Torsoshard: WAR
	[	3	] = {trade = {1426, gilCost[1], {1453, 3}}, 			 reward = 9632}, -- 	Handshard: WAR
	[	4	] = {trade = {1426, gilCost[2],  1450,		1453, 1456}, reward = 9676}, -- 	Legshard: WAR
	[	5	] = {trade = {1426, gilCost[1], {1456, 3}}, 			 reward = 9720}, -- 	Footshard: WAR
	[	6	] = {trade = {1427, gilCost[3], {1450, 3}}, 			 reward = 9545}, -- 	Headshard: MNK
	[	7	] = {trade = {1427, gilCost[1],  1450,		1453, 1456}, reward = 9589}, -- 	Torsoshard: MNK
	[	8	] = {trade = {1427, gilCost[2], {1453, 3}}, 			 reward = 9633}, -- 	Handshard: MNK
	[	9	] = {trade = {1427, gilCost[1],  1450,		1453, 1456}, reward = 9677}, -- 	Legshard: MNK
	[	10	] = {trade = {1427, gilCost[3], {1456, 3}}, 			 reward = 9721}, -- 	Footshard: MNK
	[	11	] = {trade = {1428, gilCost[1], {1450, 3}}, 			 reward = 9546}, -- 	Headshard: WHM
	[	12	] = {trade = {1428, gilCost[2],  1450,		1453, 1456}, reward = 9590}, -- 	Torsoshard: WHM
	[	13	] = {trade = {1428, gilCost[1], {1453, 3}}, 			 reward = 9634}, -- 	Handshard: WHM
	[	14	] = {trade = {1428, gilCost[3],  1450,		1453, 1456}, reward = 9678}, -- 	Legshard: WHM
	[	15	] = {trade = {1428, gilCost[1], {1456, 3}}, 			 reward = 9722}, -- 	Footshard: WHM
	[	16	] = {trade = {1429, gilCost[2], {1450, 3}}, 			 reward = 9547}, -- 	Headshard: BLM
	[	17	] = {trade = {1429, gilCost[1],  1450,		1453, 1456}, reward = 9591}, -- 	Torsoshard: BLM
	[	18	] = {trade = {1429, gilCost[3], {1453, 3}}, 			 reward = 9635}, -- 	Handshard: BLM
	[	19	] = {trade = {1429, gilCost[1],  1450,		1453, 1456}, reward = 9679}, -- 	Legshard: BLM
	[	20	] = {trade = {1429, gilCost[2], {1456, 3}}, 			 reward = 9723}, -- 	Footshard: BLM
	[	21	] = {trade = {1430, gilCost[1], {1450, 3}}, 			 reward = 9548}, -- 	Headshard: RDM
	[	22	] = {trade = {1430, gilCost[3],  1450,		1453, 1456}, reward = 9592}, -- 	Torsoshard: RDM
	[	23	] = {trade = {1430, gilCost[1], {1453, 3}}, 			 reward = 9636}, -- 	Handshard: RDM
	[	24	] = {trade = {1430, gilCost[2],  1450,		1453, 1456}, reward = 9680}, -- 	Legshard: RDM
	[	25	] = {trade = {1430, gilCost[1], {1456, 3}}, 			 reward = 9724}, -- 	Footshard: RDM
	[	26	] = {trade = {1431, gilCost[3], {1450, 3}}, 			 reward = 9549}, -- 	Headshard: THF
	[	27	] = {trade = {1431, gilCost[1],  1450,		1453, 1456}, reward = 9593}, -- 	Torsoshard: THF
	[	28	] = {trade = {1431, gilCost[2], {1453, 3}}, 			 reward = 9637}, -- 	Handshard: THF
	[	29	] = {trade = {1431, gilCost[1],  1450,		1453, 1456}, reward = 9681}, -- 	Legshard: THF
	[	30	] = {trade = {1431, gilCost[3], {1456, 3}}, 			 reward = 9725}, -- 	Footshard: THF
	[	31	] = {trade = {1432, gilCost[1], {1450, 3}}, 			 reward = 9550}, -- 	Headshard: PLD
	[	32	] = {trade = {1432, gilCost[2],  1450,		1453, 1456}, reward = 9594}, -- 	Torsoshard: PLD
	[	33	] = {trade = {1432, gilCost[1], {1453, 3}}, 			 reward = 9638}, -- 	Handshard: PLD
	[	34	] = {trade = {1432, gilCost[3],  1450,		1453, 1456}, reward = 9682}, -- 	Legshard: PLD
	[	35	] = {trade = {1432, gilCost[1], {1456, 3}}, 			 reward = 9726}, -- 	Footshard: PLD
	[	36	] = {trade = {1433, gilCost[2], {1450, 3}}, 			 reward = 9551}, -- 	Headshard: DRK
	[	37	] = {trade = {1433, gilCost[1],  1450,		1453, 1456}, reward = 9595}, -- 	Torsoshard: DRK
	[	38	] = {trade = {1433, gilCost[3], {1453, 3}}, 			 reward = 9639}, -- 	Handshard: DRK
	[	39	] = {trade = {1433, gilCost[1],  1450,		1453, 1456}, reward = 9683}, -- 	Legshard: DRK
	[	40	] = {trade = {1433, gilCost[2], {1456, 3}}, 			 reward = 9727}, -- 	Footshard: DRK
	[	41	] = {trade = {1434, gilCost[1], {1450, 3}}, 			 reward = 9552}, -- 	Headshard: BST
	[	42	] = {trade = {1434, gilCost[3],  1450,		1453, 1456}, reward = 9596}, -- 	Torsoshard: BST
	[	43	] = {trade = {1434, gilCost[1], {1453, 3}}, 			 reward = 9640}, -- 	Handshard: BST
	[	44	] = {trade = {1434, gilCost[2],  1450,		1453, 1456}, reward = 9684}, -- 	Legshard: BST
	[	45	] = {trade = {1434, gilCost[1], {1456, 3}}, 			 reward = 9728}, -- 	Footshard: BST
	[	46	] = {trade = {1435, gilCost[3], {1450, 3}}, 			 reward = 9553}, -- 	Headshard: BRD
	[	47	] = {trade = {1435, gilCost[1],  1450,		1453, 1456}, reward = 9597}, -- 	Torsoshard: BRD
	[	48	] = {trade = {1435, gilCost[2], {1453, 3}}, 			 reward = 9641}, -- 	Handshard: BRD
	[	49	] = {trade = {1435, gilCost[1],  1450,		1453, 1456}, reward = 9685}, -- 	Legshard: BRD
	[	50	] = {trade = {1435, gilCost[3], {1456, 3}}, 			 reward = 9729}, -- 	Footshard: BRD
	[	51	] = {trade = {1436, gilCost[1], {1450, 3}}, 			 reward = 9554}, -- 	Headshard: RNG
	[	52	] = {trade = {1436, gilCost[2],  1450,		1453, 1456}, reward = 9598}, -- 	Torsoshard: RNG
	[	53	] = {trade = {1436, gilCost[1], {1453, 3}}, 			 reward = 9642}, -- 	Handshard: RNG
	[	54	] = {trade = {1436, gilCost[3],  1450,		1453, 1456}, reward = 9686}, -- 	Legshard: RNG
	[	55	] = {trade = {1436, gilCost[1], {1456, 3}}, 			 reward = 9730}, -- 	Footshard: RNG
	[	56	] = {trade = {1437, gilCost[2], {1450, 3}}, 			 reward = 9555}, -- 	Headshard: SAM
	[	57	] = {trade = {1437, gilCost[1],  1450,		1453, 1456}, reward = 9599}, -- 	Torsoshard: SAM
	[	58	] = {trade = {1437, gilCost[3], {1453, 3}}, 			 reward = 9643}, -- 	Handshard: SAM
	[	59	] = {trade = {1437, gilCost[1],  1450,		1453, 1456}, reward = 9687}, -- 	Legshard: SAM
	[	60	] = {trade = {1437, gilCost[2], {1456, 3}}, 			 reward = 9731}, -- 	Footshard: SAM
	[	61	] = {trade = {1438, gilCost[1], {1450, 3}}, 			 reward = 9556}, -- 	Headshard: NIN
	[	62	] = {trade = {1438, gilCost[3],  1450,		1453, 1456}, reward = 9600}, -- 	Torsoshard: NIN
	[	63	] = {trade = {1438, gilCost[1], {1453, 3}}, 			 reward = 9644}, -- 	Handshard: NIN
	[	64	] = {trade = {1438, gilCost[2],  1450,		1453, 1456}, reward = 9688}, -- 	Legshard: NIN
	[	65	] = {trade = {1438, gilCost[1], {1456, 3}}, 			 reward = 9732}, -- 	Footshard: NIN
	[	66	] = {trade = {1439, gilCost[3], {1450, 3}}, 			 reward = 9557}, -- 	Headshard: DRG
	[	67	] = {trade = {1439, gilCost[1],  1450,		1453, 1456}, reward = 9601}, -- 	Torsoshard: DRG
	[	68	] = {trade = {1439, gilCost[2], {1453, 3}}, 			 reward = 9645}, -- 	Handshard: DRG
	[	69	] = {trade = {1439, gilCost[1],  1450,		1453, 1456}, reward = 9689}, -- 	Legshard: DRG
	[	70	] = {trade = {1439, gilCost[3], {1456, 3}}, 			 reward = 9733}, -- 	Footshard: DRG
	[	71	] = {trade = {1440, gilCost[1], {1450, 3}}, 			 reward = 9558}, -- 	Headshard: SMN
	[	72	] = {trade = {1440, gilCost[2],  1450,		1453, 1456}, reward = 9602}, -- 	Torsoshard: SMN
	[	73	] = {trade = {1440, gilCost[1], {1453, 3}}, 			 reward = 9646}, -- 	Handshard: SMN
	[	74	] = {trade = {1440, gilCost[3],  1450,		1453, 1456}, reward = 9690}, -- 	Legshard: SMN
	[	75	] = {trade = {1440, gilCost[1], {1456, 3}}, 			 reward = 9734}, -- 	Footshard: SMN
	[	76	] = {trade = {2331, gilCost[2], {1450, 3}}, 			 reward = 9559}, -- 	Headshard: BLU
	[	77	] = {trade = {2331, gilCost[1],  1450,		1453, 1456}, reward = 9603}, -- 	Torsoshard: BLU
	[	78	] = {trade = {2331, gilCost[3], {1453, 3}}, 			 reward = 9647}, -- 	Handshard: BLU
	[	79	] = {trade = {2331, gilCost[1],  1450,		1453, 1456}, reward = 9691}, -- 	Legshard: BLU
	[	80	] = {trade = {2331, gilCost[2], {1456, 3}}, 			 reward = 9735}, -- 	Footshard: BLU
	[	81	] = {trade = {2332, gilCost[1], {1450, 3}}, 			 reward = 9560}, -- 	Headshard: COR
	[	82	] = {trade = {2332, gilCost[3],  1450,		1453, 1456}, reward = 9604}, -- 	Torsoshard: COR
	[	83	] = {trade = {2332, gilCost[1], {1453, 3}}, 			 reward = 9648}, -- 	Handshard: COR
	[	84	] = {trade = {2332, gilCost[2],  1450,		1453, 1456}, reward = 9692}, -- 	Legshard: COR
	[	85	] = {trade = {2332, gilCost[1], {1456, 3}}, 			 reward = 9736}, -- 	Footshard: COR
	[	86	] = {trade = {2333, gilCost[3], {1450, 3}}, 			 reward = 9561}, -- 	Headshard: PUP
	[	87	] = {trade = {2333, gilCost[1],  1450,		1453, 1456}, reward = 9605}, -- 	Torsoshard: PUP
	[	88	] = {trade = {2333, gilCost[2], {1453, 3}}, 			 reward = 9649}, -- 	Handshard: PUP
	[	89	] = {trade = {2333, gilCost[1],  1450,		1453, 1456}, reward = 9693}, -- 	Legshard: PUP
	[	90	] = {trade = {2333, gilCost[3], {1456, 3}}, 			 reward = 9737}, -- 	Footshard: PUP
	[	91	] = {trade = {2556, gilCost[1], {1450, 3}}, 			 reward = 9562}, -- 	Headshard: DNC
	[	92	] = {trade = {2556, gilCost[2],  1450,		1453, 1456}, reward = 9606}, -- 	Torsoshard: DNC
	[	93	] = {trade = {2556, gilCost[1], {1453, 3}}, 			 reward = 9650}, -- 	Handshard: DNC
	[	94	] = {trade = {2556, gilCost[3],  1450,		1453, 1456}, reward = 9694}, -- 	Legshard: DNC
	[	95	] = {trade = {2556, gilCost[1], {1456, 3}}, 			 reward = 9738}, -- 	Footshard: DNC
	[	96	] = {trade = {2557, gilCost[2], {1450, 3}}, 			 reward = 9563}, -- 	Headshard: SCH
	[	97	] = {trade = {2557, gilCost[1],  1450,		1453, 1456}, reward = 9607}, -- 	Torsoshard: SCH
	[	98	] = {trade = {2557, gilCost[3], {1453, 3}}, 			 reward = 9651}, -- 	Handshard: SCH
	[	99	] = {trade = {2557, gilCost[1],  1450,		1453, 1456}, reward = 9695}, -- 	Legshard: SCH
	[	100	] = {trade = {2557, gilCost[2], {1456, 3}}, 			 reward = 9739}, -- 	Footshard: SCH
	[	101	] = {trade = {9178, gilCost[1], {1450, 3}}, 			 reward = 9564}, -- 	Headshard: GEO
	[	102	] = {trade = {9178, gilCost[3],  1450,		1453, 1456}, reward = 9608}, -- 	Torsoshard: GEO
	[	103	] = {trade = {9178, gilCost[1], {1453, 3}}, 			 reward = 9652}, -- 	Handshard: GEO
	[	104	] = {trade = {9178, gilCost[2],  1450,		1453, 1456}, reward = 9696}, -- 	Legshard: GEO
	[	105	] = {trade = {9178, gilCost[1], {1456, 3}}, 			 reward = 9740}, -- 	Footshard: GEO
	[	106	] = {trade = {8730, gilCost[3], {1450, 3}}, 			 reward = 9565}, -- 	Headshard: RUN
	[	107	] = {trade = {8730, gilCost[1],  1450,		1453, 1456}, reward = 9609}, -- 	Torsoshard: RUN
	[	108	] = {trade = {8730, gilCost[2], {1453, 3}}, 			 reward = 9653}, -- 	Handshard: RUN
	[	109	] = {trade = {8730, gilCost[1],  1450,		1453, 1456}, reward = 9697}, -- 	Legshard: RUN
	[	110	] = {trade = {8730, gilCost[3], {1456, 3}}, 			 reward = 9741}, -- 	Footshard: RUN
}

function onTrade(player, npc, trade)
	local itemtrades
	local tradedCombo = 0
	
	if (player:getCharVar("KillCounter_Goji") >= 1 and player:getCharVar("KillCounter_Cherufe") >= 1 and player:getCharVar("KillCounter_Yatagarasu") >= 1 and
		player:getCharVar("KillCounter_Agathos") >= 1 and player:getCharVar("KillCounter_Gugalanna") >= 1 and player:getCharVar("KillCounter_Taweret") >= 1) then
		-- Check for matching trade
		if (tradedCombo == 0) then
			for k, v in pairs(itemTrades) do
				if npcUtil.tradeHasExactly(trade, v.trade) then
					tradedCombo = k
					break
				end
			end
		end
		
		-- Found a match
		if tradedCombo > 0 then --  and not player:hasItem(itemTrades[tradedCombo].reward) 
			local ID = zones[player:getZoneID()]
			local reward = itemTrades[tradedCombo].reward
			
			player:tradeComplete()
			player:addItem(itemTrades[tradedCombo].reward, 1)
			player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
			player:PrintToPlayer(string.format("Ujlei Zelekko : So, you are a true hero!"),tpz.msg.channel.NS_SAY)
		end
	else
		player:PrintToPlayer(string.format("Ujlei Zelekko : You must have defeated the second tier of Voidwatch NM's to prove you're worthy of my wares."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Ujlei Zelekko : A worthy hero can buy my shards for the right price."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end