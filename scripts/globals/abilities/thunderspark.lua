---------------------------------------------
-- Ability: Thunderspark (Player Ability)
-- Deals lightning damage and paralyzes enemies within area of effect.
-- Obtained: Summoner (Ramuh) Level 19
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Thunderspark PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 888 -- mob_skill_id from mob_skills.sql

--	printf("Thunderspark PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end