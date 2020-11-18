---------------------------------------------
-- Ability: Ultimate Terror (Player Ability)
-- Decreases attributes of enemies within area of effect.
-- Obtained: Summoner (Diabolos) Level 37
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Ultimate Terror PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1906 -- mob_skill_id from mob_skills.sql

--	printf("Ultimate Terror PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end