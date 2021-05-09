-----------------------------------
-- Area: Windurst Woods
--  NPC: Ronana
-- Type: Bonecraft Image Support
-- !pos -1.540 -6.25 -144.517 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/crafting")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 2)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.BONECRAFT)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.BONECRAFT)

    -- if guildMember == 1 then
        -- if not player:hasStatusEffect(tpz.effect.BONECRAFT_IMAGERY) then
            -- player:startEvent(10019, SkillCap, SkillLevel, 1, 511, player:getGil(), 0, 36408, 0)
        -- else
            -- player:startEvent(10019, SkillCap, SkillLevel, 1, 511, player:getGil(), 7081, 36408, 0)
        -- end
    -- else
        -- player:startEvent(10019) -- Standard Dialogue
    -- end
	
	local stock =
    {
		908, 44370,			-- Adamantoise Shell
		3448, 18900,		-- Akupara's Shell
		2753, 3300,			-- Amphiptere Claw
		2496, 9831,			-- Ancient Beast Horn
		1312, 32250,		-- Piece of Angel Skin
		2744, 2115,			-- Angel Skin Orb
		1616, 8220,			-- Antlion Jaw
		1272, 1506,			-- Arioch Fang
		891, 24,			-- Bat Fang
		2002, 3234,			-- Beast Horn
		894, 363,			-- Beetle Jaw
		889, 189,			-- Beetle Shell
		883, 13125,			-- Behemoth Horn
		884, 1290,			-- Black Tiger Fang
		880, 57,			-- Bone Chip
		1615, 8061,			-- Buffalo Horn
		1622, 2157,			-- Bugard Tusk
		2769, 2700,			-- Buggane Horn
		2004, 330,			-- Ponze of Carapace Powder
		2168, 8721,			-- Cerberus Claw
		898, 30,			-- Chicken Bone
		1463, 8109,			-- Chronos Tooth
		907, 2172,			-- Cold Bone
		2171, 726,			-- Colibri Beak
		1518, 795,			-- Colossal Skull
		887, 5250,			-- Coral Fragment
		2009, 3009,			-- Coral Horn
		881, 1149,			-- Crab Shell
		902, 1998,			-- Demon Horn
		886, 10686,			-- Demon Skull
		1771, 3060,			-- Dragon Bone
		867, 13350,			-- Handful of Dragon Scales
		903, 5700,			-- Dragon Talon
		900, 582,			-- Set of Fish Bones
		864, 72,			-- Handful of Fish Scales
		2408, 8280,			-- Flocon-de-mer
		2748, 2280,			-- Gargouille Shank
		2747, 2913,			-- Gargouille Horn
		893, 609,			-- Giant Femur
		1517, 795,			-- Giant Frozen Head
		2521, 1560,			-- Gnole Claw
		909, 888,			-- Guivre's Skull
		1193, 9975,			-- High-Quality Crab Shell
		3270, 1010,			-- High-Quality Pugil Scale
		1473, 10260,		-- High-Quality Scorpion Shell
		1719, 6000,			-- Harajnite Shell
		2639, 2052,			-- Hardened Bone
		2158, 8550,			-- Hydra Fang
		899, 243,			-- Ifrit Horn
		2879, 4869,			-- Igneous Barnacle
		2157, 1557,			-- Imp Horn
	}
	
	player:PrintToPlayer(string.format("Ronana : Welcome to Caldera's Bonecraft shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if csid == 10019 and option == 1 then
        -- player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 6, 1)
        -- player:addStatusEffect(tpz.effect.BONECRAFT_IMAGERY, 1, 0, 120)
    -- end
end