-----------------------------------
-- Ability: Wild Card
-- Has a random effect on all party members within area of effect.
-- Obtained: Corsair Level 1
-- Recast Time: 1:00:00
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
	local roll
	local CurrentMP = target:getMP()
	local MaxMP = target:getMaxMP()
	local CurrentTP = target:getTP()
	local casterName = caster:getName()
	local targetName = target:getName()
	
	if (targetName == casterName) then
        roll = math.random(1,6)
		caster:setLocalVar("corsairRollTotal", roll)
--		printf("wild_card.lua onUseAbility WILD CARD ROLL: [%i]\n", roll)
        action:speceffect(caster:getID(), roll)
    end
	
	local total = caster:getLocalVar("corsairRollTotal")
--	printf("wild_card.lua onUseAbility WILD CARD ROLL: [%i]\n", total)
	
	if (total == 1 or total == 2) then -- Resets all job abilities except SP abilities
		NormalReset(target)
	elseif (total == 3) then -- Resets all job abilities except SP abilities and grants 100 TP
		NormalReset(target)
		target:setTP(CurrentTP + 1000)
	elseif (total == 4) then -- Resets all job abilities except SP abilities and grants 300 TP
		NormalReset(target)
		target:setTP(3000)
	elseif (total == 5) then -- Resets all job abilities, level 1 SP abilities and restores 50% MP
		NormalReset(target)
		SPReset(target)
		target:setMP(CurrentMP + (MaxMP / 2))
	elseif (total == 6) then -- Resets all job abilities, all SP abilities and restores 100% MP
		target:resetRecasts()
		target:setMP(MaxMP)
	end
	
	
    ability:setMsg(435 + math.floor((total - 1) / 2) * 2)
    action:animation(target:getID(), 132 + (total) - 1)
	
	return 0
end

function NormalReset(target)
	local MainJob = target:getMainJob()
	local SubJob = target:getSubJob()
	local i = 1
	local TotalAbiltoReset

	-- local SPAbilities = {0, 254}
	local WARAbilities = {1, 2, 3, 4, 5, 6, 7, 8, 9, 11} -- 10 Abilities
	local MNKAbilities = {13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 31} -- 11 Abilities
	local WHMAbilities = {26, 27, 28, 29, 30, 32, 33} -- 7 Abilities
	local BLMAbilities = {12, 34, 35, 38, 39} -- 5 Abilities
	local RDMAbilities = {36, 37, 49, 50} -- 4 Abilities
	local THFAbilities = {40, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 240} -- 12 Abilities
	local PLDAbilities = {41, 42, 73, 74, 75, 76, 77, 78, 79, 80, 378} -- 11 Abilities
	local DRKAbilities = {43, 44, 85, 86, 87, 88, 89, 90, 91, 373} -- 10 Abilities
	local BSTAbilities = {45, 46, 94, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107} -- 14 Abilities
	local BRDAbilities = {47, 48, 109, 110, 112} -- 5 Abilities
	local RNGAbilities = {51, 52, 121, 122, 123, 124, 125, 126, 127, 128, 129} -- 11 Abilities
	local SAMAbilities = {53, 54, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141} -- 12 Abilities
	local NINAbilities = {57, 145, 146, 147, 148} -- 5 Abilities
	local DRGAbilities = {58, 157, 158, 159, 160, 162, 163, 164, 165, 166, 167} -- 11 Abilities
	local SMNAbilities = {71, 108, 173, 174, 175} -- 5 Abilities
	local BLUAbilities = {81, 181, 182, 183, 184, 185} -- 6 Abilities
	local CORAbilities = {84, 96, 193, 195, 196, 197, 198} -- 7 Abilities
	local PUPAbilities = {114, 115, 205, 206, 211, 212, 213, 214} -- 8 Abilities
	local DNCAbilities = {216, 217, 218, 219, 220, 221, 222, 223, 224, 226, 229, 236} -- 12 Abilities
	local SCHAbilities = {228, 230, 231, 232, 235, 237} -- 6 Abilities
	local GEOAbilities = {93, 243, 245, 247, 249, 250, 251, 252} -- 8 Abilities
	local RUNAbilities = {23, 24, 25, 59, 72, 116, 117, 118, 119, 120, 241, 242} -- 12 Abilities
	
	if (MainJob == tpz.job.WAR or SubJob == tpz.job.WAR) then
		TotalAbiltoReset = 10
		while (i <= TotalAbiltoReset) do
			target:resetRecast(WARAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.MNK or SubJob == tpz.job.MNK) then
		TotalAbiltoReset = 11
		while (i <= TotalAbiltoReset) do
			target:resetRecast(MNKAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.WHM or SubJob == tpz.job.WHM) then
		TotalAbiltoReset = 7
		while (i <= TotalAbiltoReset) do
			target:resetRecast(WHMAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.BLM or SubJob == tpz.job.BLM) then
		TotalAbiltoReset = 5
		while (i <= TotalAbiltoReset) do
			target:resetRecast(BLMAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.RDM or SubJob == tpz.job.RDM) then
		TotalAbiltoReset = 4
		while (i <= TotalAbiltoReset) do
			target:resetRecast(RDMAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.THF or SubJob == tpz.job.THF) then
		TotalAbiltoReset = 12
		while (i <= TotalAbiltoReset) do
			target:resetRecast(THFAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.PLD or SubJob == tpz.job.PLD) then
		TotalAbiltoReset = 11
		while (i <= TotalAbiltoReset) do
			target:resetRecast(PLDAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.DRK or SubJob == tpz.job.DRK) then
		TotalAbiltoReset = 10
		while (i <= TotalAbiltoReset) do
			target:resetRecast(DRKAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.BST or SubJob == tpz.job.BST) then
		TotalAbiltoReset = 14
		while (i <= TotalAbiltoReset) do
			target:resetRecast(BSTAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.BRD or SubJob == tpz.job.BRD) then
		TotalAbiltoReset = 5
		while (i <= TotalAbiltoReset) do
			target:resetRecast(BRDAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.RNG or SubJob == tpz.job.RNG) then
		TotalAbiltoReset = 11
		while (i <= TotalAbiltoReset) do
			target:resetRecast(RNGAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.SAM or SubJob == tpz.job.SAM) then
		TotalAbiltoReset = 12
		while (i <= TotalAbiltoReset) do
			target:resetRecast(SAMAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.NIN or SubJob == tpz.job.NIN) then
		TotalAbiltoReset = 5
		while (i <= TotalAbiltoReset) do
			target:resetRecast(NINAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.DRG or SubJob == tpz.job.DRG) then
		TotalAbiltoReset = 11
		while (i <= TotalAbiltoReset) do
			target:resetRecast(DRGAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.SMN or SubJob == tpz.job.SMN) then
		TotalAbiltoReset = 5
		while (i <= TotalAbiltoReset) do
			target:resetRecast(SMNAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.BLU or SubJob == tpz.job.BLU) then
		TotalAbiltoReset = 6
		while (i <= TotalAbiltoReset) do
			target:resetRecast(BLUAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.COR or SubJob == tpz.job.COR) then
		TotalAbiltoReset = 7
		while (i <= TotalAbiltoReset) do
			target:resetRecast(CORAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.PUP or SubJob == tpz.job.PUP) then
		TotalAbiltoReset = 8
		while (i <= TotalAbiltoReset) do
			target:resetRecast(PUPAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.DNC or SubJob == tpz.job.DNC) then
		TotalAbiltoReset = 12
		while (i <= TotalAbiltoReset) do
			target:resetRecast(DNCAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.SCH or SubJob == tpz.job.SCH) then
		TotalAbiltoReset = 6
		while (i <= TotalAbiltoReset) do
			target:resetRecast(SCHAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.GEO or SubJob == tpz.job.GEO) then
		TotalAbiltoReset = 8
		while (i <= TotalAbiltoReset) do
			target:resetRecast(GEOAbilities[i])
			i = i + 1
		end
	end
	if (MainJob == tpz.job.RUN or SubJob == tpz.job.RUN) then
		TotalAbiltoReset = 12
		while (i <= TotalAbiltoReset) do
			target:resetRecast(RUNAbilities[i])
			i = i + 1
		end
	end
end

function SPReset(target)
	target:resetRecast(0)
end