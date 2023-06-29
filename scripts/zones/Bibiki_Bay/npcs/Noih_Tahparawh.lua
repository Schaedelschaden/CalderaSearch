-----------------------------------
-- Area: Bibiki Bay
--  NPC: Noih Tahparawh
-- Type: Manaclipper Timekeeper
-- !pos -392 -3 -385 4
-----------------------------------
require("scripts/globals/manaclipper")
-----------------------------------

-- local timekeeperLocation = tpz.manaclipper.location.PURGONORGO_ISLE
-- local timekeeperEventId = 19

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- tpz.manaclipper.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
    player:PrintToPlayer(string.format("Noih Tahparawh: So you wish to go back?"),tpz.msg.channel.NS_SAY)
    -- player:injectActionPacket(4, 122) -- teleport animation
    player:timer(5000, function(player)
        player:setPos(489, -3, 710)
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
