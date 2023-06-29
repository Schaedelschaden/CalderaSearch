-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Ulycille
-- Type: Woodworking Adv. Synthesis Image Support
-- !pos -183.320 9.999 269.651 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Ulycille : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Ulycille : Congratulations, you just bought your Woodworking diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:delKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:delKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:delKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CARPENTERS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    local guildMember = isGuildMember(player, 9)
    local SkillLevel = player:getSkillLevel(tpz.skill.WOODWORKING)
    local Cost = getAdvImageSupportCost(player, tpz.skill.WOODWORKING)

    if (guildMember == 1) then
        if (player:hasStatusEffect(tpz.effect.WOODWORKING_IMAGERY) == false) then
            player:startEvent(623, Cost, SkillLevel, 0, 207, player:getGil(), 0, 4095, 0)
        else
            player:startEvent(623, Cost, SkillLevel, 0, 207, player:getGil(), 28482, 4095, 0)
        end
    else
        player:startEvent(623) -- Standard Dialogue
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local Cost = getAdvImageSupportCost(player, tpz.skill.WOODWORKING)

    if (csid == 623 and option == 1) then
        player:delGil(Cost)
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 1, 0)
        player:addStatusEffect(tpz.effect.WOODWORKING_IMAGERY, 3, 0, 480)
    end
end
