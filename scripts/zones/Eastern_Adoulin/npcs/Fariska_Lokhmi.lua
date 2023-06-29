-----------------------------------
-- Area: Eastern Adoulin (257)
-- NPC: Fariska Lokhmi
-----------------------------------

function onTrade(player, npc, trade)
    local keyId = tpz.keyItem.AFTERPARTY_PASS
    local ullegoreStatue = 3728
    local mumorStatue = 3727


    if (player:hasKeyItem(3153) == false) and trade:getGil() == 500000 then
        local ID = zones[player:getZoneID()]
        player:addKeyItem(keyId)
        player:messageSpecial( ID.text.KEYITEM_OBTAINED, keyId )
        player:delGil(500000)
        player:PrintToPlayer("Fariska Lokmhi: Thanks, hehehe....", tpz.msg.channel.NS_SAY)

        -- player:timer(2000, function(playerArg)
            -- playerArg:PrintToPlayer("Fariska Lokmhi: Hold on to your butt, im teleporting you there!", tpz.msg.channel.NS_SAY)
        -- end)

        player:timer(4000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: OH also, level 117 is a lie, he's MUCH stronger!", tpz.msg.channel.NS_SAY)
        end)


        -- player:timer(10000, function(playerArg)
            -- playerArg:setPos(-241.0460, -24.2500, 19.9910, 0, 206)
        -- end)
    end

    -- if npcUtil.tradeHasExactly(trade, 3727) then
        -- player:addSpell(946, true, true)
        -- player:PrintToPlayer("You earned Mumor as a trust.", tpz.msg.channel.SYSTEM_3)
    -- end

    if npcUtil.tradeHasExactly(trade, 3728) then
        player:addSpell(987, true, true)
        player:delItem(3728)
        player:PrintToPlayer("You earned Ullegore as a trust.", tpz.msg.channel.SYSTEM_3)
    end
end

function onTrigger(player, npc)
    local GM = player:getGMLevel()
    local ID = zones[player:getZoneID()]

    -- if GM >= 1 and (player:hasKeyItem(keyid) == false) then
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, keyid)
        -- player:addKeyItem(tpz.ki.AFTERPARTY_PASS)
    if not player:hasKeyItem(3153) then

        player:PrintToPlayer("Fariska Lokmhi: I've lost my statues!", tpz.msg.channel.NS_SAY)

        player:timer(2000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: Lost them in a fight club I'm afraid", tpz.msg.channel.NS_SAY)
        end)

        player:timer(4000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: I've got another fight coming up at Qu'bia arena.", tpz.msg.channel.NS_SAY)
        end)

        player:timer(6000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: It's against the Demon King Ullegore.", tpz.msg.channel.NS_SAY)
        end)

        player:timer(8000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: Say... do you think you could beat him?", tpz.msg.channel.NS_SAY)
        end)

        player:timer(10000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: Trade me 500k and I'll give you my entry.", tpz.msg.channel.NS_SAY)
        end)

        player:timer(12000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: Bring me my statues for a prize!", tpz.msg.channel.NS_SAY)
        end)

        player:timer(14000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: TRUST me... it'll be worth it!", tpz.msg.channel.NS_SAY)
        end)

    elseif player:hasKeyItem(3153) then
        player:timer(2000, function(playerArg)
            playerArg:PrintToPlayer("Fariska Lokmhi: Hold on to your butt, I'm teleporting you there!", tpz.msg.channel.NS_SAY)
        end)

        player:timer(4000, function(playerArg)
            playerArg:setPos(-241.0460, -24.2500, 19.9910, 0, 206)
        end)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end


