---------------------------------------------
-- Ability: Ecliptic Howl (Player Ability)
-- Enhances accuracy and evasion of party members within area of effect. 
-- Obtained: Summoner (Fenrir) Level 54
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Ecliptic Howl PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 837 -- mob_skill_id from mob_skills.sql

--	printf("Ecliptic Howl PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end