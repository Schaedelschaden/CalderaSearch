-----------------------------------
-- Area: Ghelsba Outpost
-- NPC: Hut Door
-- Involved in Quest: The Holy Crest
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)

	killer:setVar("BCNM_Killed",1);
	record = GetServerVariable("[BF]The_Holy_Crest_record");
	partyMembers = 6;
	pZone = killer:getZone();

	if(killer:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_ACCEPTED) then
		skip = 0;
	else
		skip = 1;
	end
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Save_The_Children_record",newtimer);
	end
	
	killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,1,skip);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	pZone = player:getZone();
	player:delStatusEffect(EFFECT_BATTLEFIELD);
	
	if(csid == 0x7d01 and option ~= 0) then -->= 2147483648 and option <= 2147483679) then
		player:setTitle(HEIR_TO_THE_HOLY_CREST);
		player:delKeyItem(DRAGON_CURSE_REMEDY);
		player:unlockJob(14);
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_DRAGOON);
		player:setVar("TheHolyCrest_Event",0);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,THE_HOLY_CREST);
	end
	
end;