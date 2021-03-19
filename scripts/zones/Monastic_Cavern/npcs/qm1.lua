-----------------------------------
-- Area: Monastic Cavern
--  NPC: ???
-- Used In Quest: Whence Blows the Wind
-- !pos 168 -1 -22 150
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
	local mobID = 17391803 -- Overlord Bakgodek
	local targ = GetMobByID(mobID)

	if (trade:hasItemQty(554, 1) and trade:hasItemQty(1432, 1)) then
		SpawnMob(mobID):updateClaim(player)
		targ:setPos(220.3789, -3.0019, -93.0242, 64, 150)
		
		player:tradeComplete()
	end
end

function onTrigger(player, npc)
    -- if player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and not player:hasKeyItem(tpz.ki.ORCISH_CREST) then
        -- player:addKeyItem(tpz.ki.ORCISH_CREST)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.ORCISH_CREST)
    -- else
        -- player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    -- end
	
	player:PrintToPlayer(string.format("You have the strong suspicion that you need a Gold Orcmask and a Paladin's testimony..."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end