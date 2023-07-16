-----------------------------------
-- Area: Bibiki Bay
--  NPC: Toh Zonikki
-- Type: Clamming NPC
-- !pos -371 -1 -421 4
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/keyitems")
-----------------------------------
-- Local Variables
-----------------------------------


function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local multiplier = 1.5
    local stock =
    {
        9249,  1500000 * multiplier, -- Chunk of Ruthenium Ore
        9247,  1500000 * multiplier, -- Chunk of Niobium Ore
        8721,  1500000 * multiplier, -- Chunk of Hepatizon Ore
        9251,  1500000 * multiplier, -- Spool of Khoma Thread
        1313,  2500000 * multiplier, -- Locks of Siren's hair
        8727,  2500000 * multiplier, -- Sif's Lock
        3449,  2500000 * multiplier, -- Celaeno's Cloth
        3544,  2500000 * multiplier, -- Penelope's Cloth
        3549,   500000 * multiplier, -- Vial of Belladonna sap
        3926,  4000000 * multiplier, -- Urunday Log
        9245,  4000000 * multiplier, -- Cypress Log
        3547,  5000000 * multiplier, -- Sealord Skin
        4080,  5000000 * multiplier, -- Moonbow Urushi
        4081,  5000000 * multiplier, -- Moonbow Stone
        4077,  5000000 * multiplier, -- Piece of Moonbow Steel
        4079,  5000000 * multiplier, -- Square of Moonbow Leather
        4078,  5000000 * multiplier, -- Bolt of Moonbow Cloth
        9252,  5000000 * multiplier, -- Square of Khoma Cloth
        8720,  5000000 * multiplier, -- Maliyakaleya Orb
        9250,  7500000 * multiplier, -- Ruthenium Ingot
        9248,  7500000 * multiplier, -- Niobium Ingot
        8722,  7500000 * multiplier, -- Hepatizon Ingot
        3927,  7500000 * multiplier, -- Piece of Urunday Lumber
        9246,  7500000 * multiplier, -- Piece of Cypress Lumber
        2359,  7500000 * multiplier, -- Star Sapphire
        1409,  7500000 * multiplier, -- Spool of Siren's Macrame
        8728,  7500000 * multiplier, -- Spool of Sif's Macrame
        4014,  7500000 * multiplier, -- Yggdreant Bole
         766, 10000000 * multiplier, -- Ormolu Ingot
        8719, 10000000 * multiplier, -- Piece of Maliyakaleya Coral
        9062, 10000000 * multiplier, -- Dark Matter
        9003, 15000000 * multiplier, -- Chunk of Plovid Flesh
        3548, 15000000 * multiplier, -- Square of Sealord Leather
        9004, 15000000 * multiplier, -- Macuil Plating
        9006, 15000000 * multiplier, -- Defiant Scarf
        9061, 15000000 * multiplier, -- Hades' Claw
        9063, 15000000 * multiplier, -- Tartarian Soul
    }

    tpz.shop.general(player, stock)
    player:PrintToPlayer(string.format("Toh Zonikki: These materials fetch a divine price."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

-- local clammingItems = {
    -- 1311,  -- Oxblood
    -- 885,   -- Turtle Shell
    -- 1193,  -- HQ Crab Shell
    -- 1446,  -- Lacquer Tree Log
    -- 4318,  -- Bibiki Urchin
    -- 1586,  -- Titanictus Shell
    -- 5124,  -- Tropical Clam
    -- 690,   -- Elm Log
    -- 887,   -- Coral Fragment
    -- 703,   -- Petrified Log
    -- 691,   -- Maple Log
    -- 4468,  -- Pamamas
    -- 3270,  -- HQ Pugil Scales
    -- 888,   -- Seashell
    -- 4328,  -- Hobgoblin Bread
    -- 485,   -- Broken Willow Rod
    -- 510,   -- Goblin Armor
    -- 5187,  -- Elshimo Coconut
    -- 507,   -- Goblin Mail
    -- 881,   -- Crab Shell
    -- 4325,  -- Hobgoblin Pie
    -- 936,   -- Rock Salt
    -- 4361,  -- Nebimonite
    -- 864,   -- Fish Scales
    -- 4484,  -- Shall Shell
    -- 624,   -- Pamtam Kelp
    -- 1654,  -- Igneous Rock
    -- 17296, -- Pebble
    -- 5123,  -- Jacknife
    -- 5122   -- Bibiki Slug
-- }

-----------------------------------
-- Local Functions
-----------------------------------

-- local function giveClammedItems(player)

    -- for item = 1, #clammingItems do
        -- local clammedItemQty = player:getCharVar("ClammedItem_" ..  clammingItems[item])

        -- if (clammedItemQty > 0) then
            -- if (player:addItem(clammingItems[item], clammedItemQty)) then

                -- player:messageSpecial(ID.text.YOU_OBTAIN, clammingItems[item], clammedItemQty)
                -- player:setCharVar("ClammedItem_" ..  clammingItems[item], 0)
            -- else
                -- player:messageSpecial(ID.text.WHOA_HOLD_ON_NOW)
                -- break
            -- end
        -- end
    -- end
-- end

-- local function owePlayerClammedItems(player)

    -- for item = 1, #clammingItems do
        -- if (player:getCharVar("ClammedItem_" ..  clammingItems[item]) > 0) then
            -- return true
        -- end
    -- end

    -- return false
-- end

-- function onTrade(player, npc, trade)
-- end

-- function onTrigger(player, npc)

    -- if ( player:hasKeyItem(tpz.ki.CLAMMING_KIT)) then -- Player has clamming kit

        -- if (player:getCharVar("ClammingKitBroken") == 1) then -- Broken bucket
            -- player:startEvent(30, 0, 0, 0, 0, 0, 0, 0, 0)
        -- else --Bucket not broken
            -- player:startEvent(29, 0, 0, 0, 0, 0, 0, 0, 0)
        -- end
    -- else -- Player does not have clamming kit
        -- if (owePlayerClammedItems(player)) then
            -- player:messageSpecial(ID.text.YOU_GIT_YER_BAG_READY)
            -- giveClammedItems(player)
        -- else
            -- player:startEvent(28, 500, 0, 0, 0, 0, 0, 0, 0)
        -- end
    -- end
-- end

-- function onEventUpdate(player, csid, option)

    -- -- if (csid == 28) then
        -- -- local enoughMoney = 2 -- Not enough money
        -- -- if (player:getGil() >= 500) then
            -- -- enoughMoney = 1 --Player has enough Money
        -- -- end

        -- -- player:updateEvent(tpz.ki.CLAMMING_KIT, enoughMoney, 0, 0, 0, 500, 0, 0)
    -- -- elseif  (csid == 29) then
        -- -- local clammingKitSize = player:getCharVar("ClammingKitSize")

        -- -- player:updateEvent( player:getCharVar("ClammingKitWeight"), clammingKitSize, clammingKitSize, clammingKitSize + 50, 0, 0, 0, 0)
    -- -- end
-- end

-- function onEventFinish(player, csid, option)

    -- -- if (csid == 28) then
        -- -- if (option == 1) then -- Give 50pz clamming kit
            -- -- player:setCharVar("ClammingKitSize", 50)
            -- -- player:addKeyItem(tpz.ki.CLAMMING_KIT)
            -- -- player:delGil(500)
            -- -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CLAMMING_KIT)
        -- -- end
    -- -- elseif (csid == 29) then
        -- -- if (option == 2) then -- Give player clammed items

            -- -- player:setCharVar("ClammingKitSize", 0)
            -- -- player:setCharVar("ClammingKitWeight", 0)
            -- -- player:delKeyItem(tpz.ki.CLAMMING_KIT)
            -- -- player:messageSpecial(ID.text.YOU_RETURN_THE, tpz.ki.CLAMMING_KIT)

            -- -- giveClammedItems(player)

        -- -- elseif (option == 3) then -- Get bigger kit
            -- -- local clammingKitSize = player:getCharVar("ClammingKitSize") + 50

            -- -- player:setCharVar("ClammingKitSize", clammingKitSize)
            -- -- player:messageSpecial(ID.text.YOUR_CLAMMING_CAPACITY, 0, 0, clammingKitSize)
        -- -- end
    -- -- elseif ( csid == 30) then -- Broken bucket
        -- -- player:setCharVar("ClammingKitSize", 0)
        -- -- player:setCharVar("ClammingKitBroken", 0)
        -- -- player:setCharVar("ClammingKitWeight", 0)
        -- -- player:delKeyItem(tpz.ki.CLAMMING_KIT)
        -- -- player:messageSpecial(ID.text.YOU_RETURN_THE, tpz.ki.CLAMMING_KIT)
    -- -- end
-- end
