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
            {itemid =  0, droprate = 100}, -- Nothing
			{itemid =  28659, droprate = 300}, -- Camaraderie Shield
			{itemid =  21188, droprate = 300}, -- Camaraderie Staff
			{itemid =  21189, droprate = 300}, -- Camaraderie Pole
        },
        {
            {itemid =  0, droprate = 100}, -- Nothing
			{itemid =  28521, droprate = 300}, -- Bladeborn Earring
			{itemid =  28520, droprate = 300}, -- Steelflash Earring
			{itemid =  28463, droprate = 300}, -- Zoran's Belt
        },
        {
            {itemid =  0, droprate = 100}, -- Nothing
			{itemid =  28339, droprate = 300}, -- Manibozho Boots
			{itemid =  28340, droprate = 300}, -- Bokwus Boots
			{itemid =  28338, droprate = 300}, -- Mikinaak Greaves
        },
        {
            {itemid = 0, droprate = 900}, -- Nothing
            {itemid = 1178, droprate = 100},   -- Lachesis Orb
        },
        {
            {itemid = 8734, droprate = 1000},   -- Kupon I S-1
        },
        {
            {itemid = 8734, droprate = 1000},   -- Kupon I S-1
        },
        {
            {itemid = 4067, droprate = 1000},    -- Rems Chapt 4
        },
		        {
            {itemid = 4067, droprate = 1000},    -- Rems Chapt 4
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
            {itemid = 4073, droprate = 1000},   -- Rem Chapt 10

        },
        {
            {itemid = 4073, droprate = 1000},   -- Rem Chapt 10

        },
        {
            {itemid = 3972, droprate = 1000},   -- Kupon I S-2

        },
        {
            {itemid = 3972, droprate = 1000},   -- Kupon I S-2
        },
		{
            {itemid = 4080, droprate =  175}, -- Moonbow Urushi
            {itemid = 4079, droprate =  165}, -- Moonbow Leather
            {itemid = 4078, droprate =  165}, -- Moonbow Cloth
            {itemid = 4077, droprate =  165}, -- Moonbow Steel
            {itemid = 4081, droprate =  165}, -- Moonbow Stone
			{itemid = 4082, droprate =  165}, -- Moonlight Coral
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
