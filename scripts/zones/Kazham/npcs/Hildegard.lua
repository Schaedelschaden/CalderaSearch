-----------------------------------
-- Area: Kazham
--  NPC: Hildegard
-- Mandragora Suit for Spring event
-----------------------------------

function onTrade(player, npc, trade)
    if trade:getGil() == 100000 then
        player:addItem(26705)
        player:addItem(27854)
        player:PrintToPlayer(string.format("Hildegard : There you go, hope your next Mandragora brawl is a good one!"),tpz.msg.channel.NS_SAY)
        player:addStatusEffectEx(tpz.effect.BIND, 0, 1, 0, 3)
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Hildegard : I once fought a feisty Mandragora in the past who liked to fight naked."),tpz.msg.channel.NS_SAY)
    player:addStatusEffectEx(tpz.effect.BIND, 0, 1, 0, 6)
    player:timer(3000, function(playerArg1)
        playerArg1:PrintToPlayer(string.format("Hildegard : Of course he stole my TP until I got this costume..."),tpz.msg.channel.NS_SAY)
        playerArg1:timer(3000, function(playerArg2)
            playerArg1:PrintToPlayer(string.format("Hildegard : Trade me 100k and its all yours... I have no use fer it, He's dead now."),tpz.msg.channel.NS_SAY)
        end)
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
