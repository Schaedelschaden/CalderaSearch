---------------------------------------------
-- Ability: Claw (Player Ability)
-- Deals physical damage.
-- Obtained: Summoner (Garuda) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Claw PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 867 -- mob_skill_id from mob_skills.sql

--	printf("Claw PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end