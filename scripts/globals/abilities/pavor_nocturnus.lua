---------------------------------------------
-- Ability: Pavor Nocturnus (Player Ability)
-- Lures an enemy into an eternal nightmare.
-- Obtained: Summoner (Diabolos) Level 98
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Pavor Nocturnus PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3989 -- mob_skill_id from mob_skills.sql

--	printf("Pavor Nocturnus PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end