-----------------------------------
-- Area: Misareaux Coast
-- NPC: Undulating Confluence
-- Entrance to Escha - Ru'Aun
-- !pos -49.794 -23.147 568.861 25
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local t2ZiTahClears =
    {
        player:getCharVar("KillCounter_Sensual_Sandy"),
        player:getCharVar("KillCounter_Ionos"),
        player:getCharVar("KillCounter_Brittlis"),
        player:getCharVar("KillCounter_Nosoi"),
        player:getCharVar("KillCounter_Umdhlebi"),
        player:getCharVar("KillCounter_Kamohoalii"),
    }

    if
        (t2ZiTahClears[1] > 0 and
        t2ZiTahClears[2] > 0 and
        t2ZiTahClears[3] > 0 and
        t2ZiTahClears[4] > 0 and
        t2ZiTahClears[5] > 0 and
        t2ZiTahClears[6] > 0) or
        player:getGMLevel() > 0
    then
        player:startEvent(14)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 14 then
        player:setPos(-0.371, -34.278, -466.980, 187, 289)
    end
end
