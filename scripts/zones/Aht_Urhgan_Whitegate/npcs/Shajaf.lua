-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Shajaf
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    local tradeGil = trade:getGil()

    if trade:getGil() == 5000000 then -- 5 Million gil
        if player:hasKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER) then
            player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
        elseif not player:hasKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER) then
            player:PrintToPlayer(string.format("Shajaf : Take these orders and hop to!"),tpz.msg.channel.NS_SAY)
            player:addKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SECRET_IMPERIAL_ORDER)
            player:tradeComplete()
        end
    elseif trade:getGil() == 3000000 then -- 3 Million gil
        if player:hasKeyItem(tpz.ki.CONFIDENTAL_IMPERIAL_ORDER) then
            player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
        elseif not player:hasKeyItem(tpz.ki.CONFIDENTAL_IMPERIAL_ORDER) then
            player:PrintToPlayer(string.format("Shajaf : Take these orders and hop to!"),tpz.msg.channel.NS_SAY)
            player:addKeyItem(tpz.ki.CONFIDENTIAL_IMPERIAL_ORDER)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CONFIDENTAL_IMPERIAL_ORDER)
            player:tradeComplete()
        end
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Shajaf : GET YOUR ORDERS HERE! 3 million for confidential, 5 for secret!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
