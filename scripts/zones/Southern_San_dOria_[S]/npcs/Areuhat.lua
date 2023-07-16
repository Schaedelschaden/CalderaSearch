-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Areuhat
-- !pos 21 0 22 80
-----------------------------------

function onTrade(player, npc, trade)
    if (trade:hasItemQty(18272, 1) == true and trade:getItemCount() == 1) then --Relic Sword
        player:tradeComplete()
        player:addSpell(939, true, true) -- Areuhat
        player:PrintToPlayer(string.format("Areuhat: Ahh what a nice Sword! Lets go kill something!"),tpz.msg.channel.NS_SAY)
        player:PrintToPlayer(string.format("You may now use Areuhat as a Trust."),tpz.msg.channel.SYSTEM_3)
    end
end

function onTrigger(player, npc)
    -- player:showText(npc, 13454) -- (Couldn't find default dialogue)  How very good to see you again!
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
