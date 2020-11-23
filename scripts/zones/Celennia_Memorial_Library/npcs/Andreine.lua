-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Andreine
-- !pos -91 -2 -91 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	local job = player:getMainJob();
	local level = player:getMainLvl();
	
	if (job == tpz.job.WAR) then
		if (level <= 30) then	
			local stock_WAR =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					16716,	5000,		-- (Great Axe) Butterfly Axe +1
					16646,	5000,		-- (Axe) Bronze Axe +1
					17175,	5000,		-- (Archery) Shortbow +1
					17228,	5000,		-- (Marksmanship) Light Crossbow +1
					17290,	5000,		-- (Throwing) Coarse Boomerang
					17318,	1,			-- (Ammunition) Wooden Arrow
					17339,	1,			-- (Ammunition) Bronze Bolt
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13226,	2000,		-- (Waist) Blood Stone +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WAR);
		elseif (level <= 60) then
			local stock_WAR =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WAR);
		elseif (level <= 99) then
			local stock_WAR =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WAR);
		end;
		
		player:PrintToPlayer(string.format("Andreine : I've got gear to get your Warrior's arsenal started!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.MNK) then
		if (level <= 30) then
			local stock_MNK =
				{
					20533,	5000,		-- (Hand-to-Hand) Worm Feelers +1
					16690,	5000,		-- (Hand-to-Hand) Cesti +1
					17296,	1,			-- (Throwing) Pebble
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13060,	2000,		-- (Neck) Feather Collar +1
					13226,	2000,		-- (Waist) Blood Stone +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_MNK);
		elseif (level <= 60) then
			local stock_MNK =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_MNK);
		elseif (level <= 99) then
			local stock_MNK =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_MNK);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Ah, the supreme focus of a Monk! I wish I could focus like you..."),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.WHM) then
		if (level <= 30) then
			local stock_WHM =
				{
					17087,	5000,		-- (Club) Maple Wand +1
					17137,	5000,		-- (Club) Ash Club +1
					17144,	5000,		-- (Club) Bronze Hammer +1
					17123,	5000,		-- (Staff) Ash Staff +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13283,	2000,		-- (Ring) Saintly Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WHM);
		elseif (level <= 60) then
			local stock_WHM =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WHM);
		elseif (level <= 99) then
			local stock_WHM =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_WHM);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Hopefully this gear will make leveling White Mage just a little less painful!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.BLM) then
		if (level <= 30) then
			local stock_BLM =
				{
					17087,	5000,		-- (Club) Maple Wand +1
					17123,	5000,		-- (Staff) Ash Staff +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13285,	2000,		-- (Ring) Eremite's Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLM);
		elseif (level <= 60) then
			local stock_BLM =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLM);
		elseif (level <= 99) then
			local stock_BLM =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLM);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Hmm, do you really need extra gear as a Black Mage? So overpowered!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.RDM) then
		if (level <= 30) then
			local stock_RDM =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					17087,	5000,		-- (Club) Maple Wand +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13283,	2000,		-- (Ring) Saintly Ring +1
					13285,	2000,		-- (Ring) Eremite's Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RDM);
		elseif (level <= 60) then
			local stock_RDM =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RDM);
		elseif (level <= 99) then
			local stock_RDM =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RDM);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Couldn't pick just one school of magic to focus on eh? That's ok, I've got gear for you!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.THF) then
		if (level <= 30) then
			local stock_THF =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					16690,	5000,		-- (Hand-to-Hand) Cesti +1
					16491,	5000,		-- (Dagger) Bronze Knife +1
					16492,	5000,		-- (Dagger) Bronze Dagger +1
					17175,	5000,		-- (Archery) Shortbow +1
					19225,	5000,		-- (Marksmanship) Musketoon +1
					17290,	5000,		-- (Throwing) Coarse Boomerang
					17318,	1,			-- (Ammunition) Wooden Arrow
					17343,	1,			-- (Ammunition) Bronze Bullet
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_THF);
		elseif (level <= 60) then
			local stock_THF =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_THF);
		elseif (level <= 99) then
			local stock_THF =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_THF);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Please keep in mind that my wares are for sale and not lifting by sticky fingers!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.PLD) then
		if (level <= 30) then
			local stock_PLD =
				{
					16627,	5000,		-- (Sword) Spatha +1
					12371,	5000,		-- (Shield) Clipeus
					17175,	5000,		-- (Archery) Shortbow +1
					17318,	1,			-- (Ammunition) Wooden Arrow
					12784,	2000,		-- (Gloves) Leather Gloves +1
					12908,  2000,       -- (Legs) Leather Trousers +1
					12971,	2000,		-- (Feet) Leather Highboots +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					14670,	2000,		-- (Ring) Safeguard Ring
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PLD);
		elseif (level <= 60) then
			local stock_PLD =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PLD);
		elseif (level <= 99) then
			local stock_PLD =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PLD);
		end;
		
		player:PrintToPlayer(string.format("Andreine : You're going to need to soak up a lot of damage as a Paladin! I hope this gear helps!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.DRK) then
		if (level <= 30) then
			local stock_DRK =
				{
					16778,	5000,		-- (Scythe) Bronze Zaghnal +1
					16606,	5000,		-- (Great Sword) Rusty Greatsword
					16637,	5000,		-- (Great Sword) Deathbringer
					16716,	5000,		-- (Great Axe) Butterfly Axe +1
					17228,	5000,		-- (Marksmanship) Light Crossbow +1
					17339,	1,			-- (Ammunition) Bronze Bolt
					12784,	2000,		-- (Gloves) Leather Gloves +1
					12908,  2000,       -- (Legs) Leather Trousers +1
					12971,	2000,		-- (Feet) Leather Highboots +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRK);
		elseif (level <= 60) then
			local stock_DRK =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRK);
		elseif (level <= 99) then
			local stock_DRK =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRK);
		end;
		
		player:PrintToPlayer(string.format("Andreine : I know you're always hungry for more souls as a Dark Knight but don't forget to eat food too!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.BST) then
		if (level <= 30) then
			local stock_BST =
				{
					16646,	5000,		-- (Axe) Bronze Axe +1
					16778,	5000,		-- (Scythe) Bronze Zaghnal +1
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13072,	2000,		-- (Neck) Bird Whistle
					13110,	2000,		-- (Neck) Beast Whistle
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BST);
		elseif (level <= 60) then
			local stock_BST =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BST);
		elseif (level <= 99) then
			local stock_BST =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BST);
		end;
		
		player:PrintToPlayer(string.format("Andreine : You're lucky to always have a friend as a Beastmaster! I miss my pets..."),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.BRD) then
		if (level <= 30) then
			local stock_BRD =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					16491,	5000,		-- (Dagger) Bronze Knife +1
					16492,	5000,		-- (Dagger) Bronze Dagger +1
					17372,	5000,		-- (Wind Instrument) Flute +1
					17373,	5000,		-- (String Instrument) Maple Harp +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13072,	2000,		-- (Neck) Bird Whistle
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BRD);
		elseif (level <= 60) then
			local stock_BRD =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BRD);
		elseif (level <= 99) then
			local stock_BRD =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BRD);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Your audiences will expect only the finest from their Bard!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.RNG) then
		if (level <= 30) then
			local stock_RNG =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					16491,	5000,		-- (Dagger) Bronze Knife +1
					16492,	5000,		-- (Dagger) Bronze Dagger +1
					17175,	5000,		-- (Archery) Shortbow +1
					17177,	5000,		-- (Archery) Longbow +1
					17228,	5000,		-- (Marksmanship) Light Crossbow +1
					19225,	5000,		-- (Marksmanship) Musketoon +1
					17318,	1,			-- (Ammunition) Wooden Arrow
					17339,	1,			-- (Ammunition) Bronze Bolt
					17343,	1,			-- (Ammunition) Bronze Bullet
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13060,	2000,		-- (Neck) Feather Collar +1
					13117,	2000,		-- (Neck) Ranger's Necklace
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RNG);
		elseif (level <= 60) then
			local stock_RNG =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RNG);
		elseif (level <= 99) then
			local stock_RNG =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RNG);
		end;
		
		player:PrintToPlayer(string.format("Andreine : I had no idea there were so many types of ranged weapons! How do you Rangers choose?"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.SAM) then
		if (level <= 30) then
			local stock_SAM =
				{
					17809,	5000,		-- (Great Katana) Mumeito
					17175,	5000,		-- (Archery) Shortbow +1
					17318,	1,			-- (Ammunition) Wooden Arrow
					12774,	2000,		-- (Gloves) Tekko +1
					12899,	2000,       -- (Legs) Sitabaki +1
					13031,	2000,		-- (Feet) Kyahan +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SAM);
		elseif (level <= 60) then
			local stock_SAM =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SAM);
		elseif (level <= 99) then
			local stock_SAM =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SAM);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Well met noble Samurai! There are demons which must taste the steel of your blade."),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.NIN) then
		if (level <= 30) then
			local stock_NIN =
				{
					16914,	2500,		-- (Katana) Kunai +1
					16918,	3500,		-- (Katana) Wakizashi +1
					17307,	1,			-- (Throwing) Dart
					17301,	2,			-- (Throwing) Shuriken
					12774,	2000,		-- (Gloves) Tekko +1
					12899,	2000,       -- (Legs) Sitabaki +1
					13031,	2000,		-- (Feet) Kyahan +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_NIN);
		elseif (level <= 60) then
			local stock_NIN =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_NIN);
		elseif (level <= 99) then
			local stock_NIN =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_NIN);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Oh! You Ninjas always startle me when you appear out of nowhere like that!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.DRG) then
		if (level <= 30) then
			local stock_DRG =
				{
					16862,	5000,		-- (Polearm) Harpoon +1
					19305,	5000,		-- (Polearm) Pike
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRG);
		elseif (level <= 60) then
			local stock_DRG =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRG);
		elseif (level <= 99) then
			local stock_DRG =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DRG);
		end;
		
		player:PrintToPlayer(string.format("Andreine : It's so good to see a Dragoon again! Give your wyvern a special treat from me!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.SMN) then
		if (level <= 30) then
			local stock_SMN =
				{
					17123,	5000,		-- (Staff) Ash Staff +1
					17122,	5000,		-- (Staff) Ash Pole +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SMN);
		elseif (level <= 60) then
			local stock_SMN =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SMN);
		elseif (level <= 99) then
			local stock_SMN =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SMN);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Greetings noble Summoner! Are all of the avatars getting along today?"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.BLU) then
		if (level <= 30) then
			local stock_BLU =
				{
					16610,	5000,		-- (Sword) Wax Sword +1
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13190,	2000,		-- (Waist) Heko Obi +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLU);
		elseif (level <= 60) then
			local stock_BLU =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLU);
		elseif (level <= 99) then
			local stock_BLU =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_BLU);
		end;
		
		player:PrintToPlayer(string.format("Andreine : You may know the secrets of monster techniques Blue Mage but I have the gear you'll need!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.COR) then
		if (level <= 30) then
			local stock_COR =
				{
					16624,	5000,		-- (Sword) Xiphos +1
					16491,	5000,		-- (Dagger) Bronze Knife +1
					19225,	5000,		-- (Marksmanship) Musketoon +1
					17343,	1,			-- (Ammunition) Bronze Bullet
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_COR);
		elseif (level <= 60) then
			local stock_COR =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_COR);
		elseif (level <= 99) then
			local stock_COR =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_COR);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Ready to roll the dice Corsair? I wish you the best of luck out there!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.PUP) then
		if (level <= 30) then
			local stock_PUP =
				{
					17476,	5000,		-- (Hand-to-Hand) Cat Baghnakhs +1
					17859,	1000,		-- (Ranged) Animator
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					16282,	2000,		-- (Neck) Buffoon's Collar +1
					13226,	2000,		-- (Waist) Blood Stone +1
					13605,	2000,		-- (Back) Cape +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PUP);
		elseif (level <= 60) then
			local stock_PUP =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PUP);
		elseif (level <= 99) then
			local stock_PUP =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_PUP);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Oh, how wonderful to see a Puppetmaster! Such finesse in controlling your puppet!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.DNC) then
		if (level <= 30) then
			local stock_DNC =
				{
					16690,	5000,		-- (Hand-to-Hand) Cesti +1
					16491,	5000,		-- (Dagger) Bronze Knife +1
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DNC);
		elseif (level <= 60) then
			local stock_DNC =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DNC);
		elseif (level <= 99) then
			local stock_DNC =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_DNC);
		end;
		
		player:PrintToPlayer(string.format("Andreine : The graceful movements of you Dancer's are always so hypnotizing!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.SCH) then
		if (level <= 30) then
			local stock_SCH =
				{
					17123,	5000,		-- (Staff) Ash Staff +1
					17122,	5000,		-- (Staff) Ash Pole +1
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SCH);
		elseif (level <= 60) then
			local stock_SCH =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SCH);
		elseif (level <= 99) then
			local stock_SCH =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_SCH);
		end;
		
		player:PrintToPlayer(string.format("Andreine : You've got the book knowledge Scholar, now you just need the gear!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.GEO) then
		if (level <= 30) then
			local stock_GEO =
				{
					17087,	5000,		-- (Club) Maple Wand +1
					17137,	5000,		-- (Club) Ash Club +1
					17144,	5000,		-- (Club) Bronze Hammer +1
					21460,	1000,		-- (Handbell) Matre Bell
					12744,	2000,		-- (Gloves) Cuffs +1
					12897,  2000,       -- (Legs) Slops +1
					12983,	2000,		-- (Feet) Ash Clogs +1
					13093,	2000,		-- (Neck) Justice Badge
					13190,	2000,		-- (Waist) Heko Obi +1
					13605,	2000,		-- (Back) Cape +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					13548,	50000,		-- (Ring) Astral Ring
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_GEO);
		elseif (level <= 60) then
			local stock_GEO =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_GEO);
		elseif (level <= 99) then
			local stock_GEO =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_GEO);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Geomancers are always so spaced out when they come in here!"),tpz.msg.channel.NS_SAY)
	elseif (job == tpz.job.RUN) then
		if (level <= 30) then
			local stock_RUN =
				{
					16606,	5000,		-- (Great Sword) Rusty Greatsword
					20781,	5000,		-- (Great Sword) Sowilo Claymore
					17307,	1,			-- (Ammunition) Dart
					12695,	2000,		-- (Gloves) Bronze Mittens +1
					12823,  2000,       -- (Legs) Bronze Subligar +1
					12951,	2000,		-- (Feet) Bronze Leggings +1
					13069,	2000,		-- (Neck) Leather Gorget +1
					13210,	2000,		-- (Waist) Leather Belt +1
					13599,	2000,		-- (Back) Rabbit Mantle +1
					14695,	2000,		-- (Earring) Hope Earring +1
					14694,	2000,		-- (Earring) Energy Earring +1
					13492,	2000,		-- (Ring) Copper Ring +1
					317,	100000,		-- (Item) Bronze Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RUN);
		elseif (level <= 60) then
			local stock_RUN =
				{
					318,	250000,		-- (Item) Crystal Rose (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RUN);
		elseif (level <= 99) then
			local stock_RUN =
				{
					3645,	500000,		-- (Item) Leafbell (Used to trigger augment application trades)
				};
			tpz.shop.general(player, stock_RUN);
		end;
		
		player:PrintToPlayer(string.format("Andreine : Mysterious runes? High magical defenses? 100%% Rune Fencer!"),tpz.msg.channel.NS_SAY)
	end;
	player:PrintToPlayer(string.format("Andreine's stock changes when you reach levels 31, 61, 75, and 99."),tpz.msg.channel.SYSTEM_3)
end;

function onEventUpdate(player,csid,option)
	
end;

function onEventFinish(player,csid,option)
	
end;