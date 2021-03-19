-----------------------------------
-- Area: Qulun Dome
--  NPC: qm1 (???)
--  ID: 17383482
-- Used In Quest: Whence Blows the Wind
-- !pos 261 39 79 148
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
local ID = require("scripts/zones/Qulun_Dome/IDs")
-----------------------------------

function onTrade(player, npc, trade)
	local mobID = 17383443 -- Za'Dha Adamantking
	local targ = GetMobByID(mobID)

	if (trade:hasItemQty(501, 1) and trade:hasItemQty(1428, 1)) then -- Quadav Helm & White Mage's Testimony
		SpawnMob(mobID):updateClaim(player)
--		targ:setPos(220.3789, -3.0019, -93.0242, 64, 150)
		
		player:tradeComplete()
	end
end

function onTrigger(player, npc)
    -- if (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(tpz.ki.QUADAV_CREST) == false) then
        -- player:addKeyItem(tpz.ki.QUADAV_CREST)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.QUADAV_CREST)
    -- else
        -- player:messageSpecial(ID.text.YOU_FIND_NOTHING)
    -- end

	player:PrintToPlayer(string.format("You have the strong suspicion that you need a Quadav Helm and a White Mage's testimony..."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end