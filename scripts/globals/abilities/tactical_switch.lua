-----------------------------------
-- Ability: Tactical Switch
-- Swaps TP of master and automaton.
-- Obtained: Puppetmaster Level 79
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onUseAbility(player, target, ability)
    local pet = player:getPet()
	local masterTP = player:getTP()
	local petTP = pet:getTP()
	local bonus = 1 + (player:getMod(tpz.mod.TACTICAL_SWITCH_BONUS) / 100)
	
	printf("tactical_switch.lua onUseAbility MASTER TP: [%i]  PET TP: [%i]  BONUS: [x%1.2f]", masterTP, petTP, bonus)
	
	player:setTP(petTP * bonus)
	pet:setTP(masterTP * bonus)
end