--------------------------------------------------------------
-- func: !shop <page number>
-- auth: forgottenandlost, corrected to work with Topaz by Schaedel
-- desc: Open a !shop # menu anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
    if (page == 0 or page == nil) then
		player:PrintToPlayer(string.format("Please make a choice using one of the following options:"),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("!shop 1: Food   !shop 2: Crystals   !shop 3: Crafting Gear   !shop 4: Vanity Gear   !shop 5: Charged Ammo"),tpz.msg.channel.SYSTEM_3)
		
	elseif ( page == 1) then -- Creates Food shop.
    local stock_1 =
        {
            4153,   2500,        -- Antacid (food removal medication)
			6212,   850,         -- Marinara Slice +1 (Low level melee food, 60 min duration)
            5744,   3500,        -- Marinara Pizza +1 (low level melee food, 240 min duration)
--			6465,   15000,       -- Behemoth Steak +1 (high level DD food, 240 min duration)
--			6070,   15000,       -- Oceanfin Soup (high level Ranged DD food, 240 min duration)
            5999,   3500,        -- Adoulinian Soup +1 (low level tank food, 240 min duration)
--			6461,   15000,       -- Miso Ramen +1 (high level tank food, 60 min duration)
			6064,   2500,        -- Queen's Crown (high level MAB/MACC food, 180 min duration)
--          6225,   6500,        -- Cyclical Coalescence (high level MAB food, 30 min duration)
--          6568,   5000,        -- Crepe des Rois (high level MACC food, 60 min duration)
--			6261,   3500,        -- Akamochi +1 (low level pet ATK food, 60 min duration)
--			6263,   7500,        -- Kusamochi +1 (high level pet ATK food, 60 min duration)
        };
        tpz.shop.general(player,stock_1);
		
    elseif (page == 2) then -- Creates Crystals shop.
        local stock_2 =
        {
			4096,	1000,		 -- NQ Fire Crystal
			4097,   1000,		 -- NQ Ice Crystal
			4098,   1000,        -- NQ Wind Crystal
			4099,   1000,		 -- NQ Earth Crsytal
			4100,   1000,        -- NQ Lightning Crystal
			4101,   1000,		 -- NQ Water Crystal
			4102,   1000,		 -- NQ Light Crystal
			4103,   1000,		 -- NQ Dark Crystal
            4238,   10000,       -- HQ Fire Crystal
            4239,   10000,       -- HQ Ice Crystal
            4240,   10000,       -- HQ Wind Crystal
            4241,   10000,       -- HQ Earth Crystal
            4242,   10000,       -- HQ Lightning Crystal
            4243,   10000,       -- HQ Water Crystal
            4244,   10000,       -- HQ Light Crystal
            4245,   10000,       -- HQ Dark Crystal
        };
        tpz.shop.general(player,stock_2);

    elseif ( page == 3) then -- Creates Crafting Gear Shop.
        local stock_3 =
        {
            17058,   250000,        -- Caduceus
			14398,   250000,        -- Alchemist's Apron
			13947,   250000,        -- Protective Spectacles
			14397,   250000,        -- Boneworker's Apron
			13946,   250000,        -- Magnifying Spectacles
			14395,   250000,        -- Weaver's Apron
			13948,   250000,        -- Chef's Hat
			14399,   250000,        -- Culinarian's Apron
			13945,   250000,        -- Shaded Spectacles
			14394,   250000,        -- Goldsmith's Apron
			14396,   250000,        -- Tanner's Apron
			14832,   250000,        -- Tanner's Gloves
			14393,   250000,        -- Blacksmith's Apron
			14831,   250000,        -- Smithy's Mitts
			14392,   250000,        -- Carpenter's Apron
			14830,   250000,        -- Carpenter's Gloves
      };
      tpz.shop.general(player,stock_3);
	  
    elseif ( page == 4) then -- Creates Vanity Gear Shop.
        local stock_4 =
        {
            10384,   10000,        -- Cumulus Masque
			11482,   10000,        -- Eyepatch
			10430,   10000,        -- Decennial Crown
			10251,   10000,        -- Decennial Coat
			10593,   10000,        -- Decennial Tights
			10431,   10000,        -- Decennial Tiara
			10252,   10000,        -- Decennial Dress
			10594,   10000,        -- Decennial Hose
			11861,   10000,        -- Hikogami Yukata
			11862,   10000,        -- Himegami Yukata
			11965,   10000,        -- Dream Trousers
			11967,   10000,        -- Dream Pants
			10811,   10000,        -- Chocobo Shield
			10810,   10000,        -- Moogle Guard +1
			10807,   10000,        -- Mandraguard
			10429,   10000,        -- Moogle Masque
			10250,   10000,        -- Moogle Suit
			26968,   10000,        -- Cossie Top +1
			27294,   10000,        -- Cossie Bottom +1
			26966,   10000,        -- Ta Moko +1
			27292,   10000,        -- Swimming Togs +1
      };
      tpz.shop.general(player,stock_4);
	  
	elseif ( page == 5) then -- Creates Charged Ammunition Shop.
        local stock_5 =
        {
			18228,   30,           -- Battery
			18229,   60,           -- Kilo Battery
			18230,   90,           -- Mega Battery
            18232,   30,           -- Hydro Pump
			18233,   60,           -- Kilo Pump
			18234,   90,           -- Mega Pump
			18236,   30,           -- Wind Fan
			18237,   60,           -- Kilo Fan
			18238,   90,           -- Mega Fan
      };
      tpz.shop.general(player,stock_5);

    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end
end;