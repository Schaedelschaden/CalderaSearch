-----------------------------------
-- Area: Upper Jeuno
--  NPC: Monberaux
-- Starts and Finishes Quest: The Lost Cardian (finish), The kind cardian (start)
-- Involved in Quests: Save the Clock Tower
-- !pos -43 0 -1 244
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/shop")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if (trade:hasItemQty(4157, 1) == true and trade:getItemCount() == 1) then
        player:tradeComplete()
        player:setCharVar("MonberauxLvl", 4)
        player:PrintToPlayer(string.format("Monberaux: I have reverted your service to violence free support. You will have to kill Keremet again to get it back."),tpz.msg.channel.NS_SAY)
    end        
        -- local a = player:getCharVar("saveTheClockTowerNPCz1") -- NPC Part1
        -- if (a == 0 or (a ~= 4 and a ~= 5 and a ~= 6 and a ~= 12 and a ~= 20 and a ~= 7 and a ~= 28 and a ~= 13 and a ~= 22 and
           -- a ~= 14 and a ~= 21 and a ~= 15 and a ~= 23 and a ~= 29 and a ~= 30 and a ~= 31)) then
            -- player:startEvent(91, 10 - player:getCharVar("saveTheClockTowerVar")) -- "Save the Clock Tower" Quest
        -- end
    -- end
    
    if trade:getGil() == 1000000 then
        player:addSpell(999, true, true) -- Monberaux 
        player:setCharVar("MonberauxLvl", 1)
        player:PrintToPlayer(string.format("Monberaux: Thank you for that generous donation!"),tpz.msg.channel.NS_SAY)
        player:timer(5000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: If you ever need aid in the field, I will be there to assist..."),tpz.msg.channel.NS_SAY)
        end)
        player:timer(10000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: The level of services are dependent upon your donations."),tpz.msg.channel.NS_SAY)
        end)
        player:timer(15000, function(playerArg)       
            playerArg:PrintToPlayer(string.format("Monberaux: Until then, be well!"),tpz.msg.channel.NS_SAY)
        end)
        player:timer(20000, function(playerArg)
            playerArg:PrintToPlayer(string.format("You may now summon Monberaux as a trust."),tpz.msg.channel.SYSTEM_3)
        end)
    end
end

function onTrigger(player, npc)

    local lvl = player:getCharVar("MonberauxLvl")
    
    if lvl == 0 then
        player:PrintToPlayer(string.format("Monberaux: If you're looking for free healthcare, this isn't the place... Contracts are 1 million gil."),tpz.msg.channel.NS_SAY)
    elseif lvl == 1 then
        player:PrintToPlayer(string.format("Monberaux: I have more potions I'd like to try but first were gonna need some slime... hmmm."),tpz.msg.channel.NS_SAY)
        player:timer(3000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: This particular slime only exists in the sewer... Sewer Syrup I believe it was called?"),tpz.msg.channel.NS_SAY)
        end)
        player:timer(6000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: I think if you can find a way to kill it, the residue will be enough. Go kill it and report back."),tpz.msg.channel.NS_SAY)
        end)
        SpawnMob(17461307)
    elseif lvl == 2 then
        player:PrintToPlayer(string.format("Monberaux: Everyone is always complaining about Silence... I need a remedy..."),tpz.msg.channel.NS_SAY)
        player:timer(3000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: You know what? can you get me some special bat blood?"),tpz.msg.channel.NS_SAY)
        end)
        player:timer(6000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: Tres Duendes should have the blood, the residue will be enough. Go kill it and report back."),tpz.msg.channel.NS_SAY)
        end)
        SpawnMob(16887908)
    elseif lvl == 3 then
        player:PrintToPlayer(string.format("Monberaux: I have some recipes for some really good enhancing potions but I need more ingredients."),tpz.msg.channel.NS_SAY)
        player:timer(3000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: I'll need some essence from a crab shell."),tpz.msg.channel.NS_SAY)
        end)
        player:timer(6000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: Aquarius is a crab with what I need, the residue will be enough. Go kill it and report back."),tpz.msg.channel.NS_SAY)
        end)
    elseif lvl == 4 then
        player:PrintToPlayer(string.format("Monberaux: Against my better judgement I have developed a potion to assist with damage in battle."),tpz.msg.channel.NS_SAY)
        player:timer(3000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: I'll need some poisoned bone from a Corse."),tpz.msg.channel.NS_SAY)
        end)
        player:timer(6000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Monberaux: Keremet is a corse with what I need, the residue will be enough. Go kill it and report back."),tpz.msg.channel.NS_SAY)
        end)
    else
        player:PrintToPlayer(string.format("Monberaux: No new potions. Be well."),tpz.msg.channel.NS_SAY)
    end


    -- local TheLostCardien = player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.THE_LOST_CARDIAN)
    -- local CooksPride = player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.COOK_S_PRIDE)
    -- -- COP mission 1-1
    -- if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_RITES_OF_LIFE and  player:getCharVar("PromathiaStatus") == 1) then
        -- player:startEvent(10)--10
    -- -- COP mission 1-2
    -- elseif (player:getCurrentMission(COP) == tpz.mission.id.cop.BELOW_THE_ARKS  and  player:getCharVar("PromathiaStatus") == 0) then
        -- player:startEvent(9)--9
     -- -- COP mission 3-5
    -- elseif (player:getCurrentMission(COP) == tpz.mission.id.cop.DARKNESS_NAMED  and  player:getCharVar("PromathiaStatus") == 0) then
        -- player:startEvent(82)-- 82
    -- elseif (player:getCurrentMission(COP) == tpz.mission.id.cop.DARKNESS_NAMED  and  player:getCharVar("PromathiaStatus") == 3) then
        -- player:startEvent(75) --75
    -- elseif (player:getCurrentMission(COP) == tpz.mission.id.cop.THREE_PATHS  and  player:getCharVar("COP_Tenzen_s_Path") == 2) then
        -- player:startEvent(74) --74
    -- elseif (player:getCurrentMission(COP) == tpz.mission.id.cop.THREE_PATHS  and  player:getCharVar("COP_Tenzen_s_Path") == 4) then
        -- player:startEvent(6)
    -- elseif (CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getCharVar("theLostCardianVar") == 2) then
        -- player:startEvent(33) -- Long CS & Finish Quest "The Lost Cardian" 33
    -- elseif (CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getCharVar("theLostCardianVar") == 3) then
        -- player:startEvent(34) -- Shot CS & Finish Quest "The Lost Cardian" 34
    -- elseif (TheLostCardien == QUEST_COMPLETED and player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.THE_KIND_CARDIAN) == QUEST_ACCEPTED) then
        -- player:startEvent(32) -- 32
    -- else
        -- player:startEvent(28) -- Standard dialog 28
    -- end

end
--Door:Infirmary     2 ++
--Door:Infirmary     10 ++
--Door:Infirmary     207 ++
--Door:Infirmary     82 ++
--Door:Infirmary     10059 nonCOP
--Door:Infirmary     10060 nonCOP
--Door:Infirmary     10205 nonCOP
--Door:Infirmary     10061 nonCOP
--Door:Infirmary     10062 nonCOP
--Door:Infirmary     10207 nonCOP
--Door:Infirmary     33 ++
--Door:Infirmary     34 ++
--Door:Infirmary     2 ++
--Door:Infirmary     82 ++
--Door:Infirmary     75 ++
--Door:Infirmary     10060 nonCOP
--Door:Infirmary     10205 nonCOP

--Tenzen     10011
--Tenzen     10012
function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if (csid == 6) then
        -- player:setCharVar("COP_Tenzen_s_Path", 5)
    -- elseif (csid == 74) then
        -- player:setCharVar("COP_Tenzen_s_Path", 3)
        -- player:addKeyItem(tpz.ki.ENVELOPE_FROM_MONBERAUX)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.ENVELOPE_FROM_MONBERAUX)
    -- elseif (csid == 10) then
        -- player:setCharVar("PromathiaStatus", 0)
        -- player:addKeyItem(tpz.ki.MYSTERIOUS_AMULET)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MYSTERIOUS_AMULET)
        -- player:completeMission(COP, tpz.mission.id.cop.THE_RITES_OF_LIFE)
        -- player:addMission(COP, tpz.mission.id.cop.BELOW_THE_ARKS) -- start the mission 1-2
        -- player:startEvent(206) -- 206
    -- elseif (csid == 206) then
        -- player:startEvent(207)  --207
    -- elseif (csid == 82) then
        -- player:setCharVar("PromathiaStatus", 1)
        -- player:delKeyItem(tpz.ki.MYSTERIOUS_AMULET_DRAINED)
        -- player:messageSpecial(ID.text.LEND_PRISHE_AMULET, tpz.ki.MYSTERIOUS_AMULET_PRISHE)
    -- elseif (csid == 75) then
        -- player:setCharVar("PromathiaStatus", 0)
        -- player:completeMission(COP, tpz.mission.id.cop.DARKNESS_NAMED)
        -- player:addMission(COP, tpz.mission.id.cop.SHELTERING_DOUBT)
    -- elseif (csid == 91) then
        -- player:addCharVar("saveTheClockTowerVar", 1)
        -- player:addCharVar("saveTheClockTowerNPCz1", 4)
    -- elseif (csid == 33 and option == 0 or csid == 34 and option == 0) then
        -- player:addTitle(tpz.title.TWOS_COMPANY)
        -- player:setCharVar("theLostCardianVar", 0)
        -- player:addGil(GIL_RATE*2100)
        -- player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*2100)
        -- player:addKeyItem(tpz.ki.TWO_OF_SWORDS)
        -- player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.TWO_OF_SWORDS) -- Two of Swords (Key Item)
        -- player:addFame(JEUNO, 30)
        -- player:completeQuest(JEUNO, tpz.quest.id.jeuno.THE_LOST_CARDIAN)
        -- player:addQuest(JEUNO, tpz.quest.id.jeuno.THE_KIND_CARDIAN) -- Start next quest "THE_KING_CARDIAN"
    -- elseif (csid == 33 and option == 1) then
        -- player:setCharVar("theLostCardianVar", 3)
    -- end

end
