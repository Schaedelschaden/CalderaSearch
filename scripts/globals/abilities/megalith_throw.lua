---------------------------------------------
-- Ability: Megalith Throw (Player Ability)
-- Delivers a ranged attack that slows target.
-- Obtained: Summoner (Titan) Level 35
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Megalith Throw PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 852 -- mob_skill_id from mob_skills.sql

--	printf("Megalith Throw PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end