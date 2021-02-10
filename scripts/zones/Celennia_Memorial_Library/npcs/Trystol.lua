-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Trystol
-- !pos -101 -2 -84 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	
end

function onTrigger(player,npc)
	local stock_BST = 
	{
		17907,	2500,		-- (Ammunition) Swirling Broth
		21445,	2500,		-- (Ammunition) Lyrical Broth
		21444,	2500,		-- (Ammunition) Livid Broth
		21488,	2500,		-- (Ammunition) Pristine Sap
		21448,	2500,		-- (Ammunition) Pale Sap
		17908,	2500,		-- (Ammunition) Shimmering Broth
		21447,	2500,		-- (Ammunition) Crumbly Soil
		21496,	2500,		-- (Ammunition) Furious Broth
		21498,	2500,		-- (Ammunition) Crackling Broth
		21499,	2500,		-- (Ammunition) Creepy Broth
		21490,	2500,		-- (Ammunition) Aged Humus
		21497,	2500,		-- (Ammunition) Rapid Broth
		21449,	2500,		-- (Ammunition) Dire Broth
		21492,	2500,		-- (Ammunition) Insipid Broth
		21446,	2500,		-- (Ammunition) Airy Broth
		17909,	2500,		-- (Ammunition) Spicy Broth
		21450,	2500,		-- (Ammunition) Electrified Broth
		21438,	2500,		-- (Ammunition) Poisonous Broth
		21440,	2500,		-- (Ammunition) Sugary Broth
		21442,	2500,		-- (Ammunition) Sticky Webbing
		21494,	2500,		-- (Ammunition) Wetlands Broth
		21489,	5000,		-- (Ammunition) (HQ) Truly Pristine Sap
		21493,	5000,		-- (Ammunition) (HQ) Deepwater Broth
		21451,	5000,		-- (Ammunition) (HQ) Bug-Ridden Broth
		21439,	5000,		-- (Ammunition) (HQ) Venomous Broth
		21441,	5000,		-- (Ammunition) (HQ) Glazed Broth
		21443,	5000,		-- (Ammunition) (HQ) Slimy Webbing
		21495,	5000,		-- (Ammunition) (HQ) Heavenly Broth
	}
	tpz.shop.general(player, stock_BST)
	
	player:PrintToPlayer(string.format("Trystol : I have all of the foods for attracting the best pets a Beastmaster could ask for!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end