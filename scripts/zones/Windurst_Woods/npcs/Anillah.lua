-----------------------------------
-- Area: Windurst Woods
--  NPC: Anillah
-- Type: Clothcraft Image Support
-- !pos -34.800 -2.25 -119.950 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/crafting")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 3)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.CLOTHCRAFT)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.CLOTHCRAFT)

    -- if guildMember == 1 then
        -- if not player:hasStatusEffect(tpz.effect.CLOTHCRAFT_IMAGERY) then
            -- player:startEvent(10015, SkillCap, SkillLevel, 2, 511, player:getGil(), 0, 0, 0) -- p1 = skill level
        -- else
            -- player:startEvent(10015, SkillCap, SkillLevel, 2, 511, player:getGil(), 7108, 0, 0)
        -- end
    -- else
        -- player:startEvent(10015) -- Standard Dialogue
    -- end
	local stock =
    {
		4026, 315,			-- Clump of Akaso
		2138, 2150,			-- Square of Alluring Cotton Cloth
		1294, 2050,			-- Spool of Arachne Thread
		1270, 1300,			-- Arachne Web
		1739, 517,			-- Square of Balloon Cloth
		1700, 490,			-- Spool of Bloodthread
		2498, 12483,		-- Briareus's Sash
		1966, 8500,			-- Spool of Brilliant Gold Thread
		2825, 3000,			-- Square of Cambric
		1712, 1520,			-- Clump of Cashmere Wool
		3449, 11020,		-- Celaeno's Cloth
		1281, 4900,			-- Square of Cheviot Cloth
		2537, 1524,			-- Square of Cilice
		839, 70,			-- Piece of Crawler Cocoon
		2835, 13050,		-- Lock of Dahu Hair
		2539, 734,			-- Tuft of Dhalmel Hair
		1967, 3000,			-- Spool of Dull Gold Thread
		2856, 35000,		-- Square of Ensanguined Cloth
		2838, 1070,			-- Square of Ephemeral Cloth
		1994, 870,			-- Square of Ether Cotton
		835, 60,			-- Flax Flower
		2705, 5048,			-- Square of Foulard
		1769, 42050,		-- Square of Galateia
		1999, 41135,		-- Square of Gold Brocade
		823, 5000,			-- Spool of Gold Thread
		1690, 400,			-- Hippogryph Tailfeather
		2005, 415,			-- Square of Hunter's Cotton
		2424, 2920,			-- Square of Incombustible Wool
		2778, 280,			-- Inferior Cocoon
		2287, 815,			-- Spool of Karakul Thread
		2315, 365,			-- Clump of Karakul Wool
		1764, 18000,		-- Square of Kejusu Satin
		2372, 900,			-- Khimaira Mane
		2843, 4067,			-- Square of Lineadach
		529, 2147,			-- Luminicloth
		1963, 4000,			-- Square of Magical Cotton Cloth
		1964, 4000,			-- Square of Magical Linen Cloth
		1965, 8080,			-- Square of Magical Silk Cloth
		1163, 350,			-- Lock of Manticore Hair
		2166, 300,			-- Lock of Marid Hair
		1651, 1200,			-- Spool of Moblin Thread
		2274, 460,			-- Square of Mohbwa Cloth
		2295, 20,			-- Clump of Mohbwa Grass
		833, 50,			-- Clump of Moko Grass
		2704, 5078,			-- Square of Oil-Soaked Cloth
		2476, 10034,		-- Spool of Platinum Silk Thread
		821, 7280,			-- Spool of Rainbow Thread
		1132, 20247,		-- Square of Raxa
		1828, 80,			-- Spool of Red Grass Thread
		1845, 90,			-- Clump of Red Moko Grass
		2827, 80,			-- Spool of Rugged Gold Thread
		1997, 3699,			-- Square of Sailcloth
		1280, 582,			-- Square of Sarcenet Cloth
		834, 30,			-- Ball of Saruta Cotton
		2878, 2280,			-- Square of Scarlet Kadife
		1968, 2859,			-- Spool of Shiny Gold Thread
		832, 450,			-- Clump of Sheep Wool
		1991, 3747,			-- Square of Silver Brocade
		822, 600,			-- Spool of Silver Thread
		1313, 18000,		-- Lock of Siren's Hair
		1409, 4488,			-- Spool of Siren's Macrame
		4031, 237,			-- Bottle of Snapweed Secretion
		4032, 2631,			-- Snapweed Tendril
		2199, 3900,			-- Spool of Sparkstrand Thread
		838, 1980,			-- Spider Web
		2128, 75,			-- Spindle
		1279, 4500,			-- Square of Taffeta Cloth
		2200, 5010,			-- Square of Twill Damask
		1295, 3495,			-- Twincoon
		1278, 2760,			-- Spool of Twinthread
		2198, 2820,			-- Water Spider's Web
		2173, 117,			-- Wamoura Cocoon
		2289, 3261,			-- Square of Wamoura Cloth
		2337, 450,			-- Clump of Wamoura Hair
		2011, 936,			-- Clump of Wolf Fur
		2330, 2283,			-- Yoichi's Sash
		2145, 225,			-- Spool of Zephyr Thread
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Anillah : Welcome to Caldera's Clothcraft shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if csid == 10015 and option == 1 then
        -- player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 4, 2)
        -- player:addStatusEffect(tpz.effect.CLOTHCRAFT_IMAGERY, 1, 0, 120)
    -- end
end