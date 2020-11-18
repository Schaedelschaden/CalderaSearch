---------------------------------------------
-- Ability: Slowga (Player Ability)
-- Slows enemies within area of effect.
-- Obtained: Summoner (Leviathan) Level 33
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Slowga PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 862 -- mob_skill_id from mob_skills.sql

--	printf("Slowga PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end