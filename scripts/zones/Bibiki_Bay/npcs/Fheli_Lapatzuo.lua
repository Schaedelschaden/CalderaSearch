-----------------------------------
-- Area: Bibiki Bay
--  NPC: Fheli Lapatzuo
-- Type: Manaclipper Timekeeper
-- !pos 488.793 -4.003 709.473 4
-----------------------------------
require("scripts/globals/manaclipper")
-----------------------------------

-- local timekeeperLocation = tpz.manaclipper.location.SUNSET_DOCKS
-- local timekeeperEventId = 18

function onTrade(player, npc, trade)
    if trade:getGil() == 50000 then
        -- player:injectActionPacket(4, 122) -- teleport animation
        
        player:timer(5000, function(player)
            player:setPos(-394, -3, -388)
        end)
        
        player:PrintToPlayer(string.format("Fheli Lapatzuo: Welcome, to the Caldera Black Market."),tpz.msg.channel.NS_SAY)
    else
        player:PrintToPlayer(string.format("Fheli Lapatzuo: Who do you think you are? Noone rides for free."),tpz.msg.channel.NS_SAY)
    end
end

function onTrigger(player, npc)
    -- tpz.manaclipper.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
    player:PrintToPlayer(string.format("Fheli Lapatzuo: Give me 50,000 gil and I'll get you to the other side."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
