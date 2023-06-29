-----------------------------------
-- Area: Bibiki Bay
--  NPC: Pohka Chichiyowahl
-- Type: Standard Merchant NPC
-- !pos -415 -2 -430 4
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        8930, 30000,    -- Snowslit
        8939, 30000,    -- Snowtip
        8948, 30000,    -- Snowdim
        8957, 30000,    -- Snoworb
        8933, 30000,    -- Leafslit
        8942, 30000,    -- Leaftip
        8951, 30000,    -- Leafdim
        8960, 30000,    -- Leaforb
        8936, 30000,    -- Duskslit
        8945, 30000,    -- Dusktip
        8954, 30000,    -- Duskdim
        8963, 30000,    -- Duskorb
        3951, 20000,    -- Wailing Stone
    }
    tpz.shop.general(player, stock)
    player:PrintToPlayer(string.format("Pohka Chichiyowahl: Hey kid, wanna buy a watch?"),tpz.msg.channel.NS_SAY)
    
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
