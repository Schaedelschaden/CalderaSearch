-----------------------------------
-- Area: Bastok Markets
--  NPC: Fatimah
-- Type: Goldsmithing Adv. Synthesis Image Support
-- !pos -193.849 -7.824 -56.372 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/status")
require("scripts/globals/crafting")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 6)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.GOLDSMITHING)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.GOLDSMITHING)

    -- if guildMember == 1 then
        -- if player:hasStatusEffect(tpz.effect.GOLDSMITHING_IMAGERY) == false then
            -- player:startEvent(302, Cost, SkillLevel, 0, 0xB0001AF, player:getGil(), 0, 0, 0) -- Event doesn't work
        -- else
            -- player:startEvent(302, Cost, SkillLevel, 0, 0xB0001AF, player:getGil(), 28674, 0, 0)
        -- end
    -- else
        -- player:startEvent(302)
    -- end
	
	local stock =
    {
		2853, 3667,		-- Malebolge Mandrel
		2826, 3904,		-- Mandragora Scale
		2143, 75,		-- Mandrel
		1836, 3000,		-- Marble Slab
		2136, 984,		-- Mighty Sardonyx Stone
		5265, 5820,		-- Mistmelt
		802, 7200,		-- Moonstone
		2422, 2022,		-- Mythril Mesh Sheet
		2876, 2520,		-- Muculent Ingot
		2311, 1188,		-- Mythril Gear Machine
		2308, 2121,		-- Mythril Coil
		1226, 381,		-- Mythril Nugget
		644, 750,		-- Chunk of Mythril Ore
		2473, 15000,	-- Nethercant Chain
		2470, 15000,	-- Nethereye Chain
		2471, 15000,	-- Netherfield Chain
		2474, 15000,	-- Netherpact Chain
		2472, 15000,	-- Netherspirit Chain
		1675, 11700,	-- Neutralizing Silver INgot
		2766, 3000,		-- Ingot of Oberon's Gold
		799, 621,		-- Onyx
--		739, 62500,		-- Chunk of Orichalcum Ore
		797, 7200,		-- Painite
		792, 3600,		-- Pearl
		2844, 5092,		-- Penumbral Brass Ingot
		788, 3600,		-- Peridot
		740, 3240,		-- Chunk of Phrygian Ore
		1271, 1056,		-- Pigeon's Blood Ruby
		1227, 810,		-- Platinum Nugget
--		738, 62500,		-- Chunk of Platinum Ore
		774, 603,		-- Purple Rock
		2841, 1408,		-- Ingot of Quadav Silver
		3524, 900,		-- Ramuite
		769, 600,		-- Red Rock
		1634, 1800,		-- Rhodonite
		1678, 11610,	-- Rogue's Silver INgot
		786, 11400,		-- Ruby
		2850, 5408,		-- Ingot of Sahagin Gold
		794, 11400,		-- Sapphire
		807, 636,		-- Sardonyx
		1649, 615,		-- Scarlet Stone
		782, 27000,		-- Selenite
		3323, 135,		-- Shadow Gem
		3304, 600,		-- Shadow Geode
		3521, 900,		-- Shivite
		1233, 75,		-- Silver Nugget
		736, 210,		-- Chunk of Silver Ore
		3317, 135,		-- Snow Gem
		3298, 600,		-- Snow Geode
		3319, 11961,	-- Soil Gem
		3300, 600,		-- Soil Geode
		1274, 3006,		-- Southern Pearl
--		1470, 795,		-- Sparkling Stone
		815, 3672,		-- Sphene
		804, 11400,		-- Spinel
		1670, 4440,		-- Spirit Orichalcum Ingot
		2359, 1740,		-- Star Sapphire
		803, 7362,		-- Sunstone
		783, 27000,		-- Tenebrite
		3320, 135,		-- Thunder Gem
		3301, 600,		-- Thunder Geode
		1766, 1557,		-- Tiger Eye
		3523, 900,		-- Titanite
		789, 11400,		-- Topaz
		806, 633,		-- Tourmaline
		773, 600,		-- Translucent Rock
		1588, 5946,		-- Slab of Tufa
		798, 3672,		-- Turquoise
		2137, 984,		-- Vision Amethyst Stone
		1835, 3825,		-- Ingot of Vivified Mythril
		1879, 3156,		-- Vivio Platinum Ingot
		1304, 11961,	-- Water Bead
		1260, 11118,	-- Chunk of Water Ore
		776, 600,		-- White Rock
		1301, 4290,		-- Wind Bead
		1257, 11118,	-- Chunk of Wind Ore
		2831, 9142,		-- Yellow Brass Chain
		771, 600,		-- Yellow Rock
		642, 75,		-- Chunk of Zinc Ore
		805, 7200,		-- Zircon
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Fatimah : Welcome to Caldera's Goldsmithing shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.GOLDSMITHING)

    -- if csid == 302 and option == 1 then
        -- if player:getGil() >= Cost then
            -- player:delGil(Cost)
            -- player:delStatusEffectsByFlag(tpz.effectFlag.SYNTH_SUPPORT, true)
            -- player:addStatusEffect(tpz.effect.GOLDSMITHING_IMAGERY, 3, 0, 480)
            -- player:messageSpecial(ID.text.GOLDSMITHING_SUPPORT, 0, 3, 0)
        -- else
            -- player:messageSpecial(ID.text.NOT_HAVE_ENOUGH_GIL)
        -- end
    -- end
end