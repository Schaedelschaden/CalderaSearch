-----------------------------------
-- Area: RaKaznar_Inner_Court
--  NPC: Malobra
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/RaKaznar_Inner_Court/IDs")
-----------------------------------


function onTrigger(player, npc)
    local keyid = tpz.ki.MACABRE_SIMULACRUM
    local ID = zones[player:getZoneID()]
    
    if player:getCharVar("SinisterReign") == 0 then
        player:PrintToPlayer(string.format("Malobra: You currently have %s bayld", player:getCurrency('bayld')), tpz.msg.channel.NS_SAY)
        if player:getCurrency('bayld') >= 50000 then
            player:timer(1000, function(playerArg)
                playerArg:PrintToPlayer(string.format("Malobra: Good you have enough bayld, talk to me again and I'll trade you 50k bayld for the Key"), tpz.msg.channel.NS_SAY)
                playerArg:setCharVar("SinisterReign", 1)
            end)
        else
            player:timer(1000, function(playerArg)
                playerArg:PrintToPlayer(string.format("Malobra: Come back when you have 50k bayld and I'll trade you a key to Sinister Reign"), tpz.msg.channel.NS_SAY)
            end)
        end
            
    elseif player:getCharVar("SinisterReign") == 1 then
        if player:hasKeyItem(keyid) then
            player:PrintToPlayer(string.format("Malobra: You already have a good key, come back after you die in the battlefield for another one."), tpz.msg.channel.NS_SAY)
        else
            player:PrintToPlayer(string.format("Malobra: Good luck... you'll need it."), tpz.msg.channel.NS_SAY)
            player:timer(1000, function(playerArg)
                playerArg:addKeyItem(keyid)
                playerArg:delCurrency('bayld', 50000)
                playerArg:messageSpecial(ID.text.KEYITEM_OBTAINED, keyid)
            end)
        end
    end        
end

function onEventUpdate(player, csid, option)
    -- local keyid = tpz.ki.MACABRE_SIMULACRUM
    -- local ID = zones[player:getZoneID()]

    -- if csid == 3 and option == 2 and (player:getCurrency('bayld') >= 5000) and (player:hasKeyItem(keyid) == false) then
        -- player:updateEvent(415549, 300, 200, 100, 374248, 1147, 625477, 0)
        -- player:delCurrency("bayld", 5000)
        -- player:addKeyItem(keyid)
        -- player:timer(1000, function(playerArg)
            -- playerArg:messageSpecial(ID.text.KEYITEM_OBTAINED, keyid)
        -- end)    
    -- elseif csid == 3 and option == 2 and (player:getCurrency('bayld') < 5000) then    
        -- player:PrintToPlayer(string.format("Malobra: You only have %s bayld", player:getCurrency('bayld')), tpz.msg.channel.NS_SAY)
    -- elseif csid == 3 and option == 2 and (player:hasKeyItem(keyid) == true) then    
        -- player:PrintToPlayer(string.format("Malobra: You already have a Macabre Simulacrum"), tpz.msg.channel.NS_SAY)
    -- end       
end

function onEventFinish(player, csid, option)
end
