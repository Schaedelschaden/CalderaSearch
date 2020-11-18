---------------------------------------------
-- Ability: Spring Water (Player Ability)
-- Restores HP and removes status ailments for party members within area of effect.
-- Obtained: Summoner (Leviathan) Level 47
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Spring Water PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 861 -- mob_skill_id from mob_skills.sql

--	printf("Spring Water PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end