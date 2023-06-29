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
    -- KSNM The Scarlet King
    [199] =
    {
        { -- Accessories, 1 is guaranteed.
            {itemid = 28368, droprate =  40}, -- Ygnas's Resolve +1
            {itemid = 28377, droprate =  60}, -- Ygnas's Resolve
            {itemid = 28539, droprate = 100}, -- Globidonta Ring
            {itemid = 26086, droprate = 125}, -- Nicander's Necklace
            {itemid = 10840, droprate = 175}, -- Aswang Sash
            {itemid = 10799, droprate = 200}, -- Sljor Ring
            {itemid = 28571, droprate = 300}, -- Waterfall Ring
        },
	
        { -- Tier 1-3 mats, 1 guaranteed
            {itemid =  4075, droprate =  25}, -- Hope Crystal
            {itemid =  9004, droprate =  60}, -- Macuil Plating
            {itemid =  9005, droprate =  60}, -- Macuil Horn
            {itemid =  9258, droprate =  90}, -- Azure Cermet
            {itemid =  9246, droprate = 105}, -- Cypress Lumber
            {itemid =  9254, droprate = 105}, -- Faulpie Leather
            {itemid =  9250, droprate = 105}, -- Ruthenium Ingot
            {itemid =  9245, droprate = 150}, -- Cypress Log
            {itemid =  9253, droprate = 150}, -- S. Faulpie Leather
            {itemid =  9249, droprate = 150}, -- Ruthenium Ore
        },
	
        { -- Tier 1-3 mats, 50/50 to get something
            {itemid =     0, droprate = 500}, -- Nothing
            {itemid =  4075, droprate =  12}, -- Hope Crystal
            {itemid =  9004, droprate =  30}, -- Macuil Plating
            {itemid =  9005, droprate =  30}, -- Macuil Horn
            {itemid =  9258, droprate =  45}, -- Azure Cermet
            {itemid =  9246, droprate =  52}, -- Cypress Lumber
            {itemid =  9254, droprate =  53}, -- Faulpie Leather
            {itemid =  9250, droprate =  53}, -- Ruthenium Ingot
            {itemid =  9245, droprate =  75}, -- Cypress Log
            {itemid =  9253, droprate =  75}, -- S. Faulpie Leather
            {itemid =  9249, droprate =  75}, -- Ruthenium Ore
        },
        
        { -- Tier 4 mats, 1 is guaranteed.
            {itemid =  3980, droprate = 100}, -- Bztavian Stinger
            {itemid =  3981, droprate = 100}, -- Bztavian Wing
            {itemid =  3979, droprate = 100}, -- Rockfin Tooth
            {itemid =  3977, droprate = 100}, -- Gabbrath Horn
            {itemid =  4014, droprate = 100}, -- Yggdreant Bole
            {itemid =  4015, droprate = 100}, -- Yggdreant Root
            {itemid =  4012, droprate = 100}, -- Waktza Rostrum
            {itemid =  4013, droprate = 100}, -- Waktza Crest
            {itemid =  8752, droprate = 100}, -- Cehuetzi Claw
            {itemid =  8754, droprate = 100}, -- Cehuetzi Pelt
        },
        
        { -- Tier 4 mats, 50% to get, 50% nothing.
            {itemid =     0, droprate = 500}, -- Nothing
            {itemid =  3980, droprate = 100}, -- Bztavian Stinger
            {itemid =  3981, droprate = 100}, -- Bztavian Wing
            {itemid =  4014, droprate = 100}, -- Yggdreant Bole
            {itemid =  4015, droprate = 100}, -- Yggdreant Root
            {itemid =  3979, droprate = 100}, -- Rockfin Tooth
        },
        {
            {itemid =  9783, droprate = 330}, -- Abdjhalis Gem
            {itemid =  9784, droprate = 330}, -- Abdjhalis Anima
            {itemid =  9782, droprate = 330}, -- Abdjhalis Nugget
            {itemid =     0, droprate =  10}, -- Nothing
        },
        
        {
            {itemid =  9783, droprate = 70}, -- Abdjhalis Gem
            {itemid =  9784, droprate = 70}, -- Abdjhalis Anima
            {itemid =  9782, droprate = 70}, -- Abdjhalis Nugget
            {itemid =     0, droprate = 790}, -- Nothing
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
