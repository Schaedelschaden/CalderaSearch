-----------------------------------
-- Area: Bibiki Bay
--  NPC: Rhalo Davigoh
-- !pos -407 -3 -419 4
-----------------------------------
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
	8992,  250000,			-- Jester Malatrix's Shard
	8990,  250000,			-- Largantua's Shard
	8977,  250000,			-- Ironhorn Baldurno's Horn
	8981,  250000,			-- Abyssdiver's Feather
	8976,  250000,			-- Prickly Pitriv's Thread
	8988,  250000,			-- Waraxe Beak's Hide
	8982,  250000,			-- Intuila's Hide
	8983,  250000,			-- Emperor Arthro's Shell
	8707,  500000,			-- Raaz Hide
	8709,  500000, 			-- Raaz Tusk
	2169,  1000000,			-- Cerberus Hide
	4027,  1000000,			-- Spool of Akaso Thread
	722,   1000000,			-- Divine Log
	8725,  1000000,			-- Exalted Log
	702,   1000000,			-- Ebony Log
	4018,  1000000,			-- Guatambu Log
	8747,  1000000,			-- Chuck of Ra'Kaznar Ore
	8723,  1000000,			-- Chunk of Beryllium Ore
	4058,  1000000,			-- Chunk of Bismuth Ore
	3922,  1000000,			-- Chunk of Rhodium Ore
	9075,  3000000,			-- Chunk of Vulcanite Ore
	747,   2000000,			-- Orichalcum Ingot
	2275,  2000000,			-- Scintillant Ingot
	8724,  2000000,			-- Beryllium Ingot
	8748,  2000000,			-- Ra'Kaznar Ingot
	3923,  2000000,			-- Rhodium Ingot
	8704,  2000000,			-- Bismuth Ingot
	657,   2000000,			-- Lump of Tama-Hagane
	8751,  2000000,			-- Square of Ancestral Cloth
	836,   2000000,			-- Square of Damascene Cloth
	4028,  2000000,			-- Square of Akaso Cloth
	723,   2000000,			-- Piece of Divine Lumber
	8726,  2000000,			-- Piece of Exalted Lumber
	719,   2000000,			-- Piece of Ebony Lumber
	4019,  2000000,			-- Piece of Guatambu Lumber
	21392, 5000000,			-- Animator Z
	21393, 5000000,			-- Arasy Sachet
    }
    tpz.shop.general(player, stock)
    player:PrintToPlayer(string.format("Rhalo Davigoh: Fine materials, for the distinguished crafter."),tpz.msg.channel.NS_SAY)
    
    -- player:startEvent(38)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
