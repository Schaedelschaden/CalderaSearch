-----------------------------------
-- Area: Chamber of Oracles
--  NPC: Armoury Crate
-------------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
-------------------------------------

local loot =
{
    -- BCNM Legion XI Comitatensis
    [193] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 500000}, -- gil
        -- },
		{
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28659, droprate = 300}, -- Camaraderie Shield
			{itemid =  21188, droprate = 300}, -- Camaraderie Staff
			{itemid =  21189, droprate = 300}, -- Camaraderie Pole
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28521, droprate = 300}, -- Bladeborn Earring
			{itemid =  28520, droprate = 300}, -- Steelflash Earring
			{itemid =  28463, droprate = 300}, -- Zoran's Belt
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28339, droprate = 300}, -- Manibozho Boots
			{itemid =  28340, droprate = 300}, -- Bokwus Boots
			{itemid =  28338, droprate = 300}, -- Mikinaak Greaves
        },
        {
            {itemid = 0,    droprate = 900},   -- Nothing
            {itemid = 1178, droprate = 100},   -- Lachesis Orb
        },
        {
            {itemid = 8734, droprate = 1000},  -- Kupon I S-1
        },
        {
			{itemid = 0,    droprate = 850},   -- Nothing
            {itemid = 8734, droprate = 150},   -- Kupon I S-1
        },
        {
            {itemid = 4064, droprate = 1000},  -- Rems Chapt 1
        },
		{
			{itemid = 0,    droprate = 850},   -- Nothing
            {itemid = 4064, droprate = 150},   -- Rems Chapt 1
        },
		{
			{itemid = 0,    droprate = 800},   -- Nothing
            {itemid = 844,  droprate = 200},   -- Phoenix Feather
        },
    },
    -- KSNM Eye of the Storm
    [198] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 1000000}, -- gil
        -- },
        {
            {itemid =  20942, droprate = 125}, -- Gae Derg
            {itemid =  20608, droprate = 125}, -- Jugo Kukri
            {itemid =  21034, droprate = 125}, -- Kunimune
            {itemid =  20799, droprate = 125}, -- Mdomo Axe
            {itemid =  21695, droprate = 125}, -- Nullis
            {itemid =  22057, droprate = 125}, -- Contemplator
            {itemid =  21483, droprate = 125}, -- Malison
            {itemid =  21075, droprate = 125}, -- Septopic
        },
        {
            {itemid = 27106, droprate =  145}, -- Asteria Mitts
            {itemid = 27150, droprate =  145}, -- Gaze Bracelets
            {itemid = 27050, droprate =  145}, -- Kachimusha Kote
            {itemid = 27108, droprate =  145}, -- Lamassu Mitts
            {itemid = 27995, droprate =  145}, -- Shigure Tekko
            {itemid = 27993, droprate =  130}, -- Macabre Gauntlets
            {itemid = 27148, droprate =  145}, -- Tatenashi Gote
        },
         {
            {itemid = 4070, droprate = 1000},  -- Rem Chapt 7
        },
        {
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 4070, droprate = 150},   -- Rem Chapt 7
        },
        {
            {itemid = 3972, droprate = 1000},  -- Kupon I S-2
        },
        {
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 3972, droprate = 150},   -- Kupon I S-2
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 655, droprate = 150},   -- Adaman Ingot
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 4018, droprate = 150},   -- Guatambu Log
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 783, droprate = 150},   -- Tenebrite
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 8720, droprate = 150},   -- Maliyakaleya Orb
        },		
		{
            {itemid = 8720, droprate = 1000},   -- Maliyakaleya Orb
        },	
    },
	}

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
