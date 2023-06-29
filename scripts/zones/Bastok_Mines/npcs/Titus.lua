-----------------------------------
-- Area: Bastok Mines
--  NPC: Titus
-- Alchemy Synthesis Image Support
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Titus : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Titus : Congratulations, you just bought your Alchemy diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:delKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:delKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:delKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.ALCHEMISTS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 1)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.ALCHEMY)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.ALCHEMY)

    -- if (guildMember == 1) then
        -- if (player:hasStatusEffect(tpz.effect.ALCHEMY_IMAGERY) == false) then
            -- player:startEvent(123, SkillCap, SkillLevel, 1, 137, player:getGil(), 0, 0, 0)
        -- else
            -- player:startEvent(123, SkillCap, SkillLevel, 1, 137, player:getGil(), 6758, 0, 0)
        -- end
    -- else
        -- player:startEvent(123)
    -- end

    player:PrintToPlayer(string.format("Titus : I'll provide Advanced Alchemy Support to you at any time!"),tpz.msg.channel.NS_SAY)
    player:addStatusEffect(tpz.effect.ALCHEMY_IMAGERY, 3, 0, 480)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if (csid == 123 and option == 1) then
        -- player:messageSpecial(ID.text.ALCHEMY_SUPPORT, 0, 7, 1)
        -- player:addStatusEffect(tpz.effect.ALCHEMY_IMAGERY, 3, 0, 480)
    -- end
end
