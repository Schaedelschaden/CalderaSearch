---------------------------------------------
-- Ability: Avatar's Favor
-- Utilizes the avatar's power towards a beneficial status effect 
-- for party members within range but increases perpetuation cost. 
-- Obtained: Summoner Level 55
-- Duration: 2:00:00
-- Recast Time: 0:30
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------
local potency =
	{
		Carbuncle = {12, 14, 16, 18, 20, 21, 24, 26, 27, 28, 29},
		Fenrir = {15, 18, 21, 24, 27, 30, 33, 36, 38, 40, 42},
		Ifrit = {12, 15, 18, 21, 23, 23, 24, 24, 25, 25, 26},
		Titan = {57, 62, 67, 72, 77, 82, 87, 92, 97, 102, 107},
		Leviathan = {13, 17, 21, 25, 29, 33, 37, 41, 45, 47, 50},
		Garuda = {13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43},
		Shiva = {15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45},
		Ramuh = {12, 14, 16, 18, 19, 21, 21, 23, 23, 24, 24},
		Diabolos = {3, 4, 4, 5, 5, 5, 6, 7, 7, 8, 8},
		CaitSith = {10, 12, 14, 16, 18, 20, 22, 24, 26, 27, 28},
		Siren = {7, 9, 11, 13, 15, 17, 19, 20, 21, 22, 23}
	}


function onAbilityCheck(player, target, ability)	
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local smnSkill = player:getSkillLevel(tpz.skill.SUMMONING_MAGIC)
	local perpetuation = player:getMod(tpz.mod.AVATAR_PERPETUATION) + 2
	local tier = 1
	
	if (smnSkill >= 317 and smnSkill <= 381) then
		tier = 2
	elseif (smnSkill >= 382 and smnSkill <= 446) then
		tier = 3
	elseif (smnSkill >= 447 and smnSkill <= 511) then
		tier = 4
	elseif (smnSkill >= 512 and smnSkill <= 574) then
		tier = 5
	elseif (smnSkill >= 575 and smnSkill <= 669) then
		tier = 6
	elseif (smnSkill >= 670) then
		tier = 7
	end
	
	tier = tier + player:getMod(tpz.mod.ENHANCES_AVATARS_FAVOR)
	
	tier = utils.clamp(tier, 1, 11)
	
	if (player:getPetID() == 8) then -- Carbuncle
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.CARBUNCLE_S_FAVOR, potency.Carbuncle[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 9) then -- Fenrir
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.FENRIR_S_FAVOR, potency.Fenrir[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 10) then -- Ifrit
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.IFRIT_S_FAVOR, potency.Ifrit[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 11) then -- Titan
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.TITAN_S_FAVOR, potency.Titan[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 12) then -- Leviathan
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.LEVIATHAN_S_FAVOR, potency.Leviathan[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 13) then -- Garuda
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.GARUDA_S_FAVOR, potency.Garuda[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 14) then -- Shiva
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.SHIVA_S_FAVOR, potency.Shiva[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 15) then -- Ramuh
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.RAMUH_S_FAVOR, potency.Ramuh[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 16) then -- Diabolos
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.DIABOLOS_S_FAVOR, potency.Diabolos[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 20) then -- Cait Sith
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.CAIT_SITH_S_FAVOR, potency.CaitSith[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 76) then -- Siren
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.SIRENS_FAVOR, potency.Siren[tier], tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	end
	
	player:setMod(tpz.mod.AVATAR_PERPETUATION, perpetuation)
	player:setLocalVar("Favor_BP_Delay_Timer", 0)
end