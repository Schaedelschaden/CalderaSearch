-----------------------------------
-- Area: Bastok Markets
--  NPC: Ulrike
-- Type: Goldsmithing Synthesis Image Support
-- !pos -218.399 -7.824 -56.203 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/crafting")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:getGil() ~= 50000000 then -- 50 Million gil
        player:PrintToPlayer(string.format("Ulrike : Apologies, your tuition will be 50 million gil."),tpz.msg.channel.NS_SAY)

        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Ulrike : Congratulations, you just bought your Goldsmithing diploma!"),tpz.msg.channel.NS_SAY)

    -- Add the current Argentum tome and remove all others
    player:delKeyItem(tpz.ki.ALCHEMISTS_ARGENTUM_TOME)  -- Alchemy
    player:delKeyItem(tpz.ki.CARPENTERS_ARGENTUM_TOME)  -- Woodworking
    player:delKeyItem(tpz.ki.BLACKSMITHS_ARGENTUM_TOME) -- Smithing
    player:delKeyItem(tpz.ki.WEAVERS_ARGENTUM_TOME)     -- Clothcraft
    player:delKeyItem(tpz.ki.TANNERS_ARGENTUM_TOME)     -- Leatherworking
    player:delKeyItem(tpz.ki.BONEWORKERS_ARGENTUM_TOME) -- Bonecrafting
    player:delKeyItem(tpz.ki.CULINARIANS_ARGENTUM_TOME) -- Cooking

    player:addKeyItem(tpz.ki.GOLDSMITHS_ARGENTUM_TOME)  -- Goldsmithing
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.GOLDSMITHS_ARGENTUM_TOME)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 6)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.GOLDSMITHING)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.GOLDSMITHING)

    -- if guildMember == 1 then
        -- if player:hasStatusEffect(tpz.effect.GOLDSMITHING_IMAGERY) == false then
            -- player:startEvent(304, SkillCap, SkillLevel, 2, 201, player:getGil(), 0, 9, 0)
        -- else
            -- player:startEvent(304, SkillCap, SkillLevel, 2, 201, player:getGil(), 6975, 9, 0)
        -- end
    -- else
        -- player:startEvent(304)
    -- end

    player:PrintToPlayer(string.format("Ulrike : I'll provide Advanced Goldsmithing Support to you at any time!"),tpz.msg.channel.NS_SAY)
    player:addStatusEffect(tpz.effect.GOLDSMITHING_IMAGERY, 3, 0, 480)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if csid == 304 and option == 1 then
        -- player:delStatusEffectsByFlag(tpz.effectFlag.SYNTH_SUPPORT, true)
        -- player:addStatusEffect(tpz.effect.GOLDSMITHING_IMAGERY, 1, 0, 120)
        -- player:messageSpecial(ID.text.GOLDSMITHING_SUPPORT, 0, 3, 2)
    -- end
end
