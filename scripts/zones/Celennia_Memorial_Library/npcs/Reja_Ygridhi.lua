-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Reja Ygridhi
-- Standard Merchant NPC
-- !pos -110.7740 -2.1500 -103.7501 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Reja Ygridhi : Get your Rise of the Zilart and Chains of Promathia accessories here!"),tpz.msg.channel.NS_SAY)
    
	local stock =
    {
		15840, 75000,-- Kupofried's Ring
        14739, 50000,-- Suppanomimi
		14740, 50000,-- Knight's Earring
		14741, 50000,-- Abyssal Earring
        14742, 50000,-- Beastly Earring
        14743, 50000,-- Bushinomimi
		15543, 50000,-- Rajas Ring
		15544, 50000,-- Sattva Ring
		15545, 50000,-- Tamas Ring
		15962, 50000,-- Static Earring
		15963, 50000,-- Magnetic Earring
		15964, 50000,-- Hollow Earring
		15965, 50000,-- Ethereal Earring
		2127, 75000, -- metal_chip
		14815, 75000, -- stealth_earring
		15961, 75000, -- musical_earring
		14812, 75000, -- loquacious_earring
		14813, 75000, -- brutal_earring
		15477, 75000, -- boxers_mantle
		15488, 75000, -- gunners_mantle
		15475, 150000, -- charger_mantle
		15476, 150000, -- jaeger_mantle
		15244, 150000, -- flawless_ribbon
    }

    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end