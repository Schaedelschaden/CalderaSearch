-----------------------------------
-- BlackJack
-----------------------------------

function onSpawn(npc)
    npc:renameEntity("BlackJack")
end

function onTrade(player, npc, trade)
    if npc:getID() == 17068523 then
        if trade:getGil() >= 10000 then
            player:setLocalVar("Bet", trade:getGil())
            player:PrintToPlayer(string.format("Your current bet is %s", player:getLocalVar("Bet")),tpz.msg.channel.SYSTEM_3)
        else
            player:PrintToPlayer(string.format("Minimum Bets are 10k."),tpz.msg.channel.SYSTEM_3)
        end
        
        if player:getCharVar("BlackJackWins") >= 10 then
            player:addSpell(989, true, true) -- King of hearts        
            player:PrintToPlayer(string.format("Since you have won 10 games, you have been given King of Hearts as a Trust!"),tpz.msg.channel.SYSTEM_3)
        end
    end
end

function onTrigger(player, npc)
    npc:renameEntity("BlackJack")
    if npc:getID() == 17068523 then
    
        if player:getCharVar("BlackJackWins") >= 10 and player:hasSpell(989) == false then
            player:addSpell(989, true, true) -- King of hearts        
            player:PrintToPlayer(string.format("Since you have won 10 games, you have been given King of Hearts as a Trust!"),tpz.msg.channel.SYSTEM_3)
        end
        
        local hit   = math.random(1, 10)
        local house = math.random(5, 22) 
        if player:getLocalVar("Bet") == 0 then
            player:PrintToPlayer(string.format("Trade me 10k or more for your Bet and we will start BlackJack!"),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("You are currently at %s Wins", player:getCharVar("BlackJackWins")),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Current Prize is King of Hearts! Speak to me after your 10th win to obtain."),tpz.msg.channel.SYSTEM_3)        
        end
        
        if player:getLocalVar("Bet") > 0 then
            player:PrintToPlayer(string.format("%s is on the table", player:getLocalVar("Bet")),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("House Drew %s", house),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("You Drew %s", hit),tpz.msg.channel.SYSTEM_3)
            if hit > house or house > 21 then
                player:PrintToPlayer(string.format("You won your bet back plus house for %s gil!", player:getLocalVar("Bet") * 2),tpz.msg.channel.SYSTEM_3)
                player:addGil(player:getLocalVar("Bet") * 2)
                player:setLocalVar("Bet", 0)
                player:setCharVar("BlackJackWins", player:getCharVar("BlackJackWins") + 1)
            else
                if house > hit then 
                    hit = hit + math.random(1, 11)
                    player:PrintToPlayer(string.format("You hit for %s total", hit),tpz.msg.channel.SYSTEM_3)
                end
                
                if hit > house and hit < 22 or house > 21 then
                    player:PrintToPlayer(string.format("You won your bet back plus house for %s gil!", player:getLocalVar("Bet") * 2),tpz.msg.channel.SYSTEM_3)
                    player:addGil(player:getLocalVar("Bet") * 2)
                    player:setLocalVar("Bet", 0)
                    player:setCharVar("BlackJackWins", player:getCharVar("BlackJackWins") + 1)
                elseif hit == 21 and house ~= 21 then
                    player:PrintToPlayer(string.format("BLACKJACK! you win triple for %s gil!", player:getLocalVar("Bet") * 3),tpz.msg.channel.SYSTEM_3)
                    player:addGil(player:getLocalVar("Bet") * 3)
                    player:setLocalVar("Bet", 0)
                    player:setCharVar("BlackJackWins", player:getCharVar("BlackJackWins") + 1)               
                else 
                    player:PrintToPlayer(string.format("You lost your bet of %s!", player:getLocalVar("Bet")),tpz.msg.channel.SYSTEM_3)
                    player:delGil(player:getLocalVar("Bet"))
                    player:setLocalVar("Bet", 0)
                    player:injectActionPacket(6, 93) -- Mijin Gakure
	             	player:injectActionPacket(4, 219) -- Comet
		            player:injectActionPacket(4, 241) -- Meteor
		            player:injectActionPacket(4, 280) -- Meteor II
                    player:setHP(0)
                end
            end
        end
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
