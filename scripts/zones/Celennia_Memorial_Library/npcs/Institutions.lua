-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Institutions
-- !pos -94.6732 -2.1500 -99.3882 6 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/missions")
require("scripts/globals/besieged")
-----------------------------------

-- All white, black, blue spells and BRD songs
local ValidSpells =
{
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 33, 35, 36, 37,
    38, 39, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,
    72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104,
    105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130,
    131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156,
    157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182,
    183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208,
    209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234,
    235, 236, 237, 238, 239, 240, 241, 242, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 258, 259, 260,
    261, 262, 263, 264, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286,
    287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312,
    313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338,
    339, 340, 341, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355,
    367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390,
    391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416,
    418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, -- 417: Honor March
    443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468,
    469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494,
    495, 496, 497, 498, 499, 500, 501, 502, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 515, 517, 519, 521, 522, 524, 527,
    529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 547, 548, 549, 551, 554, 555, 557, 560, 561,
    563, 564, 565, 567, 569, 570, 572, 573, 574, 575, 576, 577, 578, 579, 581, 582, 584, 585, 587, 588, 589, 591, 592, 593, 594, 595,
    596, 597, 598, 599, 603, 604, 605, 606, 608, 610, 611, 612, 613, 614, 615, 616, 617, 618, 620, 621, 622, 623, 626, 628, 629, 631,
    632, 633, 634, 636, 637, 638, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659,
    660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685,
    686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711,
    712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 736, 737, 738, 739, 740, 741, 742, 743, 744,
    745, 746, 747, 748, 749, 750, 751, 752, 753, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788,
    789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814,
    815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840,
    841, 842, 843, 844, 845, 846, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, -- 847: Atomos
    867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892,
    893, 894, 895
}

-- Corsair Rolls
local ValidRolls = {
    98, -- Fighter's Roll
	99, -- Monk's Roll
	100, -- Healer's Roll
	101, -- Wizard's Roll
	102, -- Warlock's Roll
	103, -- Rogue's Roll
	104, -- Gallant's Roll
	105, -- Chaos Roll
	106, -- Beast Roll
	107, -- Choral Roll
	108, -- Hunter's Roll
	109, -- Samurai Roll
	110, -- Ninja Roll
	111, -- Drachen Roll
	112, -- Evoker's Roll
	113, -- Magus' Roll
	114, -- Corsair's Roll
	115, -- Puppet's Roll
	116, -- Dancer's Roll
	117, -- Scholar's Roll
	118, -- Bolter's Roll
	119, -- Caster's Roll
	120, -- Courser's Roll
	121, -- Blitzer's Roll
	122, -- Tactician's Roll
	302, -- Allies Roll
	303, -- Miser's Roll
	304, -- Companion's Roll
	305, -- Avenger's Roll
	390, -- Naturalist's Roll
	391, -- Runeist's Roll
}

-- Automaton Attachments
local ValidAttachments = {
	8193, 8194, 8195, 8196, 8197, 8198, 8224, 8225, 8226, 8227,
	8449, 8450, 8451, 8452, 8453, 8454, 8455, 8456, 8458,
	8462, 8481, 8482, 8483, 8484, 8485, 8486, 8487, 8488, 8489, 8490, 8491, 8493, 8497,
	8513, 8514, 8515, 8516, 8517, 8518, 8519, 8520,
	8523, 8524, 8526, 8528, 8545, 8546, 8547, 8548, 8549, 8550, 8551,
	8555, 8577, 8578, 8579, 8580, 8581, 8582, 8583, 8584, 8585,
	8587, 8609, 8610, 8611, 8612, 8613, 8614, 8615, 8616,
	8619, 8641, 8642, 8643, 8644, 8645, 8646, 8648, 8651,
	8673, 8674, 8675, 8676, 8677, 8678, 8680, 8682, 9138, 9143, 9230,
}

local ValidTrusts = {
	896, 898, 899, 900, 901, 902, 903, 904, 905, 908, 909, 910, 911, 913, 915, 917, 933,
	940, 951, 952, 955, 968, 980, 981, 1010, 1019, 918, 920, 941,
}

local function AddAllSpells(player)
    for i = 1, #ValidSpells do
        player:addSpell(ValidSpells[i], true, true) -- Spell ID, Silent, Save
    end
end

local function AddAllRolls(player)
    for i = 1, #ValidRolls do
        player:addLearnedAbility(ValidRolls[i], true, true) -- Ability ID, Silent, Save
    end
end

local function AddAllAttachments(player)
    for i = 1, #ValidAttachments do
        player:unlockAttachment(ValidAttachments[i])
    end
end

local function AddAllMounts(player)
	for i = tpz.ki.CHOCOBO_COMPANION, tpz.ki.CHOCOBO_COMPANION + 26 do
        player:addKeyItem(i)
    end
end

local function AddAllChairs(player)
	for i = tpz.ki.IMPERIAL_CHAIR, tpz.ki.LEAF_BENCH do
        player:addKeyItem(i)
    end
end

local function AddAllTrusts(player)
	for i = 1, #ValidTrusts do
		player:addSpell(ValidTrusts[i], true, true)
	end
end

local function SetZilart(player)
	local missionZM = {0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 23, 24, 26, 27, 28, 30}

	for i = 1, #missionZM do
--		player:completeMission(3, 0)
--		player:delMission(3, missionZM[i])
		player:completeMission(3, missionZM[i])
		player:addMission(3, missionZM[i] + 1)
	end
	
	player:addMission(3, 31) -- RoZ: Awakening
	player:addKeyItem(238) -- Sacrifical Chamber Key
	player:addKeyItem(247) -- Prismatic Fragment
	player:addKeyItem(452) -- Cerulean Crystal
end

local function SetCoP(player)
	local missionCoP = {101, 110, 118, 128, 138, 218, 228, 238, 248, 257, 258, 318, 325, 335, 341, 350, 358, 368, 418, 428, 438, 448,
	                    518, 530, 543, 552, 560, 568, 578, 618, 628, 638, 648, 718, 728, 738, 748, 758, 800, 818, 828, 840, 850}
						
	for i = 1, #missionCoP do
		player:addMission(3, missionCoP[i])
		player:completeMission(3, missionCoP[i])
	end

	player:addMission(6, 850) -- CoP: The Last Verse
	player:addKeyItem(708) -- Mysterious Amulet
	player:addKeyItem(591) -- Light of Dem
	player:addKeyItem(590) -- Light of Holla
	player:addKeyItem(592) -- Light of Mea
	player:addKeyItem(604) -- Pso'Xja Pass
	player:addKeyItem(593) -- Light of Vahzl
	player:addKeyItem(594) -- Light of Al'Taieu
	player:addItem(14657) -- Ducal Guard's Ring
	player:addItem(14672) -- Tavnazian Ring
end

local function setRunicPortals(player)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.AZOUPH)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.MAMOOL)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.HALVUNG)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.DVUCCA)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.ILRUSI)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.NYZUL)
end

function onTrigger(player, target)
	if (player:getCharVar("HasTriggeredInstitutions") == 0) then
		player:PrintToPlayer(string.format("Institutions : Please wait. This will take a moment."),tpz.msg.channel.NS_SAY)
		player:unlockJob(0)
		player:unlockJob(tpz.job.DRG)
		player:setPetName(tpz.pet.type.WYVERN, math.random(1,32))
		player:unlockJob(tpz.job.PUP)
		player:setPetName(tpz.pet.type.AUTOMATON, math.random(118, 149))
		player:capAllSkills()
		AddAllSpells(player)
		AddAllRolls(player)
		AddAllAttachments(player)
		AddAllMounts(player)
		AddAllChairs(player)
		AddAllTrusts(player)
		SetZilart(player)
		SetCoP(player)
        setRunicPortals(player)
        player:addKeyItem(tpz.ki.BOARDING_PERMIT)
		player:PrintToPlayer(string.format("Institutions : Capped all combat/magic skills. Added all spells/songs, COR rolls, and PUP starter attachments. Unlocked all mounts and chairs."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Institutions : DRG and PUP pet names have been randomized. Visit Fouvia (DRG) or Abda-Lurabda (PUP) to change them."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Institutions : All Rise of the Zilart and Chains of Promathia missions completed."),tpz.msg.channel.NS_SAY)
        player:PrintToPlayer(string.format("Institutions : All Treasures of Aht Urhgan Runic Portals unlocked."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Institutions : Please zone for all changes to display properly."),tpz.msg.channel.NS_SAY)
		player:setCharVar("HasTriggeredInstitutions", 1)
		player:setCharVar("HasTriggeredRoZCoP", 1)
	else
		-- if (player:getCharVar("HasTriggeredRoZCoP") == 0) then
			-- SetZilart(player)
			-- SetCoP(player)
			-- player:setCharVar("HasTriggeredRoZCoP", 1)
		-- end
--		AddAllAttachments(player)
		player:PrintToPlayer(string.format("Institutions : Looks like you've already had everything unlocked! Visit Fouvia (DRG) or Abda-Lurabda (PUP) to change your pet's name."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Institutions : You can trade me EXP rings to have them refilled in exchange for conquest points!"),tpz.msg.channel.NS_SAY)
	end
end

function onTrade(player, npc, trade)
	local ringID = {10796, 11666, 14671, 15761, 15762, 15763, 15793, 15840, 26164, 27556, 28528, 28562, 28568, 28569}
	local ringCPCost = {500, 450, 1500, 500, 750, 1500, 500, 1500, 1500, 1500, 600, 650, 1500, 1500}

	local itemToReplenish = 0
	local itemFound = false
	local currentCP = player:getCP()
	
	for i = 1, 14 do
		if (trade:hasItemQty(ringID[i], 1) and currentCP >= ringCPCost[i]) then
			player:tradeComplete()
			
			player:delCP(ringCPCost[i])
			player:addItem(ringID[i], 1)
			player:PrintToPlayer(string.format("You exchanged %i Conquest Points to recharge your ring.", ringCPCost[i]),tpz.msg.channel.SYSTEM_3)
			player:messageSpecial(ID.text.ITEM_OBTAINED, ringID[i])
		end
	end
end