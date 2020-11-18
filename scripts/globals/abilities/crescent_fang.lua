---------------------------------------------
-- Ability: Crescent Fang (Player Ability)
-- Paralyzes target. 
-- Obtained: Summoner (Fenrir) Level 10
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Crescent Fang PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 832 -- mob_skill_id from mob_skills.sql

--	printf("Crescent Fang PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end