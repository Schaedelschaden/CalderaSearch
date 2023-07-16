-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: qm1 (???)
-- Involved in Quest: The Holy Crest
-- !pos 641 -15 7 119
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 1159) and player:getCharVar("TheHolyCrest_Event") == 4 then
        player:startEvent(56)
    end
end

function onTrigger(player, npc)
    -- player:messageSpecial(ID.text.NOTHING_FOUND)
    player:addSpell(957, true, true) -- Margret        
    player:PrintToPlayer(string.format("Drogagora: DON'T TOUCH MY BUTT!"),tpz.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("You may now use Flaviria as a Trust."),tpz.msg.channel.SYSTEM_3)
    player:injectActionPacket(6, 93) -- Mijin Gakure
	player:injectActionPacket(4, 219) -- Comet
    player:injectActionPacket(4, 241) -- Meteor
    player:injectActionPacket(4, 280) -- Meteor II
    player:setHP(0)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 56 then
        player:setCharVar("TheHolyCrest_Event", 5)
        player:confirmTrade()
        player:startEvent(33)
    end
end
