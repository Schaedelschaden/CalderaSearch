---------------------------------------------
-- Ability: Ecliptic Growl (Player Ability)
-- Enhances attributes of party members within area of effect.
-- Obtained: Summoner (Fenrir) Level 43
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Ecliptic Growl PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 834 -- mob_skill_id from mob_skills.sql

--	printf("Ecliptic Growl PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end