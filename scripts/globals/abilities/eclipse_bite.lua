---------------------------------------------
-- Ability: Eclipse Bite (Player Ability)
-- Delivers a threefold attack. 
-- Obtained: Summoner (Fenrir) Level 65
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Eclipse Bite PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 836 -- mob_skill_id from mob_skills.sql

--	printf("Eclipse Bite PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end