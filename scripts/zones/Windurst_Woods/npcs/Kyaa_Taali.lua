-----------------------------------
-- Area: Windurst Woods
--  NPC: Kyaa Taali
-- Type: Bonecraft Image Support
-- !pos -10.470 -6.25 -141.700 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Kyaa Taali : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete() -- Add the current Argentum tome and remove all others
    player:PrintToPlayer(string.format("Kyaa Taali : Congratulations, you just bought your Bonecrafting diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:delKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:delKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:delKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:delKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BONEWORKERS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 2)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.BONECRAFT)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.BONECRAFT)

    -- if guildMember == 1 then
        -- if not player:hasStatusEffect(tpz.effect.BONECRAFT_IMAGERY) then
            -- player:startEvent(10020, SkillCap, SkillLevel, 2, 509, player:getGil(), 0, 0, 0)
        -- else
            -- player:startEvent(10020, SkillCap, SkillLevel, 2, 511, player:getGil(), 7147, 0, 0)
        -- end
    -- else
        -- player:startEvent(10020) -- Standard Dialogue
    -- end

    player:PrintToPlayer(string.format("Kyaa Taali : I'll provide Advanced Bonecraft Support to you at any time!"),tpz.msg.channel.NS_SAY)
    player:addStatusEffect(tpz.effect.BONECRAFT_IMAGERY, 3, 0, 480)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if csid == 10020 and option == 1 then
        -- player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 6, 2)
        -- player:addStatusEffect(tpz.effect.BONECRAFT_IMAGERY, 1, 0, 120)
    -- end
end
