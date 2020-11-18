---------------------------------------------
-- Ability: Mountain Buster (Player Ability)
-- Binds target.
-- Obtained: Summoner (Titan) Level 70
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Mountain Buster PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 855 -- mob_skill_id from mob_skills.sql

--	printf("Mountain Buster PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end