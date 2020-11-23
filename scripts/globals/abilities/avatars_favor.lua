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

function onAbilityCheck(player, target, ability)	
	printf("Avatar's Favor PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	printf("Avatar's Favor PLAYER onUseAbility\n")
	if (player:getPetID() == 8) then -- Carbuncle
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.CARBUNCLE_S_FAVOR, 12, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 9) then -- Fenrir
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.FENRIR_S_FAVOR, 13, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 10) then -- Ifrit
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.IFRIT_S_FAVOR, 12, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 11) then -- Titan
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.TITAN_S_FAVOR, 57, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 12) then -- Leviathan
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.LEVIATHAN_S_FAVOR, 12, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 13) then -- Garuda
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.GARUDA_S_FAVOR, 13, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 14) then -- Shiva
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.SHIVA_S_FAVOR, 15, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 15) then -- Ramuh
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.RAMUH_S_FAVOR, 12, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 16) then -- Diabolos
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.DIABOLOS_S_FAVOR, 3, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	elseif (player:getPetID() == 20) then -- Cait Sith
		pet:addStatusEffectEx(tpz.effect.AVATAR_S_FAVOR, tpz.effect.AVATAR_S_FAVOR, visibleAura, 3, 0, tpz.effect.CAIT_SITH_S_FAVOR, 10, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
	end
end