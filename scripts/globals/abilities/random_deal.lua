-----------------------------------
-- Ability: Random Deal
-- Has the possibility of resetting the recast time of a random ability for party members within area of effect.
-- Obtained: Corsair Level 50
-- Recast Time: 20:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(caster, target, ability, action)
	local WARAbilities = {1, 2, 3, 4, 5, 6, 7, 8, 9, 11} -- {15, 16, 17, 18, 19, 133, 134, 210, 236, 251} 
	local MNKAbilities = {13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 31} -- {20, 21, 22, 23, 24, 66, 135, 136, 211, 237, 253}
	local WHMAbilities = {26, 27, 28, 29, 30, 32, 33} -- {58, 137, 138, 229, 230, 254, 255}
	local BLMAbilities = {12, 34, 35, 38, 39} -- {59, 238, 256, 257, 372}
	local RDMAbilities = {36, 37, 49, 50} -- {67, 231, 258, 259}
	local THFAbilities = {40, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 240} -- {25, 26, 27, 28, 29, 60, 68, 139, 140, 212, 220, 260, 305}
	local PLDAbilities = {41, 42, 73, 74, 75, 76, 77, 78, 79, 80, 378} -- {30, 31, 32, 63, 76, 141, 142, 239, 261, 262, 378}
	local DRKAbilities = {43, 44, 85, 86, 87, 88, 89, 90, 91, 373} -- {33, 34, 35, 61, 143, 144, 240, 263, 264, 373}
	local BSTAbilities = {45, 46, 94, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107} -- {36, 37, 38, 53, 54, 55, 56, 57, 62, 69, 145, 146, 209, 235, 265, 266, 371}
	local BRDAbilities = {47, 48, 109, 110, 112} -- {147, 148, 213, 267, 268}
	local RNGAbilities = {51, 52, 121, 122, 123, 124, 125, 126, 127, 128, 129} -- {40, 41, 42, 43, 44, 70, 149, 150, 208, 241, 269, 270}
	local SAMAbilities = {53, 54, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141} -- {46, 47, 48, 151, 152, 157, 158, 214, 242, 271, 272, 304}
	local NINAbilities = {57, 145, 146, 147, 148} -- {155, 232, 233, 243, 275}
	local DRGAbilities = {58, 157, 158, 159, 160, 162, 163, 164, 165, 166, 167} -- {45, 49, 50, 51, 52, 64, 71, 153, 154, 244, 276, 277, 279, 302, 303}
	local SMNAbilities = {71, 108, 173, 174, 175} -- {72, 73, 74, 75, 156, 216, 234, 280}
	local BLUAbilities = {81, 181, 182, 183, 184, 185} -- {78, 79, 159, 160, 281, 282}
	local CORAbilities = {84, 96, 193, 195, 197, 198} -- {81, 108, 161, 162, 285, 376}
	local PUPAbilities = {114, 115, 205, 206, 211, 212, 213, 214} -- {119, 120, 121, 122, 123, 124, 163, 164, 250, 293, 294, 306}
	local DNCAbilities = {216, 217, 218, 219, 220, 221, 222, 223, 224, 226, 229, 236} -- {166, 167, 182, 183, 184, 197, 221, 222, 223, 245, 247, 368}
	local SCHAbilities = {228, 230, 231, 232, 235, 237} -- {195, 196, 198, 199, 200, 201, 202, 203, 204, 205, 206, 217, 218, 219, 224, 225, 226, 227, 228, 249, 300, 301}
	local GEOAbilities = {93, 243, 245, 247, 249, 250, 251, 252} -- {329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 370}
	local RUNAbilities = {23, 24, 25, 59, 72, 116, 117, 118, 119, 120, 241, 242} -- {341, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 363, 364, 367}

	local merit = caster:getMerit(tpz.merit.LOADED_DECK)
	local pickRandomA = 0
	local pickRandomB = 0
	local randomAbilityA = 0
	local randomAbilityB = 0
	local MainJob = target:getMainJob()
	
	if (merit == 0) then
		if (MainJob == tpz.job.WAR) then
			pickRandomA = math.random(1,10)
			randomAbilityA = WARAbilities[pickRandomA]
		elseif (MainJob == tpz.job.MNK) then
			pickRandomA = math.random(1,11)
			randomAbilityA = MNKAbilities[pickRandomA]
		elseif (MainJob == tpz.job.WHM) then
			pickRandomA = math.random(1,7)
			randomAbilityA = WHMAbilities[pickRandomA]
		elseif (MainJob == tpz.job.BLM) then
			pickRandomA = math.random(1,5)
			randomAbilityA = BLMAbilities[pickRandomA]
		elseif (MainJob == tpz.job.RDM) then
			pickRandomA = math.random(1,4)
			randomAbilityA = RDMAbilities[pickRandomA]
		elseif (MainJob == tpz.job.THF) then
			pickRandomA = math.random(1,12)
			randomAbilityA = THFAbilities[pickRandomA]
		elseif (MainJob == tpz.job.PLD) then
			pickRandomA = math.random(1,11)
			randomAbilityA = PLDAbilities[pickRandomA]
		elseif (MainJob == tpz.job.DRK) then
			pickRandomA = math.random(1,10)
			randomAbilityA = DRKAbilities[pickRandomA]
		elseif (MainJob == tpz.job.BST) then
			pickRandomA = math.random(1,14)
			randomAbilityA = BSTAbilities[pickRandomA]
		elseif (MainJob == tpz.job.BRD) then
			pickRandomA = math.random(1,5)
			randomAbilityA = BRDAbilities[pickRandomA]
		elseif (MainJob == tpz.job.RNG) then
			pickRandomA = math.random(1,11)
			randomAbilityA = RNGAbilities[pickRandomA]
		elseif (MainJob == tpz.job.SAM) then
			pickRandomA = math.random(1,12)
			randomAbilityA = SAMAbilities[pickRandomA]
		elseif (MainJob == tpz.job.NIN) then
			pickRandomA = math.random(1,5)
			randomAbilityA = WARAbilities[pickRandomA]
		elseif (MainJob == tpz.job.DRG) then
			pickRandomA = math.random(1,11)
			randomAbilityA = RNGAbilities[pickRandomA]
		elseif (MainJob == tpz.job.SMN) then
			pickRandomA = math.random(1,5)
			randomAbilityA = SMNAbilities[pickRandomA]
		elseif (MainJob == tpz.job.BLU) then
			pickRandomA = math.random(1,6)
			randomAbilityA = BLUAbilities[pickRandomA]
		elseif (MainJob == tpz.job.COR) then
			pickRandomA = math.random(1,6)
			randomAbilityA = CORAbilities[pickRandomA]
		elseif (MainJob == tpz.job.PUP) then
			pickRandomA = math.random(1,8)
			randomAbilityA = PUPAbilities[pickRandomA]
		elseif (MainJob == tpz.job.DNC) then
			pickRandomA = math.random(1,12)
			randomAbilityA = DNCAbilities[pickRandomA]
		elseif (MainJob == tpz.job.SCH) then
			pickRandomA = math.random(1,6)
			randomAbilityA = SCHAbilities[pickRandomA]
		elseif (MainJob == tpz.job.GEO) then
			pickRandomA = math.random(1,8)
			randomAbilityA = GEOAbilities[pickRandomA]
		elseif (MainJob == tpz.job.RUN) then
			pickRandomA = math.random(1,12)
			randomAbilityA = RUNAbilities[pickRandomA]
		end
		
		target:resetRecast(randomAbilityA)
--		printf("random_deal.lua onUseAbility RANDOM ABILITY: [%i] NO LOADED DECK MERITS\n", randomAbilityA)
	else
		if (MainJob == tpz.job.WAR) then
			pickRandomA = math.random(1,10)
			randomAbilityA = WARAbilities[pickRandomA]
			pickRandomB = math.random(1,10)
			randomAbilityB = WARAbilities[pickRandomB]
		elseif (MainJob == tpz.job.MNK) then
			pickRandomA = math.random(1,11)
			randomAbilityA = MNKAbilities[pickRandomA]
			pickRandomB = math.random(1,11)
			randomAbilityB = MNKAbilities[pickRandomB]
		elseif (MainJob == tpz.job.WHM) then
			pickRandomA = math.random(1,7)
			randomAbilityA = WHMAbilities[pickRandomA]
			pickRandomB = math.random(1,7)
			randomAbilityB = WHMAbilities[pickRandomB]
		elseif (MainJob == tpz.job.BLM) then
			pickRandomA = math.random(1,5)
			randomAbilityA = BLMAbilities[pickRandomA]
			pickRandomB = math.random(1,5)
			randomAbilityB = BLMAbilities[pickRandomB]
		elseif (MainJob == tpz.job.RDM) then
			pickRandomA = math.random(1,4)
			randomAbilityA = RDMAbilities[pickRandomA]
			pickRandomB = math.random(1,4)
			randomAbilityB = RDMAbilities[pickRandomB]
		elseif (MainJob == tpz.job.THF) then
			pickRandomA = math.random(1,12)
			randomAbilityA = THFAbilities[pickRandomA]
			pickRandomB = math.random(1,12)
			randomAbilityB = THFAbilities[pickRandomB]
		elseif (MainJob == tpz.job.PLD) then
			pickRandomA = math.random(1,11)
			randomAbilityA = PLDAbilities[pickRandomA]
			pickRandomB = math.random(1,11)
			randomAbilityB = PLDAbilities[pickRandomB]
		elseif (MainJob == tpz.job.DRK) then
			pickRandomA = math.random(1,10)
			randomAbilityA = DRKAbilities[pickRandomA]
			pickRandomB = math.random(1,10)
			randomAbilityB = DRKAbilities[pickRandomB]
		elseif (MainJob == tpz.job.BST) then
			pickRandomA = math.random(1,14)
			randomAbilityA = BSTAbilities[pickRandomA]
			pickRandomB = math.random(1,14)
			randomAbilityB = BSTAbilities[pickRandomB]
		elseif (MainJob == tpz.job.BRD) then
			pickRandomA = math.random(1,5)
			randomAbilityA = BRDAbilities[pickRandomA]
			pickRandomB = math.random(1,5)
			randomAbilityB = BRDAbilities[pickRandomB]
		elseif (MainJob == tpz.job.RNG) then
			pickRandomA = math.random(1,11)
			randomAbilityA = RNGAbilities[pickRandomA]
			pickRandomB = math.random(1,11)
			randomAbilityB = RNGAbilities[pickRandomB]
		elseif (MainJob == tpz.job.SAM) then
			pickRandomA = math.random(1,12)
			randomAbilityA = SAMAbilities[pickRandomA]
			pickRandomB = math.random(1,12)
			randomAbilityB = SAMAbilities[pickRandomB]
		elseif (MainJob == tpz.job.NIN) then
			pickRandomA = math.random(1,5)
			randomAbilityA = WARAbilities[pickRandomA]
			pickRandomB = math.random(1,5)
			randomAbilityB = WARAbilities[pickRandomB]
		elseif (MainJob == tpz.job.DRG) then
			pickRandomA = math.random(1,11)
			randomAbilityA = RNGAbilities[pickRandomA]
			pickRandomB = math.random(1,11)
			randomAbilityB = RNGAbilities[pickRandomB]
		elseif (MainJob == tpz.job.SMN) then
			pickRandomA = math.random(1,5)
			randomAbilityA = SMNAbilities[pickRandomA]
			pickRandomB = math.random(1,5)
			randomAbilityB = SMNAbilities[pickRandomB]
		elseif (MainJob == tpz.job.BLU) then
			pickRandomA = math.random(1,6)
			randomAbilityA = BLUAbilities[pickRandomA]
			pickRandomB = math.random(1,6)
			randomAbilityB = BLUAbilities[pickRandomB]
		elseif (MainJob == tpz.job.COR) then
			pickRandomA = math.random(1,6)
			randomAbilityA = CORAbilities[pickRandomA]
			pickRandomB = math.random(1,6)
			randomAbilityB = CORAbilities[pickRandomB]
		elseif (MainJob == tpz.job.PUP) then
			pickRandomA = math.random(1,8)
			randomAbilityA = PUPAbilities[pickRandomA]
			pickRandomB = math.random(1,8)
			randomAbilityB = PUPAbilities[pickRandomB]
		elseif (MainJob == tpz.job.DNC) then
			pickRandomA = math.random(1,12)
			randomAbilityA = DNCAbilities[pickRandomA]
			pickRandomB = math.random(1,12)
			randomAbilityB = DNCAbilities[pickRandomB]
		elseif (MainJob == tpz.job.SCH) then
			pickRandomA = math.random(1,6)
			randomAbilityA = SCHAbilities[pickRandomA]
			pickRandomB = math.random(1,6)
			randomAbilityB = SCHAbilities[pickRandomB]
		elseif (MainJob == tpz.job.GEO) then
			pickRandomA = math.random(1,8)
			randomAbilityA = GEOAbilities[pickRandomA]
			pickRandomB = math.random(1,8)
			randomAbilityB = GEOAbilities[pickRandomB]
		elseif (MainJob == tpz.job.RUN) then
			pickRandomA = math.random(1,12)
			randomAbilityA = RUNAbilities[pickRandomA]
			pickRandomB = math.random(1,12)
			randomAbilityB = RUNAbilities[pickRandomB]
		end
		
		target:resetRecast(randomAbilityA)
		target:resetRecast(randomAbilityB)
--		printf("random_deal.lua onUseAbility RANDOM ABILITY 1: [%i] RANDOM ABILITY 2: [%i]\n", randomAbilityA, randomAbilityB)
	end
	
    return 0
end