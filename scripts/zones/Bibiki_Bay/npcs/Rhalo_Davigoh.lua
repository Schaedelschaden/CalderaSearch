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
    local multiplier = 1.5
    local stock =
    {
         8992,  250000 * multiplier, -- Jester Malatrix's Shard
         8990,  250000 * multiplier, -- Largantua's Shard
         8977,  250000 * multiplier, -- Ironhorn Baldurno's Horn
         8981,  250000 * multiplier, -- Abyssdiver's Feather
         8976,  250000 * multiplier, -- Prickly Pitriv's Thread
         8988,  250000 * multiplier, -- Waraxe Beak's Hide
         8982,  250000 * multiplier, -- Intuila's Hide
         8983,  250000 * multiplier, -- Emperor Arthro's Shell
         8707,  500000 * multiplier, -- Raaz Hide
         8709,  500000 * multiplier, -- Raaz Tusk
         2169, 1000000 * multiplier, -- Cerberus Hide
         4027, 1000000 * multiplier, -- Spool of Akaso Thread
          722, 1000000 * multiplier, -- Divine Log
         8725, 1000000 * multiplier, -- Exalted Log
          702, 1000000 * multiplier, -- Ebony Log
         4018, 1000000 * multiplier, -- Guatambu Log
         8747, 1000000 * multiplier, -- Chuck of Ra'Kaznar Ore
         8723, 1000000 * multiplier, -- Chunk of Beryllium Ore
         4058, 1000000 * multiplier, -- Chunk of Bismuth Ore
         3922, 1000000 * multiplier, -- Chunk of Rhodium Ore
         9075, 3000000 * multiplier, -- Chunk of Vulcanite Ore
          747, 2000000 * multiplier, -- Orichalcum Ingot
         2275, 2000000 * multiplier, -- Scintillant Ingot
         8724, 2000000 * multiplier, -- Beryllium Ingot
         8748, 2000000 * multiplier, -- Ra'Kaznar Ingot
         3923, 2000000 * multiplier, -- Rhodium Ingot
         8704, 2000000 * multiplier, -- Bismuth Ingot
          657, 2000000 * multiplier, -- Lump of Tama-Hagane
         8751, 2000000 * multiplier, -- Square of Ancestral Cloth
          836, 2000000 * multiplier, -- Square of Damascene Cloth
         4028, 2000000 * multiplier, -- Square of Akaso Cloth
          723, 2000000 * multiplier, -- Piece of Divine Lumber
         8726, 2000000 * multiplier, -- Piece of Exalted Lumber
          719, 2000000 * multiplier, -- Piece of Ebony Lumber
         4019, 2000000 * multiplier, -- Piece of Guatambu Lumber
        21392, 5000000 * multiplier, -- Animator Z
        21393, 5000000 * multiplier, -- Arasy Sachet
    }
    tpz.shop.general(player, stock)
    player:PrintToPlayer(string.format("Rhalo Davigoh: Fine materials, for the distinguished crafter."),tpz.msg.channel.NS_SAY)

    -- player:startEvent(38)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
