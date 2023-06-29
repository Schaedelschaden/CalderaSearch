-----------------------------------
-- Area: Batallia Downs [S]
--  NPC: Lycopodium
-- !pos -366.425 -22.127 324.666 84
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Lycopodium : Please help me, my brother Chaneque has gone crazy!"),tpz.msg.channel.NS_SAY)
    player:addStatusEffectEx(tpz.effect.BIND, 0, 1, 0, 15)
    player:timer(3000, function(playerArg1)
        playerArg1:PrintToPlayer(string.format("Lycopodium : He's forcing Non-Mandragora travelers to shed their gear and is beating them to death!"),tpz.msg.channel.NS_SAY)
        playerArg1:timer(3000, function(playerArg2)
            playerArg1:PrintToPlayer(string.format("Lycopodium : If he senses you are wearing gear he will banish you to another dimension! "),tpz.msg.channel.NS_SAY)
            playerArg2:timer(3000, function(playerArg3)
                playerArg3:PrintToPlayer(string.format("Lycopodium : I heard of a Hume in Kahzam with a costume for sale that may help..."),tpz.msg.channel.NS_SAY)
                playerArg3:timer(3000, function(playerArg4)
                    playerArg4:PrintToPlayer(string.format("Lycopodium : Fool him into thinking you are one of us and its just a sparring match! "),tpz.msg.channel.NS_SAY)
                    playerArg4:timer(3000, function(playerArg5)
                        playerArg5:PrintToPlayer(string.format("Lycopodium : He's southeast of here around I-9 if you think you can take him without it. "),tpz.msg.channel.NS_SAY)
                    end)
                end)
            end)
        end)
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    
end
