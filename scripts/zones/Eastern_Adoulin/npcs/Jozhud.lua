-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Jozhud
-- Trades Paragon cards for whatever job you are
-- !pos -63.895 -0.15 -41.012 257
-----------------------------------
local ID = require("scripts/zones/Eastern_Adoulin/IDs")
-----------------------------------

function onTrade(player,npc,trade)
    local paragonCard = -- 1 of ANY Paragon Card
    {
        9281, 9282, 9283, 9284, 9285, 9286, 9287, 9288, 9289, 9290, 9291, 9292, 9293, 9294, 9295, 9296, 9297, 9298, 9299, 9300, 9301, 9302
    }
    local augCurrency =
    {
        {1875, 10} -- 10 Ancient Beastcoins
    }
    local job   = player:getMainJob() -- Will only give you the card for the job you're on
    local pCard = 0
    local aCoin = 0

    for i = 1, #paragonCard do
        if npcUtil.tradeHas(trade, {paragonCard[i]}) then
            pCard = paragonCard[i]

            break
        end
    end

    if pCard == 0 then
        player:PrintToPlayer(string.format("Jozhud : I'm not giving you a card without getting one first!"),tpz.msg.channel.NS_SAY)

        return
    end

    if npcUtil.tradeHas(trade, {augCurrency[i]}) then
        aCoin = augCurrency[i]
    end

    if aCoin == 0 then
        player:PrintToPlayer(string.format("Jozhud : Some Ancient Beastcoins could sweeten this deal...how about 10?"),tpz.msg.channel.NS_SAY)

        return
    end

    if trade:getGil() ~= 250000 then
        player:PrintToPlayer(string.format("Jozhud : Pay to play, my friend. Let's call it a quarter mil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Jozhud : Not my gen 1 foil Charizard!"),tpz.msg.channel.NS_SAY)

    local newCard = 0

    if job == tpz.job.WAR then
        newCard = 9281
    elseif job == tpz.job.MNK then
        newCard = 9282
    elseif job == tpz.job.WHM then
        newCard = 9283
    elseif job == tpz.job.BLM then
        newCard = 9284
    elseif job == tpz.job.RDM then
        newCard = 9285
    elseif job == tpz.job.THF then
        newCard = 9286
    elseif job == tpz.job.PLD then
        newCard = 9287
    elseif job == tpz.job.DRK then
        newCard = 9288
    elseif job == tpz.job.BST then
        newCard = 9289
    elseif job == tpz.job.BRD then
        newCard = 9290
    elseif job == tpz.job.RNG then
        newCard = 9291
    elseif job == tpz.job.SAM then
        newCard = 9292
    elseif job == tpz.job.NIN then
        newCard = 9293
    elseif job == tpz.job.DRG then
        newCard = 9294
    elseif job == tpz.job.SMN then
        newCard = 9295
    elseif job == tpz.job.BLU then
        newCard = 9296
    elseif job == tpz.job.COR then
        newCard = 9297
    elseif job == tpz.job.PUP then
        newCard = 9298
    elseif job == tpz.job.DNC then
        newCard = 9299
    elseif job == tpz.job.SCH then
        newCard = 9300
    elseif job == tpz.job.GEO then
        newCard = 9301
    elseif job == tpz.job.RUN then
        newCard = 9302
    end

    player:addItem(newCard)
    player:messageSpecial(ID.text.ITEM_OBTAINED, newCard)
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Jozhud : You collect cards from limbus too? For 250,000 gil and 10 Ancient beastcoins. I'll trade you cards!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
end
