-----------------------------------
-- Area: Port Jeuno
--  NPC: Horst
-- Type: Abyssea Warp NPC
-- !pos -54.379 0.001 -10.061 246
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local CRUOR = player:getCurrency("cruor")
    -- if (player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED) then
        -- player:startEvent(339, 1, CRUOR, 7, 7, 7) -- Temp activated all locations till param handling sorted out.
    -- elseif (player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_COMPLETED) then
        player:startEvent(339, 2, CRUOR, 7, 7, 7) -- Temp activated all locations till param handling sorted out.
    -- else
        -- player:startEvent(339, 0)
    -- end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local CRUOR = player:getCurrency("cruor")
    if (csid == 339) then
        if (option == 260) then
            if (CRUOR >= 200) then
                player:delCurrency("cruor", 200)
                player:setPos(-480, 0, 794, 62, 132) -- Abyssea - La Theine Plateau
            end
        elseif (option == 264) then
            if (CRUOR >= 200) then
                player:delCurrency("cruor", 200)
                player:setPos(153, -72, -840, 140, 15) -- Abyssea - Konschtat Highlands
            end
        elseif (option == 268) then
            if (CRUOR >= 200) then
                player:delCurrency("cruor", 200)
                player:setPos(-24, 44, -678, 240, 45) -- Abyssea - Tahrongi Canyon
            end
        -- elseif (option == 272) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(-351, -46.750, 699.5, 10, 217) -- Abyssea - Vunkerl
            -- end
        -- elseif (option == 276) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(670, -15, 318, 119, 216) -- Abyssea - Misareaux
            -- end
        -- elseif (option == 280) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(-140, 20, -181, 131, 215) -- Abyssea - Attohwa
            -- end
        -- elseif (option == 288) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(-240, -40, -520, 251, 253) -- Abyssea - Uleguerand
            -- end
        -- elseif (option == 284) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(432, 0, 321, 125, 218)  -- Abyssea - Altepa
            -- end
        -- elseif (option == 292) then
            -- if (CRUOR >= 200) then
                -- player:delCurrency("cruor", 200)
                -- player:setPos(-555, 31, -760, 0, 254) -- Abyssea - Grauberg
            -- end
        end
    end
end
