---------------------------------------------
-- Ability: Shock Squall (Player Ability)
-- Temporarily prevents all enemies within area of effect from acting.
-- Obtained: Summoner (Ramuh) Level 92
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Shock Squall PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3987 -- mob_skill_id from mob_skills.sql

--	printf("Shock Squall PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end