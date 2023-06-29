-----------------------------------
-- Area: Upper Jeuno
--  NPC: Coumuna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        20573, 250000,  -- Aern Dagger
        20574, 250000,  -- Aern Dagger II
        20674, 250000,  -- Aern Sword
        20675, 250000,  -- Aern Sword II
        21742, 250000,  -- Aern Axe
        21743, 250000,  -- Aern Axe II
        21860, 250000,  -- Aern Spear
        21861, 250000,  -- Aern Spear II
        22065, 250000,  -- Aern Staff
        22066, 250000,  -- Aern Staff II
        20666, 250000,  -- Blizzard Brand
        20668, 250000,  -- Firetongue
        18563, 250000,  -- Arc Scythe
        18912, 250000,  -- Arc Saber
        18913, 250000,  -- Arc Sword
        18464, 250000,  -- Ark Tachi
        18545, 250000,  -- Ark Tabar
        17748, 250000,  -- Ibushi Shinai
        21609, 250000,  -- Save the Queen II
        20694, 250000,  -- Fermion Sword
        21693, 250000,  -- Irradiance Blade
        20514, 250000,  -- Aphelion Knuckles
        20570, 250000,  -- Norgish Dagger
        20576, 250000,  -- Qutrub Dagger
        20578, 250000,  -- Wind Knife
        20577, 250000,  -- Chicken Knife II
        20571, 250000,  -- Infiltrator
        21509, 250000,  -- Premium Mogti
        21741, 250000,  -- Demonic Axe
        21745, 250000,  -- Dullahan Axe
        21744, 250000,  -- Gramk's Axe
        18600, 250000,  -- Caver's Shovel
        18846, 250000,  -- Battledore
        22039, 250000,  -- Floral Hagoita
        21862, 250000,  -- Mizukage-no-naginata
        22112, 250000,  -- Mizukage-no-Yumi
        20933, 250000,  -- Hotengeki
        21867, 250000,  -- Sha Wujing's Lance
        21658, 250000,  -- Brave Blade II
        21623, 250000,  -- Twinned Blade
        21680, 250000,  -- Goujian
        21681, 250000,  -- Ophidian Sword
        21770, 250000,  -- Helgoland
        17831, 250000,  -- Hardwood Katana
        21977, 250000,  -- Mutsunokami
        22050, 250000,  -- Chac-chacs
        22124, 250000,  -- Artemis's Bow
        21280, 250000,  -- Decazoom Mk-XI
        22282, 250000,  -- Grudge
        27631, 250000,  -- Cait Sith's Guard
        26410, 250000,  -- Diamond Buckler
        26409, 250000,  -- Dullahan Shield
        20953, 250000,  -- Escritorio
        21095, 250000,  -- Heartbeater
    }

    player:PrintToPlayer(string.format("Coumuna: I offer all sorts of vanity weapons!"),tpz.msg.channel.NS_SAY)
	tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
