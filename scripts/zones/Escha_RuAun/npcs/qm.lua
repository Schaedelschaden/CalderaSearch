-----------------------------------
-- Zone: Escha - Ru'Aun
-- NPC: qm (???)
-- Gives Eschan Droplets
-- !pos -14.7846 -34.0001 -465.9527 289
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    local npcID = npc:getID()

    if npcID == 17961698 then -- !pos -291 -42 -401 (Portal 2 - SW AA island)
        if
            player:hasKeyItem(tpz.ki.BYAKKOS_PRIDE) and
            npcUtil.tradeHasExactly(trade, {{3278, 3}}) and
            GetMobByID(17961559):isDead()
        then
            SpawnMob(17961559):updateEnmity(player)
            GetMobByID(17961559):setPos(-288.598, -42.248, -397.207, 87)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.GENBUS_HONOR) and
            npcUtil.tradeHasExactly(trade, {{3275, 3}}) and
            GetMobByID(17961562):isDead()
        then
            SpawnMob(17961562):updateEnmity(player)
            GetMobByID(17961562):setPos(-288.598, -42.248, -397.207, 87)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.SEIRYUS_NOBILITY) and
            npcUtil.tradeHasExactly(trade, {{3277, 3}}) and
            GetMobByID(17961565):isDead()
        then
            SpawnMob(17961565):updateEnmity(player)
            GetMobByID(17961565):setPos(-288.598, -42.248, -397.207, 87)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SEIRYUS_NOBILITY)
        elseif
            player:hasKeyItem(tpz.ki.SUZAKUS_BENEFACTION) and
            npcUtil.tradeHasExactly(trade, {{3276, 3}}) and
            GetMobByID(17961568):isDead()
        then
            SpawnMob(17961568):updateEnmity(player)
            GetMobByID(17961568):setPos(-288.598, -42.248, -397.207, 87)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SUZAKUS_BENEFACTION)
        end
    elseif npcID == 17961701 then -- !pos -471 -42 153   (Portal 5 - NW AA island)
        if
            player:hasKeyItem(tpz.ki.BYAKKOS_PRIDE) and
            npcUtil.tradeHasExactly(trade, {{3278, 3}}) and
            GetMobByID(17961560):isDead()
        then
            SpawnMob(17961560):updateEnmity(player)
            GetMobByID(17961560):setPos(-466.678, -41.992, 151.668, 134)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.GENBUS_HONOR) and
            npcUtil.tradeHasExactly(trade, {{3275, 3}}) and
            GetMobByID(17961563):isDead()
        then
            SpawnMob(17961563):updateEnmity(player)
            GetMobByID(17961563):setPos(-466.678, -41.992, 151.668, 134)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.SEIRYUS_NOBILITY) and
            npcUtil.tradeHasExactly(trade, {{3277, 3}}) and
            GetMobByID(17961566):isDead()
        then
            SpawnMob(17961566):updateEnmity(player)
            GetMobByID(17961566):setPos(-466.678, -41.992, 151.668, 134)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SEIRYUS_NOBILITY)
        elseif
            player:hasKeyItem(tpz.ki.SUZAKUS_BENEFACTION) and
            npcUtil.tradeHasExactly(trade, {{3276, 3}}) and
            GetMobByID(17961569):isDead()
        then
            SpawnMob(17961569):updateEnmity(player)
            GetMobByID(17961569):setPos(-466.678, -41.992, 151.668, 134)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SUZAKUS_BENEFACTION)
        end
    elseif npcID == 17961704 then -- !pos 107 -40 -432  (Portal 1 - Main island)
        if
            player:hasKeyItem(tpz.ki.BYAKKOS_PRIDE) and
            npcUtil.tradeHasExactly(trade, {{3278, 3}}) and
            GetMobByID(17961561):isDead()
        then
            SpawnMob(17961561):updateEnmity(player)
            GetMobByID(17961561):setPos(107.964, -40.483, -428.536, 79)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.GENBUS_HONOR) and
            npcUtil.tradeHasExactly(trade, {{3275, 3}}) and
            GetMobByID(17961564):isDead()
        then
            SpawnMob(17961564):updateEnmity(player)
            GetMobByID(17961564):setPos(107.964, -40.483, -428.536, 79)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.GENBUS_HONOR)
        elseif
            player:hasKeyItem(tpz.ki.SEIRYUS_NOBILITY) and
            npcUtil.tradeHasExactly(trade, {{3277, 3}}) and
            GetMobByID(17961567):isDead()
        then
            SpawnMob(17961567):updateEnmity(player)
            GetMobByID(17961567):setPos(107.964, -40.483, -428.536, 79)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SEIRYUS_NOBILITY)
        elseif
            player:hasKeyItem(tpz.ki.SUZAKUS_BENEFACTION) and
            npcUtil.tradeHasExactly(trade, {{3276, 3}}) and
            GetMobByID(17961570):isDead()
        then
            SpawnMob(17961570):updateEnmity(player)
            GetMobByID(17961570):setPos(107.964, -40.483, -428.536, 79)

            player:tradeComplete()
            player:delKeyItem(tpz.ki.SUZAKUS_BENEFACTION)
        end
    end
end

function onTrigger(player, npc)
    local npcID = npc:getID()

    if
        npcID == 17961698 or -- !pos -291 -42 -401 (Portal 2 - SW AA island)
        npcID == 17961701 or -- !pos -471 42 153   (Portal 5 - NW AA island)
        npcID == 17961704    -- !pos 107 -40 -432  (Portal 1 - Main island)
    then
        player:PrintToPlayer(string.format("You will be able to engage the Heavenly Beasts here if you possess their key item and three scraps of their seal."),tpz.msg.channel.NS_SAY)
    elseif npcID == 17961727 then
        if not player:hasItem(9148) then
            player:addTempItem(9148, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 9148)
        else
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end