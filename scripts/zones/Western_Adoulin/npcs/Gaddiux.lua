-----------------------------------
-- Area: Western Adoulin
-- NPC: Gaddiux
-- !pos 89.215 -0.65 -63.448 256
-- Type: Alluvion Skirmish Weapons
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local acceptedStones =
{
    -- Snowslit x25, Snowtip x25, Snowdim x25, Snoworb x25
    {8930, 25}, {8939, 25}, {8948, 25}, {8957, 25},
    -- Leafslit x25, Leaftip x25, Leafdim x25, Leaforb x25
    {8933, 25}, {8942, 25}, {8951, 25}, {8960, 25},
    -- Duskslit x25, Dusktip x25, Duskdim x25, Duskorb x25
    {8936, 25}, {8945, 25}, {8954, 25}, {8963, 25},
    -- Snowslit +1 x2, Snowtip +1 x2, Snowdim +1 x2, Snoworb +1 x2
    {8931, 2}, {8940, 2}, {8949, 2}, {8958, 2},
    -- Leafslit +1 x2, Leaftip +1 x2, Leafdim +1 x2, Leaforb +1 x2
    {8934, 2}, {8943, 2}, {8952, 2}, {8961, 2},
    -- Duskslit +1 x2, Dusktip +1 x2, Duskdim +1 x2, Duskorb +1 x2
    {8937, 2}, {8946, 2}, {8955, 2}, {8964, 2},
    -- Snowslit +2 x1, Snowtip +2 x1, Snowdim +2 x1, Snoworb +2 x1
    {8932, 1}, {8941, 1}, {8950, 1}, {8959, 1},
    -- Leafslit +2 x1, Leaftip +2 x1, Leafdim +2 x1, Leaforb +2 x1
    {8935, 1}, {8944, 1}, {8953, 1}, {8962, 1},
    -- Duskslit +2 x1, Dusktip +2 x1, Duskdim +2 x1, Duskorb +2 x1
    {8938, 1}, {8947, 1}, {8956, 1}, {8965, 1},
}

local acceptedGear =
{
    -- Ohrmazd, Ipetam, Kumbhakama, Claidheamh Soluis, Nehushtan, Izuna
    20530, 20616, 20809, 20718, 21105, 20989, -- One Handed
    -- Macbain, Inanna, Svarga, Keraunos, Olydicus, Nenekirimaru
    20759, 20901, 20857, 21169, 20946, 21037, -- Two Handed
    -- Phaosphaelia, Doomsday
    21224, 21476, -- Ranged
    -- Svallin, Linos
    27627, 21404, -- Shield/Instrument
}

local augsOnehand =
{
    -- 1h/h2h Augs
    -- Snowslit           ACC,      ATK,    ACC/ATK,    RACC,    RATK,      MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {68, 15}, {27, 15}, {29, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Snowtip             ACC,      ATK,      RACC,     RATK,  RACC/RATK,   MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {27, 20}, {29, 20}, {69, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Snowdim             ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {27, 15}, {29, 15}, {35, 20}, {133, 20}, {131, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Snoworb             Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
    {{106, 25}, {107, 25}, {100, 25}, {101, 25}, {99, 25}, {98, 25}, {117, 25}}, -- Done
    -- Leafslit            PDT,   Dbl At,   Haste,   Waltz P,   STP,     WSD%,     Crit hit Rate
    {{54, 5}, {143, 4}, {49, 3}, {330, 6}, {142, 6}, {327, 4}, {41, 4}}, -- Done
    -- Leaftip            STP,      WSD%,   CritRate, Crit Dmg, Sub B,     BDT,    SnapS,     Rapidshot
    {{142, 6}, {327, 4}, {41, 4}, {328, 5}, {195, 4}, {56, 5}, {211, 5}, {139, 5}}, -- Done
    -- Leafdim           MDT,       F Cast,   Refresh,  Cure pot, Cure C-, Song C-, Con MP, MB dam
    {{55, 5}, {140, 6}, {138, 0}, {329, 15}, {323, 8}, {322, 5}, {141, 7}, {334, 6}}, -- Done
    -- Leaforb           Pet: PDT, Pet: DT,  Pet: Reg, Pet: Haste, Pet: CRate, Pet: Dbl Att/CRate, Repair pot, Perp-
    {{118, 5}, {112, 4}, {110, 3}, {111, 3}, {102, 4}, {109, 4}, {341, 7}, {321, 4}}, -- Done
    -- Duskslit           HP,     STR,       VIT,       STR/VIT, Save TP,     DEX,       DMG
    {{2, 7}, {512, 17}, {514, 17}, {551, 15}, {333, 10}, {513, 17}, {740, 0}}, -- Done
    -- Dusktip            DEX,      DMG,       Delay      STR/DEX,   AGI,      STR/AGI,  Quad Att
    {{513, 17}, {740, 0}, {756, 10}, {550, 15}, {515, 17}, {552, 15}, {354, 2}}, -- Done
    -- Duskdim            HP/MP,  INT,       MND,        INT/MND,  Mag DMG,   MP Heal,  MP
    {{18, 7}, {516, 17}, {517, 17}, {554, 15}, {362, 10}, {52, 10}, {10, 16}}, -- Done
    -- Duskorb             CHR,      STR/CHR,   Charm, Pet: STR/VIT/DEX, Pet: TP Bonus, MP 
    {{518, 17}, {557, 15}, {43, 10}, {1806, 15}, {122, 10}, {10, 26}}, -- Done
}

local augsTwohand =
{
    -- 2h
    -- Snowslit           ACC,      ATK,    ACC/ATK,    RACC,    RATK,      MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 25}, {25, 25}, {68, 20}, {27, 20}, {29, 20}, {35, 20}, {133, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snowtip             ACC,      ATK,      RACC,     RATK,  RACC/RATK,   MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {27, 25}, {29, 25}, {69, 20}, {35, 20}, {133, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snowdim             ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {27, 20}, {29, 20}, {35, 25}, {133, 25}, {131, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snoworb             Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
    {{106, 25}, {107, 25}, {100, 25}, {101, 25}, {99, 25}, {98, 25}, {117, 25}}, -- Done
    -- Leafslit            PDT,   Dbl At,   Haste,   Waltz P,   STP,     WSD%,     Crit hit Rate
    {{54, 5}, {143, 6}, {49, 5}, {330, 8}, {142, 8}, {327, 7}, {41, 4}}, -- Done
    -- Leaftip            STP,      WSD%,   CritRate, Crit Dmg, Sub B,     BDT,    SnapS,     Rapidshot
    {{142, 8}, {327, 7}, {41, 5}, {328, 6}, {195, 6}, {56, 5}, {211, 7}, {139, 7}}, -- Done
    -- Leafdim           MDT,       F Cast,   Refresh,  Cure pot, Cure C-, Elem Siphon, Con MP, MB dam
    {{55, 5}, {140, 6}, {138, 0}, {329, 20}, {323, 10}, {339, 5}, {141,9}, {334,6}}, -- Done
    -- Leaforb           Pet: PDT, Pet: DT,  Pet: Reg, Pet: Haste, Pet: CRate, Pet: Dbl Att/CRate, Pet: STP, Perp-, BP delay
    {{118, 5}, {112, 5}, {110, 3}, {111, 3}, {102, 4}, {109, 6}, {115, 4}, {321, 4}, {320, 6}}, -- Done
    -- Duskslit           HP,     STR,       VIT,       STR/VIT, Save TP,     DEX,       DMG
    {{2, 27}, {512, 23}, {514, 23}, {551, 20}, {333, 14}, {513, 23}, {740, 1}}, -- Done
    -- Dusktip            DEX,      DMG,       Delay      STR/DEX,   AGI,      STR/AGI,  Quad Att
    {{513, 23}, {740, 0}, {756, 10}, {550, 20}, {515, 23}, {552, 20}, {354, 3}}, -- Done Delay
    -- Duskdim            HP/MP,  INT,       MND,        INT/MND,  Mag DMG,   MP Heal,  MP
    {{18, 27}, {516, 23}, {517, 23}, {554, 20}, {362, 15}, {52, 20}, {11, 5}}, -- Done
    -- Duskorb             CHR,      STR/CHR,   Charm, Pet: STR/VIT/DEX, BP Damage, MP
    {{518, 23}, {557, 20}, {43, 15}, {1806, 20}, {369, 10}, {11, 5}} -- Done
}

local augsRanged =
{
    -- Ranged
    -- Snowslit           ACC,      ATK,    ACC/ATK,    RACC,    RATK,      MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 25}, {25, 25}, {68, 20}, {27, 20}, {29, 20}, {35, 20}, {133, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snowtip             ACC,      ATK,      RACC,     RATK,  RACC/RATK,   MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {27, 25}, {29, 25}, {69, 20}, {35, 20}, {133, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snowdim             ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {27, 20}, {29, 20}, {35, 25}, {133, 25}, {131, 20}, {33, 20}, {31, 20}, {37, 20}}, -- Done
    -- Snoworb             Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
    {{106, 25}, {107, 25}, {100, 25}, {101, 25}, {99, 25}, {98, 25}, {117, 25}}, -- Done
    -- Leafslit            PDT,   Dbl At,   Haste,   Waltz P,   STP,     WSD%,     Crit hit Rate
    {{54, 5}, {143, 6}, {49, 5}, {330, 8}, {142, 8}, {327, 7}, {41, 4}}, -- Done
    -- Leaftip            STP,      WSD%,   CritRate, Crit Dmg, Sub B,     BDT,    SnapS,     Rapidshot
    {{142, 8}, {327, 7}, {41, 5}, {328, 6}, {195, 6}, {56, 5}, {211, 7}, {139, 7}}, -- Done
    -- Leafdim           MDT,       F Cast,   Refresh,  Cure pot, Cure C-, Elem Siphon, Con MP, MB dam
    {{55, 5}, {140, 6}, {138, 0}, {329, 20}, {323, 10}, {339, 5}, {141,9}, {334,6}}, -- Done
    -- Leaforb           Pet: PDT, Pet: DT,  Pet: Reg, Pet: Haste, Pet: CRate, Pet: Dbl Att/CRate, Pet: STP, Perp-, BP delay
    {{118, 5}, {112, 5}, {110, 3}, {111, 3}, {102, 4}, {109, 6}, {115, 4}, {321, 4}, {320, 6}}, -- Done
    -- Duskslit           HP,     STR,       VIT,       STR/VIT, Save TP,     DEX,       DMG
    {{2, 27}, {512, 23}, {514, 23}, {551, 20}, {333, 14}, {513, 23}, {740, 1}}, -- Done
    -- Dusktip            DEX,      DMG,       Delay      STR/DEX,   AGI,      STR/AGI,  Quad Att
    {{513, 23}, {740, 0}, {211, 10}, {550, 20}, {515, 23}, {552, 20}, {354, 3}}, -- Done Delay
    -- Duskdim            HP/MP,  INT,       MND,        INT/MND,  Mag DMG,   MP Heal,  MP
    {{18, 27}, {516, 23}, {517, 23}, {554, 20}, {362, 15}, {52, 20}, {11, 5}}, -- Done
    -- Duskorb             CHR,      STR/CHR,   Charm, Pet: STR/VIT/DEX, BP Damage, MP
    {{518, 23}, {557, 20}, {43, 15}, {1806, 20}, {369, 10}, {11, 5}} -- Done
}

local augsInstrument =
{
    -- Instrument
    -- Snowslit               ACC,      ATK,      ACC/ATK,  MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 20}, {25, 20}, {68, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- done
    -- Snowtip          	ACC,      ATK,     MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- done
    -- Snowdim          	ACC,      ATK,      Songs+,  MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {67, 2}, {35, 20}, {133, 20}, {33, 15}, {31, 15}, {37, 15}}, -- done
    -- Snoworb          	ACC,      ATK,     MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- done
    -- Leafslit         	PDT,     Dbl Att,   Haste,    Waltz Pot, STP,     WSD,      CRate
    {{24, 5}, {132, 3}, {49, 3}, {330, 4}, {44, 4}, {327, 3}, {132, 3}}, -- done
    -- Leaftip          	STP,      WSD,     CRate,   Sub Blow, BDT,     SC DMG, Regen    Crit Dmg
    {{44, 4}, {327, 3}, {132, 3}, {44, 3}, {56, 4}, {332, 4}, {137, 2}, {328, 3}}, -- done
    -- Leafdim          	MDT,       Fast Cast, Qik Mag, Cure Pot, S Delay, S. Cast-, C Cast-, Conserve MP
    {{55, 4}, {140, 6}, {351, 4}, {329, 6}, {337, 4}, {322, 6}, {323, 6}, {141, 4}}, -- done
    -- Leaforb          	Pet: DT, Pet: PDT, Pet: Rgem, Pet: Haste, Pet: D Att. CRate, BP Delay, Perp -, Pet: CRate
    {{112, 4}, {118, 5}, {110, 3}, {111, 3}, {109, 4}, {320, 4}, {321, 4}, {102, 4}}, -- done
    -- Duskslit           	STR,      VIT,      STR/VIT,   Save TP, HP
    {{512, 8}, {514, 8}, {551, 6}, {333, 3},{1, 20}}, --- done
    -- Dusktip              HP,       STR,       DEX,      AGI,   Quad Att
    {{3, 15}, {512, 8}, {513, 8}, {515, 8}, {0, 0}}, -- Done
    -- Duskdim           	INT,     MND,       INT/MND,  Sing,    MP, 
    {{516, 8}, {517, 8}, {554, 6}, {296, 10}, {9, 20}}, -- Done
    -- Duskorb           	MP       CHR,       STR/CHR,  BP Damage
    {{9, 20}, {518, 8}, {557, 6}, {369, 10}} -- Done
}

local augsShield =
{
    -- Shield
    -- Snowslit             ACC,      ATK,     ACC/ATK,   RACC,     RATK,     MACC,     MATK,      DEF,      EVA,      MEVA    Block Rate
    {{23, 20}, {25, 20}, {68, 15}, {27, 15}, {29, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}, {363, 10}},  -- Done
    -- Snowtip              ACC,      ATK,      RACC,     RATK,  RACC/RATK,  MACC,     MATK,      DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {27, 20}, {29, 20}, {69, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Snowdim              ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {27, 15}, {29, 15}, {35, 20}, {133, 20}, {131, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Snoworb              ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    DEF,      EVA,      MEVA
    {{23, 15}, {25, 15}, {27, 15}, {29, 15}, {35, 15}, {133, 15}, {33, 15}, {31, 15}, {37, 15}}, -- Done
    -- Leafslit            DT,       STP,      PDT,      DBL ATT,   Cure Rec, Waltz Pot, Shield Mastery
    {{71, 9}, {142, 4}, {54, 10}, {143, 4}, {356, 8}, {330, 6}, {153, 8}}, -- done
    -- Leaftip             BDT,      SC DMG,  Sub Blow, CRate,   WSD,     Regen      DT,     STP
    {{56, 10}, {332, 4}, {44, 4}, {41, 3}, {327, 3}, {137, 2}, {71, 9}, {44, 4}}, -- Done
    -- Leafdim             MDT,      Fast C.,  Cure Pot, C Cast-,  Quick M,  Cons MP, Refresh   DT
    {{55, 10}, {140, 6}, {329, 10}, {323, 8}, {351, 3}, {141, 4}, {138, 0}, {71, 9}}, -- Done
    -- Leaforb             Pet: DT, Pet: PDT, Pet: Rgem, Pet: Haste, Pet: D Att. CRate, BP Delay, Perp -
    {{112, 4}, {118, 5}, {110, 3}, {111, 3}, {109, 4}, {320, 4}, {321, 4}}, -- Done
    -- Duskslit             HP,      VIT,    STR/VIT,  Save TP, Shld Skill, STR
    {{3, 15}, {514, 8}, {551, 6}, {333, 3}, {286, 10}, {512, 8}}, -- Done
    -- Dusktip              HP,       STR,       DEX,      AGI,
    {{3, 15}, {512, 8}, {513, 8}, {515, 8}}, -- Done
    -- Duskdim              INT,     MND,       INT/MND,  Mag DMG,    MP, 
    {{516, 8}, {517, 8}, {554, 6}, {362, 15}, {11, 15}}, -- Done
    -- Duskorb             HP,       MP       CHR,       STR/CHR,  BP Damage
    {{3, 15}, {11, 15}, {518, 8}, {557, 6}, {369, 10}} -- Done
}
					  
-- 1h/H2H: Ohrmazd, Ipetam, Kumbhakama, Claidheamh Soluis, Nehushtan, Izuna
-- 2h: Macbain, Inanna, Svarga, Keraunos, Olydicus, Nenekirimaru
-- Ranged: Phaosphaelia, Doomsday
local augWeaponDMGCaps =
{
    {29}, {16}, {22}, {19}, {25}, {17},
    {36}, {39}, {39}, {31}, {38}, {34},
    {32}, {21}
}

function onTrade(player, npc, trade)
	if
        player:getCharVar("KillCounter_Hahava") > 0 and
        player:getCharVar("KillCounter_Voidwrought") > 0 and
        player:getCharVar("KillCounter_Celaeno") > 0
    then
		local stoneQty
		local augGear = 0
		local augStoneCategory = 0
		local augGearCategory = 0
		
		-- Check for type of stone included in trade
		for i = 1, #acceptedStones do
			if npcUtil.tradeHas(trade, {acceptedStones[i]}) then
				-- tradedStone = acceptedStones[i][1]
				augStoneCategory = i
				stoneQty = trade:getItemQty(acceptedStones[i][1])
				break
			end
		end
		
		-- Cancel transaction if no stones are found or not enough were traded
		if augStoneCategory == 0 then
			player:PrintToPlayer(string.format("Gaddiux : I can't apply an augment without the appropriate number of required stones."),tpz.msg.channel.NS_SAY)
			return
		end
		
		if augStoneCategory >= 1 and augStoneCategory <= 12 and stoneQty ~= 25 then
			player:PrintToPlayer(string.format("Gaddiux : I'll need 25 stones of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
			return
		elseif augStoneCategory >= 13 and augStoneCategory <= 24 and stoneQty ~= 2 then
			player:PrintToPlayer(string.format("Gaddiux : I'll need 2 stones of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
			return
		elseif augStoneCategory >= 25 and augStoneCategory <= 36 and stoneQty ~= 1 then
			player:PrintToPlayer(string.format("Gaddiux : I only need 1 stone of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
			return
		end
		
		-- Check for the piece of gear
		for i = 1, #acceptedGear do
			if npcUtil.tradeHas(trade, acceptedGear[i]) then
				augGear = acceptedGear[i]
				augGearCategory = i
				break
			end
		end
		
		-- Cancel the transaction if no gear is found
		if augGear == 0 then
			player:PrintToPlayer(string.format("Gaddiux : You're gonna have to trade me a weapon if you want these augments."),tpz.msg.channel.NS_SAY)
			return
		end
		
		local selectRandom
		local randomAug
		local minAugValue
		local randomAugValue
		local hasExistingAug = false
		local existingAug = {Category = {1, 2, 3}, Augment = {0, 0, 0}, Value = {0, 0, 0}}
		local augCategory
		
		-- Check for existing augments on the item
		for i = 1, 3 do
			if player:getCharVar("Gaddiux_"..augGear.."_Cat_"..i) > 0 then
				existingAug.Category[i] = player:getCharVar("Gaddiux_"..augGear.."_Cat_"..i)
				existingAug.Augment[i] = player:getCharVar("Gaddiux_"..augGear.."_Cat_"..i.."_Aug")
				existingAug.Value[i] = player:getCharVar("Gaddiux_"..augGear.."_Cat_"..i.."_Val")
				-- printf("Gaddiux.lua onTrade EXISTING AUG FOUND 1 CATEGORY: [%i]  NUMBER: [%i]  VALUE: [%i]", existingAug.Category[i], existingAug.Augment[i], existingAug.Value[i])
				hasExistingAug = true
			end
		end
		
		-- Applies the first augment to an unaugmented piece of gear
		if hasExistingAug == false and augStoneCategory <= 12 then
			-- Pick random augment from gear specific augments using stone type to determine which row to use
			-- One Handed
			if augGearCategory >= 1 and augGearCategory <= 6 then
				selectRandom = math.random(1, #augsOnehand[augStoneCategory])
				randomAug = augsOnehand[augStoneCategory][selectRandom][1]				
				randomAugValue = math.random(1, augsOnehand[augStoneCategory][selectRandom][2] - 1)
				
				if
                    (augStoneCategory == 9 and selectRandom == 7) or
                    (augStoneCategory == 10 and selectRandom == 2)
                then
					randomAugValue = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
				end
				-- printf("Gaddiux.lua onTrade ONE HANDED RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsOnehand[augStoneCategory][selectRandom][2])
			-- Two Handed
			elseif augGearCategory >= 7 and augGearCategory <= 12 then
				selectRandom = math.random(1, #augsTwohand[augStoneCategory])
				randomAug = augsTwohand[augStoneCategory][selectRandom][1]
				randomAugValue = math.random(1, augsTwohand[augStoneCategory][selectRandom][2] - 1)
				
				if
                    (augStoneCategory == 9 and selectRandom == 7) or
                    (augStoneCategory == 10 and selectRandom == 2)
                then
					randomAugValue = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
					
					if randomAugValue <= 31 then
						randomAug = 740
					elseif randomAugValue > 31 then
						randomAug = 741
						randomAugValue = randomAugValue - 32
					end
				end
				-- printf("Gaddiux.lua onTrade TWO HANDED RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsTwohand[augStoneCategory][selectRandom][2])
			-- Ranged
			elseif augGearCategory >= 13 and augGearCategory <= 14 then
				selectRandom = math.random(1, #augsRanged[augStoneCategory])
				randomAug = augsRanged[augStoneCategory][selectRandom][1]
				randomAugValue = math.random(1, augsRanged[augStoneCategory][selectRandom][2] - 1)
				
				if
                    (augStoneCategory == 9 and selectRandom == 7) or
                    (augStoneCategory == 10 and selectRandom == 2)
                then
					randomAugValue = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
					
					if randomAugValue <= 31 then
						randomAug = 740
					elseif randomAugValue > 31 then
						randomAug = 741
						randomAugValue = randomAugValue - 32
					end
				end
				-- printf("Gaddiux.lua onTrade RANGED RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsRanged[augStoneCategory][selectRandom][2])
			-- Shield
			elseif augGearCategory == 15 then
				selectRandom = math.random(1, #augsShield[augStoneCategory])
				randomAug = augsShield[augStoneCategory][selectRandom][1]
				randomAugValue = math.random(1, augsShield[augStoneCategory][selectRandom][2] - 1)
				-- printf("Gaddiux.lua onTrade SHIELD RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsShield[augStoneCategory][selectRandom][2])
			-- Instrument
			elseif augGearCategory == 16 then
				selectRandom = math.random(1, #augsInstrument[augStoneCategory])
				randomAug = augsInstrument[augStoneCategory][selectRandom][1]
				randomAugValue = math.random(1, augsInstrument[augStoneCategory][selectRandom][2] - 1)
				-- printf("Gaddiux.lua onTrade INSTRUMENT RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsInstrument[augStoneCategory][selectRandom][2])
			end
			
			player:tradeComplete()
			
			player:addItem(augGear, 1, randomAug, randomAugValue)
			
			player:PrintToPlayer(string.format("Gaddiux : Is there anything like the gleam of a freshly augmented weapon?"),tpz.msg.channel.NS_SAY)
			
			-- Sets augCategory to 1 (Snow), 2 (Leaf), or 3 (Dusk) for the character variable
			if augStoneCategory >= 1 and augStoneCategory <= 4 then
				augCategory = 1
			elseif augStoneCategory >= 5 and augStoneCategory <= 8 then
				augCategory = 2
			elseif augStoneCategory >= 9 and augStoneCategory <= 12 then
				augCategory = 3
			end
			
			player:setCharVar("Gaddiux_"..augGear.."_Cat_"..augCategory, augStoneCategory)
			player:setCharVar("Gaddiux_"..augGear.."_Cat_"..augCategory.."_Aug", randomAug)
			player:setCharVar("Gaddiux_"..augGear.."_Cat_"..augCategory.."_Val", randomAugValue)
		-- Cancels trade if the weapon doesn't have an existing augment matching the traded HQ stone
		elseif
            hasExistingAug == false and
            augStoneCategory > 12
        then
			player:PrintToPlayer(string.format("Gaddiux : Whoa there, the power in those stones will destroy the weapon if it's not augmented first!"),tpz.msg.channel.NS_SAY)
		-- Applies existing augments and new augment if in a different category or rerolls existing augment in same category (NQ stones)
		elseif
            hasExistingAug == true and
            augStoneCategory <= 12
        then
			local augSnow = {0, 0}
			local augLeaf = {0, 0}
			local augDusk = {0, 0}
		
			-- Check if traded Stone category matches existing augment Stone category
			if existingAug.Category[1] >= 1 and existingAug.Category[1] <= 4 then
				augSnow = {existingAug.Augment[1], existingAug.Value[1]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 1 (SNOW)  AUG: [%i]  VALUE: [%i]", augSnow[1], augSnow[2])
			end
			
			if existingAug.Category[2] >= 5 and existingAug.Category[2] <= 8 then
				augLeaf = {existingAug.Augment[2], existingAug.Value[2]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 2 (LEAF)  AUG: [%i]  VALUE: [%i]", augLeaf[1], augLeaf[2])
			end
			
			if existingAug.Category[3] >= 9 and existingAug.Category[3] <= 12 then
				augDusk = {existingAug.Augment[3], existingAug.Value[3]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 3 (DUSK)  AUG: [%i]  VALUE: [%i]", augDusk[1], augDusk[2])
			end
			
			-- Apply new augments
			-- Snow
			if (augStoneCategory >= 1 and augStoneCategory <= 4) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					selectRandom = math.random(1, #augsOnehand[augStoneCategory])
					augSnow[1] = augsOnehand[augStoneCategory][selectRandom][1]
					augSnow[2] = math.random(1, augsOnehand[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					selectRandom = math.random(1, #augsTwohand[augStoneCategory])
					augSnow[1] = augsTwohand[augStoneCategory][selectRandom][1]
					augSnow[2] = math.random(1, augsTwohand[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					selectRandom = math.random(1, #augsRanged[augStoneCategory])
					augSnow[1] = augsRanged[augStoneCategory][selectRandom][1]
					augSnow[2] = math.random(1, augsRanged[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory == 15) then
					selectRandom = math.random(1, #augsShield[augStoneCategory])
					augSnow[1] = augsShield[augStoneCategory][selectRandom][1]
					augSnow[2] = math.random(1, augsShield[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory == 16) then
					selectRandom = math.random(1, #augsInstrument[augStoneCategory])
					augSnow[1] = augsInstrument[augStoneCategory][selectRandom][1]
					augSnow[2] = math.random(1, augsInstrument[augStoneCategory][selectRandom][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1", augStoneCategory)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Aug", augSnow[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Val", augSnow[2])
			-- Leaf
			elseif (augStoneCategory >= 5 and augStoneCategory <= 8) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					selectRandom = math.random(1, #augsOnehand[augStoneCategory])
					augLeaf[1] = augsOnehand[augStoneCategory][selectRandom][1]
					augLeaf[2] = math.random(1, augsOnehand[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					selectRandom = math.random(1, #augsTwohand[augStoneCategory])
					augLeaf[1] = augsTwohand[augStoneCategory][selectRandom][1]
					augLeaf[2] = math.random(1, augsTwohand[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					selectRandom = math.random(1, #augsRanged[augStoneCategory])
					augLeaf[1] = augsRanged[augStoneCategory][selectRandom][1]
					augLeaf[2] = math.random(1, augsRanged[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory == 15) then
					selectRandom = math.random(1, #augsShield[augStoneCategory])
					augLeaf[1] = augsShield[augStoneCategory][selectRandom][1]
					augLeaf[2] = math.random(1, augsShield[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory == 16) then
					selectRandom = math.random(1, #augsInstrument[augStoneCategory])
					augLeaf[1] = augsInstrument[augStoneCategory][selectRandom][1]
					augLeaf[2] = math.random(1, augsInstrument[augStoneCategory][selectRandom][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2", augStoneCategory)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Aug", augLeaf[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Val", augLeaf[2])
			-- Dusk
			elseif (augStoneCategory >= 9 and augStoneCategory <= 12) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					selectRandom = math.random(1, #augsOnehand[augStoneCategory])
					augDusk[1] = augsOnehand[augStoneCategory][selectRandom][1]
					augDusk[2] = math.random(1, augsOnehand[augStoneCategory][selectRandom][2] - 1)
					
					if ((augStoneCategory == 9 and selectRandom == 7) or (augStoneCategory == 10 and selectRandom == 2)) then
						augDusk[2] = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
					end
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					selectRandom = math.random(1, #augsTwohand[augStoneCategory])
					augDusk[1] = augsTwohand[augStoneCategory][selectRandom][1]
					augDusk[2] = math.random(1, augsTwohand[augStoneCategory][selectRandom][2] - 1)
					
					if ((augStoneCategory == 9 and selectRandom == 7) or (augStoneCategory == 10 and selectRandom == 2)) then
						augDusk[2] = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					selectRandom = math.random(1, #augsRanged[augStoneCategory])
					augDusk[1] = augsRanged[augStoneCategory][selectRandom][1]
					augDusk[2] = math.random(1, augsRanged[augStoneCategory][selectRandom][2] - 1)
					
					if ((augStoneCategory == 9 and selectRandom == 7) or (augStoneCategory == 10 and selectRandom == 2)) then
						augDusk[2] = math.random(1, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory == 15) then
					selectRandom = math.random(1, #augsShield[augStoneCategory])
					augDusk[1] = augsShield[augStoneCategory][selectRandom][1]
					augDusk[2] = math.random(1, augsShield[augStoneCategory][selectRandom][2] - 1)
				elseif (augGearCategory == 16) then
					selectRandom = math.random(1, #augsInstrument[augStoneCategory])
					augDusk[1] = augsInstrument[augStoneCategory][selectRandom][1]
					augDusk[2] = math.random(1, augsInstrument[augStoneCategory][selectRandom][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3", augStoneCategory)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Aug", augDusk[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Val", augDusk[2])
			end
			
			player:tradeComplete()
			
			player:addItem(augGear, 1, augSnow[1], augSnow[2], augLeaf[1], augLeaf[2], augDusk[1], augDusk[2])
			
			player:PrintToPlayer(string.format("Gaddiux : Here you go. Augmenting these things never gets old."),tpz.msg.channel.NS_SAY)
		-- Applies existing augments and rolls new augment value in same category as traded stone (HQ stones)
		elseif (hasExistingAug == true and augStoneCategory > 12) then
			local augSnow = {0, 0}
			local augLeaf = {0, 0}
			local augDusk = {0, 0}
			local stoneType = {"Snowslit", "Snowtip", "Snowdim", "Snoworb", "Leafslit", "Leaftip", "Leafdim", "Leaforb", "Duskslit", "Dusktip", "Duskdim", "Duskorb"}
			local wrongType = 0
		
			-- Check if traded Stone category matches existing augment Stone category
			if (existingAug.Category[1] >= 1 and existingAug.Category[1] <= 4) then
				augSnow = {existingAug.Augment[1], existingAug.Value[1]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 1 (SNOW)  AUG: [%i]  VALUE: [%i]", augSnow[1], augSnow[2])
			end
			
			if (existingAug.Category[2] >= 5 and existingAug.Category[2] <= 8) then
				augLeaf = {existingAug.Augment[2], existingAug.Value[2]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 2 (LEAF)  AUG: [%i]  VALUE: [%i]", augLeaf[1], augLeaf[2])
			end
			
			if (existingAug.Category[3] >= 9 and existingAug.Category[3] <= 12) then
				augDusk = {existingAug.Augment[3], existingAug.Value[3]}
				-- printf("Gaddiux.lua onTrade EXISTING AUG CATEGORY 3 (DUSK)  AUG: [%i]  VALUE: [%i]", augDusk[1], augDusk[2])
			end
			
			-- Cancel trade if the weapon does not have an existing augment in the Stone category
			-- Snow +1 & Snow +2
			if ((augSnow[1] == 0) and (augStoneCategory >= 13 and augStoneCategory <= 16) or (augSnow[1] == 0) and (augStoneCategory >= 25 and augStoneCategory <= 28)) then
				player:PrintToPlayer(string.format("Gaddiux : Whoa there, the power in those stones will destroy the weapon if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
				return
			-- Leaf +1 & Leaf +2
			elseif ((augLeaf[1] == 0) and (augStoneCategory >= 17 and augStoneCategory <= 20) or (augLeaf[1] == 0) and (augStoneCategory >= 29 and augStoneCategory <= 32)) then
				player:PrintToPlayer(string.format("Gaddiux : Whoa there, the power in those stones will destroy the weapon if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
				return
			-- Dusk +1 and Dusk +2
			elseif ((augDusk[1] == 0) and (augStoneCategory >= 21 and augStoneCategory <= 24) or (augDusk[1] == 0) and (augStoneCategory >= 33 and augStoneCategory <= 36)) then
				player:PrintToPlayer(string.format("Gaddiux : Whoa there, the power in those stones will destroy the weapon if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
				return
			end
			
			-- Cancel trade if HQ stone doesn't match existing category
			if (augStoneCategory >= 13 and augStoneCategory <= 16 and augStoneCategory - 12 ~= existingAug.Category[1]) then
				wrongType = 1
			elseif (augStoneCategory >= 17 and augStoneCategory <= 20 and augStoneCategory - 12 ~= existingAug.Category[2]) then
				wrongType = 2
			elseif (augStoneCategory >= 21 and augStoneCategory <= 24 and augStoneCategory - 12 ~= existingAug.Category[3]) then
				wrongType = 3
			elseif (augStoneCategory >= 25 and augStoneCategory <= 28 and augStoneCategory - 24 ~= existingAug.Category[1]) then
				wrongType = 1
			elseif (augStoneCategory >= 29 and augStoneCategory <= 32 and augStoneCategory - 24 ~= existingAug.Category[2]) then
				wrongType = 2
			elseif (augStoneCategory >= 33 and augStoneCategory <= 36 and augStoneCategory - 24 ~= existingAug.Category[3]) then
				wrongType = 3
			end
			
			if (wrongType > 0) then
				player:PrintToPlayer(string.format("Gaddiux : No can do. Looks like you currently have a %s augment, so I'll need that type of stone.", stoneType[existingAug.Category[wrongType]]),tpz.msg.channel.NS_SAY)
				return
			end
			
			local augPointer
			local augMinValue
			
			-- Apply new augments
			-- Snow +1
			if (augStoneCategory >= 13 and augStoneCategory <= 16) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsOnehand[augStoneCategory - 12][i][1])
						if (augsOnehand[augStoneCategory - 12][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTwohand[augStoneCategory - 12][i][1])
						if (augsTwohand[augStoneCategory - 12][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsRanged[augStoneCategory - 12][i][1])
						if (augsRanged[augStoneCategory - 12][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsRanged[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsShield[augStoneCategory - 12][i][1])
						if (augsShield[augStoneCategory - 12][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsShield[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsInstrument[augStoneCategory - 12][i][1])
						if (augsInstrument[augStoneCategory - 12][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 12][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1", augStoneCategory - 12)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Aug", augSnow[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Val", augSnow[2])
			-- Snow +2
			elseif (augStoneCategory >= 25 and augStoneCategory <= 28) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsOnehand[augStoneCategory - 24][i][1])
						if (augsOnehand[augStoneCategory - 24][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 24) then
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTwohand[augStoneCategory - 24][i][1])
						if (augsTwohand[augStoneCategory - 24][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsRanged[augStoneCategory - 24][i][1])
						if (augsRanged[augStoneCategory - 24][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsRanged[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsShield[augStoneCategory - 24][i][1])
						if (augsShield[augStoneCategory - 24][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsShield[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsInstrument[augStoneCategory - 24][i][1])
						if (augsInstrument[augStoneCategory - 24][i][1] == augSnow[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augSnow[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 24][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1", augStoneCategory - 24)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Aug", augSnow[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_1_Val", augSnow[2])
			-- Leaf +1
			elseif (augStoneCategory >= 17 and augStoneCategory <= 20) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsOnehand[augStoneCategory - 12][i][1])
						if (augsOnehand[augStoneCategory - 12][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTwohand[augStoneCategory - 12][i][1])
						if (augsTwohand[augStoneCategory - 12][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsRanged[augStoneCategory - 12][i][1])
						if (augsRanged[augStoneCategory - 12][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsRanged[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsShield[augStoneCategory - 12][i][1])
						if (augsShield[augStoneCategory - 12][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsShield[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsInstrument[augStoneCategory - 12][i][1])
						if (augsInstrument[augStoneCategory - 12][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 12][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2", augStoneCategory - 12)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Aug", augLeaf[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Val", augLeaf[2])
			-- Leaf +2
			elseif (augStoneCategory >= 29 and augStoneCategory <= 32) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsOnehand[augStoneCategory - 24][i][1])
						if (augsOnehand[augStoneCategory - 24][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTwohand[augStoneCategory - 24][i][1])
						if (augsTwohand[augStoneCategory - 24][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsRanged[augStoneCategory - 24][i][1])
						if (augsRanged[augStoneCategory - 24][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsRanged[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsShield[augStoneCategory - 24][i][1])
						if (augsShield[augStoneCategory - 24][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsShield[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsInstrument[augStoneCategory - 24][i][1])
						if (augsInstrument[augStoneCategory - 24][i][1] == augLeaf[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augLeaf[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 24][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2", augStoneCategory - 24)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Aug", augLeaf[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_2_Val", augLeaf[2])
			-- Dusk +1
			elseif (augStoneCategory >= 21 and augStoneCategory <= 24) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsOnehand[augStoneCategory - 12][i][1])
						if (augsOnehand[augStoneCategory - 12][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 12][augPointer][2] - 1)
					
					if ((augStoneCategory - 12 == 9 and augDusk[1] == 740) or (augStoneCategory - 12 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.35)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					end
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					if (augDusk[1] == 741) then
						augDusk[1] = 740
					end
				
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTwohand[augStoneCategory - 12][i][1])
						if (augsTwohand[augStoneCategory - 12][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 12][augPointer][2] - 1)
					
					if ((augStoneCategory - 12 == 9 and augDusk[1] == 740) or (augStoneCategory - 12 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.35)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					if (augDusk[1] == 741) then
						augDusk[1] = 740
					end
				
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsRanged[augStoneCategory - 12][i][1])
						if (augsRanged[augStoneCategory - 12][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsRanged[augStoneCategory - 12][augPointer][2] - 1)
					
					if ((augStoneCategory - 12 == 9 and augDusk[1] == 740) or (augStoneCategory - 12 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.35)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsShield[augStoneCategory - 12][i][1])
						if (augsShield[augStoneCategory - 12][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsShield[augStoneCategory - 12][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsInstrument[augStoneCategory - 12][i][1])
						if (augsInstrument[augStoneCategory - 12][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 12][i][2] * 0.35)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 12][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 12][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3", augStoneCategory - 12)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Aug", augDusk[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Val", augDusk[2])
			-- Dusk +2
			elseif (augStoneCategory >= 33 and augStoneCategory <= 36) then
				if (augGearCategory >= 1 and augGearCategory <= 6) then
					for i, v in ipairs(augsOnehand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsOnehand[augStoneCategory - 24][i][1])
						if (augsOnehand[augStoneCategory - 24][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsOnehand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsOnehand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsOnehand[augStoneCategory - 24][augPointer][2] - 1)
					
					if ((augStoneCategory - 24 == 9 and augDusk[1] == 740) or (augStoneCategory - 24 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.70)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					end
				elseif (augGearCategory >= 7 and augGearCategory <= 12) then
					if (augDusk[1] == 741) then
						augDusk[1] = 740
					end
				
					for i, v in ipairs(augsTwohand) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTwohand[augStoneCategory - 24][i][1])
						if (augsTwohand[augStoneCategory - 24][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsTwohand[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTwohand[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsTwohand[augStoneCategory - 24][augPointer][2] - 1)
					
					if ((augStoneCategory - 24 == 9 and augDusk[1] == 740) or (augStoneCategory - 24 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.70)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory >= 13 and augGearCategory <= 14) then
					if (augDusk[1] == 741) then
						augDusk[1] = 740
					end
				
					for i, v in ipairs(augsRanged) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsRanged[augStoneCategory - 24][i][1])
						if (augsRanged[augStoneCategory - 24][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsRanged[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsRanged[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsRanged[augStoneCategory - 24][augPointer][2] - 1)
					
					if ((augStoneCategory - 24 == 9 and augDusk[1] == 740) or (augStoneCategory - 24 == 10 and augDusk[1] == 740)) then
						augMinValue = math.floor(augWeaponDMGCaps[augGearCategory][1] * 0.70)
						augDusk[2] = math.random(augMinValue, augWeaponDMGCaps[augGearCategory][1] - 1)
					
						if (augDusk[2] <= 31) then
							augDusk[1] = 740
						elseif (augDusk[2] > 31) then
							augDusk[1] = 741
							augDusk[2] = augDusk[2] - 32
						end
					end
				elseif (augGearCategory == 15) then
					for i, v in ipairs(augsShield) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsShield[augStoneCategory - 24][i][1])
						if (augsShield[augStoneCategory - 24][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsShield[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsShield[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsShield[augStoneCategory - 24][augPointer][2] - 1)
				elseif (augGearCategory == 16) then
					for i, v in ipairs(augsInstrument) do
						-- printf("Gadiux.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsInstrument[augStoneCategory - 24][i][1])
						if (augsInstrument[augStoneCategory - 24][i][1] == augDusk[1]) then
							augPointer = i
							augMinValue = math.floor(augsInstrument[augStoneCategory - 24][i][2] * 0.70)
							-- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsInstrument[augStoneCategory - 24][i][2], augMinValue)
							break
						end
					end
					
					augDusk[2] = math.random(augMinValue, augsInstrument[augStoneCategory - 24][augPointer][2] - 1)
				end
				
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3", augStoneCategory - 24)
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Aug", augDusk[1])
				player:setCharVar("Gaddiux_"..augGear.."_Cat_3_Val", augDusk[2])
			end
			
			player:tradeComplete()
			
			player:addItem(augGear, 1, augSnow[1], augSnow[2], augLeaf[1], augLeaf[2], augDusk[1], augDusk[2])
			
			if (augStoneCategory >= 13 and augStoneCategory <= 24) then
				player:PrintToPlayer(string.format("Gaddiux : Aha! The power for that augment was much stronger!"),tpz.msg.channel.NS_SAY)
			elseif (augStoneCategory >= 25 and augStoneCategory <= 36) then
				player:PrintToPlayer(string.format("Gaddiux : Phew, that one had a lot of power! It kind of burned a little."),tpz.msg.channel.NS_SAY)
			end
		end
	else
		player:PrintToPlayer(string.format("Gaddiux : Looks like you'll need to defeat the city Voidwatch before I can augment that item."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	if (player:getCharVar("KillCounter_Hahava") > 0 and player:getCharVar("KillCounter_Voidwrought") > 0 and player:getCharVar("KillCounter_Celaeno") > 0) then
		player:PrintToPlayer(string.format("Gaddiux : I handle the complicated process of applying augments to Alluvion Skirmish weapons from Jeunoan Voidwatch monsters."),tpz.msg.channel.NS_SAY)
	else
		player:PrintToPlayer(string.format("Gaddiux : Looks like you'll need to defeat the city Voidwatch before I can do anything for you."),tpz.msg.channel.NS_SAY)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end