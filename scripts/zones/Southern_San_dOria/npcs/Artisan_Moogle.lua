-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Artisan Moogle
-----------------------------------
require("scripts/globals/artisan")

function onTrade(player, npc, trade)
    if (trade:hasItemQty(15224, 1) == true and trade:getItemCount() == 1) and player:getMeritCount() >= 50 then --empress hairpin and 50 merits
        player:tradeComplete()
        player:setMerits(player:getMeritCount() - 50)        
        player:addSpell(978, true, true) -- Kupofried
        player:addSpell(931, true, true) -- Moogle        
        player:addSpell(935, true, true) -- Star Sybil
        player:addSpell(927, true, true) -- Sakura        
        player:addSpell(950, true, true) -- Kuyin        
        player:PrintToPlayer(string.format("Artisan Moogle: KUPO! thats the hairpin I needed! I will bestow upon you Mooglie-MonsterKupower."),tpz.msg.channel.NS_SAY)
        player:PrintToPlayer(string.format("You may now use the following Trusts:"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Kupofried"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Moogle"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Star Sibyl"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Kuyin Hathdenna"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Sakura"),tpz.msg.channel.SYSTEM_3)
    end
end

function onTrigger(player, npc)
    tpz.artisan.moogleOnTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
    tpz.artisan.moogleOnUpdate(player, npc, option)
end

function onEventFinish(player, csid, option)
    tpz.artisan.moogleOnFinish(player, npc, option)
end