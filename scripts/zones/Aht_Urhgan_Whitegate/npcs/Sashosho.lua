-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Sashosho
-- Standard Info NPC
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- player:startEvent(250)
    player:PrintToPlayer(string.format("Sashosho: The pit is currently closed under maintenance for future content."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
