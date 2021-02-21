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
        {
            {itemid =  0, droprate = 625}, -- Nothing
			{itemid =  21007, droprate = 125}, -- Pamun +1
			{itemid =  21042, droprate = 125}, -- Sukezane +1
			{itemid =  21240, droprate = 125}, -- Echidna's Bow +1
        },
        {
            {itemid =  0, droprate = 625}, -- Nothing
			{itemid =  28315, droprate = 125}, -- Aeto. Ledel. +1
			{itemid =  28319, droprate = 125}, -- Haru. Pigaches +1
			{itemid =  28317, droprate = 125}, -- Shab. Sabatons +1
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
