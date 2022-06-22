-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Rytaal
-- Type: Standard NPC
-- !pos 112.002 -1.338 -45.038 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/besieged")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Rytaal : Assault missions are currently suspended due to lack of military funds."),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Rytaal : It has been deemed necessary to sell Salvage equipment to mercenaries to raise additional funds."),tpz.msg.channel.NS_SAY)
    
	local stock =
    {
		16084, 200000, -- Ares' Mask
        14546, 200000, -- Ares' Cuirass
		14961, 200000, -- Ares' Gauntlets
		15625, 200000, -- Ares' Flanchard
        15711, 200000, -- Ares' Sollerets
		16088, 200000, -- Skadi's Visor
		14550, 200000, -- Skadi's Cuirie
		14965, 200000, -- Skadi's Bazubands
		15629, 200000, -- Skadi's Chausses
		15715, 200000, -- Skadi's Jambeaux
		16092, 200000, -- Usukane Somen
		14554, 200000, -- Usukane Haramaki
		14969, 200000, -- Usukane Gote
		15633, 200000, -- Usukane Hizayoroi
		15719, 200000, -- Usukane Sune-Ate
        16096, 200000, -- Marduk's Tiara
		14558, 200000, -- Marduk's Jubbah
		14973, 200000, -- Marduk's Dastanas
		15637, 200000, -- Marduk's Shalwar
		15723, 200000, -- Marduk's Crackows
		16100, 200000, -- Morrigan's Coronal
		14562, 200000, -- Morrigan's Robe
		14977, 200000, -- Morrigan's Cuffs
		15641, 200000, -- Morrigan's Slops
		15727, 200000, -- Morrigan's Pigaches
		-- 27648, 200000, -- Ares' Mask +1
        -- 27788, 200000, -- Ares' Cuirass +1
		-- 27928, 200000, -- Ares' Gauntlets +1
		-- 28071, 200000, -- Ares' Flanchard +1
        -- 28208, 200000, -- Ares' Sollerets +1
		-- 27649, 200000, -- Skadi's Visor +1
		-- 27789, 200000, -- Skadi's Cuirie +1
		-- 27929, 200000, -- Skadi's Bazubands +1
		-- 28072, 200000, -- Skadi's Chausses +1
		-- 28209, 200000, -- Skadi's Jambeaux +1
		-- 27650, 200000, -- Usukane Somen +1
		-- 27790, 200000, -- Usukane Haramaki +1
		-- 27930, 200000, -- Usukane Gote +1
		-- 28073, 200000, -- Usukane Hizayoroi +1
		-- 28210, 200000, -- Usukane Sune-Ate +1
        -- 27651, 200000, -- Marduk's Tiara +1
		-- 27791, 200000, -- Marduk's Jubbah +1
		-- 27931, 200000, -- Marduk's Dastanas +1
		-- 28074, 200000, -- Marduk's Shalwar +1
		-- 28211, 200000, -- Marduk's Crackows +1
		-- 27652, 200000, -- Morrigan's Coronal +1
		-- 27792, 200000, -- Morrigan's Robe +1
		-- 27932, 200000, -- Morrigan's Cuffs +1
		-- 28075, 200000, -- Morrigan's Slops +1
		-- 28212, 200000, -- Morrigan's Pigaches +1
	}

    tpz.shop.general(player, stock)

-- Caldera has Assaults disabled
    -- local currentday = tonumber(os.date("%j"))
    -- local lastIDtag = player:getCharVar("LAST_IMPERIAL_TAG")
    -- local tagCount = player:getCurrency("id_tags")
    -- local diffday = currentday - lastIDtag
    -- local currentAssault = player:getCurrentAssault()
    -- local haveimperialIDtag

    -- if player:getCurrentMission(TOAU) == tpz.mission.id.toau.PRESIDENT_SALAHEEM and player:getCharVar("AhtUrganStatus") == 0 then
        -- player:startEvent(269, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    -- elseif player:getCurrentMission(TOAU) <= tpz.mission.id.toau.IMMORTAL_SENTRIES or player:getMainLvl() <= 49 then
        -- player:startEvent(270)
    -- elseif currentAssault ~= 0 and tpz.besieged.hasAssaultOrders(player) == 0 then
        -- if player:getCharVar("AssaultComplete") == 1 then
            -- player:messageText(player, ID.text.RYTAAL_MISSION_COMPLETE)
            -- player:completeAssault(currentAssault)
        -- else
            -- player:messageText(player, ID.text.RYTAAL_MISSION_FAILED)
            -- player:addAssault(0)
        -- end
        -- player:setCharVar("AssaultComplete", 0)
    -- elseif player:getCurrentMission(TOAU) > tpz.mission.id.toau.PRESIDENT_SALAHEEM or (player:getCurrentMission(TOAU) == tpz.mission.id.toau.PRESIDENT_SALAHEEM and player:getCharVar("AhtUrganStatus") >= 1) then
        -- if lastIDtag == 0 then -- first time you get the tag
            -- tagCount = 1
            -- player:setCurrency("id_tags", tagCount)
            -- player:setCharVar("LAST_IMPERIAL_TAG", currentday)
        -- elseif diffday > 0 then
            -- tagCount = tagCount + diffday
            -- if tagCount > 3 then -- store 3 TAG max
                -- tagCount = 3
            -- end
            -- player:setCurrency("id_tags", tagCount)
            -- player:setCharVar("LAST_IMPERIAL_TAG", currentday)
        -- end

        -- if player:hasKeyItem(tpz.ki.IMPERIAL_ARMY_ID_TAG) then
            -- haveimperialIDtag = 1
        -- else
            -- haveimperialIDtag = 0
        -- end
        -- player:startEvent(268, tpz.ki.IMPERIAL_ARMY_ID_TAG, tagCount, currentAssault, haveimperialIDtag)
    -- end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
    local tagCount = player:getCurrency("id_tags")
    local currentAssault = player:getCurrentAssault()

    if csid == 269 then
        player:setCharVar("AhtUrganStatus", 1)
    elseif csid == 268 and option == 1 and player:hasKeyItem(tpz.ki.IMPERIAL_ARMY_ID_TAG) == false and tagCount > 0 then
        npcUtil.giveKeyItem(player, tpz.ki.IMPERIAL_ARMY_ID_TAG)
        player:setCurrency("id_tags", tagCount - 1)
    elseif csid == 268 and option == 2 and player:hasKeyItem(tpz.ki.IMPERIAL_ARMY_ID_TAG) == false and tpz.besieged.hasAssaultOrders(player) ~= 0 then
        if player:hasKeyItem(tpz.ki.LEUJAOAM_ASSAULT_ORDERS) then
            player:delKeyItem(tpz.ki.LEUJAOAM_ASSAULT_ORDERS)
        elseif player:hasKeyItem(tpz.ki.MAMOOL_JA_ASSAULT_ORDERS) then
            player:delKeyItem(tpz.ki.MAMOOL_JA_ASSAULT_ORDERS)
        elseif player:hasKeyItem(tpz.ki.LEBROS_ASSAULT_ORDERS) then
            player:delKeyItem(tpz.ki.LEBROS_ASSAULT_ORDERS)
        elseif player:hasKeyItem(tpz.ki.PERIQIA_ASSAULT_ORDERS) then
            player:delKeyItem(tpz.ki.PERIQIA_ASSAULT_ORDERS)
        elseif player:hasKeyItem(tpz.ki.ILRUSI_ASSAULT_ORDERS ) then
            player:delKeyItem(tpz.ki.ILRUSI_ASSAULT_ORDERS)
        elseif player:hasKeyItem(tpz.ki.NYZUL_ISLE_ASSAULT_ORDERS) then
            player:delKeyItem(tpz.ki.NYZUL_ISLE_ASSAULT_ORDERS)
        end
        npcUtil.giveKeyItem(player, tpz.ki.IMPERIAL_ARMY_ID_TAG)
        player:delAssault(currentAssault)
    end
end