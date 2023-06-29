-----------------------------------
-- BlackJack
-----------------------------------



function onTrade(player, npc, trade)
    if npc:getID() == 17068523 then
        if trade:getGil() > 0 then
            player:setLocalVar("Bet", trade:getGil())
            player:PrintToPlayer(string.format("Your current bet is %s", player:getLocalVar("Bet")),tpz.msg.channel.SYSTEM_3)
        end
    end
end

function onTrigger(player, npc)
    npc:renameEntity("BlackJack")
    if npc:getID() == 17068523 then
        local hit   = math.random(1, 10)
        local house = math.random(10, 22) 
        if player:getLocalVar("Bet") == 0 then
            player:PrintToPlayer(string.format("Trade me some Gil for your Bet and we will start BlackJack"),tpz.msg.channel.SYSTEM_3)
        end
        
        if player:getLocalVar("Bet") >= 0 then
            player:PrintToPlayer(string.format("%s is on the table", player:getLocalVar("Bet")),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("House Drew %s", house),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("You Drew %s", hit),tpz.msg.channel.SYSTEM_3)
            npc:timer(5000, function(npcArg)
                if house > hit then 
                    hit = hit + hit
                    player:PrintToPlayer(string.format("You hit for %s total", hit),tpz.msg.channel.SYSTEM_3)
                end
                
                if hit > house and hit < 22 or house > 21 then
                    player:PrintToPlayer(string.format("You won double!"),tpz.msg.channel.SYSTEM_3)
                    player:addGil(player:getLocalVar("Bet") * 2)
                    player:setLocalVar("Bet", 0)
                else 
                    player:PrintToPlayer(string.format("You lost your bet!"),tpz.msg.channel.SYSTEM_3)
                    player:delGil(player:getLocalVar("Bet"))
                    player:setLocalVar("Bet", 0)
                end
            end
        end
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
