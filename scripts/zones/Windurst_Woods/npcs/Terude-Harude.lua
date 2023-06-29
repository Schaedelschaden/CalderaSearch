-----------------------------------
-- Area: Windurst Woods
--  NPC: Terude-Harude
-- Type: Clothcraft Adv. Image Support
-- !pos -32.350 -2.679 -116.450 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Terude-Harude : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Terude-Harude : Congratulations, you just bought your Clothcrafting diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:delKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:delKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:delKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WEAVERS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 3)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.CLOTHCRAFT)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.CLOTHCRAFT)

    -- if guildMember == 1 then
        -- if not player:hasStatusEffect(tpz.effect.CLOTHCRAFT_IMAGERY) then
            -- player:startEvent(10013, Cost, SkillLevel, 0, 511, player:getGil(), 0, 4095, 0)
        -- else
            -- player:startEvent(10013, Cost, SkillLevel, 0, 511, player:getGil(), 28754, 0, 0)
        -- end
    -- else
        -- player:startEvent(10013) -- Standard Dialogue
    -- end

	player:PrintToPlayer(string.format("Terude-Harude : I'll provide Advanced Clothcraft Support to you at any time!"),tpz.msg.channel.NS_SAY)
	player:addStatusEffect(tpz.effect.CLOTHCRAFT_IMAGERY, 3, 0, 480)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- local Cost = getAdvImageSupportCost(player, 8)
    -- if csid == 10013 and option == 1 then
        -- player:delGil(Cost)
        -- player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 4, 0)
        -- player:addStatusEffect(tpz.effect.CLOTHCRAFT_IMAGERY, 3, 0, 480)
    -- end
end
