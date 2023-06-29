-----------------------------------
-- Area: Port San d'Oria
--  NPC: Ivan
-- Type: Abyssea Warp NPC
-- !pos 8 -4 65
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local cruor  = player:getCurrency("cruor")
    local t2Open = 0
    local t3Open = 0

    if
        player:getCharVar("KillCounter_Briareus") >= 1 and
        player:getCharVar("KillCounter_Kukulkan") >= 1 and
        player:getCharVar("KillCounter_Glavoid") >= 1
    then
        t2Open = 7
    end

    -- if
        -- player:getCharVar("KillCounter_Itzpapalotl") >= 1 and
        -- player:getCharVar("KillCounter_Cirein-croin") >= 1 and
        -- player:getCharVar("KillCounter_Sedna") >= 1
    -- then
        -- t3Open = 7
    -- end

    player:startEvent(795, 2, cruor, 7, t2Open, t3Open)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local cruor = player:getCurrency("cruor")

    if csid == 795 then
        if option == 260 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-480, 0, 794, 62, 132) -- Abyssea - La Theine Plateau
            end
        elseif option == 264 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(153, -72, -840, 140, 15) -- Abyssea - Konschtat Highlands
            end
        elseif option == 268 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-24, 44, -678, 240, 45) -- Abyssea - Tahrongi Canyon
            end
        elseif option == 272 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-351, -46.750, 699.5, 10, 217) -- Abyssea - Vunkerl
            end
        elseif option == 276 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(670, -15, 318, 119, 216) -- Abyssea - Misareaux
            end
        elseif option == 280 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-140, 20, -181, 131, 215) -- Abyssea - Attohwa
            end
        elseif option == 288 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-240, -40, -520, 251, 253) -- Abyssea - Uleguerand
            end
        elseif option == 284 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(432, 0, 321, 125, 218)  -- Abyssea - Altepa
            end
        elseif option == 292 then
            if cruor >= 200 then
                player:delCurrency("cruor", 200)
                player:setPos(-555, 31, -760, 0, 254) -- Abyssea - Grauberg
            end
        end
    end
end
