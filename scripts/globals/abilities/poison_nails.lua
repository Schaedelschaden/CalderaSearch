---------------------------------------------
-- Ability: Poison Nails (Player Ability)
-- Poisons target.  
-- Obtained: Summoner (Carbuncle) Level 5
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Poison Nails PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 907 -- mob_skill_id from mob_skills.sql

--	printf("Poison Nails PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end