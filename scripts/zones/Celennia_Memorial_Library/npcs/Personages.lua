-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Personages
-- !pos -103 -2 -106 51
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local job = player:getMainJob()
	local level = player:getMainLvl()
	
	if (job == tpz.job.WAR and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12511, 1)
		player:addItem(12638, 1)
		player:addItem(13961, 1)
		player:addItem(14214, 1)
		player:addItem(14089, 1)
		player:PrintToPlayer(string.format("Obtained the Fighter's Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.MNK and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12512, 1)
		player:addItem(12639, 1)
		player:addItem(13962, 1)
		player:addItem(14215, 1)
		player:addItem(14090, 1)
		player:PrintToPlayer(string.format("Obtained the Temple Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.WHM and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(13855, 1)
		player:addItem(12640, 1)
		player:addItem(13963, 1)
		player:addItem(14216, 1)
		player:addItem(14091, 1)
		player:PrintToPlayer(string.format("Obtained the Healer's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.BLM and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(13856, 1)
		player:addItem(12641, 1)
		player:addItem(13964, 1)
		player:addItem(14217, 1)
		player:addItem(14092, 1)
		player:PrintToPlayer(string.format("Obtained the Wizard's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.RDM and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12513, 1)
		player:addItem(12642, 1)
		player:addItem(13965, 1)
		player:addItem(14218, 1)
		player:addItem(14093, 1)
		player:PrintToPlayer(string.format("Obtained the Warlock's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.THF and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12514, 1)
		player:addItem(12643, 1)
		player:addItem(13966, 1)
		player:addItem(14219, 1)
		player:addItem(14094, 1)
		player:PrintToPlayer(string.format("Obtained the Rogue's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.PLD and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12515, 1)
		player:addItem(12644, 1)
		player:addItem(13967, 1)
		player:addItem(14220, 1)
		player:addItem(14095, 1)
		player:PrintToPlayer(string.format("Obtained the Gallant Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.DRK and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(14516, 1)
		player:addItem(12645, 1)
		player:addItem(13968, 1)
		player:addItem(14221, 1)
		player:addItem(14096, 1)
		player:PrintToPlayer(string.format("Obtained the Chaos Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.BST and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12517, 1)
		player:addItem(12646, 1)
		player:addItem(13969, 1)
		player:addItem(14222, 1)
		player:addItem(14097, 1)
		player:PrintToPlayer(string.format("Obtained the Beast Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.BRD and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(13857, 1)
		player:addItem(12647, 1)
		player:addItem(13970, 1)
		player:addItem(14223, 1)
		player:addItem(14098, 1)
		player:PrintToPlayer(string.format("Obtained the Choral Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.RNG and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12518, 1)
		player:addItem(12648, 1)
		player:addItem(13971, 1)
		player:addItem(14224, 1)
		player:addItem(14099, 1)
		player:PrintToPlayer(string.format("Obtained the Hunter's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.SAM and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(13868, 1)
		player:addItem(13781, 1)
		player:addItem(13972, 1)
		player:addItem(14225, 1)
		player:addItem(14100, 1)
		player:PrintToPlayer(string.format("Obtained the Myochin Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.NIN and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(13869, 1)
		player:addItem(13782, 1)
		player:addItem(13973, 1)
		player:addItem(14226, 1)
		player:addItem(14101, 1)
		player:PrintToPlayer(string.format("Obtained the Ninja Garb Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.DRG and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12519, 1)
		player:addItem(12649, 1)
		player:addItem(13974, 1)
		player:addItem(14227, 1)
		player:addItem(14102, 1)
		player:PrintToPlayer(string.format("Obtained the Drachen Armor Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.SMN and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(12520, 1)
		player:addItem(12650, 1)
		player:addItem(14960, 1)
		player:addItem(14228, 1)
		player:addItem(14103, 1)
		player:PrintToPlayer(string.format("Obtained the Evoker's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.BLU and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(15265, 1)
		player:addItem(14521, 1)
		player:addItem(14928, 1)
		player:addItem(15600, 1)
		player:addItem(15684, 1)
		player:PrintToPlayer(string.format("Obtained the Magus Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.COR and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(15266, 1)
		player:addItem(14522, 1)
		player:addItem(14929, 1)
		player:addItem(15601, 1)
		player:addItem(15685, 1)
		player:PrintToPlayer(string.format("Obtained the Corsair's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.PUP and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(15267, 1)
		player:addItem(14523, 1)
		player:addItem(14930, 1)
		player:addItem(15602, 1)
		player:addItem(15686, 1)
		player:PrintToPlayer(string.format("Obtained the Puppetry Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.DNC and level > 51 and player:getFreeSlotsCount() >= 5) then
		if (player:getRace() == tpz.race.HUME_M or player:getRace() == tpz.race.ELVAAN_M or player:getRace() == tpz.race.TARU_M or player:getRace() == tpz.race.GALKA) then
			player:addItem(16138, 1)
			player:addItem(14578, 1)
			player:addItem(15002, 1)
			player:addItem(15659, 1)
			player:addItem(15746, 1)
			player:PrintToPlayer(string.format("Obtained the Male Dancer's Attire Set!"),tpz.msg.channel.SYSTEM_3)
		else
			player:addItem(16139, 1)
			player:addItem(14579, 1)
			player:addItem(15003, 1)
			player:addItem(15660, 1)
			player:addItem(15747, 1)
			player:PrintToPlayer(string.format("Obtained the Female Dancer's Attire Set!"),tpz.msg.channel.SYSTEM_3)
		end
	elseif (job == tpz.job.SCH and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(16140, 1)
		player:addItem(14580, 1)
		player:addItem(15004, 1)
		player:addItem(16311, 1)
		player:addItem(15748, 1)
		player:PrintToPlayer(string.format("Obtained the Scholar's Attire Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.GEO and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(16143, 1, 1, 9, 131, 2) -- +10 MP/+3 MACC/+3 MAB
		player:addItem(14583, 1, 9, 9, 131, 4) -- +10 HP/+5 MACC/+5 MAB
		player:addItem(15007, 1, 23, 4, 301, 9) -- +5 ACC/+10 Handbell Skill
		player:addItem(16314, 1, 112, 2, 300, 9) -- -3% Pet DT/+10 Geomancy Skill
		player:addItem(15751, 1, 110, 1, 292, 9) -- +2 Pet Regen/+10 Elemental Magic Skill
		player:PrintToPlayer(string.format("Obtained the GEO augmented Cobra Unit Set!"),tpz.msg.channel.SYSTEM_3)
	elseif (job == tpz.job.RUN and level > 51 and player:getFreeSlotsCount() >= 5) then
		player:addItem(16143, 1, 513, 1, 23, 4) -- +2 DEX/+5 ACC
		player:addItem(14583, 1, 514, 2, 17, 9) -- +3 VIT/+10 HP/+10 MP
		player:addItem(15007, 1, 512, 1, 25, 9) -- +2 STR/+10 ATK
		player:addItem(16314, 1, 31, 4, 39, 4) -- +5 EVA/+5 Enmity
		player:addItem(15751, 1, 37, 4, 134, 2) -- +5 MEVA/+3 MDEF
		player:PrintToPlayer(string.format("Obtained the RUN augmented Cobra Unit Set!"),tpz.msg.channel.SYSTEM_3)
	else
		player:PrintToPlayer(string.format("Please clear inventory slots and try again!"),tpz.msg.channel.SYSTEM_3)
	end
end

function onEventUpdate(player,csid,option)
	
end;

function onEventFinish(player,csid,option)
	
end;