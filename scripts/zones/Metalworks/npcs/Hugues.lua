-----------------------------------
-- Area: Metalworks
--  NPC: Hugues
-- Type: Smithing Synthesis Image Support
-- !pos -106.336 2.000 26.117 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Hugues : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Hugues : Congratulations, you just bought your Smithing diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:delKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:delKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:delKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BLACKSMITHS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 8)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.SMITHING)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.SMITHING)

    -- if guildMember == 1 then
        -- if player:hasStatusEffect(tpz.effect.SMITHING_IMAGERY) == false then
            -- player:startEvent(104, SkillCap, SkillLevel, 1, 207, player:getGil(), 0, 4095, 0)
        -- else
            -- player:startEvent(104, SkillCap, SkillLevel, 1, 207, player:getGil(), 7101, 4095, 0)
        -- end
    -- else
        -- player:startEvent(104)
    -- end

    player:PrintToPlayer(string.format("Hugues : I'll provide Advanced Smithing Support to you at any time!"),tpz.msg.channel.NS_SAY)
    player:addStatusEffect(tpz.effect.SMITHING_IMAGERY, 3, 0, 480)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if csid == 104 and option == 1 then
        -- player:delStatusEffectsByFlag(tpz.effectFlag.SYNTH_SUPPORT, true)
        -- player:addStatusEffect(tpz.effect.SMITHING_IMAGERY, 1, 0, 120)
        -- player:messageSpecial(ID.text.SMITHING_SUPPORT, 0, 2, 1)
    -- end
end
