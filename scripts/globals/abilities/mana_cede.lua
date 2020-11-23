-----------------------------------
-- Ability: Mana Cede
-- Channels your MP into TP for avatars and elementals.  
-- Obtained: Summoner Level 87
-- Recast Time: 05:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasPet()) then
		return 0,0
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	end
end

function onUseAbility(player,target,ability)
	local mp = player:getMP()
	local pet = player:getPet()
	local petTP = pet:getTP() + 667
	local modifier = (1 + (player:getMod(tpz.mod.MANA_CEDE_STRENGTH) / 100))
	local newTP = petTP * modifier

	player:setMP(mp - 100)
	pet:setTP(newTP)
end