---------------------------------------------
-- Ability: Diamond Storm (Player Ability)
-- Reduces evasion for enemies within area of effect.
-- Obtained: Summoner (Shiva) Level 90
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Diamond Storm PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3985 -- mob_skill_id from mob_skills.sql

--	printf("Diamond Storm PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end