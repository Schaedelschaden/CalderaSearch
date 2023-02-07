-----------------------------------
-- Area: Windurst Woods
--  NPC: Lih Pituu
-- Type: Bonecraft Adv. Image Support
-- !pos -5.471 -6.25 -141.211 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/crafting")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 2)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.BONECRAFT)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.BONECRAFT)

    -- if guildMember == 1 then
        -- if not player:hasStatusEffect(tpz.effect.BONECRAFT_IMAGERY) then
            -- player:startEvent(10018, Cost, SkillLevel, 0, 511, player:getGil(), 0, 7028, 0)
        -- else
            -- player:startEvent(10018, Cost, SkillLevel, 0, 511, player:getGil(), 28753, 3967, 0)
        -- end
    -- else
        -- player:startEvent(10018) -- Standard Dialogue
    -- end

    local stock =
    {
        2371,  6300, -- Khimaira Horn
        2358,  3600, -- Lithic Wyvern Scale
        2420,  2022, -- Luminous Crab Shell
        1718,  4455, -- Megalobugard Tusk
        -- 1458,  7950,         -- Mammoth Tusk
        1123,  1890, -- Manticore Fang
        2147,  2226, -- Marid Tusk
        2146,   750, -- Merrow Scale
        3444,  6306, -- Moira's Molar
        1273,  1713, -- Namtar Bone
         865,  1032, -- Handful of Nidhogg's Scales
        1770,  1557, -- Oversized Fang
        2743,  2853, -- Oxblood Orb
         868,    72, -- Handful of Pugil Scales
        3488,   306, -- Putrid Cuspid
        8709,  1590, -- Raaz Tusk
         895,  1746, -- Ram Horn
        2499, 15120, -- Regurgitated Wing
        1016,    30, -- Remi Shell
        2754,  3303, -- Ruszor Fang
        2515,   534, -- Sandworm Fang
        2516,   534, -- Sandworm Shell
        1015,   228, -- Sand Bat Fang
        5412,  5754, -- Scapegoat
         897,   819, -- Scorpion Claw
         896,  1239, -- Scorpion Shell
         888,    90, -- Seashell
        2130,    81, -- Shagreen File
         882,   144, -- Sheep Tooth
        1883,   168, -- Ponze of Shell Powder
        1716,  1233, -- Smooth Beetle Jaw
        2421,  2565, -- Spirit Turtle Shell
        1620,  1731, -- Taurus Horn
        1586,  1050, -- Titanictus Shell
         885,  3672, -- Turtle Shell
        1841,  3549, -- Unicorn Horn
        1618,  4500, -- Uragnite Shell
         901, 75000, -- Venomous Claw
        1975,  2466, -- Vivio Scorpion Claw
        1976,  3600, -- Vivio Wyvern Scale
        1715,  5355, -- Piece of Vivified Coral
        1974,  2022, -- Vivio Crab Shell
        1973,   738, -- Vivio Femur
        2141,    48, -- Wailing Bone Chip
        2142,  1332, -- Wailing Ram Horn
        2234,   393, -- Wailing Shell
        3487,   426, -- Whetted Molar
        2426,  2226, -- Wivre Horn
        2427,  2550, -- Wivre Maul
        1816,   144, -- Wyrm Horn
         892,   231, -- Wyrm Skull
    }

    player:PrintToPlayer(string.format("Lih Pituu : Welcome to Caldera's Bonecraft shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- local Cost = getAdvImageSupportCost(player, 4)

    -- if csid == 10018 and option == 1 then
        -- player:delGil(Cost)
        -- player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 6, 0)
        -- player:addStatusEffect(tpz.effect.BONECRAFT_IMAGERY, 3, 0, 480)
    -- end
end