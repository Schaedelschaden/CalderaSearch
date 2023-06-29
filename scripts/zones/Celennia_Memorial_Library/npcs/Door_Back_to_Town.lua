-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Door: Back to Town
-- !pos -92 -2 -82 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/homepoint")
require("scripts/globals/survival_guide")
-----------------------------------


function onTrade(player,npc,trade)
    
    -- if trade:getGil() > 0 then
        -- if trade:getGil() == 1 then
            -- player:PrintToPlayer(string.format("Special Portal : To a crystal then."), tpz.msg.channel.NS_SAY)
            -- player:timer(4000, function(playerArg)
                -- playerArg:setPos(-178.0845, 4.0000, 73.2832, 64, 231)
            -- end)
        -- elseif trade:getGil() == 2 then
            -- player:PrintToPlayer(string.format("Special Portal : Room full of books and you need one that teleports."), tpz.msg.channel.NS_SAY)
            -- player:timer(4000, function(playerArg)
                -- playerArg:setPos(-175.3020, 4.0000, 79.9784, 0, 231)
            -- end)
        -- elseif trade:getGil() == 3 then
            -- player:PrintToPlayer(string.format("Special Portal : Ok, I'll just be a door then"), tpz.msg.channel.NS_SAY)
            -- player:timer(4000, function(playerArg)
                -- playerArg:setPos(-86, 0, -76, 221, 257)
            -- end)
        -- elseif trade:getGil() == 4 then
            -- player:PrintToPlayer(string.format("Special Portal : To the Waterways with you."), tpz.msg.channel.NS_SAY)
            -- player:timer(4000, function(playerArg)
                -- playerArg:setPos(0, 0, 0, 0, 258)
            -- end)
        -- elseif trade:getGil() == 7777 then
            -- player:PrintToPlayer(string.format("Special Portal : to Battle Square you go."), tpz.msg.channel.NS_SAY)
            -- player:timer(4000, function(playerArg)
                -- playerArg:setPos(-20.5679, 0, 0.0553, 0, 71)
            -- end)
        -- elseif trade:getGil() == 1000 then
            -- player:addKeyItem(tpz.ki.MACABRE_SIMULACRUM)
        -- end
    -- end
end

function onTrigger(player,npc)
    player:setPos(-86, 0, -76, 221, 257)
    -- player:PrintToPlayer(string.format("--SPECIAL-PORTAL-DESTINATIONS--"),tpz.msg.channel.SYSTEM_3)
    -- player:PrintToPlayer(string.format("--(trade gil amount for option)--"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("1 - Teleport Crystal"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("2 - Survival Guide"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("3 - Door Outside"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("4 - Rala Waterways"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("7777 - Battle Square (Under Construction)"),tpz.msg.channel.SYSTEM_3)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
