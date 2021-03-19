-----------------------------------
-- Area: Castle Oztroja
--  NPC: qm2 (???)
-- Used In Quest: Whence Blows the Wind
-- !pos -100 -63 58 151
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
local ID = require("scripts/zones/Castle_Oztroja/IDs")
-----------------------------------

function onTrade(player, npc, trade)
	local mobID = 17396137 -- Tzee Xicu the Manifest
	local targ = GetMobByID(mobID)

	if (trade:hasItemQty(1142, 1) and trade:hasItemQty(1440, 1)) then -- Judgment Key and Summoner's Testimony
		SpawnMob(mobID):updateClaim(player)
		targ:setPos(-99.9882, -62.8981, 70.8053, 63, 151)
		
		player:tradeComplete()
	end
end

function onTrigger(player, npc)
    -- if (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(tpz.ki.YAGUDO_CREST) == false) then
        -- player:addKeyItem(tpz.ki.YAGUDO_CREST)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.YAGUDO_CREST)
    -- else
        -- player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    -- end

	player:PrintToPlayer(string.format("You have the strong suspicion that you need a Judgment Key and a Summoner's testimony..."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
